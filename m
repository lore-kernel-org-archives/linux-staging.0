Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC9570
	for <linux-staging@lists.linux.dev>; Mon,  3 May 2021 17:04:13 +0000 (UTC)
Received: by mail-il1-f175.google.com with SMTP id y10so4217972ilv.0
        for <linux-staging@lists.linux.dev>; Mon, 03 May 2021 10:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+eo6QdRoPesngA/MZ+gXOEnQsKTBQ3dMqLwPvxASEvo=;
        b=BXlSBoji2TpaoP9UNmTdgn3XRGQ+JSGAazmaiVQ0+TBqP/8uD9uGsYGTDS+UBaOLfM
         hHws9sBcxQd73U5eLEDu1T9UPIEKppnYeXlMq6WoE3tQ8064H7N4+ZbhYoEZmnpKPMis
         aH/n5mh7ZJfz88B9xzoT5STgHsXFQWEzZYr7wtnKZqhDhj72qJMcXJ+olOlBP9PntMHI
         5r2lD0oF0LTiWOcgk5v64gjyaibLsH5Dfj7Qp/8+QKYiel75YZxsP8a6FpvOX2wtg/T+
         kolsd/2a6wltoVqaifjmnfz5jHwy0fLjXa39JlmcqkRuCuB9eBlS5OrlzWP2NZS6SG35
         h7Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+eo6QdRoPesngA/MZ+gXOEnQsKTBQ3dMqLwPvxASEvo=;
        b=R6zT8MJEkXLs7JOOACqpnzRuBvnaSs3gxYg7Tl6r5WECwyNqZWo1AZegWvsRoyCxFA
         6x4YVZnKfIQqKMVvnKhmvIp9vjQkFyhGP5OiUTNcRgDpjd1MzKG456EyDRsHbSFFeZUr
         AjQqEip+TnMXlUOmRcZtOFcT9BP4dKuYIzf/xyxuqN3IyENjAn+gguzqZA6a2k0vYC66
         IlClkFR4yRnAcyGIRM44Q9mj0h+1hbAt9R8+u0EUoH1n7NwIPe/uLsfM5PBf4Ddw1Tkh
         B9TMf079jJGz2wt9MUERmSxYLHXzDV12/eMTJvjkBE+ZGmB51PHKH6pkj5734N5R+tR3
         w4UQ==
X-Gm-Message-State: AOAM530+7ysPv9d73ux3m4SA9w1bjxOGV0KSBF1bLZhQs8LLkXKspLbR
	aigyeSQjMnPjcI1/Q+Esb58=
X-Google-Smtp-Source: ABdhPJyeRnv2riTcAoKKBltQAw7vYL3SXnVxFrl2uYcE45MydoyNYDrauWF3LJ6CvQVwBC6nChWQAg==
X-Received: by 2002:a05:6e02:1062:: with SMTP id q2mr17120962ilj.194.1620061452537;
        Mon, 03 May 2021 10:04:12 -0700 (PDT)
Received: from kali.hsd1.co.comcast.net ([2601:280:4e00:1520:7905:cb40:b93:117a])
        by smtp.gmail.com with ESMTPSA id t7sm5770357ile.87.2021.05.03.10.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 10:04:11 -0700 (PDT)
From: Jordan Vaughn <jordanvaughn1@gmail.com>
X-Google-Original-From: Jordan Vaughn <jordvaughn1@gmail.com>
To: gregkh@linuxfoundation.org,
	ganesanr@broadcom.com
Cc: linux-staging@lists.linux.dev,
	Jordan Vaughn <jordvaughn1@gmail.com>,
	jchandra@broadcom.com
Subject: [PATCH] netlogic: This patch formats existing comments to Linux standards found in TODO.
Date: Mon,  3 May 2021 17:03:53 +0000
Message-Id: <20210503170353.66415-1-jordvaughn1@gmail.com>
X-Mailer: git-send-email 2.30.2
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Netlogic: xlr_net: Fix styling problems with comments 

Signed-off-by: Jordan Vaughn <jordvaughn1@gmail.com>
---
 drivers/staging/netlogic/xlr_net.c | 67 +++++++++++++++---------------
 drivers/staging/netlogic/xlr_net.h |  3 +-
 2 files changed, 36 insertions(+), 34 deletions(-)

