Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4AFA277003
	for <linux-staging@lists.linux.dev>; Fri, 18 Apr 2025 13:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744982909; cv=none; b=Fo3hviWVYTVpDTtw+Vx9oeHnceEcnB7bufI4ey0pZolAtOuqtKa6flYZIhFZMXNTiXSR+AV38lQdRhuGrq+LpKGKDonOBwYrybSvJd+ou+0nqNSGn0UMLHMTWywsA/Nlxgv96WH0OE9fkbSsNJQf/CbZtIQ5VwkN7osSZ5pX16c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744982909; c=relaxed/simple;
	bh=py3qpxPQ4hvohMsFadRBuBilUYS8IpwzxRxK3/vIQIk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ew1R+xJBXBcgLwiXHErBXf4jI5BphvgwQAo4FciKXaLDIdLUTFvooiVFtyR0PX/G0g+ouaH5tE1OUHzf8TPrXJZQLpTH5lN5MDa0N4LbPvuR/LnwizZqz/pz0kif5tAF34X3hFnjHms3mjYdliiMy685EYdI00nTqZBp8FY6nv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dpb/md8i; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dpb/md8i"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-47692b9d059so25506241cf.3
        for <linux-staging@lists.linux.dev>; Fri, 18 Apr 2025 06:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744982907; x=1745587707; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H2uvF1gnZo1hDkMDMb6IsHjvK5NSRplkTI6q5lCw7lg=;
        b=Dpb/md8iOzXRgrP2xi8T1zOREDVQWPQ3HcNv8Pldil2pygZm9CYUnkz/8A8QSyQYqc
         5qd06PKM5yLPN8Y3cofhGrI79VyxbiRky7lzYzn1oAZf4qZnM9iPdUWmjCIq0cO3yS9J
         TA29gCp1fsLoX9TS1kvZ0IUypAwqKvi30RK3UO9Zd2uGD6UYEu7uxjQgxpqOXigi4/IW
         tuj6dtrM8Gh7uKZasLUMhgkgwV2caikln4zysHIkV907akybg0+JMcuXH0SCtP9MG38G
         qn1lboqqqJMk/Vr+MxgDjAIPPVVhNOJJN6ebm/IJ/mxl9dbMbigM5vigr6SRn4fPhk3V
         mO8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744982907; x=1745587707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H2uvF1gnZo1hDkMDMb6IsHjvK5NSRplkTI6q5lCw7lg=;
        b=jJdKTBIzptPQ+QV49CE7fLhGzXHZUdlDntHVTV51cy2vsWfIw0pc3S1TLn5MRtAIQI
         dtUjIQtF3CpO49TDla0TGc3jC5TU0bKwKwRspakDyVGkisIuCQ7TIaerKgfLmQ6fGLwX
         aNFVmblg8mNKmrIILNP7oEz78EHDOl8+O+2Ig81OqThVlVtSHyDH249AIG5u2a9tE6KQ
         wR+G/mEZhpg8ooMcQXQDl7kv/Z6MpHTn2ceAyzglhzZmfyE0AyF8Tn/8eMwXrcbACxsJ
         ORz3Suiuq6C02dX5KtUcnsgrZzm2laEtOgJEiHzQHW9pPrtbl/34s6/yrdzX1yvA+5dN
         3vVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwc8P1el7CE0n2Pd2/H2IBQYeaohHWO7FVy8kgZcmDQE6H+ItgKoLXVPCyKcno+xlgSuQzogywcD+EKJ3g@lists.linux.dev
X-Gm-Message-State: AOJu0YyjDCKqpKKya2rPhbXCbODJ3qDUxsECrw14pv4LcVrBG2fGVz5h
	5iiMeb76xsdKWXAy4nCIBJIif6eSn06sDf16PqorXO/BIs9fgn+CqR2wzZdy7QTU/wT18wOY01K
	HR7FWhd1aY7kgIsTl6ajAUkBVZ3Y=
