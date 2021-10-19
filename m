Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33662C9D
	for <linux-staging@lists.linux.dev>; Tue, 19 Oct 2021 17:12:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6746661360;
	Tue, 19 Oct 2021 17:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634663569;
	bh=svQ0ahSZqsMI0cKh8fG9fO7eJge4gE0eA3I1ktkVzI4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fqZsZ6/8mcOjxvCx6cfvZIidEbeo/KcVfXKYUTlxpu2QdrRnM6IqMzX5lA3RSx3/P
	 Gs0RBqZFUfshSoDeEx39eLFPFS4tY4oWG0zcLqBpstMS2wfMVJgG4Ys6pQ62F2NGbu
	 1KBcHCRI4GwwjLt+rrlt3mv6s9P1P9YdWyhe1yYUxeFwlFkksXiTlAbTUYUM64nNFp
	 pIqcQOuS/5hSY7QDNpLEeRgOOpTX6D/oyeojhZyO6IW/0a1ILHDMldguOF0nv99IT+
	 cpZbd1rzMsX/ozVaLymEXQVOs5kpowFTgoPOgjrAsrQ+BcUfDh2zR6GxQTANQJk339
	 VB2vNGx9fo6Cg==
From: Jakub Kicinski <kuba@kernel.org>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH 2/8] staging: use eth_hw_addr_set() instead of ether_addr_copy()
Date: Tue, 19 Oct 2021 10:12:37 -0700
Message-Id: <20211019171243.1412240-3-kuba@kernel.org>
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

Convert staging from ether_addr_copy() to eth_hw_addr_set():

  @@
  expression dev, np;
  @@
  - ether_addr_copy(dev->dev_addr, np)
  + eth_hw_addr_set(dev, np)

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 drivers/staging/ks7010/ks_hostif.c             | 2 +-
 drivers/staging/ks7010/ks_wlan_net.c           | 2 +-
 drivers/staging/most/net/net.c                 | 2 +-
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 2 +-
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c   | 2 +-
 drivers/staging/rtl8192u/r8192U_core.c         | 2 +-
 drivers/staging/rtl8712/os_intfs.c             | 2 +-
 drivers/staging/rtl8712/usb_intf.c             | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/ks7010/ks_hostif.c b/drivers/staging/ks7010/ks_hostif.c
index eaa70893224a..1c63d595313d 100644
--- a/drivers/staging/ks7010/ks_hostif.c
+++ b/drivers/staging/ks7010/ks_hostif.c
@@ -541,7 +541,7 @@ void hostif_mib_get_confirm(struct ks_wlan_private *priv)
 		hostif_sme_enqueue(priv, SME_GET_MAC_ADDRESS);
 		ether_addr_copy(priv->eth_addr, priv->rxp);
 		priv->mac_address_valid = true;
-		ether_addr_copy(dev->dev_addr, priv->eth_addr);
+		eth_hw_addr_set(dev, priv->eth_addr);
 		netdev_info(dev, "MAC ADDRESS = %pM\n", priv->eth_addr);
 		break;
 	case DOT11_PRODUCT_VERSION:
diff --git a/drivers/staging/ks7010/ks_wlan_net.c b/drivers/staging/ks7010/ks_wlan_net.c
index 631ad769c3d5..61d8f40e2739 100644
--- a/drivers/staging/ks7010/ks_wlan_net.c
+++ b/drivers/staging/ks7010/ks_wlan_net.c
@@ -2625,7 +2625,7 @@ int ks_wlan_net_start(struct net_device *dev)
 
 	/* dummy address set */
 	ether_addr_copy(priv->eth_addr, dummy_addr);
-	ether_addr_copy(dev->dev_addr, priv->eth_addr);
+	eth_hw_addr_set(dev, priv->eth_addr);
 
 	/* The ks_wlan-specific entries in the device structure. */
 	dev->netdev_ops = &ks_wlan_netdev_ops;
