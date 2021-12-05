Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627A92C9E
	for <linux-staging@lists.linux.dev>; Sun,  5 Dec 2021 18:16:42 +0000 (UTC)
Received: by mail-il1-f174.google.com with SMTP id s6so2602082ild.9
        for <linux-staging@lists.linux.dev>; Sun, 05 Dec 2021 10:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gTzpcmEs2Hk1AEPi3IIm1xVjZo9fqCrWWz1Ibe9SDvY=;
        b=kXHsMwYzGvY5oMXFD1fJ0SQCElcdbycIMsQIL9kKAs5TkJnQwtm0yWTLs6ZwaeUQMx
         H3dmpMlZ088vkNr/7a+WTT0os/IuMRE7SDmAvqv2dVJA56FW31YCYB9RUSnZwbVPxPPi
         7EQH2h9cuzbCf4GOGuCNUtkVzC5xVFD0sQloJvj9YsE8GcIotN4box0VO5OZ6e5WGoMD
         gc0lxpHkP5PelShakb5tiHvAqvERPSWeRAMXh3R01GoMHOBa1QnLKGgAL2Km7bV0uGuf
         P811mdslTnYzOSTvLNHhaZYoUDJu42MnMrXCcj5iB4nBs1RbGghUfffXpBSAlf2Ik0Bt
         hLkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gTzpcmEs2Hk1AEPi3IIm1xVjZo9fqCrWWz1Ibe9SDvY=;
        b=Zm095xrD96NWSQB+YapbJ/RLHenS1QHeEaBPKCISsDJDQOyqVaL2W9Gc60aODbj8NX
         DdUq33Hh+glaAzFfxilD/DyAc6Y0N26JN1JUsxicn1NKGRhSbG0DxWrCmA0EDx++ktAy
         ifuFrdHAOLunNrMnTY+mL+Xiniqpo9IY/iGMHMIwhy36L5qA2KTBg06mtOsCawjzhcZn
         uNnmokDtVAufR/3KnRcf64RYe/5gep0CVfj/l+2LHgAPS/OqKGVKR6qdA7d+XnJcx8KJ
         vzYKrS8gsdLzmVz25Rj5gsPLqcFFbvyoFu5JkmVHeO6qtRJPvUdvPCP3oKQ/ON+Gytpx
         ov0g==
X-Gm-Message-State: AOAM533hIj4JqscunKn8gX5TYu6fnlAdOSk1zGx/oDx3wHlxdtDEaz+7
	HFs2b3Mkhpf76hs4vhfF1iA=
X-Google-Smtp-Source: ABdhPJxdQrwwPjtDdFWdI6vQBp6tDzf6SdOvp0wgYXXjf8/BEMgksN9cf4pf2idLgcZ6XQj7YKnQYw==
X-Received: by 2002:a05:6e02:1be9:: with SMTP id y9mr30066944ilv.219.1638728201435;
        Sun, 05 Dec 2021 10:16:41 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:9ea0:bb99:b16a:6159])
        by smtp.gmail.com with ESMTPSA id z12sm5808164ilu.27.2021.12.05.10.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 10:16:41 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-media@vger.kernel.org
Cc: benjamin.gaignard@collabora.com,
	cphealy@gmail.com,
	nicolas@ndufresne.ca,
	Lucas Stach <l.stach@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev
Subject: [RFC 3/5] soc: imx: imx8m-blk-ctrl: add i.MX8MQ VPU blk-ctrl
Date: Sun,  5 Dec 2021 12:16:16 -0600
Message-Id: <20211205181618.1041699-4-aford173@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211205181618.1041699-1-aford173@gmail.com>
References: <20211205181618.1041699-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lucas Stach <l.stach@pengutronix.de>

This adds the necessary bits to drive the VPU blk-ctrl on the i.MX8MQ, to
avoid putting more of this functionality into the decoder driver.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/soc/imx/imx8m-blk-ctrl.c | 67 ++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/drivers/soc/imx/imx8m-blk-ctrl.c b/drivers/soc/imx/imx8m-blk-ctrl.c
index 519b3651d1d9..66c879bcc66b 100644
--- a/drivers/soc/imx/imx8m-blk-ctrl.c
+++ b/drivers/soc/imx/imx8m-blk-ctrl.c
@@ -14,6 +14,7 @@
 #include <linux/clk.h>
 
 #include <dt-bindings/power/imx8mm-power.h>
