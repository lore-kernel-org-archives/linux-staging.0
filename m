Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42AE12E2EEE
	for <linux-staging@lists.linux.dev>; Sat, 18 Apr 2026 08:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776501295; cv=pass; b=GtiXiHRRAj4sTZ6t/sUZz4DCzhEwwSd/SlxGNjiql5X7wtzX/dvcIsCZAq0rRnCrml8yA1E/zuxv0chu04JqE18U3/LYVbxE6tflsYNCUUu98vB5vdBlJZOFG0LMMTL6sn7N/LExs6LZktPwJKjKlR1cPTSHwCzMcl0iUa4uk7s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776501295; c=relaxed/simple;
	bh=Vk+WKYC9MJFvxhuoEc72GgcVrUql1/RIUpG+7O7iqmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lC9p/l5AO2vqIyMpF68vbofab52QkmZZgFpdZgAIpd3yAk9EhLPaBTahAFR0a72K9VrpOsk10IFkWa1hla3Z9sVGT76jcRNH+IxZROuYnF4y0cVMNiPREP1WeLENG86T5YC6F3y4XlZ14FggvQEQGSyWyBzfCJSNufygnsvb8qA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=KS384SZ4; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="KS384SZ4"
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4fyQ6L4gVLzyRd;
	Sat, 18 Apr 2026 11:34:50 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1776501290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8VFumqFPxxJ/V0/AYVrPQ1wwNxyjsLjsIq0+WO53W/U=;
	b=KS384SZ4tKp7c4TE4QV83L9d8uXkl41pPo300KnKxa1O35kWZlxSGYdXGSt3wJCLSMNEMD
	NRyCDSJsU519agetKX13+11NgBY/wec7Siiy9tePwTGdde3jZTuJHWNxRUS10LowdyPUD7
	RqMKwuNL82Xxy5N8pUuhMNRg9Qs0o+c=
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1776501290;
	b=rM5It7P0QdMZXWCkG/8y31p2U/1TkJFc4MhX6W2NSjm3Iy0PIK8V+sf8U7Io9S70A+7Trj
	3PpDFOaVPOwjeq5GiNicDtQtkCmMN/vH86hptNvRBf8+rPChfSHdPFLCW8ZWZ+YxpjcJkV
	k8ifyou6gh/fwzwM5vNp/eNydWZKD+E=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1776501290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8VFumqFPxxJ/V0/AYVrPQ1wwNxyjsLjsIq0+WO53W/U=;
	b=QsYvlUqlSyFIfTQk7nd/ftsLXSr/AGM6UV0d/xHjzWu/CRJ1hFsIaGZ0Sfno6MDi5L2SXU
	Hjihv914T6BRVEKZsOPlp18BxhgNq5mhNoBc9Dddl6I6nPH16ZG+FpXeU5Y6f5HNi9L/c/
	DsjFe+kFrjvQS9+f+WWoHblTjTPb/4E=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 6F076634C4E;
	Sat, 18 Apr 2026 11:34:50 +0300 (EEST)
Date: Sat, 18 Apr 2026 11:34:50 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Cc: hansg@kernel.org, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-media@vger.kernel.org
Subject: Re: [PATCH] staging: atomisp: fix block comment style in
 atomisp_cmd.c
Message-ID: <aeNCKpBqo7iPkafv@valkosipuli.retiisi.eu>
References: <20260301205910.3308-1-rayfraytech@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260301205910.3308-1-rayfraytech@gmail.com>

Hi Oskar,

