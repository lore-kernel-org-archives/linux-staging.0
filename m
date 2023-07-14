Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327FF11188
	for <linux-staging@lists.linux.dev>; Fri, 14 Jul 2023 10:04:19 +0000 (UTC)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-1b03ec2015fso1339623fac.3
        for <linux-staging@lists.linux.dev>; Fri, 14 Jul 2023 03:04:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689329059; x=1691921059;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cbFWyufa2I/dKrp5bYUBMB1ESShCcC04UZ0ziSB/4oc=;
        b=GWUuaLGoMbKsrpfGqePLiNDp2+f/RSfWCZ+lg+oEQLpgUs+n/0Kab5/35al0y3lICm
         t/r9Yz3PdGD7RP+RSRsUxVYcik5fFYXjTcnpnsDw6FiV9iGO78q6Kd4CpuWrHAgyIGIo
         /IPI1FeW7NJDQqCoD5QeKugjGzQT9PX/CV7T+Er4AaSskGBtVszo2TAbo21jM189zk8+
         ujJKn2pxF8E4UwqpbHQsl831ELQHnJuCWBfSnRElbQCdJkCkWWGWkkUS3YWUf8NSwj6i
         lxcEeJwJwySUrJUjpO+HK1iI3s7aRNHxRK+rBAOE9lIblv0SKICHbuuGCmceN0ncitD2
         gT5A==
X-Gm-Message-State: ABy/qLaoI3u9ctvejLxCEUlRvBdXY9Tt/yrhkYX+2Rafd7lepjDgHigI
	qU6P5MdXJAHUKPS6bqVcoTPtSOyKAhlb7w==
X-Google-Smtp-Source: APBJJlEBI5c9+ES+jNXlGJvif0I1xSUKXwXJ8Spnjhyit3lwwdgmV1+Vp7axzMqPSbfJC6ZdEHZh7Q==
X-Received: by 2002:a05:6870:944e:b0:1b4:4931:d579 with SMTP id e14-20020a056870944e00b001b44931d579mr5883288oal.8.1689329058848;
        Fri, 14 Jul 2023 03:04:18 -0700 (PDT)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com. [209.85.210.50])
        by smtp.gmail.com with ESMTPSA id a21-20020a056870b31500b001b03fbfa0c5sm3848837oao.39.2023.07.14.03.04.18
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jul 2023 03:04:18 -0700 (PDT)
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6b9b89627c3so529053a34.1
        for <linux-staging@lists.linux.dev>; Fri, 14 Jul 2023 03:04:18 -0700 (PDT)
X-Received: by 2002:a05:6358:591d:b0:135:43da:b16d with SMTP id
 g29-20020a056358591d00b0013543dab16dmr4868202rwf.11.1689329058168; Fri, 14
 Jul 2023 03:04:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230714075155.5686-1-tzimmermann@suse.de>
In-Reply-To: <20230714075155.5686-1-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Jul 2023 12:04:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWoeyJPAgPgFi545SJFcaVCgZi1-zW2N5cBeU9BnHgo1w@mail.gmail.com>
Message-ID: <CAMuHMdWoeyJPAgPgFi545SJFcaVCgZi1-zW2N5cBeU9BnHgo1w@mail.gmail.com>
Subject: Re: [PATCH v3 00/18] fbdev: Remove FBINFO_DEFAULT and
 FBINFO_FLAG_DEFAULT flags
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: deller@gmx.de, javierm@redhat.com, linux-sh@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, linux-input@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-geode@lists.infradead.org, linux-nvidia@lists.surfsouth.com, 
	linux-hyperv@vger.kernel.org, linux-omap@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Fri, Jul 14, 2023 at 9:53=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
> Remove the unused flags FBINFO_DEFAULT and FBINFO_FLAG_DEFAULT from
> fbdev and drivers, as briefly discussed at [1]. Both flags were maybe
> useful when fbdev had special handling for driver modules. With
> commit 376b3ff54c9a ("fbdev: Nuke FBINFO_MODULE"), they are both 0
> and have no further effect.
>
> Patches 1 to 7 remove FBINFO_DEFAULT from drivers. Patches 2 to 5
> split this by the way the fb_info struct is being allocated. All flags
> are cleared to zero during the allocation.
>
> Patches 8 to 16 do the same for FBINFO_FLAG_DEFAULT. Patch 8 fixes
> an actual bug in how arch/sh uses the token for struct fb_videomode,
> which is unrelated.
>
> Patch 17 removes both flag constants from <linux/fb.h> and patch 18
> documents the zero'ed memory returned by framebuffer_alloc().
>
> v3:
>         * sh: include board name in commit message (Adrian)
>         * docs: reword text (Miguel)

Thanks for the update!

>   fbdev: Remove flag FBINFO_DEFAULT from fbdev drivers
>   fbdev: Remove flag FBINFO_DEFAULT from fbdev drivers
>   fbdev: Remove flag FBINFO_DEFAULT from fbdev drivers
>   fbdev: Remove flag FBINFO_DEFAULT from fbdev drivers

Four patches with the exact same one-line summary. Please make them
unique.

>   fbdev: Remove flag FBINFO_FLAG_DEFAULT from fbdev drivers
>   fbdev: Remove flag FBINFO_FLAG_DEFAULT from fbdev drivers

Two patches with the exact same one-line summary. Please make them
unique.

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
