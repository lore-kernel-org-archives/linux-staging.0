Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9B22F80
	for <linux-staging@lists.linux.dev>; Sat,  8 May 2021 06:52:39 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id u5-20020a7bc0450000b02901480e40338bso7436647wmc.1
        for <linux-staging@lists.linux.dev>; Fri, 07 May 2021 23:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cbFyM8/48A5QwY5f+jcAHfVdDdKUhqPQqn/9aWFc+bo=;
        b=ZFRTF9cJRvrPzrKb7blUFVU3v9BY65e7DprhIVLvgMVjXP0ndV1841gpqXpWavPeBt
         bfFtSVWYpnw1+JZX5oRDgFJdMQLyl0RYs61te9gLPTP5xvrDNBC/NLYo44PFTz2XvSax
         tcYjXSM0NW7D9c3iTRYO/yBPjhK0ysLvfWBjfcrEnQ+IzmgpW5z3CjbGQiznQPbVLKmc
         MHL0xx+02QFkseOEvYthGha4OniAzYgWKXXW30XduNpJZ65n/8VxznPtPmDw6hh8N7Zq
         S0A5CoMa1Icb+kmE3PHLg7UfyBbnti8LYbyhvOyplS0E4+JTn19UFq7MqkbOAYm1h6db
         czoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cbFyM8/48A5QwY5f+jcAHfVdDdKUhqPQqn/9aWFc+bo=;
        b=K3PfMK4ohJ7/Nom1sOe/7vRHxyMU7nMmptsMkWkTsngEnIikZV0Nl9Me8n8l4uSbKn
         3+N41xU7yUsbMaZerxSQoHxQNzIaYcrICKoF557xhhjV+USqrFrD3ugGZcBn6Fw9a7O1
         EYIEMahk9dw8gzTSj1xAhnUpOReCk4MDmjma1h6qTZy2dkXIEdrkqWXvFYcCrYW1sBR1
         +K/ggFEbC/b5Mpq4i3P3zdTp5Yf/WctUgRDAp+k7SVE7nIoLdaJcy20h/heNBjKYrKvt
         2vHOztAAR7UNZF2cNnvUlkAaKZAkB9dU7VAziw6cC+oHA8slXwaGsRM6KMUIJNaMRFJP
         lwvA==
X-Gm-Message-State: AOAM533CL6oPSPsBl6pGwDbeSBWot17PS3qF5IS+C1DZZ5eOqXNBfkFg
	6QrzXib4gI4cswnSKX4D0ck=
X-Google-Smtp-Source: ABdhPJzR/6SkDB7jYl+jO3UVdl29gKC7cPrXHKMB8YfRM+FB3mVH7Um52u3E3FpZosKFPe6v0qr6Kw==
X-Received: by 2002:a7b:c34a:: with SMTP id l10mr14494612wmj.46.1620456758282;
        Fri, 07 May 2021 23:52:38 -0700 (PDT)
Received: from localhost.localdomain (231.red-83-51-243.dynamicip.rima-tde.net. [83.51.243.231])
        by smtp.gmail.com with ESMTPSA id b12sm11638010wro.28.2021.05.07.23.52.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 May 2021 23:52:37 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: vkoul@kernel.org
Cc: linux-phy@lists.infradead.org,
	kishon@ti.com,
	linux-staging@lists.linux.dev,
	gregkh@linuxfoundation.org,
	neil@brown.name,
	ilya.lipnitskiy@gmail.com
Subject: [PATCH v2 3/6] phy: ralink: phy-mt7621-pci: use kernel clock APIS
Date: Sat,  8 May 2021 08:52:29 +0200
Message-Id: <20210508065232.4882-4-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508065232.4882-1-sergio.paracuellos@gmail.com>
References: <20210508065232.4882-1-sergio.paracuellos@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MT7621 SoC clock driver has already mainlined in
'commit 48df7a26f470 ("clk: ralink: add clock driver for mt7621 SoC")'
This allow us to properly use kernel clock apis to get
the clock frequency needed for the phy configuration
instead of use custom architecture code to do the same.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/phy/ralink/phy-mt7621-pci.c | 33 +++++++++++++++++------------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/drivers/phy/ralink/phy-mt7621-pci.c b/drivers/phy/ralink/phy-mt7621-pci.c
index 753cb5bab930..f56ff10b0885 100644
--- a/drivers/phy/ralink/phy-mt7621-pci.c
+++ b/drivers/phy/ralink/phy-mt7621-pci.c
@@ -5,6 +5,7 @@
  */
 
 #include <dt-bindings/phy/phy.h>
+#include <linux/clk.h>
 #include <linux/bitfield.h>
 #include <linux/bitops.h>
 #include <linux/module.h>
@@ -14,8 +15,6 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/sys_soc.h>
-#include <mt7621.h>
-#include <ralink_regs.h>
 
 #define RG_PE1_PIPE_REG				0x02c
 #define RG_PE1_PIPE_RST				BIT(12)
