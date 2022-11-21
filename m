Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E877AECB
	for <linux-staging@lists.linux.dev>; Mon, 21 Nov 2022 13:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669036894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=osotppuTx7hxOfl0KyuUkesGKURAy7yxNO35IteUugc=;
	b=Lk3vYPP9FcNQHOrS6F9ILtobvtpV8qInRxRWnSnbrTCkssWePgpL08WcJrcM1/ke3OZ2rQ
	bv5iYkNKAoIsuhIWzga82qoARXI0JaneK/GVJtgt0/4NWpsC/2BpsSQosVy5oPgWtYkNXd
	F/vvWrnbm5WWuemcA+nIDb5YMWxAmns=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-75-rkYPHW6tOGex4dBwl6jLDA-1; Mon, 21 Nov 2022 08:21:33 -0500
X-MC-Unique: rkYPHW6tOGex4dBwl6jLDA-1
Received: by mail-ed1-f69.google.com with SMTP id g14-20020a056402090e00b0046790cd9082so6896724edz.21
        for <linux-staging@lists.linux.dev>; Mon, 21 Nov 2022 05:21:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=osotppuTx7hxOfl0KyuUkesGKURAy7yxNO35IteUugc=;
        b=5FAvdvYI8dtxhsIBiaGZYD0UcsxXp18Wuitnktb1XSjloM11XXBZch7L6OTg/Z+nMH
         w00QzQsjZOB91sCc5JTpbMCbPwU/KZGuxmFyQdVK1h4YXVWNtqMWxwZmoTAyPMCx6RWe
         2CmBzwHnKfjz5RSFCnZQXn8vijkHhf7dFNl1SaiW7k3cE3Djj1dRbkCWpZP2wDsMsSXJ
         Pz8QA3GXljGSigBNlF/Pjc/kDroKWg1Rr7cGIOKzrR625Of/h7SdBIJcNBW2/xdH1Gmf
         w991F1sVke0PYuLlxuP3cMLLcbxLsHEBeh2IV0JmF2GpqXE/s6M9u+nTz0sGIeqrCJFf
         C29w==
X-Gm-Message-State: ANoB5pl7OuJchdktff803d2tIMQ4HwFWQSRCTnu6jurRVCnVJDifuNMB
	M4OJ10lShh3Q4GBeIhUW1hqKVAN12xhlcqsLtKmE00rgoU0+9vK2Rndeein3dWRVOfA6aar/MMX
	tTdOfP6ZvDeSPxs22ZNJB9PGBEw==
X-Received: by 2002:a17:906:704:b0:7a1:b555:6f1 with SMTP id y4-20020a170906070400b007a1b55506f1mr16155761ejb.29.1669036892235;
        Mon, 21 Nov 2022 05:21:32 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7IVZ3h70YIkpyFbwUCi8Kh+wIFLZIqf3futGtK0Lj0fuvT5wohlSXoRD3dn+ycvsq78CtI1w==
X-Received: by 2002:a17:906:704:b0:7a1:b555:6f1 with SMTP id y4-20020a170906070400b007a1b55506f1mr16155744ejb.29.1669036891952;
        Mon, 21 Nov 2022 05:21:31 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id f23-20020a17090631d700b0078d9cd0d2d6sm5056112ejf.11.2022.11.21.05.21.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 05:21:31 -0800 (PST)
Message-ID: <837c5412-5019-c78a-d890-7fedd4064a9e@redhat.com>
Date: Mon, 21 Nov 2022 14:21:30 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v1 1/1] atomisp: Make bds_factors_list be type of struct
 u32_fract
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20221118184309.60834-1-andriy.shevchenko@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221118184309.60834-1-andriy.shevchenko@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11/18/22 19:43, Andy Shevchenko wrote:
> The list contains the Bayer scale index, and rational fraction of it.
> The struct u32_fract is suitable type to hold that. Convert the driver
> to use latter instead of former.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

I've added this to my media-atomisp branch now and will
include this in the pull-req which I will send to Mauro after I've
run some quick tests (tonight or tomorrow).

Regards,

Hans


