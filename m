Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A2D288C93;
	Thu, 24 Apr 2025 22:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745533811; cv=none; b=iCgc6E0TaaHiRnAP0efA20rKPrfXfuf0LWAxKWcYVLL93v8Df0X7hevsgggCcTrDC/uH2YmYvMb6eOtYnL3eudenwHFAsuJzgTJe51i2ZaVA6lvofaAusFDh2IjDZISSMtsS2oa2ZCSXd9NRfV1Rq2w6owkPf89kyoBNtbgUKzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745533811; c=relaxed/simple;
	bh=cuQzUUvxeCs9j1sBqZ74MivCxv9pA0bPEH+NQyPqPnw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zty7BPlaKQkefd5bHV1V/Ym3MUhU36pv+/ytgcldV6NolVoMrkLMHX8apINtu3OYmX7Bn6QeO31wU8B+pSeEozdKemqdevKHIx4xfk8rhap09dbV8z2c1fnxEfkp1d/6bwNR8QLuP9bGFtEKI37J7GE/2Q775pk7Ta+X+IxNREM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A9GWVu/x; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A9GWVu/x"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4769f3e19a9so11003721cf.0;
        Thu, 24 Apr 2025 15:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745533808; x=1746138608; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8cE8lrzeJfm1QbIEx8aHZTIYIj8T/E/38PHm5I1LoFg=;
        b=A9GWVu/xyZKV/abQTAGXlOBwuQPOnpmcjT2LHb+ZDoKt0rydgYSeut3V+i3kkT1X4l
         1DlNqAQoiTNWMdo3KphaQTc2ImRVlPDir3fo/PstD3SSDRD6N2TYK8GW8pKU1zPBbGTd
         Oq3IfT+lypFCfIU0izwCOhvCnI8paieY/IM06NyKnkXovuzFrfMX4uFn22ghaL+hqnE4
         kHkhl6mtGCElIiHFfd2fcEbiLCxgiZQBJzidU1KV0Pv5D0qRNZWyWRFxM39Z9QdRC9bI
         myr/X1MTY0vJDtlg6g6Zbo2zOBzxNC6qKFWkF7FlBJ1+8Kx0lm1a4q16Yj19vAeZSaG5
         tURQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745533808; x=1746138608;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8cE8lrzeJfm1QbIEx8aHZTIYIj8T/E/38PHm5I1LoFg=;
        b=HQBW7wPTOpbeO3SBnbbXdYQ8H33c1ghvPEVvKr1iRUGcpnGkAGXF85qeYgQiPAn0xK
         uWl0uhVFdR1CajISNeD4bkkZdyVUTwZrpBtliU6Bm9QE07JtiHtdvbYtDo5sXLnDyoBW
         JvmcbyhzDLdM49AvZWNBmrMesQ1/TOkfDav2bXDFLU902x6V68bM58JduOIcGyrOiJuI
         o574eH6WH1JK6hBNVSIQnhhwpyU3mz6pHJEh0oNJ5XtpOMJcDK/4m66Cp5NW6qQH4fiw
         iASiLyyP6iW/JjtJXNcDVHEP8Dfn9aqY3jIW8kerLuV4v15Op34ItXfCRoFsYBjGkhvu
         Tu+w==
X-Forwarded-Encrypted: i=1; AJvYcCVgYqulAZ2uv1vJADQho7fZ7mR06vPuS9ih//2IQy3UaEGlXU4cvZZj/+51EZUHiFxjHftVDKxSDYyR0RmB7Q==@lists.linux.dev, AJvYcCX+Arcy43owzdSUUHj2ipLoZcqjHESywcfpXA6A4dBC0ZkdmwWEcPDsHfJO2+m7S3z/4p9AWoaWwAbN462v8jEC5TqA8A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzbYNj32cw+i8nKeNub4aeoRVk+HUFaj/EpnU+zO/DVMiRN5VGe
	Tq/mmZBWSdC7Ah6GcQj4ZCJPVA4L6OIZSJhWq4h0NK22F+G9j1mR2DhR0lMAGR2Tpft4kTaUds2
	mrjCa6lDwt7zeBoW/Cv7m32dOyswMc4mh
X-Gm-Gg: ASbGncvYS4C62TJVCGJjARuOmJt/s/krdtd7wwq8SAZjQ+yxgKKW6D8cHZa2WGrmq06
	Yjeo1ywXwqgfTcao7m9/fbeOGNIFz+liU9vuPgSoVZtE0nXF3VcewVihGE/Rk9O7y4wSSmIE1ic
	kE9t99Y3yEGmX0zSccnGjaDoCIzsfScFVl58yEXaEX7zLBcIOSTusldQ==
