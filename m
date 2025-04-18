Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C4A21517E
	for <linux-staging@lists.linux.dev>; Fri, 18 Apr 2025 18:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744999932; cv=none; b=O5Ng3/81RLZqBQp6UnEfjYwerf1xRuj34EK06RfDX0qgyxGPvwGnecXFK778uuue5PZP0SP/1JuHxFcfgL6prSPcZ/YPt5ffDRuUm3K/IY3TPyhknR6lOLAB7jgLS6nKPxz5YU2r8cgRPfAVgByNbJNZt272XeGNxUTQzNeMZW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744999932; c=relaxed/simple;
	bh=tIYOX30m77XMmecvZ5oAv9VPJ8j37JJQn3MOhafQaZQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qeRgqhv1W66HR2bihT0KEXvd5afCFpLk+Bu8oToNwplR6BQOun9Y8v4s1/+Em/eNTg5vYvxwfhqNt2K7x6a+C9AhzDdz2APSRoL3dJ47Lwv4kI+rmvW6PH216jnHB4MeSn3qzJABZDtpyA00tgnSPtsaHGi1FAoDhVpc1U4RF3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F/21ZbJB; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F/21ZbJB"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-476af5479feso22300781cf.2
        for <linux-staging@lists.linux.dev>; Fri, 18 Apr 2025 11:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744999930; x=1745604730; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SJco10XPuPQKf/Tc++SD2/J8aFDKSxmBKlJ6mW6zQio=;
        b=F/21ZbJBLWqbUL5KdMAwW4fvVEYoEu2OKs4t/0L6SlcDTXAfbGnb6mGkngU7OUhfnp
         DX/MKrCRzOlxyTueP2ycEhPK64mHraK0f6x+kwySlp7fy5cTXFEnkA87wnVPqAqsdZYZ
         Q6++Lg/QP89iDKikNggAKpur9jbJJXNEhIZcbw+mqdErw+LECZGUlKI4UMt0QCGVTdeM
         ph3lUCqVorStwn9LV46iNujzD1sEfCOBX07CeReB6Tf96iZNp4NwcmD9P4MK1zWxJZ3V
         m5A+kJZEfT9t5YJO3Z30HivuKfttT/ir/1vMGdDRVcbPu03AVCNlGbccdzNvxYaAuSM/
         t26g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744999930; x=1745604730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SJco10XPuPQKf/Tc++SD2/J8aFDKSxmBKlJ6mW6zQio=;
        b=Cxr5Q3wH1upf1F7kS97oLBQo/9VLUioGJYUrSKUqT0EW3fYbeRm89bxkvo/wr8GzqA
         Z+Jy1ns0pzsPOa7UOiXtkVlScPDrTfq7a5W63y7hzvY2ZOY+2bKnvjMj9C7USs8pN4uB
         bn8v71loxNjSaTMOcGGuM2mXbe4kv7H5gwtDZNLifWa6i3oqsbI5NU8ucBO/omul4QFv
         W7GEu8kvzaJNpOcmvUbD2baFj7xrRLXf6hLrqvPTJv/jAzc5v2mCKIQL6b2FroXs7ooc
         /5NTiRXl7VLnSUMnv02k25GtMolPk6G2LlIeLttwyXpQVu+K3NgG3LbK7nKUXU0GujLW
         f3QA==
X-Forwarded-Encrypted: i=1; AJvYcCXXWi+Lgz1bKZhh3/OPN6+CyB5G0ywo7xSvl6W3ZXSamMtDLSfiPLLZQb0epdrV0fQPFdpQh8BYIonSP9xK@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2BvIeqKTdQuY+M9gsUCHfuRfxTJ0Tm7CyBrpTxaL2RnLqWvzG
	MPEZLhebpGETJVzwzW//KKoy2JbunzAaoaz54HUs29ME2BeWrVvhw1udfZ2jBaQVseIqKha/9n/
	ozqJ1zB7Tmjuf/hw6X/x17MarTcs=
X-Gm-Gg: ASbGncuoZA69nrLtFRnGaYqmsNAxPiIaVlT8NeMfHllErB6Coi8yoOXn7d9wG8OQ+My
	QHKMnUuN+ibQO/H8WyvtpjSHXYBlpkB9yXY73i+urNhsRUgQJM7Ax7d3BKRX7wYhF0l3Z00BcEf
	LrhwuE+TIp/FYzqpBiBenjxgygHCeuoy6KD5+X1YBrmo7hjSoshEne
X-Google-Smtp-Source: AGHT+IFqk9cOhSM8u+bAweWSLbOzuzyfLuP+5P6usMk2RodloGJ4pT00BcXmM1/5KNnD6AVF4cshEKYdnn2jsyiN7FQ=
X-Received: by 2002:ac8:5fd6:0:b0:476:a823:50d5 with SMTP id
 d75a77b69052e-47aec4c44c8mr55686311cf.39.1744999929874; Fri, 18 Apr 2025
 11:12:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250416142219.554938-1-gshahrouzi@gmail.com> <20250418163743.4f9379a1@jic23-huawei>
In-Reply-To: <20250418163743.4f9379a1@jic23-huawei>
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Date: Fri, 18 Apr 2025 14:11:59 -0400
X-Gm-Features: ATxdqUGhX7PuegZ_GRikwyDvIOOHnLsdXAD3xeBIdSe-0ypsW9tHivdhqRyaLVc
Message-ID: <CAKUZ0z+AsM_UUtSDAZyBRMOt2CiqghBfoV1-s4N-Q9zQHC1++w@mail.gmail.com>
Subject: Re: [PATCH] iio: ad5933: Correct settling cycles encoding per datasheet
To: Jonathan Cameron <jic23@kernel.org>
Cc: gregkh@linuxfoundation.org, lars@metafoo.de, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	Michael.Hennerich@analog.com, skhan@linuxfoundation.org, 
	kernelmentees@lists.linuxfoundation.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 18, 2025 at 11:37=E2=80=AFAM Jonathan Cameron <jic23@kernel.org=
