Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099192CB3
	for <linux-staging@lists.linux.dev>; Wed,  8 Dec 2021 22:51:03 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id q72so4539403iod.12
        for <linux-staging@lists.linux.dev>; Wed, 08 Dec 2021 14:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CmYKrk6BY+JkB/hlDlt3q1jLnYSH9OFSxGsl7p/faDY=;
        b=g/I4+F+JXnzH/TubCYTX76MFnsz+ZsY2EqNzT1DTl+068Y3W5T5xKg5k8zT5az8lhy
         Kl1+ZyGfSPXGYsIOqQf8C5JdzbjscEZwDhs8hqY9OjcS/hOlW/nPj7nY5BWE9qkGxifi
         jP0lvHHCW2w5WiW1wrw0hyssDH+Gie8/xln4hA3Gj7ZTNT2JHu7kql7ZzG8+d4PGDuob
         DKtBRa/yi7ScSqeUjOrx5AHvZy3Lnh8l7Odt1XqODPb+bsaHbBQeR+7VD+DiTph7ShWq
         VURawxVCm84z8SQ8h74V/wL5wJQsXSfDgCy+YUjjaK/gt8Yfc8nzNjoGF+GXxxStrKde
         F3MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CmYKrk6BY+JkB/hlDlt3q1jLnYSH9OFSxGsl7p/faDY=;
        b=WRob1T4eYYpkWEU2Pt8Y1y1aMFqz762NR6Bp53RVemb1J137tYKLrAvMfPqUq1gn3C
         YxVZmDz+QkgCWlaTv+39IXwvbdXy5dHCfPlRHMU58ThbAQmEnUFnrSN/qxZwl1wvfil2
         B5kU7Jmf/KbZ3gCiew/TuVKila7NTTuOp/pyO8hyK9J/DHScXLhSKwK/eVdouRfw/z8v
         cTMDd8T9VN5Xw9QcvJApJWw3wPrmrE7tmqcwck0QNwzZANLGrY9oYKoqw05zdNSm13v+
         33ipBua66f5Y51qc602SKFrtuXADtf7IOcOAJmgWxLOyk2RQlQ4S7PXlcik9Y6q9c6sq
         0JzA==
X-Gm-Message-State: AOAM533mUbU170N6onDwLK1SZKkCY0t1m7ifw647RVARK5XihMy1v9wP
	Q+IXQTu9b7JKtsBuNlzjQCP4mpFeCZzHkQ==
X-Google-Smtp-Source: ABdhPJxiaJAYaeU0Z9vSpYSyUwXqVRBqeiOQq85i/0XyqKBA/pEz+No5RNx2VUK0NfXDTsaq0yOICA==
X-Received: by 2002:a05:6602:3c2:: with SMTP id g2mr11081040iov.65.1639003862036;
        Wed, 08 Dec 2021 14:51:02 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:269a:1aa2:f1d9:8dbb])
        by smtp.gmail.com with ESMTPSA id t6sm2378751ioi.51.2021.12.08.14.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 14:51:01 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-media@vger.kernel.org
Cc: benjamin.gaignard@collabora.com,
	cphealy@gmail.com,
	aford@beaconembedded.com,
	nicolas@ndufresne.ca,
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
Subject: [PATCH 10/10] arm64: dts: imx8mm: Enable Hantro G1 and G2 video decoders
Date: Wed,  8 Dec 2021 16:50:29 -0600
Message-Id: <20211208225030.2018923-11-aford173@gmail.com>
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

There are two decoders on the i.MX8M Mini controlled by the
vpu-blk-ctrl.  The G1 supports H264 and VP8 while the
G2 support HEVC and VP9.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 28 +++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index f13d31ebfcbd..4682f1f5238d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -1196,6 +1196,28 @@ gpu_2d: gpu@38008000 {
 			power-domains = <&pgc_gpu>;
 		};
 
+		vpu_g1: video-codec@38300000 {
+			compatible = "nxp,imx8mm-vpu-g1";
+			reg = <0x38300000 0x10000>;
+			reg-names = "g1";
+			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "g1";
+			clocks = <&clk IMX8MM_CLK_VPU_G1_ROOT>;
+			clock-names = "g1";
+			power-domains = <&vpu_blk_ctrl IMX8MM_VPUBLK_PD_G1>;
+		};
+
+		vpu_g2: video-codec@38310000 {
+			compatible = "nxp,imx8mm-vpu-g2";
+			reg = <0x38310000 0x10000>;
+			reg-names = "g2";
+			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "g2";
+			clocks = <&clk IMX8MM_CLK_VPU_G2_ROOT>;
+			clock-names = "g2";
+			power-domains = <&vpu_blk_ctrl IMX8MM_VPUBLK_PD_G2>;
+		};
+
 		vpu_blk_ctrl: blk-ctrl@38330000 {
 			compatible = "fsl,imx8mm-vpu-blk-ctrl", "syscon";
 			reg = <0x38330000 0x100>;
@@ -1206,6 +1228,12 @@ vpu_blk_ctrl: blk-ctrl@38330000 {
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

