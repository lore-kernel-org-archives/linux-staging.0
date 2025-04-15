Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD771D9A41
	for <linux-staging@lists.linux.dev>; Tue, 15 Apr 2025 13:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744725264; cv=none; b=jk1J0ijwOO4ujyGEQOQI8FOHJaL23WYofp9O1WPh1nDJPzPHuKgerKiZgUwUciQrwn9s6vkR9ZzQjo7ufrjET4RHMoRJ//4UWaBAN0/aGz/5D23MlIJew5Vb5pOrxpGp6v75zIf39L8EoxI+xXbobBTpr5AVafFA8VN/1yWMqQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744725264; c=relaxed/simple;
	bh=OrjfuIsLyMWBHpdPMqn3UuNzRJEMzPl4gvGx5zjyKQY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qygIf2V/0RNfV9qy7C5u7ZBmw7Kvgw0ncTGrqb7AYDcOxdlYd7qUWZEpsnS2sEthc6b0N2BjXO81/OHY6fYzK5z7EsPyVAoqqIkp7EviR0uDpkHBBOq9U0ZqooePfXP+GwTgkVt/s5op/ctSePOUQnsOCoX9nPAEbohpVWKVbjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AOv5Iu9l; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AOv5Iu9l"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4769aef457bso56865451cf.2
        for <linux-staging@lists.linux.dev>; Tue, 15 Apr 2025 06:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744725262; x=1745330062; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8u/AmDRTyguVPS15vuo1k2JAoSJfdZVWVLXGNvKqIt0=;
        b=AOv5Iu9lUUScwMMt7mcjvueD9f3dZeLgTSyWrxdfnG0MM27GNhd/iyP0os6SxR+FxT
         9V/ENkauwsxCdMzyKuBCbr+zczHNEU7blJXbvPTEb/Y+cHRuHz9PO2OsREymS1CNBHZX
         VYPL9rsKS0QKePXzDwtPEwzCUFp5FnXXg1ImgVN8QZyTAM293VQbrXU9Heoxbf8tu0gO
         +nZgKWJYXxM1pov8eIQvPPe1M+pSvFmKmWb2MdTIFMRPNXwi006FhvfpWT+JYGLBStYR
         lcy738KKrFuQ56mgVVF4IR6BVweGENMMRA6IAUbuV/X7Pw9TG5jw618O0noOPRfb0c8w
         7qOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744725262; x=1745330062;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8u/AmDRTyguVPS15vuo1k2JAoSJfdZVWVLXGNvKqIt0=;
        b=LmQFbJesz+YfZIa6bGlp4Ep6xOxmeFT1Huk+MZHIynGzlO2N8lS0iK4m3yeQohZbZD
         hq+0XYrNJWMbInv0/45Dv8zNZXptBNnr5BSErQYts2NI1i+dytXqcxAfX0wLrCUFGCxS
         DpMSMrbwDFWqP+f7r+M1Vekfu5xeTMvL0wVWmIb1VC4yjaY3rljSSxi6HdeHGbWfuxSD
         ZhPIux0fX0ELkhSzk2I+Thh2CN1Mc8Aw+QyB6lOlrQ9E4yj7Mj6K3jjw15Fs2Mi18XV+
         AQc6UIhlIT7DVeYH67ofR9tEV3ivg8JYYfGrprJ/GZfDApHGxloyUPC46AFAlBgSoZGN
         r4qA==
X-Forwarded-Encrypted: i=1; AJvYcCUIi86AbjcigzdkWXU6Va9AYhcD8i8StMEoI2FDHwsV1GR8uqc3uw0/lh8Xl/gNO4i+czFF1Y3gUbLDr2Il@lists.linux.dev
X-Gm-Message-State: AOJu0YwkNYEQkJ1/Bv+k2sGvCR+Ob571FzWDq4c2/fbY8vzr1x8815cG
	srUoh4+Ov1oVQiq2bGVzWVZVTi8Wv1gTO94Epr1tzc8a/vuR/cTiapAYwko6APknCAI5HZVj8Bj
	f8mS+qEBGGOeAnfLAhg3PKD40BV0=
