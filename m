Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8B62AE8C
	for <linux-staging@lists.linux.dev>; Fri, 18 Apr 2025 17:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744997918; cv=none; b=hqhDPnEOM6VwoMivAqKrk4CSHC1+rgSecgk9vycU/Ib80bjke8xTlK3OnQziDufBhJSCDyE/DpcYWSXRUTorXfx4Ug1VQCUWgxfEKIGhwcDBaxP9DsmCNZ46BiTDaQJsLwwcIQcvzWDcvDKztRWT3WUfXSkMFax2M4QthBpS/Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744997918; c=relaxed/simple;
	bh=xb2G2VO1M1xfUb0LCy2IJ1UrQitw5bZu9jE/Qrd9Xu8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YpOr+iINdIeqKQM1kVoThj4aX5Xl05QGAzKiuRSw2V7maldbSe+Yhc9BySFdSqX9nNLIt3lalOUFujCyRVACmfDDmwIh+YyxOybLALuQEt3Gdx3N3D2EQKav6fq53x7M6D6EV9VIICtTDLByFYM1soOMY8QzCNXF9G/oey9QQAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mAhLbiFK; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mAhLbiFK"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-47692b9d059so28525801cf.3
        for <linux-staging@lists.linux.dev>; Fri, 18 Apr 2025 10:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744997915; x=1745602715; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ki8ACZJISOIbjJS/GasgcMmF3ePfgYfym/hjjZ80/W0=;
        b=mAhLbiFKYZHyea/2wwVXEh3sG2T8RfG4lbld05rYuK5E5ex3dBVYX/USa/UyzRM6Le
         m/ZGqaB/hgGQLX52FnQcgmWQohUYQtJwpucCa0GtpgkeV0N7eiUK4x7GGGRhq0KD54Ai
         nSp0BLjh/2pBUHr7V9jAlmJ8oTEbYICDjwIJEYqFfG//45IDDpP6ZmlOPnwUnueAvdwr
         U1JoTV6Ju8pYCkKwQ9gRYObgAzxxeY9jikuKAtFU9a2UT4tPJaJgfZs97NscZ8mUrc9m
         gyWtZ3Zkat9lRMb+O0LotCjo6ralGC5Sx0Jg4ZZ01JIdAyfg/rn7ZU9FFHXT0K75Blp9
         nFrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744997915; x=1745602715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ki8ACZJISOIbjJS/GasgcMmF3ePfgYfym/hjjZ80/W0=;
        b=dt1eUfxEsaiISA3uL13XmJrS2nf4/QVFOLxCQ+cgL5wx3A6UVAYp7BmDLiAP3nLUWk
         DEN+zSsy2ETjoswjWnqnv7PKfRRSSog4Zn6/V7ZMPxF1bOcbSmWumIRRCM+DpNrDGeU3
         NNjQfrnaY+nVuY+zwvvnNmKKJDpetgYYj+Gr7gvHIZsC2gPehjD0h865ZtFQ/URhsCql
         +xWEKiuOFOVgjqnIJu1TEKGlta4fhA1ECxpz4ZVKHR3PFOAojUOaaVcnyzNE5NkKHLYq
         RQdzaE4XjS0FfQrUdY7/3yBh6p7B9K+KuxgWInNqc0UhxG4cn6rxMTmRIEHd1v+AAVMn
         tDyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsiTr6j3mfi+TnSLGPbowZCEnnqr9q70cSYxuCaky3tBsU73qhq73MAsMDLZWOb5aSj2xRvMpE7ppuv92y@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/zT/Pxj+sXRLmV4BJDTykpNpwLN+b7uUUhcCgNPBrGutDK+ww
	pdbgqF/nPHYa+Eyy/gNBTm3iGVTX6T8I6IDTeuO0NdetrVSt2L2WzQ/K2V/rdEThKg0Q93SxZ/c
	AUxQs8FUhBJ4kEO1sPEE6BIa9reY=
X-Gm-Gg: ASbGnctax7AAsj0ORRuEm1q/Cb1NGXZtYZ2jETyZUSN2feyeNFY98zfKe2AOPOjdMeu
	qgqC76gX/ZFK8S/lSe5OXV96kieZZ9Cind1VSlchKm2Es397TquBZkCTLJ6JnUrIR9HycBGYYq5
	Ri+TCC3H/ilTrjvTYouDJ+Dy7M6vxsMS/IaOHGt+ShtOFSPL+XFwvH
