Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBE7374725
	for <linux-staging@lists.linux.dev>; Fri, 10 Jul 2026 17:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783705991; cv=none; b=tekZzpo9WfiuvagPJKAw3LDZmvrXWuuJVr2jh2HNPIDEUmGGJyhiHyJczJjCVVbDtEsgo3p0FdazLTPhIMNnwNJmNfC5CWaPcRvVe066zZlVWvZZ3WtPopTXBQzYCgcRn7+DGiDvW9ou//jXD66MC2h1/5OMgNtuynoXWeSmiOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783705991; c=relaxed/simple;
	bh=OZapa3bgIo8yc+weY233lrRX3z7qkV8mFNDkYIfQ7Sw=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:In-Reply-To:
	 Subject:References; b=eBQsuznTyNWd0+EiVhCN+bEVdoQkglzSDl+MnM+wx+Pij05pjiPkZOOx3YSUBuDlQ76ev9Zg5XN/bfi8svHlYdy4++LlX3fk2vAAfsEgm7RfO/aYhQzBhYd1zBl/G9GKgzsBtHS7SEKFz/4kaW86Z5elp4seDIJWxnWE5sKW3nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F6czLgtO; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F6czLgtO"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7eb34c17b96so817916a34.2
        for <linux-staging@lists.linux.dev>; Fri, 10 Jul 2026 10:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783705988; x=1784310788; darn=lists.linux.dev;
        h=references:subject:in-reply-to:cc:to:from:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TfF2+32yHkCY9OgSDVX9M5VHYIrR7dh1QXXljKX3DLU=;
        b=F6czLgtOzO7jlleds0o64Vxjp4McjMuQkuH57Om+6zkR5Y0d8qf0RX+CvYHvyedVcF
         YUq2j9HpWLU8DsISmMR6MH5apNiS7aqY9uI06OJChLBLLsMfZzVPKX/skE80UHZmvPW7
         ITkMPzpJfkwOj6Kh9OKC292pgU1lpaoBIy5ZEAJQhltzC3AaUJPA3JMr88pxeLKhqiNJ
         RL/7VDAcTCdCEiO7srognjIU0WKs+E/DlEomLR0paovePVdlKfiRaH8FhQN9j6gdX+of
         Xg+iBRT4MITmxC+kIWUCdeKsMYgYLAIeOs1LhiKzTgWRj/vf2G359bVQG6hehBc2lUgh
         hyQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783705988; x=1784310788;
        h=references:subject:in-reply-to:cc:to:from:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TfF2+32yHkCY9OgSDVX9M5VHYIrR7dh1QXXljKX3DLU=;
        b=PhQMnXxscEkLV4QlkC8Gs1/IhqccPKk4k6a4IL1fXGkYzusZuCNof5cIbnydUKPFMD
         f5fCIrrnTcGArhT4rBI1DFUOdpx0Qw7YTq94GZpRcUR08FJ3CznUPURuaQR5j6oRtTra
         URV/5CaiDiN/4HuIw6pwIz6O83g4F43jy6uSH97p85AyNlMPm0LqJyfEuGS66c1ehBzG
         Kd28pKg8fzRswKB78qbHnJHZC0rHqhZjb8Ht6VMXNb6RCBVsqNJrAdc046FCqD5s+7jN
         TEOvzNJjjzW0WmEDDNEmfRPAfwB+i0qTjZCiWCQkOGfvuYrXb2hUawD+2aERnQQt5OZK
         CEkA==
X-Forwarded-Encrypted: i=1; AFNElJ98eGmrv7YVmPns3CyVcdz/g6pzVLigmI/QG7rM6JQEGlFZtj8Hoa8/q8Gi7RvMazj77MsKNTgYcn1nOybM@lists.linux.dev
X-Gm-Message-State: AOJu0YyltCQJzk5shxKJjV7VlSIMrbo+q5/+OLx3GSKpNEIjfgJZvo//
	BTSvCm92tMG1fONc+jewMygTLtCLDEutaA+AYc7JCiufAWw1zKJPlvm4
X-Gm-Gg: AfdE7ck1DabtqtTpkH37PGFFL951+0v2zawF6tBpyiwCeYtz0CESAAGI0x9S4W9zMBl
	rZj+Kl34he0FYy19lSBRW5Qoc8r5Bd8wIl9O9U5RzjwUVMcrz7+n945xQvsoLhZrTtfJMjbA11A
	zKiHGj9oS9dWbvVxfm2g6xDoyXazsFs/psSAWWrLtebUh8xbhFasuAtQNpy2j7EYIM0jJs/IF3T
	03yXFGNnKwwk8AWeIleVyfOEHW4OZWOox5An+Y8YJBLJwBpxCkVOiMjijOem2Udsm/JKG69aE3K
	i5W14CSB84XVf9zPUMimtBOTGdWQz95iOkBgCI+Fgs9G1INpbzQf03reGSa0ZJg6eBBnaXYRewU
	LEjupZLlfK+WcHthIFQDnnRXhGm6yvEkIETX5H3TRkLNFkT/h/yookE3787ilsymr8kllwgp4BZ
	Y7ZTACi95Sbq2fH0MbQzVMEi5ZxiFWNqEOgHfJmQ0=