X-Gm-Gg: ASbGncuJ7MqlDddVU/FLgvKfpowT/k30krsYsxnyQyRS4hPHfCyQg2KA9Orpf1kLbDr
	SpV6XEoysUW+5VUFRziBpmawBRyidn1HLzsMERfw/FIeMNAdOg9HBnp/1tn12Zqh9AAWtJk63VH
	srJti5ozMIvbn2asrYw10EF30H6yaS/AmMfrl73u3RCENutackwDtkfdEso0KWgtE=
X-Google-Smtp-Source: AGHT+IFncftquQsvM6bfh/Y2dgpRTHBlyTEX3Cse3b1bJHNcdPkrggiROQdsJEycAmbcnvsivaFxwRd0WVtvqZwZ3eU=
X-Received: by 2002:ac8:5ac3:0:b0:478:e507:f6ec with SMTP id
 d75a77b69052e-47977562f45mr289779871cf.23.1744725261700; Tue, 15 Apr 2025
 06:54:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250414154050.469482-1-gshahrouzi@gmail.com> <1fb5f1c5e61ce386cb431d48296e952bdd560a6c.camel@gmail.com>
In-Reply-To: <1fb5f1c5e61ce386cb431d48296e952bdd560a6c.camel@gmail.com>
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Date: Tue, 15 Apr 2025 09:54:00 -0400
X-Gm-Features: ATxdqUHDElwhcKQXFR5mLMfMHxqVt-H7NGE6w7tSv_4jShaz4NFmHUQo7t9FlX4
Message-ID: <CAKUZ0zLiP_w-4xOXfBDdZbm+M8yVYvd+A=M73fnRT_kMyWwk7Q@mail.gmail.com>
Subject: Re: [PATCH v3] iio: adc: Correct conditional logic for store mode
To: =?UTF-8?B?TnVubyBTw6E=?= <noname.nuno@gmail.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-iio@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org, kernelmentees@lists.linuxfoundation.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 5:13=E2=80=AFAM Nuno S=C3=A1 <noname.nuno@gmail.com=
> wrote:
>
> On Mon, 2025-04-14 at 11:40 -0400, Gabriel Shahrouzi wrote:
> > The mode setting logic in ad7816_store_mode was reversed due to
> > incorrect handling of the strcmp return value. strcmp returns 0 on
> > match, so the `if (strcmp(buf, "full"))` block executed when the
> > input was not "full".
> >
> > This resulted in "full" setting the mode to AD7816_PD (power-down) and
> > other inputs setting it to AD7816_FULL.
> >
> > Fix this by checking it against 0 to correctly check for "full" and
> > "power-down", mapping them to AD7816_FULL and AD7816_PD respectively.
> >
> > Fixes: 7924425db04a ("staging: iio: adc: new driver for AD7816 devices"=
)
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> > ---
>
> LGTM, do you happen to have this device? It would more interesting to mov=
e this
> driver out of staging :)
Unfortunately, I do not have this device. However, I would still be
interested in contributing if possible. I was looking over
https://lore.kernel.org/all/20230716144024.30ded663@jic23-huawei/T/
where the goal seemed to be to modernize it by replacing the sysfs
interface with the iio channel. I also looked through the datasheet
and it seemed to be missing some stuff like a channel that can be
selected.
>
> Acked-by: Nuno S=C3=A1 <nuno.sa@analog.com>
>
> > Changes since v3:
> >       - Tag stable@vger.kernel.org instead of an email CC
> >       - Use the correct version for patch
> > Changes since v2:
> >       - Add fixes tag that references commit that introduced the bug.
> >         - Replace sysfs_streq with strcmp.
> > ---
> >  drivers/staging/iio/adc/ad7816.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/staging/iio/adc/ad7816.c
> > b/drivers/staging/iio/adc/ad7816.c
> > index 6c14d7bcdd675..081b17f498638 100644
> > --- a/drivers/staging/iio/adc/ad7816.c
> > +++ b/drivers/staging/iio/adc/ad7816.c
> > @@ -136,7 +136,7 @@ static ssize_t ad7816_store_mode(struct device *dev=
,
> >       struct iio_dev *indio_dev =3D dev_to_iio_dev(dev);
> >       struct ad7816_chip_info *chip =3D iio_priv(indio_dev);
> >
> > -     if (strcmp(buf, "full")) {
> > +     if (strcmp(buf, "full") =3D=3D 0) {
> >               gpiod_set_value(chip->rdwr_pin, 1);
> >               chip->mode =3D AD7816_FULL;
> >       } else {
