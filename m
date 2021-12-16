Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9952CA2
	for <linux-staging@lists.linux.dev>; Thu, 16 Dec 2021 11:13:40 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id q72so34616358iod.12
        for <linux-staging@lists.linux.dev>; Thu, 16 Dec 2021 03:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nvUUVsWm6ekCm3nrMfYw89v5CU88r8fv3TmpzrnxrvY=;
        b=kCpOLytv/ruCDnA220I3k1vMj6ogzYRZtglgZuiIWDB5Y1pUMBUpGPdjbX6Fb8xVOs
         XRYTnzTGM8SrtmcbIsLUjvrFhQj2j1lKEhaofIqIurUyPhARGPd4B7XufeEJZ7M4GGEa
         t7A2IReTRBnkFRP+974Am7tKsn8oaHfHIw2wc9qztD8CdhhHHQu8PX6qLROE2HIIZF1/
         A6O4vcZLIAGnJF+Th3wTJ+a/7grUQzgJTFjefmM811hoVjpfwCexPiSAG+t/sXZ30MKF
         iS2D/Eru9mXwc3/bOUYH5UrNzDVdgV/+OpfpKtF3TL7Y6mKAitHUo+eK6MXML2WwEJd5
         3llg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nvUUVsWm6ekCm3nrMfYw89v5CU88r8fv3TmpzrnxrvY=;
        b=Sacdcbcx+jS2pRiSJauXHyd2GOENAybomztvHYFwA4dOzrZUZEB+xFdcbB32W0rxsf
         gQJE3aT4GtL3/0G48VW5l2SMGm6LKLK/bnm+eeDn3bbWj0BN28Z3AlmLqu8X7PTuG5Ja
         C+YT8jz2sbd2x3gPrb5Wium5nf3P4nLdVjW7gnp/pVeu9wbbDJUxWpALVno4ImVYfZUQ
         +4XgQJbjNNnC3lgN/R+Ymi2/t2R42tp5HU0q0ZKRTYz5h/PDqo5u3ECcfAvU0FPHjwoz
         179w+KrrE58rzkmeP5ce9oHheanU51PPDh7rbbpYEWDu680+UdrIotVNjonFmfki02je
         FUcA==
X-Gm-Message-State: AOAM530VjXdr+3QITrSxiP6lDP5gb8AVO0ZO/vIRpXHjUVlhIo8hwh8G
	rn0e0TOq3Xbo7pJPA+3PHSk=
X-Google-Smtp-Source: ABdhPJyx3mLKcBbz7ovBGCuPU0wGKDL8WPY37sLIEEOjToMRjDITKfCeOiqI8/qHqykcbSqBVSkGJQ==
X-Received: by 2002:a05:6638:3891:: with SMTP id b17mr9451849jav.100.1639653219909;
        Thu, 16 Dec 2021 03:13:39 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:fe22:1652:55f7:5197])
        by smtp.gmail.com with ESMTPSA id h1sm3090946iow.31.2021.12.16.03.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 03:13:39 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-media@vger.kernel.org
Cc: abel.vesa@nxp.com,
	aford@beaconembedded.com,
	benjamin.gaignard@collabora.com,
	hverkuil-cisco@xs4all.nl,
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
Subject: [PATCH V2 10/10] arm64: dts: imx8mm: Enable Hantro G1 and G2 video decoders
Date: Thu, 16 Dec 2021 05:12:55 -0600
Message-Id: <20211216111256.2362683-11-aford173@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211216111256.2362683-1-aford173@gmail.com>
References: <20211216111256.2362683-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are two decoders on the i.MX8M Mini controlled by the
vpu-blk-ctrl.  The G1 supports H264 and VP8 while the
G2 support HEVC and VP9.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index f13d31ebfcbd..ad1a83c25cc9 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -1196,6 +1196,22 @@ gpu_2d: gpu@38008000 {
 			power-domains = <&pgc_gpu>;
 		};
 
+		vpu_g1: video-codec@38300000 {
+			compatible = "nxp,imx8mm-vpu-g1";
+			reg = <0x38300000 0x10000>;
+			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk IMX8MM_CLK_VPU_G1_ROOT>;
+			power-domains = <&vpu_blk_ctrl IMX8MM_VPUBLK_PD_G1>;
+		};
+
+		vpu_g2: video-codec@38310000 {
+			compatible = "nxp,imx8mm-vpu-g2";
+			reg = <0x38310000 0x10000>;
+			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk IMX8MM_CLK_VPU_G2_ROOT>;
+			power-domains = <&vpu_blk_ctrl IMX8MM_VPUBLK_PD_G2>;
+		};
+
 		vpu_blk_ctrl: blk-ctrl@38330000 {
 			compatible = "fsl,imx8mm-vpu-blk-ctrl", "syscon";
 			reg = <0x38330000 0x100>;
@@ -1206,6 +1222,12 @@ vpu_blk_ctrl: blk-ctrl@38330000 {
 				 <&clk IMX8MM_CLK_VPU_G2_ROOT>,
 				 <&clk IMX8MM_CLK_VPU_H1_ROOT>;
 			clock-names = "g1", "g2", "h1";
+			assigned-clocks = <&clk IMX8MM_CLK_VPU_G1>,
+					  <&clk IMX8MM_CLK_VPU_G2>;
+			assigned-clock-parents = <&clk IMX8MM_VPU_PLL_OUT>,
+						 <&clk IMX8MM_VPU_PLL_OUT>;
+			assigned-clock-rates = <600000000>,
+					       <600000000>;
 			#power-domain-cells = <1>;
 		};
 
-- 
2.32.0

