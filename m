Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BA823F41A
	for <linux-staging@lists.linux.dev>; Thu, 17 Apr 2025 12:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744894413; cv=none; b=k+NpIUPy4rh84/CiEpwH5isl8WgKR1juprOTrgxPjyJduY7uMIT9Mv4XHWtDB6C64d+KJktRJEVq4HyJuR7fzaJEU4/iEPk2dRPO3aYdejV4f1Jj5ff7v4GKRPU8qxq9T2hF+tgvMlnHB3HnyB8V+h23um6PUIYJhxqb5D+HNTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744894413; c=relaxed/simple;
	bh=V6B+8U2UFhneiRVOZyseKWoyXNpM1iYOpJRLd/qajmM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HjaM9kRltaLdQdOngT14sq/8ASSvzlBQT3w+Pt7XkyK+/1PAHaw02A3yF7PLDsztWKRndaabuG3OWw8uFaPUZxF/6ZpCzWxX4NscOAsJFv1Pm8heeR1MgWLRd2jviSrAiD6C/ff+3pDo9tVBA5ynktvNfMdxhuG4FQofdRKw38s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SoB8qLel; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SoB8qLel"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-47698757053so7859861cf.0
        for <linux-staging@lists.linux.dev>; Thu, 17 Apr 2025 05:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744894410; x=1745499210; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZlVLziAvMwY2q0tZP9ngpJkek12c6+IDEyw24UOz9aY=;
        b=SoB8qLelBWB8VoaNZbt24IIiPsz33tMr5Dcb72WrDXfGWDayuaecAsQytM72mmgWBZ
         Xic6sKk+eq/UNQvSg5lCaPQWyAa8eqnak+H246pIFAIbdI8mp+WIRqbObliZugUIjolj
         Yu0R/qWHB951cxgFAkRfxDZjOeUeR5KT7ydGYNnEXPKSMyc4EaiIT7jcZCNmLaGcF9e3
         WHW3Y47rRUuJU0UEfiuRBywDlIXqiP3mWMu9xoR4QdALbixlkMQek9yy4Hx9YF87PWqQ
         hVCtXbKgCepQICZkmhvG2M9bvgR0aTCmnAMFVlUX+KlmAfKvt5yEoDPXN3Mzu3dA42fg
         pSYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744894410; x=1745499210;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZlVLziAvMwY2q0tZP9ngpJkek12c6+IDEyw24UOz9aY=;
        b=ZcRS1UZEJ12L1YUBVw5LqbMtZePPfXPKGFzMuddC8cUT2Tq3Xikti5cL9YhfV10W+E
         Dk6ha52BNShqNrgViOXn8f/sGsuVsazUhQAwZ1XGD0+iknzFDPOn3ue/kWWMrow9zxJc
         8ss4X+IqkCUvCF3zLmgQhdt9VmtlZrGSEBhiBvZOaJQCClXZ8PrwR2TcmK01g6pJr3N/
         X4fJhl9ji1mNxNOAjBy1szKr/iNOTNXtkFqYQItGIX+E03SzL2VmUSTEd52qYvhvqP4s
         yl978oRsn8oz5+uuQ1Y5KOPc33Czv2SoNHYNQ5wEkKUSy+6HZQ60SjOP9Z9ewy0O7BFV
         moJg==
X-Forwarded-Encrypted: i=1; AJvYcCUOu6HsKt+i/cI0CebENAZbSGO1e64nf8743OkINLdAGnwQX/3XFOsrPh5Wn+htausQXxTt7ywOqJt1b9oE@lists.linux.dev
X-Gm-Message-State: AOJu0YzAobdQ2mxgNtbX9SCqNSlMbIPSZ9fnHV332toJ5JZ0dwHCSaBy
	JPImxj+pBEEVDD0cLNWM84DC93rZl3KQglq7RrBZJkeyOc3uaZlh2/qvTAsNc4qlqNPyiUuQS95
	jc8v0EMu5N/3vBcKYkY15lNeApVo=
X-Gm-Gg: ASbGncv9zSljobdszdmboj+Hh6E4S0ZiRPS1zkwOEBRCyBuF0vyoH+vrNtPATCSWQTZ
	pn9Temo4jke1Qnb1U2IqJWJJx+Na68tIlXZ8HWJNC+Rh90T6BM6IZDnUAAs8O31z66sR/5ZyFdt
	OBsnMb7yI+tv2qqwOoU/3+xBswIjBBODLCaWTS3BfLdw3960h7J5i1bjOoH62sgGg=
