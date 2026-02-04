Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D033E3876AE
	for <linux-staging@lists.linux.dev>; Wed,  4 Feb 2026 09:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770198901; cv=none; b=CN6+UMQ8S/dWYD2fnH07itOPkewCk2ExWrzCR4dZ/oezqCZEIDyPejN9yKO8z1Zy8+MttaThYJsIOggNbUO1ViauKca6SW+uauzVhn93R9lder9qcq6g728di9VgM77bQu1G9OLCXSYWooHa/DJTNsV4C7K9Kw/hsZwJy9ylXWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770198901; c=relaxed/simple;
	bh=2aEGICgv4bxXiXPhsJw4IMaBED1j0QSOmrVqCfpF5KQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RFx0McGvy9236WZq31NJZ8QXrbj8aUrwU5it9pA8CKhV5viqiCIECYoWiFH/a2ofj2DLCVLdLoayXvmWbM5lcQ8nr6VH1RNrZ/Zi/Tt/xu+F5n2SORYSY4Um0XQQ0Voa4UwMC8fqHeMy/+Su9hb56oV28MBFRtek8ko7uneuYRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dul9rQPe; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dul9rQPe"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-432d2670932so5929036f8f.2
        for <linux-staging@lists.linux.dev>; Wed, 04 Feb 2026 01:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770198899; x=1770803699; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lvrA8hqF+2GJh2eq2gkM3eufhG0u6gBuPTVV3tQLeYQ=;
        b=dul9rQPeyBWHaUrR++HLeogCLqDhmSDveU4E445jx2asJwVz+9T25D8/CNxxKiX2Fo
         mZqoUayd2HfAiraYvvjvQFD9m/GtkfXZa9ueUS3ILYJbXwAZ8dPe6iHIAPrVFG5Cg565
         5lY9yfBeA/x9ZFiCMeWp3fjrID/XUlc81FJT4zf/7wqS7Y1sYxBw/A4GdmgL8V054lhp
         LDWUGPvGJS79Eu5BVmYmb8ieNJqy2IXVI6B2GRY+yZoeXNeXP2QP34UYZ99OQD/zxLu6
         OsIZdpoq9KlcD1DeIqKboF8YS4GfF3Sq2rv/QLfv7Fy+oON9tO2TNyofdwV+6HRGEqVm
         K5Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770198899; x=1770803699;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lvrA8hqF+2GJh2eq2gkM3eufhG0u6gBuPTVV3tQLeYQ=;
        b=u3k+86gRDe949BwwP8ATpL29hBdOGEfJtCFhpB/9BRif8FJHR/rqNWee/Swz+qL3Ts
         Zgb2PL6Xkliqehzc0eghZK0QgpbUIM6B74X3LtHjX3wES2aaE3ukQU8iITiVYL8Nf+yl
         Uyv3rlwqj7/w4a+kqEhYFCWzER/YnEk/0HsjIcEKpXHrdv6xEXCKzyrWkq1xBrN9gubE
         ySs+w4qftO3BXlQaJgIbkoOPlnaTG8+DVre/Mstdi7rYHDAkt4vGzEnq66gsSidfzXdx
         X5CTnCZckfmC/HrxJGjCFe5e0zaaoaZzu9O+/5s1FR0Fe77ZCIRPo2mc1k3zdWrHdPdG
         q/pQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9YhCDNaG46gfCEau3xiUaVyKonMMNXEO+vTW+pETg+gsLZyE7NJowVvh+W633YJVDQlVaHw5odG8/gdba@lists.linux.dev
X-Gm-Message-State: AOJu0Yzhv68KZLYI2pspY2LlU264BjQljXUGh1mpq/+RjvtGs2nWIBrF
	fplFUYwA23toqoSQ7U7eEmH+4vte7IDN2MLl/RxXMaLSQPkEZnXiEq1rDyTvTWakUgY=
X-Gm-Gg: AZuq6aJR9j0BqAoeW6cyVEUiN74oPsdKd+sw/EdOCKZlHupBxSiMC4bMrQIyUWA1cWk
	F5cSeauFzlCP4q0TiI8Lcn5zy6HbXYx+S0Kfe78PCW1w2oRl73xQw4ilOrny/pQmbqNEGfcVMRI
	VUzeS5HlExIiYkJbPFC3HJ/wllyhgMqXXb9tRzdK3dGNjPg6kuvmCxdS2y1ImKbmKOkTCJ01D/T
	ORC0ND+/qNs3cf3QMzOw3pf6JjgpMAMix4FD/m7/WT52eLa38Ttfd9sFZ8X/7loi18HpHTqqRV8
	E87VDZpU9E2s2Q2HriWloZugLKtAlzKy5lvd3a4C1g7ee3OqJ6ZN1/sRoJITvYIzSFsjDhr5v2h
	JwNDnngGHbOi2uaJLbogFuLcdifVksBHZq16t7ndNqpxRlRsdEM2VbNj4qVZGEuZeA1kG+FAMTw
	W895/EjmR9KPbxmysf
X-Received: by 2002:a05:6000:18a7:b0:431:9dd:2cca with SMTP id ffacd0b85a97d-43617e34586mr3101767f8f.7.1770198899081;
        Wed, 04 Feb 2026 01:54:59 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4361805faf7sm5088608f8f.30.2026.02.04.01.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 01:54:58 -0800 (PST)
