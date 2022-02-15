Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9031578;
	Tue, 15 Feb 2022 16:14:51 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id w11so32987747wra.4;
        Tue, 15 Feb 2022 08:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=csNEKQKXZYs0Wbz+5J/UFBhsGdQCNtddqOoWSf3udBI=;
        b=VZ17/1E4s5XtF6FccGvOhBXz1wTXHx2fZTDNfE3vILbAIRMnAarfPPoyoh5VzG/MxU
         IOYglvaCFW7BRkmJWr69+DCG9MdH1KRXNo1hTok+9F+ndUZb+cw/EZAPB53lB0KOMMvd
         678woltWRAJcJK/myzihqagX220S/me09FooDgOTYgWBL412by8XlDhmGECO+C5iG1vs
         wW1AJjIlxzPUoasVOV2+kBrPCd9fKZj73eGBEEtaMi7DIxQ3wM0jlECoXSz2BbF9rHPv
         2ghBOtqsH7YPkeezizuFl/p37DGK7yxUhvg6BKo879YvWuMO0t95XPe09u2cf24LAUdz
         aNdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=csNEKQKXZYs0Wbz+5J/UFBhsGdQCNtddqOoWSf3udBI=;
        b=OWbgCWhFKpFCGsFPFcaTXJ1dHVqfrC8ors7sPI4rvN4a97iMvWidZQ6KyhjZc6zueS
         RmcyAi5bt7k80IqJp06OKeuWXgJyZKV8ECEL10p8ijI0Wp9xk7UhAMitMAW2hymJfuR/
         /7u+ql4z2edYf0bhYT2NBRM6nI2dleO04yjGvFOg8GWPMq/LU9ks2EOQrUNPAAdcdOVq
         KnRaPPQkRc6kH5dYw80cC+j5o+GIlow+KLqyka82R8IpSKRkqXCQWeNxCHoy5KxJNT8R
         mHF6tNG9iWx93CpJLZjXzk9B2sDUku6YMPgogbz4Tqb8gza9mka/QRBYmWgFrvJByHrE
         JGXw==
X-Gm-Message-State: AOAM533GPzn8Dl42Zx0U4rru6d7Cul8gEbItRJC0VsZdPK+jpulaIDKB
	9jU37a0mwIvCMCn0yOs4RkQ=
X-Google-Smtp-Source: ABdhPJzGh6/pqxlCvaSd1g20cak5NbmWfQheK5MBk8dXKrdh23qIZCAK5ZLWnt0SRgOimwDeSP3qfw==
X-Received: by 2002:a05:6000:24a:: with SMTP id m10mr3859914wrz.367.1644941689955;
        Tue, 15 Feb 2022 08:14:49 -0800 (PST)
Received: from kista.localnet (cpe-86-58-32-107.static.triera.net. [86.58.32.107])
        by smtp.gmail.com with ESMTPSA id l26sm14990465wmp.31.2022.02.15.08.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 08:14:49 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: mchehab@kernel.org, ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de, gregkh@linuxfoundation.org, mripard@kernel.org, paul.kocialkowski@bootlin.com, wens@csie.org, hverkuil-cisco@xs4all.nl, jonas@kwiboo.se, nicolas@ndufresne.ca, Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, kernel@collabora.com, knaerzche@gmail.com, jc@kynesim.co.uk, Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: Re: [RFC v2 0/8] Move HEVC stateless controls out of staging
Date: Tue, 15 Feb 2022 17:14:48 +0100
Message-ID: <14572059.tv2OnDr8pf@kista>
In-Reply-To: <20220215110103.241297-1-benjamin.gaignard@collabora.com>
References: <20220215110103.241297-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Benjamin!

Dne torek, 15. februar 2022 ob 12:00:55 CET je Benjamin Gaignard napisal(a):
> This series aims to make HEVC uapi stable and usable for hardware
> decoder. HEVC uapi is used by 2 mainlined drivers (Cedrus and Hantro)
> and 2 out of the tree drivers (rkvdec and RPI).
> 
> The 3 first patches are from Hans to implement v4l2 dynamic control
> feature which is need by patch 7 for 
V4L2_CID_STATELESS_HEVC_ENTRY_POINT_OFFSET
> definition.

Great, I'll test this soon on Cedrus, but I can't promise it will be this 
week.

> 
> Patch 4 move the existing uapi to stable, including definitions renaming 
> and CID number change to fit with v4l2 naming.

This should be last patch in series, otherwise you're changing stable uAPI, 
even if only few commits later.

Best regards,
Jernej

> 
> Patches 5 and 7 add fields needed for rkvdec and RPI decoders.
> 
> Patches 6 is cleaning up the uapi of useless field.
> Patches 8 change one field description and name to define offset by
> bytes rather than by bits
> 
> Benjamin
> 
> Benjamin Gaignard (5):
>   media: uapi: Move HEVC stateless controls out of staging
>   media: uapi: Add fields needed for RKVDEC driver
>   media: uapi: Remove bit_size field from v4l2_ctrl_hevc_slice_params
>   media: uapi: Add V4L2_CID_STATELESS_HEVC_ENTRY_POINT_OFFSET control
>   media: uapi: Change data_bit_offset definition
> 
> Hans Verkuil (3):
>   videodev2.h: add V4L2_CTRL_FLAG_DYNAMIC_ARRAY
>   v4l2-ctrls: add support for dynamically allocated arrays.
>   vivid: add dynamic array test control
> 
>  .../userspace-api/media/drivers/hantro.rst    |   5 -
>  .../media/v4l/ext-ctrls-codec.rst             |  58 ++--
>  .../media/v4l/vidioc-queryctrl.rst            |   8 +
>  .../media/test-drivers/vivid/vivid-ctrls.c    |  15 ++
>  drivers/media/v4l2-core/v4l2-ctrls-api.c      | 103 ++++++--
>  drivers/media/v4l2-core/v4l2-ctrls-core.c     | 182 ++++++++++---
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  32 +--
>  drivers/media/v4l2-core/v4l2-ctrls-priv.h     |   3 +-
>  drivers/media/v4l2-core/v4l2-ctrls-request.c  |  13 +-
>  drivers/staging/media/hantro/hantro_drv.c     |  27 +-
>  drivers/staging/media/hantro/hantro_hevc.c    |   8 +-
>  drivers/staging/media/sunxi/cedrus/cedrus.c   |  24 +-
>  .../staging/media/sunxi/cedrus/cedrus_dec.c   |  10 +-
>  .../staging/media/sunxi/cedrus/cedrus_h265.c  |  13 +-
>  include/linux/hantro-media.h                  |  17 ++
>  include/media/hevc-ctrls.h                    | 250 ------------------
>  include/media/v4l2-ctrls.h                    |  48 +++-
>  include/uapi/linux/v4l2-controls.h            | 224 ++++++++++++++++
>  include/uapi/linux/videodev2.h                |   8 +
>  19 files changed, 640 insertions(+), 408 deletions(-)
>  create mode 100644 include/linux/hantro-media.h
>  delete mode 100644 include/media/hevc-ctrls.h
> 
> -- 
> 2.32.0
> 
> 
> 


