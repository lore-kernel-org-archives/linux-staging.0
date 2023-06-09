Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4435414AA6
	for <linux-staging@lists.linux.dev>; Fri,  9 Jun 2023 10:11:05 +0000 (UTC)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-1a2b4b922d5so517068fac.0
        for <linux-staging@lists.linux.dev>; Fri, 09 Jun 2023 03:11:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686305465; x=1688897465;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8JNw6xq3QFRhZzqNc9XYPo1ExQ/ZW3vKLniJaHHIba4=;
        b=cv0r51vKxTQ6W/Y88/t3Ea1A2DlXZILMcJOhLDUiMxSHgwxYV3xzp62WQQgBDLZ3RZ
         n2/w1aajRMSNCaWOjEiIANGLEt2beT2l8kcD/CihfRjM/L2DxEFsTfP7Wl/WLrxRaMp7
         ExVtV2uWkm1m03TkTGP5MrzpWb2DI2UsabwJRzGYPTjGVZRj0hxZgN9f25qG58hvFw/t
         jPc4hntT7n+As8Qfc3EaQICFOT2C/L8djC/eGwQzqkB7A0nkBTb0qrdeps5oejDFSTXV
         ehhjpyxQXPXeunMOIIKAmFU7IuMBsnF5+fW7B1X63sySpvCck0vUcX+oN1beMnmtEIuY
         aniQ==
X-Gm-Message-State: AC+VfDySAyYD1tfMa4c1kSImXJtK6xkY3xiXhkO7FZ3aUY5JjhWBxB8y
	GmRLyMBQUA74yFyvAVlKCOKitz0f1B6d1Q==
X-Google-Smtp-Source: ACHHUZ4yrIdA8YcC7uFjBWMAEgv6CD5zTWM26Dsz4Xa+NCGeNqI0aphbmFZhuzQAMeXuezqVUgwzcA==
X-Received: by 2002:a05:6870:1727:b0:19a:24cf:1597 with SMTP id h39-20020a056870172700b0019a24cf1597mr1042816oae.27.1686305464885;
        Fri, 09 Jun 2023 03:11:04 -0700 (PDT)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com. [209.85.161.42])
        by smtp.gmail.com with ESMTPSA id t3-20020a4aa3c3000000b0054cbf3be7e1sm627211ool.32.2023.06.09.03.11.01
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jun 2023 03:11:02 -0700 (PDT)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-55ab0f777acso1039251eaf.1
        for <linux-staging@lists.linux.dev>; Fri, 09 Jun 2023 03:11:01 -0700 (PDT)
X-Received: by 2002:a05:6808:20aa:b0:39a:a92b:c546 with SMTP id
 s42-20020a05680820aa00b0039aa92bc546mr1301127oiw.19.1686305461101; Fri, 09
 Jun 2023 03:11:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230605144812.15241-1-tzimmermann@suse.de> <20230605144812.15241-31-tzimmermann@suse.de>
 <CAMuHMdVP2hrgXaZvASnHJ4M+VXaTCtfbeVXrq2dsEJqcs3G6ZA@mail.gmail.com>
 <e5d88ca8-66fe-b5ee-cb6b-2dc8f3a3fb26@suse.de> <CAMuHMdWBUKTgfCD9VLDFh_Tm1J-NJQHpxODs-TuYM7V-dtmGjA@mail.gmail.com>
 <873532eurg.fsf@minerva.mail-host-address-is-not-set> <77252bc9-e08e-fcee-d140-2b78ab768b42@suse.de>
 <CAMuHMdWUkZDcYfndf1A+cgcN5Fz1hmst4LrpA7iYCFqWSRTNDA@mail.gmail.com>
 <4df23439-462f-47da-890d-2dd2092eea35@suse.de> <87h6rh552q.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87h6rh552q.fsf@minerva.mail-host-address-is-not-set>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Jun 2023 12:10:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU27OK1=B6Qgwd+tyda=MmN0EiC8taUpvAJJOYUFcm88A@mail.gmail.com>
Message-ID: <CAMuHMdU27OK1=B6Qgwd+tyda=MmN0EiC8taUpvAJJOYUFcm88A@mail.gmail.com>
Subject: Re: [PATCH 30/30] fbdev: Make support for userspace interfaces configurable
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, daniel.thompson@linaro.org, 
	linux-staging@lists.linux.dev, linux-sh@vger.kernel.org, jingoohan1@gmail.com, 
	deller@gmx.de, lee@kernel.org, dri-devel@lists.freedesktop.org, 
	linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org, sam@ravnborg.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Javier,

On Fri, Jun 9, 2023 at 11:59=E2=80=AFAM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> Thomas Zimmermann <tzimmermann@suse.de> writes:
> >>> I'd also question the argument that there's even fbdev userspace out
> >>> there. It was never popular in it's heyday and definitely hasn't
> >>> improved since then. Even the 3 people who still ask for fbdev suppor=
t
> >>
> >> There's X.org, DirectFB, SDL, ...
> >
> > None of these examples has a dependency on fbdev. They can freely switc=
h
> > backends and have moved to DRM. Anything program utilizing these
> > examples has no dependency on fbdev either.
> >
> > When I say "userspace" in this context, it's the one old program that
> > supports nothing but fbdev. TBH I'm having problems to come up with
> > examples.
> >
>
> I personally have two real world examples that can give to you :)
>
> 1) I've a IoT device at home that has a bunch of sensors (temperatury,
>    humidity, etc) and a SSD1306 display panel to report that. It just
>    has small fbdev program to print that info. I could probably port
>    to KMS but didn't feel like it. Found a fbdev program that I could
>    modify and got the job done.
>
> 2) I built a portable retro console for my kids, that uses a ST7735R
>    LCD panel. The software I use is https://www.retroarch.com/ which
>    uses fbdev by default (I believe that supports a KMS mode but out
>    of the box it works with fbdev and that's better tested by them.
>
> So even when I'm not interested and don't want to enable any of the
> fbdev drivers, I want to use the ssd130x and st7735r DRM drivers and
> the DRM fbdev emulation layer.
>
> In other words, there's real use cases for supporting fbdev programs
> with DRM drivers. Now, I agree with this patch-set and probably will
> disable the user-space fbdev interface in Fedora, but on my embedded
> projects I will probably keep it enabled.
>
> That's why I think that we should support the following combinations:
>
> * fbdev drivers + DRM fbdev emulation + fbdev user-space

"fbdev drivers + fbdev user-space", I assume?

> * only DRM drivers without fbdev emulation nor fbdev user-space (your ser=
ies)

Thomas' series includes fbdev emulation here, for the text console.

> * only DRM fbdev emulation + fbdev user-space enabled (FB_CORE)

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
