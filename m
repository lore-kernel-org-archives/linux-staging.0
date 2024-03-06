Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5A313248C
	for <linux-staging@lists.linux.dev>; Wed,  6 Mar 2024 14:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709735023; cv=none; b=i8No8B3MFGvv1svKgLevSWKtHCG7KLXdr7WnD8vEtKwXUnjWp83y2W5dOg6NWE+9MePgk1D7DGf8KVay4hk7StgkS8DJewu7HSAXO3Ba2BY7MJQN3s1921yjZ1lUy1HDgUibPVkh7j5XwuRKYShIf2II3uqGQz4sVa9YX8EOnQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709735023; c=relaxed/simple;
	bh=wWtAyzQ2eyj1PNsc5Aylj7VkYcp64jWdRu1hy0W+UZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sEsRlFDowrIJWYFvvYFoH5tdj1H3OgLf0BNEUxBXsNBaI0UIVEDAOmWiRvAD77RMROlrHSsBNE4I1jt3DTSGEUexMayAfeR3rY7bzLUYKNQbSs7wWMf8SzrXyIg8bP6T8fYFlL2PpBASf3qfqbJVYlE0tBRBGlNT3XGjlLAL6RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m6c350aY; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m6c350aY"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-512ed314881so6556557e87.2
        for <linux-staging@lists.linux.dev>; Wed, 06 Mar 2024 06:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709735018; x=1710339818; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FWpAe22ZCtZ5eNl+BAwXkR2RWIIxHugyeXcFlN6Srtw=;
        b=m6c350aYIKY3wbB2Vls863fwNBspZpviHVo6Npfy+RqP+Qj+SGcL/9vZi8V/q6MBM+
         Zs1hu9WBZChJD1g35rJcoCSHR4V/zZUo+hC3DlxNi4/u+AL2zS84xdnvxoHH5dhu/O3d
         jQ+1QNW59rDyG3OGnPhuROqicgYkTq9JFG43tSXNPoSrcDJ73KHf6hDlZVSEnsmHsvTk
         rz+sGjoWkNhXYUpQ/19QMXPrBQVcN63iBcx/DWJtmamcBMw/u6EbohnAvbYkBNJL0Tm8
         Wu2yklOuAFcN7PMX+VV9tzlCsr8AgPTJY5O+ZXE/wk0BCwG8l44wiQ5A9wHRYkSd/ZMJ
         94/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709735018; x=1710339818;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FWpAe22ZCtZ5eNl+BAwXkR2RWIIxHugyeXcFlN6Srtw=;
        b=D71lAqanlexijllsCqJWMVMJZTYscdeSuvBoc5VgwY2a2OKQY8SLhWZBYO9TCuNn6j
         jYboSy7NDGBmGEjWnMcK6NVTP1L6/uVLhNbKfEHzQKSzmJn8P/68P+cMkoq10xpc3Qt2
         wvE+Y7uGioOth/2U6ka0texnRcllwmJ6lUftpVumnEN99ln1VLMfwXaxyNeAcSIzyBwn
         hNCmCXNEMWDWeSE+57Eq/s301u256D+R4g+1ibczkKPe5fsHGf5y4EgkM8Votf7g+OsY
         Adtx0LqvzobSM3HvqTiGtmuIDVyDl1ZMovlVmtd/V7vSlnANLI61XaVrWkbmwYo3y0rp
         6L1g==
X-Forwarded-Encrypted: i=1; AJvYcCWpGe44na0SandCqDmvQLop2CK17uBOUymHRjJVuLMdpwOyw+WTLFpD0FZpZQBRaj0+IoWQTfOYoZY3p/iRc3OsnHeuuE/EB1QQSrSQzA==
X-Gm-Message-State: AOJu0YyrLM3sU/eAl9hyICvX+S45d2ewlkqmJCg1FGoPhrWMPS5gvpuj
	jPp42Esv8lSRauKReHkcNjDDGCcHrVSJCn06nMvdEvyPn11kiN51pJ4EJbgfhss=
X-Google-Smtp-Source: AGHT+IFEPqlIv/3Y/Zi3m//vC0Az3HmKtpwp8kiu+mg/iRghQHpj3gg8+eWTlQn1ycox43TLImj/XQ==
X-Received: by 2002:a19:3846:0:b0:513:3e1a:75af with SMTP id d6-20020a193846000000b005133e1a75afmr2876327lfj.16.1709735018288;
        Wed, 06 Mar 2024 06:23:38 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id t16-20020a05600c451000b00412ee12d4absm4838035wmo.31.2024.03.06.06.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 06:23:38 -0800 (PST)
Date: Wed, 6 Mar 2024 17:23:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jack Zhu <jack.zhu@starfivetech.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v1 2/7] staging: media: starfive: Add raw pad for ISP
Message-ID: <4d54e516-448a-47ce-abcd-e705896935a7@moroto.mountain>
References: <20240306093334.9321-1-changhuang.liang@starfivetech.com>
 <20240306093334.9321-3-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240306093334.9321-3-changhuang.liang@starfivetech.com>

On Wed, Mar 06, 2024 at 01:33:29AM -0800, Changhuang Liang wrote:
> Add raw pad for ISP, it supported the conversion of RAW10 into RAW12.
> 

To be honest, I don't understand what "it supported the conversion of
RAW10 into RAW12" means.  I don't think that this patch has any impact
on user space but I'm not 100% sure.

A lot of this patch is just reformating stuff and it would be easier to
review if the reformating were separated into a separate patch.

patch 2: Clean pad selection in isp_try_format()

The code to select isp_dev->formats[] is overly complicated.  We can
just use the "pad" as the index.  This will making adding new pads
easier in future patches.  No functional change.

patch 3: Add raw pad for ISP

> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../staging/media/starfive/camss/stf-isp.c    | 26 ++++++++++++-------
>  .../staging/media/starfive/camss/stf-isp.h    |  1 +
>  2 files changed, 17 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/staging/media/starfive/camss/stf-isp.c b/drivers/staging/media/starfive/camss/stf-isp.c
> index a5573abe0d7b..6bab0ac23120 100644
> --- a/drivers/staging/media/starfive/camss/stf-isp.c
> +++ b/drivers/staging/media/starfive/camss/stf-isp.c
> @@ -10,9 +10,6 @@
>  
>  #include "stf-camss.h"
>  
> -#define SINK_FORMATS_INDEX	0
> -#define SOURCE_FORMATS_INDEX	1
> -

This is cleanup.  patch 2.

>  static int isp_set_selection(struct v4l2_subdev *sd,
>  			     struct v4l2_subdev_state *state,
>  			     struct v4l2_subdev_selection *sel);
> @@ -28,9 +25,17 @@ static const struct stf_isp_format isp_formats_source[] = {
>  	{ MEDIA_BUS_FMT_YUYV8_1_5X8, 8 },
>  };
>  
> +static const struct stf_isp_format isp_formats_source_raw[] = {
> +	{ MEDIA_BUS_FMT_SRGGB12_1X12, 12 },
> +	{ MEDIA_BUS_FMT_SGRBG12_1X12, 12 },
> +	{ MEDIA_BUS_FMT_SGBRG12_1X12, 12 },
> +	{ MEDIA_BUS_FMT_SBGGR12_1X12, 12 },
> +};
> +

patch 3.

>  static const struct stf_isp_format_table isp_formats_st7110[] = {
>  	{ isp_formats_sink, ARRAY_SIZE(isp_formats_sink) },
>  	{ isp_formats_source, ARRAY_SIZE(isp_formats_source) },
> +	{ isp_formats_source_raw, ARRAY_SIZE(isp_formats_source_raw) },
>  };

patch 3.

>  
>  static const struct stf_isp_format *
> @@ -113,10 +118,7 @@ static void isp_try_format(struct stf_isp_dev *isp_dev,
>  		return;
>  	}
>  
> -	if (pad == STF_ISP_PAD_SINK)
> -		formats = &isp_dev->formats[SINK_FORMATS_INDEX];
> -	else if (pad == STF_ISP_PAD_SRC)
> -		formats = &isp_dev->formats[SOURCE_FORMATS_INDEX];
> +	formats = &isp_dev->formats[pad];

patch 2.

>  
>  	fmt->width = clamp_t(u32, fmt->width, STFCAMSS_FRAME_MIN_WIDTH,
>  			     STFCAMSS_FRAME_MAX_WIDTH);
> @@ -142,7 +144,7 @@ static int isp_enum_mbus_code(struct v4l2_subdev *sd,
>  		if (code->index >= ARRAY_SIZE(isp_formats_sink))
>  			return -EINVAL;
>  
> -		formats = &isp_dev->formats[SINK_FORMATS_INDEX];
> +		formats = &isp_dev->formats[code->pad];


patch 2.


>  		code->code = formats->fmts[code->index].code;
>  	} else {
>  		struct v4l2_mbus_framefmt *sink_fmt;
> @@ -281,8 +283,11 @@ static int isp_set_selection(struct v4l2_subdev *sd,
>  		crop.target = V4L2_SEL_TGT_CROP;
>  		crop.r = *rect;
>  		isp_set_selection(sd, state, &crop);
> +
> +		crop.pad = STF_ISP_PAD_SRC_RAW;
> +		isp_set_selection(sd, state, &crop);

patch 3.

>  	} else if (sel->target == V4L2_SEL_TGT_CROP &&
> -		   sel->pad == STF_ISP_PAD_SRC) {
> +		   (sel->pad == STF_ISP_PAD_SRC || sel->pad == STF_ISP_PAD_SRC_RAW)) {

patch 3.

>  		struct v4l2_subdev_format fmt = { 0 };
>  
>  		rect = v4l2_subdev_state_get_crop(state, sel->pad);
> @@ -294,7 +299,7 @@ static int isp_set_selection(struct v4l2_subdev *sd,
>  
>  		/* Reset source pad format width and height */
>  		fmt.which = sel->which;
> -		fmt.pad = STF_ISP_PAD_SRC;
> +		fmt.pad = sel->pad;

patch 2.

>  		fmt.format.width = rect->width;
>  		fmt.format.height = rect->height;
>  		isp_set_format(sd, state, &fmt);
> @@ -361,6 +366,7 @@ int stf_isp_register(struct stf_isp_dev *isp_dev, struct v4l2_device *v4l2_dev)
>  
>  	pads[STF_ISP_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
>  	pads[STF_ISP_PAD_SRC].flags = MEDIA_PAD_FL_SOURCE;
> +	pads[STF_ISP_PAD_SRC_RAW].flags = MEDIA_PAD_FL_SOURCE;

patch 3.

>  
>  	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_ISP;
>  	sd->entity.ops = &isp_media_ops;
> diff --git a/drivers/staging/media/starfive/camss/stf-isp.h b/drivers/staging/media/starfive/camss/stf-isp.h
> index 07d6c2758253..4fc5cfac115c 100644
> --- a/drivers/staging/media/starfive/camss/stf-isp.h
> +++ b/drivers/staging/media/starfive/camss/stf-isp.h
> @@ -393,6 +393,7 @@
>  enum stf_isp_pad_id {
>  	STF_ISP_PAD_SINK = 0,
>  	STF_ISP_PAD_SRC,
> +	STF_ISP_PAD_SRC_RAW,

patch 3.

>  	STF_ISP_PAD_MAX
>  };

regards,
dan carpenter

