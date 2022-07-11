Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199252F33
	for <linux-staging@lists.linux.dev>; Mon, 11 Jul 2022 21:16:05 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id j22so10965536ejs.2
        for <linux-staging@lists.linux.dev>; Mon, 11 Jul 2022 14:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R0dZKbSqpa4RMujXbJGg6O0Ik7zsKtCn/44ZHpByEck=;
        b=e6FVL2N1GoCx6ewvM5xcIt8X8A6DT47CZWwxmgZ6VEhVfW/hLzx4AqmMaA8ZxTGFWS
         uYsECq9XltW1jX3WXVDCSl4hyA9wycz2iyuri01alyZn2ODyJEot44R/twY9O5rDye4a
         okyW5qblZM0/RglcNNdkRWagXv8tPsS3+AXd314ElWLjuM77zrlG4L/FF+NpVR2YLvre
         Egz2+eM0ShDiJiiv8apuJHGtKQXg0HaU7gPvRPFxF6UE4x4PTRSalTbp4Nan52wvFcYl
         c/LTWEM3iI+8HolUo3hHSptP5Ux92BrNrF/ln3ThBN9BCLSH90A3+Pd7o1pLhD6YRk89
         TP2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R0dZKbSqpa4RMujXbJGg6O0Ik7zsKtCn/44ZHpByEck=;
        b=QJA3W1QfhchXX+qDzpUD9WIk1jiEAoRBJ7e26qXwuK5dkgFicUdmRcCsBJhaUDqOcN
         0PBcmQCeQW8SXGfvSSm7x/dGMtAZSIn35nzJ4GKrHj6DeEMyx8wSr8HaKVUR9RGwx2sI
         hpE8Y+H/2FU6MIaCkegvWpV72SQbXPdqXq2fXSrlsnKdNMDSoMySJAyKmuzCd2BzvW5a
         GHSUb1wUhYOmGX06uIitvYgRsxwCy07NxRbITENnxzspu66gTRc02czpcw4H8T75QG2t
         znk4fMjYmKlkkCyf0gLrwwocBYbEor841SnaPVDH8elrZHpSaUVg3aNnGyUJ+O//cv35
         hCBQ==
X-Gm-Message-State: AJIora/6XYnU2/6WOzDBqbsGKEqtno33aT1cz8d3lHHg2Y3VT58VRLTv
	Iud6xEzoZhYQo0KauSMq53fFcnA0xbjOqMWXzTxaPA==
X-Google-Smtp-Source: AGRyM1tGmmZU3SpBCKiz6GQosaxZhhIYryeBP+xKYRre/YM9KWGoV/EtlPDw7fJzN8sXY5wD80lfJtt1tOD20TpLJD0=
X-Received: by 2002:a17:906:5a5b:b0:72b:39cf:6042 with SMTP id
 my27-20020a1709065a5b00b0072b39cf6042mr13921828ejc.301.1657574163407; Mon, 11
 Jul 2022 14:16:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220706182901.78949-1-jernej.skrabec@gmail.com>
In-Reply-To: <20220706182901.78949-1-jernej.skrabec@gmail.com>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Mon, 11 Jul 2022 18:15:52 -0300
Message-ID: <CAAEAJfBYXXZ2CGFTQFEsBNGu8++MW=jsXNpO1F8T-K2m-jAu7A@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] media: hantro: Add 10-bit support
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Greg KH <gregkh@linuxfoundation.org>, 
	linux-media <linux-media@vger.kernel.org>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	"open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Jernej,

On Wed, Jul 6, 2022 at 3:29 PM Jernej Skrabec <jernej.skrabec@gmail.com> wrote:
>
> This series adds support for 10-bit format handling in Hantro driver.
> Most patches adjust postproc behaviour to be more universal. There is
> a lot of assumptions, which need to be replaced with more generalized.
>
> Tested on Allwinner H6. Tested with vp92-2-20-10bit-yuv420.webm sample,
> which produces correct checksum.
>
> Please take a look.
>

Looks really good.

Thanks for working on this.
Ezequiel

> Best regards,
> Jernej
>
> Changes fron v2:
> - rebased on media-stage/master
> - added P010 4L4 format documentation
> - added t-b and r-b tags
>
> Changes from RFC:
> - fixed typo in function name
> - removed merged patch (P010 format)
> - removed broken patch (sunxi frequency change)
> - added new patch (media: hantro: postproc: Properly calculate chroma offset)
> - added r-b from Ezequiel
>
> Ezequiel Garcia (1):
>   media: Add P010 tiled format
>
> Jernej Skrabec (6):
>   media: hantro: Support format filtering by depth
>   media: hantro: postproc: Fix buffer size calculation
>   media: hantro: postproc: Fix legacy regs configuration
>   media: hantro: postproc: Properly calculate chroma offset
>   media: hantro: Store VP9 bit depth in context
>   media: hantro: sunxi: Enable 10-bit decoding
>
>  .../media/v4l/pixfmt-yuv-planar.rst           | 18 +++++--
>  drivers/media/v4l2-core/v4l2-common.c         |  1 +
>  drivers/media/v4l2-core/v4l2-ioctl.c          |  1 +
>  drivers/staging/media/hantro/hantro.h         |  4 ++
>  drivers/staging/media/hantro/hantro_drv.c     | 23 +++++++++
>  .../staging/media/hantro/hantro_g2_vp9_dec.c  |  8 ---
>  .../staging/media/hantro/hantro_postproc.c    | 38 +++++++++++---
>  drivers/staging/media/hantro/hantro_v4l2.c    | 50 +++++++++++++++++--
>  drivers/staging/media/hantro/hantro_v4l2.h    |  3 ++
>  drivers/staging/media/hantro/sunxi_vpu_hw.c   | 27 ++++++++++
>  include/uapi/linux/videodev2.h                |  1 +
>  11 files changed, 151 insertions(+), 23 deletions(-)
>
> --
> 2.37.0
>
