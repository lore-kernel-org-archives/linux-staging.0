Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77ACF2CA6
	for <linux-staging@lists.linux.dev>; Tue,  7 Dec 2021 01:55:13 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id i6so12255910ila.0
        for <linux-staging@lists.linux.dev>; Mon, 06 Dec 2021 17:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N2Fm6dWc0a7+XOgJFn0Wt/EroGCK7h79J9FUWbkFAFU=;
        b=G2HYHzbdjxUJbtEeR3Os3Or3mcq2aUaj1uFlbZcGiz6F7622cW1x3Q1wVyTgnNYc7X
         ivDpHgSXwdzxWpNd3p3nlBbZ2cgyVdQoil1dvKLSPVzmaypwuZe+SRmH0PvId5F1hbcx
         9VfrBh/W+0+vh9vBl4yAC3mBReomcOpvllCxZF9sl1pt1ptJbSU5tLbXQcvdDygQLT1o
         MHbrVDn4qG0RdBT6NNf0yIdwdfpGSBlRLT5rUoK4jauoKxfSPGnqTPqQ9YeKo2AQlZRy
         b8vik5ATTgBMLn8rnxcnDF/qLQSyBpaGoPV08e7FddLiQjjF28havCOhS97YxidFWu/2
         dIJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N2Fm6dWc0a7+XOgJFn0Wt/EroGCK7h79J9FUWbkFAFU=;
        b=f42ExUwnVd/n5iUmkOR8g8p1HPdqZpejdKOBV9Fn7VKyXhevJcMjW2aOQ5VuDSs8NM
         DR0dv2mpOWK/dcbgD0C7uwmNDDt88jM6Vn5BIUuYxNygP3biwL7F3XeAv2uhjeXXmZ/O
         Ii3px/ptD1d6fva6xo1x9y57GmUbfTOYP7tXYWyqEaWjTYiXb28mGJ0E7E61+LskyPhc
         so08FYkPZ0UO0/i0mraveR2SSUuXhMlNtfaMHSdF4DG4AO9ZMv2vdQujYsC5xo+Uw46a
         dYV9Ky6IZQ15DPM/hFoGAhgOhuKXw3y3BoVtEumWalJNGDErP1HTEJS6VpmGRl1NPytW
         EYFA==
X-Gm-Message-State: AOAM531DQ8JU4iDurtcZ1KZPGhgj67e48UC7nfbls+jkRlI/G/DY5WtJ
	P6fyNPfOhCm4XoKEPWQq0+k=
X-Google-Smtp-Source: ABdhPJwFLGfSdq9wLBvEJKWPqQo0SPqabYFCnQeXCrib2XsGTtaB0FmNDVOawUKEl716ZhKkS/S3Kg==
X-Received: by 2002:a05:6e02:c94:: with SMTP id b20mr35622714ile.257.1638842112590;
        Mon, 06 Dec 2021 17:55:12 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:6db8:c9e4:6f6d:f38e])
        by smtp.gmail.com with ESMTPSA id j21sm8623639ila.6.2021.12.06.17.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 17:55:11 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-media@vger.kernel.org
Cc: cphealy@gmail.com,
	benjamin.gaignard@collabora.com,
	hverkuil@xs4all.nl,
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
	Lucas Stach <l.stach@pengutronix.de>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [RFC V2 6/6] arm64: dts: imx8mq: Split i.MX8MQ G1 and G2 with vpu-blk-ctrl
