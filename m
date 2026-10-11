Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA65D468C17
	for <linux-staging@lists.linux.dev>; Sun, 11 Oct 2026 23:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791760201; cv=none; b=R4kiXqXfbhQVCuYg+EFQh2WDMncjh63LpzXWxC6uyKYOLBujboquANaAzE0zlP0Om0p467HOAic/PuzwJF/2LVwKN+v4Ejzl/+1mdsDpF2tcnyaDqDtkxx7qT2ISzl/DZKVNjGDcN7I1ZnEWvgLOHlFlA+YMQ/jkPCynGuMtWSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791760201; c=relaxed/simple;
	bh=+16QtwDq1//lvFyG9fKKvK26/1o3S9Jzkd2YP1TMJmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZxIEkh2r3MhIobD7+PVtjRlI5asu61h6sYYoOD/sEzHQaC1mFyxNZFT3TEZeLth6U3W0QupXpwfU+NnEplk89u0Irx/XThgPHeAdmVvZAdoM9FQ0cXZIPsAezlHs7NFvQLso6ynngRnMzWeDIhJN+1cOwekCmb5nuAwv8fncbgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=NI9C7moZ; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="NI9C7moZ"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-486e70f2457so527537f8f.2
        for <linux-staging@lists.linux.dev>; Sun, 11 Oct 2026 16:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791760198; x=1792364998; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GcUFAmvYC3+zqJMiUlGkPj1hBaQn7R6Mw/mFH4fX6fE=;
        b=NI9C7moZSc7ArQq6EqCMrp5RWwh4AVDAtF8kA3FfbVBvo2EJK5OKZJxNbGqS8i2t/q
         xhDtzbx9UywPPwgBVENOt/nL0eubQisvSQVJFTmNBUtklTs3Pq0VUcclwBSC1ipWcE2i
         ZgMClTEN++zk0gGFB5O7oRQb/LipVFZ+bJXngyJoZqmrQeaeg61O2TKHg4ZF1Iugmlf2
         ICKQPG6uuowXCQmFutK1G/0Xdo5n1LtwhLdpt49NmPkJJVxR6w09VxOkHu7LPBFoSUku
         cV4uZnEAIWPo086pMeiOfCNAcQ6SzNjkTkFCW6cSUd5UWKOzSE66+NNfeEfrKtYXuhMn
         3uzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791760198; x=1792364998;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GcUFAmvYC3+zqJMiUlGkPj1hBaQn7R6Mw/mFH4fX6fE=;
        b=wNBfiH1i0cmRciW7TFC2iCmfs0P7P2X3vkHnA6KNd+16j2sOoGu+VfLZq6bLlXKyAB
         SL/k7tmKvE+lgflEVVStSx8zasbHLm/0mFuRaKvAoTz9l2HSMCHajpM5QVTfU7cbN7qn
         cuoviCslYeToD0BRhCfZwQbXmyop5wCSy3zjj/ARThmP//0hTNVjXyPJ3N5WJ7qc7ZaM
         mrv3niQi1uEuLxrYMg8wm4dkLKdp5nwLo3Pcy/L2aRYJugJ4JmVaOhf1eBws5Jx+BVQM
         SSGRip2vUIZrUDkMiACNAIBlR1NGbq7oQBH/hNXg7thtRAsfq7enqsd/ZUfniFWI16mt
         kKhA==
X-Forwarded-Encrypted: i=1; AKwUvBy3u1/izELV8jlA6owiHc/d2N5q8qF6rd/ybY4+eOuVbaYNiJYn0SEW2iiFLBGm1Pu0jLWbVfMjRbHahldI@lists.linux.dev
X-Gm-Message-State: AFq9FYKTvZvFR27Z1z9gimcxXv6NwkwGCL7O8lKALXtnoyeQjENgr1td
	UDZEilhKMiO451FD3GLlieUQc/1yNwW4YMwIw+Wk1xshJ2aBstr/1fWhgENhPL/CxvI=
