Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02E2153BEC;
	Mon, 13 May 2024 14:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715610360; cv=none; b=eDuVJHWDz7nUDEspqbphYq+YQ93LPEOIBb7tOJbJL3sWrjLiCy/FOAOk4Zaf5yDTy/WbMW98dVyzUAP0exPSHC+Hf5lMGUXN86GAtvQjN8fIbrGC6ufomW7BrHxP0qMV3T0MqtRFEXQ1H6u3tJmL3pICzFvPxWN6R51ngLDLD4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715610360; c=relaxed/simple;
	bh=0AoLeiIJFogRy5Bivm1+Om6pxiOnp/nodPzYcildxt4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FUxkPgbrQjKmm3qOgiDXXt5BpzwrAG1bWWBEMwEHvZjLyD6dXBl3QLpLEa2g9RqEi5kI3GmgMVIwPeNrnb8BsvCyboOfr4EAWNLrQtd2nrncsBKXR4pEPFZuJDyLo101ID4BHVZjCP8/EnTe6sW5GaU5DqFVMI+YreMlZp166B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-36c947ff642so22025675ab.2;
        Mon, 13 May 2024 07:25:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715610358; x=1716215158;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sK9xvJl9XrjIJPbZCGnymwZFnfbvziAIa+Da/Sad12w=;
        b=KRFoF6cTvqC0ZU58UYheq5ne7vj9pWbqACRzYwBiXsH1aafEsgTPK5rmgDryA3FA07
         qStpSwlEIXN2nbv+lw7292BLsxDf/TVA4/mqikKogQ1om34CdShYXZt3H/0a1aiipDRN
         +x9R2szSRcc9FpfANXWx93sknWpUb9fVEDND7SLYi8UrcUtWRqcdt2NGOg6OCeOll/7m
         KMjZD54X84D83gDqPgOu7xndn0y1xbh2DLrGEuSmWKZXpELS3i2z+tsxJNSNmAdxAfmB
         I3FH14ZxmcRhdVT45gwMVyacjNSzvR9uj7Mi9jNUyYYwHBolNBTAakawFYLMjZpCIAHT
         z/EA==
X-Forwarded-Encrypted: i=1; AJvYcCWroU7nYnUSVQ7Nb3kLLpXCRPthVpkpNJupOkWsDH+Bn7jrTn6jdnI2MDvbYgGDgNnmmzXj5OXhkcL59nx70B//04rmikonGNe5v3DZtdIpJlYTJB1G1m6dAHf7K0REYoRhd3m9UJj/xukM
X-Gm-Message-State: AOJu0YxPVW7jhnBg1uZxNaUgnhhE83OgYYE8BkAEPXkZsYKvdE1cH9gm
	dsijMBjzq59WGHpAlPrxWM/PU6wxZQAClZ+m8X0lKnsvFs5fooYNiSmR1dI09VJ3rmiFjw/mCg/
	ldlq7RBOK1zP/FTu4b7vjiDVfp/o=
X-Google-Smtp-Source: AGHT+IFyOfQnbA9ms39YA3JnidYP9+rIgusb4dXRdT9AsrFWsuAAy/tDhx5o7DbKhUv0mKkeQIsYNZzXtRA/E0XxIpU=
X-Received: by 2002:a05:6e02:1c84:b0:36c:f0b:4f54 with SMTP id
 e9e14a558f8ab-36cc14e788cmr123202195ab.21.1715610357786; Mon, 13 May 2024
 07:25:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240429-fix-cocci-v3-0-3c4865f5a4b0@chromium.org>
 <20240429-fix-cocci-v3-26-3c4865f5a4b0@chromium.org> <20240503112758.763d8d31@sal.lan>
 <c4287024-8012-458d-9829-15ffbceb25cf@moroto.mountain> <CANiDSCsU+jgYkUmHZOC8xPsL2DbgU7_sWrby1bQAXQNnp+g6Bg@mail.gmail.com>
 <fe95e3c3a89de4566a4eb53ca8b26c25@manjaro.org> <CANiDSCswvsTh+0oJmHkYC=-qE8g09bHr44amBsUXkK6j1eCMWA@mail.gmail.com>
