Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E705033F1
	for <linux-staging@lists.linux.dev>; Tue, 17 Jan 2023 20:30:57 +0000 (UTC)
Received: by mail-vk1-f169.google.com with SMTP id c21so7231522vkn.10
        for <linux-staging@lists.linux.dev>; Tue, 17 Jan 2023 12:30:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EZfuHp/Lb3thRInaaLDpig3glVMpImoS79RTofhvspM=;
        b=5IKkCB6lg+c7Q7BKecBUu4jrY3KKBj2dCKr4XTwmKvwAsFCOIM3uyOxRj8lkMFcl2Y
         Ysa04jhtEKeylTu8Iq++8gUinSEzWINoRNt7FtIduEt/3ea5xJJBhWN2VSeyZtV99bdN
         2E8dCBYlLbWD2bhWFu7DsodLYXLUbsYSKmvxfYumrnCD0xoHS0+OgKHnvPppNkVj5XYW
         7atvongBvPNwEm/izmYAeWfKua1rxicA2xN1Wa+BTkJPMRlZGRtcGuHp89NMgvEh3l1I
         118aN1Yt3Qk0Fqb5zIxl721pdJubhjKvPlXRK5fgH1cnBZfhorprLxegmUEqy2M7oiu6
         Tg2g==
X-Gm-Message-State: AFqh2kr//sdK7nAXat3aQvik9UbQZRwToq61F22j3Hl55ZkZAw7IsY2g
	29yRZmI7PY/zjqjc3d+2VEsbloSFfFoWwg==
X-Google-Smtp-Source: AMrXdXu9lqyHgNBqctLzdoAjDf9Ir1p0ZwxMnU5RbJLuodV1GtcEOncyrJPgROYf4BYCqB4iIKgn8A==
X-Received: by 2002:a05:6122:1818:b0:3da:822e:4d70 with SMTP id ay24-20020a056122181800b003da822e4d70mr2644084vkb.12.1673987456544;
        Tue, 17 Jan 2023 12:30:56 -0800 (PST)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id y2-20020a05620a44c200b006e42a8e9f9bsm6945281qkp.121.2023.01.17.12.30.55
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 12:30:55 -0800 (PST)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-4b718cab0e4so439672417b3.9
        for <linux-staging@lists.linux.dev>; Tue, 17 Jan 2023 12:30:55 -0800 (PST)
X-Received: by 2002:a81:bd6:0:b0:48d:1334:6e38 with SMTP id
 205-20020a810bd6000000b0048d13346e38mr535340ywl.316.1673987455061; Tue, 17
 Jan 2023 12:30:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230117165851.2300111-1-arnd@kernel.org>
In-Reply-To: <20230117165851.2300111-1-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Jan 2023 21:30:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU4b4huZR=CMpgW3NzDS2x3O6DJ3mvSqfa68Q3QGmsrfA@mail.gmail.com>
Message-ID: <CAMuHMdU4b4huZR=CMpgW3NzDS2x3O6DJ3mvSqfa68Q3QGmsrfA@mail.gmail.com>
Subject: Re: [PATCH] staging: media: stkwebcam: add USB dependency
To: Arnd Bergmann <arnd@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, Arnd Bergmann <arnd@arndb.de>, 
	Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Gaosheng Cui <cuigaosheng1@huawei.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 17, 2023 at 5:58 PM Arnd Bergmann <arnd@kernel.org> wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> Before the move, this driver had implicit dependencies on both
> CONFIG_USB and MEDIA_SUPPORT, which can be =m even in combination
> with CONFIG_MEDIA_USB_SUPPORT=y, so without the dependency we
> get a link failure when USB is a loadable module but stkwebcam
> is built-in:
>
> arm-linux-gnueabi-ld: drivers/staging/media/deprecated/stkwebcam/stk-webcam.o: in function `stk_camera_probe':
> stk-webcam.c:(.text+0xcbc): undefined reference to `usb_get_dev'
> arm-linux-gnueabi-ld: stk-webcam.c:(.text+0xccc): undefined reference to `usb_get_intf'
> arm-linux-gnueabi-ld: stk-webcam.c:(.text+0xd68): undefined reference to `usb_put_intf'
> arm-linux-gnueabi-ld: stk-webcam.c:(.text+0xd70): undefined reference to `usb_put_dev'
> arm-linux-gnueabi-ld: drivers/staging/media/deprecated/stkwebcam/stk-webcam.o: in function `stk_prepare_iso':
> stk-webcam.c:(.text+0xfcc): undefined reference to `usb_free_urb'
> arm-linux-gnueabi-ld: stk-webcam.c:(.text+0x1010): undefined reference to `usb_alloc_urb'
> arm-linux-gnueabi-ld: stk-webcam.c:(.text+0x10d8): undefined reference to `usb_kill_urb'
>
> Add back the original dependency.
>
> Fixes: 1943fb1e50d1 ("media: staging/media: add a STAGING_MEDIA_DEPRECATED option")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Yeah, those pesky tristate->bool->tristate dependency chains...

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/staging/media/deprecated/stkwebcam/Kconfig
> +++ b/drivers/staging/media/deprecated/stkwebcam/Kconfig
> @@ -3,6 +3,7 @@ config VIDEO_STKWEBCAM
>         tristate "USB Syntek DC1125 Camera support (DEPRECATED)"
>         depends on VIDEO_DEV
>         depends on MEDIA_USB_SUPPORT && MEDIA_CAMERA_SUPPORT
> +       depends on USB && MEDIA_SUPPORT
>         help
>           Say Y here if you want to use this type of camera.
>           Supported devices are typically found in some Asus laptops,

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
