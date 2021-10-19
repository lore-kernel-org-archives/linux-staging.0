Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D302C9A
	for <linux-staging@lists.linux.dev>; Tue, 19 Oct 2021 17:12:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 330136113B;
	Tue, 19 Oct 2021 17:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634663569;
	bh=Ch6/iBq/rdzRmzn9+l90ZVKs+VJb9e27qTCt1wrY7BY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LrgkiCHGG+hRTfhKi2M1TSFiRHkdfTRZZr+/fvYCU447UldZhk9mm6XipWsDSyvMC
	 //P/irgujiMTssgkvPdbgO19sX8lk7N3ByyZU0HAKIH/BTxipoW9SDVCamVysM5MPI
	 A2yDPbSTQItoO0zWD/0kKtFhVakf1F64Ng8IR41ePiev/yUYbqGvFmcgJ5wVwQk55z
	 edmORrTd5dhMf7Rs+UmLj6Y6WLGn0z2XdMgYi8amWznr6NhNmr7PMkuk7A/oKMbsb0
	 ggjw5Pg5T0FvoGXqkAYjFMY/Y+jYIKCfbfVGpNfUgh62tDTZITU6UDBw+kEgKfga2K
	 9Z4sM+QQ407PA==
From: Jakub Kicinski <kuba@kernel.org>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH 1/8] staging: use eth_hw_addr_set()
Date: Tue, 19 Oct 2021 10:12:36 -0700
Message-Id: <20211019171243.1412240-2-kuba@kernel.org>
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

Convert staging drivers from memcpy(... ETH_ADDR) to eth_hw_addr_set():

  @@
  expression dev, np;
  @@
  - memcpy(dev->dev_addr, np, ETH_ALEN)
  + eth_hw_addr_set(dev, np)
  @@
  - memcpy(dev->dev_addr, np, 6)
  + eth_hw_addr_set(dev, np)

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 drivers/staging/r8188eu/os_dep/osdep_service.c   | 2 +-
 drivers/staging/r8188eu/os_dep/usb_intf.c        | 2 +-
 drivers/staging/rtl8192u/r8192U_core.c           | 2 +-
 drivers/staging/rtl8712/os_intfs.c               | 4 ++--
 drivers/staging/rtl8723bs/os_dep/os_intfs.c      | 2 +-
 drivers/staging/rtl8723bs/os_dep/osdep_service.c | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/osdep_service.c b/drivers/staging/r8188eu/os_dep/osdep_service.c
index d7d03c1417fd..6bee194fc35d 100644
--- a/drivers/staging/r8188eu/os_dep/osdep_service.c
+++ b/drivers/staging/r8188eu/os_dep/osdep_service.c
@@ -175,7 +175,7 @@ int rtw_change_ifname(struct adapter *padapter, const char *ifname)
 
 	rtw_init_netdev_name(pnetdev, ifname);
 
-	memcpy(pnetdev->dev_addr, padapter->eeprompriv.mac_addr, ETH_ALEN);
+	eth_hw_addr_set(pnetdev, padapter->eeprompriv.mac_addr);
 
 	if (!rtnl_is_locked())
 		ret = register_netdev(pnetdev);
diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
index 4b8a3e821b74..40f2481afc6f 100644
--- a/drivers/staging/r8188eu/os_dep/usb_intf.c
+++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
@@ -406,7 +406,7 @@ static struct adapter *rtw_usb_if1_init(struct dvobj_priv *dvobj,
 	rtw_macaddr_cfg(padapter->eeprompriv.mac_addr);
 	rtw_init_wifidirect_addrs(padapter, padapter->eeprompriv.mac_addr,
 				  padapter->eeprompriv.mac_addr);
-	memcpy(pnetdev->dev_addr, padapter->eeprompriv.mac_addr, ETH_ALEN);
+	eth_hw_addr_set(pnetdev, padapter->eeprompriv.mac_addr);
 	DBG_88E("MAC Address from pnetdev->dev_addr =  %pM\n",
 		pnetdev->dev_addr);
 
diff --git a/drivers/staging/rtl8192u/r8192U_core.c b/drivers/staging/rtl8192u/r8192U_core.c
index 594239990455..2aaba44d84e2 100644
--- a/drivers/staging/rtl8192u/r8192U_core.c
+++ b/drivers/staging/rtl8192u/r8192U_core.c
@@ -2307,7 +2307,7 @@ static int rtl8192_read_eeprom_info(struct net_device *dev)
 			*(u16 *)(&dev->dev_addr[i]) = (u16)ret;
 		}
 	} else {
-		memcpy(dev->dev_addr, bMac_Tmp_Addr, 6);
+		eth_hw_addr_set(dev, bMac_Tmp_Addr);
 		/* should I set IDR0 here? */
 	}
 	RT_TRACE(COMP_EPROM, "MAC addr:%pM\n", dev->dev_addr);
diff --git a/drivers/staging/rtl8712/os_intfs.c b/drivers/staging/rtl8712/os_intfs.c
index 9502f6aa5306..2d3233a650fc 100644
--- a/drivers/staging/rtl8712/os_intfs.c
+++ b/drivers/staging/rtl8712/os_intfs.c
@@ -381,8 +381,8 @@ static int netdev_open(struct net_device *pnetdev)
 			goto netdev_open_error;
 		if (!r8712_initmac) {
 			/* Use the mac address stored in the Efuse */
-			memcpy(pnetdev->dev_addr,
-			       padapter->eeprompriv.mac_addr, ETH_ALEN);
+			eth_hw_addr_set(pnetdev,
+					padapter->eeprompriv.mac_addr);
 		} else {
 			/* We have to inform f/w to use user-supplied MAC
 			 * address.
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index 1b8b76f14740..719e75ee3fb2 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -789,7 +789,7 @@ static int _rtw_drv_register_netdev(struct adapter *padapter, char *name)
 	if (rtw_init_netdev_name(pnetdev, name))
 		return _FAIL;
 
-	memcpy(pnetdev->dev_addr, padapter->eeprompriv.mac_addr, ETH_ALEN);
+	eth_hw_addr_set(pnetdev, padapter->eeprompriv.mac_addr);
 
 	/* Tell the network stack we exist */
 	if (register_netdev(pnetdev) != 0) {
diff --git a/drivers/staging/rtl8723bs/os_dep/osdep_service.c b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
index d6bddf7b08e8..4fbfa75c05d7 100644
--- a/drivers/staging/rtl8723bs/os_dep/osdep_service.c
+++ b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
@@ -142,7 +142,7 @@ int rtw_change_ifname(struct adapter *padapter, const char *ifname)
 
 	rtw_init_netdev_name(pnetdev, ifname);
 
-	memcpy(pnetdev->dev_addr, padapter->eeprompriv.mac_addr, ETH_ALEN);
+	eth_hw_addr_set(pnetdev, padapter->eeprompriv.mac_addr);
 
 	if (!rtnl_is_locked())
 		ret = register_netdev(pnetdev);
-- 
2.31.1