diff --git a/drivers/staging/netlogic/xlr_net.c b/drivers/staging/netlogic/xlr_net.c
index 69ea61faf8fa..c1539b6b75b8 100644
--- a/drivers/staging/netlogic/xlr_net.c
+++ b/drivers/staging/netlogic/xlr_net.c
@@ -15,20 +15,19 @@
 #include <linux/jiffies.h>
 #include <linux/interrupt.h>
 #include <linux/platform_device.h>
-
 #include <asm/mipsregs.h>
-/*
+
+/**
  * fmn.h - For FMN credit configuration and registering fmn_handler.
  * FMN is communication mechanism that allows processing agents within
  * XLR/XLS to communicate each other.
  */
 #include <asm/netlogic/xlr/fmn.h>
-
 #include "platform_net.h"
 #include "xlr_net.h"
 
-/*
- * The readl/writel implementation byteswaps on XLR/XLS, so
+/**
+ * xlr_nae_wreg() - The readl/writel implementation byteswaps on XLR/XLS, so
  * we need to use __raw_ IO to read the NAE registers
  * because they are in the big-endian MMIO area on the SoC.
  */
@@ -140,8 +139,8 @@ static struct phy_device *xlr_get_phydev(struct xlr_net_priv *priv)
 	return mdiobus_get_phy(priv->mii_bus, priv->phy_addr);
 }
 
-/*
- * Ethtool operation
+/**
+ * xlr_get_link_ksettings() - Ethtool operation
  */
 static int xlr_get_link_ksettings(struct net_device *ndev,
 				  struct ethtool_link_ksettings *ecmd)
@@ -173,8 +172,8 @@ static const struct ethtool_ops xlr_ethtool_ops = {
 	.set_link_ksettings = xlr_set_link_ksettings,
 };
 
