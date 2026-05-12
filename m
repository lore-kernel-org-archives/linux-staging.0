Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CD548124F
	for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 07:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778571990; cv=none; b=S2n+x+EceWuEJJbHaCHjse5+6qY814TZm3nSStho7uj3ZHLS2Jo1GKaPJXMxlp4UjgciM4/bybXR3DI+kup/jRRPvxDk58WLOvgXCLjTrC2fovgH29ae5dFnl72DgyITHie5myZIB9tJE/2OK4e7v9F718lYW8XnUGeTqxZPyoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778571990; c=relaxed/simple;
	bh=R0ToAlzpi8O9RonCUOJfjicwYLthpIGNBfL+IRceIWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eQuWX451gP7bi0GqW6KFs24tDE0pstvuLIcgYQAnGVdS1DEfr0lqEe1l2LaWRFWGzxnEj4GXaCNpeu5PsfhGRtOeEYLfFeubTpA5smLi9DK6WG+K4lKmCJexZHWcC5LPLblOKGFDccBJ8yALbSCKYvuIQ9Uvc5lHK9O0SscSl3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=El/3scCU; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="El/3scCU"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-44a044cb827so4051384f8f.0
        for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 00:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778571984; x=1779176784; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dVy/L8Jze54TojCR0KZX0SV4kvXWoRSdNBWT9WiqX2M=;
        b=El/3scCUaizv2XR+WPPjJ3YAdOv5rd7ygfwrF+pBdQAvzr4vKBM734i1Df7TYWSmj1
         gBLjrYuLPqnQC4OsAIwqu8fEnS8wsl6zP9M4fSFZ8CqNqfg9Mb6XDErRJ7K6tsUVlZkR
         R10bilP5OKjgeG78tVPyypcekLi3Gt/Ch3fxii71KLU87s42uBLwSLi3F4mP6++ciTrE
         IZWE9KGsbUyWaz0YHE0/KENNZRtBeE6U9aotM/YxPgwnT7Rb1QJ/PwM62OnLEIdt9UPj
         AFaDKcuVaCewv9kJYyA7J5OdbQZPQ1qGf7SVd3UslHw6HQO7ZfGQ4khu9ms8xXfkJPK4
         e4Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778571984; x=1779176784;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dVy/L8Jze54TojCR0KZX0SV4kvXWoRSdNBWT9WiqX2M=;
        b=qFqFlXMxtnakCHNzKqoYqr4tvZz5o8trtfFigLkA+iN+nYeCpAoBtIv2U82Py9Y1BH
         zZC/1Dq9rsc/Elt7YLjobZ5ME/hSSg85/E70cp1kxAAaR9FUFGYzWC5bBpq48GVWpFWt
         k+VTrkop56ILfWzIjEHB/wPFL7gegF8LbeKReigby7ojybcB9wNIS6UVsH+vPLNX2i1I
         KHVzlhjThx6PL/7N1pnaxF6rWSVBnpSDX25n26PMZDu+haFxNqHWVtwcTPQlKpOVisEz
         fFskazhRaOY5Sb/3iIga+2ZIZ0Y2oG4hrGdORd7EWjad+ib75xB1pG3uJbONgnnm33Vx
         J3rw==
X-Forwarded-Encrypted: i=1; AFNElJ9q03+Yu/f1QMqPt/hU5mPLAkN/dtGRrtGb/3TPQly/RSYP4MsfHEIx7fYo3shYX/8Szsdt9BYkV8xEKw9O@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3e6uKMEIWb2TsQLwT6g80rB83B+YVcZA9V58+589BFK8QDDgR
	UFT+bhKeuvcVq+ncDjE7Jx5qn50YGmsPfyoifUF8CHCzBVaP3esJbK3K
X-Gm-Gg: Acq92OEBTaQgTU63kSMvS3YzvMvOoj+Zbic5/0LCN2osHVF9BuxsInSceAnTkHZMUYW
	CA7RU/nfetI0iU0un7aAtqqNItTdsBMIQ56D68I3b+vM6ZkTKXtySwM5jQm7V12goA2j4QpkV/g
	ATLbZb7hW4un2MS/mF1DpbkXIx11ExVoddemxilHC/fNuzZB3fabDirNNX1mOYKj443GtJo1RMw
	l74rE1ieR+npOW1q4W4cIB0xXcqyqVaY/KJ5SDa7DSNC1c3jZr4TTQnMjIEIayjHj+oc2EUnx1b
	FuNnn5kqYIOCS1AlM7uyKR9wpprjZVlNKdNhRSB1Y/uyusH1pp+8Rg88RAS6RzouBROSPmVqvkJ
	c18ssLnZpkBHNU1lPbSkOPLmqOCVxS4IRrlbvLDpI+XmnVQ4pnurPRAremRgZo14yI1M7+K/70D
	xYUYC+fNLebR1OqytssTU=
