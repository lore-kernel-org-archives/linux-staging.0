Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D31D1DACA1
	for <linux-staging@lists.linux.dev>; Tue, 15 Apr 2025 09:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744708437; cv=none; b=ATcrqewC0b3VjrAO4Tr9jso20IsiyQyA/710SwAvhVs07Dyh7lywLpUrxj2RUZedHC/KwsKfeGtT2o/1dteW9p1+mo5Qoh9O/4dGn23xg3XmSU4qNAGN6+EzE6okjmPVTszghi6l142SGf75uJVHLr8ehloSz0HEIqxqrjgai6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744708437; c=relaxed/simple;
	bh=WNM/4OfpkmjCV4Wo87i68L4Ct0zOB1z3vFnyrdWUfFw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nAnNZZZAxS6aa09MXX9UqKoTp4tIonOlmn9g3ikFjkwloJJRI3sengCsPKPcVfoL4IRk73KknKfylsrAfBMYaQOu0uhXAL3KrQFPW6lYaidrfv40qu2kEZSlaFkntzqnJojPYsX33WmippH4GqBJuq9hIitGJVsuYNUssm2RtTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D/QARG4i; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D/QARG4i"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39c1efbefc6so3143204f8f.1
        for <linux-staging@lists.linux.dev>; Tue, 15 Apr 2025 02:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744708434; x=1745313234; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=E2jVRA/+pZYsZV/NIcT4L7XLSuBTKMKtalPI1ILjZdM=;
        b=D/QARG4iXhBlCrlQrATkRmpKJqdO3EOOyVV1WwGpeUSDAgTn1rm7uaqzJEN1+Q+spE
         2MfFx+UwU9Xemx2DJDZBsFTaTsJQY6x+N4Tv+XHZP4ABT+ew4oSA485dSRDdzW+GXFWW
         +eszKH0UzkkJ8NkkeMYfH5RV6JkRpavPefJAGR9A3El0FOCF8W4vyVeGFFE+7Y9kaTSz
         rEFvrq+ZWplNMHdwd3Q2INC1tDQcZuSKeAaJ7oO+Ga3Pw9c7gj1mYDK9h4UqhoeHaq+8
         dwSy8lm4uaBQf0QHWNTdD93XFjN/USGVpm+91ZADkGPRSpmq/YsDU2cOTAhciQaj5z69
         EfQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744708434; x=1745313234;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E2jVRA/+pZYsZV/NIcT4L7XLSuBTKMKtalPI1ILjZdM=;
        b=Wl2l1HpRdx9Rgk/kioPKP5EBDNbBRcZKB4KDkcjUbjFTae1pLHp7kWPWD1QmdwGPqZ
         diuo4gcdC1Yf46lVYDeaOpj2GE9h4T6uJoz910YWFIOb575QJbp2uvyBOXmt6BW832Gm
         Zghuoc4FXVK01qWECpwspHxyi+8ts5tZn5D6XEJ03ehB2qXTOS0VKd+/eaidi+m0gA1i
         /MBB++IuwlrlNv0PbvoZ4ZkZv7Vaxu9SklKWlWiZPkh84riyVMwIbom3wWjQg3aLB8tE
         F/O6rzeEafYIdvd9XcICguDnUFkDXoLqYNr/8C/aV6UXV0vUfnkaZHRQPaDWSjV4R/+d
         a9hA==
X-Forwarded-Encrypted: i=1; AJvYcCXvutoBkgWMDGh9qEOCgrtfW7C8dbmDyCR/5Z9awH6zl9rqANqtuswU7uPNkP4zMkpbSC6Zez+NNH4VLEsm@lists.linux.dev
X-Gm-Message-State: AOJu0YzXSZAkstpg5EEEfrVtoAKMe9ZV1LVwDmlI2YW7mJmVGelslYQ7
	qkgXrNZKKlNEy8zaYFGpLucC1lL1hb6JpO6nm00Gsa8USfcG0e7Y
