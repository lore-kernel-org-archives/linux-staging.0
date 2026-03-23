Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7B02C375E
	for <linux-staging@lists.linux.dev>; Mon, 23 Mar 2026 12:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774268559; cv=pass; b=YXv84CxB/LDFltNx3ZT12N6IQ4j7JdxuRlxeM/H0AXqnTtQrgm+Ft8be3B4hZ136G7dynf+xM9DkRlrAgbUUoMTAMAZe1DwrXeIMQr6dpBVPbFBg6eSedB+JsPxtWp67ORoFYtZj1+0YQH1C8mr0/X8KnxGoW5hyqdkhtEYgo2I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774268559; c=relaxed/simple;
	bh=5vEl7rEPdJTFVmLfF07NHC5wR9rgIR84jjWBbsemezk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uq/VFK6FJQ6lFdq5UzrOdWN56QExtPkdvWo8Y+Is/P1wFFhh7O+MftxIwkSiiLd8o6nXKYJ+/UGaNKqtGUNbMeaiPefLpxBk2zMLAkbRiEQHH+hyqrECHWvUCqKrrZYEjh3QudkQXTwXusg9oTC89CTK9XEUVf3jTLpEBd0B47w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mMEilbe0; arc=pass smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mMEilbe0"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-79a60975dc5so1112097b3.0
        for <linux-staging@lists.linux.dev>; Mon, 23 Mar 2026 05:22:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774268557; cv=none;
        d=google.com; s=arc-20240605;
        b=bYDgoNPbp4t8iX+kkk3obx9nZNySCsKolmT2fQQjpXF2agVjqbwVXnsrxD9Fp8mrPI
         4EcfWvjpVHE/dFFbePwQXQ0UqnxRne91zpES9URqWpQeBeSaZI4+Mk2OLdA/IKe2cyNP
         WlED6wlXEUcM4u2AoPXqfq0eO2Dbaic1aF6GzF5qmkgI4VhYcgb94nvTCJgYhm/rTSnq
         oHbPWBXT93YzhNwSIS0hUdcPh2MlzoSouXu6i8PZCAPxBxEbWAqraS3be0mt9ZlAe32I
         DWDJyqOU6ugkTKe/oxaRzMGWNh2HqYVnWJlivpQvUR9Xhnyz5FVqLQiDodHRh6imzJqV
         /+Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I87yG6R3rMiJQKakv77MaKgjNhD1r5kVSJz2kpVoVvA=;
        fh=4MO2u2G0JmODcnePeLeGpwS7brxrK9jz+TEFHXWU8k4=;
        b=kE31G/lu3hVAt7ubLMUptwKosDsFnsZybip/7KQXtLsfDWxL7STaXyy0rD1HJIrPG/
         k1QBHqfFJ8WSD/t316kj91GogcPMdo5m0TXfZsuRp/0wy/Wy5uAuzl1kMYlE4Fz/vtFp
         cE959mGQ7fNfMmuP7tUwfNnH0ttJpVElOdyT+l0P7Ipcy7qrs3U9bW7FR9i2a4BuvMDU
         y1mOovDIFVmGcRaEY2MyXT8fgpZEd5QRTtlhp7oh9abrDk8C+83pkXx6Pwwz46G9Yy+2
         UtkZjdM/lsNGLQhJowzXqaDV4eK+FuIhfp5kY/WY7lkdZeIpurNycQJr1GXKCVgpFacZ
         5+yA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774268557; x=1774873357; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I87yG6R3rMiJQKakv77MaKgjNhD1r5kVSJz2kpVoVvA=;
        b=mMEilbe07QSxtDsdKHTyvwkaqbXB9sErpytK4LG1hcnI80fWMsyxqdohGHdDdBgEy2
         eK50c8QaWzFA4rJEph+7zoXZy2jm3fRP488F9nTtPeW7LOhrhMup7hSNRkH3QcHFpsjf
         rCdcDsX8Yi5vJ7i2MLT/lJts6Zb0JokEi7Y+8bEjlckBbf6gP+8lubOKl+kMN395KP+9
         fJwjpTdA/pPPUUHGg1Bm2bc8+yJbsGKy2l+ZbVAcvZ7Q+4gKZBl/UQn8TmZ/OcUp2dOd
         klFgxp8UiJ8DFROflHh9QU84/uMJ4hePOlLNT/QqwU1cmnwpifSwEihzYnXXUMu5nDZU
         w7Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774268557; x=1774873357;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I87yG6R3rMiJQKakv77MaKgjNhD1r5kVSJz2kpVoVvA=;
        b=NpD+EQffWmYtMZb8P8Lv7BQXlU3EnfwfeCpka8COcVtfU+VESJHZUDFv6mPQPVLmLA
         Ehb+/laKn+72YO2iDQxtk0GTye4gXfck35m1sTpwuhtkz0Ws6gOG+IpUWNWgsrWS53jQ
         cKHJC+2N5KtilUdaR6+OSViUmeDucZxx7Vs5kVjuoQMHe736VfgLlbwzJ1oUQ+VpjaD4
         8+07SItPPt3J4DLmdTZ674kg4Yx7/UNQfX2Besvw6/jPjF2zFeLRKgLUXSAChCzvUP3k
         JqZoyXJYrBVEHAL3VxF9wkAzLjTj78WUXODfH4jKj7DewL16BSozv0x2D+uAeGBbPWxI
         ZirQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5Ln6yrC7LBSLghHkpLIYARPwWlqWwHWYp2YXlDePmCDCEbeydC2xfvwJBdlZWdrtMZ7leHgoJJR/Q/vaZ@lists.linux.dev
