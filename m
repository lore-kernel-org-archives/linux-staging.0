Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91DE2CB3
	for <linux-staging@lists.linux.dev>; Wed,  8 Dec 2021 22:50:45 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id m9so4670118iop.0
        for <linux-staging@lists.linux.dev>; Wed, 08 Dec 2021 14:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4KtwNb8j6a2zsGgzuGMwDgSdQr1FlL5K/biJ1D+wEHo=;
        b=Kll51ijEMqpTNJzyMDpXHqBYLexy4o/qzEJUaCHlgmnEOwjp4m/SuuBqXZZC1yCP2j
         Kp93ci8hJM5A06J//h73tGZZu02EFWsyu7pbDae7pb/FmvOhMn7nJ0P85+lRyGTZ/S0i
         7W6cNivyvb/tOGdcoaGDHTxHsjWDLATDH1+NxmgMku/3Ax7kOhvRjgf/rKY3U0gC+a7c
         4RAvz3ZRJ21rqN2PYGfIv7OkD9s8LnNT9Q49FMSBjr8Wao+LhJyVLhVc1jogaQIwF7V1
         EIdHfsSOL7LYTxLHSjgZlor+W45Ml3FyJF8g//w5RbcNygvejx+9lokMP1qQ8kNICn1+
         iWhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4KtwNb8j6a2zsGgzuGMwDgSdQr1FlL5K/biJ1D+wEHo=;
        b=Cpk3xNsosJtQTA53L+Jr1Ych8kl0MYghKrpeb1LaYZFZRPKwULHNJ9Vx70ZLV11RVB
         QE4cOZrBdWgp1y6bbfBDo0CSWE8qT/+X/coPMg3CblJ9aqrVdPvvdTocUlGb7aYfKhTD
         sEL0xJabGUnLomJIAgQYxjQTCaaZErw7wtKb6VLxCXiAl539YnDbaTS61trVFkz/Wl3D
         jMEgcYPLI0vRqcl7EXWM8RKTSjbJ2AvveivSL9w8J6tkzQsyywJcL5+c3f6QnrQbLR+g
         TDdzSYHU55NwuE/pNdHu6rps7afKyn7YX2D84N5NFdrlOegtJXk90SpvTo4JIh4cfYj7
         mIcQ==
X-Gm-Message-State: AOAM533x3U68JDtJltE2f5txh8m3wiXi0PAJJDFoBIEn5ROqGA+i8A+C
	gechEwGAuqGzC5XV0KcFGbY=
X-Google-Smtp-Source: ABdhPJx6QhI6xxZLbjEV833xRsuNTkhfDi2RyYZSZYB1Lm113SMDd7tqWpPILf/ioHdOeXEWTuKoBw==
X-Received: by 2002:a05:6602:26d0:: with SMTP id g16mr9547627ioo.70.1639003844819;
        Wed, 08 Dec 2021 14:50:44 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:269a:1aa2:f1d9:8dbb])
        by smtp.gmail.com with ESMTPSA id t6sm2378751ioi.51.2021.12.08.14.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 14:50:44 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-media@vger.kernel.org
Cc: benjamin.gaignard@collabora.com,
	cphealy@gmail.com,
	aford@beaconembedded.com,
	nicolas@ndufresne.ca,
	Lucas Stach <l.stach@pengutronix.de>,
	Adam Ford <aford173@gmail.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 03/10] soc: imx: imx8m-blk-ctrl: add i.MX8MQ VPU blk-ctrl
Date: Wed,  8 Dec 2021 16:50:22 -0600
Message-Id: <20211208225030.2018923-4-aford173@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211208225030.2018923-1-aford173@gmail.com>
References: <20211208225030.2018923-1-aford173@gmail.com>
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
Signed-off-by: Adam Ford <aford173@gmail.com>
---
 drivers/soc/imx/imx8m-blk-ctrl.c | 68 +++++++++++++++++++++++++++++++-
 1 file changed, 67 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/imx/imx8m-blk-ctrl.c b/drivers/soc/imx/imx8m-blk-ctrl.c
index 519b3651d1d9..a7c12e8fa89b 100644
--- a/drivers/soc/imx/imx8m-blk-ctrl.c
+++ b/drivers/soc/imx/imx8m-blk-ctrl.c
@@ -14,6 +14,7 @@
 #include <linux/clk.h>
 
 #include <dt-bindings/power/imx8mm-power.h>
+#include <dt-bindings/power/imx8mq-power.h>
 
 #define BLK_SFT_RSTN	0x0
 #define BLK_CLK_EN	0x4
@@ -498,6 +499,68 @@ static const struct imx8m_blk_ctrl_data imx8mm_disp_blk_ctl_dev_data = {
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
+	 * VPU bits. In order to set the G2 fuse bits, the G2 clock must
+	 * also be enabled.
+	 */
+	regmap_set_bits(bc->regmap, BLK_SFT_RSTN, BIT(0) | BIT(1));
+	regmap_set_bits(bc->regmap, BLK_CLK_EN, BIT(0) | BIT(1));
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
@@ -505,7 +568,10 @@ static const struct of_device_id imx8m_blk_ctrl_of_match[] = {
 	}, {
 		.compatible = "fsl,imx8mm-disp-blk-ctrl",
 		.data = &imx8mm_disp_blk_ctl_dev_data
-	} ,{
+	}, {
+		.compatible = "fsl,imx8mq-vpu-blk-ctrl",
+		.data = &imx8mq_vpu_blk_ctl_dev_data
+	}, {
 		/* Sentinel */
 	}
 };
-- 
2.32.0