> ---
>  .../pipe/interface/ia_css_pipe_binarydesc.h   | 13 ++---
>  .../pci/camera/pipe/src/pipe_binarydesc.c     | 55 ++++++++-----------
>  .../atomisp/pci/runtime/binary/src/binary.c   | 42 +++++---------
>  .../media/atomisp/pci/sh_css_param_shading.c  | 19 +++----
>  4 files changed, 51 insertions(+), 78 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/camera/pipe/interface/ia_css_pipe_binarydesc.h b/drivers/staging/media/atomisp/pci/camera/pipe/interface/ia_css_pipe_binarydesc.h
> index 965cfda50707..e42eeaeb3ee4 100644
> --- a/drivers/staging/media/atomisp/pci/camera/pipe/interface/ia_css_pipe_binarydesc.h
> +++ b/drivers/staging/media/atomisp/pci/camera/pipe/interface/ia_css_pipe_binarydesc.h
> @@ -16,6 +16,8 @@
>  #ifndef __IA_CSS_PIPE_BINARYDESC_H__
>  #define __IA_CSS_PIPE_BINARYDESC_H__
>  
> +#include <linux/math.h>
> +
>  #include <ia_css_types.h>		/* ia_css_pipe */
>  #include <ia_css_frame_public.h>	/* ia_css_frame_info */
>  #include <ia_css_binary.h>		/* ia_css_binary_descr */
> @@ -56,17 +58,12 @@ void ia_css_pipe_get_vfpp_binarydesc(
>   *
>   * @param[in] bds_factor: The bayer downscaling factor.
>   *		(= The bds_factor member in the sh_css_bds_factor structure.)
> - * @param[out] bds_factor_numerator: The numerator of the bayer downscaling factor.
> - *		(= The numerator member in the sh_css_bds_factor structure.)
> - * @param[out] bds_factor_denominator: The denominator of the bayer downscaling factor.
> - *		(= The denominator member in the sh_css_bds_factor structure.)
> + * @param[out] bds: The rational fraction of the bayer downscaling factor.
> + *		(= The respective member in the sh_css_bds_factor structure.)
>   * @return	0 or error code upon error.
>   *
>   */
> -int sh_css_bds_factor_get_numerator_denominator(
> -    unsigned int bds_factor,
> -    unsigned int *bds_factor_numerator,
> -    unsigned int *bds_factor_denominator);
> +int sh_css_bds_factor_get_fract(unsigned int bds_factor, struct u32_fract *bds);
>  
>  /* @brief Get a binary descriptor for preview stage.
>   *
> diff --git a/drivers/staging/media/atomisp/pci/camera/pipe/src/pipe_binarydesc.c b/drivers/staging/media/atomisp/pci/camera/pipe/src/pipe_binarydesc.c
> index 7dd0e4a53c8b..06664ce75b60 100644
> --- a/drivers/staging/media/atomisp/pci/camera/pipe/src/pipe_binarydesc.c
> +++ b/drivers/staging/media/atomisp/pci/camera/pipe/src/pipe_binarydesc.c
> @@ -13,6 +13,9 @@
>   * more details.
>   */
>  
> +#include <linux/kernel.h>
> +#include <linux/math.h>
> +
>  #include "ia_css_pipe_binarydesc.h"
>  #include "ia_css_frame_format.h"
>  #include "ia_css_pipe.h"
> @@ -23,7 +26,6 @@
>  #include <assert_support.h>
>  /* HRT_GDC_N */
>  #include "gdc_device.h"
> -#include <linux/kernel.h>
>  
>  /* This module provides a binary descriptions to used to find a binary. Since,
>   * every stage is associated with a binary, it implicity helps stage
> @@ -126,40 +128,29 @@ void ia_css_pipe_get_vfpp_binarydesc(
>  	IA_CSS_LEAVE_PRIVATE("");
>  }
>  
> -static struct sh_css_bds_factor bds_factors_list[] = {
> -	{1, 1, SH_CSS_BDS_FACTOR_1_00},
> -	{5, 4, SH_CSS_BDS_FACTOR_1_25},
> -	{3, 2, SH_CSS_BDS_FACTOR_1_50},
> -	{2, 1, SH_CSS_BDS_FACTOR_2_00},
> -	{9, 4, SH_CSS_BDS_FACTOR_2_25},
> -	{5, 2, SH_CSS_BDS_FACTOR_2_50},
> -	{3, 1, SH_CSS_BDS_FACTOR_3_00},
> -	{4, 1, SH_CSS_BDS_FACTOR_4_00},
> -	{9, 2, SH_CSS_BDS_FACTOR_4_50},
> -	{5, 1, SH_CSS_BDS_FACTOR_5_00},
> -	{6, 1, SH_CSS_BDS_FACTOR_6_00},
> -	{8, 1, SH_CSS_BDS_FACTOR_8_00}
> +static struct u32_fract bds_factors_list[] = {
> +	[SH_CSS_BDS_FACTOR_1_00] = {1, 1},
> +	[SH_CSS_BDS_FACTOR_1_25] = {5, 4},
> +	[SH_CSS_BDS_FACTOR_1_50] = {3, 2},
> +	[SH_CSS_BDS_FACTOR_2_00] = {2, 1},
> +	[SH_CSS_BDS_FACTOR_2_25] = {9, 4},
> +	[SH_CSS_BDS_FACTOR_2_50] = {5, 2},
> +	[SH_CSS_BDS_FACTOR_3_00] = {3, 1},
> +	[SH_CSS_BDS_FACTOR_4_00] = {4, 1},
> +	[SH_CSS_BDS_FACTOR_4_50] = {9, 2},
> +	[SH_CSS_BDS_FACTOR_5_00] = {5, 1},
> +	[SH_CSS_BDS_FACTOR_6_00] = {6, 1},
> +	[SH_CSS_BDS_FACTOR_8_00] = {8, 1},
>  };
>  
> -int sh_css_bds_factor_get_numerator_denominator(
> -    unsigned int bds_factor,
> -    unsigned int *bds_factor_numerator,
> -    unsigned int *bds_factor_denominator)
> +int sh_css_bds_factor_get_fract(unsigned int bds_factor, struct u32_fract *bds)
>  {
> -	unsigned int i;
> -
> -	/* Loop over all bds factors until a match is found */
> -	for (i = 0; i < ARRAY_SIZE(bds_factors_list); i++) {
> -		if (bds_factors_list[i].bds_factor == bds_factor) {
> -			*bds_factor_numerator = bds_factors_list[i].numerator;
> -			*bds_factor_denominator = bds_factors_list[i].denominator;
> -			return 0;
> -		}
> -	}
> +	/* Throw an error since bds_factor cannot be found in bds_factors_list */
> +	if (bds_factor >= ARRAY_SIZE(bds_factors_list))
> +		return -EINVAL;
>  
> -	/* Throw an error since bds_factor cannot be found
> -	in bds_factors_list */
> -	return -EINVAL;
> +	*bds = bds_factors_list[bds_factor];
> +	return 0;
>  }
>  
>  int binarydesc_calculate_bds_factor(
> @@ -194,7 +185,7 @@ int binarydesc_calculate_bds_factor(
>  			    (out_h * num / den <= in_h);
>  
>  		if (cond) {
> -			*bds_factor = bds_factors_list[i].bds_factor;
> +			*bds_factor = i;
>  			return 0;
>  		}
>  	}
> diff --git a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
> index 406ed5fb4c6a..768da86b8c2c 100644
> --- a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
> +++ b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
> @@ -13,6 +13,8 @@
>   * more details.
>   */
>  
> +#include <linux/math.h>
> +
>  #include <math_support.h>
>  #include <gdc_device.h>	/* HR_GDC_N */
>  
> @@ -128,16 +130,8 @@ ia_css_binary_compute_shading_table_bayer_origin(
>  {
>  	int err;
>  
> -	/* Numerator and denominator of the fixed bayer downscaling factor.
> -	(numerator >= denominator) */
> -	unsigned int bds_num, bds_den;
> -
> -	/* Horizontal/Vertical ratio of bayer scaling
> -	between input area and output area. */
> -	unsigned int bs_hor_ratio_in;
> -	unsigned int bs_hor_ratio_out;
> -	unsigned int bs_ver_ratio_in;
> -	unsigned int bs_ver_ratio_out;
> +	/* Rational fraction of the fixed bayer downscaling factor. */
> +	struct u32_fract bds;
>  
>  	/* Left padding set by InputFormatter. */
>  	unsigned int left_padding_bqs;			/* in bqs */
> @@ -158,19 +152,11 @@ ia_css_binary_compute_shading_table_bayer_origin(
>  	unsigned int bad_bqs_on_top_before_bs;	/* in bqs */
>  	unsigned int bad_bqs_on_top_after_bs;	/* in bqs */
>  
> -	/* Get the numerator and denominator of bayer downscaling factor. */
> -	err = sh_css_bds_factor_get_numerator_denominator
> -	(required_bds_factor, &bds_num, &bds_den);
> +	/* Get the rational fraction of bayer downscaling factor. */
> +	err = sh_css_bds_factor_get_fract(required_bds_factor, &bds);
>  	if (err)
>  		return err;
>  
> -	/* Set the horizontal/vertical ratio of bayer scaling
> -	between input area and output area. */
> -	bs_hor_ratio_in  = bds_num;
> -	bs_hor_ratio_out = bds_den;
> -	bs_ver_ratio_in  = bds_num;
> -	bs_ver_ratio_out = bds_den;
> -
>  	/* Set the left padding set by InputFormatter. (ifmtr.c) */
>  	if (stream_config->left_padding == -1)
>  		left_padding_bqs = _ISP_BQS(binary->left_padding);
> @@ -228,18 +214,18 @@ ia_css_binary_compute_shading_table_bayer_origin(
>  	located on the shading table during the shading correction. */
>  	res->sc_bayer_origin_x_bqs_on_shading_table =
>  		((left_padding_adjusted_bqs + bad_bqs_on_left_before_bs)
> -		* bs_hor_ratio_out + bs_hor_ratio_in / 2) / bs_hor_ratio_in
> +		* bds.denominator + bds.numerator / 2) / bds.numerator
>  		+ bad_bqs_on_left_after_bs;
> -	/* "+ bs_hor_ratio_in/2": rounding for division by bs_hor_ratio_in */
> +	/* "+ bds.numerator / 2": rounding for division by bds.numerator */
>  	res->sc_bayer_origin_y_bqs_on_shading_table =
> -		(bad_bqs_on_top_before_bs * bs_ver_ratio_out + bs_ver_ratio_in / 2) / bs_ver_ratio_in
> +		(bad_bqs_on_top_before_bs * bds.denominator + bds.numerator / 2) / bds.numerator
>  		+ bad_bqs_on_top_after_bs;
> -	/* "+ bs_ver_ratio_in/2": rounding for division by bs_ver_ratio_in */
> +	/* "+ bds.numerator / 2": rounding for division by bds.numerator */
>  
> -	res->bayer_scale_hor_ratio_in  = (uint32_t)bs_hor_ratio_in;
> -	res->bayer_scale_hor_ratio_out = (uint32_t)bs_hor_ratio_out;
> -	res->bayer_scale_ver_ratio_in  = (uint32_t)bs_ver_ratio_in;
> -	res->bayer_scale_ver_ratio_out = (uint32_t)bs_ver_ratio_out;
> +	res->bayer_scale_hor_ratio_in  = bds.numerator;
> +	res->bayer_scale_hor_ratio_out = bds.denominator;
> +	res->bayer_scale_ver_ratio_in  = bds.numerator;
> +	res->bayer_scale_ver_ratio_out = bds.denominator;
>  
>  	return err;
>  }
> diff --git a/drivers/staging/media/atomisp/pci/sh_css_param_shading.c b/drivers/staging/media/atomisp/pci/sh_css_param_shading.c
> index 41a4c9162319..5b43cc656269 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css_param_shading.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css_param_shading.c
> @@ -13,6 +13,7 @@
>   * more details.
>   */
>  
> +#include <linux/math.h>
>  #include <linux/slab.h>
>  
>  #include <math_support.h>
> @@ -239,10 +240,9 @@ prepare_shading_table(const struct ia_css_shading_table *in_table,
>  {
>  	unsigned int input_width, input_height, table_width, table_height, i;
>  	unsigned int left_padding, top_padding, left_cropping;
> -	unsigned int bds_numerator, bds_denominator;
> -	int right_padding;
> -
>  	struct ia_css_shading_table *result;
> +	struct u32_fract bds;
> +	int right_padding;
>  
>  	assert(target_table);
>  	assert(binary);
> @@ -265,17 +265,16 @@ prepare_shading_table(const struct ia_css_shading_table *in_table,
>  	left_cropping = (binary->info->sp.pipeline.left_cropping == 0) ?
>  			binary->dvs_envelope.width : 2 * ISP_VEC_NELEMS;
>  
> -	sh_css_bds_factor_get_numerator_denominator
> -	(bds_factor, &bds_numerator, &bds_denominator);
> +	sh_css_bds_factor_get_fract(bds_factor, &bds);
>  
>  	left_padding  = (left_padding + binary->info->sp.pipeline.left_cropping) *
> -			bds_numerator / bds_denominator -
> +			bds.numerator / bds.denominator -
>  			binary->info->sp.pipeline.left_cropping;
>  	right_padding = (binary->internal_frame_info.res.width -
> -			 binary->effective_in_frame_res.width * bds_denominator /
> -			 bds_numerator - left_cropping) * bds_numerator / bds_denominator;
> -	top_padding = binary->info->sp.pipeline.top_cropping * bds_numerator /
> -		      bds_denominator -
> +			 binary->effective_in_frame_res.width * bds.denominator /
> +			 bds.numerator - left_cropping) * bds.numerator / bds.denominator;
> +	top_padding = binary->info->sp.pipeline.top_cropping * bds.numerator /
> +		      bds.denominator -
>  		      binary->info->sp.pipeline.top_cropping;
>  
>  	/*

