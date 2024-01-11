Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F6E14F75
	for <linux-staging@lists.linux.dev>; Thu, 11 Jan 2024 11:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Orf1QRY+"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40e5451c13aso23091965e9.2
        for <linux-staging@lists.linux.dev>; Thu, 11 Jan 2024 03:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704971098; x=1705575898; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oZPGxlrX7BusY7TLHurUJ/YbEgD2UlLPEhETZEeCeag=;
        b=Orf1QRY+auCvumAgEu0NZdc5bMSkqW2N5k7w0gy8MLFL9E3osYTc6M51ThkpgDoOaz
         QH0Zji55zu4NfDI6qaQb6j695gBB5ryJlNRor6StPHrkG/4Txk5qEaxlnMYrPja3Mt/D
         HAlDw4trSCapKxkPpChthlKBXOfno0GcS6ksLHkaZIFWQew7G4ZtW8Gf1gLIX3G9qKVd
         3I+pjzL1yzlm4ssyaFMTtN6+vd5smUNZlbSztEQt0cIG7IHdVcuoKTWVWj2zDS5c6wJ6
         +BKctu4e7W+nQU13NFQn1KCqcvSIdQLLtPuI/jcL2RXrQXgOnEMcFgUdLWN0PJLiSmVJ
         Mkfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704971098; x=1705575898;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oZPGxlrX7BusY7TLHurUJ/YbEgD2UlLPEhETZEeCeag=;
        b=D2xoEiD0tc5R/NJp6o9/8LV6+Zdy1S8XzSu8/SC8eunZ3uXYUMcYcIecckdCtnY33y
         znYZ9x2Zn6OmVy4Lu+LZBs8fjj+I4B2sKPrJiPBP3pqb/mGJgoSDv2pbfIia3T850Cnv
         XgLs2mYFfKUKwyCeHLRsO1Rb7ereFXerT1v3oKk5ggHMAEE+z+lmEAVbXgprjofOKiJx
         v7PoOqMJ/1qx9ktbBHKW/x7xBGYoNvH/WZBYHxthDJy/J1zeWMU/d/VoEFsAUBPEljgt
         XMNJpC3zchxGPRb+D4SGH/PV3L9kRSuTxLNdndmxF2l8HXnJEs7bLsuTdXIgr/apAdNU
         hH5Q==
X-Gm-Message-State: AOJu0YyJiZowHwN9qXgRZZO+VDNdbLBEVMUSt4aNvnlDTClKt7ry6dmz
	MlUx6nk/tCe/WD4Ui+n7RXuw5Z9o9oRfog==
X-Google-Smtp-Source: AGHT+IF+XcaiCo8+aQz2iSRmrWzgdeHikwQTjy/cUNypVTY3l3kaz+y01SDv2jBQK/KU5ySGz3o/MQ==
X-Received: by 2002:a05:600c:4e8c:b0:40d:39d0:9916 with SMTP id f12-20020a05600c4e8c00b0040d39d09916mr228182wmq.246.1704971097287;
        Thu, 11 Jan 2024 03:04:57 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id o8-20020a05600c510800b0040e624995f1sm265160wms.8.2024.01.11.03.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 03:04:57 -0800 (PST)
Date: Thu, 11 Jan 2024 14:04:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Ming Qian <ming.qian@nxp.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mingjia Zhang <mingjia.zhang@mediatek.com>,
	Jack Zhu <jack.zhu@starfivetech.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 08/13] staging: media: starfive: Add for StarFive ISP
 3A SC
Message-ID: <a761d936-4f46-41c8-b6f8-c1761eddd42f@moroto.mountain>
References: <20240111084120.16685-1-changhuang.liang@starfivetech.com>
 <20240111084120.16685-9-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240111084120.16685-9-changhuang.liang@starfivetech.com>

On Thu, Jan 11, 2024 at 12:41:15AM -0800, Changhuang Liang wrote:
> Register ISP 3A "capture_scd" video device to receive statistics
> collection data.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../staging/media/starfive/camss/stf-buffer.h |   1 +
>  .../staging/media/starfive/camss/stf-camss.c  |   8 +
>  .../media/starfive/camss/stf-capture.c        |  21 ++-
>  .../media/starfive/camss/stf-isp-hw-ops.c     |  66 ++++++++
>  .../staging/media/starfive/camss/stf-isp.h    |  23 +++
>  .../staging/media/starfive/camss/stf-video.c  | 143 +++++++++++++++++-
>  .../staging/media/starfive/camss/stf-video.h  |   1 +
>  7 files changed, 254 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/staging/media/starfive/camss/stf-buffer.h b/drivers/staging/media/starfive/camss/stf-buffer.h
> index 9d1670fb05ed..727d00617448 100644
> --- a/drivers/staging/media/starfive/camss/stf-buffer.h
> +++ b/drivers/staging/media/starfive/camss/stf-buffer.h
> @@ -23,6 +23,7 @@ enum stf_v_state {
>  struct stfcamss_buffer {
>  	struct vb2_v4l2_buffer vb;
>  	dma_addr_t addr[2];
> +	void *vaddr;
>  	struct list_head queue;
>  };
>  
> diff --git a/drivers/staging/media/starfive/camss/stf-camss.c b/drivers/staging/media/starfive/camss/stf-camss.c
> index a587f860101a..3175d0d9a05c 100644
> --- a/drivers/staging/media/starfive/camss/stf-camss.c
> +++ b/drivers/staging/media/starfive/camss/stf-camss.c
> @@ -126,6 +126,7 @@ static int stfcamss_of_parse_ports(struct stfcamss *stfcamss)
>  static int stfcamss_register_devs(struct stfcamss *stfcamss)
>  {
>  	struct stf_capture *cap_yuv = &stfcamss->captures[STF_CAPTURE_YUV];
> +	struct stf_capture *cap_scd = &stfcamss->captures[STF_CAPTURE_SCD];
>  	struct stf_isp_dev *isp_dev = &stfcamss->isp_dev;
>  	int ret;
>  
> @@ -150,6 +151,13 @@ static int stfcamss_register_devs(struct stfcamss *stfcamss)
>  
>  	cap_yuv->video.source_subdev = &isp_dev->subdev;
>  
> +	ret = media_create_pad_link(&isp_dev->subdev.entity, STF_ISP_PAD_SRC_SCD,
> +				    &cap_scd->video.vdev.entity, 0, 0);
> +	if (ret)
> +		goto err_cap_unregister;
> +

Don't we need to do something like

	media_entity_remove_links(&cap_yuv->video.vdev.entity);

as part of the cleanup?  Also where do we clean up this new call to
media_create_pad_link() in the unregister process?

> +	cap_scd->video.source_subdev = &isp_dev->subdev;
> +
>  	return ret;
>  
>  err_cap_unregister:

regards,
dan carpenter
