Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6AB672
	for <linux-staging@lists.linux.dev>; Fri, 15 Oct 2021 11:12:31 +0000 (UTC)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 714062E3;
	Fri, 15 Oct 2021 13:12:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1634296343;
	bh=uynZabXZy8nfj/k/5uQB3ukn1EYdSOycveOzbdcINP8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=rAmuAb8yHDL15D8KxoZTtm6i60MM2L+sydajRhUETQbJvbbeZ8XSmSdJM80LjzI/J
	 R9S2qAJ8n6Sq/0UjLpmapaCYOVgtqTHxfvC9Hmcy17AHm6NiOOXm/e8ZdZubwLd7MG
	 YkLvPrAuAmz/jSZOVRaegyZnHbU5L3lepJPBAKqQ=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211012221144.30638-1-rikard.falkeborn@gmail.com>
References: <20211012221144.30638-1-rikard.falkeborn@gmail.com>
Subject: Re: [PATCH] staging: media: rkvdec: Constify static struct v4l2_m2m_ops
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Rikard Falkeborn <rikard.falkeborn@gmail.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rikard Falkeborn <rikard.falkeborn@gmail.com>
Date: Fri, 15 Oct 2021 12:12:20 +0100
Message-ID: <163429634048.4171071.2327108342733912267@Monstersaurus>
User-Agent: alot/0.9.1

Quoting Rikard Falkeborn (2021-10-12 23:11:44)
> The only usage of rkvdec_m2m_ops is to pass its address to v4l2_m2m_init(=
),
> which takes a pointer to const v4l2_m2m_ops as argument. Make it const
> to allow the compiler to put it in read-only memory.
>=20
> Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/staging/media/rkvdec/rkvdec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/medi=
a/rkvdec/rkvdec.c
> index bf00fe6534a3..28aab5c7fe33 100644
> --- a/drivers/staging/media/rkvdec/rkvdec.c
> +++ b/drivers/staging/media/rkvdec/rkvdec.c
> @@ -677,7 +677,7 @@ static void rkvdec_device_run(void *priv)
>                 rkvdec_job_finish(ctx, VB2_BUF_STATE_ERROR);
>  }
> =20
> -static struct v4l2_m2m_ops rkvdec_m2m_ops =3D {
> +static const struct v4l2_m2m_ops rkvdec_m2m_ops =3D {
>         .device_run =3D rkvdec_device_run,
>  };
> =20
> --=20
> 2.33.0
>