X-Google-Smtp-Source: AGHT+IFEjAoQPgnXW6t27//O1W+0o+CbqBiAp3geF0MsUU262k2xourjdT/yrRcBHz1zdq4ge4SLOhinWOa3F/k2BeI=
X-Received: by 2002:a05:622a:1349:b0:476:af18:239d with SMTP id
 d75a77b69052e-47ad813ba57mr76197351cf.51.1744894410435; Thu, 17 Apr 2025
 05:53:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250415182038.523186-1-gshahrouzi@gmail.com> <fb712c034eda0d5d711a90a00b6382315fb5f929.camel@gmail.com>
In-Reply-To: <fb712c034eda0d5d711a90a00b6382315fb5f929.camel@gmail.com>
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Date: Thu, 17 Apr 2025 08:53:00 -0400
X-Gm-Features: ATxdqUGK6KuhhM7Fj61ixiHKA90df-58_gkHsmQfZaA-QhOIG8h5HdACWar_0Fk
Message-ID: <CAKUZ0zL88AyuRxzhoAv2iZO7N7qOMy1G3yKscqG3rQiiOS0gog@mail.gmail.com>
Subject: Re: [PATCH] iio: adc: Revoke valid channel for error path
To: =?UTF-8?B?TnVubyBTw6E=?= <noname.nuno@gmail.com>
Cc: gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, Michael.Hennerich@analog.com, 
	sonic.zhang@analog.com, vapier@gentoo.org, skhan@linuxfoundation.org, 
	kernelmentees@lists.linuxfoundation.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 6:06=E2=80=AFAM Nuno S=C3=A1 <noname.nuno@gmail.com=
> wrote:
>
> On Tue, 2025-04-15 at 14:20 -0400, Gabriel Shahrouzi wrote:
> > According to the datasheet on page 9 under the channel selection table,
> > all devices (AD7816/7/8) are able to use the channel marked as 7. This
> > channel is used for diagnostic purposes by routing the internal 1.23V
> > bandgap source through the MUX to the input of the ADC.
> >
> > Replace checking for string equality with checking for the same chip ID
> > to reduce time complexity.
> >
> > Group invalid channels for all devices together because they are
> > processed the same way.
> >
> > Fixes: 7924425db04a ("staging: iio: adc: new driver for AD7816 devices"=
)
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> > ---
> >  drivers/staging/iio/adc/ad7816.c | 15 +++++----------
> >  1 file changed, 5 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/staging/iio/adc/ad7816.c
> > b/drivers/staging/iio/adc/ad7816.c
> > index 6c14d7bcdd675..d880fe0257697 100644
> > --- a/drivers/staging/iio/adc/ad7816.c
> > +++ b/drivers/staging/iio/adc/ad7816.c
> > @@ -186,17 +186,12 @@ static ssize_t ad7816_store_channel(struct device=
 *dev,
> >       if (ret)
> >               return ret;
> >
> > -     if (data > AD7816_CS_MAX && data !=3D AD7816_CS_MASK) {
> > -             dev_err(&chip->spi_dev->dev, "Invalid channel id %lu for
> > %s.\n",
> > -                     data, indio_dev->name);
> > -             return -EINVAL;
> > -     } else if (strcmp(indio_dev->name, "ad7818") =3D=3D 0 && data > 1=
) {
> > -             dev_err(&chip->spi_dev->dev,
> > -                     "Invalid channel id %lu for ad7818.\n", data);
> > -             return -EINVAL;
> > -     } else if (strcmp(indio_dev->name, "ad7816") =3D=3D 0 && data > 0=
) {
> > +     if (data !=3D AD7816_CS_MASK &&
> > +         (data > AD7816_CS_MAX ||
> > +         (chip->id =3D=3D ID_AD7818 && data > 1) ||
> > +         (chip->id =3D=3D ID_AD7816 && data > 0))) {
> >               dev_err(&chip->spi_dev->dev,
> > -                     "Invalid channel id %lu for ad7816.\n", data);
> > +                     "Invalid channel id %lu for %s.\n", data, indio_d=
ev-
> > >name);
> >               return -EINVAL;
> >       }
>
> Hmm, maybe I'm missing something but the code just looks the same as befo=
re
> (from a functionality point of view)? I'm really not seeing any fix...
I might have to change it for readability. From my understanding, if
channel 7 is selected (AD7816_CS_MASK), it never enters the error path
whereas in the old code, if the chip were either ad7816 or ad7818, it would
end up returning an error because it skips all channels above either 0
or 1.

>
> Having said the above, not sure if grouping helps with readability. But I=
 do
> agree with moving from string comparison to use chip->id. And we also hav=
e
> redundants 'else'
>
> - Nuno S=C3=A1
>