X-Received: by 2002:a05:6830:6015:b0:7e9:c4ce:f7e5 with SMTP id 46e09a7af769-7ebd00ef930mr9343510a34.23.1783705986703;
        Fri, 10 Jul 2026 10:53:06 -0700 (PDT)
Received: from localhost (23-88-128-2.fttp.usinternet.com. [23.88.128.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcb2bae7fsm7514885a34.21.2026.07.10.10.53.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 10:53:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=bf94d117aab954e431a08de8ad5ad467a2313772f0af2049462f558603cc;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 10 Jul 2026 12:53:01 -0500
Message-Id: <DJV2ZZKDGQHF.1S79N3553DJ0C@gmail.com>
From: "Maxwell Doose" <m32285159@gmail.com>
To: "Taha Narimani" <tahanarimani3443@gmail.com>, <jic23@kernel.org>,
 <lars@metafoo.de>, <Michael.Hennerich@analog.com>,
 <gregkh@linuxfoundation.org>
Cc: <dlechner@baylibre.com>, <nuno.sa@analog.com>, <andy@kernel.org>,
 <linux-iio@vger.kernel.org>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
In-Reply-To: <20260710160001.29856-2-tahanarimani3443@gmail.com>
Subject: Re: [PATCH v3] staging: iio: adc: ad7816: Use
 devm_gpiod_get_optional() for busy GPIO
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260710160001.29856-1-tahanarimani3443@gmail.com>
 <20260710160001.29856-2-tahanarimani3443@gmail.com>

--bf94d117aab954e431a08de8ad5ad467a2313772f0af2049462f558603cc
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Taha,

On Fri Jul 10, 2026 at 11:00 AM CDT
Taha Narimani <tahanarimani3443@gmail.com> wrote:

> The driver currently utilizes devm_gpiod_get() for the 'busy' line,
> which makes the GPIO mandatory. However, the busy pin is hardware-optiona=
l
> depending on the specific board configuration.
>
> Switch to devm_gpiod_get_optional() to allow boards that do not have
> this pin wired up to still probe the driver successfully. Clean up
> the redundant busy_pin conditional checks as gpiod_get_value() safely
> handles NULL descriptors. Additionally, use dev_err_probe() to prevent
> bootlog spamming during deferred probing.
>
> Fixes: 3e5971b2ddb6 ("base: original ad7816.c")

If this is a fix, then why are we making style changes?

> Signed-off-by: Taha Narimani <tahanarimani3443@gmail.com>
> ---
> Changes in v3:
>   - Removed redundant conditional check around gpiod_get_value() as sugge=
sted by Andy Shevchenko and Dan Carpenter.
>   - Switched to dev_err_probe() to avoid deferred probe spamming.
>   - Introduced local struct device *dev pointer in probe and kept the GPI=
O request on a single line for better readability.

Unless someone requested this during review this doesn't make sense.
Please see my above comment, and I'd also suggest to take a look at
Documentation/process/submitting-patches.rst.

>   - Added the missing Fixes tag requested by Jonathan Cameron.
>
>  drivers/staging/iio/adc/ad7816.c | 67 +++++++++++++-------------------
>  1 file changed, 28 insertions(+), 39 deletions(-)
>
> diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/a=
d7816.c
> index 988eee3..807cf57 100644
> --- a/drivers/staging/iio/adc/ad7816.c
> Changes in v3:
>   - Removed redundant conditional check around gpiod_get_value() as sugge=
sted by Andy Shevchenko and Dan Carpenter.
>   - Switched to dev_err_probe() to avoid deferred probe spamming.
>   - Introduced local struct device *dev pointer in probe and kept the GPI=
O request on a single line for better readability.
>   - Added the missing Fixes tag requested by Jonathan Cameron.
>

Wrong spot for this + causes the patch to not apply. It should be below
the --- right after the list of tags.

> +++ b/drivers/staging/iio/adc/ad7816.c
> @@ -22,20 +22,20 @@
>  /*
>   * AD7816 config masks
>   */
> -#define AD7816_FULL			0x1
> -#define AD7816_PD			0x2
> -#define AD7816_CS_MASK			0x7
> -#define AD7816_CS_MAX			0x4
> +#define AD7816_FULL                     0x1
> +#define AD7816_PD                       0x2
> +#define AD7816_CS_MASK                  0x7
> +#define AD7816_CS_MAX                   0x4
> =20

Nothing changed? Seems like a stray change.

>  /*
>   * AD7816 temperature masks
>   */
> -#define AD7816_VALUE_OFFSET		6
> -#define AD7816_BOUND_VALUE_BASE		0x8
> -#define AD7816_BOUND_VALUE_MIN		-95
> -#define AD7816_BOUND_VALUE_MAX		152
> -#define AD7816_TEMP_FLOAT_OFFSET	2
> -#define AD7816_TEMP_FLOAT_MASK		0x3
> +#define AD7816_VALUE_OFFSET             6
> +#define AD7816_BOUND_VALUE_BASE         0x8
> +#define AD7816_BOUND_VALUE_MIN          -95
> +#define AD7816_BOUND_VALUE_MAX          152
> +#define AD7816_TEMP_FLOAT_OFFSET        2
> +#define AD7816_TEMP_FLOAT_MASK          0x3
> =20

Ditto.

>  /*
>   * struct ad7816_chip_info - chip specific information
> @@ -48,7 +48,7 @@ struct ad7816_chip_info {
>  	struct gpio_desc *convert_pin;
>  	struct gpio_desc *busy_pin;
>  	u8  oti_data[AD7816_CS_MAX + 1];
> -	u8  channel_id;	/* 0 always be temperature */
> +	u8  channel_id; /* 0 always be temperature */
>  	u8  mode;
>  };
> =20

Here as well.

> @@ -84,10 +84,8 @@ static int ad7816_spi_read(struct ad7816_chip_info *ch=
ip, u16 *data)
>  		gpiod_set_value(chip->convert_pin, 1);
>  	}
> =20
> -if (chip->id =3D=3D ID_AD7816 || chip->id =3D=3D ID_AD7817) {
> -		while (gpiod_get_value(chip->busy_pin))
> -			cpu_relax();
> -	}
> +	while (gpiod_get_value(chip->busy_pin))
> +		cpu_relax();
>

