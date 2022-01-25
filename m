Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9166173
	for <linux-staging@lists.linux.dev>; Tue, 25 Jan 2022 16:48:09 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id 10-20020a9d030a000000b0059f164f4a86so9518902otv.13
        for <linux-staging@lists.linux.dev>; Tue, 25 Jan 2022 08:48:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=T+/85uEpu2eNGNWD/5sNn1BpuagkYZLYJyTVK41DIzg=;
        b=47+BmtZtou4NgWMqWFzPj44eXxCp4g8Py4gfRKN0aqs6+3kLX5R+LnAdpsgCatY21K
         VSPva87aSIVmuGWoh0uDg2Pb8v8zvKWtEWTM0ur5k9KWk5/0mr7cd0Zr9SrEX484Q/lu
         mEyKfgPi1rIRTUE4BM8GG1ivH842WQduqi0y6EW99HHrM51LTb8WBwqVm0Z5IwAm3hl1
         AYFOi1/lE2MZ9HUlhac2QEqZk8z2uYbEBUd4M6fP39XSC9gZLHvn55X0Mbk5/pxlFp9z
         Tc8eKughnD0QrvI2UIEcaHwHE7HvowgDeQWi71MsOmKI0F1/pzIKeksHCl6MOk8ymEaN
         GaNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=T+/85uEpu2eNGNWD/5sNn1BpuagkYZLYJyTVK41DIzg=;
        b=DAbYOFytUrgj0uwBfe6+DolfarC2qWQS865enTtHJwXw5Gh2VNGmME/EGPmdKahTS+
         IJIKkmue2LzMJFLfmuKHxMAtbosb3o0yp3QgfIFyqGolLagQ2VeLwJ7qLd0m+TG0zlhB
         Ut67pfjYY/vBVzL9n0d5miLiFke3FGdVe6wZkjXmVdye39CU9VRjZjSNT4Zmfh42aIcV
         9zrJ1potbvUQdYiZD+NDXrH5IsRa1EkbvP5d99+Cje8c4/HekgCrzhQgM30kyI0liV3y
         tGuKhscADxCDle9377Ce8zVigiHXzvqgkDZmiTQVBUx4OEFfU51Ve93VyS52fYz7kxNR
         4Q4A==
X-Gm-Message-State: AOAM5304sLFwZ651RRJdz3W+2FhoZPg5RO09rKvlhBG/p6ZeDkHYlZaX
	RyuMiJcmNR53xPQbS4OhY49N+A==
X-Google-Smtp-Source: ABdhPJxWeJgYFK/ES63uSI9wOGCbRto0EWrjGp0VbBNHViImFHdqyepe2K445KbXZQtPfMBmVOg2cQ==
X-Received: by 2002:a9d:76d2:: with SMTP id p18mr16032229otl.226.1643129288610;
        Tue, 25 Jan 2022 08:48:08 -0800 (PST)
Received: from eze-laptop ([186.122.18.78])
        by smtp.gmail.com with ESMTPSA id j19sm3696308ots.21.2022.01.25.08.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 08:48:07 -0800 (PST)
Date: Tue, 25 Jan 2022 13:48:00 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Adam Ford <aford173@gmail.com>
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	shawnguo@kernel.org, aford@beaconembedded.com,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lucas Stach <l.stach@pengutronix.de>,
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH V3 10/10] arm64: dts: imx8mm: Enable Hantro G1 and G2
 video decoders
Message-ID: <YfApwHMi5IYxHtq8@eze-laptop>
References: <20220124023125.414794-1-aford173@gmail.com>
 <20220124023125.414794-11-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220124023125.414794-11-aford173@gmail.com>

Hi Adam,

On Sun, Jan 23, 2022 at 08:31:24PM -0600, Adam Ford wrote:
> There are two decoders on the i.MX8M Mini controlled by the
> vpu-blk-ctrl.  The G1 supports H264 and VP8 while the
> G2 support HEVC and VP9.
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>
> 

Looks good.

Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Thanks,
Ezequiel

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
> -- 
> 2.32.0
> 
