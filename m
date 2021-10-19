Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A832C9A
	for <linux-staging@lists.linux.dev>; Tue, 19 Oct 2021 17:12:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A33116137C;
	Tue, 19 Oct 2021 17:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634663571;
	bh=rFTDGS0t3qykZ52pVf5B6teR6anayPTflMm8aSH6qjo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i3mXQ3MfQwlB0lPQoWvuXDsDUkNPFl4GrNCLZerCxdGnAs4MLi70AL7VO/lq4JRXE
	 3CiE+Oct4aTPOMxf8rcCszomPfasESGC85ChFvJLwNmEoEdqfwO0ExS7ZK4OWaMKer
	 WdjqhOnW43I9asifrybF0ZV6lDkaAMWVzXbbcZVypc/cu/XuEtXHzkSTWnHc8GKQlE
	 /bJRJi92QjpVDN37ASZhZQ4o8OlHvBiXLVk29ZWRq6vHv/soFwki6QgJIis0SusDvV
	 9Y3kIBfnbwWiZr8vZnyQWVkta0iyuTBsn0VIyY17kbEp1xTdqcD258Q3rCIk53cbp2
	 n1ylAMMhtrYzg==
From: Jakub Kicinski <kuba@kernel.org>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Jakub Kicinski <kuba@kernel.org>,
	knv418@gmail.com,
	jiapeng.chong@linux.alibaba.com,
	ojaswin98@gmail.com,
	arnd@arndb.de,
	lee.jones@linaro.org,
	clrrm@isep.ipp.pt,
	fabioaiuto83@gmail.com,
	hdegoede@redhat.com,
	ross.schm.dev@gmail.com,
	insafonov@gmail.com
