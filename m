Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E7372;
	Wed, 10 Nov 2021 19:26:07 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id r8so5809798wra.7;
        Wed, 10 Nov 2021 11:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=stxfGq5TzEk/m+h1V0oWIaH2yEXT1vhy8334vKhpSbk=;
        b=HSbkCB5tuRc+2W2n8fgn9E3Tq0iwlPq1i+mBl1CVpMIVh0k5ZYJaWbZ5Hb146uIwb7
         1m/7OWgXQ6CvJCRl1QHVqTV1f5a/bHcJhkEHoxF8CDvtwhBBc+rOYnUfwkIbMRF8oGxa
         /0cUt5yNj3ON6xQ+cqwzUZw59rA2Cs0kG8GZBrBdIOI9Cj0nN5iJWMz9e+hD4yGqOImh
         +g+ElXEzWESJZTGgaRBPCmMiKqGCvjhKUCrDGfCd2WLzYaa10S8wsSJ1USQulhDKhXQW
         KRHmCIQwul/QBl2TzNKh8MakjGfZZyMLMqvVeZ2FvQn+EhVbW9RKQdgpwWFOCoVbwHGN
         O8nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=stxfGq5TzEk/m+h1V0oWIaH2yEXT1vhy8334vKhpSbk=;
        b=5pR5Az/FtRXI3uapOyD5ZccFxD3ZWgAXuxPXh/a9Ge1d3sdAS1/CltUg/RubDrWY8u
         ZRN640PwqJf7NOVS1bxzpNwZiRVEqaEE+YoNdSfDrn6TbCXDgFJDibS1OoBFt3QEDcLx
         a22VRUpQxPDP3Ge0sLVZrzXhffmVHYZ1ejRB8/H0wgAuqjTPCWg/4H5fZPwTlsEMoux9
         iDfz+Nq43KgtdLjYTIrMrjAP6p1HDtpao6UDAzNOMZZD1UCaYKJkK6cEAI7rpty/sRl1
         j8HRJ8bKAn6D1qSGddIYw8LvSQxAaJd3y0XTv04TutRd6vvA03PctfNE1ZHtH6LPQwAQ
         CPtA==
X-Gm-Message-State: AOAM531s4+7kjM9RSZife87DGyLfiZi5H1Ek4pcjF1bKa0WEqy4yT2hR
	foDa/jgtThTfaPB7da5BkaQ=
X-Google-Smtp-Source: ABdhPJxTG94yTUSY/Xh7rvmJIuspjf0raoj13K6wYdvH8/nsbTpXXHcT2atafOeteM53GX0FbKj6Ow==
X-Received: by 2002:a05:6000:1688:: with SMTP id y8mr1773432wrd.420.1636572366357;
        Wed, 10 Nov 2021 11:26:06 -0800 (PST)
