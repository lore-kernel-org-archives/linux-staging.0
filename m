Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4E7134AA
	for <linux-staging@lists.linux.dev>; Thu,  9 Nov 2023 09:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nFmtRhet"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-28003daaaa6so611493a91.0
        for <linux-staging@lists.linux.dev>; Thu, 09 Nov 2023 01:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699522996; x=1700127796; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jCWyDTFOKGrYpot7V/hX2yRpK+Z5vWvoNFrsFbdVsv0=;
        b=nFmtRhetF4AezvzlAEVMp0/HlI00Mwqyh3IS+5tUOGe5NEElrMxRYr8xRxrE9K6q+W
         8DQyfz4FS5Il8ibjDl/96prOUQaj+kmOcUJJqkeWKlLoXRXLVu7ff1Axfc73jphtmCSr
         +xRd9H+nADFEyaV6SRbOlBH6NMTpasqYhduXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699522996; x=1700127796;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jCWyDTFOKGrYpot7V/hX2yRpK+Z5vWvoNFrsFbdVsv0=;
        b=D8SYM5TywVWhapnNmuVzjvV/6zSFtFOg8AQEMBUa7EMlVSYQx99HIbQ9LX2GryhcYS
         MEhCEBNemgskpAwHfa/sTwV8BFnn78nx6bIMY6/hndzuNhp9Ummv9wgbk9xwmU/nUuYe
         GicMVF+q0TFE2Pkh2ZyDROQnPJmri6/O+PygyreNnhkVXMkHD9WEgRP4xBW4/ra3GS44
         42SzJoz40TzHy4cX1PD02YPFFQwUeVq7LejxfOF/LRe28+vO9tkgbdLVTI69RGVp4nsF
         vEAfyaAo4jaUNmDVcXUFESk3zRx2gT7AtyX6Dpi6qGSFVBkz0H8LFYR5D3NjNm+bt/fG
         BvQA==
X-Gm-Message-State: AOJu0Yx3ypqeHrSuOgcXIqdV0CnUpQjmALAqLkZZwSHp05r3OaGqrWBA
	Ige70uKX5OuB6WIm5NZCGlHjWw==
X-Google-Smtp-Source: AGHT+IHYEn5vCWOVKWVvobQ08zsd30PXF4KGgrclxpMN4A+BTWHHxdRtGwc4VhxQDlQqRAmCiOe3vQ==
X-Received: by 2002:a17:90b:4b4f:b0:280:a27d:e897 with SMTP id mi15-20020a17090b4b4f00b00280a27de897mr1185437pjb.8.1699522995680;
        Thu, 09 Nov 2023 01:43:15 -0800 (PST)
Received: from chromium.org (0.223.81.34.bc.googleusercontent.com. [34.81.223.0])
        by smtp.gmail.com with ESMTPSA id 21-20020a17090a01d500b0027d0adf653bsm986244pjd.7.2023.11.09.01.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 01:43:15 -0800 (PST)
Date: Thu, 9 Nov 2023 09:43:11 +0000
From: Tomasz Figa <tfiga@chromium.org>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: mchehab@kernel.org, m.szyprowski@samsung.com, ming.qian@nxp.com,
	ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
	gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl,
	nicolas.dufresne@collabora.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
	kernel@collabora.com
Subject: Re: [PATCH v14 56/56] media: test-drivers: Use helper for
 DELETE_BUFS ioctl
Message-ID: <20231109094311.yzmmn4vvskmrk4tk@chromium.org>
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
 <20231031163104.112469-57-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231031163104.112469-57-benjamin.gaignard@collabora.com>

On Tue, Oct 31, 2023 at 05:31:04PM +0100, Benjamin Gaignard wrote:
> Allow test drivers to use DELETE_BUFS by adding vb2_ioctl_delete_bufs() helper.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  drivers/media/test-drivers/vicodec/vicodec-core.c |  2 ++
>  drivers/media/test-drivers/vimc/vimc-capture.c    |  2 ++
>  drivers/media/test-drivers/visl/visl-video.c      |  2 ++
>  drivers/media/test-drivers/vivid/vivid-core.c     | 13 ++++++++++---
>  4 files changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/test-drivers/vicodec/vicodec-core.c b/drivers/media/test-drivers/vicodec/vicodec-core.c
> index 69cbe2c094e1..f14a8fd506d0 100644
> --- a/drivers/media/test-drivers/vicodec/vicodec-core.c
> +++ b/drivers/media/test-drivers/vicodec/vicodec-core.c
> @@ -1339,6 +1339,7 @@ static const struct v4l2_ioctl_ops vicodec_ioctl_ops = {
>  	.vidioc_prepare_buf	= v4l2_m2m_ioctl_prepare_buf,
>  	.vidioc_create_bufs	= v4l2_m2m_ioctl_create_bufs,
>  	.vidioc_expbuf		= v4l2_m2m_ioctl_expbuf,
> +	.vidioc_delete_bufs	= v4l2_m2m_ioctl_delete_bufs,
>  
>  	.vidioc_streamon	= v4l2_m2m_ioctl_streamon,
>  	.vidioc_streamoff	= v4l2_m2m_ioctl_streamoff,
> @@ -1725,6 +1726,7 @@ static int queue_init(void *priv, struct vb2_queue *src_vq,
>  	dst_vq->mem_ops = &vb2_vmalloc_memops;
>  	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
>  	dst_vq->lock = src_vq->lock;
> +	dst_vq->supports_delete_bufs = true;

Since we have to explicitly provide the vidioc_delete_bufs callback anyway,
is there any value in having a separate supports_delete_bufs flag? Or we
envision that some drivers would support deleting buffers only for some
queues?

Best regards,
Tomasz
