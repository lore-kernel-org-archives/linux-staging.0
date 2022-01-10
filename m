Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842902CA6
	for <linux-staging@lists.linux.dev>; Mon, 10 Jan 2022 08:39:16 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id f189-20020a1c1fc6000000b00347ac5ccf6cso4734348wmf.3
        for <linux-staging@lists.linux.dev>; Mon, 10 Jan 2022 00:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Q23sxoOBDeZmyL3t+WXmzfogUG6AamJwodCzrgho128=;
        b=FhKA3EQNAvkAWIqP5BtX+ExrSxhYt+fO+vyyawNO78s3PMpoYIH+gFatj9zdG1P8Fh
         KEPSDWwemDixS7SYvg7rIHBe23jjvRqjbg7yiXBGOnbjC1RETAGD0vjFneJrje6dOl8B
         IFBCgY9QNXFwJoWgXA2ceYQMu0Zfmy92Qo/0XJV2KizeErncvV5kyqWLB9Y3/+0AeCBu
         1Qbh1gPDGdCSpKMyRx10mZg6M0sjN5YDirhjRJjeCR4l5k2BT2Bps51+L2xC7NwUs413
         TwJ6OPhUmV+g+5cjtClMRha9tOA9TdevCNNUtxUXnRgYo0+pd5dsyfeLpdLLU/Z6k8iL
         7oTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q23sxoOBDeZmyL3t+WXmzfogUG6AamJwodCzrgho128=;
        b=mcw2vAEQZK9HTds3w6tdpl4L6IN2bKD8Smbim3CqbndxRLzu1azVOFotORa40McGvI
         boxZ28E1AMUKgTvfFL3yEmeETAqEuRSCQ1pTz5AgZvHyxrY69eeVv88E2wC0D7QgHlmY
         T72Np+yqeuUUoHhAUsUwWDA+EgY1amic6KQsCdzeJ42gNfVGzhUzLfTLNH7VFFufVAWr
         SCPWumWTP8Q3UZdULo0LZh2riEdfx83siMx6KeHaOacaEgR9t03xLqW+hIj2bGL6cxQV
         XXL12fySRsN8VSH8TfIgi6d4+7kzfNgrFl59i3doMI6vicpAaZj+rdWs1JsU5yZfPkGd
         CQzw==
X-Gm-Message-State: AOAM532xqZSz4DGKFm6IUfWVQK0QYO5YLu2Lxp+WfZw/l3eOYfJaQvBr
	/uEsgRfA4J4QBdMMYV2rY7M=
X-Google-Smtp-Source: ABdhPJzkDTLw2D9jwLdcwiFlEHqKcRb4nZBbdB/Z/HSm3ahVmopxRibecAnEo8lBDIhDttw3aMgqcg==
X-Received: by 2002:a05:600c:4fcd:: with SMTP id o13mr21043413wmq.142.1641803954938;
        Mon, 10 Jan 2022 00:39:14 -0800 (PST)
Received: from localhost.localdomain (198.red-81-44-130.dynamicip.rima-tde.net. [81.44.130.198])
        by smtp.gmail.com with ESMTPSA id m7sm508926wmi.13.2022.01.10.00.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jan 2022 00:39:14 -0800 (PST)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-clk@vger.kernel.org
Cc: john@phrozen.org,
	linux-staging@lists.linux.dev,
	gregkh@linuxfoundation.org,
	neil@brown.name,
	p.zabel@pengutronix.de,
	linux-kernel@vger.kernel.org,
	sboyd@kernel.org
Subject: [PATCH v6 3/4] clk: ralink: make system controller node a reset provider
Date: Mon, 10 Jan 2022 09:39:09 +0100
Message-Id: <20220110083910.1351020-4-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220110083910.1351020-1-sergio.paracuellos@gmail.com>
References: <20220110083910.1351020-1-sergio.paracuellos@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MT7621 system controller node is already providing the clocks for the whole
system but must also serve as a reset provider. Hence, add reset controller
related code to the clock driver itself. To get resets properly ready for
the rest of the world we need to move platform driver initialization process
to 'arch_initcall'.

CC: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/clk/ralink/clk-mt7621.c | 86 ++++++++++++++++++++++++++++++++-
 1 file changed, 85 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/ralink/clk-mt7621.c b/drivers/clk/ralink/clk-mt7621.c
