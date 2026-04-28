Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3953449EB1
	for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 13:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777382032; cv=none; b=Nfb44p1NuC20cm5zp7DS/0Z7U2QO6P93I+bQDpRpyBFyNzHLPAjJCp6NU56FEna1WWLcb0fKJeaSaErXrEvq19FS6ug4UcIh9ObxHt71Dzn5hqrYxEe2ZXH0TUgTUjUle1Z4Glq+xlVC2BnWbTM2qs6mp7lwOsn74/qUCPzlZVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777382032; c=relaxed/simple;
	bh=rrjVACIA0tDdu4OAwbSO6tipJTZ32V16GMgRgCa2LNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sHPOhicilJTeQOQEqdw2PWUMHuMQ2UM077VqlcEyRdeW4WTzBJouQkaa46G/Z1POxRVuhozXcH7yQYdcRSZIRC61juJJc/yOf20pNQWFm0A3KRY6IHY8JAGVxCweUtph2ys3nXxWFW6hauVi0T8cKIE9mVxWUr322j/DMf/KCBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UBRHyx+A; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UBRHyx+A"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 62AF2E91;
	Tue, 28 Apr 2026 15:12:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777381926;
	bh=rrjVACIA0tDdu4OAwbSO6tipJTZ32V16GMgRgCa2LNE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UBRHyx+A1NTHlZxV+Urcv8BpE/uePhLwxwZPP/QyIMhfHgzgl7uxEjEciaNTK3nen
	 OAlAEQy/+g5qpG/VNn7xOofRisSKnFnFwUORdzfjlHsbRLUNiY3cKpI1OgFB9n+jpn
	 beAwzUS1XCB5ikZRu/2RSpwdwSDWNIUmURdA0+fI=
Date: Tue, 28 Apr 2026 16:13:47 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Nas Chung <nas.chung@chipsnmedia.com>,
	Jackson Lee <jackson.lee@chipsnmedia.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Keke Li <keke.li@amlogic.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 5/6] media: staging: ipu3-imgu: Add range check for
 imgu_css_cfg_acc_stripe
Message-ID: <20260428131347.GB120836@killaraus.ideasonboard.com>
References: <20260428-smatch-7-1-v1-0-46890dffb611@chromium.org>
 <20260428-smatch-7-1-v1-5-46890dffb611@chromium.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260428-smatch-7-1-v1-5-46890dffb611@chromium.org>

On Tue, Apr 28, 2026 at 12:41:11PM +0000, Ricardo Ribalda wrote:
> If the driver's stripe information is invalid it can result in an integer
> overflow. Add a range check with a WARN_ON to expose this kind of
> error.
> 
> This patch fixes the following smatch error:
> drivers/staging/media/ipu3/ipu3-css-params.c:1792 imgu_css_cfg_acc_stripe() warn: 'acc->stripe.bds_out_stripes[0]->width - 2 * f' 4294967168 can't fit into 65535 'acc->stripe.bds_out_stripes[1]->offset'
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/staging/media/ipu3/ipu3-css-params.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/ipu3/ipu3-css-params.c b/drivers/staging/media/ipu3/ipu3-css-params.c
> index 2c48d57a3180..6ed23c7a0c3f 100644
> --- a/drivers/staging/media/ipu3/ipu3-css-params.c
> +++ b/drivers/staging/media/ipu3/ipu3-css-params.c
> @@ -1770,6 +1770,8 @@ static int imgu_css_cfg_acc_stripe(struct imgu_css *css, unsigned int pipe,
>  		acc->stripe.bds_out_stripes[0].width =
>  			ALIGN(css_pipe->rect[IPU3_CSS_RECT_BDS].width, f);
>  	} else {
> +		u32 offset;
> +
>  		/* Image processing is divided into two stripes */
>  		acc->stripe.bds_out_stripes[0].width =
>  			acc->stripe.bds_out_stripes[1].width =
> @@ -1788,8 +1790,10 @@ static int imgu_css_cfg_acc_stripe(struct imgu_css *css, unsigned int pipe,
>  			acc->stripe.bds_out_stripes[1].width += f;
>  		}
>  		/* Overlap between stripes is IPU3_UAPI_ISP_VEC_ELEMS * 4 */
> -		acc->stripe.bds_out_stripes[1].offset =
> -			acc->stripe.bds_out_stripes[0].width - 2 * f;
> +		offset = acc->stripe.bds_out_stripes[0].width - 2 * f;
> +		if (WARN_ON(offset > 65535))

If this can be triggered by userspace it shouldn't WARN_ON().

> +			return -EINVAL;
> +		acc->stripe.bds_out_stripes[1].offset = offset;
>  	}
>  
>  	acc->stripe.effective_stripes[0].height =

-- 
Regards,

Laurent Pinchart