Date: Mon,  6 Dec 2021 19:54:45 -0600
Message-Id: <20211207015446.1250854-7-aford173@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211207015446.1250854-1-aford173@gmail.com>
References: <20211207015446.1250854-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the Hantro G1 and G2 now setup to run independently, update
the device tree to enable it again.  This requires the vpu-blk-ctrl
node to be configured, and the clock-parents and clock-rates for
the various VPU's to be moved into the pgc_vpu because they cannot
get re-parented once enabled, and the pgc_vpu is the highest
in the chain.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index 972766b67a15..3ed2644bd500 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -711,7 +711,21 @@ pgc_gpu: power-domain@5 {
 					pgc_vpu: power-domain@6 {
 						#power-domain-cells = <0>;
 						reg = <IMX8M_POWER_DOMAIN_VPU>;
-						clocks = <&clk IMX8MQ_CLK_VPU_DEC_ROOT>;
+						clocks = <&clk IMX8MQ_CLK_VPU_DEC_ROOT>,
+							 <&clk IMX8MQ_CLK_VPU_G1_ROOT>,
+							 <&clk IMX8MQ_CLK_VPU_G2_ROOT>;
+						assigned-clocks = <&clk IMX8MQ_CLK_VPU_G1>,
+								  <&clk IMX8MQ_CLK_VPU_G2>,
+								  <&clk IMX8MQ_CLK_VPU_BUS>,
+								  <&clk IMX8MQ_VPU_PLL_BYPASS>;
+						assigned-clock-parents = <&clk IMX8MQ_VPU_PLL_OUT>,
+									 <&clk IMX8MQ_VPU_PLL_OUT>,
+									 <&clk IMX8MQ_SYS1_PLL_800M>,
+									 <&clk IMX8MQ_VPU_PLL>;
+						assigned-clock-rates = <600000000>,
+								       <600000000>,
+								       <800000000>,
+								       <0>;
 					};
 
 					pgc_disp: power-domain@7 {
@@ -1432,30 +1446,37 @@ usb3_phy1: usb-phy@382f0040 {
 			status = "disabled";
 		};
 
-		vpu: video-codec@38300000 {
-			compatible = "nxp,imx8mq-vpu";
-			reg = <0x38300000 0x10000>,
-			      <0x38310000 0x10000>,
-			      <0x38320000 0x10000>;
-			reg-names = "g1", "g2", "ctrl";
-			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "g1", "g2";
+		vpu_g1: video-codec@38300000 {
+			compatible = "nxp,imx8mq-vpu-g1";
+			reg = <0x38300000 0x10000>;
+			reg-names = "g1";
+			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "g1";
+			clocks = <&clk IMX8MQ_CLK_VPU_G1_ROOT>;
+			clock-names = "g1";
+			power-domains = <&vpu_blk_ctrl IMX8MQ_VPUBLK_PD_G1>;
+		};
+
+		vpu_g2: video-codec@38310000 {
+			compatible = "nxp,imx8mq-vpu-g2";
+			reg = <0x38310000 0x10000>;
+			reg-names = "g2";
+			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "g2";
+			clocks = <&clk IMX8MQ_CLK_VPU_G2_ROOT>;
+			clock-names = "g2";
+			power-domains = <&vpu_blk_ctrl IMX8MQ_VPUBLK_PD_G2>;
+		};
+
+		vpu_blk_ctrl: blk-ctrl@38320000 {
+			compatible = "fsl,imx8mq-vpu-blk-ctrl";
+			reg = <0x38320000 0x100>;
+			power-domains = <&pgc_vpu>, <&pgc_vpu>, <&pgc_vpu>;
+			power-domain-names = "bus", "g1", "g2";
 			clocks = <&clk IMX8MQ_CLK_VPU_G1_ROOT>,
-				 <&clk IMX8MQ_CLK_VPU_G2_ROOT>,
-				 <&clk IMX8MQ_CLK_VPU_DEC_ROOT>;
-			clock-names = "g1", "g2", "bus";
-			assigned-clocks = <&clk IMX8MQ_CLK_VPU_G1>,
-					  <&clk IMX8MQ_CLK_VPU_G2>,
-					  <&clk IMX8MQ_CLK_VPU_BUS>,
-					  <&clk IMX8MQ_VPU_PLL_BYPASS>;
-			assigned-clock-parents = <&clk IMX8MQ_VPU_PLL_OUT>,
-						 <&clk IMX8MQ_VPU_PLL_OUT>,
-						 <&clk IMX8MQ_SYS1_PLL_800M>,
-						 <&clk IMX8MQ_VPU_PLL>;
-			assigned-clock-rates = <600000000>, <600000000>,
-					       <800000000>, <0>;
-			power-domains = <&pgc_vpu>;
+				 <&clk IMX8MQ_CLK_VPU_G2_ROOT>;
+			clock-names = "g1", "g2";
+			#power-domain-cells = <1>;
 		};
 
 		pcie0: pcie@33800000 {
-- 
2.32.0