X-Received: by 2002:a05:6000:40dc:b0:43d:309b:9c4f with SMTP id ffacd0b85a97d-4515b056c90mr43494569f8f.6.1778571983812;
        Tue, 12 May 2026 00:46:23 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e6a6a64sm32142308f8f.6.2026.05.12.00.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 00:46:23 -0700 (PDT)
Date: Tue, 12 May 2026 10:46:20 +0300
From: Dan Carpenter <error27@gmail.com>
To: Shayaun Nejad <snejad123@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: bound DVS 6-axis config copy
 size against allocated grid
Message-ID: <agLazHI_ulhM5eFQ@stanley.mountain>
References: <20260512014514.22856-1-snejad123@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512014514.22856-1-snejad123@gmail.com>

On Mon, May 11, 2026 at 06:45:14PM -0700, Shayaun Nejad wrote:
> atomisp_cp_dvs_6axis_config() copies user-provided coordinate arrays into
> a 6-axis grid allocated from ISP dimensions.
> 
> The copy sizes are computed from the user width and height fields, so
> mismatched or overflowing dimensions can copy past the allocated buffers.
> 
> Reject dimensions that do not match the allocated config and compute the
> copy sizes with array3_size() before copying.
> 
> Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
> Cc: stable@vger.kernel.org
> Signed-off-by: Shayaun Nejad <snejad123@gmail.com>
> ---
>  .../staging/media/atomisp/pci/atomisp_cmd.c   | 84 ++++++++++++-------
>  1 file changed, 52 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> index fec369575d..677037f1da 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> @@ -14,6 +14,7 @@
>  #include <linux/kernel.h>
>  #include <linux/kfifo.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/overflow.h>
>  #include <linux/timer.h>
>  
>  #include <asm/iosf_mbi.h>
> @@ -2570,6 +2571,29 @@ int atomisp_css_cp_dvs2_coefs(struct atomisp_sub_device *asd,
>  	return 0;
>  }
>  
> +static int atomisp_dvs_6axis_size(struct ia_css_dvs_6axis_config *config,
> +				  u32 width_y, u32 height_y,
> +				  u32 width_uv, u32 height_uv,
> +				  size_t *y_size, size_t *uv_size)
> +{
> +	if (config->width_y != width_y ||
> +	    config->height_y != height_y ||
> +	    config->width_uv != width_uv ||
> +	    config->height_uv != height_uv)
> +		return -EINVAL;
> +
> +	*y_size = array3_size(width_y, height_y, sizeof(*config->xcoords_y));
> +	if (*y_size == SIZE_MAX)
> +		return -EINVAL;
> +
> +	*uv_size = array3_size(width_uv, height_uv,
> +			       sizeof(*config->xcoords_uv));
> +	if (*uv_size == SIZE_MAX)
> +		return -EINVAL;
> +
> +	return 0;
> +}

This commit doesn't make sense.  Any time people end up checking
size_mul() type calculations for SIZE_MAX it's probably a sign things
have gone wrong.  You're supposed to just pass it along and let
regular bounds checking handle it.  It's not like ULONG_MAX is a special
sort of "extra bad" invalid number.

So we have some math here and if it equals >= ULONG_MAX then it's
invalid.

> +
>  int atomisp_cp_dvs_6axis_config(struct atomisp_sub_device *asd,
>  				struct atomisp_dvs_6axis_config *source_6axis_config,
>  				struct atomisp_css_params *css_param,
> @@ -2582,6 +2606,8 @@ int atomisp_cp_dvs_6axis_config(struct atomisp_sub_device *asd,
>  	struct ia_css_dvs_grid_info *dvs_grid_info =
>  	    atomisp_css_get_dvs_grid_info(&asd->params.curr_grid_info);
>  	int ret = -EFAULT;
> +	size_t y_size;
> +	size_t uv_size;
>  
>  	if (!stream) {
>  		dev_err(asd->isp->dev, "%s: internal error!", __func__);
> @@ -2628,35 +2654,32 @@ int atomisp_cp_dvs_6axis_config(struct atomisp_sub_device *asd,
>  				return -ENOMEM;
>  		}
>  
> +		ret = atomisp_dvs_6axis_size(dvs_6axis_config,
> +					     t_6axis_config.width_y,
> +					     t_6axis_config.height_y,
> +					     t_6axis_config.width_uv,
> +					     t_6axis_config.height_uv,
> +					     &y_size, &uv_size);
> +		if (ret)
> +			goto error;
> +
>  		dvs_6axis_config->exp_id = t_6axis_config.exp_id;
>  
>  		if (copy_from_compatible(dvs_6axis_config->xcoords_y,
>  					t_6axis_config.xcoords_y,
> -					t_6axis_config.width_y *
> -					t_6axis_config.height_y *
> -					sizeof(*dvs_6axis_config->xcoords_y),
> -					from_user))
> +					y_size, from_user))

But it the result stored in y_size is ULONG_MAX - 1 then we copy that
number of bytes from the user.

regards,
dan carpenter


