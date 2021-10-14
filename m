Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A04B2C81
	for <linux-staging@lists.linux.dev>; Thu, 14 Oct 2021 10:47:54 +0000 (UTC)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1mayH0-0007Yi-DW; Thu, 14 Oct 2021 12:47:42 +0200
Received: from pza by lupine with local (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1mayGy-000205-T4; Thu, 14 Oct 2021 12:47:40 +0200
Message-ID: <a72231d4c7b1f9eb7746bc3c8fbca5343b12d0db.camel@pengutronix.de>
Subject: Re: [PATCH] media: imx: Constify static struct v4l2_m2m_ops
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Rikard Falkeborn <rikard.falkeborn@gmail.com>, Steve Longerbeam
	 <slongerbeam@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>,  linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev,  linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Thu, 14 Oct 2021 12:47:40 +0200
In-Reply-To: <20211012214703.25433-1-rikard.falkeborn@gmail.com>
References: <20211012214703.25433-1-rikard.falkeborn@gmail.com>
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

Hi Rikard,

On Tue, 2021-10-12 at 23:47 +0200, Rikard Falkeborn wrote:
> The only usage of m2m_ops is to pass its address to v4l2_m2m_init(),
> which  takes a pointer to const v4l2_m2m_ops as argument. Make it const
> to allow the compiler to put it in read-only memory.
>=20
> Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
> ---
>  drivers/staging/media/imx/imx-media-csc-scaler.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/staging/media/imx/imx-media-csc-scaler.c b/drivers/s=
taging/media/imx/imx-media-csc-scaler.c
> index eb6da9b9d8ba..1fd39a2fca98 100644
> --- a/drivers/staging/media/imx/imx-media-csc-scaler.c
> +++ b/drivers/staging/media/imx/imx-media-csc-scaler.c
> @@ -820,7 +820,7 @@ static const struct v4l2_file_operations ipu_csc_scal=
er_fops =3D {
>  	.mmap		=3D v4l2_m2m_fop_mmap,
>  };
> =20
> -static struct v4l2_m2m_ops m2m_ops =3D {
> +static const struct v4l2_m2m_ops m2m_ops =3D {
>  	.device_run	=3D device_run,
>  	.job_abort	=3D job_abort,
>  };

Thank you,

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