X-Gm-Message-State: AOJu0YzC6SuOMFkD03NQIfWr557Xb3NOZ0gqB2WlRbTWl/Ob1Iw7OV4S
	a8cFDH8octLBqBYoIx3uti3INjCXbuJhMRAFK2iRNiiKLdc4oAsVqR5OQkXh44tgs0gh8C9eJQa
	xldZDYzyXScnCHXmqEVMmnpIrGVDUIMY=
X-Gm-Gg: ATEYQzyjgx0Uki4ShvkxQ0iAsFiBq4LCJ9uQ/SmKvOBU2wC5UIGMOYxPvDh72QCTDC+
	Cshv257yzj6ApabeAOl5RUw2n/1sTpaJbB7qvtlmugRcd7cb/PV48fxMrz5a4dNZ7z5JwnbWrj4
	VUiFvzDir5G9qDlpclltQxh8QI6vpBRi2MiwZE4pP5glWHGIuoNi97AMm8IAm29WXPc/OfMiYTo
	xKIQ6W4lRUgl2ph/up/yoAWLsOfyHm8ISQq28dvyy++3Bg9MAVpSHq/3YxWKFa5++k+8qOldZJl
	/elCIqcQtA9Ips0liS3LNhK0LCoXzL7ILYiQBbJR/49Ip8ggdGQdyrrL2ZTpeJ4rVbtIOJplZg=
	=
X-Received: by 2002:a05:690c:48c1:b0:79a:3edf:a049 with SMTP id
 00721157ae682-79a90aeb03dmr123603607b3.24.1774268557032; Mon, 23 Mar 2026
 05:22:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260318092715.42538-1-architanant5@gmail.com>
 <20260318092715.42538-4-architanant5@gmail.com> <20260321182710.1621d1aa@jic23-huawei>
In-Reply-To: <20260321182710.1621d1aa@jic23-huawei>
From: Archit Anant <architanant5@gmail.com>
Date: Mon, 23 Mar 2026 17:52:25 +0530
X-Gm-Features: AaiRm51Rot4baxif9O-Ehoe91d1_ioEF6O3LhNGXIxm4TboBtdFdoMeAHUSo0ns
Message-ID: <CADJHxWADo9rA8vt6EEVLXSBb9EqXvyBg=L_YmusaMdtRnOr0rQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] iio: adc: ad799x: cache regulator voltages during probe
To: Jonathan Cameron <jic23@kernel.org>
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, dlechner@baylibre.com, 
	nuno.sa@analog.com, andy@kernel.org, linux-iio@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 21, 2026 at 11:57=E2=80=AFPM Jonathan Cameron <jic23@kernel.org=