X-Google-Smtp-Source: AGHT+IE9PGpkxIATayNkKOYIn25iNoH+/2U6QJMbL/8pzJyCLEDJFpGaeSZGrpE0q68KrNypmjVw05RtF1U73UB5whw=
X-Received: by 2002:a05:622a:1a9f:b0:476:b783:c94b with SMTP id
 d75a77b69052e-4801e3f7427mr2303301cf.40.1745533807902; Thu, 24 Apr 2025
 15:30:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250420175419.889544-1-gshahrouzi@gmail.com> <20250420175419.889544-4-gshahrouzi@gmail.com>
 <20250421124044.400628f1@jic23-huawei>
In-Reply-To: <20250421124044.400628f1@jic23-huawei>
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Date: Thu, 24 Apr 2025 18:29:57 -0400
X-Gm-Features: ATxdqUE5QDMBo5xoa61NQ3oiJvjCAcOwRQYcvy6rLZHVXpxmXg9tF43a7qIROJs
Message-ID: <CAKUZ0zLgH9Ec5FMEjXa59-bBEVooEQUOeGuZ9OJw=A3P3OWp5A@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] staging: iio: ad9832: Add minor improvements to ad9832_write_powerdown
To: Jonathan Cameron <jic23@kernel.org>
Cc: gregkh@linuxfoundation.org, lars@metafoo.de, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	Michael.Hennerich@analog.com, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 21, 2025 at 7:40=E2=80=AFAM Jonathan Cameron <jic23@kernel.org>=
 wrote:
>
> On Sun, 20 Apr 2025 13:54:19 -0400
> Gabriel Shahrouzi <gshahrouzi@gmail.com> wrote:
>
> > Minimize size of type that needs to be used by replacing unsigned long
> > with bool. Avoid redundancy by checking if cached power state is the
> > same as the one requested.
> >
> > Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> > ---
> >  drivers/staging/iio/frequency/ad9832.c | 18 ++++++++++++------
> >  1 file changed, 12 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/i=
io/frequency/ad9832.c
> > index a8fc20379efed..2ab6026d56b5c 100644
> > --- a/drivers/staging/iio/frequency/ad9832.c
> > +++ b/drivers/staging/iio/frequency/ad9832.c
> > @@ -173,13 +173,19 @@ static ssize_t ad9832_write_powerdown(struct devi=
ce *dev, struct device_attribut
> >       struct iio_dev *indio_dev =3D dev_to_iio_dev(dev);
> >       struct ad9832_state *st =3D iio_priv(indio_dev);
> >       int ret;
> > -     unsigned long val;
> > +     bool val;
> > +     bool cur;
> >
> > -     ret =3D kstrtoul(buf, 10, &val);
> > +     ret =3D kstrtobool(buf, &val);
> That could have been done in the previous patch as you are changing the A=
BI anyway.
Got it.
> >       if (ret)
> > -             goto error_ret;
> > +             return ret;
> >
> >       mutex_lock(&st->lock);
> > +
> > +     cur =3D !!(st->ctrl_src & AD9832_SLEEP);
>
> Worth thinking about whether this driver will ever be converted to regmap=
 with regcache.
> If that's a reasonable thing to do long term this sort of optimization ad=
ds nothing
> useful as we'll skip the right anwyay if the driver is already in the app=
ropriate state.
Got it.
>
> This isn't a high performance path, so I'd not bother with the check for =
now.
Got it.
>
> > +     if (val =3D=3D cur)
> > +             goto unlock;
> > +
> >       if (val)
> >               st->ctrl_src |=3D AD9832_SLEEP;
> >       else
> > @@ -189,10 +195,10 @@ static ssize_t ad9832_write_powerdown(struct devi=
ce *dev, struct device_attribut
> >       st->data =3D cpu_to_be16((AD9832_CMD_SLEEPRESCLR << CMD_SHIFT) |
> >                               st->ctrl_src);
> >       ret =3D spi_sync(st->spi, &st->msg);
> If this fails, where doe ret end up? Looks to me like we now don't report=
 the error
> Anyhow, see guard() comment in previous patch.  These days we can avoid a=
 lot of
> this complexity by using that to allow direct returns where we first see =
the error.
Ah right, fixed that for the new version and removed the complexity by
directly returning.
>
> > -     mutex_unlock(&st->lock);
> >
> > -error_ret:
> > -     return ret ? ret : len;
> > +unlock:
> > +     mutex_unlock(&st->lock);
> > +     return len;
> >  }
> >
> >  static ssize_t ad9832_write(struct device *dev, struct device_attribut=
e *attr,
>
