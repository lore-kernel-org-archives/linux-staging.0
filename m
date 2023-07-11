Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5C119BBA
	for <linux-staging@lists.linux.dev>; Tue, 11 Jul 2023 16:04:58 +0000 (UTC)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-1a1fa977667so5348843fac.1
        for <linux-staging@lists.linux.dev>; Tue, 11 Jul 2023 09:04:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689091497; x=1691683497;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y7zt5pO69xVTkx3WPA+RT/byFcn7lDWoK0rY+7VhmSY=;
        b=WKdytnmq+ZKqMskWJakx+P2mABzDwWgS4fxZkzdHaRWtPhEu8NY+qaTJe4RxMuz3gc
         a++WWH/ZbEDgDNgzZxU9Leg5Dz/lW4K+iQ+p0bSle7xsI+ijztnfomnjaScz/rHmHP3V
         ix/mu/0hd8gxBK33ayTL2xOprnw9tpHgBK118dh6lSZ2nT6m61IbDLXv8fdA8h2m+Nq1
         R18o0mh9pMVisMoqen2m2zKQYl4Od5nCErOu+3LLZQRjOMJz3UE0MuDjlRdCMI+xadOa
         eZO51YCIhjUo9C5N5ZSyjYiCiqXYYxKqnZBCCBXNancgD9Bvboz7I+v2UztjC/iCYe8c
         Xa9w==
X-Gm-Message-State: ABy/qLadfXswUuZVqPr+Y0+W1VIhSswUC8XYFXq6T4KkYDe87krCfO2U
	fDniaUMJmoyukHUd0LV6xK6XxUbMS/w0rA==
X-Google-Smtp-Source: APBJJlEcZi/MDacZVeXSv6dcnBRmRy76rFjllNONvoFfm/Jv+ozX6iLf2vxxwPax533RPNw7Rp1Eug==
X-Received: by 2002:a05:6870:1cc:b0:1aa:192e:9f35 with SMTP id n12-20020a05687001cc00b001aa192e9f35mr18919636oad.26.1689091497261;
        Tue, 11 Jul 2023 09:04:57 -0700 (PDT)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com. [209.85.167.172])
        by smtp.gmail.com with ESMTPSA id i5-20020a9d6245000000b006b884bbb4f3sm1059358otk.26.2023.07.11.09.04.56
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jul 2023 09:04:56 -0700 (PDT)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3a3efebcc24so3422649b6e.1
        for <linux-staging@lists.linux.dev>; Tue, 11 Jul 2023 09:04:56 -0700 (PDT)
X-Received: by 2002:a05:6358:4198:b0:132:7a2e:87bc with SMTP id
 w24-20020a056358419800b001327a2e87bcmr13654687rwc.5.1689091495810; Tue, 11
 Jul 2023 09:04:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230710130113.14563-1-tzimmermann@suse.de> <20230710171903.GA14712@ravnborg.org>
 <ab92f8d9-36ab-06bc-b85b-d52b7a1bfe9a@suse.de> <20230711144744.GA117276@ravnborg.org>
 <bf439387-6b13-0fd9-f61b-1a5cbf731187@gmx.de>
In-Reply-To: <bf439387-6b13-0fd9-f61b-1a5cbf731187@gmx.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Jul 2023 18:04:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXnTDK6uZNhNR=NFTiy4F+2nLJd1E47vDoXUV3zFSCGOA@mail.gmail.com>
Message-ID: <CAMuHMdXnTDK6uZNhNR=NFTiy4F+2nLJd1E47vDoXUV3zFSCGOA@mail.gmail.com>
Subject: Re: [PATCH 00/17] fbdev: Remove FBINFO_DEFAULT and
 FBINFO_FLAG_DEFAULT flags
To: Helge Deller <deller@gmx.de>
Cc: Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com, 
	linux-fbdev@vger.kernel.org, kvm@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, linux-geode@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org, 
	linux-nvidia@lists.surfsouth.com, linux-omap@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Helge,

