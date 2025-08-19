Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5B3326D45
	for <linux-staging@lists.linux.dev>; Tue, 19 Aug 2025 11:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755601995; cv=none; b=DJu0v50p1q4ntOY614qBXZNrgNigGKwhJO1A8ZDGO0hSZWUGZAidSkhDh9YaBw9CCoUlfWTnnu6XSki9gZSrZfcifNXq45z55knSop/mjuR9T790oY4dsN7P9pWN0nyFaczXAnOKMG6r6ar3R4hItQhn9Xbe7zwiZOHr1sA9P2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755601995; c=relaxed/simple;
	bh=eOGztn+XZImdmyNmzsHCKHpFegVOo+T0W3/lKZAl7/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WYW7EhBMwzY52Z4kMHYc7VYMUb/tkWVMOtPaH1TDQHwH3NPkckoMo/oVyTubGL729V3UuIG/0DSUjo/K0sYgfqvm1RPu1rcMWjzmCf1J1Q8StUEWcF5d7/ZzUHKC4MmHTJQ+wPSgjgC4q3kP/EPWW1EPZaVs+wtAzMEqtrcc7mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=lI0vJ43v; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="lI0vJ43v"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45a1b004a31so36282925e9.0
        for <linux-staging@lists.linux.dev>; Tue, 19 Aug 2025 04:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1755601991; x=1756206791; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/yJKKeK4Q7qCviwAaXshIe1r0nDBHVRyI+cfjeEzOt4=;
        b=lI0vJ43vU8cx/wiRIooSkfILAgxiz9xnwjJthydUQwEgkm1H0FDFbCiHbjGHSZwtQi
         y7vnfgBjQx91wtEn363EVceZbDdgSPFfCfpLx2XuSAaYyEppLG8TKfZGlaPfUguWgCj7
         j5JiDTaX5Lf5lQEuUKca8Zi7fj83Zf2078+/RQLDBjNWyzTJvL4sXRIughfbRPNltQVX
         7M/aHb0i8q+pLtl+n2u71fTAOpnP1Y4uWalN2WblCxIR1f79rzwdktBFckH6tCQ4nced
         PukBCx8e/AhmIuQxL/AjfzY8C2tLAjdDJ8WDX+sKeoUxtkgVTiHrL0ksA2arENTG3qPg
         ibpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755601991; x=1756206791;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/yJKKeK4Q7qCviwAaXshIe1r0nDBHVRyI+cfjeEzOt4=;
        b=b5F+00+7v/OE7oPwDGoWQNpmzuARN0VqQhaWlb2MCGUtcLFAPIn32DE+7DaxLdQ+F/
         p2j1mT5Tza871oqcfTiuYvXqG2D3VFBoLIpOKMMhFALZpiAck+wD2vUdWehP1gzp/Pi9
         x4EmICL+wSyxzAQpj2xdvQ0IyHQR/qxzFxKrA/yEovGL5v4AYYsI4vqleozm6KaAQgcG
         3ziYCU1EmDwf1qM9qkR8VSKYrwpbm6hhmG95C57O5e8Cn398331h3Q41yz4bWwQGlT7m
         dfH1WaXByhGCFHxpKQqBrxl/zMhy++kvarFCZVCBQZgsVBjWBlS1Z1VOOWDRLFkzp6YD
         d2oA==
X-Forwarded-Encrypted: i=1; AJvYcCVZdzECoB/+9AKXG5Qde0Pqr3gkkKRwwQFsMbaxqoFrpJqy//WSH9wG1/f5q7VgTgftmaNRdAlfDaIhfof6@lists.linux.dev
X-Gm-Message-State: AOJu0YySQVOaYCg+lYpmZudRdacFInUax1KhSm+KuB4RzKumEALg00lI
	YZ2+G/6QXXmqV8HNeEntdgXFM8K43PgRC28/nrgXTY0a1R1lwvc7tZMG6QosRURI/eE=
X-Gm-Gg: ASbGncu17vIjhGU0Kf/cvzLgVtjDI/IsEZCUJ8lliV1yNWq3GcwW5jTXW26n3od5Ckj
	GzKNUOwTzdxDnYJh4w5F4FzwSWZ3SQ08ILRbCLBfFOzKe7JnB4dYo6AbuRa8Or3QcGE02rZbXGP
	y342iQZzSG+nw44ki0owfamADnBIwbnF9JL21SjPeoINqeQ6rFVCUyGUPZerNb7XlSWysypRGO4
	KrrRPxyg8LGyW4t/f75PbrkcXbotSekcyWrvy18o2YaDix4xqnufnSmdD0N2ViD4zb7j1Vx6NJo
	ZkfmU01WPZ56yJIxpKmSijhm8kMQY7x7uX7nbiiw3OzNAHtyHGvuMhEWFjz3lqXOpSjbaLGkyoL
	dXgBDqY7gyOyf02JYnukSzdIbLdz+AwD0OghBiHp8Yt8Eums5WCobHidyyIiCxgTv
