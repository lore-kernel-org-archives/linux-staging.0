Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B2838FA5
	for <linux-staging@lists.linux.dev>; Mon,  1 Apr 2024 12:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711974391; cv=none; b=djVTjIePQZqXsb8JrIZBYGPxjfq8iRg4Lb4p4InTaSpjJmCVWC0NcNcBclQbWCWY6x0RdIm8F9UnvDxnoUqiPOHRZn2skUf9cvVCLlBty5xRl35Y2uLhA8QSXwOfInZy+oDtjfLSwex3JNlTAgLyiC/rru4imwgk+9GJbK+QsmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711974391; c=relaxed/simple;
	bh=c2T6wibH5F5WD78oV+uJZBaTSlduS/x3Pva398zJ2NE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R+L/48RX+0y3AtoFigVwONXEf4fo7JyFLK+U49sewGhXkWrR+7Qg+stzXgv8Ajtbg4lreATTsP7XSqUS3klE8+GTYUA1V85/xDBLT3yw2zN1SETs2AD2Bi+gIGOSUzf2iNXRTC9ulOrF+0rUT8C3vYBPosjbXpRPDo5Y/lIHj4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c1LJHQi4; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c1LJHQi4"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1df01161b39so34249595ad.3
        for <linux-staging@lists.linux.dev>; Mon, 01 Apr 2024 05:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711974389; x=1712579189; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u6feF6K6v6g7R1Hg319jEuD6xgNSbVhQOmS4a1TLMNc=;
        b=c1LJHQi4x3uiA12buw31vRNY+UVh4YN8ewWkt3+k+4ChsaClWL+pGAJM5dX0Bqr9lL
         fgSAGxGbEaPQT1i2X290IkYOavwfo4cFCH1DsynqqqqJplEDAzJOTHnENAi3/RR5AhaC
         mbW7MDTt6ET/Wl3xGRI98RV6OAU8oZiuBk/9gvWHpLELSAL7Nd4jODPREcwec2qVdDnY
         nj1CQDPUTRdc/4r57OiPZ+JiIZ11C6yPXszsmiPfdfDy2Rx4/ALB0cMJ1XoeMSliBZar
         MbkfTjsDUmdc2i+PO99TY5VZjOAX9lnDETO0eUrfsf3L5PCRgsf4yTBXYS7Uj5GcnlSr
         qGXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711974389; x=1712579189;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u6feF6K6v6g7R1Hg319jEuD6xgNSbVhQOmS4a1TLMNc=;
        b=k4EuVdjOrp9SUwqkNVL7qns5U04xR7klXjEwphexsximGdgdNLZGQkLAMsoFHlG0Xt
         a5pyaANgECcYQ9McQ3IxYC8zXa6OObFtn9Ci6DxAZi3BDcBKTRDiSkc7PZwwQ2131ekd
         eYgB1tzJkyWXs97x+H9EJvmOAWEVoJZKD4+ZjTVYxW9Ntm8dE5YyagIBIrZxAnb82n0i
         MDLxHdZgZsxrGb1Sa8NLTi6UkGmub0YGbpjez0QyeT/XbNtaDKY9xnsQsKleMZgCzsjt
         vOLwkG6XkN7VVgzeMC9z10j7cT5hLWMSvZ54bCsu+FgE+ez3uznoTx6xrc6BPlkmiBIO
         6fVg==
X-Forwarded-Encrypted: i=1; AJvYcCWme7ZGVSxG/ldhaz1X1yp8GVqxjAdO1wqHTYMgPNiRGEDvG4pyj8R2hFcchdxvyHrvEAsfLAa/VkgzJZe14+3PhrHm8XMzOLTSPrDCzQ==
X-Gm-Message-State: AOJu0YxeZCBMhXpCij7+DsRHA2kGWS8qetO6hC9OQTnQlnVQ+ESWPky6
	Bix5z8yZEGoSD7oEpUGyXqObT7akCqGoFnbG4eJiGQuTZPCYZsx3
X-Google-Smtp-Source: AGHT+IEAivMxtOmgKqQ4sG59sjkiA6GyfykFA6t8zaG5rQMJo8i/Wp4nRjMYYFNRSp2kdaCucXtiVw==
X-Received: by 2002:a17:902:dacf:b0:1de:e5aa:5ce with SMTP id q15-20020a170902dacf00b001dee5aa05cemr10304970plx.41.1711974388885;
        Mon, 01 Apr 2024 05:26:28 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id b15-20020a170902650f00b001e014627baasm8902636plk.79.2024.04.01.05.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Apr 2024 05:26:28 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 977C51847ECE7; Mon,  1 Apr 2024 19:26:26 +0700 (WIB)
Date: Mon, 1 Apr 2024 19:26:26 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: me@wantyapps.xyz
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Prathu Baronia <prathubaronia2011@gmail.com>,
	Rob Herring <robh@kernel.org>, Yangtao Li <frank.li@vivo.com>,
	"Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Khadija Kamran <kamrankhadijadj@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: axis-fifo: Fix indentation
Message-ID: <Zgqn8izgsMI7rQNA@archie.me>
References: <20240305211416.755911-1-me@wantyapps.xyz>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RMq/zonEoj5TvfGw"
Content-Disposition: inline
In-Reply-To: <20240305211416.755911-1-me@wantyapps.xyz>


--RMq/zonEoj5TvfGw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 05, 2024 at 11:14:01PM +0200, me@wantyapps.xyz wrote:
> From: Uri Arev <me@wantyapps.xyz>
>=20
> Warning reported by checkpatch.pl script:
>=20
> CHECK: Alignment should match open parenthesis
>=20
> Signed-off-by: Uri Arev <me@wantyapps.xyz>
> ---
>  drivers/staging/axis-fifo/axis-fifo.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis=
-fifo/axis-fifo.c
> index 727b956aa231..ab758a527261 100644
> --- a/drivers/staging/axis-fifo/axis-fifo.c
> +++ b/drivers/staging/axis-fifo/axis-fifo.c
> @@ -381,8 +381,8 @@ static ssize_t axis_fifo_read(struct file *f, char __=
user *buf,
>  		 */
>  		mutex_lock(&fifo->read_lock);
>  		ret =3D wait_event_interruptible_timeout(fifo->read_queue,
> -			ioread32(fifo->base_addr + XLLF_RDFO_OFFSET),
> -			read_timeout);
> +						       ioread32(fifo->base_addr + XLLF_RDFO_OFFSET),
> +						       read_timeout);
> =20
>  		if (ret <=3D 0) {
>  			if (ret =3D=3D 0) {
> @@ -522,9 +522,9 @@ static ssize_t axis_fifo_write(struct file *f, const =
char __user *buf,
>  		 */
>  		mutex_lock(&fifo->write_lock);
>  		ret =3D wait_event_interruptible_timeout(fifo->write_queue,
> -			ioread32(fifo->base_addr + XLLF_TDFV_OFFSET)
> -				 >=3D words_to_write,
> -			write_timeout);
> +						       ioread32(fifo->base_addr + XLLF_TDFV_OFFSET)
> +								>=3D words_to_write,
> +						       write_timeout);
> =20
>  		if (ret <=3D 0) {
>  			if (ret =3D=3D 0) {

LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--RMq/zonEoj5TvfGw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZgqn7QAKCRD2uYlJVVFO
o8s7AP93pQcbIO5XI50jdNT/8fX+13cGyDwmxZvPuGWkmwswPwEA4/xSD6mE4SEW
iaXCdqJLVhWJfdTk2viDAHS0hL4WGAU=
=Ba1J
-----END PGP SIGNATURE-----

--RMq/zonEoj5TvfGw--