> wrote:
>
> On Wed, 18 Mar 2026 14:57:14 +0530
> Archit Anant <architanant5@gmail.com> wrote:
>
> > Reading the regulator voltage via regulator_get_voltage() can be a slow
> > operation.
>
> Whilst that might be true, it isn't a reason for this change.
> Sysfs reads that would cause it to be read are never a particularly
> fast path anyway. So drop this first sentence.
>
> > Since the reference voltages for this ADC are not expected to
> > change at runtime, it is inefficient to query the regulator API every
> > time userspace reads the IIO_CHAN_INFO_SCALE attribute.
> >
> > Determine the active reference voltage (either VREF or VCC) during
> > probe() and cache it in the state structure. This improves the
> > performance of ad799x_read_raw() and removes the dependency on the
> > regulator pointers during fast-path reads.
> >
> > Suggested-by: Jonathan Cameron <jic23@kernel.org>
> > Suggested-by: David Lechner <dlechner@baylibre.com>
> > Signed-off-by: Archit Anant <architanant5@gmail.com>
>
> A suggested alternative approach inline.
>
> Thanks,
>
> Jonathan
>
> > ---
> >  drivers/iio/adc/ad799x.c | 24 ++++++++++++++++--------
> >  1 file changed, 16 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/iio/adc/ad799x.c b/drivers/iio/adc/ad799x.c
> > index 7504bcf627da..ae2ad4bd37cc 100644
> > --- a/drivers/iio/adc/ad799x.c
> > +++ b/drivers/iio/adc/ad799x.c
> > @@ -30,6 +30,7 @@
> >  #include <linux/module.h>
> >  #include <linux/mutex.h>
> >  #include <linux/bitops.h>
> > +#include <linux/units.h>
> >
> >  #include <linux/iio/iio.h>
> >  #include <linux/iio/sysfs.h>
> > @@ -135,6 +136,9 @@ struct ad799x_state {
> >       u16                             config;
> >
> >       unsigned int                    transfer_size;
> > +
> > +     int                             vref_uV;
> > +
> >       IIO_DECLARE_BUFFER_WITH_TS(__be16, rx_buf, AD799X_MAX_CHANNELS);
> >  };
> >
> > @@ -302,14 +306,7 @@ static int ad799x_read_raw(struct iio_dev *indio_d=
ev,
> >                       GENMASK(chan->scan_type.realbits - 1, 0);
> >               return IIO_VAL_INT;
> >       case IIO_CHAN_INFO_SCALE:
> > -             if (st->vref)
> > -                     ret =3D regulator_get_voltage(st->vref);
> > -             else
> > -                     ret =3D regulator_get_voltage(st->reg);
> > -
> > -             if (ret < 0)
> > -                     return ret;
> > -             *val =3D ret / 1000;
> > +             *val =3D st->vref_uV / MILLI;
> >               *val2 =3D chan->scan_type.realbits;
> >               return IIO_VAL_FRACTIONAL_LOG2;
> >       }
> > @@ -828,9 +825,20 @@ static int ad799x_probe(struct i2c_client *client)
> >                       ret =3D regulator_enable(st->vref);
> >                       if (ret)
> >                               goto error_disable_reg;
> > +                     ret =3D regulator_get_voltage(st->vref);
>
> For vref I don't think we need to keep the regulator around, so you shoul=
d
> be able to use devm_regulator_get_enable_read_voltage() with checking
> for -ENODEV to identify it simply isn't there.
>
> It would need a tiny bit of reordering though or a custom
> devm_add_action_or_reset() registered callback to ensure that regulator
> disable for vcc happens in reverse sequence of what happens on setup.
>
> Anyone think there are actually ordering constraints on these regulators?
> Would be fairly unusual for this sort of device, but not impossible.
> If not, cleanest option might be;
...
> Then no need to undo anything by hand in remove() and no need to keep
> a pointer to any regulators around for later.

I completely agree that devm_regulator_get_enable_read_voltage() is
the cleanest approach.

However, as I noted briefly in the v5 changelog (which I should have
highlighted better), the driver currently relies on those regulator
pointers (st->reg and st->vref) in the ad799x_suspend() and
ad799x_resume() callbacks.

If we drop the pointers from the state structure, we lose the ability
to disable the regulators during system sleep.

If keeping power management active during suspend is still desired for
this driver, I believe we are forced to keep the pointers and use the
devm_add_action_or_reset() pattern.

If you prefer, I can drop the manual regulator control from the PM
callbacks entirely (or drop the PM callbacks altogether), which would
allow us to use the cleaner devm_regulator_get_enable_read_voltage()
helper.

Let me know which path you prefer for v6!

--=20
Sincerely,
Archit Anant
