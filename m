Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87737A
	for <linux-staging@lists.linux.dev>; Tue, 28 Jun 2022 19:05:08 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id l81so18481391oif.9
        for <linux-staging@lists.linux.dev>; Tue, 28 Jun 2022 12:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=W1UIqFTlInNMiky+uI28fdGpzcjitquJfb20l0+LlU8=;
        b=NrQGrqnbwzbhIyRzdo4unz7FYRp2nskiLvSmmkb4yarwZzomgFLeSx5Ec5F4/DliEc
         y5TH8OcNawJ+0OQIkYevtpgfojNpE8WkrJgbv4Cr/eV/c6uTfuOZECHBu1+PfMWS1NSY
         WrQU6OYpcG95kbDLkTSEkIbfIz5Gp3vE5Kaqn4x7s9qi8GYr/jWFNQPRWK0B50pLQSwK
         SBvt1hV1JUHjL8Hpv6GgBes8iC+6jV3pH01FA8WGF4g+Ygr/Qb/bvIDdYWXmuFjxaxzH
         LzIKSkspipD8M5Nd1B8YYti3H2P/Tg/u+LkRy5dVoFuSCkpZ7iNnIHVIqQn3US16/JTW
         1o5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=W1UIqFTlInNMiky+uI28fdGpzcjitquJfb20l0+LlU8=;
        b=XKD9WIGwaEYiYfxASVsZACVLTnzT0R7AhepJ7u0oWPVEVrykGzymLt1h+TxuBzthbT
         Ildc6axhauZLBCF0N5WOShtrb+YIhxEbBVYEGCuCBf9kBEkI19lzNjlwYokAezo6DEJ0
         Nm1iGLK2N7Jp0VbzWUheG1yTBmwo8Mu/y3J+TD3OpEilV+xzer3xx4cy4PywGd1yrfNu
         S7XtZijPJvh35U6aPGTzq4EF0756bJtvXnsA/MZmsIArx8DxulpOWUtAW8M23g9nxBWI
         bDmk/CJ0kEYtDMeTzRpc9DjUMQ9IsBUhOsXlzG6fnp0LLUg59E0AJnshyB7FSfkfmJbH
         8yUg==
X-Gm-Message-State: AJIora975BTn3NAOYNZImZM7Mkhx72PjprugrebNB6pLGIVVX4K8Fg0I
	xIAzYVC6+YNZxlvG+HWzzdyGgA==
X-Google-Smtp-Source: AGRyM1vBnvXXHKQfLBKNriRwVeDZ8JKqFoDXG2qXIcwdge1wnrXP13gptGoFgCR+8DCzLOn6SlPKjA==
X-Received: by 2002:a05:6808:1a13:b0:335:870b:324e with SMTP id bk19-20020a0568081a1300b00335870b324emr697774oib.297.1656443107736;
        Tue, 28 Jun 2022 12:05:07 -0700 (PDT)
Received: from eze-laptop ([190.190.187.68])
        by smtp.gmail.com with ESMTPSA id n17-20020a9d7111000000b0060b069325f2sm480492otj.63.2022.06.28.12.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 12:05:06 -0700 (PDT)
Date: Tue, 28 Jun 2022 16:05:01 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: p.zabel@pengutronix.de, mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	benjamin.gaignard@collabora.com, nicolas.dufresne@collabora.com,
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 1/7] media: Add P010 tiled format
Message-ID: <YrtQ3QPEGfbbllCG@eze-laptop>
References: <20220616202513.351039-1-jernej.skrabec@gmail.com>
 <20220616202513.351039-2-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220616202513.351039-2-jernej.skrabec@gmail.com>

Hi Jernej,

Thanks for the patch.

On Thu, Jun 16, 2022 at 10:25:07PM +0200, Jernej Skrabec wrote:
> From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> 
> Add P010 tiled format
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> [rebased and updated pixel format name]
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  drivers/media/v4l2-core/v4l2-common.c | 1 +
>  drivers/media/v4l2-core/v4l2-ioctl.c  | 1 +
>  include/uapi/linux/videodev2.h        | 1 +

We also need to add the documentation in
Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst.

See Benjamin's patch for reference:

commit 5374d8fb75f313294c7d97e85c22bead34d63f2b
Author: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Date:   Thu May 19 08:11:46 2022 +0100

    media: Add P010 video format

    P010 is a YUV format with 10-bits per component with interleaved UV.

>  3 files changed, 3 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> index 1e38ad8906a2..e0fbe6ba4b6c 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -278,6 +278,7 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
>  
>  		/* Tiled YUV formats */
>  		{ .format = V4L2_PIX_FMT_NV12_4L4, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 2, .vdiv = 2 },
> +		{ .format = V4L2_PIX_FMT_P010_4L4, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 2, 4, 0, 0 }, .hdiv = 2, .vdiv = 2 },
>  
>  		/* YUV planar formats, non contiguous variant */
>  		{ .format = V4L2_PIX_FMT_YUV420M, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 3, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 2, .vdiv = 2 },
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index e2526701294e..e24d38c0a178 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1310,6 +1310,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	case V4L2_PIX_FMT_NV12_4L4:	descr = "Y/CbCr 4:2:0 (4x4 Linear)"; break;
>  	case V4L2_PIX_FMT_NV12_16L16:	descr = "Y/CbCr 4:2:0 (16x16 Linear)"; break;
>  	case V4L2_PIX_FMT_NV12_32L32:   descr = "Y/CbCr 4:2:0 (32x32 Linear)"; break;
> +	case V4L2_PIX_FMT_P010_4L4:	descr = "P010 tiled"; break;

I would make this "10-bit Y/CbCr 4:2:0 (4x4 Linear)".

Thanks,
Ezequiel
