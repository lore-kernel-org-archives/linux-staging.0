Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998A733F1
	for <linux-staging@lists.linux.dev>; Tue, 17 Jan 2023 20:32:43 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id fd15so18285214qtb.9
        for <linux-staging@lists.linux.dev>; Tue, 17 Jan 2023 12:32:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=80XVCGq03uPtsV/B6FIva6jAl8T2rvyiR6KKpMSI6gk=;
        b=AUo3v8xi0qEL/vwET6vGICV/lujUZAhP1LVUDBTvFioT3eJs9L8RkV3T/8snIbg3qh
         EDvpeqAU7QgBSvrNFzeVUKCDDEZJAgGONyMLTzcyvG9NHLXS3F4kZFogbSPpIURdjJv5
         PJ6P4rtxnXNOc31kZ5Rip0v5bkYU00R42tTUxr+h4jFeuGz0ysOP+++rpT0s6Qt/nlqR
         rrZyuv6WW2vzwo6z78cANJ9G0P+CEgVelFoupaW/Inzbdld4XpsSYHx8ZexdqeT3QNDn
         A4HM+5tQLCozyZk/kBj+wo0kTTMWd5f3CFVMQykGA1CjG5yyXy4CkkEiN6nnKDLy/nVl
         3cvg==
X-Gm-Message-State: AFqh2koKJM0RA6u2xf52nPJv+B00X79b2cuCZ3wSfMKFal2YE1ZB/AGT
	R1iZhUE6A0WxNCGzDD1P+QaVh2bPSRL8hQ==
X-Google-Smtp-Source: AMrXdXubB8bkJfcpfr/FyLY4F4bO64CwCt7nYnz0/wL3r5l9bXXCEpFajNKuv7ta3xuFbrFENqnUzQ==
X-Received: by 2002:ac8:12ca:0:b0:3a8:2d6:521e with SMTP id b10-20020ac812ca000000b003a802d6521emr40505891qtj.37.1673987562251;
        Tue, 17 Jan 2023 12:32:42 -0800 (PST)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id z26-20020ac8711a000000b003b62dcbedb8sm4140554qto.74.2023.01.17.12.32.41
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 12:32:41 -0800 (PST)
Received: by mail-yb1-f172.google.com with SMTP id a9so18906547ybb.3
        for <linux-staging@lists.linux.dev>; Tue, 17 Jan 2023 12:32:41 -0800 (PST)
X-Received: by 2002:a25:9801:0:b0:7d5:b884:3617 with SMTP id
 a1-20020a259801000000b007d5b8843617mr449162ybo.380.1673987561135; Tue, 17 Jan
 2023 12:32:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221226094820.1157244-1-cuigaosheng1@huawei.com>
In-Reply-To: <20221226094820.1157244-1-cuigaosheng1@huawei.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Jan 2023 21:32:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVT1d1V78o5fTiEP5RmbYCNqpKJR_1A7e_RJABA1STpYQ@mail.gmail.com>
Message-ID: <CAMuHMdVT1d1V78o5fTiEP5RmbYCNqpKJR_1A7e_RJABA1STpYQ@mail.gmail.com>
Subject: Re: [PATCH -next] media: staging: stkwebcam: Fix the build error with stkwebcam
To: Gaosheng Cui <cuigaosheng1@huawei.com>
Cc: mchehab@kernel.org, gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl, 
	ribalda@chromium.org, neil.armstrong@linaro.org, geert+renesas@glider.be, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Gaosheng,

On Mon, Dec 26, 2022 at 10:48 AM Gaosheng Cui <cuigaosheng1@huawei.com> wrote:
> When I am building the kernel on arm64, set config CONFIG_USB=m &&
> CONFIG_VIDEO_STKWEBCAM=y, I get some error reports as follows:
>   drivers/staging/media/deprecated/stkwebcam/stk-webcam.o: In
>     function `stk_v4l_dev_release':
>   stk-webcam.c:(.text+0x3e0): undefined reference to `usb_put_intf'
>   stk-webcam.c:(.text+0x3e8): undefined reference to `usb_put_dev'
>   drivers/staging/media/deprecated/stkwebcam/stk-webcam.o: In
>   function `stk_clean_iso':
>   stk-webcam.c:(.text+0xb0c): undefined reference to `usb_kill_urb'
>   stk-webcam.c:(.text+0xb14): undefined reference to `usb_free_urb'
>
> Fix it by add dependency option on USB for VIDEO_STKWEBCAM.
>
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>

Thanks for your patch!

> --- a/drivers/staging/media/deprecated/stkwebcam/Kconfig
> +++ b/drivers/staging/media/deprecated/stkwebcam/Kconfig
> @@ -2,7 +2,7 @@
>  config VIDEO_STKWEBCAM
>         tristate "USB Syntek DC1125 Camera support (DEPRECATED)"
>         depends on VIDEO_DEV
> -       depends on MEDIA_USB_SUPPORT && MEDIA_CAMERA_SUPPORT
> +       depends on USB && MEDIA_USB_SUPPORT && MEDIA_CAMERA_SUPPORT
>         help
>           Say Y here if you want to use this type of camera.
>           Supported devices are typically found in some Asus laptops,

I think Arnd's patch[1] is better, as it also fixes the modular
MEDIA_SUPPORT case.

[1] "[PATCH] staging: media: stkwebcam: add USB dependency"
    https://lore.kernel.org/all/20230117165851.2300111-1-arnd@kernel.org
Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