> wrote:
>
> On Wed, 16 Apr 2025 10:22:19 -0400
> Gabriel Shahrouzi <gshahrouzi@gmail.com> wrote:
>
> > Implement the settling cycles encoding as specified in the AD5933
> > datasheet, Table 13 ("Number of Settling Times Cycles Register"). The
> > previous logic did not correctly translate the user-requested effective
> > cycle count into the required 9-bit base + 2-bit multiplier format
> > (D10..D0) for values exceeding 511.
> >
> > Clamp the user input for out_altvoltage0_settling_cycles to the
> > maximum effective value of 2044 cycles (511 * 4x multiplier).
> >
> > Fixes: f94aa354d676 ("iio: impedance-analyzer: New driver for AD5933/4 =
Impedance Converter, Network Analyzer")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> > ---
> >  .../staging/iio/impedance-analyzer/ad5933.c   | 21 ++++++++++++-------
> >  1 file changed, 14 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/staging/iio/impedance-analyzer/ad5933.c b/drivers/=
staging/iio/impedance-analyzer/ad5933.c
> > index d5544fc2fe989..5a8c5039bb159 100644
> > --- a/drivers/staging/iio/impedance-analyzer/ad5933.c
> > +++ b/drivers/staging/iio/impedance-analyzer/ad5933.c
> > @@ -28,7 +28,7 @@
> >  #define AD5933_REG_FREQ_START                0x82    /* R/W, 3 bytes *=
/
> >  #define AD5933_REG_FREQ_INC          0x85    /* R/W, 3 bytes */
> >  #define AD5933_REG_INC_NUM           0x88    /* R/W, 2 bytes, 9 bit */
> > -#define AD5933_REG_SETTLING_CYCLES   0x8A    /* R/W, 2 bytes */
> > +#define AD5933_REG_SETTLING_CYCLES   0x8A    /* R/W, 2 bytes, 11+2 bit=
 */
>
> Probably spaces around the +  It's not code, but lets keep to consistent =
code style.
Got it.
>
> >  #define AD5933_REG_STATUS            0x8F    /* R, 1 byte */
> >  #define AD5933_REG_TEMP_DATA         0x92    /* R, 2 bytes*/
> >  #define AD5933_REG_REAL_DATA         0x94    /* R, 2 bytes*/
> > @@ -71,6 +71,8 @@
> >  #define AD5933_INT_OSC_FREQ_Hz               16776000
> >  #define AD5933_MAX_OUTPUT_FREQ_Hz    100000
> >  #define AD5933_MAX_RETRIES           100
> > +#define AD5933_MAX_FREQ_POINTS               511
> > +#define AD5933_MAX_SETTLING_CYCLES   2044 /* 511 * 4 */
>
> >
> >  #define AD5933_OUT_RANGE             1
> >  #define AD5933_OUT_RANGE_AVAIL               2
> > @@ -82,6 +84,10 @@
> >  #define AD5933_POLL_TIME_ms          10
> >  #define AD5933_INIT_EXCITATION_TIME_ms       100
> >
> > +/* Settling cycles multiplier bits D10, D9 */
> > +#define AD5933_SETTLE_MUL_2X         BIT(9)
> > +#define AD5933_SETTLE_MUL_4X         (BIT(9) | BIT(10))
>
> That looks like  a number, not a pair of separate bits.
> I would expect a mask for this field then some defines for teh
> values it can take.
Got it. Defined the mask and then the values. Change added to v2.
>
> > +
> >  struct ad5933_state {
> >       struct i2c_client               *client;
> >       struct clk                      *mclk;
> > @@ -411,14 +417,15 @@ static ssize_t ad5933_store(struct device *dev,
> >               ret =3D ad5933_cmd(st, 0);
> >               break;
> >       case AD5933_OUT_SETTLING_CYCLES:
> > -             val =3D clamp(val, (u16)0, (u16)0x7FF);
> > +             val =3D clamp(val, (u16)0, (u16)AD5933_MAX_SETTLING_CYCLE=
S);
> >               st->settling_cycles =3D val;
> >
> > -             /* 2x, 4x handling, see datasheet */
> > +             /* Encode value for register: D10..D0 */
> > +             /* Datasheet Table 13: If cycles > 1022 -> val/4, set bit=
s D10=3D1, D9=3D1 */
> >               if (val > 1022)
> > -                     val =3D (val >> 2) | (3 << 9);
> > -             else if (val > 511)
> > -                     val =3D (val >> 1) | BIT(9);
> > +                     val =3D (val >> 2) | AD5933_SETTLE_MUL_4X;
> > +             else if (val > 511) /* Datasheet: If cycles > 511 -> val/=
2, set bit D9=3D1 */
> > +                     val =3D (val >> 1) | AD5933_SETTLE_MUL_2X;
> >
> >               dat =3D cpu_to_be16(val);
> >               ret =3D ad5933_i2c_write(st->client,
> > @@ -426,7 +433,7 @@ static ssize_t ad5933_store(struct device *dev,
> >                                      2, (u8 *)&dat);
> >               break;
> >       case AD5933_FREQ_POINTS:
> > -             val =3D clamp(val, (u16)0, (u16)511);
> > +             val =3D clamp(val, (u16)0, (u16)AD5933_MAX_FREQ_POINTS);
> >               st->freq_points =3D val;
> >
> >               dat =3D cpu_to_be16(val);
>