X-Gm-Gg: ASbGncucMwjHQcEAsEKpUykxpjNTQC8nP/5blt9pjW6N3L1WGRcnnCi0KVJdzzMhCEJ
	hMOGh6J1FrRgd80QlLJdvn2cE/TqS18IArv850ZxMN0m6jGyyZ79Iv/Qha6DF5kr4GWGOCjwWwf
	Y8Bq5lnt1gXPKDz73C/p+NKtwBpfp4h8tX/Uwaj4u4lZmvDn3tLvkE8Hu0gckw7uM=
X-Google-Smtp-Source: AGHT+IEmOwXK2LuFYh7mE9FoPBp/KZqYGGb32Mvs7/fzuBy/q27GbvhH+PteT6hbPJHJRDNP83snG0RBgbKpuhxHmk4=
X-Received: by 2002:ac8:5916:0:b0:477:1ee1:23d9 with SMTP id
 d75a77b69052e-47aec3a7331mr45873521cf.20.1744982906523; Fri, 18 Apr 2025
 06:28:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250415182038.523186-1-gshahrouzi@gmail.com> <fb712c034eda0d5d711a90a00b6382315fb5f929.camel@gmail.com>
 <CAKUZ0zL88AyuRxzhoAv2iZO7N7qOMy1G3yKscqG3rQiiOS0gog@mail.gmail.com>
 <e8b24cf22c87e5b5ce0cc8919eca79f6e60ab6e3.camel@gmail.com>
 <CAKUZ0z+FKxHcYTYiGvrZ3RLiMKT1P4gtTdq8d7=+ZFC0RMQzqA@mail.gmail.com> <a32503d98ffe162f48de019fab1a37f86af1666e.camel@gmail.com>
In-Reply-To: <a32503d98ffe162f48de019fab1a37f86af1666e.camel@gmail.com>
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Date: Fri, 18 Apr 2025 09:28:15 -0400
X-Gm-Features: ATxdqUFv8S2auULHx0FcuBh0UZ0zXdklaGc3PXDOV667MRhIxOk_A11J2oTI0ic
Message-ID: <CAKUZ0zJK0MtMBMWaUCsF62vxc87XoN0xhJLfCcUZ84XNX-kKVg@mail.gmail.com>
Subject: Re: [PATCH] iio: adc: Revoke valid channel for error path
To: =?UTF-8?B?TnVubyBTw6E=?= <noname.nuno@gmail.com>
Cc: gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, Michael.Hennerich@analog.com, 
	sonic.zhang@analog.com, vapier@gentoo.org, skhan@linuxfoundation.org, 
	kernelmentees@lists.linuxfoundation.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 18, 2025 at 5:46=E2=80=AFAM Nuno S=C3=A1 <noname.nuno@gmail.com=
> wrote:
>
> On Thu, 2025-04-17 at 13:08 -0400, Gabriel Shahrouzi wrote:
> > On Thu, Apr 17, 2025 at 10:02=E2=80=AFAM Nuno S=C3=A1 <noname.nuno@gmai=
l.com> wrote:
> > >
> > > On Thu, 2025-04-17 at 08:53 -0400, Gabriel Shahrouzi wrote:
> > > > On Thu, Apr 17, 2025 at 6:06=E2=80=AFAM Nuno S=C3=A1 <noname.nuno@g=
mail.com> wrote:
> > > > >
> > > > > On Tue, 2025-04-15 at 14:20 -0400, Gabriel Shahrouzi wrote:
> > > > > > According to the datasheet on page 9 under the channel selectio=
n table,
> > > > > > all devices (AD7816/7/8) are able to use the channel marked as =
7. This
> > > > > > channel is used for diagnostic purposes by routing the internal=
 1.23V
> > > > > > bandgap source through the MUX to the input of the ADC.
> > > > > >
> > > > > > Replace checking for string equality with checking for the same=
 chip ID
