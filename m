Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CB568
	for <linux-staging@lists.linux.dev>; Fri, 26 Nov 2021 11:01:40 +0000 (UTC)
Received: by mail-ua1-f50.google.com with SMTP id ay21so17747223uab.12
        for <linux-staging@lists.linux.dev>; Fri, 26 Nov 2021 03:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VfCtaX4nYDdpJw7ayQvcL4LVofxZOCQFKwISJsQg6bs=;
        b=st1LsY3L1javWhtNrW1s+bzHDmqdKGtHJgpAXf7gEYNBtxodIgNXvEEuaQsJrUadVN
         HqgSORuLHm4AHe+/7G5BZXMXl2FM8NemGXiav0qL799Ed0xbPcMYxLV/+dBkNEeKpbDp
         z/Oy7DayhfYWWamCaAo3qM04ZByVPpEWPVGMnBHwkJmqoY2a+ajvqRiM8Wz6Mg2fgwmU
         qiKvUrNXshZgrzzmDYApeotkdMdTF9NZCwMdrPjHbZ8UVY9jfbt9bIli51OrwfwMMx6G
         1X/TnjXyRGnxRkknK2uS09DXjzugR01Y2DG/C68H5pkVIoZJjTGo9URxhiCuy9uSf0/4
         sc/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VfCtaX4nYDdpJw7ayQvcL4LVofxZOCQFKwISJsQg6bs=;
        b=KDOe0flVolzMANUgGlgMWgPhD/UW1Y0hTcAvJtmES4/KKu+xH4HbLOteru9PV0gJFE
         2uzdM4Ib6P6DFa5i54lmT0XZ1IhMpL7urWVmNouhaMKilEgtSui5Q8YyagODlIGt3P7C
         fe9t4eLWGD6u2e4Q7PHcxTmry4NlMyQ6pkIjOcyrBCjRVdvQW2kf0TfB9E7/1KmIiAG+
         Q1KOtPKwGrUC5kgVsm+PCOv+MIKSkFRgVzoSku/Jmt6PS5G2IXyzY1SclrGnbiY2u1PB
         Wdb8nzdh4sjkt1hVbnaFfdD15nwbvAiIps5gq2xdAg8snUpyZaHJ0pGE7z3HUD8zudXN
         Y+uw==
X-Gm-Message-State: AOAM530JiNcppXkor06kCBg5LerWGgz2snGnJCIaPHqP59D48Ebe/eBm
	4bEU7FpiiZnIMDGx0VTFd/QJsg==
X-Google-Smtp-Source: ABdhPJy4vNwDp7VWQDYoJrfz1AV/MW3mIe7R1va7IunkR7hg03NRJHn3eTZH3Ptcyx884GW2gGe5pQ==
X-Received: by 2002:a67:f64c:: with SMTP id u12mr15740354vso.69.1637924499584;
        Fri, 26 Nov 2021 03:01:39 -0800 (PST)
Received: from eze-laptop ([2803:9800:98c2:8470:9f4:8e2a:88e5:ec01])
        by smtp.gmail.com with ESMTPSA id i1sm3093486vkn.55.2021.11.26.03.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Nov 2021 03:01:38 -0800 (PST)
Date: Fri, 26 Nov 2021 08:01:34 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: mchehab@kernel.org, p.zabel@pengutronix.de, gregkh@linuxfoundation.org,
	hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev, kernel@collabora.com
Subject: Re: [PATCH v3 3/4] media: hantro: Use syscon instead of 'ctrl'
 register
Message-ID: <YaC+jkYwouR9Aa0s@eze-laptop>
References: <20211125155650.630977-1-benjamin.gaignard@collabora.com>
 <20211125155650.630977-4-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211125155650.630977-4-benjamin.gaignard@collabora.com>

Hi Benjamin,

On Thu, Nov 25, 2021 at 04:56:49PM +0100, Benjamin Gaignard wrote:
> In order to be able to share the control hardware block between
> VPUs use a syscon instead a ioremap it in the driver.
> To keep the compatibility with older DT if 'nxp,imx8mq-vpu-ctrl'
> phandle is not found look at 'ctrl' reg-name.
> With the method it becomes useless to provide a list of register
> names so remove it.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> 
> Please note that the only purpose of this commit is to allow to test
> G2 hardware block for IMX8MQ until a proper solution isuing power domain
> can be found. Do not merge it.

It's been too many months waiting for the BLK-CTRL to be solved.
Perhaps we can consider merging this approach instead.

Thanks,
Ezequiel

