Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3077E2C87
	for <linux-staging@lists.linux.dev>; Sat, 30 Oct 2021 14:20:15 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id d3so21187840wrh.8
        for <linux-staging@lists.linux.dev>; Sat, 30 Oct 2021 07:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F5x1oqtvVP/PGtFgO2U9FSpcbZxZK7r+xhICFV95IKo=;
        b=KkVOt+LAZlq1nTiNsYPYr/MlwIStQYb0R/EKITJAyNqUIykthIosrTrJEUoLSPg/K7
         8REM4Wv1pQ7EXJp+X58Z6e4/jJ1A3LOK+UpDA4UkIgaM48ULQx5iLbDm1MRs8LGpsHD1
         yrEg9r8WgVR376MgDhP9qEI/0rYXOLzn74oqOsXnv9koKgMdQOyxLazmq5jkmfA3zH0g
         jAzC/Qyt4FWLKHqbNEMWU5rG/89MhgURScmA0yfcWyLZ/orKHZQt/bJAVXMbO2KUyZJf
         8g3ixTTh+oQFWW9+qyrPrhOH9dZuZwkWnZN8cB6Zoq+sUlBCOIpQMs3XuLVydRSZ/7SN
         yFzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F5x1oqtvVP/PGtFgO2U9FSpcbZxZK7r+xhICFV95IKo=;
        b=Zgb1n6HVHrmnbMHeVsZMSB9qnmWNsZfp4wlIXsPXPvhTopuheKdC0Lymkjk8eceZ06
         hcgEI+e+0IoS6RnWs/6lI3g8c6Ia773PkaPN7/UWtPjdWf/8t+ShFfx6HMpaCI0Ar1MY
         4KrOtWn9fQBjbiLaFBvxIyQl2PtWXeiEf0DG3mpKJ0Y59dSTvGyX73a2kVbvHD3E/c/f
         Da2P9C2PY6/MhJypo3lXd7t/UWmJFoC3hIV0EeU2kxmp/1EHeo/OJ+HMvXqD75xlsmZ3
         JxdI9I+xMNnhPhHOpEMLHNcxbIodBw5jWNBE3BYKIlXYaCUerXqwBqK/U34EdMWrFs76
         sCGQ==
X-Gm-Message-State: AOAM5320vNNyBxAZYK9b/vuJlMEHvzTUUslVw7iOLzUh1DABJ61O4UcZ
	5PIpGunAOlau7mXVgd99XGQ=
X-Google-Smtp-Source: ABdhPJxtz+uMrR/oOgJ8L1C/5tOkqi1DpssmgGY8Xkz39G7bLAlUp5zXg1vB25tIKREwgogIObk//Q==
X-Received: by 2002:a05:6000:2a4:: with SMTP id l4mr23395325wry.221.1635603613662;
        Sat, 30 Oct 2021 07:20:13 -0700 (PDT)
Received: from localhost.localdomain (252.red-83-54-181.dynamicip.rima-tde.net. [83.54.181.252])
        by smtp.gmail.com with ESMTPSA id m12sm8208521wrq.69.2021.10.30.07.20.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 30 Oct 2021 07:20:13 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	sboyd@kernel.org,
	john@phrozen.org,
	linux-staging@lists.linux.dev,
	gregkh@linuxfoundation.org,
	neil@brown.name
Subject: [PATCH v3 3/4] clk: ralink: make system controller node a reset provider
Date: Sat, 30 Oct 2021 16:20:06 +0200
Message-Id: <20211030142007.27085-4-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211030142007.27085-1-sergio.paracuellos@gmail.com>
References: <20211030142007.27085-1-sergio.paracuellos@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MT7621 system controller node is already providing the clocks for the whole
system but must also serve as a reset provider. Hence, add reset controller
related code to the clock driver itself.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/clk/ralink/clk-mt7621.c | 79 +++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/drivers/clk/ralink/clk-mt7621.c b/drivers/clk/ralink/clk-mt7621.c
index a2c045390f00..f149dd2d1325 100644
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
+static inline struct mt7621_rst *to_mt7621_rst(struct reset_controller_dev *dev)
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
+		return -1;
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
+		return -1;
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
+	rst_data = kzalloc(sizeof(*rst_data), GFP_KERNEL);
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
-- 
2.33.0