> > > > > > to reduce time complexity.
> > > > > >
> > > > > > Group invalid channels for all devices together because they ar=
e
> > > > > > processed the same way.
> > > > > >
> > > > > > Fixes: 7924425db04a ("staging: iio: adc: new driver for AD7816 =
devices")
> > > > > > Cc: stable@vger.kernel.org
> > > > > > Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> > > > > > ---
> > > > > >  drivers/staging/iio/adc/ad7816.c | 15 +++++----------
> > > > > >  1 file changed, 5 insertions(+), 10 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/staging/iio/adc/ad7816.c
> > > > > > b/drivers/staging/iio/adc/ad7816.c
> > > > > > index 6c14d7bcdd675..d880fe0257697 100644
> > > > > > --- a/drivers/staging/iio/adc/ad7816.c
> > > > > > +++ b/drivers/staging/iio/adc/ad7816.c
> > > > > > @@ -186,17 +186,12 @@ static ssize_t ad7816_store_channel(struc=
t device
> > > > > > *dev,
> > > > > >       if (ret)
> > > > > >               return ret;
> > > > > >
> > > > > > -     if (data > AD7816_CS_MAX && data !=3D AD7816_CS_MASK) {
> > > > > > -             dev_err(&chip->spi_dev->dev, "Invalid channel id =
%lu for
> > > > > > %s.\n",
> > > > > > -                     data, indio_dev->name);
> > > > > > -             return -EINVAL;
> > > > > > -     } else if (strcmp(indio_dev->name, "ad7818") =3D=3D 0 && =
data > 1) {
> > > > > > -             dev_err(&chip->spi_dev->dev,
> > > > > > -                     "Invalid channel id %lu for ad7818.\n", d=
ata);
> > > > > > -             return -EINVAL;
> > > > > > -     } else if (strcmp(indio_dev->name, "ad7816") =3D=3D 0 && =
data > 0) {
> > > > > > +     if (data !=3D AD7816_CS_MASK &&
> > > > > > +         (data > AD7816_CS_MAX ||
> > > > > > +         (chip->id =3D=3D ID_AD7818 && data > 1) ||
> > > > > > +         (chip->id =3D=3D ID_AD7816 && data > 0))) {
> > > > > >               dev_err(&chip->spi_dev->dev,
> > > > > > -                     "Invalid channel id %lu for ad7816.\n", d=
ata);
> > > > > > +                     "Invalid channel id %lu for %s.\n", data,=
 indio_dev-
> > > > > > > name);
> > > > > >               return -EINVAL;
> > > > > >       }
> > > > >
> > > > > Hmm, maybe I'm missing something but the code just looks the same=
 as before
> > > > > (from a functionality point of view)? I'm really not seeing any f=
ix...
> > > > I might have to change it for readability. From my understanding, i=
f
> > > > channel 7 is selected (AD7816_CS_MASK), it never enters the error p=
ath
> > > > whereas in the old code, if the chip were either ad7816 or ad7818, =
it would
> > > > end up returning an error because it skips all channels above eithe=
r 0
> > > > or 1.
> > >
> > > Ahh, right!
> > >
> > > One good refactor is to add a chip_info struct (renaming the existing=
 one) with
> > > let's say a name and max_channels. Then, the condition could be reduc=
ed to:
> > >
> > > if (data > st->chip->max_channel && data !=3D AD7816_CS_MASK {
> > >         dev_err(...);
> > >         return -EINVAL;
> > > }
> > Makes sense. I sent a V2 with the updates. Also included enum
> > ad7816_type as a member for chip_info but not sure if it is necessary.
> > Renamed the existing one to ad7816_state.
> > >
> > > Being this in staging, I guess we don't care much about having the fi=
x as the
> > > first patch to make it easier to backport.
> > In other words, combining the refactoring and fix into one patch is
> > fine but normally they would be split?
>
> Yes, in theory we want to have the fixes first before any refactor becaus=
e we might
> want to backport the fix and we do not want to backport more code than ne=
eded. Not
> totally sure but being this on staging we might not care that much about =
this.
Got it.
>
> - Nuno S=C3=A1
> >
> > >
> > > - Nuno S=C3=A1
> > >
> > > >
> > > > >
> > > > > Having said the above, not sure if grouping helps with readabilit=
y. But I do
> > > > > agree with moving from string comparison to use chip->id. And we =
also have
> > > > > redundants 'else'
> > > > >
> > > > > - Nuno S=C3=A1
> > > > >
>
