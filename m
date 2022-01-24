Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB12D168
	for <linux-staging@lists.linux.dev>; Mon, 24 Jan 2022 02:31:46 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id e79so17750770iof.13
        for <linux-staging@lists.linux.dev>; Sun, 23 Jan 2022 18:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0kqapHPsVAmMS1hoADzYhtB33F6J8cOET2+FNwBRYVI=;
        b=UjHNdYVBgQuefHEiP7NbKEkMw+838O6fih8G046RqbW05XTz91K2as73j4bCJHEG/i
         H+6hfjiigX46NZNy+WHb1T6KEYRkc42t+/G+r+z2ijG27j8F/GBOdDD0tRLLr/8+uT6y
         /b34Ko2Gs9uwNfeEL4Teub3gJKq9UyFtGClm0clhY9NANQYj3Ga0L8TaR2whBThWAUsq
         eK4IuWdTelBizfAvnVZyvp3a6sVnt3pAv0wqUxDw5oMNUXA0nA2OpA6C00az43q6IPbV
         xQGGJObqJrmnXPn+Gnj08tQpHKkUOebFzut8qf62RljmsicwQ/ODD151qV2Hh9LfJozS
         bPOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0kqapHPsVAmMS1hoADzYhtB33F6J8cOET2+FNwBRYVI=;
        b=aHrFeIeBKFu24xoLkpALa8b5rmJFHYw0iqZEpTY9SuZzD3fp0KztRMul5Q8UcNilhf
         fWp7uoyAMdHnoQIjPddn60zCRZUN4y0TQdvFMFaM+RnAmmpbA486UJCeATiAMK3G8D89
         UHwxNvSaxOpC193DMtyLJpaywqncw+2d6eFGvLyEVjvjIE1HgOmQssfF5eno+obAFsn0
         85/P5z6W1NfvoRhVX9OZGFjjgJpa7uzUC9H02Onl6FNglQWP7/uZ1CWSeY9fMsAaVWZg
         puegBpQcaQW4KoMNdCO0YnK4Ae2btqMDE4hsI+Lvlrksd6JkbwFOBaE+7ysAtL3+c0ge
         ilpA==
X-Gm-Message-State: AOAM531+spNGQnghOnvc+7VLRnap49zhHlotEc50o3HkHH3TqNBiVvzU
	Z0OFe6Inu/jOwyCQCBsJ+i8=
X-Google-Smtp-Source: ABdhPJylwStRZxRkvSHduhjVQ/yru6kNZFcjW6rMzP6oabSV2mxLIBKRp4iZfbJ9guWf6zAYV+7YXA==
X-Received: by 2002:a02:2201:: with SMTP id o1mr5733193jao.213.1642991505768;
        Sun, 23 Jan 2022 18:31:45 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:582d:ad0e:e5a6:94b6])
        by smtp.gmail.com with ESMTPSA id w4sm6625633ilq.56.2022.01.23.18.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jan 2022 18:31:45 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-media@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	shawnguo@kernel.org,
	aford@beaconembedded.com,
	Adam Ford <aford173@gmail.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lucas Stach <l.stach@pengutronix.de>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH V3 06/10] arm64: dts: imx8mq: Enable both G1 and G2 VPU's with vpu-blk-ctrl
Date: Sun, 23 Jan 2022 20:31:20 -0600
Message-Id: <20220124023125.414794-7-aford173@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220124023125.414794-1-aford173@gmail.com>
References: <20220124023125.414794-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the Hantro G1 and G2 now setup to run independently, update
the device tree to allow both to operate.  This requires the
vpu-blk-ctrl node to be configured.  Since vpu-blk-ctrl needs
certain clock enabled to handle the gating of the G1 and G2
fuses, the clock-parents and clock-rates for the various VPU's
to be moved into the pgc_vpu because they cannot get re-parented
once enabled, and the pgc_vpu is the highest in the chain.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index 2df2510d0118..549b2440f55d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -737,7 +737,21 @@ pgc_gpu: power-domain@5 {
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
@@ -1457,30 +1471,31 @@ usb3_phy1: usb-phy@382f0040 {
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
+			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk IMX8MQ_CLK_VPU_G1_ROOT>;
+			power-domains = <&vpu_blk_ctrl IMX8MQ_VPUBLK_PD_G1>;
+		};
+
+		vpu_g2: video-codec@38310000 {
+			compatible = "nxp,imx8mq-vpu-g2";
+			reg = <0x38310000 0x10000>;
+			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk IMX8MQ_CLK_VPU_G2_ROOT>;
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

