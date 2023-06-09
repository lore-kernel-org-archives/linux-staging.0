Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CACFA154A8
	for <linux-staging@lists.linux.dev>; Fri,  9 Jun 2023 11:22:43 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6b166023d47so589227a34.1
        for <linux-staging@lists.linux.dev>; Fri, 09 Jun 2023 04:22:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686309762; x=1688901762;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xadRBA7ym6NtI+c99cDpm8sxh6Is5YguQpKNeHDLZ5g=;
        b=LSB40Q0e+jzkYOt+Psnl3/84Nrw3PMyjL1NPRHPq3EgcRhL2UOp/xkUrl5duR98DZp
         he3PNNM/2ltqMMHaioDYLuzbfa5Bfb5HKGYkrAxO2PM49GVVVO2FSP4qZMyQ7D0RQ0pX
         3hcfLlmUByEeU+FwhHYe/qoJekqmPBIX130VMoS/pye7iuNKP4y+ddIJjMPU9IjgDaSL
         pgNH5P2p/836p4J8VM7BW7/z0dhzpZvOkB7VgPb9+Hakmwey77qbI+Mw9bRq0CD5ExLm
         N7QJZpegwshwmLKQKdW6Bvl7JOloXhhpixh2V+us2h71kVHO+UObOH/KxvnVrcJMr56k
         YkAw==
X-Gm-Message-State: AC+VfDwBurKyVPxwvk1wEpILcCntu40qcKC1N2ESKl4wmY7PJb9yEZ5C
	Al0fxa8MBgXFQwiuivVUtvvvCnbUauqQhg==
X-Google-Smtp-Source: ACHHUZ6j3vlU7WAPPpXMvo79ossL0X8QNL3Ki/vFbQcB09gp6LBL0gkHYg8Cr8M5w3NS6gGEISC6ig==
X-Received: by 2002:a9d:74d2:0:b0:6aa:f826:5bc4 with SMTP id a18-20020a9d74d2000000b006aaf8265bc4mr1070607otl.19.1686309762179;
        Fri, 09 Jun 2023 04:22:42 -0700 (PDT)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com. [209.85.160.51])
        by smtp.gmail.com with ESMTPSA id c8-20020a9d4808000000b006b296562566sm1277693otf.79.2023.06.09.04.22.38
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jun 2023 04:22:39 -0700 (PDT)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-19f8af9aa34so585086fac.1
        for <linux-staging@lists.linux.dev>; Fri, 09 Jun 2023 04:22:38 -0700 (PDT)
X-Received: by 2002:a05:6870:d450:b0:1a2:7f63:9920 with SMTP id
 j16-20020a056870d45000b001a27f639920mr911793oag.26.1686309758094; Fri, 09 Jun
 2023 04:22:38 -0700 (PDT)
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
 <4df23439-462f-47da-890d-2dd2092eea35@suse.de> <CAMuHMdWrTairp5h-fmkG9+xwzna+T4QmPuMeshd0UB8ZhQF8Sg@mail.gmail.com>
 <66548126-e39f-72a6-60bc-ed6d0cc82ae7@suse.de>
In-Reply-To: <66548126-e39f-72a6-60bc-ed6d0cc82ae7@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Jun 2023 13:22:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWP7BBPZuJDzRs9Fvhqq7eO30poZoJRgLCPyoamUkfANg@mail.gmail.com>
Message-ID: <CAMuHMdWP7BBPZuJDzRs9Fvhqq7eO30poZoJRgLCPyoamUkfANg@mail.gmail.com>
Subject: Re: [PATCH 30/30] fbdev: Make support for userspace interfaces configurable
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: daniel.thompson@linaro.org, lee@kernel.org, linux-sh@vger.kernel.org, 
	jingoohan1@gmail.com, deller@gmx.de, linux-staging@lists.linux.dev, 
	Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org, 
	linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org, sam@ravnborg.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Fri, Jun 9, 2023 at 1:04=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
> Am 09.06.23 um 11:14 schrieb Geert Uytterhoeven:
> [...]
> >
> >>> What do you think low-end embedded devices with an out-of-tree[*]
> >>> fbdev driver are using?
> >>
> >> And those do not count either. IIRC Android used to be built on top of
> >> fbdev devices. I'm not sure if they have moved to DRM by now. But
> >> embedded uses dedicated kernels and kernel configs.  It's easy for the=
m
> >> to set FB_DEVICE=3Dy.  We're not going to take away the fbdev device e=
ntirely.
> >
> > The point is that we do not suddenly disable functionality that users
> > may depend on. While "make oldconfig" will show users the new
> > FB_DEVICE question, (and hopefully they'll notice), "make olddefconfig"
> > and "make <foo>_defconfig" won't, possibly causing regressions.
> > Without a suitable default, you should IMHO at least update all
> > defconfigs that enable any fbdev drivers.
>
> Didn't I already say that we should make it "default y" if that's
> preferable in practice?

OK, sorry, I seem to have missed that part.

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
