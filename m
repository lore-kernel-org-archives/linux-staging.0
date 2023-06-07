Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398F41104
	for <linux-staging@lists.linux.dev>; Wed,  7 Jun 2023 08:35:15 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-565a022ef06so87636297b3.3
        for <linux-staging@lists.linux.dev>; Wed, 07 Jun 2023 01:35:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686126915; x=1688718915;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tl7bhCDuACQlGnVS8msclVNyzt7m2ZyWzQXQ4o8Ijq4=;
        b=lFY+4qO65PuzWUh4nIqvs6KrZk048YJT02e2OgJG1pkXmZlr25oE+DHCyV0WXkGz1d
         zRD7o9wQv+bkENNQoHax+IZrDLXgri4G6CYGK9cntHKis3yom3oCRAv4IXKU+SDXc+yb
         DH8eNAeAWWbz7h99yRL6st5KrsDqfYBCbxjsiTMVMT4XCiZLtUAI21tzhLMCbG5qhmuf
         bdak+bv5gLpgFdj3yUyrrzFKAGuhAS+z+UBval2EEytV/p4rEGS6tDk2W/fQ6zz/KfR1
         Wx0qW/mV51H7Vn4VOuqNwawZsQkbxHI/+PpiKWcI391BGWv0DzVcLDBhqTncyeEhxB3E
         z3WA==
X-Gm-Message-State: AC+VfDxtnUc7HhRBDt1sTb9DWaR6pc9smz39OQp75WQ7+pKzoT2Yrq3+
	g9EHDQSHtYdXz6mwfFWZ7PalCvkWfPoJ1w==
X-Google-Smtp-Source: ACHHUZ73ZPSmh0lnYUkG52UjKiFE9dgxtEdINio4zSoI/cnT5srNcA/BfpvgmqfQ3h7i8kO6LL7jOA==
X-Received: by 2002:a81:ab46:0:b0:560:befc:6682 with SMTP id d6-20020a81ab46000000b00560befc6682mr5465614ywk.42.1686126914867;
        Wed, 07 Jun 2023 01:35:14 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id x186-20020a817cc3000000b00545a081849esm4703767ywc.46.2023.06.07.01.35.12
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 01:35:12 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-565a022ef06so87635397b3.3
        for <linux-staging@lists.linux.dev>; Wed, 07 Jun 2023 01:35:12 -0700 (PDT)
X-Received: by 2002:a0d:eac5:0:b0:568:f2c:ee40 with SMTP id
 t188-20020a0deac5000000b005680f2cee40mr4715739ywe.3.1686126912094; Wed, 07
 Jun 2023 01:35:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230605144812.15241-1-tzimmermann@suse.de>
In-Reply-To: <20230605144812.15241-1-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 7 Jun 2023 10:35:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUNAg5MYQVOnVhYeHKnciHci1Ly6v8DbdBp_P_9YEu=Zg@mail.gmail.com>
Message-ID: <CAMuHMdUNAg5MYQVOnVhYeHKnciHci1Ly6v8DbdBp_P_9YEu=Zg@mail.gmail.com>
Subject: Re: [PATCH 00/30] fbdev: Make userspace interfaces optional
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org, deller@gmx.de, 
	lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com, 
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-sh@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

Thanks for your series!

Over the past few days, I have been giving this some thought, that's
why I am replying only now...

On Mon, Jun 5, 2023 at 4:48=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
> Add the new config option FB_DEVICE. If enabled, fbdev provides
> traditional userspace interfaces in devfs, sysfs and procfs, such
> as /dev/fb0 or /proc/fb.
>
> Modern Linux distrobutions have adopted DRM drivers for graphics
> output and use fbdev only for the kernel's framebuffer console.
> Userspace has also moved on, with no new fbdev code being written
> and existing support being removed.
>
> OTOH, fbdev provides userspace a way of accessing kernel or I/O
> memory, which might compromise the system's security. See the recent

True, in some form...
The amount of "kernel memory" that can be accessed is controlled by
the fbdev driver (or by the DRM fbdev emulation). Nothing unsafe here.
The I/O memory that can be accessed (if any) is controlled by the
fbdev driver, and the full capabilities (e.g. DMA to random addresses)
exported depend on the actual hardware.

> commit c8687694bb1f ("drm/fbdev-generic: prohibit potential
> out-of-bounds access") for an example. Disabling fbdev userspace

IMHO that's not a good example for the point you're trying to make,
but merely bad bounds checking in kernel copying code...

> interfaces is therefore a useful feature to limit unecessary
> exposure of fbdev code to processes of low privilegues.

This actually depends on the permissions on /dev/fb*...

BTW, I am wondering if it would be possible to write a DRM emulation
layer on top of (basic, e.g. no MMIO, just fb) fbdev?

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
