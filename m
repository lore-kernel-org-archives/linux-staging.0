Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DAF1C2E;
	Thu, 25 Aug 2022 21:04:53 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id bd26-20020a05600c1f1a00b003a5e82a6474so3130674wmb.4;
        Thu, 25 Aug 2022 14:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=DXT4YXU5YfePq29aQAo5O8wvrpSNVuJynC49Ki0/9po=;
        b=dnkzm9sreAWheeae/qavwTiTCcN31riVCLaNVZYSSD1GGVEZnwz1BhpuBtRgKU54Zn
         0+YPXV17eAtXDi2KkDDv5Lpeu/woF/E2S4Qpe8ABN4hVfKg1CDipFSqB931vxnt0kvlW
         Gh9vFaT7+ifcNaltOzHZN8pAxzpVmxErxUp5lDw+axFvYo6l6KkUNYnXJfIdjsvybvZ7
         Lg35te6K++gUfFuGwGKZmlda99s6Cisu4Mw3BCNIHrPMhxie6ghNMNRASr3EHhaAPa8F
         BGz4hbsyj3EkWNuLUL6MIrfLl7kWFfXzSDHUjjyrCwthX97uLLutzQyPjnSaT9g51JBb
         zJww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=DXT4YXU5YfePq29aQAo5O8wvrpSNVuJynC49Ki0/9po=;
        b=BupdhT+zD6+utk9WY7n6yvPIJvFy29x3kDwejrbJeUHLFLArHlk32FuiXaLLG9fWfy
         ksTYG/5EEmUPtoX7Xt/PfPCZMwfZJWYBaw3rxgrpKfcuNzwcnhUiCvvJ+MxHK+IB1eK4
         bPqTbWJv/v48+xnmSktYL+LaSSP2vtZojDIhegARXEcVZocFklym/fhw2KxuXzKW1D00
         BBIR3klfWOoMCl26Ghwb+Dw8UGXQvQmD3Vw5Dzl6iyY0e3EBuOROtuQ9j3M1XeuDHzVd
         2EWKNtiNEZUMMBYIWH63BjfUOuFB0nQcgRBWstc6doIqewki2+kVq7dBwrUFUjwcJFOz
         u6NQ==
X-Gm-Message-State: ACgBeo1SUkiW+XA452bc0z4iW7NJtARQEA0QgENS05ntMZwNquXyU1v1
	Jn3vqQJdnPETJr090LPMOsc=
X-Google-Smtp-Source: AA6agR658ImtefvvuTP/XJnEPoCYnK8MprT9hIM2YBI4TLajSd2guvSYFKVYG1p+cLPRyDFtXSvgUQ==
X-Received: by 2002:a05:600c:2e47:b0:3a6:75fe:82a9 with SMTP id q7-20020a05600c2e4700b003a675fe82a9mr3412937wmf.189.1661461492119;
        Thu, 25 Aug 2022 14:04:52 -0700 (PDT)
Received: from kista.localnet (82-149-1-172.dynamic.telemach.net. [82.149.1.172])
        by smtp.gmail.com with ESMTPSA id i14-20020a05600c354e00b003a4f08495b7sm6953492wmq.34.2022.08.25.14.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 14:04:51 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-media@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: kernel@collabora.com, stable@vger.kernel.org, linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH v1 2/3] media: cedrus: Set the platform driver data earlier
Date: Thu, 25 Aug 2022 23:04:50 +0200
Message-ID: <3448453.iIbC2pHGDl@kista>
In-Reply-To: <6a8f2555-1bd4-ac81-390e-b597e3c886f6@collabora.com>
References: <20220818203308.439043-1-nicolas.dufresne@collabora.com> <4733096.GXAFRqVoOG@jernej-laptop> <6a8f2555-1bd4-ac81-390e-b597e3c886f6@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne nedelja, 21. avgust 2022 ob 22:40:21 CEST je Dmitry Osipenko napisal(a):
> On 8/20/22 11:25, Jernej =C5=A0krabec wrote:
> > Dne petek, 19. avgust 2022 ob 17:37:20 CEST je Nicolas Dufresne=20
napisal(a):
> >> Le vendredi 19 ao=C3=BBt 2022 =C3=A0 06:17 +0200, Jernej =C5=A0krabec =
a =C3=A9crit :
> >>> Dne =C4=8Detrtek, 18. avgust 2022 ob 22:33:07 CEST je Nicolas Dufresne
> >=20
> > napisal(a):
> >>>> From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> >>>>=20
> >>>> The cedrus_hw_resume() crashes with NULL deference on driver probe if
> >>>> runtime PM is disabled because it uses platform data that hasn't been
> >>>> set up yet. Fix this by setting the platform data earlier during pro=
be.
> >>>=20
> >>> Does it even work without PM? Maybe it would be better if Cedrus would
> >>> select PM in Kconfig.
> >>=20
> >> I cannot comment myself on this, but it does not seem to invalidate th=
is
> >> Dmitry's fix.
> >=20
> > If NULL pointer dereference happens only when PM is disabled, then it
> > does. I have PM always enabled and I never experienced above issue.
>=20
> Originally this fix was needed when I changed cedrus_hw_probe() to do
> the rpm-resume while was debugging the hang issue and then also noticed
> that the !PM should be broken. It's a good common practice for all
> drivers to have the drv data set early to avoid such problems, hence it
> won't hurt to make this change anyways.

Ok, as others pointed out, this is still a good thing, so:

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>


>=20
> In practice nobody disables PM other than for debugging purposes and !PM
> handling is often broken in drivers. I assume that it might be even
> better to enable PM for all Allwiner SoCs and remove !PM handling from
> all the affected drivers, like it was done for Tegra some time ago.
>=20

Maybe in the future :)

Best regards,
Jernej

> --
> Best regards,
> Dmitry