@@ -62,8 +61,6 @@
 
 #define RG_PE1_FRC_MSTCKDIV			BIT(5)
 
-#define XTAL_MASK				GENMASK(8, 6)
-
 #define MAX_PHYS	2
 
 /**
@@ -71,6 +68,7 @@
  * @dev: pointer to device
  * @regmap: kernel regmap pointer
  * @phy: pointer to the kernel PHY device
+ * @sys_clk: pointer to the system XTAL clock
  * @port_base: base register
  * @has_dual_port: if the phy has dual ports.
  * @bypass_pipe_rst: mark if 'mt7621_bypass_pipe_rst'
@@ -80,6 +78,7 @@ struct mt7621_pci_phy {
 	struct device *dev;
 	struct regmap *regmap;
 	struct phy *phy;
+	struct clk *sys_clk;
 	void __iomem *port_base;
 	bool has_dual_port;
 	bool bypass_pipe_rst;
@@ -116,12 +115,14 @@ static void mt7621_bypass_pipe_rst(struct mt7621_pci_phy *phy)
 	}
 }
 
-static void mt7621_set_phy_for_ssc(struct mt7621_pci_phy *phy)
+static int mt7621_set_phy_for_ssc(struct mt7621_pci_phy *phy)
 {
 	struct device *dev = phy->dev;
-	u32 xtal_mode;
+	unsigned long clk_rate;
 
-	xtal_mode = FIELD_GET(XTAL_MASK, rt_sysc_r32(SYSC_REG_SYSTEM_CONFIG0));
+	clk_rate = clk_get_rate(phy->sys_clk);
+	if (!clk_rate)
+		return -EINVAL;
 
 	/* Set PCIe Port PHY to disable SSC */
 	/* Debug Xtal Type */
@@ -139,13 +140,13 @@ static void mt7621_set_phy_for_ssc(struct mt7621_pci_phy *phy)
 			       RG_PE1_PHY_EN, RG_PE1_FRC_PHY_EN);
 	}
 
-	if (xtal_mode <= 5 && xtal_mode >= 3) { /* 40MHz Xtal */
+	if (clk_rate == 40000000) { /* 40MHz Xtal */
 		/* Set Pre-divider ratio (for host mode) */
 		mt7621_phy_rmw(phy, RG_PE1_H_PLL_REG, RG_PE1_H_PLL_PREDIV,
 			       FIELD_PREP(RG_PE1_H_PLL_PREDIV, 0x01));
 
 		dev_dbg(dev, "Xtal is 40MHz\n");
-	} else if (xtal_mode >= 6) { /* 25MHz Xal */
+	} else if (clk_rate == 25000000) { /* 25MHz Xal */
 		mt7621_phy_rmw(phy, RG_PE1_H_PLL_REG, RG_PE1_H_PLL_PREDIV,
 			       FIELD_PREP(RG_PE1_H_PLL_PREDIV, 0x00));
 
@@ -196,13 +197,15 @@ static void mt7621_set_phy_for_ssc(struct mt7621_pci_phy *phy)
 	mt7621_phy_rmw(phy, RG_PE1_H_PLL_BR_REG, RG_PE1_H_PLL_BR,
 		       FIELD_PREP(RG_PE1_H_PLL_BR, 0x00));
 
-	if (xtal_mode <= 5 && xtal_mode >= 3) { /* 40MHz Xtal */
+	if (clk_rate == 40000000) { /* 40MHz Xtal */
 		/* set force mode enable of da_pe1_mstckdiv */
 		mt7621_phy_rmw(phy, RG_PE1_MSTCKDIV_REG,
 			       RG_PE1_MSTCKDIV | RG_PE1_FRC_MSTCKDIV,
 			       FIELD_PREP(RG_PE1_MSTCKDIV, 0x01) |
 			       RG_PE1_FRC_MSTCKDIV);
 	}
+
+	return 0;
 }
 
 static int mt7621_pci_phy_init(struct phy *phy)
@@ -212,9 +215,7 @@ static int mt7621_pci_phy_init(struct phy *phy)
 	if (mphy->bypass_pipe_rst)
 		mt7621_bypass_pipe_rst(mphy);
 
-	mt7621_set_phy_for_ssc(mphy);
-
-	return 0;
+	return mt7621_set_phy_for_ssc(mphy);
 }
 
 static int mt7621_pci_phy_power_on(struct phy *phy)
@@ -324,6 +325,12 @@ static int mt7621_pci_phy_probe(struct platform_device *pdev)
 		return PTR_ERR(phy->phy);
 	}
 
+	phy->sys_clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(phy->sys_clk)) {
+		dev_err(dev, "failed to get phy clock\n");
+		return PTR_ERR(phy->sys_clk);
+	}
+
 	phy_set_drvdata(phy->phy, phy);
 
 	provider = devm_of_phy_provider_register(dev, mt7621_pcie_phy_of_xlate);
-- 
2.25.1