X-Google-Smtp-Source: AGHT+IGGjHKCjDEZMmSyR53rv7oRObionPa3GQZ+n0O87mJ/ObRuEobUJbchFdd8U7yEiltYlhwfH36qnsflWc3KJdc=
X-Received: by 2002:a05:622a:1a12:b0:476:a967:b247 with SMTP id
 d75a77b69052e-47aec4ccc58mr55176681cf.47.1744997915428; Fri, 18 Apr 2025
 10:38:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250415222652.545026-1-gshahrouzi@gmail.com> <20250418165012.53c9bb85@jic23-huawei>
In-Reply-To: <20250418165012.53c9bb85@jic23-huawei>
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Date: Fri, 18 Apr 2025 13:38:24 -0400
X-Gm-Features: ATxdqUEoSHSECR3LAgcFScpgkJmwDfqANFifuTo82ewMJWl8EgbXtME3-PccdqU
Message-ID: <CAKUZ0zJ5ZCmkJOESYpbp=a6odgLyt4Qxt_0cucsHk7FCYqoumw@mail.gmail.com>
Subject: Re: [PATCH] iio: accel: adis16203: Fix single-axis representation and
 CALIBBIAS handling
To: Jonathan Cameron <jic23@kernel.org>
Cc: gregkh@linuxfoundation.org, lars@metafoo.de, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	Michael.Hennerich@analog.com, skhan@linuxfoundation.org, 
	kernelmentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 18, 2025 at 11:50=E2=80=AFAM Jonathan Cameron <jic23@kernel.org=
