Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA7633EC
	for <linux-staging@lists.linux.dev>; Wed, 19 Apr 2023 21:22:09 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-52079a12451so175749a12.3
        for <linux-staging@lists.linux.dev>; Wed, 19 Apr 2023 14:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1681939329; x=1684531329;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7EqpSXGIJ8FuaADhu+9BrBh5VMvqHzQFJ3sg3xUH4Z0=;
        b=giq9XJA79P8d4EkhbR3qSf3zUNekPnfuhW7bGGD0oELkHyCyb3UAytYbGGad/VxwmR
         opPABWqWI6rDI+sSAkCJek+U4BTI4IiAtK7Z3R6id4vQBrXulZkyBKmF3il3Vr2M/PbW
         HXGJTpXWrI3I+H9MUC6nVnNWcAfslsk7lF5Qf9KiFxuosS2dS1N2npg6sBLTvax2s9QD
         zZl9ZAeGQOkidhGPRR5Re9y2MVvAO1wmm9rbhKIfC63DhRv5U8NhyICdJoXP+nXMAe1W
         aAN32ghC2Zc2t5kPfKzJx9/NKJTFQcG1irDHReTZPlgR60dxa15W9io5fX3/4U97txJc
         Eqdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681939329; x=1684531329;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7EqpSXGIJ8FuaADhu+9BrBh5VMvqHzQFJ3sg3xUH4Z0=;
        b=ObnMcGS/72uwTMc+8TALHqCviy+x5uwxzDW3L70DLgG4+/HC7S3TNG3N0vDtIXik/O
         EuBFxXSHwt9qAb5clfiIeKAatU4nozvg0x/S5oLbfenLTF3BIyd1KM4eWRyxTiD4JWWE
         jURlb2KqZ+q01xxRnRNE9aJe7SMsgMHNC76P2EBezgNSEtZWM/z6hDV5KQPVGpWgskd+
         7KpUY/RYtteMCLCWyi18IpGQcOpG9xhhU+8XrIFJ3mE28kxsYc9YLnMSchdtFNyE0RjN
         U2DT3MOAxn6RGB/O3JEg0NNHHkxi/uA465qEUOSMUzXF2hJCtSeOjKKpppGAihjG9P0U
         9XYw==
X-Gm-Message-State: AAQBX9e7HtmCIkEtWyHUvoOLDtejxhWUdxPnXA7gjH5Rb0Ttypfz5Bwh
	rJxsoU5bYN4/JfAUtf4tjCusWTMSzDm/Xav4Qs9ddOIXpy4bLZ5nrSsDmw==
X-Google-Smtp-Source: AKy350bvcnDE0ggynDN9D9NjhXEGm9YBRtijZRormk7eU9NmP/ya2EqqRS768guSRAg3DZFd4MdsCmUKxxheEAdjEWw=
X-Received: by 2002:a17:90b:1e02:b0:247:ab52:d5d8 with SMTP id
 pg2-20020a17090b1e0200b00247ab52d5d8mr3843388pjb.26.1681939328731; Wed, 19
 Apr 2023 14:22:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230418-vchiq_platform_init-static-v1-1-3c38ba81bc66@kernel.org>
 <e1fed875-059d-bf98-f9da-09c51f362be8@i2se.com> <ZD+rethobzN+rONr@kernel.org>
In-Reply-To: <ZD+rethobzN+rONr@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 19 Apr 2023 14:21:56 -0700
Message-ID: <CAKwvOdkKACfOvZ4BcG9NcO1Kh97vqSx0y7ZBc+BOJnHUpq8qWw@mail.gmail.com>
Subject: Re: [PATCH] staging: vchiq_arm: Make vchiq_platform_init() static
To: Simon Horman <horms@kernel.org>, Arnd Bergmann <arnd@kernel.org>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
	llvm@lists.linux.dev, Florian Fainelli <f.fainelli@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+ Arnd

On Wed, Apr 19, 2023 at 1:51=E2=80=AFAM Simon Horman <horms@kernel.org> wro=
te:
>
> On Wed, Apr 19, 2023 at 08:37:58AM +0200, Stefan Wahren wrote:
> > Hi Simon,
> >
> > Am 18.04.23 um 13:23 schrieb Simon Horman:
> > > vchiq_platform_init() is only used in this file so it can be static.
> > >
> > > clang-16 with W=3D1 reports:
> > >
> > >   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:465:5=
: error: no previous prototype for function 'vchiq_platform_init' [-Werror,=
-Wmissing-prototypes]
> > >   int vchiq_platform_init(struct platform_device *pdev, struct vchiq_=
state *state)
> > >       ^
> > >   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:465:1=
: note: declare 'static' if the function is not intended to be used outside=
 of this translation unit
> > >
> > > Signed-off-by: Simon Horman <horms@kernel.org>
> >
> > this is not the first attempt to fix this [1]. But maybe this has been =
fixed
> > in the meantime.
> >
> > [1] - https://lore.kernel.org/linux-staging/20221022043548.1671644-1-sc=
ottjcrouch@gmail.com/#t
>
> Thanks,
>
> I see in that thread that Greg notes that "this breaks the build in a ver=
y
> horrible and strange way" [2].

So Arnd had a Kconfig suggestion later in that thread:
https://lore.kernel.org/linux-staging/d64dc0b4-ba82-49f4-9a43-c50b735ad91d@=
app.fastmail.com/

Marking something as `depends on OF_DYNAMIC`. (Not sure whether Arnd
meant that for BCM2835_VCHIQ or BCM_VIDEOCORE).
Perhaps try that?

>
> I'm a bit surprised as I didn't observe such a thing.
> But I also don't dispute it - clearly my testing was inadequate.
>
> I'll try and dig a bit deeper into this one.
> Perhaps starting with the report from the kernel test robot [3]
>
> [2] https://lore.kernel.org/linux-staging/Y1Okpjbi2kKU2GFz@kroah.com/
> [3] https://lore.kernel.org/linux-staging/202210230127.p1Dp295m-lkp@intel=
.com/



--=20
Thanks,
~Nick Desaulniers