In-Reply-To: <CANiDSCswvsTh+0oJmHkYC=-qE8g09bHr44amBsUXkK6j1eCMWA@mail.gmail.com>
From: Michael Ira Krufky <mkrufky@linuxtv.org>
Date: Mon, 13 May 2024 10:25:46 -0400
Message-ID: <CAOcJUbwJkbEG6+u==de7CzXDUPGj6J3-p-7E3o+iAzjgSgybSg@mail.gmail.com>
Subject: Re: [PATCH v3 26/26] media: dvb-frontends: tda10048: Make the range
 of z explicit.
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Dragan Simic <dsimic@manjaro.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Martin Tuma <martin.tuma@digiteqautomotive.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Hugues Fruchet <hugues.fruchet@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sergey Kozlov <serjk@netup.ru>, Abylay Ospan <aospan@netup.ru>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Dmitry Osipenko <digetx@gmail.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 13, 2024 at 9:38=E2=80=AFAM Ricardo Ribalda <ribalda@chromium.o=
rg> wrote:
>
> On Fri, 3 May 2024 at 16:08, Dragan Simic <dsimic@manjaro.org> wrote:
> >
> > Hello Ricardo,
> >
> > On 2024-05-03 13:56, Ricardo Ribalda wrote:
> > > I am trying to get the DS, but
> > > https://www.nxp.com/acrobat_download/literature/9397/75015931.pdf is =
a
> > > dead links now.
> > >
> > > Anyone have access to the datasheet?
> >
> > It's kind of available on the link below, but for some strange reason
> > the download fails after downloading the first 128 KB or so.
> >
> > https://web.archive.org/web/20080907185532/https://www.nxp.com/acrobat_=
download/literature/9397/75015931.pdf\
>
> Mike, by any chance do you have a copy of the DS?
>
>
> >
> >
> > > On Fri, 3 May 2024 at 13:55, Dan Carpenter <dan.carpenter@linaro.org>
> > > wrote:
> > >>
> > >> On Fri, May 03, 2024 at 11:27:58AM +0100, Mauro Carvalho Chehab wrot=
e:
> > >> > Em Mon, 29 Apr 2024 15:05:05 +0000
> > >> > Ricardo Ribalda <ribalda@chromium.org> escreveu:
> > >> >
> > >> > > We do not expect the sample_freq to be over 613MHz.
> > >> > >
> > >> > > Found by cocci:
> > >> > > drivers/media/dvb-frontends/tda10048.c:345:1-7: WARNING: do_div(=
) does a 64-by-32 division, please consider using div64_u64 instead.
> > >> > >
> > >> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > >> > > ---
> > >> > >  drivers/media/dvb-frontends/tda10048.c | 4 +++-
> > >> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > >> > >
> > >> > > diff --git a/drivers/media/dvb-frontends/tda10048.c b/drivers/me=
dia/dvb-frontends/tda10048.c
> > >> > > index 3e725cdcc66b..1886f733dbbf 100644
> > >> > > --- a/drivers/media/dvb-frontends/tda10048.c
> > >> > > +++ b/drivers/media/dvb-frontends/tda10048.c
> > >> > > @@ -328,7 +328,8 @@ static int tda10048_set_wref(struct dvb_fron=
tend *fe, u32 sample_freq_hz,
> > >> > >                          u32 bw)
> > >> > >  {
> > >> > >     struct tda10048_state *state =3D fe->demodulator_priv;
> > >> > > -   u64 t, z;
> > >> > > +   u32 z;
> > >> > > +   u64 t;
> > >> > >
> > >> > >     dprintk(1, "%s()\n", __func__);
> > >> > >
> > >> > > @@ -341,6 +342,7 @@ static int tda10048_set_wref(struct dvb_fron=
tend *fe, u32 sample_freq_hz,
> > >> > >     /* t *=3D 2147483648 on 32bit platforms */
> > >> > >     t *=3D (2048 * 1024);
> > >> > >     t *=3D 1024;
> > >> > > +   /* Sample frequency is under 613MHz */
> > >> >
> > >> > Are you sure about that? Some DVB devices have very high frequency
> > >> > clocks, specially if they're also used for satellite, so I can't
> > >> > be sure by just looking at the driver's code.
> > >> >
> > >> > Also, we had already a bunch of regressions with "fixes" like this
> > >> > that actually broke frontend drivers.
> > >>
> > >> This patch preserves the existing behavior. The sample_freq_hz
> > >> variable
> > >> is a u32 so, in the original code, z couldn't have been more than
> > >> U32_MAX even though it was declared as a u64.
>
>
> I agree with Dan, we keep the existing behaviour. So it wont hurt to
> merge the code...
>
> All  that said, if someone has access to the DS, I do not mind reviewing =
it.
>
>
> > >>
> > >> It's possible that the original code was wrong.  We have seen that i=
n
> > >> other places in this patchset.  Adding a note about the datasheet is
> > >> also a good idea.
> > >>
> > >> regards,
> > >> dan carpenter
> > >>
>
>
>
> --
> Ricardo Ribalda
>

Nice to hear from you!  :-)

I believe that I may have a copy of it on an old "spinny" hard drive
somewhere in one of the ancient desktop computers I have lining my
basement walls, lol.  It will take me some time to locate it.  I hope
this isn't urgent o:-)

...It so happens that the dev box I used when I worked on that driver
is up right now, but the datasheet isn't in my home directory.  There
are two other drives in the chassis but not connected / powered - I'll
give these a look and let you know if I find anything.

Best,
Michael Krufky