> wrote:
>
> On Tue, 15 Apr 2025 18:26:52 -0400
> Gabriel Shahrouzi <gshahrouzi@gmail.com> wrote:
>
> > The ADIS16203 is a single-axis 360 degree inclinometer. The previous
> > driver code incorrectly represented this by defining separate X and Y
> > inclination channels based on the two different output format registers
> > (0x0C for 0-360 deg, 0x0E for +/-180 deg). This violated IIO convention=
s
> > and misrepresented the hardware's single angle output. The 'Fixme'
> > comment on the original Y channel definition indicated this known issue=
.
> >
> > Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> > ---
> > Not sure to put a fixes tag here or not because the driver used to be
> > spread out across multiple files until it was whittled down to one file
> > using a common interface for similar devices.
>
> No fixes tag for this one is the right choice. It is a complex bit of
> ABI abuse.
Got it.
>
> > ---
> >  drivers/staging/iio/accel/adis16203.c | 52 ++++++++++++++++-----------
> >  1 file changed, 31 insertions(+), 21 deletions(-)
> >
> > diff --git a/drivers/staging/iio/accel/adis16203.c b/drivers/staging/ii=
o/accel/adis16203.c
> > index c1c73308800c5..73288121bf0bd 100644
> > --- a/drivers/staging/iio/accel/adis16203.c
> > +++ b/drivers/staging/iio/accel/adis16203.c
> > @@ -28,11 +28,11 @@
> >  /* Output, temperature */
> >  #define ADIS16203_TEMP_OUT       0x0A
> >
> > -/* Output, x-axis inclination */
> > -#define ADIS16203_XINCL_OUT      0x0C
> > +/* Output, 360 deg format */
> > +#define ADIS16203_INCL_OUT       0x0C
> >
> > -/* Output, y-axis inclination */
> > -#define ADIS16203_YINCL_OUT      0x0E
> > +/* Output, +/-180 deg format */
> > +#define ADIS16203_INCL_180_OUT   0x0E
> >
> >  /* Incline null calibration */
> >  #define ADIS16203_INCL_NULL      0x18
> > @@ -128,8 +128,7 @@
> >  #define ADIS16203_ERROR_ACTIVE          BIT(14)
> >
> >  enum adis16203_scan {
> > -      ADIS16203_SCAN_INCLI_X,
> > -      ADIS16203_SCAN_INCLI_Y,
> > +      ADIS16203_SCAN_INCLI,
> >        ADIS16203_SCAN_SUPPLY,
> >        ADIS16203_SCAN_AUX_ADC,
> >        ADIS16203_SCAN_TEMP,
> > @@ -137,10 +136,6 @@ enum adis16203_scan {
> >
> >  #define DRIVER_NAME          "adis16203"
> >
> > -static const u8 adis16203_addresses[] =3D {
> > -     [ADIS16203_SCAN_INCLI_X] =3D ADIS16203_INCL_NULL,
> > -};
> > -
> >  static int adis16203_write_raw(struct iio_dev *indio_dev,
> >                              struct iio_chan_spec const *chan,
> >                              int val,
> > @@ -148,10 +143,15 @@ static int adis16203_write_raw(struct iio_dev *in=
dio_dev,
> >                              long mask)
> >  {
> >       struct adis *st =3D iio_priv(indio_dev);
> > -     /* currently only one writable parameter which keeps this simple =
*/
> > -     u8 addr =3D adis16203_addresses[chan->scan_index];
> >
> > -     return adis_write_reg_16(st, addr, val & 0x3FFF);
> > +     switch (mask) {
> > +     case IIO_CHAN_INFO_CALIBBIAS:
> > +             if (chan->scan_index !=3D ADIS16203_SCAN_INCLI)
> > +                     return -EINVAL;
> > +             return adis_write_reg_16(st, ADIS16203_INCL_NULL, val & 0=
x3FFF);
>
> I would check for out of range before you get here rather than masking.
> Clearly the old code just masked, but we can do better given you are refa=
ctoring
> it.  If an invalid setting is requested best thing is normally to just re=
turn
> an error so userspace can see it was ignored.
Got it. Added these changes to V2.
>
>
> > +     default:
> > +             return -EINVAL;
> > +     }
> >  }
> >
> >  static int adis16203_read_raw(struct iio_dev *indio_dev,
> > @@ -161,7 +161,6 @@ static int adis16203_read_raw(struct iio_dev *indio=
_dev,
> >  {
> >       struct adis *st =3D iio_priv(indio_dev);
> >       int ret;
> > -     u8 addr;
> >       s16 val16;
> >
> >       switch (mask) {
> > @@ -194,8 +193,9 @@ static int adis16203_read_raw(struct iio_dev *indio=
_dev,
> >               *val =3D 25000 / -470 - 1278; /* 25 C =3D 1278 */
> >               return IIO_VAL_INT;
> >       case IIO_CHAN_INFO_CALIBBIAS:
> > -             addr =3D adis16203_addresses[chan->scan_index];
> > -             ret =3D adis_read_reg_16(st, addr, &val16);
> > +             if (chan->scan_index !=3D ADIS16203_SCAN_INCLI)
> > +                     return -EINVAL;
> > +             ret =3D adis_read_reg_16(st, ADIS16203_INCL_NULL, &val16)=
;
> >               if (ret)
> >                       return ret;
> >               *val =3D sign_extend32(val16, 13);
> > @@ -206,13 +206,23 @@ static int adis16203_read_raw(struct iio_dev *ind=
io_dev,
> >  }
> >
> >  static const struct iio_chan_spec adis16203_channels[] =3D {
> > +     {
> > +             .type =3D IIO_INCLI,
> > +             .info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW) |
> > +                                     BIT(IIO_CHAN_INFO_SCALE) |
> > +                                     BIT(IIO_CHAN_INFO_CALIBBIAS),
> > +             .address =3D ADIS16203_INCL_180_OUT,
> > +             .scan_index =3D ADIS16203_SCAN_INCLI,
> > +             .scan_type =3D {
> > +                     .sign =3D 's',
> > +                     .realbits =3D 14,
> > +                     .storagebits =3D 16,
> > +                     .shift =3D 0,
>
> No need for setting shift to 0 explicitly.  It will happen anyway and
> a shift of 0 is a fairly natural default.
Got it. Added to V2.
>
> > +                     .endianness =3D IIO_CPU,
> > +             },
> > +     },
> >       ADIS_SUPPLY_CHAN(ADIS16203_SUPPLY_OUT, ADIS16203_SCAN_SUPPLY, 0, =
12),
> >       ADIS_AUX_ADC_CHAN(ADIS16203_AUX_ADC, ADIS16203_SCAN_AUX_ADC, 0, 1=
2),
> > -     ADIS_INCLI_CHAN(X, ADIS16203_XINCL_OUT, ADIS16203_SCAN_INCLI_X,
> > -                     BIT(IIO_CHAN_INFO_CALIBBIAS), 0, 14),
> > -     /* Fixme: Not what it appears to be - see data sheet */
> > -     ADIS_INCLI_CHAN(Y, ADIS16203_YINCL_OUT, ADIS16203_SCAN_INCLI_Y,
> > -                     0, 0, 14),
> Why the ordering change?  I don't think it matters in practice, but easie=
r to
> review of we keep that ordering the same as then no need to think about i=
t at
> all!
You're right, maintaining the original order simplifies reviewing this
specific functional change. I have restored the original relative
order of the channels in v2.
My initial thought process for moving the inclinometer channel was to
place the device's primary function first in the list, but I agree
that separating functional changes (like this patch) from
organizational changes (like reordering) is better practice. Any
reordering can be proposed separately.
>
> Jonathan
>
> >       ADIS_TEMP_CHAN(ADIS16203_TEMP_OUT, ADIS16203_SCAN_TEMP, 0, 12),
> >       IIO_CHAN_SOFT_TIMESTAMP(5),
> >  };
>