index a2c045390f00..c725bf6e6e07 100644
--- a/drivers/clk/ralink/clk-mt7621.c
+++ b/drivers/clk/ralink/clk-mt7621.c
@@ -11,14 +11,17 @@
 #include <linux/mfd/syscon.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
+#include <linux/reset-controller.h>
 #include <linux/slab.h>
 #include <dt-bindings/clock/mt7621-clk.h>
+#include <dt-bindings/reset/mt7621-reset.h>
 
 /* Configuration registers */
 #define SYSC_REG_SYSTEM_CONFIG0         0x10
 #define SYSC_REG_SYSTEM_CONFIG1         0x14
 #define SYSC_REG_CLKCFG0		0x2c
 #define SYSC_REG_CLKCFG1		0x30
+#define SYSC_REG_RESET_CTRL		0x34
 #define SYSC_REG_CUR_CLK_STS		0x44
 #define MEMC_REG_CPU_PLL		0x648
 
@@ -398,6 +401,76 @@ static void __init mt7621_clk_init(struct device_node *node)
 }
 CLK_OF_DECLARE_DRIVER(mt7621_clk, "mediatek,mt7621-sysc", mt7621_clk_init);
 
+struct mt7621_rst {
+	struct reset_controller_dev rcdev;
+	struct regmap *sysc;
+};
+
+static struct mt7621_rst *to_mt7621_rst(struct reset_controller_dev *dev)
+{
+	return container_of(dev, struct mt7621_rst, rcdev);
+}
+
+static int mt7621_assert_device(struct reset_controller_dev *rcdev,
+				unsigned long id)
+{
+	struct mt7621_rst *data = to_mt7621_rst(rcdev);
+	struct regmap *sysc = data->sysc;
+
+	if (id == MT7621_RST_SYS)
+		return -EINVAL;
+
+	return regmap_update_bits(sysc, SYSC_REG_RESET_CTRL, BIT(id), BIT(id));
+}
+
+static int mt7621_deassert_device(struct reset_controller_dev *rcdev,
+				  unsigned long id)
+{
+	struct mt7621_rst *data = to_mt7621_rst(rcdev);
+	struct regmap *sysc = data->sysc;
+
+	if (id == MT7621_RST_SYS)
+		return -EINVAL;
+
+	return regmap_update_bits(sysc, SYSC_REG_RESET_CTRL, BIT(id), 0);
+}
+
+static int mt7621_reset_device(struct reset_controller_dev *rcdev,
+			       unsigned long id)
+{
+	int ret;
+
+	ret = mt7621_assert_device(rcdev, id);
+	if (ret < 0)
+		return ret;
+
+	return mt7621_deassert_device(rcdev, id);
+}
+
+static const struct reset_control_ops reset_ops = {
+	.reset = mt7621_reset_device,
+	.assert = mt7621_assert_device,
+	.deassert = mt7621_deassert_device
+};
+
+static int mt7621_reset_init(struct device *dev, struct regmap *sysc)
+{
+	struct mt7621_rst *rst_data;
+
+	rst_data = devm_kzalloc(dev, sizeof(*rst_data), GFP_KERNEL);
+	if (!rst_data)
+		return -ENOMEM;
+
+	rst_data->sysc = sysc;
+	rst_data->rcdev.ops = &reset_ops;
+	rst_data->rcdev.owner = THIS_MODULE;
+	rst_data->rcdev.nr_resets = 32;
+	rst_data->rcdev.of_reset_n_cells = 1;
+	rst_data->rcdev.of_node = dev_of_node(dev);
+
+	return devm_reset_controller_register(dev, &rst_data->rcdev);
+}
+
 static int mt7621_clk_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -424,6 +497,12 @@ static int mt7621_clk_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	ret = mt7621_reset_init(dev, priv->sysc);
+	if (ret) {
+		dev_err(dev, "Could not init reset controller\n");
+		return ret;
+	}
+
 	count = ARRAY_SIZE(mt7621_clks_base) +
 		ARRAY_SIZE(mt7621_fixed_clks) + ARRAY_SIZE(mt7621_gates);
 	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, count),
@@ -485,4 +564,9 @@ static struct platform_driver mt7621_clk_driver = {
 		.of_match_table = mt7621_clk_of_match,
 	},
 };
-builtin_platform_driver(mt7621_clk_driver);
+
+static int __init mt7621_clk_reset_init(void)
+{
+	return platform_driver_register(&mt7621_clk_driver);
+}
+arch_initcall(mt7621_clk_reset_init);
-- 
2.25.1

