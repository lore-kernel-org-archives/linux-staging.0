Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63137C
	for <linux-staging@lists.linux.dev>; Sun, 28 May 2023 16:24:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBD6BC433D2;
	Sun, 28 May 2023 16:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685291095;
	bh=6nTxbUcx3/WlWXcIG7oAWKmh1QmalzIAAG0bZJsjU+k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lw3OUFUprdaS/XJL/pdakpPJ5jMklA6Jf+h2Rg8RUePkHsv3aJFuvU/F7DiJ3et/o
	 fdP2p2Si6HK1XOWFhUJa6arVvTjJCKwUuINkBWlIJ1ZKjqmLHpoZTBc7qCKynW/0Bg
	 Q1HkDjfOFZDHlrF6Q8NZz+SEk3e6gB8c8yiZuNrpHP2Up2NmbVodvTk6lzltCay035
	 8d4I3N0N3h9xV0uQ55xDNxEJcln7FNwkEyRDptE1WJa4HwyCHqvxTjLidnAmoLOKbH
	 l7zLmfMpoP4D1t0mQrJdadwYs3sX6O8TtGXPUa9bPBromQoCAF03NJ3yfm9VcUAgtB
	 4NI1lfmavsBzg==
Date: Sun, 28 May 2023 17:41:14 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-iio@vger.kernel.org,
 linux-staging@lists.linux.dev, kernel@pengutronix.de
Subject: Re: [PATCH v2 1/5] staging: iio: Switch i2c drivers back to use
 .probe()
Message-ID: <20230528174114.448b4728@jic23-huawei>
In-Reply-To: <20230524151646.486847-2-u.kleine-koenig@pengutronix.de>
References: <20230524151646.486847-1-u.kleine-koenig@pengutronix.de>
	<20230524151646.486847-2-u.kleine-koenig@pengutronix.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 24 May 2023 17:16:42 +0200
Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> wrote:

> After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
> call-back type"), all drivers being converted to .probe_new() and then
> 03c835f498b5 ("i2c: Switch .probe() to not take an id parameter") convert
> back to (the new) .probe() to be able to eventually drop .probe_new() from
> struct i2c_driver.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
Applied to the togreg branch of iio.git and pushed out as testing for
all the normal reasons.

Thanks,

Jonathan

> ---
>  drivers/staging/iio/addac/adt7316-i2c.c         | 2 +-
>  drivers/staging/iio/impedance-analyzer/ad5933.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/staging/iio/addac/adt7316-i2c.c b/drivers/staging/ii=
o/addac/adt7316-i2c.c
> index 7e3d1a6f30ba..6c1f91c859ca 100644
> --- a/drivers/staging/iio/addac/adt7316-i2c.c
> +++ b/drivers/staging/iio/addac/adt7316-i2c.c
> @@ -138,7 +138,7 @@ static struct i2c_driver adt7316_driver =3D {
>  		.of_match_table =3D adt7316_of_match,
>  		.pm =3D ADT7316_PM_OPS,
>  	},
> -	.probe_new =3D adt7316_i2c_probe,
> +	.probe =3D adt7316_i2c_probe,
>  	.id_table =3D adt7316_i2c_id,
>  };
>  module_i2c_driver(adt7316_driver);
> diff --git a/drivers/staging/iio/impedance-analyzer/ad5933.c b/drivers/st=
aging/iio/impedance-analyzer/ad5933.c
> index b3152f7153fb..46db6d91542a 100644
> --- a/drivers/staging/iio/impedance-analyzer/ad5933.c
> +++ b/drivers/staging/iio/impedance-analyzer/ad5933.c
> @@ -781,7 +781,7 @@ static struct i2c_driver ad5933_driver =3D {
>  		.name =3D "ad5933",
>  		.of_match_table =3D ad5933_of_match,
>  	},
> -	.probe_new =3D ad5933_probe,
> +	.probe =3D ad5933_probe,
>  	.id_table =3D ad5933_id,
>  };
>  module_i2c_driver(ad5933_driver);

