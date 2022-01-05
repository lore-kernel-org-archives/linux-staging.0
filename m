Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43A12C9C
	for <linux-staging@lists.linux.dev>; Wed,  5 Jan 2022 12:28:48 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id q4so37371218qvh.9
        for <linux-staging@lists.linux.dev>; Wed, 05 Jan 2022 04:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kSKdFvHyHlkRq5hWk3Gwn5Pq2HHsmkBsyVwESab0Kj4=;
        b=cwqRgkXGwzTmPi88A2tV4UqKiYfWmPwjREM6TiicmjlgcjtHZxLDLFDrockfM6UI7S
         AqQ3RQQBd8jhGjCWofyEg92SYG33pZQ3sRW5LftBIWYh/+rLQljrNFT7zlzlvoLiEXgK
         WpKfE4virtaHY1QDhdGAgxnJ/rvbj6lV9sNlVAaAtohan9Le6INY0OA8o9lKGb8YuWv8
         9ehcUKckxpZMZ4oGMVjF0WeG6+Xp9AxuL7NbnhcgMT2EezQIQoptbbApA4cIaqttlFVh
         Ci5muAizHPS2bgoJZD7iuW1U6PjpOawp0FqRxoV893auQ9ysaz2e2jcdVP0MAP/ou55A
         Sfmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kSKdFvHyHlkRq5hWk3Gwn5Pq2HHsmkBsyVwESab0Kj4=;
        b=IwJpCb1lDD0sdewtfRECDdX0nIBflWp4xrSTzObLqbH6aUI30fOO/viy7lgJZlLIbO
         rFPOhIo4eZphsD1tR0yokgJLEIJkAo/HtqDncSjGMgcu0+BH1h0lOJClEzuZEAW7oAGA
         7fRnCyZlHEzZyFqpZiD0h4uBkvy92s0L54dDqBv9lQLilFzRjUCjzSEwXohoIy6XTia0
         kJdfS9GhI+bi3nHtwfi0X1qmEkMQucbWaL6DJ9CuZ2gkUm/94bZSJ4qECUeyyuglxwex
         J7bq1NCWg79Cm+BkvyYv0SZWdbZgpLMtkGGLRYqG+oLVGrZ+uaA6cA4/q0tD8h/B1CNb
         Jtzg==
X-Gm-Message-State: AOAM532u61ih0kRNP59PNRsk646QnCnxygbL2uWKy36E3g1ah1uGvrba
	KPoTKfhB9Q4siT8vfAwXNH/SgA==
X-Google-Smtp-Source: ABdhPJyww7t4i5QLu5lCh4SClZkrl0LI5RtHqyZuubtgPtqYTXRkU2Gbz6/8PP8duplNKA7hjAke7w==
X-Received: by 2002:a05:6214:c8c:: with SMTP id r12mr13001003qvr.79.1641385727855;
        Wed, 05 Jan 2022 04:28:47 -0800 (PST)
Received: from eze-laptop ([186.122.18.30])
        by smtp.gmail.com with ESMTPSA id 137sm30706247qkm.69.2022.01.05.04.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jan 2022 04:28:44 -0800 (PST)
Date: Wed, 5 Jan 2022 09:28:39 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: mchehab@kernel.org, p.zabel@pengutronix.de, gregkh@linuxfoundation.org,
	hverkuil-cisco@xs4all.nl, jernej.skrabec@gmail.com,
	nicolas.dufresne@collabora.co.uk, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev, kernel@collabora.com
Subject: Re: [PATCH v4 2/2] media: hevc: Embedded indexes in RPS
Message-ID: <YdWO9+6XUh3SFnvj@eze-laptop>
References: <20220104073842.1791639-1-benjamin.gaignard@collabora.com>
 <20220104073842.1791639-3-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220104073842.1791639-3-benjamin.gaignard@collabora.com>


On Tue, Jan 04, 2022 at 08:38:42AM +0100, Benjamin Gaignard wrote:
> Reference Picture Set lists provide indexes of short and long term
> reference in DBP array.
> Fix Hantro to not do a look up in DBP entries.
> Make documentation more clear about it.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

