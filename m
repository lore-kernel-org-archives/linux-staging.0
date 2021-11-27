Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F34A2C82
	for <linux-staging@lists.linux.dev>; Sat, 27 Nov 2021 19:48:38 +0000 (UTC)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8DAD92C5;
	Sat, 27 Nov 2021 20:48:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1638042509;
	bh=5AarLF7XEC+A01zcRLBip6Qs9PHHphyON+OQB9reAlE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=iDUzrX2Y4NsEzaMMGi7U7hFtYIckbMLbsWrQpQ4L/33erH/MbORbJyTIdGrvQ2aDW
	 /6MFQHjt3XCi0jM1P1yqVs7ey1grkfFD1ivEpEcBnadHx35HkAhtsfdFZo3kdNLXnk
	 jRU3ltbI79AtrOoXOn9LWGFsqWxgRB80107cfyG8=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211127094945.27985-1-rikard.falkeborn@gmail.com>
References: <20211127094945.27985-1-rikard.falkeborn@gmail.com>
Subject: Re: [PATCH] media: staging: max96712: Constify static v4l2_subdev_ops
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Rikard Falkeborn <rikard.falkeborn@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Niklas =?utf-8?q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, Rikard Falkeborn <rikard.falkeborn@gmail.com>
Date: Sat, 27 Nov 2021 19:48:27 +0000
Message-ID: <163804250741.1395471.3992939322301351301@Monstersaurus>
User-Agent: alot/0.10

Hi Richard,

Quoting Rikard Falkeborn (2021-11-27 09:49:44)
> The only usage of max96712_subdev_ops is to pass its address to
> v4l2_i2c_subdev_init() which takes a pointer to const struct
> v4l2_subdev_ops as argument. Make it const to allow the compiler to put
> it in read-only memory.
>=20
> Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>

Yes, Good spot.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/staging/media/max96712/max96712.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/=
media/max96712/max96712.c
> index 847e2ffd4f53..9bc72d9a858b 100644
> --- a/drivers/staging/media/max96712/max96712.c
> +++ b/drivers/staging/media/max96712/max96712.c
> @@ -250,7 +250,7 @@ static const struct v4l2_subdev_pad_ops max96712_pad_=
ops =3D {
>         .set_fmt =3D max96712_get_pad_format,
>  };
> =20
> -static struct v4l2_subdev_ops max96712_subdev_ops =3D {
> +static const struct v4l2_subdev_ops max96712_subdev_ops =3D {
>         .video =3D &max96712_video_ops,
>         .pad =3D &max96712_pad_ops,
>  };
> --=20
> 2.34.1
>
