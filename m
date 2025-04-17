Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDB215A8
	for <linux-staging@lists.linux.dev>; Thu, 17 Apr 2025 14:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744898538; cv=none; b=ljFDfrPXNShaUnrnV/SzWitIna9FZ5tIbyfHdWakak3uZFt7HLkoChx2kvVH/xbcidzrqaM3UXKq0VEZWuACIU1Mdij49IJG0TekWFWJCVDwFRqV5wTHkLjx5z1g/geKQoHFGGMRc6aZk10z0OokwEd1JtVpjtQqJPsgCBQcpsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744898538; c=relaxed/simple;
	bh=DTOqT1+PTZJBISr8HA/bmXH4lG1FGpYPyWAzwLPEWEw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WzClCqgq5zbsj9ri0+Z11r4kb+eaBqg8BaOCHMW3Jpn6tyjC8sgyz5Ms0+g7+6k3En7MSV4buNhUEmYHChJ3vkJ0NsUIlNmpj5vRlz4OUUjWMiZdmFbK+c9zSBIVFL7bCDdOyXzBn/Mj7gfg7hZUg4ALG2ydOJ4+U1Z8nPb+c2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZrUm3Vh9; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZrUm3Vh9"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso5744965e9.0
        for <linux-staging@lists.linux.dev>; Thu, 17 Apr 2025 07:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744898535; x=1745503335; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=A5M+PaEx9mKM/jp1AQJiBtjhvl/i2iXkXqHvC6WDNvQ=;
        b=ZrUm3Vh9lNH/efhbcSgp3kBrYvjIXDr9EaTiQkwNIoMx82UdrilS3SGENai8NKQmxK
         rKrhVcCZgFsDI7DAdbGLS3/X49Fu6O19UNWk3OiNwXJ5Iz0BTktMjQ5GtGwKckvXCopi
         zmVKI6x3ydQ7d/OsqjHUoRVXqxvEcLazoIB+oRG6wEdgfwDZnrB2DmuCGRVzrDq/Hzhq
         L6C8vXiLxFcgp76ewx8YxFaHuFetrB5hVIXuZD5E98ZtTZoL1Eb73InSuE6kOwSmThu/
         tThPx3uCxH7tEXSNYS3HtCfooaKsX13ECdshYDxWAdYUWYolxh+MJ6r1hu87tCqWPsSD
         M+Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744898535; x=1745503335;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A5M+PaEx9mKM/jp1AQJiBtjhvl/i2iXkXqHvC6WDNvQ=;
        b=ABmQ2gCJuljArD9EtLYl9Uh2BeqZIIZRV93tM+ENcInZOo/zS09pwhxdkHZZtpY1z9
         wMvDUlYOOHZDWlj+XWGDUaaxelDULctoy3IBV5xkxZUGsivUW5i19MC9J1G4P+bDugQP
         wSRoSUX0O02/x9IuNgWvCTaKqQEMLeVuot75QRZyMTNijpwKpXZoYRpNG4QhwErAQ1X6
         pFcFwQKQ9um7tdumK/aRA52MdlfYWzkofyhmXJ/qtvPahrss1es4MsCWng8azF0Km8Ux
         c7rBpKbRFxqyt6/huGlRMUpTBRGfP6AN0pYCafAQC+kW9eP+8Ntpn3cvHWaREJO6+dXt
         yEIA==
X-Forwarded-Encrypted: i=1; AJvYcCU15pcrJPEg5B0SjOaPwkfFGZp/aE3HDFZyj4n7laWwhl1GjJ8v2ISX/c3GyEA7L5CaZRgjAI4RpK6HULcj@lists.linux.dev
X-Gm-Message-State: AOJu0YyJRNswjXQk0xEh1kLJVhCcD/WUg419Zlu4NuY0mRlVzMixiXTb
	jLIuDY4Qv/TpqLUibeYgS6fUE9rI6V/biK1FAAGaulgfNoPmBHTO
X-Gm-Gg: ASbGncuHAJxQIeIkB5DhagwJai62ElNsw2thTONviB1VCs1MtPf7EkW8Nq7M06y+Ufk
	E5fPB4cK5car8RP3a6PUXiRttpu9nP9YDve5EEX5dVrepxdyZnd3yW5qZH8a3XAlOcMiW+h37By
	rg/BDSuuCNIavIcoGDE6iZFjMzOEDnhgXHTT3lrCvvH8L9GdlVkqARITTd5CYt2vra5H+9tBOsq
	8H8zlVbirv7qjl3Q5qrqyBgpwXp1htvbWBcOOaCTl3yzr0V3T8L+L5HIvaz9Du0vM0/5VhU+5Cz
	SeI10aPbn8YsKldO+RaCO5A/dpk/m4Do58h8eegZlThw+zwW1RPVXjip1vlveOZvXMqoLwmnDzo
	+Tuu8yZOqJVsu
X-Google-Smtp-Source: AGHT+IHqGFAC+bEXnpOU0lSmklsH2ZD4OjyvRqUVn11XS9rxZL/VuFPFv7nsOuSyizmkj3sssiGxvg==
X-Received: by 2002:a05:600c:3b88:b0:439:8e95:796a with SMTP id 5b1f17b1804b1-440636a4008mr22042115e9.13.1744898534473;
        Thu, 17 Apr 2025 07:02:14 -0700 (PDT)
