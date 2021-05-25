Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2E42FB1
	for <linux-staging@lists.linux.dev>; Tue, 25 May 2021 15:22:51 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id k14so44524517eji.2
        for <linux-staging@lists.linux.dev>; Tue, 25 May 2021 08:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0dWrSJpZgMpxHVFRG9kZb8CpcNYTDRtnmDZpgsmj8Rc=;
        b=MdfMs6/dhvVBw49gZTRFiPTStZUqCMgEmt0xtVc7bas1RRaRDs/hRo5f0+d+IYWMpG
         gsxv9E+3CXuwJ+d2SfKWcxF68ZqFfusNAEaKoqGXqzCSRP6eldxMC6kP/kz6OlSmJe/I
         BdPOOGaCADR+ZuOzbvuiX7vH6RQExYrQw6upv3qa4X7uzID51quN/Z/dp5DEjEDGas8n
         +C6MYGK2Js5MaTbrc6CAmnvjpVnp0chuaOH0dzAZKTZb4oW3AiP1gq0iClpstztTFQfs
         APifNEjBwKdyk+71jw+D9sqxSlCxaSNNiWK31KOMtcOCJ2EJwdvw/0mCu/lilESyf2Yg
         79Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0dWrSJpZgMpxHVFRG9kZb8CpcNYTDRtnmDZpgsmj8Rc=;
        b=HNV/KWLkoJVVgXQsx2rPh2nDwXkv8q8I5/QvII/ke2q+dG15gpaEKwQPzHSPrtX1AC
         avAEiNe7ms228dH//9YAMZ13DqAlELVyGvGI5ZD+BedpERklYFsHsbxmz7UT68VAyiK6
         7hfnrE4q1VgpEDx1eVo8DmixGbfb9VOhQVRbvCfns9VG5J9MUsi+9lNpVRCmmrDk2W8h
         Qvfn5r/q7C5GfLm3En8kCj5v8J08hzKhEjlvcWXNeDiyECqSA70n8qbsmnVl+QId1TNh
         C1IFT4AicXICwWGQdA6TcA9UjkWF3UB/mq4cq7coftYycDjO5ZGpiz1Lul+1Z0drGpHr
         78qA==
X-Gm-Message-State: AOAM5313381R8lGprjfFH1bSPUEwJyFzH3UNP7SB1GbhukgqBqaRxvw2
	X5nEWxiiV7f4A/KPc6Elvw==
X-Google-Smtp-Source: ABdhPJxUmk0NJaqt0+4yPQJO0ZiY/x4r0Cwts2PIsVWDXopMSox53XAdL3PaTtxCFgA5pV3ndUQQpA==
X-Received: by 2002:a17:906:e08a:: with SMTP id gh10mr29017133ejb.533.1621956170435;
        Tue, 25 May 2021 08:22:50 -0700 (PDT)
Received: from localhost.localdomain ([2a02:810b:f40:e00:b55:da44:4fe2:2760])
        by smtp.googlemail.com with ESMTPSA id e23sm11212945eds.2.2021.05.25.08.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 08:22:50 -0700 (PDT)
From: Alex Bee <knaerzche@gmail.com>
To: Ezequiel Garcia <ezequiel@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Lee Jones <lee.jones@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Alex Bee <knaerzche@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 01/10] ARM: dts: rockchip: add power controller for RK322x
Date: Tue, 25 May 2021 17:22:16 +0200
Message-Id: <20210525152225.154302-2-knaerzche@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210525152225.154302-1-knaerzche@gmail.com>
References: <20210525152225.154302-1-knaerzche@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the power controller node and the correspondending qos nodes for
RK322x.
Also add the power-domain property to the nodes that are already
present.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 arch/arm/boot/dts/rk322x.dtsi | 112 ++++++++++++++++++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/arch/arm/boot/dts/rk322x.dtsi b/arch/arm/boot/dts/rk322x.dtsi
index 5774bc309eb7..c8095ede7d7a 100644
--- a/arch/arm/boot/dts/rk322x.dtsi
+++ b/arch/arm/boot/dts/rk322x.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/pinctrl/rockchip.h>
 #include <dt-bindings/clock/rk3228-cru.h>
 #include <dt-bindings/thermal/thermal.h>
+#include <dt-bindings/power/rk3228-power.h>
 
 / {
 	#address-cells = <1>;
@@ -240,6 +241,65 @@ u2phy1_host: host-port {
 				status = "disabled";
 			};
 		};
