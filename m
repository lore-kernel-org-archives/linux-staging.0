Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762987C
	for <linux-staging@lists.linux.dev>; Sat,  2 Apr 2022 11:20:45 +0000 (UTC)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-deb9295679so5391482fac.6
        for <linux-staging@lists.linux.dev>; Sat, 02 Apr 2022 04:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=g3P8pgW5TKXbnqnv/dYdIwK49jDG9AWiv4cnKL0b/84=;
        b=3IE1inTso+FzIQVXK7Y9dK0Ix8Ksu/yX4a6Bo3R6+h3Oz4bS41gmAHst8gIZAnCs9V
         ztPE75tgtHnjEUf7I7IV4ASYWNqnQCalUWt8eCC0Na3v5LBLh/AwsMMQ5725Wh7UD6Ol
         k5wM4oN3zPsgdIJqjpryqh67qivaQZonDwJ9WVH2UQvsZYKa1NkiRvDBkQQ6J/y8VwdA
         /NcanNMJA5ziIsoEbELz7/RWaSywTwDYo0YnQ6ZPVmRfiE8X7lw1eIHBapMkvGCuGqaJ
         MYWzem1Gmd8NocSNrvilDjzxNaFTrcZ44gY1oWZWiEQV0ZXkj3NBUbcWeTj4AoQGrOjK
         3AIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=g3P8pgW5TKXbnqnv/dYdIwK49jDG9AWiv4cnKL0b/84=;
        b=qvXKRynEQs7/Y5BK8+lf4AuPbW01xLlPqAQkq//dxdLUL0Yknk8uss0ps4cSY9DAaE
         r5WFiGpgXgSMKWbFp82dnV3Pm60WVrY5VtXYDMqupHdXUrFnJ1w7vHsQ5N6ocIvDbAs4
         eeseMoUToU3OdViVG3snn4b8klTDyQghmuYrNkz0Yw6csoGz+CJnC1tC3ZGCtU24TYL0
         FUeBhVmr4ubxVzvbcOwRQuqRdPUlR6TKGHFuQwo1A1KyY3+bUtzC077f9v3jbsNbgWct
         0yIGzCbhdU4hozE1kX8eTRLEep7wDjW3QEK+ooMpfWVjTlNQwz0i0zG4o8dhsgTPDYBZ
         /voA==
X-Gm-Message-State: AOAM531EsQn1BXkIPYgt2bHsvFEPXAF65w5lOp5/eQZ5BUALIoP03vhf
	nY17gJHsfx4sXVBOy0zyEUAVAA==
X-Google-Smtp-Source: ABdhPJxCr1Ebsw6Ng0vvQY9LbiN+5OUdrveilhdOqONM4pZTFHY9+L4rYhdcebNyNwKww5Ugy6MFVA==
X-Received: by 2002:a05:6871:810:b0:de:68ff:e846 with SMTP id q16-20020a056871081000b000de68ffe846mr7134650oap.58.1648898444505;
        Sat, 02 Apr 2022 04:20:44 -0700 (PDT)
Received: from eze-laptop ([2803:9800:98c2:8470:9f4:8e2a:88e5:ec01])
        by smtp.gmail.com with ESMTPSA id m23-20020a4add17000000b0032489ab619esm2005500oou.45.2022.04.02.04.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Apr 2022 04:20:43 -0700 (PDT)
Date: Sat, 2 Apr 2022 08:20:38 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>,
	Ezequiel Garcia <ezequiel@collabora.com>,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 14/23] media: rkvdec: h264: Fix bit depth wrap in pps
 packet
Message-ID: <YkgxhgqOAw26/3EG@eze-laptop>
References: <20220331193726.289559-1-nicolas.dufresne@collabora.com>
 <20220331193726.289559-15-nicolas.dufresne@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220331193726.289559-15-nicolas.dufresne@collabora.com>

On Thu, Mar 31, 2022 at 03:37:16PM -0400, Nicolas Dufresne wrote:
> From: Jonas Karlman <jonas@kwiboo.se>
> 
> The luma and chroma bit depth fields in the pps packet are 3 bits wide.
> 8 is wrongly added to the bit depth values written to these 3 bit fields.
> Because only the 3 LSB are written, the hardware was configured
> correctly.
> 
> Correct this by not adding 8 to the luma and chroma bit depth value.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>

Fixes: cd33c830448ba ("media: rkvdec: Add the rkvdec driver")

Thanks!

> ---
>  drivers/staging/media/rkvdec/rkvdec-h264.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/rkvdec/rkvdec-h264.c b/drivers/staging/media/rkvdec/rkvdec-h264.c
> index bcde37d72244..8d44a884a52e 100644
> --- a/drivers/staging/media/rkvdec/rkvdec-h264.c
> +++ b/drivers/staging/media/rkvdec/rkvdec-h264.c
> @@ -662,8 +662,8 @@ static void assemble_hw_pps(struct rkvdec_ctx *ctx,
>  	WRITE_PPS(0xff, PROFILE_IDC);
>  	WRITE_PPS(1, CONSTRAINT_SET3_FLAG);
>  	WRITE_PPS(sps->chroma_format_idc, CHROMA_FORMAT_IDC);
> -	WRITE_PPS(sps->bit_depth_luma_minus8 + 8, BIT_DEPTH_LUMA);
> -	WRITE_PPS(sps->bit_depth_chroma_minus8 + 8, BIT_DEPTH_CHROMA);
> +	WRITE_PPS(sps->bit_depth_luma_minus8, BIT_DEPTH_LUMA);
> +	WRITE_PPS(sps->bit_depth_chroma_minus8, BIT_DEPTH_CHROMA);
>  	WRITE_PPS(0, QPPRIME_Y_ZERO_TRANSFORM_BYPASS_FLAG);
>  	WRITE_PPS(sps->log2_max_frame_num_minus4, LOG2_MAX_FRAME_NUM_MINUS4);
>  	WRITE_PPS(sps->max_num_ref_frames, MAX_NUM_REF_FRAMES);
> -- 
> 2.34.1
> 