+#include <dt-bindings/power/imx8mq-power.h>
 
 #define BLK_SFT_RSTN	0x0
 #define BLK_CLK_EN	0x4
@@ -498,6 +499,69 @@ static const struct imx8m_blk_ctrl_data imx8mm_disp_blk_ctl_dev_data = {
 	.num_domains = ARRAY_SIZE(imx8mm_disp_blk_ctl_domain_data),
 };
 
+static int imx8mq_vpu_power_notifier(struct notifier_block *nb,
+				     unsigned long action, void *data)
+{
+	struct imx8m_blk_ctrl *bc = container_of(nb, struct imx8m_blk_ctrl,
+						 power_nb);
+
+	if (action != GENPD_NOTIFY_ON && action != GENPD_NOTIFY_PRE_OFF)
+		return NOTIFY_OK;
+
+	/*
+	 * The ADB in the VPUMIX domain has no separate reset and clock
+	 * enable bits, but is ungated and reset together with the VPUs. The
+	 * reset and clock enable inputs to the ADB is a logical OR of the
+	 * VPU bits. To avoid putting a improperly reset decoder on the bus
+	 * while making the ADB work, we release G2 from reset, but only
+	 * enable clocks to G1.
+	 */
+	regmap_update_bits(bc->regmap, BLK_SFT_RSTN, BIT(0) | BIT(1), BIT(0));
+	regmap_set_bits(bc->regmap, BLK_CLK_EN, BIT(1));
+
+	if (action == GENPD_NOTIFY_ON) {
+		/*
+		 * On power up we have no software backchannel to the GPC to
+		 * wait for the ADB handshake to happen, so we just delay for a
+		 * bit. On power down the GPC driver waits for the handshake.
+		 */
+		udelay(5);
+
+		/* set "fuse" bits to enable the VPUs */
+		regmap_set_bits(bc->regmap, 0x8, 0xffffffff);
+		regmap_set_bits(bc->regmap, 0xc, 0xffffffff);
+		regmap_set_bits(bc->regmap, 0x10, 0xffffffff);
+	}
+
+	return NOTIFY_OK;
+}
+
+static const struct imx8m_blk_ctrl_domain_data imx8mq_vpu_blk_ctl_domain_data[] = {
+	[IMX8MQ_VPUBLK_PD_G1] = {
+		.name = "vpublk-g1",
+		.clk_names = (const char *[]){ "g1", },
+		.num_clks = 1,
+		.gpc_name = "g1",
+		.rst_mask = BIT(1),
+		.clk_mask = BIT(1),
+	},
+	[IMX8MQ_VPUBLK_PD_G2] = {
+		.name = "vpublk-g2",
+		.clk_names = (const char *[]){ "g2", },
+		.num_clks = 1,
+		.gpc_name = "g2",
+		.rst_mask = BIT(0),
+		.clk_mask = BIT(0),
+	},
+};
+
+static const struct imx8m_blk_ctrl_data imx8mq_vpu_blk_ctl_dev_data = {
+	.max_reg = 0x14,
+	.power_notifier_fn = imx8mq_vpu_power_notifier,
+	.domains = imx8mq_vpu_blk_ctl_domain_data,
+	.num_domains = ARRAY_SIZE(imx8mq_vpu_blk_ctl_domain_data),
+};
+
 static const struct of_device_id imx8m_blk_ctrl_of_match[] = {
 	{
 		.compatible = "fsl,imx8mm-vpu-blk-ctrl",
@@ -505,6 +569,9 @@ static const struct of_device_id imx8m_blk_ctrl_of_match[] = {
 	}, {
 		.compatible = "fsl,imx8mm-disp-blk-ctrl",
 		.data = &imx8mm_disp_blk_ctl_dev_data
+	} ,{
+		.compatible = "fsl,imx8mq-vpu-blk-ctrl",
+		.data = &imx8mq_vpu_blk_ctl_dev_data
 	} ,{
 		/* Sentinel */
 	}
-- 
2.32.0

