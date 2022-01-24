Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8A32CA8
	for <linux-staging@lists.linux.dev>; Mon, 24 Jan 2022 02:31:56 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id y17so1089894ilm.1
        for <linux-staging@lists.linux.dev>; Sun, 23 Jan 2022 18:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R2uTm/BD2isTXWldGmoljdaacGOnVbR7Md5p5huP0LI=;
        b=JmMDFkLadGqdIsUwAjemoOsUPgfceF0iUcKiswWmYTYrcE7n0bzZ/Z9tSNY6D4fDNQ
         1EMCefN6u0VGCDqVHP2IOJs1hE9fFQ4rNuAeXJ29WNvjoqXy6kmpG1TCMyeZmfjzxRKJ
         D3bJNlPPVwj0wkSUjvE2mmI9W2Z6z95kj6RDHnof2xAGvib4QIKv6Dx6XoApeBSPV83w
         pjaiQNuTC1XxpSi7nzZjmvrznr3JCej2YCoZq2ZXAjWGdEGwB0IceLrTDTZaSI60Rovj
         nU/dqrFpv6d3mx8SguU5ITyk2raZu5ROKJxC6pM6/QPVlGXU3qRyfyfzG+Y9BFJvTN3x
         FNJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R2uTm/BD2isTXWldGmoljdaacGOnVbR7Md5p5huP0LI=;
        b=WJTyVJyccNiftErKOl8FSuDdgEiLm5twa9jXR9zwkS7JAo6IeZTmnJANM7eGwImcsQ
         UBnb9sMZUmE8ME6QWJrqlqyT4sGKFdzQzC+HDRd3DiZuSjd+5CtOKwmGf+jfvVYnmK19
         daLVKZdpeil4ICCUM8MlJuiBEcWNQMw0hT8UwWBgCNwdtj1+P9d6yUe+v5TOVDG8qwbX
         VYN6Ck6S2d4UVVeK5bQtRQkKkW+8GxEgJHGSxBVS9Z99OC4mgQwZ1PHeaSRyFsx78bvE
         jG7HNDH/JLju9vsbRM2i/1PZJ5zSe+w10cD8MXNhx+JbqqLqt2XbX22bYyEWEU5NAGNh
         WNYw==
X-Gm-Message-State: AOAM5334efV6gpKV8CD8VTY7udFWeckeVh0HnR6dQuicMzsd/vxgiA3P
	2VNz9SMtRnQds6YvXeOKz1gO7UaWrqU=
X-Google-Smtp-Source: ABdhPJzKUaRunuyBFbmDoIVKwmFF8W+zvBreaT8xlFp7AUwcmOghFLRUo5hbPrelnPoJRUglaPqf3g==
X-Received: by 2002:a92:b10:: with SMTP id b16mr7624374ilf.187.1642991515536;
        Sun, 23 Jan 2022 18:31:55 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:582d:ad0e:e5a6:94b6])
        by smtp.gmail.com with ESMTPSA id w4sm6625633ilq.56.2022.01.23.18.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jan 2022 18:31:54 -0800 (PST)
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
Subject: [PATCH V3 10/10] arm64: dts: imx8mm: Enable Hantro G1 and G2 video decoders
Date: Sun, 23 Jan 2022 20:31:24 -0600
Message-Id: <20220124023125.414794-11-aford173@gmail.com>
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

There are two decoders on the i.MX8M Mini controlled by the
vpu-blk-ctrl.  The G1 supports H264 and VP8 while the
G2 support HEVC and VP9.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index 0c7a72c51a31..98aec4421713 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -1272,6 +1272,22 @@ gpu_2d: gpu@38008000 {
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
+			compatible = "nxp,imx8mq-vpu-g2";
+			reg = <0x38310000 0x10000>;
+			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk IMX8MM_CLK_VPU_G2_ROOT>;
+			power-domains = <&vpu_blk_ctrl IMX8MM_VPUBLK_PD_G2>;
+		};
+
 		vpu_blk_ctrl: blk-ctrl@38330000 {
 			compatible = "fsl,imx8mm-vpu-blk-ctrl", "syscon";
 			reg = <0x38330000 0x100>;
@@ -1282,6 +1298,12 @@ vpu_blk_ctrl: blk-ctrl@38330000 {
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