X-Gm-Gg: AYBFou18EzDm4f1vwYL7GN0T0TTH/ftstdUmEsrsuGfuDUplKZa6fcG4nIdhzm4QgeC
	3kMbYDXkRSMwtiEhpgHma4G1+eMBfiMO6i/OvuElKxJdL282AQK3DvW6sSk0ZhapxYmIGZ6PPrf
	X2j6CLuJu3hJYkUeJthQkXqiDRWo6j/QQrKbhsObP20J2YGpMazof2H8qASAi6PC6YKlF/f/M55
	e9uZpZwuYVSYUExPtshA/BH+KZRcsaLhBInXhdGw9oRPGGCzrLsi6LqZwBmUKzBCZsTCRyPNsPj
	oxRFcIj7drYw0n2PqXUChPAa3BUa40eLp5EU4GfebcfiCdlwcmhqARnQ7pE8fdJ4mGv6VV3QCOd
	5x9ghaVckqelE0HAV/YRgaD0xQOCrghxKAJA91jkdOonQSUtsf8Z+V4y8ssuyAi3CqAsgMaABSb
	htmfNQNa5sBVz9/fjD03ASFubkcRAFC7fzjlxjqcCIs5BMF2YbnR2xDaEHN+nryMY4fgsW1+e4F
	Ejg
X-Received: by 2002:a05:6000:491c:b0:488:8751:e78e with SMTP id ffacd0b85a97d-48dba9bdd09mr15386734f8f.16.1791760198010;
        Sun, 11 Oct 2026 16:09:58 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48db97ce3aasm16619964f8f.21.2026.10.11.16.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 16:09:55 -0700 (PDT)
Date: Mon, 12 Oct 2026 01:09:55 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Cc: jic23@kernel.org, gregkh@linuxfoundation.org, nuno.sa@analog.com, 
	Michael.Hennerich@analog.com, dlechner@baylibre.com, andy@kernel.org, linux@analog.com, 
	linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	joshua.crofts1@gmail.com, error27@gmail.com, narcisaanamaria12@gmail.com
Subject: Re: [PATCH 2/3] staging: iio: accel: adis16203: add missing
 spi_device_id table
Message-ID: <aswW2bAapx3318Zd@monoceros>
References: <20260929184900.39515-1-abdelnasserhussein11@gmail.com>
 <20260929184900.39515-3-abdelnasserhussein11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="prqxuytw7zq4oius"
Content-Disposition: inline
In-Reply-To: <20260929184900.39515-3-abdelnasserhussein11@gmail.com>


--prqxuytw7zq4oius
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/3] staging: iio: accel: adis16203: add missing
 spi_device_id table
MIME-Version: 1.0

On Tue, Sep 29, 2026 at 09:48:59PM +0300, Abdelnasser Hussein wrote:
> The driver currently relies on OF/DT matching but lacks an SPI device
> ID table. This prevents module auto-loading on systems without device
> tree support.
>=20
> Add the spi_device_id table to resolve this and ensure the driver loads
> properly across all supported platforms.
>=20
> Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
> ---
>  drivers/staging/iio/accel/adis16203.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/staging/iio/accel/adis16203.c b/drivers/staging/iio/=
accel/adis16203.c
> index eddb786d4747..905485fd556f 100644
> --- a/drivers/staging/iio/accel/adis16203.c
> +++ b/drivers/staging/iio/accel/adis16203.c
> @@ -11,6 +11,7 @@
>  #include <linux/iio/imu/adis.h>
> =20
>  #include <linux/kernel.h>
> +#include <linux/mod_devicetable.h>

Nope, please don't add new users of <linux/mod_devicetable.h>.

You can rely on struct spi_device_id being provided by
<linux/spi/spi.h>, alternatively use <linux/device-id/spi.h>.

Best regards
Uwe

--prqxuytw7zq4oius
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrMFz8ACgkQj4D7WH0S
/k6kywf9EjX7GsElJJsb0VH6miyI4XnlA671jxyreWl8IzCOm+VoTZxx4dp8ulcN
IZJM+szmAKlVq77vFMB9/ZNczuPCtQAf2GDlu70aXCrTKpgg3d4zRKYTjdKNg4x5
y2Z+7nphR4rgx2zv9rHu1h3ErB7O3AI5Idxm/DnSQLHQ1ORNeGN93ZcvErD6dJxX
s4dcRXvOHbNpA+sN2h+2+pYX7gxj7wFoVFKX9IgHTISLs9g4/0KiU0o1xIi9Yn7U
oHCFngN6yZuI+20/ccHX4RhZ9EyrChTTkQL4ru8H+TU/v9L2Dl6B3aeJQAafr1KB
lQH0fT0VphJojd3seU53jPC80txX/A==
=MAFV
-----END PGP SIGNATURE-----

--prqxuytw7zq4oius--