+
+		power: power-controller {
+			compatible = "rockchip,rk3228-power-controller";
+			#power-domain-cells = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			power-domain@RK3228_PD_VIO {
+				reg = <RK3228_PD_VIO>;
+				clocks = <&cru ACLK_HDCP>,
+					 <&cru SCLK_HDCP>,
+					 <&cru ACLK_IEP>,
+					 <&cru HCLK_IEP>,
+					 <&cru ACLK_RGA>,
+					 <&cru HCLK_RGA>,
+					 <&cru SCLK_RGA>;
+				pm_qos = <&qos_hdcp>,
+					 <&qos_iep>,
+					 <&qos_rga_r>,
+					 <&qos_rga_w>;
+				#power-domain-cells = <0>;
+			};
+
+			power-domain@RK3228_PD_VOP {
+				reg = <RK3228_PD_VOP>;
+				clocks =<&cru ACLK_VOP>,
+					<&cru DCLK_VOP>,
+					<&cru HCLK_VOP>;
+				pm_qos = <&qos_vop>;
+				#power-domain-cells = <0>;
+			};
+
+			power-domain@RK3228_PD_VPU {
+				reg = <RK3228_PD_VPU>;
+				clocks = <&cru ACLK_VPU>,
+					 <&cru HCLK_VPU>;
+				pm_qos = <&qos_vpu>;
+				#power-domain-cells = <0>;
+			};
+
+			power-domain@RK3228_PD_RKVDEC {
+				reg = <RK3228_PD_RKVDEC>;
+				clocks = <&cru ACLK_RKVDEC>,
+					 <&cru HCLK_RKVDEC>,
+					 <&cru SCLK_VDEC_CABAC>,
+					 <&cru SCLK_VDEC_CORE>;
+				pm_qos = <&qos_rkvdec_r>,
+					 <&qos_rkvdec_w>;
+				#power-domain-cells = <0>;
+			};
+
+			power-domain@RK3228_PD_GPU {
+				reg = <RK3228_PD_GPU>;
+				clocks = <&cru ACLK_GPU>;
+				pm_qos = <&qos_gpu>;
+			};
+
+		};
+
 	};
 
 	uart0: serial@11010000 {
@@ -546,6 +606,7 @@ gpu: gpu@20000000 {
 				  "ppmmu1";
 		clocks = <&cru ACLK_GPU>, <&cru ACLK_GPU>;
 		clock-names = "bus", "core";
+		power-domains = <&power RK3228_PD_GPU>;
 		resets = <&cru SRST_GPU_A>;
 		status = "disabled";
 	};
@@ -556,6 +617,7 @@ vpu_mmu: iommu@20020800 {
 		interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cru ACLK_VPU>, <&cru HCLK_VPU>;
 		clock-names = "aclk", "iface";
+		power-domains = <&power RK3228_PD_VPU>;
 		#iommu-cells = <0>;
 		status = "disabled";
 	};
@@ -566,6 +628,7 @@ vdec_mmu: iommu@20030480 {
 		interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cru ACLK_RKVDEC>, <&cru HCLK_RKVDEC>;
 		clock-names = "aclk", "iface";
+		power-domains = <&power RK3228_PD_RKVDEC>;
 		#iommu-cells = <0>;
 		status = "disabled";
 	};
@@ -576,6 +639,7 @@ vop: vop@20050000 {
 		interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cru ACLK_VOP>, <&cru DCLK_VOP>, <&cru HCLK_VOP>;
 		clock-names = "aclk_vop", "dclk_vop", "hclk_vop";
+		power-domains = <&power RK3228_PD_VOP>;
 		resets = <&cru SRST_VOP_A>, <&cru SRST_VOP_H>, <&cru SRST_VOP_D>;
 		reset-names = "axi", "ahb", "dclk";
 		iommus = <&vop_mmu>;
@@ -598,6 +662,7 @@ vop_mmu: iommu@20053f00 {
 		interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cru ACLK_VOP>, <&cru HCLK_VOP>;
 		clock-names = "aclk", "iface";
+		power-domains = <&power RK3228_PD_VOP>;
 		#iommu-cells = <0>;
 		status = "disabled";
 	};
@@ -608,6 +673,7 @@ rga: rga@20060000 {
 		interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cru ACLK_RGA>, <&cru HCLK_RGA>, <&cru SCLK_RGA>;
 		clock-names = "aclk", "hclk", "sclk";
+		power-domains = <&power RK3228_PD_VIO>;
 		resets = <&cru SRST_RGA>, <&cru SRST_RGA_A>, <&cru SRST_RGA_H>;
 		reset-names = "core", "axi", "ahb";
 	};
@@ -618,6 +684,7 @@ iep_mmu: iommu@20070800 {
 		interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cru ACLK_IEP>, <&cru HCLK_IEP>;
 		clock-names = "aclk", "iface";
+		power-domains = <&power RK3228_PD_VIO>;
 		#iommu-cells = <0>;
 		status = "disabled";
 	};
@@ -792,6 +859,51 @@ gmac: ethernet@30200000 {
 		status = "disabled";
 	};
 
+	qos_iep: qos@31030080 {
+		compatible = "rockchip,rk3228-qos", "syscon";
+		reg = <0x31030080 0x20>;
+	};
+
+	qos_rga_w: qos@31030100 {
+		compatible = "rockchip,rk3228-qos", "syscon";
+		reg = <0x31030100 0x20>;
+	};
+
+	qos_hdcp: qos@31030180 {
+		compatible = "rockchip,rk3228-qos", "syscon";
+		reg = <0x31030180 0x20>;
+	};
+
+	qos_rga_r: qos@31030200 {
+		compatible = "rockchip,rk3228-qos", "syscon";
+		reg = <0x31030200 0x20>;
+	};
+
+	qos_vpu: qos@31040000 {
+		compatible = "rockchip,rk3228-qos", "syscon";
+		reg = <0x31040000 0x20>;
+	};
+
+	qos_gpu: qos@31050000 {
+		compatible = "rockchip,rk3228-qos", "syscon";
+		reg = <0x31050000 0x20>;
+	};
+
+	qos_vop: qos@31060000 {
+		compatible = "rockchip,rk3228-qos", "syscon";
+		reg = <0x31060000 0x20>;
+	};
+
+	qos_rkvdec_r: qos@31070000 {
+		compatible = "rockchip,rk3228-qos", "syscon";
+		reg = <0x31070000 0x20>;
+	};
+
+	qos_rkvdec_w: qos@31070080 {
+		compatible = "rockchip,rk3228-qos", "syscon";
+		reg = <0x31070080 0x20>;
+	};
+
 	gic: interrupt-controller@32010000 {
 		compatible = "arm,gic-400";
 		interrupt-controller;
-- 
2.27.0