Date: Wed, 4 Feb 2026 12:54:55 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Artem Lytkin <iprintercanon@gmail.com>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] staging: sm750fb: convert pr_* to dev_* logging in
 sm750.c
Message-ID: <aYMXb9ndJnisl-zP@stanley.mountain>
References: <20260203230758.3056-1-iprintercanon@gmail.com>
 <20260203230758.3056-3-iprintercanon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203230758.3056-3-iprintercanon@gmail.com>

On Tue, Feb 03, 2026 at 11:07:57PM +0000, Artem Lytkin wrote:
> Convert pr_info/pr_err/pr_debug/pr_warn calls to their dev_*
> equivalents in functions where device context is available via
> info->device or par->dev->pdev->dev. This adds device identification
> to log messages, improving debuggability in multi-device systems.
> 
> Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>
> ---
>  drivers/staging/sm750fb/sm750.c | 107 ++++++++++++++++----------------
>  1 file changed, 54 insertions(+), 53 deletions(-)
> 
> diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
> index bd2d4a290..247c58556 100644
> --- a/drivers/staging/sm750fb/sm750.c
> +++ b/drivers/staging/sm750fb/sm750.c
> @@ -375,7 +375,7 @@ static int lynxfb_ops_set_par(struct fb_info *info)
>  	line_length = var->xres_virtual * var->bits_per_pixel / 8;
>  	line_length = ALIGN(line_length, crtc->line_pad);
>  	fix->line_length = line_length;
> -	pr_info("fix->line_length = %d\n", fix->line_length);
> +	dev_info(info->device, "fix->line_length = %d\n", fix->line_length);

Just delete this sort of thing.

>  
>  	/*
>  	 * var->red,green,blue,transp are need to be set by driver
> @@ -389,7 +389,8 @@ static int lynxfb_ops_set_par(struct fb_info *info)
>  	var->accel_flags = 0;/*FB_ACCELF_TEXT;*/
>  
>  	if (ret) {
> -		pr_err("bpp %d not supported\n", var->bits_per_pixel);
> +		dev_err(info->device, "bpp %d not supported\n",
> +			var->bits_per_pixel);
>  		return ret;
>  	}
>  	ret = hw_sm750_crtc_set_mode(crtc, var, fix);
> @@ -485,15 +486,16 @@ static int lynxfb_ops_check_var(struct fb_var_screeninfo *var,
>  	par = info->par;
>  	crtc = &par->crtc;
>  
> -	pr_debug("check var:%dx%d-%d\n",
> -		 var->xres,
> -		 var->yres,
> -		 var->bits_per_pixel);
> +	dev_dbg(info->device, "check var:%dx%d-%d\n",
> +		var->xres,
> +		var->yres,
> +		var->bits_per_pixel);
>  
>  	ret = lynxfb_set_color_offsets(info);
>  
>  	if (ret) {
> -		pr_err("bpp %d not supported\n", var->bits_per_pixel);
> +		dev_err(info->device, "bpp %d not supported\n",
> +			var->bits_per_pixel);
>  		return ret;
>  	}
>  
> @@ -508,7 +510,7 @@ static int lynxfb_ops_check_var(struct fb_var_screeninfo *var,
>  	request = ALIGN(request, crtc->line_pad);
>  	request = request * var->yres_virtual;
>  	if (crtc->vidmem_size < request) {
> -		pr_err("not enough video memory for mode\n");
> +		dev_err(info->device, "not enough video memory for mode\n");
>  		return -ENOMEM;
>  	}
>  
> @@ -533,7 +535,7 @@ static int lynxfb_ops_setcolreg(unsigned int regno,
>  	ret = 0;
>  
>  	if (regno > 256) {
> -		pr_err("regno = %d\n", regno);
> +		dev_err(info->device, "regno = %d\n", regno);
>  		return -EINVAL;
>  	}
>  
> @@ -580,10 +582,10 @@ static int lynxfb_ops_blank(int blank, struct fb_info *info)
>  	struct lynxfb_par *par;
>  	struct lynxfb_output *output;
>  
> -	pr_debug("blank = %d.\n", blank);
>  	par = info->par;
>  	output = &par->output;
>  	sm750_dev = par->dev;
> +	dev_dbg(info->device, "blank = %d.\n", blank);
>  
>  	if (sm750_dev->revid == SM750LE_REVISION_ID)
>  		return hw_sm750le_set_blank(output, blank);
> @@ -625,7 +627,7 @@ static int sm750fb_set_drv(struct lynxfb_par *par)
>  		crtc->channel = sm750_primary;
>  		crtc->o_screen = 0;
>  		crtc->v_screen = sm750_dev->pvMem;
> -		pr_info("use simul primary mode\n");
> +		dev_info(&par->dev->pdev->dev, "use simul primary mode\n");

Is this useful?

>  		break;
>  	case sm750_simul_sec:
>  		output->paths = sm750_pnc;
> @@ -767,7 +769,7 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
>  	crtc->cursor.mmio = sm750_dev->pvReg +
>  		0x800f0 + (int)crtc->channel * 0x140;
>  
> -	pr_info("crtc->cursor.mmio = %p\n", crtc->cursor.mmio);
> +	dev_info(info->device, "crtc->cursor.mmio = %p\n", crtc->cursor.mmio);

Delete.  Okay, follow the same pattern and delete the debug
code which is printed as _info.

regards,
dan carpenter

