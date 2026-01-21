Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F3230EF97;
	Wed, 21 Jan 2026 02:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768960833; cv=none; b=aAQnN/8weJcQXlQYJIs1FCbcgI9JRkGunJB6pgqxihCM2EPTp2jUG4l2GqZLF8usShamPZly+77/0AiYtfDvg1M9ruS6pdyGk81AN/owNx0AhezPaG576PiHNAT74oopkd3i5VLS1l+3BWB9zQBlPOZjA2pGMak3E5EbGhX7Wd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768960833; c=relaxed/simple;
	bh=68MvO/CIzKJobttG0puN9bf9GvmXdMKv8aVGVlIIvvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rSiaPf411kveCxBrjyRAIz7nlivvRZHmdVDhIWCam1xX3Sixoa2Lqi0E/OMyyDIMejMYBpkwOr0q6VqYBxWolzw6/ZxE69X74xnQox12B/AhQlIFRERRA6fobNHtByFyOv/K569rgW7TNExeE2T6LqAE6cEzju5vUsAyc0gY7B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lbHTctrR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lbHTctrR"
Received: from pendragon.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 533952D7;
	Wed, 21 Jan 2026 02:59:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768960791;
	bh=68MvO/CIzKJobttG0puN9bf9GvmXdMKv8aVGVlIIvvc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lbHTctrRRnAh9VTEcZG/+Llnux+4ZuXWcxeW8KWnsHu26Fst/tDo2rnSOUnqbkrEv
	 GDEUH/JzuIH4+Aw8SQ4M3MT8Hfj2cO7c+fb/VDRG+EiXEyFIqRbXzabADBfrYMsjLY
	 XrWFka9VVRu0nmXPN2ir+FGznhynt0ConQuurRiY=
Date: Wed, 21 Jan 2026 04:00:21 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v2 2/5] media: staging: media: imx6-mipi-csi2: use
 devm_mutex_init() to simplify code
Message-ID: <20260121020021.GF403250@killaraus>
References: <20260116-stage-csi2-cleanup-v2-0-a56e9cb25196@nxp.com>
 <20260116-stage-csi2-cleanup-v2-2-a56e9cb25196@nxp.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260116-stage-csi2-cleanup-v2-2-a56e9cb25196@nxp.com>

On Fri, Jan 16, 2026 at 11:17:57AM -0500, Frank Li wrote:
> Use devm_mutex_init() to simplify the code. No functional change.
> 
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/staging/media/imx/imx6-mipi-csi2.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
> index 1113ea2a37f03753423164069b95c049968cc0af..4f740170d2bbf586ac0a58b5d25f8f8432e9e6a3 100644
> --- a/drivers/staging/media/imx/imx6-mipi-csi2.c
> +++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
> @@ -777,12 +777,14 @@ static int csi2_probe(struct platform_device *pdev)
>  	if (!csi2->base)
>  		return -ENOMEM;
>  
> -	mutex_init(&csi2->lock);
> +	ret = devm_mutex_init(&pdev->dev, &csi2->lock);
> +	if (ret)
> +		return ret;
>  
>  	ret = clk_prepare_enable(csi2->pllref_clk);
>  	if (ret) {
>  		v4l2_err(&csi2->sd, "failed to enable pllref_clk\n");
> -		goto rmmutex;
> +		return ret;
>  	}
>  
>  	ret = clk_prepare_enable(csi2->dphy_clk);
> @@ -805,8 +807,6 @@ static int csi2_probe(struct platform_device *pdev)
>  	clk_disable_unprepare(csi2->dphy_clk);
>  pllref_off:
>  	clk_disable_unprepare(csi2->pllref_clk);
> -rmmutex:
> -	mutex_destroy(&csi2->lock);
>  	return ret;
>  }
>  
> @@ -820,7 +820,6 @@ static void csi2_remove(struct platform_device *pdev)
>  	v4l2_async_unregister_subdev(sd);
>  	clk_disable_unprepare(csi2->dphy_clk);
>  	clk_disable_unprepare(csi2->pllref_clk);
> -	mutex_destroy(&csi2->lock);
>  	media_entity_cleanup(&sd->entity);
>  }
>  

-- 
Regards,

Laurent Pinchart