Received: from ?IPv6:2001:818:ea8e:7f00:2575:914:eedd:620e? ([2001:818:ea8e:7f00:2575:914:eedd:620e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b5abc3fsm55849605e9.37.2025.04.17.07.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 07:02:14 -0700 (PDT)
Message-ID: <e8b24cf22c87e5b5ce0cc8919eca79f6e60ab6e3.camel@gmail.com>
Subject: Re: [PATCH] iio: adc: Revoke valid channel for error path
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Cc: gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, Michael.Hennerich@analog.com, 
	sonic.zhang@analog.com, vapier@gentoo.org, skhan@linuxfoundation.org, 
	kernelmentees@lists.linuxfoundation.org, stable@vger.kernel.org
Date: Thu, 17 Apr 2025 15:02:16 +0100
In-Reply-To: <CAKUZ0zL88AyuRxzhoAv2iZO7N7qOMy1G3yKscqG3rQiiOS0gog@mail.gmail.com>
References: <20250415182038.523186-1-gshahrouzi@gmail.com>
	 <fb712c034eda0d5d711a90a00b6382315fb5f929.camel@gmail.com>
	 <CAKUZ0zL88AyuRxzhoAv2iZO7N7qOMy1G3yKscqG3rQiiOS0gog@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Thu, 2025-04-17 at 08:53 -0400, Gabriel Shahrouzi wrote:
> On Thu, Apr 17, 2025 at 6:06=E2=80=AFAM Nuno S=C3=A1 <noname.nuno@gmail.c=
om> wrote:
> >=20
> > On Tue, 2025-04-15 at 14:20 -0400, Gabriel Shahrouzi wrote:
> > > According to the datasheet on page 9 under the channel selection tabl=
e,
> > > all devices (AD7816/7/8) are able to use the channel marked as 7. Thi=
s
> > > channel is used for diagnostic purposes by routing the internal 1.23V
> > > bandgap source through the MUX to the input of the ADC.
> > >=20
> > > Replace checking for string equality with checking for the same chip =
ID
> > > to reduce time complexity.
> > >=20
> > > Group invalid channels for all devices together because they are
> > > processed the same way.
> > >=20
> > > Fixes: 7924425db04a ("staging: iio: adc: new driver for AD7816 device=
s")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> > > ---
> > > =C2=A0drivers/staging/iio/adc/ad7816.c | 15 +++++----------
> > > =C2=A01 file changed, 5 insertions(+), 10 deletions(-)
> > >=20
> > > diff --git a/drivers/staging/iio/adc/ad7816.c
> > > b/drivers/staging/iio/adc/ad7816.c
> > > index 6c14d7bcdd675..d880fe0257697 100644
> > > --- a/drivers/staging/iio/adc/ad7816.c
> > > +++ b/drivers/staging/iio/adc/ad7816.c
> > > @@ -186,17 +186,12 @@ static ssize_t ad7816_store_channel(struct devi=
ce
> > > *dev,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 return ret;
> > >=20
> > > -=C2=A0=C2=A0=C2=A0=C2=A0 if (data > AD7816_CS_MAX && data !=3D AD781=
6_CS_MASK) {
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 dev_err(&chip->spi_dev->dev, "Invalid channel id %lu for
> > > %s.\n",
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data, indio_dev->nam=
e);
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 return -EINVAL;
> > > -=C2=A0=C2=A0=C2=A0=C2=A0 } else if (strcmp(indio_dev->name, "ad7818"=
) =3D=3D 0 && data > 1) {
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 dev_err(&chip->spi_dev->dev,
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Invalid channel id =
%lu for ad7818.\n", data);
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 return -EINVAL;
> > > -=C2=A0=C2=A0=C2=A0=C2=A0 } else if (strcmp(indio_dev->name, "ad7816"=
) =3D=3D 0 && data > 0) {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 if (data !=3D AD7816_CS_MASK &&
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (data > AD7816_CS_M=
AX ||
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (chip->id =3D=3D ID=
_AD7818 && data > 1) ||
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (chip->id =3D=3D ID=
_AD7816 && data > 0))) {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 dev_err(&chip->spi_dev->dev,
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Invalid channel id =
%lu for ad7816.\n", data);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Invalid channel id =
%lu for %s.\n", data, indio_dev-
> > > > name);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 return -EINVAL;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >=20
> > Hmm, maybe I'm missing something but the code just looks the same as be=
fore
> > (from a functionality point of view)? I'm really not seeing any fix...
> I might have to change it for readability. From my understanding, if
> channel 7 is selected (AD7816_CS_MASK), it never enters the error path
> whereas in the old code, if the chip were either ad7816 or ad7818, it wou=
ld
> end up returning an error because it skips all channels above either 0
> or 1.

Ahh, right!

One good refactor is to add a chip_info struct (renaming the existing one) =
with
let's say a name and max_channels. Then, the condition could be reduced to:

if (data > st->chip->max_channel && data !=3D AD7816_CS_MASK {
	dev_err(...);
	return -EINVAL;
}

Being this in staging, I guess we don't care much about having the fix as t=
he
first patch to make it easier to backport.

- Nuno S=C3=A1

>=20
> >=20
> > Having said the above, not sure if grouping helps with readability. But=
 I do
> > agree with moving from string comparison to use chip->id. And we also h=
ave
> > redundants 'else'
> >=20
> > - Nuno S=C3=A1
> >=20
