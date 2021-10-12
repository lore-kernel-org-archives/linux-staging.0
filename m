Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D312C80;
	Tue, 12 Oct 2021 15:34:23 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id r18so68245091wrg.6;
        Tue, 12 Oct 2021 08:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BP/Jzg1o84avvBiAAVMKsyPyktS8JE3pNY0emzlJRR4=;
        b=ECwqR6XRApqzjnKzFwgGgnGPhONoNpqYRGNWWmqUAk/S2Kl0ketM+2GZniFXr+WEHW
         Q/gR1ZiIJL6XEiiU5Xf/vYUrnHHzMxIkKLY76jNIEUEeXfPg4gDk80U/47j2kLsKTFY6
         mSSKzus4KuRovaOlCiCoB/JtSXXiGYgZZMMVrVyZ40TZFRIDyUZfF1RaiP+Drj6EfFPR
         G4os43c51rOxBbv+wtClXXDwV/5obJ2M9vZxWRVRaXOv043mRuRLoaVJZH4gRdN77F29
         TNiDok6/LdinixEar9eHYa1jVsKu3G6tbhg/kGlNTlrguc/7Sa2tFA9weEN1H8uTF6Ak
         VGnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BP/Jzg1o84avvBiAAVMKsyPyktS8JE3pNY0emzlJRR4=;
        b=K9abj5ZF0XSkZsl/NcFrpnlaZspwBUGD9rr7VOrND+lXyd7R6CkVmIHl7WxgdbQV5N
         81eT1dikHHzgw/Nz62D0YOIj92vndMS8TFgr41fH+XvC/EYMevhR3NHlzF/90AA4Bf6j
         GQ51Ph/falK2xjEWYMYnAZBUE57kkFAS4hyMBElcnXU30hzmFXgN9f59VjGHV42JggZJ
         BSvVs29fwZwNPKZJ25an+A+r/Vdf3ROmEM4Wf5sn/nEI46BxB0h+sUQRYwa8qOV58JeK
         wxLqsD3A2C5MnCOEaLcv8u/ZXCgGWPoBG/0GWq2JiocOcqu4kMN5z1EFBcsGvfP7HP+i
         3IBw==
X-Gm-Message-State: AOAM53096ClTOU3b3RSfv/23MyZfdF67ubSPwv0PF6H1CfhIGc7wdlzL
	4WX5tj+64SrmdCLyVPxW1Lw=
X-Google-Smtp-Source: ABdhPJxTqeLCMlwwJrqItDvWvZrbEbSTwEDtZ98ME6yzw3kWZ8DXDs4wp5uQOOcfJ4LNcmavhLTNQA==
X-Received: by 2002:adf:a387:: with SMTP id l7mr32531103wrb.214.1634052862098;
        Tue, 12 Oct 2021 08:34:22 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id q12sm2735972wmj.6.2021.10.12.08.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 08:34:21 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: mchehab@kernel.org, p.zabel@pengutronix.de, gregkh@linuxfoundation.org, mripard@kernel.org, paul.kocialkowski@bootlin.com, wens@csie.org, hverkuil-cisco@xs4all.nl, jc@kynesim.co.uk, ezequiel@vanguardiasur.com.ar, Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: Re: [PATCH v2 0/4]  media: HEVC: RPS clean up
Date: Tue, 12 Oct 2021 17:34:19 +0200
Message-ID: <21222555.EfDdHjke4D@kista>
In-Reply-To: <20211012143552.661751-1-benjamin.gaignard@collabora.com>
References: <20211012143552.661751-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Benjamin!

Dne torek, 12. oktober 2021 ob 16:35:48 CEST je Benjamin Gaignard napisal(a):
> This series aims to clean up Reference Picture Set usage and flags.
> 
> Long term flag was named with RPS prefix while it is not used for RPS
> but for mark long term references in DBP. Remane it and remove the two
> other useless RPS flags.
> 
> Clarify documentation about RPS lists content and make sure that Hantro
> driver use them correctly (i.e without look up in DBP).
> 
> These patches are the last in my backlog impacting HEVC uAPI.
> From my point of view, once they get merged, you could start talking
> about how move HEVC uAPI to stable.

With your changes, HEVC uAPI controls still won't be complete. Cedrus needs 
entry point control, which in turn needs dynamic array support. I'm a bit lazy 
implementing that control, but I guess I can take a look in a month or so. 
rkvdec also needs more fields for HEVC. With patches collected here:
https://github.com/LibreELEC/LibreELEC.tv/blob/master/projects/Rockchip/
patches/linux/default/linux-2001-v4l-wip-rkvdec-hevc.patch
fluster HEVC test score is reportedly 121/135 (8-bit tests only).

I would certainly wait with moving HEVC uAPI to stable.

Best regards,
Jernej

> 
> version 2:
> - change DPB field name from rps to flags
> 
> Please note that the only purpose of commits 3 and 4 is to allow to test
> G2 hardware block for IMX8MQ until a proper solution isuing power domain
> can be found. Do not merge them.
> 
> GStreamer HEVC plugin merge request can be found here:
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/1079
> 
> With those piece of code fluster score is 77/147.
> 
> Benjamin
> 
> Benjamin Gaignard (4):
>   media: hevc: Remove RPS named flags
>   media: hevc: Embedded indexes in RPS
>   media: hantro: Use syscon instead of 'ctrl' register
>   arm64: dts: imx8mq: Add node to G2 hardware
> 
>  .../media/v4l/ext-ctrls-codec.rst             | 14 +++---
>  arch/arm64/boot/dts/freescale/imx8mq.dtsi     | 43 +++++++++++++----
>  drivers/staging/media/hantro/hantro.h         |  5 +-
>  .../staging/media/hantro/hantro_g2_hevc_dec.c | 27 +++--------
>  drivers/staging/media/hantro/imx8m_vpu_hw.c   | 48 ++++++++++++-------
>  .../staging/media/sunxi/cedrus/cedrus_h265.c  |  2 +-
>  include/media/hevc-ctrls.h                    |  6 +--
>  7 files changed, 84 insertions(+), 61 deletions(-)
> 
> -- 
> 2.30.2
> 
> 