X-Gm-Gg: ASbGncv0Bq5YBLonKK0TdO+BaqFr5UZsM1Q9rqO4gPm9O4sGFXdE+l/3e/mLNvnfu+9
	ODnzuFgda5b937XW0Ddt1KivVLsfWL4c7TfJCuYqz+nXVsruoyUx7xGNaL0Nsqbr9FXjQ0hL7Y+
	udPGMVhDlDzTsZbvoZqmr1m9FWCaakWB5DnhypDWbo4QhW8CHnRDNc2hBiWeQEpdGtgx7qhke9v
	HNQluygyRfTJtW6OTh618Y65m9B8MVhbBuP4RwdpFaWHFX/jnXPIJiyemaLQpew+alaxcRxFr0H
	eNGVGrm2WC1l0ajWaIPkaRPH8nfrFi5JZsXI54wY1IhBvYCEXQ0k/d2qF1kJYxdPg63VkEv0s4U
	0EfpORRyoiv3FuuWKr7zVWhU=
X-Google-Smtp-Source: AGHT+IETzmpzV8MS7XyeqUk1lViNUBhbS8KmDB5sfjr8p/5OPY1gqFLmopkaJDenJ5glgZx/7VcLdg==
X-Received: by 2002:a5d:648a:0:b0:39a:c9ac:cd58 with SMTP id ffacd0b85a97d-39ea52124fcmr11718050f8f.29.1744708433744;
        Tue, 15 Apr 2025 02:13:53 -0700 (PDT)
Received: from ?IPv6:2001:818:ea8e:7f00:2575:914:eedd:620e? ([2001:818:ea8e:7f00:2575:914:eedd:620e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae979615sm13923443f8f.54.2025.04.15.02.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 02:13:53 -0700 (PDT)
Message-ID: <1fb5f1c5e61ce386cb431d48296e952bdd560a6c.camel@gmail.com>
Subject: Re: [PATCH v3] iio: adc: Correct conditional logic for store mode
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Gabriel Shahrouzi <gshahrouzi@gmail.com>, Lars-Peter Clausen
	 <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron
	 <jic23@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Cc: skhan@linuxfoundation.org, kernelmentees@lists.linuxfoundation.org, 
	stable@vger.kernel.org
Date: Tue, 15 Apr 2025 10:13:55 +0100
In-Reply-To: <20250414154050.469482-1-gshahrouzi@gmail.com>
References: <20250414154050.469482-1-gshahrouzi@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Mon, 2025-04-14 at 11:40 -0400, Gabriel Shahrouzi wrote:
> The mode setting logic in ad7816_store_mode was reversed due to
> incorrect handling of the strcmp return value. strcmp returns 0 on
> match, so the `if (strcmp(buf, "full"))` block executed when the
> input was not "full".
>=20
> This resulted in "full" setting the mode to AD7816_PD (power-down) and
> other inputs setting it to AD7816_FULL.
>=20
> Fix this by checking it against 0 to correctly check for "full" and
> "power-down", mapping them to AD7816_FULL and AD7816_PD respectively.
>=20
> Fixes: 7924425db04a ("staging: iio: adc: new driver for AD7816 devices")
> Cc: stable@vger.kernel.org
> Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> ---

LGTM, do you happen to have this device? It would more interesting to move =
this
driver out of staging :)

Acked-by: Nuno S=C3=A1 <nuno.sa@analog.com>

> Changes since v3:
> 	- Tag stable@vger.kernel.org=C2=A0instead of an email CC
> 	- Use the correct version for patch
> Changes since v2:
> 	- Add fixes tag that references commit that introduced the bug.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Replace sysfs_streq with str=
cmp.
> ---
> =C2=A0drivers/staging/iio/adc/ad7816.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/staging/iio/adc/ad7816.c
> b/drivers/staging/iio/adc/ad7816.c
> index 6c14d7bcdd675..081b17f498638 100644
> --- a/drivers/staging/iio/adc/ad7816.c
> +++ b/drivers/staging/iio/adc/ad7816.c
> @@ -136,7 +136,7 @@ static ssize_t ad7816_store_mode(struct device *dev,
> =C2=A0	struct iio_dev *indio_dev =3D dev_to_iio_dev(dev);
> =C2=A0	struct ad7816_chip_info *chip =3D iio_priv(indio_dev);
> =C2=A0
> -	if (strcmp(buf, "full")) {
> +	if (strcmp(buf, "full") =3D=3D 0) {
> =C2=A0		gpiod_set_value(chip->rdwr_pin, 1);
> =C2=A0		chip->mode =3D AD7816_FULL;
> =C2=A0	} else {