On Tue, Jul 11, 2023 at 5:26=E2=80=AFPM Helge Deller <deller@gmx.de> wrote:
> On 7/11/23 16:47, Sam Ravnborg wrote:
> > On Tue, Jul 11, 2023 at 08:24:40AM +0200, Thomas Zimmermann wrote:
> >> Am 10.07.23 um 19:19 schrieb Sam Ravnborg:
> >>> On Mon, Jul 10, 2023 at 02:50:04PM +0200, Thomas Zimmermann wrote:
> >>>> Remove the unused flags FBINFO_DEFAULT and FBINFO_FLAG_DEFAULT from
> >>>> fbdev and drivers, as briefly discussed at [1]. Both flags were mayb=
e
> >>>> useful when fbdev had special handling for driver modules. With
> >>>> commit 376b3ff54c9a ("fbdev: Nuke FBINFO_MODULE"), they are both 0
> >>>> and have no further effect.
> >>>>
> >>>> Patches 1 to 7 remove FBINFO_DEFAULT from drivers. Patches 2 to 5
> >>>> split this by the way the fb_info struct is being allocated. All fla=
gs
> >>>> are cleared to zero during the allocation.
> >>>>
> >>>> Patches 8 to 16 do the same for FBINFO_FLAG_DEFAULT. Patch 8 fixes
> >>>> an actual bug in how arch/sh uses the tokne for struct fb_videomode,
> >>>> which is unrelated.
> >>>>
> >>>> Patch 17 removes both flag constants from <linux/fb.h>
> >>>
> >>> We have a few more flags that are unused - should they be nuked too?
> >>> FBINFO_HWACCEL_FILLRECT
> >>> FBINFO_HWACCEL_ROTATE
> >>> FBINFO_HWACCEL_XPAN
> >>
> >> It seems those are there for completeness. Nothing sets _ROTATE,
>
> I think some fbdev drivers had hardware acceleration for ROTATE in the
> past. HWACCEL_XPAN is still in some drivers.
>
> >> the others are simply never checked. According to the comments,
> >> some are required, some are optional. I don't know what that
> >> means.
>
> I think it's OK if you remove those flags which aren't used anywhere,
> e.g. FBINFO_HWACCEL_ROTATE.

Indeed.

> >> IIRC there were complains about performance when Daniel tried to remov=
e
> >> fbcon acceleration, so not all _HWACCEL_ flags are unneeded.
>
> Correct. I think COPYAREA and FILLRECT are the bare minimum to accelerate
> fbcon, IMAGEBLIT is for showing the tux penguin (?),
> XPAN/YPAN and YWRAP for some hardware screen panning needed by some drive=
rs
> (not sure if this is still used as I don't have such hardware, Geert?).

Yes, they are used.  Anything that is handled in drivers/video/fbdev/core/
is used:

$ git grep  HWACCEL_ -- drivers/video/fbdev/core/
drivers/video/fbdev/core/fbcon.c:       if ((info->flags &
FBINFO_HWACCEL_COPYAREA) &&
drivers/video/fbdev/core/fbcon.c:           !(info->flags &
FBINFO_HWACCEL_DISABLED))
drivers/video/fbdev/core/fbcon.c:       int good_pan =3D (cap &
FBINFO_HWACCEL_YPAN) &&
drivers/video/fbdev/core/fbcon.c:       int good_wrap =3D (cap &
FBINFO_HWACCEL_YWRAP) &&
drivers/video/fbdev/core/fbcon.c:       int fast_copyarea =3D (cap &
FBINFO_HWACCEL_COPYAREA) &&
drivers/video/fbdev/core/fbcon.c:               !(cap &
FBINFO_HWACCEL_DISABLED);
drivers/video/fbdev/core/fbcon.c:       int fast_imageblit =3D (cap &
FBINFO_HWACCEL_IMAGEBLIT) &&
drivers/video/fbdev/core/fbcon.c:               !(cap &
FBINFO_HWACCEL_DISABLED);

BTW, I'm surprised FBINFO_HWACCEL_FILLRECT is not handled.
But looking at the full history, it never was...

> >> Leaving them in for reference/completeness might be an option; or not.=
 I
> >> have no strong feelings about those flags.
>
> I'd say drop FBINFO_HWACCEL_ROTATE at least ?

Agreed.

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
