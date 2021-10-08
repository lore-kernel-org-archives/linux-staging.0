Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0C62C88
	for <linux-staging@lists.linux.dev>; Fri,  8 Oct 2021 12:19:49 +0000 (UTC)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1mYoql-0003zx-DP; Fri, 08 Oct 2021 14:19:43 +0200
Received: from pza by lupine with local (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1mYoqj-0007MI-Ji; Fri, 08 Oct 2021 14:19:41 +0200
Message-ID: <7d61fdbd161fce40874766bde5f95c3b73f1a96d.camel@pengutronix.de>
Subject: Re: [PATCH] media: imx: Round line size to 4 bytes
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>, Steve Longerbeam
 <slongerbeam@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>,  Fabio Estevam <festevam@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-media@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
Cc: kernel@puri.sm, phone-devel@vger.kernel.org
Date: Fri, 08 Oct 2021 14:19:41 +0200
In-Reply-To: <20211006110207.256325-1-dorota.czaplejewicz@puri.sm>
References: <20211006110207.256325-1-dorota.czaplejewicz@puri.sm>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.30.5-1.1 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-staging@lists.linux.dev

Hi Dorota,

On Wed, 2021-10-06 at 13:05 +0200, Dorota Czaplejewicz wrote:
> Section 13.7.6.13 "CSI Image Parameter Register" of the
> i.MX 8M Quad Applications Processors Reference Manual
> states that the line size should be divisible by 8 bytes.
> However, the hardware also accepts sizes divisible by 4 bytes.
>=20
> This patch accepts line sizes divisible 4-bytes in non-planar mode.

Thank you, this makes it much clearer. I see two issues with this,
though, one small and one a bit bigger:

First, I'd be wary of disregarding the reference manual - unless we know
better, and then it should be well documented in the code. It might be
that the 8-byte alignment requirement stems from the fact that the FIFO
operates in double-word units, which might cause the CSI to write over
the end of the buffer if the line width is odd (in 32-bit words).
Or maybe it's just that the FBUF_STRIDE conflicts with this, I'm unclear
on whether that is only given in units of dwords (although the driver
currently doesn't support this anyway).

I wonder: if you use 4-byte aligned width and odd height, does the CSI
write over the end of the buffer?

> Signed-off-by: Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>
> ---
>=20
> Hello,
>=20
> my previous patch identified something that was not a problem,
> so I'm sending a different one.
>=20
> This has been tested on the Librem 5.
>=20
> Cheers,
> Dorota
>=20
>  drivers/staging/media/imx/imx-media-utils.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/stagin=
g/media/imx/imx-media-utils.c
> index 5128915a5d6f..a303003929e3 100644
> --- a/drivers/staging/media/imx/imx-media-utils.c
> +++ b/drivers/staging/media/imx/imx-media-utils.c
> @@ -545,13 +545,13 @@ int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_f=
ormat *pix,
>  	}
> =20
>  	/* Round up width for minimum burst size */
> -	width =3D round_up(mbus->width, 8);
> +	width =3D round_up(mbus->width, 4);
> =20
>  	/* Round up stride for IDMAC line start address alignment */
>  	if (cc->planar)
>  		stride =3D round_up(width, 16);
>  	else
> -		stride =3D round_up((width * cc->bpp) >> 3, 8);
> +		stride =3D round_up((width * cc->bpp) >> 3, 4);

Second, even if this works fine on the i.MX7/8M CSI, the alignment is
still required for the i.MX5/6 IPU, for which this code and the comments
were written. So we need a way to differentiate the two cases here.

regards
Philipp