> ---
>  .../media/v4l/ext-ctrls-codec.rst             |  6 ++---
>  .../staging/media/hantro/hantro_g2_hevc_dec.c | 25 +++++--------------
>  2 files changed, 9 insertions(+), 22 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index 38da33e61c3d..b12ad5b3eaba 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -3381,15 +3381,15 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
>      * - __u8
>        - ``poc_st_curr_before[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
>        - PocStCurrBefore as described in section 8.3.2 "Decoding process for reference
> -        picture set.
> +        picture set": provides the index of the short term before references in DPB array.
>      * - __u8
>        - ``poc_st_curr_after[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
>        - PocStCurrAfter as described in section 8.3.2 "Decoding process for reference
> -        picture set.
> +        picture set": provides the index of the short term after references in DPB array.
>      * - __u8
>        - ``poc_lt_curr[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
>        - PocLtCurr as described in section 8.3.2 "Decoding process for reference
> -        picture set.
> +        picture set": provides the index of the long term references in DPB array.
>      * - __u64
>        - ``flags``
>        - See :ref:`Decode Parameters Flags <hevc_decode_params_flags>`
> diff --git a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
> index 14e0e6414100..c524af41baf5 100644
> --- a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
> +++ b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
> @@ -255,24 +255,11 @@ static void set_params(struct hantro_ctx *ctx)
>  	hantro_reg_write(vpu, &g2_apf_threshold, 8);
>  }
>  
> -static int find_ref_pic_index(const struct v4l2_hevc_dpb_entry *dpb, int pic_order_cnt)
> -{
> -	int i;
> -
> -	for (i = 0; i < V4L2_HEVC_DPB_ENTRIES_NUM_MAX; i++) {
> -		if (dpb[i].pic_order_cnt[0] == pic_order_cnt)
> -			return i;
> -	}
> -
> -	return 0x0;
> -}
> -
>  static void set_ref_pic_list(struct hantro_ctx *ctx)
>  {
>  	const struct hantro_hevc_dec_ctrls *ctrls = &ctx->hevc_dec.ctrls;
>  	struct hantro_dev *vpu = ctx->dev;
>  	const struct v4l2_ctrl_hevc_decode_params *decode_params = ctrls->decode_params;
> -	const struct v4l2_hevc_dpb_entry *dpb = decode_params->dpb;
>  	u32 list0[V4L2_HEVC_DPB_ENTRIES_NUM_MAX] = {};
>  	u32 list1[V4L2_HEVC_DPB_ENTRIES_NUM_MAX] = {};
>  	static const struct hantro_reg ref_pic_regs0[] = {
> @@ -316,11 +303,11 @@ static void set_ref_pic_list(struct hantro_ctx *ctx)
>  	/* List 0 contains: short term before, short term after and long term */
>  	j = 0;
>  	for (i = 0; i < decode_params->num_poc_st_curr_before && j < ARRAY_SIZE(list0); i++)
> -		list0[j++] = find_ref_pic_index(dpb, decode_params->poc_st_curr_before[i]);
> +		list0[j++] = decode_params->poc_st_curr_before[i];
>  	for (i = 0; i < decode_params->num_poc_st_curr_after && j < ARRAY_SIZE(list0); i++)
> -		list0[j++] = find_ref_pic_index(dpb, decode_params->poc_st_curr_after[i]);
> +		list0[j++] = decode_params->poc_st_curr_after[i];
>  	for (i = 0; i < decode_params->num_poc_lt_curr && j < ARRAY_SIZE(list0); i++)
> -		list0[j++] = find_ref_pic_index(dpb, decode_params->poc_lt_curr[i]);
> +		list0[j++] = decode_params->poc_lt_curr[i];
>  
>  	/* Fill the list, copying over and over */
>  	i = 0;
> @@ -329,11 +316,11 @@ static void set_ref_pic_list(struct hantro_ctx *ctx)
>  
>  	j = 0;
>  	for (i = 0; i < decode_params->num_poc_st_curr_after && j < ARRAY_SIZE(list1); i++)
> -		list1[j++] = find_ref_pic_index(dpb, decode_params->poc_st_curr_after[i]);
> +		list1[j++] = decode_params->poc_st_curr_after[i];
>  	for (i = 0; i < decode_params->num_poc_st_curr_before && j < ARRAY_SIZE(list1); i++)
> -		list1[j++] = find_ref_pic_index(dpb, decode_params->poc_st_curr_before[i]);
> +		list1[j++] = decode_params->poc_st_curr_before[i];
>  	for (i = 0; i < decode_params->num_poc_lt_curr && j < ARRAY_SIZE(list1); i++)
> -		list1[j++] = find_ref_pic_index(dpb, decode_params->poc_lt_curr[i]);
> +		list1[j++] = decode_params->poc_lt_curr[i];
>  
>  	i = 0;
>  	while (j < ARRAY_SIZE(list1))
> -- 
> 2.30.2
> 