X-Google-Smtp-Source: AGHT+IFV92TWmjlNlyXfloSVnvn3OJ/hS/EMPsydq9z6s3SqLXLiBeEG9oimIjL9VVY0aN6qFW1z+g==
X-Received: by 2002:a05:6000:1889:b0:3c0:77a6:9cbe with SMTP id ffacd0b85a97d-3c0eae5913bmr1582101f8f.17.1755601991273;
        Tue, 19 Aug 2025 04:13:11 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c074879fe5sm3274045f8f.2.2025.08.19.04.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 04:13:10 -0700 (PDT)
Date: Tue, 19 Aug 2025 13:13:09 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Xichao Zhao <zhao.xichao@vivo.com>, thierry.reding@gmail.com, 
	jonathanh@nvidia.com, skomatineni@nvidia.com, mchehab@kernel.org, 
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: tegra-video: Remove the use of
 dev_err_probe()
Message-ID: <jodxtve3lnv4hc2f2cm25ckdj6ukfzsbqjzpxuyqwx2qmsw27w@emg722bix2a5>
References: <20250819092330.550046-1-zhao.xichao@vivo.com>
 <20250819122830.3d4874ed@booty>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hmfywkuclechgpww"
Content-Disposition: inline
In-Reply-To: <20250819122830.3d4874ed@booty>


--hmfywkuclechgpww
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] staging: media: tegra-video: Remove the use of
 dev_err_probe()
MIME-Version: 1.0

Hello,

On Tue, Aug 19, 2025 at 12:28:30PM +0200, Luca Ceresoli wrote:
> +Uwe, author of 2f3cfd2f4b7c ("driver core: Make dev_err_probe() silent
> for -ENOMEM").

The main purpose of that commit was to make dev_err_probe() silent if
the error code might be ENOMEM. If it's sensible to call dev_err_probe()
if you know that the error code is ENOMEM is subjective. On one hand
it's explicitly a noop then, but on the other hand it might serve as
code documentation and make it explicit that error messaging is
consistent.

There was also a recent discussion about:

	ret =3D devm_add_action(...)
	if (ret)
		return dev_err_probe(..., ret, ...);

which is a case of "ret can only be 0 or -ENOMEM", but that's harder to
spot than the patched code below.
	=09
> On Tue, 19 Aug 2025 17:23:30 +0800
> Xichao Zhao <zhao.xichao@vivo.com> wrote:
>=20
> > The dev_err_probe() doesn't do anything when error is '-ENOMEM'. Theref=
ore,
> > remove the useless call to dev_err_probe(), and just return the value i=
nstead.
> >=20
> > Signed-off-by: Xichao Zhao <zhao.xichao@vivo.com>
> > ---
> >  drivers/staging/media/tegra-video/tegra20.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/stag=
ing/media/tegra-video/tegra20.c
> > index 7b8f8f810b35..ee65e89c119c 100644
> > --- a/drivers/staging/media/tegra-video/tegra20.c
> > +++ b/drivers/staging/media/tegra-video/tegra20.c
> > @@ -255,7 +255,7 @@ static int tegra20_channel_host1x_syncpt_init(struc=
t tegra_vi_channel *chan)
> > =20
> >  	out_sp =3D host1x_syncpt_request(&vi->client, HOST1X_SYNCPT_CLIENT_MA=
NAGED);
> >  	if (!out_sp)
> > -		return dev_err_probe(vi->dev, -ENOMEM, "failed to request syncpoint\=
n");
> > +		return -ENOMEM;
>=20
> Thanks for your patch!
>=20
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>=20
> About dev_err_probe(), I wonder whether it should mention the -ENOMEM
> exception in kerneldoc. Is it part of the API "contract" it provides?

In general you're not supposed to wail about -ENOMEM because such a
problem is already "loud". I claim it's fixed that dev_err_probe() is
silent for -ENOMEM. If you consider it helpful to add it to the
documentation, add it.

In this case I agree that dropping dev_err_probe() is sane. In the
devm_add_action() case above I tend to keep it.

Best regards
Uwe

--hmfywkuclechgpww
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmikXEMACgkQj4D7WH0S
/k4o/wf/ZgEYIuiyBekysNHT7NkgK3JGmSZ0EBT1KwqWftvMxjmXXMUjFjvDgpCV
VgAyoDMHeP4LHDAyjCiYW9eiSHAvySvtNiwAPgfntErnVVVI2tCpw3M25m6EhJ+i
7RA1Need6625DeRuiFI5SpTRpS66U6uAdm68QKcfG3wFTlC7KxcRfi11Vx8VxQza
qllSXtWnSc4dc1YJjenC1nCn1uO9W61qIFU/5TYYKxL5EzG+dtl8cSDRMkzNl/mn
j74nqhcOYrob9rU2uEgLsNsISxUTcjbzvoCKSLNUx2tZiMBGJi1ral4kmsaJakx8
oLWB/IqoACKopCiO0AA8M7yusP4/Kg==
=PAjG
-----END PGP SIGNATURE-----

--hmfywkuclechgpww--
