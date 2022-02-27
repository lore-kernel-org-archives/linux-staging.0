Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6074A91;
	Sun, 27 Feb 2022 17:03:30 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id q17so14355846edd.4;
        Sun, 27 Feb 2022 09:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dANX2Nn44mbCP9zs92/BfwoXKsDqb2azTmCoigDg0oU=;
        b=LL2RxvR/1/nUpXagZ8ezOOBshFZ6Ut3TWhhpQTqimGrQSwON3CRmV6uP61RIU7jB0i
         8l+0YrcDznzwP7CtQOiO3ymzZ8OyL92WUsu9fIypR0iyv3/vyeD5LqMoy0zgyp9E9E0W
         rqZ1KLO/Bf0JwCQ5hbX9suKteBENqBaAAJJwSLvee4oNGb7H4+E3lcOGTyWZnTWrGomu
         XKJ5eMZvpwx0ztwmT9unP4kejlM3pecyWt4D+qKZWaWog8YSi/kB0e2zPhMKBVSsL4HM
         6lNkPX9sF7T466aXwy1AT3KikKt6f5046EMj+XIPVdQSkHeLcLeIU5wNx17UZU7cSDJW
         lPkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dANX2Nn44mbCP9zs92/BfwoXKsDqb2azTmCoigDg0oU=;
        b=CZpHCO/9Uule+imBjh3w03y+dz5GwkN79UNG5V7oSw+CMLzr7jCML56i7bxIckBrRW
         ZeY2tNIGEyV5iMT7WOZ9a6cqJDAcjMZ5rmZA06SMSE/fmlKyH775L0De/2haX3J3hunF
         slhbPFa7oGqdfRFQqdG91vlpxoPcy/r/Xn131yatLCOFXMh1D1YxXWz8ADMmMKTJKit+
         QsSFCVezRk1J3rsABZfrTOzHCVSwhGRwaakxm23ofekyGzpp++vrK37r90dmcD6lkeJa
         zxB9YZwlT4iWao1YAHjK3erJCTiP2SERLuqVPaRWkQeT8yRN7xZIW8JLhm0KCBcdLNxb
         Bc/g==
X-Gm-Message-State: AOAM533j+3Xgqt4eWCxjMiZWFRgcoemRhxHVor7GOy6VBqXFLy8aHgjb
	AL83eH7/X+hT76jjx2pIIaw=
X-Google-Smtp-Source: ABdhPJwUjgrEmeNoJb0yPleFkeU4+PhfGM+FDV7S1txB8mcMnr2ykdbwmpn6pMLVCz48WjNv2ZCKkw==
X-Received: by 2002:a05:6402:372:b0:40a:bbf4:7973 with SMTP id s18-20020a056402037200b0040abbf47973mr15856901edw.399.1645981408694;
        Sun, 27 Feb 2022 09:03:28 -0800 (PST)
Received: from kista.localnet (cpe-86-58-32-107.static.triera.net. [86.58.32.107])
        by smtp.gmail.com with ESMTPSA id gq15-20020a170906e24f00b006cfba1c5433sm3587873ejb.172.2022.02.27.09.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Feb 2022 09:03:28 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de
Cc: mchehab@kernel.org, nicolas@ndufresne.ca, hverkuil-cisco@xs4all.nl, gregkh@linuxfoundation.org, wens@csie.org, samuel@sholland.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [RFC PATCH 0/8] media: hantro: Add 10-bit support
Date: Sun, 27 Feb 2022 18:03:26 +0100
Message-ID: <8898316.CDJkKcVGEf@kista>
In-Reply-To: <20220227144926.3006585-1-jernej.skrabec@gmail.com>
References: <20220227144926.3006585-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne nedelja, 27. februar 2022 ob 15:49:18 CET je Jernej Skrabec napisal(a):
> First two patches add 10-bit formats to UAPI, third extends filtering
> mechanism, fourth fixes incorrect assumption, fifth moves register
> configuration code to proper place, sixth and seventh enable 10-bit
> VP9 decoding on Allwinner H6 and last increases core frequency on
> Allwinner H6.

FYI, additional patch is needed for linear P010 output:
https://github.com/jernejsk/linux-1/commit/
28338c00749b821819690c9fd548fd5c311682b5

With that, only native format was not tested.

Regards,
Jernej

> 
> I'm sending this as RFC to get some comments:
> 1. format definitions - are fourcc's ok? are comments/descriptions ok?
> 2. is extended filtering mechanism ok?
> 
> I would also like if these patches are tested on some more HW.
> Additionally, can someone test tiled P010?
> 
> Please take a look.
> 
> Best regards,
> Jernej
> 
> Ezequiel Garcia (1):
>   media: Add P010 tiled format
> 
> Jernej Skrabec (7):
>   media: Add P010 format
>   media: hantro: Support format filtering by depth
>   media: hantro: postproc: Fix buffer size calculation
>   media: hantro: postproc: Fix legacy regs configuration
>   media: hantro: Store VP9 bit depth in context
>   media: hantro: sunxi: Enable 10-bit decoding
>   media: hantro: sunxi: Increase frequency
> 
>  drivers/media/v4l2-core/v4l2-common.c         |  3 ++
>  drivers/media/v4l2-core/v4l2-ioctl.c          |  2 +
>  drivers/staging/media/hantro/hantro.h         |  4 ++
>  drivers/staging/media/hantro/hantro_drv.c     | 23 +++++++++
>  .../staging/media/hantro/hantro_g2_vp9_dec.c  |  8 ---
>  .../staging/media/hantro/hantro_postproc.c    | 34 ++++++++++---
>  drivers/staging/media/hantro/hantro_v4l2.c    | 50 +++++++++++++++++--
>  drivers/staging/media/hantro/hantro_v4l2.h    |  3 ++
>  drivers/staging/media/hantro/sunxi_vpu_hw.c   | 13 ++++-
>  include/uapi/linux/videodev2.h                |  2 +
>  10 files changed, 122 insertions(+), 20 deletions(-)
> 
> -- 
> 2.35.1
> 
> 


