Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18926173
	for <linux-staging@lists.linux.dev>; Mon, 24 Jan 2022 17:59:45 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id x52-20020a05683040b400b0059ea92202daso7419080ott.7
        for <linux-staging@lists.linux.dev>; Mon, 24 Jan 2022 09:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BWwjW0EgyeuAgOSjmucK+gRx+PtrFHCFEX+4W9R0sEU=;
        b=YSweSEefUIGjTO7Imvy1aBv4aceTxzYRkl9vNQVQArDmVSgcsBRvXuSCtqg1Ql2fF9
         5PGUleSjA7aaCdqSfARUJPculq5XPpCzT3Vxh0XROBNnPvadRxCWDp6Xg1ZNujvsy82o
         a0QlZiE43WGqZ3GwOZFtfJJhvZIP9JPIGY7Leo7ySep+wcXRHcO9pAUf/pmutY2ukWN1
         vuL3PbmWITR77XnUNyYiAdbgcLiIDDteYWmVps5I4zkD2zdOTiZEtPAVQVGdsTWyaLzu
         ojUNlZvnnQaejg+5fHh1pQLGkDmnvzBU6VfqLG6oTCztj4XP/RLABz0mkEDJ9lcZOw7N
         VghQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BWwjW0EgyeuAgOSjmucK+gRx+PtrFHCFEX+4W9R0sEU=;
        b=ZCZDJtgQhx6A16b2nXmnLqg4MQcySCbvyBDDmljrKW40NPu3hFSZVPw0o3UwvlX/L1
         31h39Ta8cTJ0iEBeOsgjPV+V4AdMSEWBiziypVpdA7ZVACys0QnIl6jCcBjflyV8F1pu
         VEfO64ilV51Fqd4Hf+/pOBl5uT5i2lrK3dORm5RSk3LcAxBFK1xE54h5LKMSdTEezeoO
         Szy4s/vjYx+FPJJFhGXkvC4hP4TmjInRVrdy4Gw7enzDeCClfPKySJtP6iDbrAbG+1Z3
         bgPrk3azouTz/+RlYWlgG7h03suHCn4UFA2w1pRUUMhtdqnZSBdmQMAqPQypp2wTHF8E
         BLYA==
X-Gm-Message-State: AOAM531JFaeIJJLhOKaQZqiihqKqQIB+OKfiIc43XHe5Snfn5yoWOiFT
	cLCVv4eLvua0xB1NLITKUZmN5Q==
X-Google-Smtp-Source: ABdhPJySYnuZd0DI70tivFuNgNTa7ff7pGvfWbGlgF9rKiiZAQ114+3pPAVe9TWT1/FEsJ21HcSG0A==
X-Received: by 2002:a05:6830:34a3:: with SMTP id c35mr12681501otu.206.1643047184272;
        Mon, 24 Jan 2022 09:59:44 -0800 (PST)
Received: from eze-laptop ([190.194.87.200])
        by smtp.gmail.com with ESMTPSA id a128sm2663439oob.17.2022.01.24.09.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 09:59:43 -0800 (PST)
Date: Mon, 24 Jan 2022 14:59:37 -0300
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
Subject: Re: [PATCH V3 06/10] arm64: dts: imx8mq: Enable both G1 and G2 VPU's
 with vpu-blk-ctrl
Message-ID: <Ye7pCfcasWunm8F3@eze-laptop>
References: <20220124023125.414794-1-aford173@gmail.com>
 <20220124023125.414794-7-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220124023125.414794-7-aford173@gmail.com>

On Sun, Jan 23, 2022 at 08:31:20PM -0600, Adam Ford wrote:
> With the Hantro G1 and G2 now setup to run independently, update
> the device tree to allow both to operate.  This requires the
> vpu-blk-ctrl node to be configured.  Since vpu-blk-ctrl needs
> certain clock enabled to handle the gating of the G1 and G2
> fuses, the clock-parents and clock-rates for the various VPU's
> to be moved into the pgc_vpu because they cannot get re-parented
> once enabled, and the pgc_vpu is the highest in the chain.
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>
> 

Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Thanks,
Ezequiel

> diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> index 2df2510d0118..549b2440f55d 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> @@ -737,7 +737,21 @@ pgc_gpu: power-domain@5 {
>  					pgc_vpu: power-domain@6 {
>  						#power-domain-cells = <0>;
>  						reg = <IMX8M_POWER_DOMAIN_VPU>;
> -						clocks = <&clk IMX8MQ_CLK_VPU_DEC_ROOT>;
> +						clocks = <&clk IMX8MQ_CLK_VPU_DEC_ROOT>,
> +							 <&clk IMX8MQ_CLK_VPU_G1_ROOT>,
> +							 <&clk IMX8MQ_CLK_VPU_G2_ROOT>;
> +						assigned-clocks = <&clk IMX8MQ_CLK_VPU_G1>,
> +								  <&clk IMX8MQ_CLK_VPU_G2>,
> +								  <&clk IMX8MQ_CLK_VPU_BUS>,
> +								  <&clk IMX8MQ_VPU_PLL_BYPASS>;
> +						assigned-clock-parents = <&clk IMX8MQ_VPU_PLL_OUT>,
> +									 <&clk IMX8MQ_VPU_PLL_OUT>,
> +									 <&clk IMX8MQ_SYS1_PLL_800M>,
> +									 <&clk IMX8MQ_VPU_PLL>;
> +						assigned-clock-rates = <600000000>,
> +								       <600000000>,
> +								       <800000000>,
> +								       <0>;
>  					};
>  
>  					pgc_disp: power-domain@7 {
> @@ -1457,30 +1471,31 @@ usb3_phy1: usb-phy@382f0040 {
>  			status = "disabled";
>  		};
>  
> -		vpu: video-codec@38300000 {
> -			compatible = "nxp,imx8mq-vpu";
> -			reg = <0x38300000 0x10000>,
> -			      <0x38310000 0x10000>,
> -			      <0x38320000 0x10000>;
> -			reg-names = "g1", "g2", "ctrl";
> -			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
> -			interrupt-names = "g1", "g2";
> +		vpu_g1: video-codec@38300000 {
> +			compatible = "nxp,imx8mq-vpu-g1";
> +			reg = <0x38300000 0x10000>;
> +			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clk IMX8MQ_CLK_VPU_G1_ROOT>;
> +			power-domains = <&vpu_blk_ctrl IMX8MQ_VPUBLK_PD_G1>;
> +		};
> +
> +		vpu_g2: video-codec@38310000 {
> +			compatible = "nxp,imx8mq-vpu-g2";
> +			reg = <0x38310000 0x10000>;
> +			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clk IMX8MQ_CLK_VPU_G2_ROOT>;
> +			power-domains = <&vpu_blk_ctrl IMX8MQ_VPUBLK_PD_G2>;
> +		};
> +
> +		vpu_blk_ctrl: blk-ctrl@38320000 {
> +			compatible = "fsl,imx8mq-vpu-blk-ctrl";
> +			reg = <0x38320000 0x100>;
> +			power-domains = <&pgc_vpu>, <&pgc_vpu>, <&pgc_vpu>;
> +			power-domain-names = "bus", "g1", "g2";
>  			clocks = <&clk IMX8MQ_CLK_VPU_G1_ROOT>,
> -				 <&clk IMX8MQ_CLK_VPU_G2_ROOT>,
> -				 <&clk IMX8MQ_CLK_VPU_DEC_ROOT>;
> -			clock-names = "g1", "g2", "bus";
> -			assigned-clocks = <&clk IMX8MQ_CLK_VPU_G1>,
> -					  <&clk IMX8MQ_CLK_VPU_G2>,
> -					  <&clk IMX8MQ_CLK_VPU_BUS>,
> -					  <&clk IMX8MQ_VPU_PLL_BYPASS>;
> -			assigned-clock-parents = <&clk IMX8MQ_VPU_PLL_OUT>,
> -						 <&clk IMX8MQ_VPU_PLL_OUT>,
> -						 <&clk IMX8MQ_SYS1_PLL_800M>,
> -						 <&clk IMX8MQ_VPU_PLL>;
> -			assigned-clock-rates = <600000000>, <600000000>,
> -					       <800000000>, <0>;
> -			power-domains = <&pgc_vpu>;
> +				 <&clk IMX8MQ_CLK_VPU_G2_ROOT>;
> +			clock-names = "g1", "g2";
> +			#power-domain-cells = <1>;
>  		};
>  
>  		pcie0: pcie@33800000 {
> -- 
> 2.32.0
> 