Received: from kista.localnet (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id b197sm610739wmb.24.2021.11.10.11.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 11:26:05 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: mchehab@kernel.org, p.zabel@pengutronix.de, gregkh@linuxfoundation.org, mripard@kernel.org, paul.kocialkowski@bootlin.com, wens@csie.org, hverkuil-cisco@xs4all.nl, jc@kynesim.co.uk, ezequiel@vanguardiasur.com.ar, Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: Re: [PATCH v2 1/4] media: hevc: Remove RPS named flags
Date: Wed, 10 Nov 2021 20:26:04 +0100
Message-ID: <2215692.ElGaqSPkdT@kista>
In-Reply-To: <20211012143552.661751-2-benjamin.gaignard@collabora.com>
References: <20211012143552.661751-1-benjamin.gaignard@collabora.com> <20211012143552.661751-2-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Benjamin,

Dne torek, 12. oktober 2021 ob 16:35:49 CET je Benjamin Gaignard napisal(a):
> Marking a picture as long-term reference is valid for DPB but not for RPS.
> Change flag name to match with it description in HEVC spec chapiter

chapiter -> chapter

> "8.3.2 Decoding process for reference picture set".
> Remove the other unused RPS flags.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
> version 2:
> - change DPB field name from rps to flags
> 
>  Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 8 +++-----
>  drivers/staging/media/hantro/hantro_g2_hevc_dec.c         | 2 +-
>  drivers/staging/media/sunxi/cedrus/cedrus_h265.c          | 2 +-
>  include/media/hevc-ctrls.h                                | 6 ++----
>  4 files changed, 7 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/
Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index e141f0e4eec9..38da33e61c3d 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -3166,11 +3166,9 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
>  	:c:func:`v4l2_timeval_to_ns()` function to convert the struct
>  	:c:type:`timeval` in struct :c:type:`v4l2_buffer` to a __u64.
>      * - __u8
> -      - ``rps``
> -      - The reference set for the reference frame
> -        (V4L2_HEVC_DPB_ENTRY_RPS_ST_CURR_BEFORE,
> -        V4L2_HEVC_DPB_ENTRY_RPS_ST_CURR_AFTER or
> -        V4L2_HEVC_DPB_ENTRY_RPS_LT_CURR)
> +      - ``flags``
> +      - Long term flag for the reference frame
> +        (V4L2_HEVC_DPB_ENTRY_LONG_TERM_REFERENCE)
>      * - __u8
>        - ``field_pic``
>        - Whether the reference is a field picture or a frame.
> diff --git a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c b/drivers/
staging/media/hantro/hantro_g2_hevc_dec.c
> index 76a921163b9a..bbf71dcea099 100644
> --- a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
> +++ b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
> @@ -445,7 +445,7 @@ static int set_ref(struct hantro_ctx *ctx)
>  		chroma_addr = luma_addr + cr_offset;
>  		mv_addr = luma_addr + mv_offset;
>  
> -		if (dpb[i].rps == V4L2_HEVC_DPB_ENTRY_RPS_LT_CURR)
> +		if (dpb[i].flags == 
V4L2_HEVC_DPB_ENTRY_LONG_TERM_REFERENCE)
>  			dpb_longterm_e |= 
BIT(V4L2_HEVC_DPB_ENTRIES_NUM_MAX - 1 - i);
>  
>  		hantro_write_addr(vpu, G2_REG_ADDR_REF(i), luma_addr);
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/
staging/media/sunxi/cedrus/cedrus_h265.c
> index 3d9561d4aadb..1edfc3823a57 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> @@ -169,7 +169,7 @@ static void cedrus_h265_ref_pic_list_write(struct 
cedrus_dev *dev,
>  		unsigned int index = list[i];
>  		u8 value = list[i];
>  
> -		if (dpb[index].rps == V4L2_HEVC_DPB_ENTRY_RPS_LT_CURR)
> +		if (dpb[index].flags == 
V4L2_HEVC_DPB_ENTRY_LONG_TERM_REFERENCE)

Flags are usually checked with "&", same goes in Hantro case.

Once all fixed, this patch is:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>  			value |= 
VE_DEC_H265_SRAM_REF_PIC_LIST_LT_REF;
>  
>  		/* Each SRAM word gathers up to 4 references. */
> diff --git a/include/media/hevc-ctrls.h b/include/media/hevc-ctrls.h
> index ef63bc205756..01ccda48d8c5 100644
> --- a/include/media/hevc-ctrls.h
> +++ b/include/media/hevc-ctrls.h
> @@ -127,15 +127,13 @@ struct v4l2_ctrl_hevc_pps {
>  	__u64	flags;
>  };
>  
> -#define V4L2_HEVC_DPB_ENTRY_RPS_ST_CURR_BEFORE	0x01
> -#define V4L2_HEVC_DPB_ENTRY_RPS_ST_CURR_AFTER	0x02
> -#define V4L2_HEVC_DPB_ENTRY_RPS_LT_CURR		0x03
> +#define V4L2_HEVC_DPB_ENTRY_LONG_TERM_REFERENCE	0x01
>  
>  #define V4L2_HEVC_DPB_ENTRIES_NUM_MAX		16
>  
>  struct v4l2_hevc_dpb_entry {
>  	__u64	timestamp;
> -	__u8	rps;
> +	__u8	flags;
>  	__u8	field_pic;
>  	__u16	pic_order_cnt[2];
>  	__u8	padding[2];
> -- 
> 2.30.2
> 
> 


