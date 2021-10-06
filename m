Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615A42C8E
	for <linux-staging@lists.linux.dev>; Wed,  6 Oct 2021 11:23:12 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id s15so7746960wrv.11
        for <linux-staging@lists.linux.dev>; Wed, 06 Oct 2021 04:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Nw+gRBKSlBdLJR5JCN9jZoWbWkQnZuEzAoNBrLU9lmY=;
        b=Ww78qLVzY61h+k6gNMOOU3DRQKzM8hQZlLDGESLtWFcvQgE8ZSoINAuxX0WrsdG9N1
         aR14p6vPJf/Fn0UL48+vAS3qfIXEXvGBDjH2WXyfFAJ+7Es0Qk1IcM8ySpjoVtgg2+Ws
         ayPZkEpeZ/sdDSGatogPb4ZQA1wAqb7GIYYW1kIDKrCjjrsZ3GF5G3p3QNFfaWnc98u5
         4rgMQdYL6a4O09J+JexBm1PK8ASFcjrR+nad9FTNPM3/W0xuB2VGSRcWR2eohrWIEFjB
         spHP6Z+aLVWu+ncNPEGMXVpDS0yNN3qi7QtnChYjaRj4W/9QMxrlF7+4nWkBIjO+Y2Jc
         KUZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Nw+gRBKSlBdLJR5JCN9jZoWbWkQnZuEzAoNBrLU9lmY=;
        b=ZWyxvgm5z5KfgsGRxPPrO8IoEyUGC2V9sdEeZafGepE4Sj+5EE9heRVbzdXI8mhIXK
         FtlbfIoT43rWYH3vJLmJcmMaiAWOf5NBd06EDq+1DmuNbonDCEPXBnAxOSuuTk8iyqKk
         XH8x8qU6nR0SovemWVr7N0Nywh28giZMXhGKBixIS6vxj0+OzHp8gMt4ud7ZQlbjmJzL
         oQFDcXP5lE8Hbnm2pRRGEXyOfu9uHkvhWOvRH6OK8Gkz6rcsfleGfCX4QPG59q8B/6Bh
         2Qg/8lpZoQgoKAioOaX/Opdi27p23FOre1TUI8yM4vYnAaLY/3MqdhC+rxtL6MxVGliF
         KOwA==
X-Gm-Message-State: AOAM53269nT1hWqM+3TyvHq5FKsCHqXaXZZsLz9mMagaKcPU4yZaiq9H
	lxwnLbvIEy+I5BDYq4/6OeE=
X-Google-Smtp-Source: ABdhPJyYJhfhOzDvyH7laJTeI5RmyTJlxWWlF2G/04PM0PpJLMb9zaJ286MTQc0nux8IxL8UoEUatQ==
X-Received: by 2002:a05:600c:4ec6:: with SMTP id g6mr9304916wmq.95.1633519390776;
        Wed, 06 Oct 2021 04:23:10 -0700 (PDT)
Received: from localhost.localdomain (252.red-83-54-181.dynamicip.rima-tde.net. [83.54.181.252])
        by smtp.gmail.com with ESMTPSA id e14sm10801985wrw.33.2021.10.06.04.23.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 Oct 2021 04:23:10 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: sboyd@kernel.org
Cc: linux-clk@vger.kernel.org,
	gregkh@linuxfoundation.org,
	devicetree@vger.kernel.org,
	robh+dt@kernel.org,
	linux-staging@lists.linux.dev,
	neil@brown.name,
	linux-kernel@vger.kernel.org,
	john@phrozen.org
Subject: [PATCH v2 3/4] clk: ralink: make system controller node a reset provider
Date: Wed,  6 Oct 2021 13:23:05 +0200
Message-Id: <20211006112306.4691-4-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211006112306.4691-1-sergio.paracuellos@gmail.com>
References: <20211006112306.4691-1-sergio.paracuellos@gmail.com>
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
index a2c045390f00..7a474bb4c877 100644
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
+		pr_err("Could not init reset controller\n");
+		return ret;
+	}
+
 	count = ARRAY_SIZE(mt7621_clks_base) +
 		ARRAY_SIZE(mt7621_fixed_clks) + ARRAY_SIZE(mt7621_gates);
 	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, count),
-- 
2.33.0

