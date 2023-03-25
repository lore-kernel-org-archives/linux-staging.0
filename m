Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315C47F;
	Sat, 25 Mar 2023 07:14:43 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id ek18so16106843edb.6;
        Sat, 25 Mar 2023 00:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679728481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tKSigRHH+PS1fXr6YtfPL0lgeDwBUnudMTVAS6GkLQA=;
        b=iad1hEloIeNWTkeC7J3lNjpD3n3CrQROpyL59K1nwy53c3XvO2utqbKhsiRxIbfygw
         q89h6R8+TUn6imm2/erN2rRB4rc/7Efp/eMygldgyfD4X+hrMINbDaWkBXf/bieshJ+Y
         UzLkakckWt5RvcDAeAPAuUVFFq23Ka5Y0LTsZRhnbCIuFN18x03lDPkbOQ7B4jqeeso+
         gGabt4Ob/AFF5+/D4lEyHiu94xPeioaevJNcCdVViD9Le+3RDprA4FarEtnkIBg1SPem
         LJEHRf/lOX2LPThvu78vCRDwQWIctyJjtspCeTUbNzj8aM09X6u53u1pmc4gBn+i0PQ/
         gQTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679728481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tKSigRHH+PS1fXr6YtfPL0lgeDwBUnudMTVAS6GkLQA=;
        b=VLos4XHFk69m8acNrfnvr7QmYlVJOV0uOMq/8sSZMobDWD3+c3tk+QUM8TsgC5IVPN
         DRRQhdwXty6Zts+fpVoniu7Tf80qDb3BjxEe1F8FCkQWtHoyFydcq9iL1tI26OozIZju
         JkZ2KLVNv4Ge752SFPhp8SZwtIyGPFkwe8U4zejhONNwHQRGX95GUDSmMsj3sgQFa/RB
         VFy7449b2mifc9fesbdTDfqwiSY/4Z1CWdePIGWi8EQPQkdE7dl8ppLuZwMsQ2CQmQEu
         IEdEpsWrXe7vD+t/atMHZiJJyNo62fGyuYOPLt3VoBpyPVeid/ad4LMJtEIrzbC4uUGI
         SUXg==
X-Gm-Message-State: AO0yUKVgfggeMwC1/ZpLzz5fF3ivC4pSj6LKBIbCCryydmjLHX9rvDkm
	SFdBooyJjV8XFkw6AkxPckI=
X-Google-Smtp-Source: AK7set8uTpTaUFXnqv8P2EaUXEm89ZCDBdhR1oDYkEehQSByi6yexPuTTUhvxT/8GXRy4pfLDtjB9Q==
X-Received: by 2002:a05:6402:b8c:b0:4b6:821e:1859 with SMTP id cf12-20020a0564020b8c00b004b6821e1859mr11650958edb.7.1679728481194;
        Sat, 25 Mar 2023 00:14:41 -0700 (PDT)
Received: from kista.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id s12-20020a50d48c000000b005023aaf52desm58357edi.95.2023.03.25.00.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 00:14:40 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Adam Pigg <adam@piggz.co.uk>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject:
 Re: [PATCH 8/9] media: sun6i-isp: capture: Implement MC I/O with extended
 enum_fmt
Date: Sat, 25 Mar 2023 08:14:39 +0100
Message-ID: <1923234.PYKUYFuaPT@kista>
In-Reply-To: <20230324151228.2778112-9-paul.kocialkowski@bootlin.com>
References:
 <20230324151228.2778112-1-paul.kocialkowski@bootlin.com>
 <20230324151228.2778112-9-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 24. marec 2023 ob 16:12:27 CET je Paul Kocialkowski napisal(a):
> This driver needs the media-controller API to operate and should not be
> considered as a video-device-centric implementation.
> 
> Properly report the IO_MC device cap and extend the enum_fmt
> implementation to support enumeration with an explicit mbus_code.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  .../staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c    | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
> index 1595a9607775..5160b93b69ff 100644
> --- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
> +++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
> @@ -439,6 +439,12 @@ static int sun6i_isp_capture_enum_fmt(struct file *file, void *private,
>  				      struct v4l2_fmtdesc *fmtdesc)
>  {
>  	u32 index = fmtdesc->index;
> +	u32 mbus_code = fmtdesc->mbus_code;

Nit: reverse christmas tree

Other than that:
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> +
> +	if (mbus_code && !sun6i_isp_proc_format_find(mbus_code))
> +		return -EINVAL;
> +
> +	/* Capture format is independent from proc format. */
>  
>  	if (index >= ARRAY_SIZE(sun6i_isp_capture_formats))
>  		return -EINVAL;
> @@ -685,7 +691,8 @@ int sun6i_isp_capture_setup(struct sun6i_isp_device *isp_dev)
>  
>  	strscpy(video_dev->name, SUN6I_ISP_CAPTURE_NAME,
>  		sizeof(video_dev->name));
> -	video_dev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
> +	video_dev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING |
> +				 V4L2_CAP_IO_MC;
>  	video_dev->vfl_dir = VFL_DIR_RX;
>  	video_dev->release = video_device_release_empty;
>  	video_dev->fops = &sun6i_isp_capture_fops;
> -- 
> 2.39.2
> 
> 


