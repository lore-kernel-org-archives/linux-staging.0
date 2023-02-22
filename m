Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5241FB5
	for <linux-staging@lists.linux.dev>; Wed, 22 Feb 2023 08:01:11 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id f13so26329804edz.6
        for <linux-staging@lists.linux.dev>; Wed, 22 Feb 2023 00:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dlCUWg0V7l7YUSFlT2P4WSzL8o1xqPnxClcbe1tdHhY=;
        b=Rl94logtw4OVPqPkZoH4YHWPBNT3fyRn557I+IuZXOjTQ6+SNRJv/yPjxTH7tqT/cX
         XqdgxXSF/K1SIOSpT5NOUEsjlxlfJTVryaZ8b3sFcDTPV9o8Fs3G8E/p3Din+nmvhwqG
         jnsU1pAYzmwAb3+YnPpteyIFwj2G9PbmIyBN0Zb+8u7c3TOF3sEdQo9R9UMBzdZJ4AHm
         kIwc732yOVbngdGgQ7+OnHhqc5PeGrLNBbQ5NP6yJPKA1628qh2WKYMJRKCktkL09INm
         1UypSen/+pfeV4QsLVudfBjaayKL7+Zuwo3lWCdZRQU+jfGd4vfDBM+byg01SzdluKKV
         wZKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dlCUWg0V7l7YUSFlT2P4WSzL8o1xqPnxClcbe1tdHhY=;
        b=HOQbVGdjpnIJNR6T/iL7fHJX/0SgeMp+9qxXIa200cFvdrLGj5agMRQWwd4sEynoeE
         FTrAUmMYqPgInzO11uX01Bl6nPUwVOKTj9WUPS9oisdfNAPtkCpRhKftP7BkhEHZNqou
         QjR9/Spapg/SolS87vxBGpV/KKwPsC327oPSZ0cE8+OG2rNfcNqjY/FyTdCroxQotfGQ
         ezI5WHO/5jP3R1DzTJi59UuMQ8tvlP8lmLbirr6zP38eL/UgUoCPEVwi9utf+/DvMQhC
         yNvEiLhotzalI9ulqSlPhM5QNs1qBHEAudgqsAUBqMV9JsMIhPab3LiKo7GgoNsgs2ze
         3xCg==
X-Gm-Message-State: AO0yUKXFZQSpKecKXCJiSp17ZQcxCsI9YV7Mfk72fBgVRI1eaF1gBuV/
	c+goOXTRGJ9m3iYBp2oMYs5jADqYx/1pDXNb3/I=
X-Google-Smtp-Source: AK7set8xj9lBdPeX62Xma1nch2YV8vlnSz2QDZ40dpKo54vg1GEVrx1VOsdhxrUMU5EtCKQf3KkPFyAZRbFUahGuKdI=
X-Received: by 2002:a17:906:4c49:b0:87b:fa21:7953 with SMTP id
 d9-20020a1709064c4900b0087bfa217953mr7243891ejw.8.1677052869804; Wed, 22 Feb
 2023 00:01:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230221183211.21964-1-clamor95@gmail.com> <20230221183211.21964-5-clamor95@gmail.com>
 <Y/VEUaOIE1mk1utt@sirena.org.uk>
In-Reply-To: <Y/VEUaOIE1mk1utt@sirena.org.uk>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 22 Feb 2023 10:00:58 +0200
Message-ID: <CAPVz0n1kkXQDNhzFoa8xwqaFErNDTHSaqM07TDUHRPSnH+PvkQ@mail.gmail.com>
Subject: Re: [PATCH v1 04/10] ASoC: tegra: Support RT5631 by machine driver
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Maxim Schwalm <maxim.schwalm@gmail.com>, 
	Dmitry Osipenko <digetx@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 22 =D0=BB=D1=8E=D1=82. 2023 =D1=80. =D0=BE 00:23 Mark Brown <=
broonie@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, Feb 21, 2023 at 08:32:05PM +0200, Svyatoslav Ryhel wrote:
>
> > Add Realtek ALC5631/RT5631 codec support to the Tegra ASoC machine driv=
er.
> > The RT5631 codec is found on devices like ASUS Transformer TF201, TF700=
T
> > and other Tegra-based Android tablets.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > Signed-off-by: Ion Agorria <ion@agorria.com>
>
> Your signoff should be last if you're the one sending this.

Thanks

> > +static unsigned int tegra_machine_mclk_rate_6mhz(unsigned int srate)
> > +{
> > +     unsigned int mclk;
> > +
> > +     switch (srate) {
> > +     case 64000:
> > +     case 88200:
> > +     case 96000:
> > +             mclk =3D 128 * srate;
> > +             break;
> > +     default:
> > +             mclk =3D 256 * srate;
> > +             break;
> > +     }
> > +     /* FIXME: Codec only requires >=3D 3MHz if OSR=3D=3D0 */
> > +     while (mclk < 6000000)
> > +             mclk *=3D 2;
>
> It feels like this is complicated enough and looks like the
> clocking is flexible enough that it might be easier to just have
> a table of values or otherwise enumerate standard rates, seeing
> the code I feel like I need to worry about what happens if we
> pick a clock rate over 6MHz (the loop could give a value over
> that), and it's not clear why we have the switch statement rather
> than just starting at a multiple of 128 and looping an extra time.
>
> I suspect there's going to be no meaningful downside for having
> the clock held at over 3MHz on a tablet form factor, the usual
> issue would be power consumption but between the larger battery
> size you tend to have on a tablet and the power draw of the
> screen if that's on it's likely to be into the noise practially
> speaking.

This is how downstream handled mclk rate for RT5631.
