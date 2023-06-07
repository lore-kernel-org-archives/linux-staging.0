Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7021D1ACB5
	for <linux-staging@lists.linux.dev>; Wed,  7 Jun 2023 15:24:23 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-565c7399afaso84003737b3.1
        for <linux-staging@lists.linux.dev>; Wed, 07 Jun 2023 08:24:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686151462; x=1688743462;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EQN/vgm9QEjhz2CmAuEj3hHoQIOxHnpZb3XEwqj7JAE=;
        b=NrdodVIn7YMRrdSGGWC5XiQUFlswp6Geub7kuy2ZQM6g8m66a8uW9FZLp4W3YMCbtm
         ASbNCvmcMAoCm8f19SFPrU9yf77FNH53gKOQaveqmWQh+KtQGos5FvaXlp/RILkHPRfz
         uT3znpJjapZPHN0cWxbjo7yOvd1px2xnFyVt6ZMAzTnOTgPNr2FeAfFR9v6kbEemKP1s
         NrA6gQ4TorfqSBmd1I6ZDoN+AaYohu/W7z+jyjycDD17OrliRXt0M+SwLpsKJFJgYtJT
         eW3SR0xu6YWAAmE9kbwaCKwltNG7N+7XhV/pzg3k6h4B1pM2oFE5WgO7yye4/hbVfjk7
         5DSg==
X-Gm-Message-State: AC+VfDwa8BYZ6oNIMgwjggzFoVP0ZuwD/tLGRuSXnoDNpnNtsfCxdCY6
	XrRnjLghufNp4tVn89l4qhj4tjN5bBP4dg==
X-Google-Smtp-Source: ACHHUZ4JnSrQKovkLmthPyLMCrd2r+ihE9ZYFW3bK4getCwfC2Z/pEsjw5qDJJLLWZ3JxGB3p4CJMg==
X-Received: by 2002:a81:6105:0:b0:55a:6430:e8fb with SMTP id v5-20020a816105000000b0055a6430e8fbmr7032293ywb.8.1686151462071;
        Wed, 07 Jun 2023 08:24:22 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id j190-20020a0dc7c7000000b00561e7ceb6edsm4821211ywd.121.2023.06.07.08.24.21
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 08:24:21 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-565c7399afaso84003387b3.1
        for <linux-staging@lists.linux.dev>; Wed, 07 Jun 2023 08:24:21 -0700 (PDT)
X-Received: by 2002:a0d:d44b:0:b0:565:8c16:a0e1 with SMTP id
 w72-20020a0dd44b000000b005658c16a0e1mr8139475ywd.13.1686151460917; Wed, 07
 Jun 2023 08:24:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230605144812.15241-1-tzimmermann@suse.de> <20230605144812.15241-31-tzimmermann@suse.de>
 <CAMuHMdVP2hrgXaZvASnHJ4M+VXaTCtfbeVXrq2dsEJqcs3G6ZA@mail.gmail.com> <e5d88ca8-66fe-b5ee-cb6b-2dc8f3a3fb26@suse.de>
In-Reply-To: <e5d88ca8-66fe-b5ee-cb6b-2dc8f3a3fb26@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 7 Jun 2023 17:24:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWBUKTgfCD9VLDFh_Tm1J-NJQHpxODs-TuYM7V-dtmGjA@mail.gmail.com>
Message-ID: <CAMuHMdWBUKTgfCD9VLDFh_Tm1J-NJQHpxODs-TuYM7V-dtmGjA@mail.gmail.com>
Subject: Re: [PATCH 30/30] fbdev: Make support for userspace interfaces configurable
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org, deller@gmx.de, 
	lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com, 
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-sh@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Wed, Jun 7, 2023 at 5:15=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
> Am 07.06.23 um 10:48 schrieb Geert Uytterhoeven:
> > On Mon, Jun 5, 2023 at 4:48=E2=80=AFPM Thomas Zimmermann <tzimmermann@s=
use.de> wrote:
> >> --- a/drivers/video/fbdev/Kconfig
> >> +++ b/drivers/video/fbdev/Kconfig
> >> @@ -57,6 +57,15 @@ config FIRMWARE_EDID
> >>            combination with certain motherboards and monitors are know=
n to
> >>            suffer from this problem.
> >>
> >> +config FB_DEVICE
> >> +        bool "Provide legacy /dev/fb* device"
> >
> > Perhaps "default y if !DRM", although that does not help for a
> > mixed drm/fbdev kernel build?
>
> We could simply set it to "default y".  But OTOH is it worth making it a
> default? Distributions will set it to the value they need/want. The very
> few people that build their own kernels to get certain fbdev drivers
> will certainly be able to enable the option by hand as well.

Defaulting to "n" (the default) means causing regressions when these
few people use an existing defconfig.

> > Or reserve "FB" for real fbdev drivers, and introduce a new FB_CORE,
> > to be selected by both FB and DRM_FBDEV_EMULATION?
> > Then FB_DEVICE can depend on FB_CORE, and default to y if FB.
>
> That wouldn't work. In Tumbleweed, we still have efifb and vesafb
> enabled under certain conditions; merely for the kernel console. We'd
> have to enable CONFIG_FB, which would bring back the device.

"Default y" does not mean that you cannot disable FB_DEVICE, so
you are not forced to bring back the device?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