Can you explain why we're removing this check? There also seems to be a
spot in _probe() where the check gets removed as well.

>  	gpiod_set_value(chip->rdwr_pin, 0);
>  	gpiod_set_value(chip->rdwr_pin, 1);
> @@ -254,8 +252,8 @@ static const struct attribute_group ad7816_attribute_=
group =3D {
>   * temperature bound events
>   */
> =20
> -#define IIO_EVENT_CODE_AD7816_OTI IIO_UNMOD_EVENT_CODE(IIO_TEMP,	\
> -						       0,		\
> +#define IIO_EVENT_CODE_AD7816_OTI IIO_UNMOD_EVENT_CODE(IIO_TEMP,        =
\
> +						       0,               \
>  						       IIO_EV_TYPE_THRESH, \
>  						       IIO_EV_DIR_FALLING)
> =20

Seems like another stray change.

> @@ -351,11 +349,12 @@ static const struct iio_info ad7816_info =3D {
> =20
>  static int ad7816_probe(struct spi_device *spi_dev)
>  {
> +	struct device *dev =3D &spi_dev->dev;

Again, why are we doing style changes? This seems to be a fix instead of
a style patch.

>  	struct ad7816_chip_info *chip;
>  	struct iio_dev *indio_dev;
>  	int i, ret;
> =20
> -	indio_dev =3D devm_iio_device_alloc(&spi_dev->dev, sizeof(*chip));
> +	indio_dev =3D devm_iio_device_alloc(dev, sizeof(*chip));
>  	if (!indio_dev)
>  		return -ENOMEM;
>  	chip =3D iio_priv(indio_dev);

...

> @@ -431,7 +421,6 @@ static const struct spi_device_id ad7816_id[] =3D {
>  	{ "ad7818", ID_AD7818 },
>  	{ }
>  };
> -

Stray change.

>  MODULE_DEVICE_TABLE(spi, ad7816_id);
> =20
>  static struct spi_driver ad7816_driver =3D {


--=20
best regards,
max


--bf94d117aab954e431a08de8ad5ad467a2313772f0af2049462f558603cc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTMrEGfAFxnfnRQ/UIQghIb0dl/iQUCalExfgAKCRAQghIb0dl/
iZ0CAX43+2agHfad+6pqgKeDQ5Qi/G4AxGVSP1M5pU9xZ4anEspFjfF9On5hWe9l
GJsdU6oBgPMccTfg3SSIYoSfVCOvEboqSAT0xl4CiiXYeOx30w3pV5ErKpfcoI1a
G9NuzugpMg==
=MjO/
-----END PGP SIGNATURE-----

--bf94d117aab954e431a08de8ad5ad467a2313772f0af2049462f558603cc--
