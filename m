Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB66C17A30E
	for <linux-staging@lists.linux.dev>; Thu, 17 Apr 2025 17:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744909755; cv=none; b=j5lpt9SskANu9wdfUZyXDg2sjcvbA8BVGcCG+U9+m/VBxyzoLGqLJyeXHJrTEewJuN7mbhI3G8kjr2QXt7VsZXLfKgSdvhhn6ZA19PpP+aNebMFJzE5caSDOqLdmoBTEqcN0BxyzTXuItuud9iBynDMomZyrgCoJ8Vj0f0OEe0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744909755; c=relaxed/simple;
	bh=cL8O9si/E+RgkCImblOqbPznISwWiwgiE1yb1CY5L44=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pCFtBwU5YIdUywv62PP/dY8Eow3qhGRiskrYDImYilo2WQx27M03918hTTUnJNQM2n4DWIiKeMiiyuTotkmJBOkg3eFq+G+Z/KmJnrcxaq9Vuagfy797teeW6N10MNets0Iig6o8J6DQ1TORRQ8zq5Qk/FQzKZaFDSDfFyEuuz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aKPw6J72; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aKPw6J72"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6e8fc176825so8502376d6.0
        for <linux-staging@lists.linux.dev>; Thu, 17 Apr 2025 10:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744909753; x=1745514553; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YVRsxMaaoRzI3A0BHWMdKaDAL/C7tvFz+AMzRlmVe60=;
        b=aKPw6J72eGfGM3QdeZ2My6E5b7iVLYwBcF/RGnidpmKG3d7XW63PyzGodcH7MqCfkk
         vJBX/rsShitZRm9MkhUet8ieNbm8Sl3qqjSf/FR9zUsrNqgEkLWlXrc3m1V66VWOZ3zs
         sFG4+LNT9lCE2lqLEMW5hGkk1wzk33llLs561RV1FsMVYDHEJfG8mDOm8/WNmkugtqL8
         0gv+XdTB6J8w8w4jCnNo1tybslZ05Vf6tl1Zwv50MmFtQq5JWIIB/ecPGmwrLEsc8MlL
         6g1VlbhBn2b3bFyKU12Ii4bp4KW4YF20DaQ+suXmHggk8kFoz3yvpuQqIpdRCzA5ErIB
         fl1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744909753; x=1745514553;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YVRsxMaaoRzI3A0BHWMdKaDAL/C7tvFz+AMzRlmVe60=;
        b=t4b+sjkd4BOpanwavyv8sODERmGzlNpGWJpC/C93B8pbczcexCfDVmeLA4wWoBzKJe
         vND+FQUd443vyEKDIML8wA0e0m6oMRCk8fAYpvCV9HYuNLwL7IJaMhu/+GIHN3r+zeew
         +4GlREVVINdPcSh1XWOEaMKJbUh993HWwZNNG7b6vi2VxvjF3l0ZbjXKMdBrlypvd/Fr
         HYeQy+gJYla4l9No6iJz1Dmw0OFYPqabJfgZWy+3SkAUvNLriAVBpxH8b5XGxki7+h6w
         EkJN6yNCJ9XwZVixEua1p6WA5H6gopN7debzP9IzRLZ2MHt5OkUgeDqkTaWNKbSjCgGi
         H4Ow==
X-Forwarded-Encrypted: i=1; AJvYcCUiBmBA1MudX8Cf13UGyr+0dpi7PYVWt5gSi0O2k922uiRQUF4p7AEhpGdnzvGaoqvkhxo5Dm+XiBljG97j@lists.linux.dev
X-Gm-Message-State: AOJu0YxetxiemuKNKkHbbKmzY5CdYMQca/N6q28XvBlWSj4BKAOAuDv9
	Nt/BrwPFt0DzxePYyGDXEsG2giDaWQKA5P5Mxd++loQmEPUMQXXwOPPzQmpQ01uJywkSAKjbC7E
	UYZnS+1wq12SDsP6mfQDWW8h/QI8=
X-Gm-Gg: ASbGncsAui0lpYf1YZgVJEkMXBcYhvamJFJSNo+ZcersjYSU6bM7cwsvVwttOVgMlo8
	r3VL3hVOX5DK11wXZleAedvIdEMPXKkDhW2zN6IuJNHI+21qfYAKdArbNVcq7ydZhxTkAoHPoot
	HqfcNuuDBlUnJ3fX7HZwMgCHT059c0GvAhPY39ajrCreH+NEPkw+cKrg==
X-Google-Smtp-Source: AGHT+IH3sgWNRxjJ7ML6vojQwEfQKL7ty9akA1LDmRGoufnBtH8OXUnb5G1KQUGP7NM/X1dbIaA6SvGTj/qLhpHImwk=
X-Received: by 2002:a05:622a:15d4:b0:476:8825:99bf with SMTP id
 d75a77b69052e-47ae9e5fcb5mr6420891cf.27.1744909752744; Thu, 17 Apr 2025
 10:09:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250415182038.523186-1-gshahrouzi@gmail.com> <fb712c034eda0d5d711a90a00b6382315fb5f929.camel@gmail.com>
 <CAKUZ0zL88AyuRxzhoAv2iZO7N7qOMy1G3yKscqG3rQiiOS0gog@mail.gmail.com> <e8b24cf22c87e5b5ce0cc8919eca79f6e60ab6e3.camel@gmail.com>