Subject: [PATCH 7/8] staging: rtl: use eth_hw_addr_set()
Date: Tue, 19 Oct 2021 10:12:42 -0700
Message-Id: <20211019171243.1412240-8-kuba@kernel.org>
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
CC: knv418@gmail.com
CC: jiapeng.chong@linux.alibaba.com
CC: ojaswin98@gmail.com
CC: arnd@arndb.de
CC: lee.jones@linaro.org
CC: clrrm@isep.ipp.pt
CC: fabioaiuto83@gmail.com
CC: hdegoede@redhat.com
CC: ross.schm.dev@gmail.com
CC: insafonov@gmail.com
CC: linux-staging@lists.linux.dev
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c |  5 ++++-
 drivers/staging/rtl8192e/rtl8192e/rtl_cam.c    |  4 ++--
 drivers/staging/rtl8192u/r8192U.h              |  3 ++-
 drivers/staging/rtl8192u/r8192U_core.c         | 11 +++++++----
 drivers/staging/rtl8723bs/os_dep/os_intfs.c    |  2 +-
 5 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index cfeaa9c1542f..7f9dee42a04d 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -360,11 +360,14 @@ static void _rtl92e_read_eeprom_info(struct net_device *dev)
 		 priv->eeprom_CustomerID);
 
 	if (!priv->AutoloadFailFlag) {
+		u8 addr[ETH_ALEN];
+
 		for (i = 0; i < 6; i += 2) {
 			usValue = rtl92e_eeprom_read(dev,
 				 (EEPROM_NODE_ADDRESS_BYTE_0 + i) >> 1);
-			*(u16 *)(&dev->dev_addr[i]) = usValue;
+			*(u16 *)(&addr[i]) = usValue;
 		}
+		eth_hw_addr_set(dev, addr);
 	} else {
 		eth_hw_addr_set(dev, bMac_Tmp_Addr);
 	}
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_cam.c b/drivers/staging/rtl8192e/rtl8192e/rtl_cam.c
index f75a12543781..d7630f02a910 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_cam.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_cam.c
@@ -184,7 +184,7 @@ void rtl92e_cam_restore(struct net_device *dev)
 		if (priv->rtllib->iw_mode == IW_MODE_ADHOC) {
 			rtl92e_set_key(dev, 4, 0,
 				       priv->rtllib->pairwise_key_type,
-				       (u8 *)dev->dev_addr, 0,
+				       (const u8 *)dev->dev_addr, 0,
 				       (u32 *)(&priv->rtllib->swcamtable[4].key_buf[0]));
 		} else {
 			rtl92e_set_key(dev, 4, 0,
@@ -197,7 +197,7 @@ void rtl92e_cam_restore(struct net_device *dev)
 		if (priv->rtllib->iw_mode == IW_MODE_ADHOC) {
 			rtl92e_set_key(dev, 4, 0,
 				       priv->rtllib->pairwise_key_type,
-				       (u8 *)dev->dev_addr, 0,
+				       (const u8 *)dev->dev_addr, 0,
 				       (u32 *)(&priv->rtllib->swcamtable[4].key_buf[0]));
 		} else {
 			rtl92e_set_key(dev, 4, 0,
diff --git a/drivers/staging/rtl8192u/r8192U.h b/drivers/staging/rtl8192u/r8192U.h
index 4013107cd93a..14ca00a2789b 100644
--- a/drivers/staging/rtl8192u/r8192U.h
+++ b/drivers/staging/rtl8192u/r8192U.h
@@ -1114,6 +1114,7 @@ void rtl8192_set_rxconf(struct net_device *dev);
 void rtl819xusb_beacon_tx(struct net_device *dev, u16 tx_rate);
 
 void EnableHWSecurityConfig8192(struct net_device *dev);
-void setKey(struct net_device *dev, u8 EntryNo, u8 KeyIndex, u16 KeyType, u8 *MacAddr, u8 DefaultKey, u32 *KeyContent);
+void setKey(struct net_device *dev, u8 EntryNo, u8 KeyIndex, u16 KeyType,
+	    const u8 *MacAddr, u8 DefaultKey, u32 *KeyContent);
 
 #endif
diff --git a/drivers/staging/rtl8192u/r8192U_core.c b/drivers/staging/rtl8192u/r8192U_core.c
index 3718d72e217e..cfbd9d79baa7 100644
--- a/drivers/staging/rtl8192u/r8192U_core.c
+++ b/drivers/staging/rtl8192u/r8192U_core.c
@@ -2300,12 +2300,15 @@ static int rtl8192_read_eeprom_info(struct net_device *dev)
 	/* set channelplan from eeprom */
 	priv->ChannelPlan = priv->eeprom_ChannelPlan;
 	if (bLoad_From_EEPOM) {
+		u8 addr[ETH_ALEN];
+
 		for (i = 0; i < 6; i += 2) {
 			ret = eprom_read(dev, (u16)((EEPROM_NODE_ADDRESS_BYTE_0 + i) >> 1));
 			if (ret < 0)
 				return ret;
-			*(u16 *)(&dev->dev_addr[i]) = (u16)ret;
+			*(u16 *)(&addr[i]) = (u16)ret;
 		}
+		eth_hw_addr_set(dev, addr);
 	} else {
 		eth_hw_addr_set(dev, bMac_Tmp_Addr);
 		/* should I set IDR0 here? */
@@ -3045,14 +3048,14 @@ static void CamRestoreAllEntry(struct net_device *dev)
 	} else if (priv->ieee80211->pairwise_key_type == KEY_TYPE_TKIP) {
 		if (priv->ieee80211->iw_mode == IW_MODE_ADHOC)
 			setKey(dev, 4, 0, priv->ieee80211->pairwise_key_type,
-			       (u8 *)dev->dev_addr, 0, NULL);
+			       (const u8 *)dev->dev_addr, 0, NULL);
 		else
 			setKey(dev, 4, 0, priv->ieee80211->pairwise_key_type,
 			       MacAddr, 0, NULL);
 	} else if (priv->ieee80211->pairwise_key_type == KEY_TYPE_CCMP) {
 		if (priv->ieee80211->iw_mode == IW_MODE_ADHOC)
 			setKey(dev, 4, 0, priv->ieee80211->pairwise_key_type,
-			       (u8 *)dev->dev_addr, 0, NULL);
+			       (const u8 *)dev->dev_addr, 0, NULL);
 		else
 			setKey(dev, 4, 0, priv->ieee80211->pairwise_key_type,
 			       MacAddr, 0, NULL);
@@ -4868,7 +4871,7 @@ void EnableHWSecurityConfig8192(struct net_device *dev)
 }
 
 void setKey(struct net_device *dev, u8 entryno, u8 keyindex, u16 keytype,
-	    u8 *macaddr, u8 defaultkey, u32 *keycontent)
+	    const u8 *macaddr, u8 defaultkey, u32 *keycontent)
 {
 	u32 target_command = 0;
 	u32 target_content = 0;
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index 719e75ee3fb2..05482341eefe 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -283,7 +283,7 @@ static int rtw_net_set_mac_address(struct net_device *pnetdev, void *p)
 	if (!padapter->bup) {
 		/* addr->sa_data[4], addr->sa_data[5]); */
 		memcpy(padapter->eeprompriv.mac_addr, addr->sa_data, ETH_ALEN);
-		/* memcpy(pnetdev->dev_addr, addr->sa_data, ETH_ALEN); */
+		/* eth_hw_addr_set(pnetdev, addr->sa_data); */
 		/* padapter->bset_hwaddr = true; */
 	}
 
-- 
2.31.1

