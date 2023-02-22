Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172071FB5
	for <linux-staging@lists.linux.dev>; Wed, 22 Feb 2023 08:19:59 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id da10so28258882edb.3
        for <linux-staging@lists.linux.dev>; Wed, 22 Feb 2023 00:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UJNOZOcvMnjGdeBFXws515SfQDHLUn4sM+kuakbttss=;
        b=h6W6n70b5qdFFU2oGmksYnw9ys1MLpPsMO/GuCv3dW0fVdRsdwKwESP+Udzw0ublfF
         vTEAFC8EzOkWBE6PcAs52WI1nIM5ctxJNwGnMQQGIdp/R+EWwVMMcS5qy93bHaAnfy1u
         PrK4TgYtXtha/5+uzf9IVqquy0ImeOLcz/Qn+Y/gX/bt3ev7+NN6T4LifsI/kP4CfmJr
         8sIMGkA3R+7jUSeFvUNjt0veZ3+Qjz1s19CDBp+eH2L2BeH/07zKNJZ/qA1vpcb1kvg7
         QLyOd1jcBeQZOH6re09TSfFpupJ2kH0AJ1EqQ5R+z/HIjXz4Fea29C5i7VCPAqlXhp6c
         MYOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UJNOZOcvMnjGdeBFXws515SfQDHLUn4sM+kuakbttss=;
        b=wSyXvwMbBiyE74toelJcY3bVKEHossGZ+1TeQLp8K4ormRRKq2zGF4hvutiedSFMmO
         mpcJY8aC5Ld0okUa9YYjM0CPq8LPQnjTLwcRUMNO1Rm0m3j64qeUZL1E2/rn6m+dA2DN
         xEflPsyjckZCGKdF4jDlMnhDJ+bLvpRGxPH5pFh9ddoYttPN1ju/DJ0oHMDGxi92El0k
         EFAbRrMZmiIBDv7/pg1zGOBBWLKcTv5UtivKSmIRx0ynsYuOGdHH85KdA2oO8c7WLtSD
         HC2gpQS7kaoHRzgthvkZWm6WahT4L+T9HVcsqIPE/8xI3o+dI+8U5suiFm2o43fwebyR
         jY4g==
X-Gm-Message-State: AO0yUKXBWX5AlUjNWRkiWfTZijG2JBGxlCdq/904C2MlRvyrgUBI3RyS
	4adz1xf5nPs2MlpM2hPWt8LyZiKdUKHFUW2et9Y=
X-Google-Smtp-Source: AK7set/eD4OWazbd4WlNqGtkzE9MinhNaPt6ANWVDAub6zWcoT23wqA99bVdNLX5ZOspxYng6Z/FnKKs1niTz2q5K4E=
X-Received: by 2002:a17:906:5e5a:b0:877:747c:9745 with SMTP id
 b26-20020a1709065e5a00b00877747c9745mr7263091eju.8.1677053998298; Wed, 22 Feb
 2023 00:19:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230221183211.21964-1-clamor95@gmail.com> <20230221183211.21964-10-clamor95@gmail.com>
 <Y/UbMH5tXDgsvSbD@kroah.com>
In-Reply-To: <Y/UbMH5tXDgsvSbD@kroah.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 22 Feb 2023 10:19:47 +0200
Message-ID: <CAPVz0n2-giCF9Z9fMimTFQnGk73HAdfU4SitGn58iZapLjeuTQ@mail.gmail.com>
Subject: Re: [PATCH v1 09/10] staging: dsp: add support for Fortemedia FM34NE DSP
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Maxim Schwalm <maxim.schwalm@gmail.com>, Dmitry Osipenko <digetx@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, 
	linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 21 =D0=BB=D1=8E=D1=82. 2023 =D1=80. =D0=BE 21:27 Greg Kroah-H=
artman
<gregkh@linuxfoundation.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, Feb 21, 2023 at 08:32:10PM +0200, Svyatoslav Ryhel wrote:
> > FM34NE is digital sound processing chip used for active
> > noise suppression mainly on ASUS Transformers.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/staging/Kconfig          |   2 +
> >  drivers/staging/Makefile         |   1 +
> >  drivers/staging/dsp/Kconfig      |   7 +
> >  drivers/staging/dsp/Makefile     |   2 +
> >  drivers/staging/dsp/dsp-fm34ne.c | 364 +++++++++++++
> >  drivers/staging/dsp/dsp-fm34ne.h | 845 +++++++++++++++++++++++++++++++
> >  6 files changed, 1221 insertions(+)
> >  create mode 100644 drivers/staging/dsp/Kconfig
> >  create mode 100644 drivers/staging/dsp/Makefile
> >  create mode 100644 drivers/staging/dsp/dsp-fm34ne.c
> >  create mode 100644 drivers/staging/dsp/dsp-fm34ne.h
>
>
> Sorry, but why is this going into drivers/staging/ at all?  What is
> needed to be done to get this out of staging?  Why not do that work
> right now?  At the least, we need a TODO file in the directory that
> lists what needs to be done and who is responsible for it.

Because this driver sets up fm34 and switches it to bypass mode allowing
sound to work on the device. There is no dsp framework in kernel which coul=
d
be called to operate dsp from the actual sound codec. (If there is, I
would be glad
if you show me). Fm34 must be active only on DMIC use, all other cases requ=
ire
it to be in bypass.

> But again, just do the work now, it's faster and simpler to do it before
> you submit it instead of waiting until after it is merged.
>
> Also, no need for a .h file when you only have one .c file.  Just put
> them all together into one file please.

I understand, but the header contains sets of configuration sequences.
Including those into .c will make it barely readable.

> thanks,
>
> greg k-h
