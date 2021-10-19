Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21842CA1
	for <linux-staging@lists.linux.dev>; Tue, 19 Oct 2021 17:12:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5DAB761378;
	Tue, 19 Oct 2021 17:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634663570;
	bh=0+te0fqcS14pIHrSHrCjOiG6pfgmadj4HLQOIifX2sc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SCLi0dp3rIbUrUPTHyPiWLD+gViHTKQODCVPcAQ0ifT4X9w1quRG6GsvgyVGcGV9A
	 M8nhfyH81xdw1+do2OYDv7lM/KkitYGDtmIJ1cbp/RTCpqjmwDsrzAycHVrdypdTv2
	 kdtwjHu7PXjY9uYppek9PRBLXAy5GqtJrbZnTHZwiVBDrPiYxWSdjeW/MqpHONFNwO
	 /B1s8VQS3QKqIrcf2/hIa+gbBFa4dCX6wRM/njzdTRFKuKCyZRCqOAj2d1GG+EPe+X
	 4EKPM5buduUiGmjebj0KG0MrPEnZLlJW+Zy2hQTEe49uBYd+KMJxvLiDkEXkHf91+K
	 h2bvQQkgZ0NFw==
From: Jakub Kicinski <kuba@kernel.org>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Jakub Kicinski <kuba@kernel.org>,
	david.kershner@unisys.com,
	chensong_2000@189.cn,
	sparmaintainer@unisys.com
Subject: [PATCH 6/8] staging: unisys: use eth_hw_addr_set()
Date: Tue, 19 Oct 2021 10:12:41 -0700
Message-Id: <20211019171243.1412240-7-kuba@kernel.org>
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
CC: david.kershner@unisys.com
CC: gregkh@linuxfoundation.org
CC: chensong_2000@189.cn
CC: sparmaintainer@unisys.com
CC: linux-staging@lists.linux.dev
---
 drivers/staging/unisys/visornic/visornic_main.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/unisys/visornic/visornic_main.c b/drivers/staging/unisys/visornic/visornic_main.c
index a3bc568c660d..62cd9b783732 100644
--- a/drivers/staging/unisys/visornic/visornic_main.c
+++ b/drivers/staging/unisys/visornic/visornic_main.c
@@ -1782,6 +1782,7 @@ static int visornic_probe(struct visor_device *dev)
 	struct net_device *netdev = NULL;
 	int err;
 	int channel_offset = 0;
+	u8 addr[ETH_ALEN];
 	u64 features;
 
 	netdev = alloc_etherdev(sizeof(struct visornic_devdata));
@@ -1798,14 +1799,14 @@ static int visornic_probe(struct visor_device *dev)
 	/* Get MAC address from channel and read it into the device. */
 	netdev->addr_len = ETH_ALEN;
 	channel_offset = offsetof(struct visor_io_channel, vnic.macaddr);
-	err = visorbus_read_channel(dev, channel_offset, netdev->dev_addr,
-				    ETH_ALEN);
+	err = visorbus_read_channel(dev, channel_offset, addr, ETH_ALEN);
 	if (err < 0) {
 		dev_err(&dev->device,
 			"%s failed to get mac addr from chan (%d)\n",
 			__func__, err);
 		goto cleanup_netdev;
 	}
+	eth_hw_addr_set(netdev, addr);
 
 	devdata = devdata_initialize(netdev_priv(netdev), dev);
 	if (!devdata) {
-- 
2.31.1

