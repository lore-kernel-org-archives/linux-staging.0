Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF91173
	for <linux-staging@lists.linux.dev>; Tue, 25 Jan 2022 18:21:59 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1nCQRt-0006Sa-B3; Tue, 25 Jan 2022 19:21:45 +0100
Message-ID: <19c4213b279992363080a9f36668562ddd17d1e0.camel@pengutronix.de>
Subject: Re: [PATCH V4 11/11] arm64: dts: imx8mm: Enable Hantro G1 and G2
 video decoders
From: Lucas Stach <l.stach@pengutronix.de>
To: Adam Ford <aford173@gmail.com>, linux-media@vger.kernel.org
Cc: aford@beaconembedded.com, cphealy@gmail.com, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev
Date: Tue, 25 Jan 2022 19:21:44 +0100
In-Reply-To: <20220125171129.472775-12-aford173@gmail.com>
References: <20220125171129.472775-1-aford173@gmail.com>
	 <20220125171129.472775-12-aford173@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-staging@lists.linux.dev

Am Dienstag, dem 25.01.2022 um 11:11 -0600 schrieb Adam Ford:
> There are two decoders on the i.MX8M Mini controlled by the
> vpu-blk-ctrl.  The G1 supports H264 and VP8 while the
> G2 support HEVC and VP9.
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>
> Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Reviewed-by: Lucas Stach <l.stach@pengutronix.de>

> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> index 0c7a72c51a31..98aec4421713 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> @@ -1272,6 +1272,22 @@ gpu_2d: gpu@38008000 {
>  			power-domains = <&pgc_gpu>;
>  		};
>  
> +		vpu_g1: video-codec@38300000 {
> +			compatible = "nxp,imx8mm-vpu-g1";
> +			reg = <0x38300000 0x10000>;
> +			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clk IMX8MM_CLK_VPU_G1_ROOT>;
> +			power-domains = <&vpu_blk_ctrl IMX8MM_VPUBLK_PD_G1>;
> +		};
> +
> +		vpu_g2: video-codec@38310000 {
> +			compatible = "nxp,imx8mq-vpu-g2";
> +			reg = <0x38310000 0x10000>;
> +			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clk IMX8MM_CLK_VPU_G2_ROOT>;
> +			power-domains = <&vpu_blk_ctrl IMX8MM_VPUBLK_PD_G2>;
> +		};
> +
>  		vpu_blk_ctrl: blk-ctrl@38330000 {
>  			compatible = "fsl,imx8mm-vpu-blk-ctrl", "syscon";
>  			reg = <0x38330000 0x100>;
> @@ -1282,6 +1298,12 @@ vpu_blk_ctrl: blk-ctrl@38330000 {
>  				 <&clk IMX8MM_CLK_VPU_G2_ROOT>,
>  				 <&clk IMX8MM_CLK_VPU_H1_ROOT>;
>  			clock-names = "g1", "g2", "h1";
> +			assigned-clocks = <&clk IMX8MM_CLK_VPU_G1>,
> +					  <&clk IMX8MM_CLK_VPU_G2>;
> +			assigned-clock-parents = <&clk IMX8MM_VPU_PLL_OUT>,
> +						 <&clk IMX8MM_VPU_PLL_OUT>;
> +			assigned-clock-rates = <600000000>,
> +					       <600000000>;
>  			#power-domain-cells = <1>;
>  		};
>  


