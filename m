Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A682CA3
	for <linux-staging@lists.linux.dev>; Tue, 19 Oct 2021 17:12:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1E4CD6137D;
	Tue, 19 Oct 2021 17:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634663571;
	bh=+GTC29ApK+ehxKsAuprc+eYKdF9ttj1v8j7OZP7Vh7E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FcVyoWO4OxodeDMq3coh1Pshrf27Mil4e7EtZeNuuznW4iXVVRZzK2100lwKE0noh
	 bupq2sqKNEeJA6/aNgW3bUd3vpZc1me6EWcYuvSsnFb1OdqcroG9Ci88rnfn5Ip+QD
	 QdNaDRrmjmGANmfQvOpc/NK622yeQef8vNAAcnTtSfU/B8GDGN925xsLKckaV+CgiH
	 ItRg+Lvc9mFtRV0ZndI7uCmiIFVUmtHlei0LTdZ6ENUpR4+R1rfH7HHCWXqmpsT75k
	 FYhyOnfCuBvCRfdOiox6Y+TIEU3d40eUpdA29TIPw5Jc3m025HAtQ6Ca2XaIznsJhc
	 X314Elm+QrAzg==
From: Jakub Kicinski <kuba@kernel.org>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Jakub Kicinski <kuba@kernel.org>,
	keescook@chromium.org
Subject: [PATCH 8/8] staging: use eth_hw_addr_set() in orphan drivers
Date: Tue, 19 Oct 2021 10:12:43 -0700
Message-Id: <20211019171243.1412240-9-kuba@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211019171243.1412240-1-kuba@kernel.org>
References: <20211019171243.1412240-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 406f42fa0d3c ("net-next: When a bond have a massive amount
of VLANs...") introduced a rbtree for faster Ethernet address look
up. To maintain netdev->dev_addr in this tree we need to make all
the writes to it got through appropriate helpers.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
CC: gregkh@linuxfoundation.org
CC: keescook@chromium.org
CC: linux-staging@lists.linux.dev
---
 drivers/staging/gdm724x/gdm_lte.c   | 4 +++-
 drivers/staging/octeon/ethernet.c   | 2 +-
 drivers/staging/wlan-ng/prism2sta.c | 4 +++-
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/gdm724x/gdm_lte.c b/drivers/staging/gdm724x/gdm_lte.c
index e390c924ec1c..493ed4821515 100644
--- a/drivers/staging/gdm724x/gdm_lte.c
+++ b/drivers/staging/gdm724x/gdm_lte.c
@@ -867,6 +867,7 @@ int register_lte_device(struct phy_dev *phy_dev,
 	struct nic *nic;
 	struct net_device *net;
 	char pdn_dev_name[16];
+	u8 addr[ETH_ALEN];
 	int ret = 0;
 	u8 index;
 
@@ -893,11 +894,12 @@ int register_lte_device(struct phy_dev *phy_dev,
 		nic->phy_dev = phy_dev;
 		nic->nic_id = index;
 
-		form_mac_address(net->dev_addr,
+		form_mac_address(addr,
 				 nic->src_mac_addr,
 				 nic->dest_mac_addr,
 				 mac_address,
 				 index);
+		eth_hw_addr_set(net, addr);
 
 		SET_NETDEV_DEV(net, dev);
 		SET_NETDEV_DEVTYPE(net, &wwan_type);
diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
index 5d24c1b6663b..bf8c5443a218 100644
--- a/drivers/staging/octeon/ethernet.c
+++ b/drivers/staging/octeon/ethernet.c
@@ -350,7 +350,7 @@ static int cvm_oct_set_mac_filter(struct net_device *dev)
 	    (cvmx_helper_interface_get_mode(interface) !=
 		CVMX_HELPER_INTERFACE_MODE_SPI)) {
 		int i;
-		u8 *ptr = dev->dev_addr;
+		const u8 *ptr = dev->dev_addr;
 		u64 mac = 0;
 		int index = INDEX(priv->port);
 
diff --git a/drivers/staging/wlan-ng/prism2sta.c b/drivers/staging/wlan-ng/prism2sta.c
index 1be43300052f..daa7cc4e897c 100644
--- a/drivers/staging/wlan-ng/prism2sta.c
+++ b/drivers/staging/wlan-ng/prism2sta.c
@@ -585,6 +585,7 @@ static int prism2sta_getcardinfo(struct wlandevice *wlandev)
 	struct hfa384x *hw = wlandev->priv;
 	u16 temp;
 	u8 snum[HFA384x_RID_NICSERIALNUMBER_LEN];
+	u8 addr[ETH_ALEN];
 
 	/* Collect version and compatibility info */
 	/*  Some are critical, some are not */
@@ -855,11 +856,12 @@ static int prism2sta_getcardinfo(struct wlandevice *wlandev)
 
 	/* Collect the MAC address */
 	result = hfa384x_drvr_getconfig(hw, HFA384x_RID_CNFOWNMACADDR,
-					wlandev->netdev->dev_addr, ETH_ALEN);
+					addr, ETH_ALEN);
 	if (result != 0) {
 		netdev_err(wlandev->netdev, "Failed to retrieve mac address\n");
 		goto failed;
 	}
+	eth_hw_addr_set(wlandev->netdev, addr);
 
 	/* short preamble is always implemented */
 	wlandev->nsdcaps |= P80211_NSDCAP_SHORT_PREAMBLE;
-- 
2.31.1

