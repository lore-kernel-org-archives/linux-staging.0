Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32148BE6
	for <linux-staging@lists.linux.dev>; Wed,  7 Jun 2023 08:48:30 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-ba81deea9c2so7636946276.2
        for <linux-staging@lists.linux.dev>; Wed, 07 Jun 2023 01:48:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686127709; x=1688719709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dsdNCkGUa6qXmdS3+Kos2M1YnKfMadh9WwIme7Xf08U=;
        b=VEbdjfBfuWPjcUKMKCXVu1vmTqpWr/3bWSYqij9QFlN76atB6DmWqPMJP8fZVD7fMq
         ofyOAt7i3dK0gtbntOkYCYuRDJUxhUqltaI8lkowQvPgWdB/S4cGlJvI7v5w6Tdbq/kF
         RA6C/XBb30gB584UXMOBCO8atxzddtql0QEbyNhTQlUjomHgMlMx71crFmYSARKLb3vR
         MisQsNS/xdzp10+BfvDto8vZOaq9dpo2K7ibxGab1HyJO5jrdCnIZo9H1dj4/1oHYy4Z
         ToxPEOOkmoC9tjWIFl0mdtLp3vLEv+Ohz6iiYuuj/WdugYf8Xp6l3+H1dWSfAUBhLgGK
         8ozQ==
X-Gm-Message-State: AC+VfDw8fAKzHWOD0TTIE8P9lFK9MFK4Ec7RF5HdBjYSUHDKBhglNi/j
	BAgln5kbOszp5hCV8YZPi8YHzhRbvaxAUA==
X-Google-Smtp-Source: ACHHUZ6E9FoO/uZ+vCTXiZBQVCo0dYBP2VS2gyxcPzhNeVk8sgebERPM7SLox3/2yT7xZ3sYbLv82w==
X-Received: by 2002:a25:508d:0:b0:ba6:bd1e:615 with SMTP id e135-20020a25508d000000b00ba6bd1e0615mr4810959ybb.52.1686127709520;
        Wed, 07 Jun 2023 01:48:29 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id 184-20020a2515c1000000b00ba8752d3027sm3742243ybv.42.2023.06.07.01.48.27
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 01:48:27 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-565ba2c7554so71319427b3.3
        for <linux-staging@lists.linux.dev>; Wed, 07 Jun 2023 01:48:27 -0700 (PDT)
X-Received: by 2002:a81:7d41:0:b0:561:e2df:c4d1 with SMTP id
 y62-20020a817d41000000b00561e2dfc4d1mr5101826ywc.9.1686127706917; Wed, 07 Jun
 2023 01:48:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230605144812.15241-1-tzimmermann@suse.de> <20230605144812.15241-31-tzimmermann@suse.de>
In-Reply-To: <20230605144812.15241-31-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 7 Jun 2023 10:48:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVP2hrgXaZvASnHJ4M+VXaTCtfbeVXrq2dsEJqcs3G6ZA@mail.gmail.com>
Message-ID: <CAMuHMdVP2hrgXaZvASnHJ4M+VXaTCtfbeVXrq2dsEJqcs3G6ZA@mail.gmail.com>
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

Thanks for your patch!

On Mon, Jun 5, 2023 at 4:48=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
> Add Kconfig option CONFIG_FB_DEVICE and make the virtual fbdev
> device optional. If the new option has not been selected, fbdev
> does not create a files in devfs or sysfs.
>
> Most modern Linux systems run a DRM-based graphics stack that uses
> the kernel's framebuffer console, but has otherwise deprecated fbdev
> support. Yet fbdev userspace interfaces are still present.
>
> The option makes it possible to use the fbdev subsystem as console
> implementation without support for userspace. This closes potential
> entry points to manipulate kernel or I/O memory via framebuffers. It

I'd leave out the part about manipulating kernel memory, as that's a
driver bug, if possible.

> also prevents the execution of driver code via ioctl or sysfs, both
> of which might allow malicious software to exploit bugs in the fbdev
> code.

Of course disabling ioctls reduces the attack surface, and this is not
limited to fbdev... ;-)

I'm wondering if it would be worthwhile to optionally provide a more
limited userspace API for real fbdev drivers:
  1. No access to MMIO, only to the mapped frame buffer,
  2. No driver-specific ioctls, only the standard ones.

> A small number of fbdev drivers require struct fbinfo.dev to be
> initialized, usually for the support of sysfs interface. Make these
> drivers depend on FB_DEVICE. They can later be fixed if necessary.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

> --- a/drivers/video/fbdev/Kconfig
> +++ b/drivers/video/fbdev/Kconfig
> @@ -57,6 +57,15 @@ config FIRMWARE_EDID
>           combination with certain motherboards and monitors are known to
>           suffer from this problem.
>
> +config FB_DEVICE
> +        bool "Provide legacy /dev/fb* device"

Perhaps "default y if !DRM", although that does not help for a
mixed drm/fbdev kernel build?

Or reserve "FB" for real fbdev drivers, and introduce a new FB_CORE,
to be selected by both FB and DRM_FBDEV_EMULATION?
Then FB_DEVICE can depend on FB_CORE, and default to y if FB.

> +        depends on FB
> +        help
> +         Say Y here if you want the legacy /dev/fb* device file. It's
> +         only required if you have userspace programs that depend on
> +         fbdev for graphics output. This does not effect the framebuffer

affect

> +         console.
> +
>  config FB_DDC
>         tristate
>         depends on FB

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