On Sun, Mar 01, 2026 at 09:59:10PM +0100, Oskar Ray-Frayssinet wrote:
> Fix block comments to use the proper kernel coding style by adding
> * on subsequent lines and moving trailing */ to a separate line.
> 
> Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
> ---
>  .../staging/media/atomisp/pci/atomisp_cmd.c   | 40 ++++++++++++-------
>  1 file changed, 25 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> index fec369575d88..5bc1541b1e40 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> @@ -1381,7 +1381,8 @@ static void atomisp_update_grid_info(struct atomisp_sub_device *asd,
>  		return;
>  
>  	/* We must free all buffers because they no longer match
> -	   the grid size. */
> +	 * the grid size.
> +	 */

/*
 * Multi-line
 * comment.
 */

Same for the rest.

>  	atomisp_css_free_stat_buffers(asd);
>  
>  	err = atomisp_alloc_css_stat_bufs(asd, ATOMISP_INPUT_STREAM_GENERAL);
> @@ -1391,10 +1392,11 @@ static void atomisp_update_grid_info(struct atomisp_sub_device *asd,
>  	}
>  
>  	if (atomisp_alloc_3a_output_buf(asd)) {
> -		/* Failure for 3A buffers does not influence DIS buffers */
> +		/* Failure for 3A buffers does not influence DIS buffers. */
>  		if (asd->params.s3a_output_bytes != 0) {
>  			/* For SOC sensor happens s3a_output_bytes == 0,
> -			 * using if condition to exclude false error log */
> +			 * using if condition to exclude false error log.
> +			 */
>  			dev_err(isp->dev, "Failed to allocate memory for 3A statistics\n");
>  		}
>  		goto err;
> @@ -1687,8 +1689,9 @@ int atomisp_3a_stat(struct atomisp_sub_device *asd, int flag,
>  
>  	if (atomisp_compare_grid(asd, &config->grid_info) != 0) {
>  		/* If the grid info in the argument differs from the current
> -		   grid info, we tell the caller to reset the grid size and
> -		   try again. */
> +		 * grid info, we tell the caller to reset the grid size and
> +		 * try again.
> +		 */
>  		return -EAGAIN;
>  	}
>  
> @@ -2463,8 +2466,9 @@ int atomisp_css_cp_dvs2_coefs(struct atomisp_sub_device *asd,
>  		    memcmp(&coefs->grid, cur, sizeof(coefs->grid))) {
>  			dev_err(asd->isp->dev, "dvs grid mismatch!\n");
>  			/* If the grid info in the argument differs from the current
> -			grid info, we tell the caller to reset the grid size and
> -			try again. */
> +			 * grid info, we tell the caller to reset the grid size and
> +			 * try again.
> +			 */
>  			return -EAGAIN;
>  		}
>  
> @@ -2519,8 +2523,9 @@ int atomisp_css_cp_dvs2_coefs(struct atomisp_sub_device *asd,
>  		    memcmp(&dvs2_coefs.grid, cur, sizeof(dvs2_coefs.grid))) {
>  			dev_err(asd->isp->dev, "dvs grid mismatch!\n");
>  			/* If the grid info in the argument differs from the current
> -			grid info, we tell the caller to reset the grid size and
> -			try again. */
> +			 * grid info, we tell the caller to reset the grid size and
> +			 * try again.
> +			 */
>  			return -EAGAIN;
>  		}
>  
> @@ -3027,7 +3032,8 @@ int atomisp_param(struct atomisp_sub_device *asd, int flag,
>  
>  		/* We always return the resolution and stride even if there is
>  		 * no valid metadata. This allows the caller to get the
> -		 * information needed to allocate user-space buffers. */
> +		 * information needed to allocate user-space buffers.
> +		 */
>  		config->metadata_config.metadata_height = asd->
>  			stream_env[ATOMISP_INPUT_STREAM_GENERAL].stream_info.
>  			metadata_info.resolution.height;
> @@ -3278,7 +3284,8 @@ atomisp_bytesperline_to_padded_width(unsigned int bytesperline,
>  	case IA_CSS_FRAME_FORMAT_RGBA888:
>  		return bytesperline / 4;
>  	/* The following cases could be removed, but we leave them
> -	   in to document the formats that are included. */
> +	 * in to document the formats that are included.
> +	 */
>  	case IA_CSS_FRAME_FORMAT_NV11:
>  	case IA_CSS_FRAME_FORMAT_NV12:
>  	case IA_CSS_FRAME_FORMAT_NV16:
> @@ -3315,8 +3322,9 @@ atomisp_v4l2_framebuffer_to_css_frame(const struct v4l2_framebuffer *arg,
>  			   arg->fmt.bytesperline, sh_format);
>  
>  	/* Note: the padded width on an ia_css_frame is in elements, not in
> -	   bytes. The RAW frame we use here should always be a 16bit RAW
> -	   frame. This is why we bytesperline/2 is equal to the padded with */
> +	 * bytes. The RAW frame we use here should always be a 16bit RAW
> +	 * frame. This is why we bytesperline/2 is equal to the padded width.
> +	 */
>  	if (ia_css_frame_allocate(&res, arg->fmt.width, arg->fmt.height,
>  				       sh_format, padded_width, 0)) {
>  		ret = -ENOMEM;
> @@ -3926,7 +3934,8 @@ static inline int atomisp_set_sensor_mipi_to_isp(
>  	}
>  
>  	/* Compatibility for sensors which provide no media bus code
> -	 * in s_mbus_framefmt() nor support pad formats. */
> +	 * in s_mbus_framefmt() nor support pad formats.
> +	 */
>  	if (mipi_info && mipi_info->input_format != -1) {
>  		bayer_order = mipi_info->raw_bayer_order;
>  
> @@ -4385,7 +4394,8 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
>  			V4L2_SEL_TGT_CROP);
>  
>  	/* Try to enable YUV downscaling if ISP input is 10 % (either
> -	 * width or height) bigger than the desired result. */
> +	 * width or height) bigger than the desired result.
> +	 */
>  	if (!IS_MOFD ||
>  	    isp_sink_crop.width * 9 / 10 < f->fmt.pix.width ||
>  	    isp_sink_crop.height * 9 / 10 < f->fmt.pix.height ||

-- 
Regards,

Sakari Ailus