> ---
>  drivers/staging/media/hantro/hantro.h       |  5 ++-
>  drivers/staging/media/hantro/imx8m_vpu_hw.c | 48 +++++++++++++--------
>  2 files changed, 34 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
> index 7da23f7f207a..616b5a6854cd 100644
> --- a/drivers/staging/media/hantro/hantro.h
> +++ b/drivers/staging/media/hantro/hantro.h
> @@ -13,6 +13,7 @@
>  #define HANTRO_H_
>  
>  #include <linux/platform_device.h>
> +#include <linux/regmap.h>
>  #include <linux/videodev2.h>
>  #include <linux/wait.h>
>  #include <linux/clk.h>
> @@ -174,7 +175,7 @@ hantro_vdev_to_func(struct video_device *vdev)
>   * @reg_bases:		Mapped addresses of VPU registers.
>   * @enc_base:		Mapped address of VPU encoder register for convenience.
>   * @dec_base:		Mapped address of VPU decoder register for convenience.
> - * @ctrl_base:		Mapped address of VPU control block.
> + * @ctrl_base:		Regmap of VPU control block.
>   * @vpu_mutex:		Mutex to synchronize V4L2 calls.
>   * @irqlock:		Spinlock to synchronize access to data structures
>   *			shared with interrupt handlers.
> @@ -193,7 +194,7 @@ struct hantro_dev {
>  	void __iomem **reg_bases;
>  	void __iomem *enc_base;
>  	void __iomem *dec_base;
> -	void __iomem *ctrl_base;
> +	struct regmap *ctrl_base;
>  
>  	struct mutex vpu_mutex;	/* video_device lock */
>  	spinlock_t irqlock;
> diff --git a/drivers/staging/media/hantro/imx8m_vpu_hw.c b/drivers/staging/media/hantro/imx8m_vpu_hw.c
> index 1a43f6fceef9..d7a63b41eb0e 100644
> --- a/drivers/staging/media/hantro/imx8m_vpu_hw.c
> +++ b/drivers/staging/media/hantro/imx8m_vpu_hw.c
> @@ -7,6 +7,7 @@
>  
>  #include <linux/clk.h>
>  #include <linux/delay.h>
> +#include <linux/mfd/syscon.h>
>  
>  #include "hantro.h"
>  #include "hantro_jpeg.h"
> @@ -25,30 +26,28 @@
>  #define CTRL_G1_PP_FUSE		0x0c
>  #define CTRL_G2_DEC_FUSE	0x10
>  
> +static const struct regmap_config ctrl_regmap_ctrl = {
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = 0x14,
> +};
> +
>  static void imx8m_soft_reset(struct hantro_dev *vpu, u32 reset_bits)
>  {
> -	u32 val;
> -
>  	/* Assert */
> -	val = readl(vpu->ctrl_base + CTRL_SOFT_RESET);
> -	val &= ~reset_bits;
> -	writel(val, vpu->ctrl_base + CTRL_SOFT_RESET);
> +	regmap_update_bits(vpu->ctrl_base, CTRL_SOFT_RESET, reset_bits, 0);
>  
>  	udelay(2);
>  
>  	/* Release */
> -	val = readl(vpu->ctrl_base + CTRL_SOFT_RESET);
> -	val |= reset_bits;
> -	writel(val, vpu->ctrl_base + CTRL_SOFT_RESET);
> +	regmap_update_bits(vpu->ctrl_base, CTRL_SOFT_RESET,
> +			   reset_bits, reset_bits);
>  }
>  
>  static void imx8m_clk_enable(struct hantro_dev *vpu, u32 clock_bits)
>  {
> -	u32 val;
> -
> -	val = readl(vpu->ctrl_base + CTRL_CLOCK_ENABLE);
> -	val |= clock_bits;
> -	writel(val, vpu->ctrl_base + CTRL_CLOCK_ENABLE);
> +	regmap_update_bits(vpu->ctrl_base, CTRL_CLOCK_ENABLE,
> +			   clock_bits, clock_bits);
>  }
>  
>  static int imx8mq_runtime_resume(struct hantro_dev *vpu)
> @@ -65,9 +64,9 @@ static int imx8mq_runtime_resume(struct hantro_dev *vpu)
>  	imx8m_clk_enable(vpu, CLOCK_G1 | CLOCK_G2);
>  
>  	/* Set values of the fuse registers */
> -	writel(0xffffffff, vpu->ctrl_base + CTRL_G1_DEC_FUSE);
> -	writel(0xffffffff, vpu->ctrl_base + CTRL_G1_PP_FUSE);
> -	writel(0xffffffff, vpu->ctrl_base + CTRL_G2_DEC_FUSE);
> +	regmap_write(vpu->ctrl_base, CTRL_G1_DEC_FUSE, 0xffffffff);
> +	regmap_write(vpu->ctrl_base, CTRL_G1_PP_FUSE, 0xffffffff);
> +	regmap_write(vpu->ctrl_base, CTRL_G2_DEC_FUSE, 0xffffffff);
>  
>  	clk_bulk_disable_unprepare(vpu->variant->num_clocks, vpu->clocks);
>  
> @@ -211,7 +210,22 @@ static irqreturn_t imx8m_vpu_g2_irq(int irq, void *dev_id)
>  
>  static int imx8mq_vpu_hw_init(struct hantro_dev *vpu)
>  {
> -	vpu->ctrl_base = vpu->reg_bases[vpu->variant->num_regs - 1];
> +	struct device_node *np = vpu->dev->of_node;
> +
> +	vpu->ctrl_base = syscon_regmap_lookup_by_phandle(np, "nxp,imx8m-vpu-ctrl");
> +	if (IS_ERR(vpu->ctrl_base)) {
> +		struct resource *res;
> +		void __iomem *ctrl;
> +
> +		res = platform_get_resource_byname(vpu->pdev, IORESOURCE_MEM, "ctrl");
> +		ctrl = devm_ioremap_resource(vpu->dev, res);
> +		if (IS_ERR(ctrl))
> +			return PTR_ERR(ctrl);
> +
> +		vpu->ctrl_base = devm_regmap_init_mmio(vpu->dev, ctrl, &ctrl_regmap_ctrl);
> +		if (IS_ERR(vpu->ctrl_base))
> +			return PTR_ERR(vpu->ctrl_base);
> +	}
>  
>  	return 0;
>  }
> -- 
> 2.30.2
> 