-/*
- * Net operations
+/**
+ * xlr_net_fill_rx_ring() -  Net operations
  */
 static int xlr_net_fill_rx_ring(struct net_device *ndev)
 {
@@ -372,10 +371,10 @@ static const struct net_device_ops xlr_netdev_ops = {
 	.ndo_get_stats64 = xlr_stats,
 };
 
-/*
- * Gmac init
+/**
+ * xlr_config_spill() -  Gmac init
  */
-static void *xlr_config_spill(struct xlr_net_priv *priv, int reg_start_0,
+static void xlr_config_spill(struct xlr_net_priv *priv, int reg_start_0,
 			      int reg_start_1, int reg_size, int size)
 {
 	void *spill;
@@ -400,8 +399,8 @@ static void *xlr_config_spill(struct xlr_net_priv *priv, int reg_start_0,
 	return spill;
 }
 
-/*
- * Configure the 6 FIFO's that are used by the network accelarator to
+/**
+ * xlr_config_fifo_spill_area() - Configure the 6 FIFO's that are used by the network accelarator to
  * communicate with the rest of the XLx device. 4 of the FIFO's are for
  * packets from NA --> cpu (called Class FIFO's) and 2 are for feeding
  * the NA with free descriptors.
@@ -440,8 +439,8 @@ static void xlr_config_fifo_spill_area(struct xlr_net_priv *priv)
 					       MAX_CLASS_3_SPILL * sizeof(u64));
 }
 
-/*
- * Configure PDE to Round-Robin distribution of packets to the
+/**
+ * xlr_config_pde() -  Configures PDE to Round-Robin distribution of packets to the
  * available cpu
  */
 static void xlr_config_pde(struct xlr_net_priv *priv)
@@ -470,8 +469,8 @@ static void xlr_config_pde(struct xlr_net_priv *priv)
 		     ((bkt_map >> 32) & 0xffffffff));
 }
 
-/*
- * Setup the Message ring credits, bucket size and other
+/**
+ * xlr_config_common() - Setup the Message ring credits, bucket size and other
  * common configuration
  */
 static int xlr_config_common(struct xlr_net_priv *priv)
@@ -544,7 +543,7 @@ static void xlr_config_translate_table(struct xlr_net_priv *priv)
 	for (i = 0; i < 64; i++) {
 		/*
 		 * On use_bkt set the b0, b1 are used, else
-		 * the 4 classes are used, here implemented
+		 * the 4 classes are used, implemented here with
 		 * a logic to distribute the packets to the
 		 * buckets equally or based on the class
 		 */
@@ -575,8 +574,10 @@ static void xlr_config_parser(struct xlr_net_priv *priv)
 	xlr_nae_wreg(priv->base_addr, R_PARSERCONFIGREG,
 		     ((0x7f << 8) | (1 << 1)));
 
-	/* configure the parser : L2 Type is configured in the bootloader */
-	/* extract IP: src, dest protocol */
+	/*
+	 * configure the parser : L2 Type is configured in the bootloader
+	 * extract IP: src, dest protocol
+	 */
 	xlr_nae_wreg(priv->base_addr, R_L3CTABLE,
 		     (9 << 20) | (1 << 19) | (1 << 18) | (0x01 << 16) |
 		     (0x0800 << 0));
@@ -599,7 +600,7 @@ static int xlr_phy_write(u32 *base_addr, int phy_addr, int regnum, u16 val)
 	unsigned long timeout, stoptime, checktime;
 	int timedout;
 
-	/* 100ms timeout*/
+
 	timeout = msecs_to_jiffies(100);
 	stoptime = jiffies + timeout;
 	timedout = 0;
@@ -629,7 +630,7 @@ static int xlr_phy_read(u32 *base_addr, int phy_addr, int regnum)
 	unsigned long timeout, stoptime, checktime;
 	int timedout;
 
-	/* 100ms timeout*/
+
 	timeout = msecs_to_jiffies(100);
 	stoptime = jiffies + timeout;
 	timedout = 0;
@@ -683,11 +684,11 @@ static int xlr_mii_read(struct mii_bus *bus, int phy_addr, int regnum)
 	return ret;
 }
 
-/*
- * XLR ports are RGMII. XLS ports are SGMII mostly except the port0,
+/**
+ * xlr_sgmii_init() - XLR ports are RGMII. XLS ports are SGMII mostly except the port0,
  * which can be configured either SGMII or RGMII, considered SGMII
  * by default, if board setup to RGMII the port_type need to set
- * accordingly.Serdes and PCS layer need to configured for SGMII
+ * accordingly.Serdes and PCS layer need to be configured for SGMII
  */
 static void xlr_sgmii_init(struct xlr_net_priv *priv)
 {
@@ -886,8 +887,10 @@ static void xlr_port_enable(struct xlr_net_priv *priv)
 
 static void xlr_port_disable(struct xlr_net_priv *priv)
 {
-	/* Setup MAC_CONFIG reg */
-	/* Rx Tx disable*/
+	/*
+	 * Setup MAC_CONFIG reg
+	 * Rx Tx disable
+	 */
 	xlr_reg_update(priv->base_addr, R_MAC_CONFIG_1,
 		       ((1 << O_MAC_CONFIG_1__rxen) |
 			(1 << O_MAC_CONFIG_1__txen) |
@@ -904,8 +907,8 @@ static void xlr_port_disable(struct xlr_net_priv *priv)
 		       1 << O_RX_CONTROL__RXENABLE, 0);
 }
 
-/*
- * Initialization of gmac
+/**
+ * xlr_gmac_init() - Initialize gmac
  */
 static int xlr_gmac_init(struct xlr_net_priv *priv,
 			 struct platform_device *pdev)
@@ -951,9 +954,7 @@ static int xlr_net_probe(struct platform_device *pdev)
 	int err, port;
 
 	pr_info("XLR/XLS Ethernet Driver controller %d\n", pdev->id);
-	/*
-	 * Allocate our adapter data structure and attach it to the device.
-	 */
+	 /* Allocate our adapter data structure and attach it to the device.*/
 	adapter = devm_kzalloc(&pdev->dev, sizeof(*adapter), GFP_KERNEL);
 	if (!adapter)
 		return -ENOMEM;
diff --git a/drivers/staging/netlogic/xlr_net.h b/drivers/staging/netlogic/xlr_net.h
index 8365b744f9b3..c88e465b0e06 100644
--- a/drivers/staging/netlogic/xlr_net.h
+++ b/drivers/staging/netlogic/xlr_net.h
@@ -971,7 +971,8 @@
 		MAC_PREPAD + MAC_SKB_BACK_PTR_SIZE + SMP_CACHE_BYTES)
 #define MAC_CRC_LEN                     4
 #define MAX_NUM_MSGRNG_STN_CC           128
-#define MAX_MSG_SND_ATTEMPTS		100	/* 13 stns x 4 entry msg/stn +
+#define MAX_MSG_SND_ATTEMPTS		100	/*
+						 * 13 stns x 4 entry msg/stn +
 						 * headroom
 						 */
 
-- 
2.30.2