In-Reply-To: <e8b24cf22c87e5b5ce0cc8919eca79f6e60ab6e3.camel@gmail.com>
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Date: Thu, 17 Apr 2025 13:08:00 -0400
X-Gm-Features: ATxdqUG5PIHgIXbjSs34LLkZR6qQAIThR_w05scHyE-4Vxq0gd7frAOFZ8J-594
Message-ID: <CAKUZ0z+FKxHcYTYiGvrZ3RLiMKT1P4gtTdq8d7=+ZFC0RMQzqA@mail.gmail.com>
Subject: Re: [PATCH] iio: adc: Revoke valid channel for error path
To: =?UTF-8?B?TnVubyBTw6E=?= <noname.nuno@gmail.com>
Cc: gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, Michael.Hennerich@analog.com, 
	sonic.zhang@analog.com, vapier@gentoo.org, skhan@linuxfoundation.org, 
	kernelmentees@lists.linuxfoundation.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 10:02=E2=80=AFAM Nuno S=C3=A1 <noname.nuno@gmail.co=
m> wrote:
>
> On Thu, 2025-04-17 at 08:53 -0400, Gabriel Shahrouzi wrote:
> > On Thu, Apr 17, 2025 at 6:06=E2=80=AFAM Nuno S=C3=A1 <noname.nuno@gmail=
.com> wrote:
> > >
> > > On Tue, 2025-04-15 at 14:20 -0400, Gabriel Shahrouzi wrote:
> > > > According to the datasheet on page 9 under the channel selection ta=
ble,
> > > > all devices (AD7816/7/8) are able to use the channel marked as 7. T=
his
> > > > channel is used for diagnostic purposes by routing the internal 1.2=
3V
> > > > bandgap source through the MUX to the input of the ADC.
> > > >
> > > > Replace checking for string equality with checking for the same chi=
p ID
> > > > to reduce time complexity.
> > > >
> > > > Group invalid channels for all devices together because they are
> > > > processed the same way.
> > > >
> > > > Fixes: 7924425db04a ("staging: iio: adc: new driver for AD7816 devi=
ces")
> > > > Cc: stable@vger.kernel.org
> > > > Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> > > > ---
> > > >  drivers/staging/iio/adc/ad7816.c | 15 +++++----------
> > > >  1 file changed, 5 insertions(+), 10 deletions(-)
> > > >
> > > > diff --git a/drivers/staging/iio/adc/ad7816.c
> > > > b/drivers/staging/iio/adc/ad7816.c
> > > > index 6c14d7bcdd675..d880fe0257697 100644
> > > > --- a/drivers/staging/iio/adc/ad7816.c
> > > > +++ b/drivers/staging/iio/adc/ad7816.c
> > > > @@ -186,17 +186,12 @@ static ssize_t ad7816_store_channel(struct de=
vice
> > > > *dev,
> > > >       if (ret)
> > > >               return ret;
> > > >
> > > > -     if (data > AD7816_CS_MAX && data !=3D AD7816_CS_MASK) {
> > > > -             dev_err(&chip->spi_dev->dev, "Invalid channel id %lu =
for
> > > > %s.\n",
> > > > -                     data, indio_dev->name);
> > > > -             return -EINVAL;
> > > > -     } else if (strcmp(indio_dev->name, "ad7818") =3D=3D 0 && data=
 > 1) {
> > > > -             dev_err(&chip->spi_dev->dev,
> > > > -                     "Invalid channel id %lu for ad7818.\n", data)=
;
> > > > -             return -EINVAL;
> > > > -     } else if (strcmp(indio_dev->name, "ad7816") =3D=3D 0 && data=
 > 0) {
> > > > +     if (data !=3D AD7816_CS_MASK &&
> > > > +         (data > AD7816_CS_MAX ||
> > > > +         (chip->id =3D=3D ID_AD7818 && data > 1) ||
> > > > +         (chip->id =3D=3D ID_AD7816 && data > 0))) {
> > > >               dev_err(&chip->spi_dev->dev,
> > > > -                     "Invalid channel id %lu for ad7816.\n", data)=
;
> > > > +                     "Invalid channel id %lu for %s.\n", data, ind=
io_dev-
> > > > > name);
> > > >               return -EINVAL;
> > > >       }
> > >
> > > Hmm, maybe I'm missing something but the code just looks the same as =
before
> > > (from a functionality point of view)? I'm really not seeing any fix..=
.
> > I might have to change it for readability. From my understanding, if
> > channel 7 is selected (AD7816_CS_MASK), it never enters the error path
> > whereas in the old code, if the chip were either ad7816 or ad7818, it w=
ould
> > end up returning an error because it skips all channels above either 0
> > or 1.
>
> Ahh, right!
>
> One good refactor is to add a chip_info struct (renaming the existing one=
) with
> let's say a name and max_channels. Then, the condition could be reduced t=
o:
>
> if (data > st->chip->max_channel && data !=3D AD7816_CS_MASK {
>         dev_err(...);
>         return -EINVAL;
> }
Makes sense. I sent a V2 with the updates. Also included enum
ad7816_type as a member for chip_info but not sure if it is necessary.
Renamed the existing one to ad7816_state.
>
> Being this in staging, I guess we don't care much about having the fix as=
 the
> first patch to make it easier to backport.
In other words, combining the refactoring and fix into one patch is
fine but normally they would be split?

>
> - Nuno S=C3=A1
>
> >
> > >
> > > Having said the above, not sure if grouping helps with readability. B=
ut I do
> > > agree with moving from string comparison to use chip->id. And we also=
 have
> > > redundants 'else'
> > >
> > > - Nuno S=C3=A1
> > >