diff --git a/drivers/staging/most/net/net.c b/drivers/staging/most/net/net.c
index a5fd14246046..47039f0d262f 100644
--- a/drivers/staging/most/net/net.c
+++ b/drivers/staging/most/net/net.c
@@ -564,7 +564,7 @@ static void on_netinfo(struct most_interface *iface,
 	if (m && is_valid_ether_addr(m)) {
 		if (!is_valid_ether_addr(dev->dev_addr)) {
 			netdev_info(dev, "set mac %pM\n", m);
-			ether_addr_copy(dev->dev_addr, m);
+			eth_hw_addr_set(dev, m);
 			netif_dormant_off(dev);
 		} else if (!ether_addr_equal(dev->dev_addr, m)) {
 			netdev_warn(dev, "reject mac %pM\n", m);
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index 358b629d2cc6..cfeaa9c1542f 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -366,7 +366,7 @@ static void _rtl92e_read_eeprom_info(struct net_device *dev)
 			*(u16 *)(&dev->dev_addr[i]) = usValue;
 		}
 	} else {
-		ether_addr_copy(dev->dev_addr, bMac_Tmp_Addr);
+		eth_hw_addr_set(dev, bMac_Tmp_Addr);
 	}
 
 	RT_TRACE(COMP_INIT, "Permanent Address = %pM\n",
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index a7dd1578b2c6..d2e9df60e9ba 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -2235,7 +2235,7 @@ static int _rtl92e_set_mac_adr(struct net_device *dev, void *mac)
 
 	mutex_lock(&priv->wx_mutex);
 
-	ether_addr_copy(dev->dev_addr, addr->sa_data);
+	eth_hw_addr_set(dev, addr->sa_data);
 
 	schedule_work(&priv->reset_wq);
 	mutex_unlock(&priv->wx_mutex);
diff --git a/drivers/staging/rtl8192u/r8192U_core.c b/drivers/staging/rtl8192u/r8192U_core.c
index 2aaba44d84e2..3718d72e217e 100644
--- a/drivers/staging/rtl8192u/r8192U_core.c
+++ b/drivers/staging/rtl8192u/r8192U_core.c
@@ -3454,7 +3454,7 @@ static int r8192_set_mac_adr(struct net_device *dev, void *mac)
 
 	mutex_lock(&priv->wx_mutex);
 
-	ether_addr_copy(dev->dev_addr, addr->sa_data);
+	eth_hw_addr_set(dev, addr->sa_data);
 
 	schedule_work(&priv->reset_wq);
 	mutex_unlock(&priv->wx_mutex);
diff --git a/drivers/staging/rtl8712/os_intfs.c b/drivers/staging/rtl8712/os_intfs.c
index 2d3233a650fc..beb9137c198c 100644
--- a/drivers/staging/rtl8712/os_intfs.c
+++ b/drivers/staging/rtl8712/os_intfs.c
@@ -166,7 +166,7 @@ static int r871x_net_set_mac_address(struct net_device *pnetdev, void *p)
 	struct sockaddr *addr = p;
 
 	if (!padapter->bup)
-		ether_addr_copy(pnetdev->dev_addr, addr->sa_data);
+		eth_hw_addr_set(pnetdev, addr->sa_data);
 	return 0;
 }
 
diff --git a/drivers/staging/rtl8712/usb_intf.c b/drivers/staging/rtl8712/usb_intf.c
index 505ebeb643dc..17e705411e64 100644
--- a/drivers/staging/rtl8712/usb_intf.c
+++ b/drivers/staging/rtl8712/usb_intf.c
@@ -563,7 +563,7 @@ static int r871xu_drv_init(struct usb_interface *pusb_intf,
 			dev_info(&udev->dev,
 				"r8712u: MAC Address from efuse = %pM\n", mac);
 		}
-		ether_addr_copy(pnetdev->dev_addr, mac);
+		eth_hw_addr_set(pnetdev, mac);
 	}
 	/* step 6. Load the firmware asynchronously */
 	if (rtl871x_load_fw(padapter))
-- 
2.31.1

