Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F3F2C82
	for <linux-staging@lists.linux.dev>; Thu,  2 Dec 2021 04:17:42 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id y16so33724895ioc.8
        for <linux-staging@lists.linux.dev>; Wed, 01 Dec 2021 20:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+ap+Y2Tz8z5LcHzGO6SA2tif2EyiHYR6r3DF4Am/aoA=;
        b=IMVFwDqLjFJZ5830/8WtIIy574DKHzJnA5rl6QuLvDGsR7M9+Tz/ukHLXKwNgW0RQJ
         gYjjNpYjne+UzkYi43KonHunWQOWVUKfyXmZQBp/bzw6njVIyW91+ha6rNQ+HDYz51B1
         qlgtGMqqY12hY+NekMTiYMAqFzd4QrWlKO3D4X6nQa9SdJ2lMA2OsiR9un7TJmtqgy29
         i3/wEsM6CnJpG11zAZbTh52FVhUFOXx/AIXC+sYGVkfjw+1UF3dABRLXfcAHuG6q3Hlk
         4JaM8IOYdIuE10kSrx4+ZxJe0SOzE5pHqxmfbYHMWg4Jltb5eLjH3okjONqSB59U6LzY
         z/lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+ap+Y2Tz8z5LcHzGO6SA2tif2EyiHYR6r3DF4Am/aoA=;
        b=DR/afJfc4Y7vqfWCEszCOVp6LOYyuJoJ9NAiLfNNGXEh/Mp3PsMgNBPLix/LBUZ51M
         /huJiIb4tv5ep0XMWutmFHj9Moir32yWRr0UaY5lUuRLRxjB3fUanmnOUAEtqmGR0I1e
         t+K5zoe5AqlZJKQEV4AnVoKXr6l6J2S+tuiUCJ5lOhBMNwIgy2f3XncRdN0zy3CO26tM
         Yhkpti+SUTByZLvXCMgZhp203zmF/WFUDl7jDbw10XEjBHNcnr3yRjzi4kLsOq5t9iNC
         lekE5MhDKvl1A92PtuRakapzLHoT/bwhDTAQBmKCQ7FCHsxaOlT/QiVrkkkJcZQKCx9L
         hYMQ==
X-Gm-Message-State: AOAM5339z6NUHNGhPejyzz13TNU/bhRRLSyBYef7xL9Xm8n1AlWvK04m
	nIqZYdOpFafN8mRqZW3ICFU=
X-Google-Smtp-Source: ABdhPJww0AmjAfFnMxyfx6OuE4CZBudf33HaTR6dEqM5D1jeGQF3UfUTzKqHHMGShMO/7lQNUKwPEg==
X-Received: by 2002:a05:6602:45d:: with SMTP id e29mr13868300iov.202.1638418661156;
        Wed, 01 Dec 2021 20:17:41 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:c405:2c26:c2b8:506e])
        by smtp.gmail.com with ESMTPSA id t14sm1030603ilh.62.2021.12.01.20.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 20:17:40 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-media@vger.kernel.org
Cc: ezequiel@vanguardiasur.com.ar,
	tharvey@gateworks.com,
	nicolas@ndufresne.ca,
	aford@beaconembedded.com,
	hverkuil-cisco@xs4all.nl,
	Adam Ford <aford173@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev
Subject: [RFC V3 2/2] arm64: dts: imx8mm: Enable VPU-G1 and VPU-G2
Date: Wed,  1 Dec 2021 22:16:27 -0600
Message-Id: <20211202041627.291625-3-aford173@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211202041627.291625-1-aford173@gmail.com>
References: <20211202041627.291625-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable two hardware Hantro decoders called G1 and G2.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index c2f3f118f82e..eb9dcd9d1a31 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -1197,6 +1197,47 @@ gpu_2d: gpu@38008000 {
 			power-domains = <&pgc_gpu>;
 		};
 
+		vpu_g1: video-codec@38300000 {
+			compatible = "nxp,imx8mm-vpu";
+			reg = <0x38300000 0x10000>;
+			reg-names = "g1";
+			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "g1";
+			clocks = <&clk IMX8MM_CLK_VPU_G1_ROOT>,
+				 <&clk IMX8MM_CLK_VPU_DEC_ROOT>;
+			clock-names = "g1", "bus";
+			assigned-clocks = <&clk IMX8MM_CLK_VPU_G1>,
+					  <&clk IMX8MM_CLK_VPU_BUS>,
+					  <&clk IMX8MM_VPU_PLL_BYPASS>;
+			assigned-clock-parents = <&clk IMX8MM_VPU_PLL_OUT>,
+						 <&clk IMX8MM_SYS_PLL1_800M>,
+						 <&clk IMX8MM_VPU_PLL>;
+			assigned-clock-rates = <600000000>,
+					       <800000000>,
+					       <0>;
+			power-domains = <&vpu_blk_ctrl IMX8MM_VPUBLK_PD_G1>;
+		};
+
+		vpu_g2: video-codec@38310000 {
+			compatible = "nxp,imx8mm-vpu-g2";
+			reg = <0x38310000 0x10000>;
+			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "g2";
+			clocks = <&clk IMX8MM_CLK_VPU_G2_ROOT>,
+				 <&clk IMX8MM_CLK_VPU_DEC_ROOT>;
+			clock-names = "g2",  "bus";
+			assigned-clocks = <&clk IMX8MM_CLK_VPU_G2>,
+					 <&clk IMX8MM_CLK_VPU_BUS>,
+					 <&clk IMX8MM_VPU_PLL_BYPASS>;
+			assigned-clock-parents = <&clk IMX8MM_VPU_PLL_OUT>,
+						<&clk IMX8MM_SYS_PLL1_800M>,
+						<&clk IMX8MM_VPU_PLL>;
+			assigned-clock-rates = <600000000>,
+					       <800000000>,
+					       <0>;
+			power-domains = <&vpu_blk_ctrl IMX8MM_VPUBLK_PD_G2>;
+		};
+
 		vpu_blk_ctrl: blk-ctrl@38330000 {
 			compatible = "fsl,imx8mm-vpu-blk-ctrl", "syscon";
 			reg = <0x38330000 0x100>;
-- 
2.32.0

