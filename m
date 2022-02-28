Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF1B559B
	for <linux-staging@lists.linux.dev>; Mon, 28 Feb 2022 12:48:56 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id g23so12233619qvb.4
        for <linux-staging@lists.linux.dev>; Mon, 28 Feb 2022 04:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=+8I/V7LMKeEgdjfech8pVN3rLVcrkyoXC3NkYpHqx50=;
        b=UzEaMg7JeXuUGaFUzjzNTjWqymgIKqaEVBGX/ytQjyMN6OC9OOJ0/nKWUdYq5uxvI3
         /dra9cjZKvXzgDUebBGOWC5W7Vex1+dDK2vfDgq6DQqBF0xV3OAaHLTrixCGbjpTrelZ
         oKZ4YLNuUVKHI8QeYETFk0iXjog6Qe7igxM3RkkXzBUgb0EBNE3mMMQlLlQIEemz/1up
         y2yUjx+uzFN2xwsKNATwGf4tXX+27dJGIKH1fBmD8Ml/FNURZakDjIMB+01PmrrJ9Nh8
         VkFceIVqIYMtP9KCjfKcXhhAJeXp9s+7UxbIONneuk+b62r95b0yzSskFZltmHazBbRR
         26aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=+8I/V7LMKeEgdjfech8pVN3rLVcrkyoXC3NkYpHqx50=;
        b=hhP2CS0qqw4WwU4uXYBWzFhwRWEpwsSBIVKk9Th/2EquiF5eimcGfEiXMr8R5oWSsz
         HWjqAxnpToE25sWKBmYwY5CbwR8jqzvzWkjb9JyyFlbQVW/5KNdj8tfsyEfPfvii3deM
         5y0ay4X9S3iGB0plYWoEgAzGxA/PEb5xbom+ebkr9PoK4fJ5chMxxkEAQkv+Gf/V+EFb
         11KlCP829/QdBqvB/pxPt9UfBruTErSExBgphZsuaXBMO0aMLfOnkRZKTd4TuCeWeuRP
         3OqHEpnjQ4IeMu+llqxMlAhnG638KPdr2F7JfwJGHVh0zIW8SWHxOcuAUkhmdNPBByyV
         7BnA==
X-Gm-Message-State: AOAM532kcGSnCJgLVElkkDbRdIUrLleQ8MKETFSuzp+ASA/74sl7A4pH
	GGV2mvEfMABk6kWOKbTDFhtOfA==
X-Google-Smtp-Source: ABdhPJx3Zx++4poidmZxiaKiNp7huRBp+c07iQ/2xxhDNM88zR5W38PXzrrhlyBTtk2qm0T1kR/z9Q==
X-Received: by 2002:ac8:59c8:0:b0:2de:5f4:7e84 with SMTP id f8-20020ac859c8000000b002de05f47e84mr16487539qtf.97.1646052535083;
        Mon, 28 Feb 2022 04:48:55 -0800 (PST)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id y24-20020a05620a09d800b00648c8ba03c1sm4906437qky.107.2022.02.28.04.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 04:48:54 -0800 (PST)
Message-ID: <1b2ce01fb04f29cca58d40bd81d9f4cc46dcebf8.camel@ndufresne.ca>
Subject: Re: [RFC PATCH 2/8] media: Add P010 format
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Jernej Skrabec <jernej.skrabec@gmail.com>,
 ezequiel@vanguardiasur.com.ar,  p.zabel@pengutronix.de
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
 gregkh@linuxfoundation.org,  wens@csie.org, samuel@sholland.org,
 linux-media@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org,  linux-staging@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,  linux-sunxi@lists.linux.dev
Date: Mon, 28 Feb 2022 07:48:53 -0500
In-Reply-To: <20220227144926.3006585-3-jernej.skrabec@gmail.com>
References: <20220227144926.3006585-1-jernej.skrabec@gmail.com>
	 <20220227144926.3006585-3-jernej.skrabec@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.3 (3.42.3-1.fc35) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Le dimanche 27 février 2022 à 15:49 +0100, Jernej Skrabec a écrit :
> Add P010 format, which is commonly used for 10-bit videos.

There is a much more complete patch that was sent previously (with documentation
and all):

https://patchwork.kernel.org/project/linux-rockchip/patch/20210618131526.566762-5-benjamin.gaignard@collabora.com/

regards,
Nicolas

> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  drivers/media/v4l2-core/v4l2-common.c | 2 ++
>  drivers/media/v4l2-core/v4l2-ioctl.c  | 1 +
>  include/uapi/linux/videodev2.h        | 1 +
>  3 files changed, 4 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> index 1db0020e08c0..4ede36546e9c 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -275,6 +275,8 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
>  		{ .format = V4L2_PIX_FMT_YUV422P, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 2, .vdiv = 1 },
>  		{ .format = V4L2_PIX_FMT_GREY,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
>  
> +		{ .format = V4L2_PIX_FMT_P010,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 2, 4, 0, 0 }, .hdiv = 2, .vdiv = 2 },
> +
>  		/* Tiled YUV formats */
>  		{ .format = V4L2_PIX_FMT_NV12_4L4, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 2, .vdiv = 2 },
>  		{ .format = V4L2_PIX_FMT_P010_4L4, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 2, 4, 0, 0 }, .hdiv = 2, .vdiv = 2 },
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 048f326c57b9..a8d999e23e5b 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1295,6 +1295,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	case V4L2_PIX_FMT_M420:		descr = "YUV 4:2:0 (M420)"; break;
>  	case V4L2_PIX_FMT_NV12:		descr = "Y/CbCr 4:2:0"; break;
>  	case V4L2_PIX_FMT_NV21:		descr = "Y/CrCb 4:2:0"; break;
> +	case V4L2_PIX_FMT_P010:		descr = "10-bit Y/CbCr 4:2:0"; break;
>  	case V4L2_PIX_FMT_NV16:		descr = "Y/CbCr 4:2:2"; break;
>  	case V4L2_PIX_FMT_NV61:		descr = "Y/CrCb 4:2:2"; break;
>  	case V4L2_PIX_FMT_NV24:		descr = "Y/CbCr 4:4:4"; break;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 772dbadd1a24..211bc11a48cb 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -597,6 +597,7 @@ struct v4l2_pix_format {
>  /* two planes -- one Y, one Cr + Cb interleaved  */
>  #define V4L2_PIX_FMT_NV12    v4l2_fourcc('N', 'V', '1', '2') /* 12  Y/CbCr 4:2:0  */
>  #define V4L2_PIX_FMT_NV21    v4l2_fourcc('N', 'V', '2', '1') /* 12  Y/CrCb 4:2:0  */
> +#define V4L2_PIX_FMT_P010    v4l2_fourcc('P', '0', '1', '0') /* 24  Y/CbCr 4:2:0 10-bit */
>  #define V4L2_PIX_FMT_NV16    v4l2_fourcc('N', 'V', '1', '6') /* 16  Y/CbCr 4:2:2  */
>  #define V4L2_PIX_FMT_NV61    v4l2_fourcc('N', 'V', '6', '1') /* 16  Y/CrCb 4:2:2  */
>  #define V4L2_PIX_FMT_NV24    v4l2_fourcc('N', 'V', '2', '4') /* 24  Y/CbCr 4:4:4  */

