Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B699D2FB63E
	for <linux-staging@lists.linux.dev>; Mon, 10 Nov 2025 08:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762763320; cv=none; b=ugovBPoM/6H0t55gfyGRRqEAHSd+9ImCPkZ1IwoQ2FxNzjrZeWlB9yyB7RUJdKZZcDESQTVt7DGBumdrYitmi0b6Cs6v2VwOIZayRlzoXcGXKCgXCtHsneCKR/DDCjRXJBLPHsT//h8fPhSmZX2MetiOrE8QK3mLeMozEGcRzgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762763320; c=relaxed/simple;
	bh=kyu+20DkV5kinnkQIrgNeoTMEyekh1Z2TQjxvDpjCHE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KdAs2srHXJoJeErZm6IaEYsJhhAOCvkePaVx3H9JIVuCLbNfI9V65jy5yWHgwLEksadN/PHhtdr+SXoeB1xh9xXI1qAI14xQtAGsVHJcOofYoyCzzM/UvRc2O7pYLq8VRJVwdvdr/ghKxgZHVJM01+Eoi92pFqDWE7B4JiOLZsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vINGI-0006Qj-Bo; Mon, 10 Nov 2025 09:28:30 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vINGI-007zQs-00;
	Mon, 10 Nov 2025 09:28:30 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vINGC-0000000048w-3mgZ;
	Mon, 10 Nov 2025 09:28:24 +0100
Message-ID: <6ec725f916737f2f25bf3ce4df412b4c07f6449e.camel@pengutronix.de>
Subject: Re: [PATCH 2/6] media: staging: media: imx6-mipi-csi2: use
 devm_add_action_or_reset() to simplify code
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Frank Li <Frank.Li@nxp.com>, Steve Longerbeam <slongerbeam@gmail.com>, 
 Mauro Carvalho Chehab	 <mchehab@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team	 <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: imx@lists.linux.dev, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 10 Nov 2025 09:28:24 +0100
In-Reply-To: <20251107-stage-csi2-cleanup-v1-2-5d42535243ac@nxp.com>
References: <20251107-stage-csi2-cleanup-v1-0-5d42535243ac@nxp.com>
	 <20251107-stage-csi2-cleanup-v1-2-5d42535243ac@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+deb13u1 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-staging@lists.linux.dev

On Fr, 2025-11-07 at 15:44 -0500, Frank Li wrote:
> Use devm_add_action_or_reset() to simplify the code. No functional change=
.
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/staging/media/imx/imx6-mipi-csi2.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging=
/media/imx/imx6-mipi-csi2.c
> index 42256441b881d9f132ad7ff899d6f1e35643b4ac..eba9a650030f5e380aa900b94=
728ad375171c6a5 100644
> --- a/drivers/staging/media/imx/imx6-mipi-csi2.c
> +++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
> @@ -716,6 +716,14 @@ static int csi2_async_register(struct csi2_dev *csi2=
)
>  	return ret;
>  }
> =20
> +static void csi2_nf_cleanup(void *data)
> +{
> +	struct csi2_dev *csi2 =3D data;
> +
> +	v4l2_async_nf_unregister(&csi2->notifier);
> +	v4l2_async_nf_cleanup(&csi2->notifier);
> +}
> +
>  static int csi2_probe(struct platform_device *pdev)
>  {
>  	struct csi2_dev *csi2;
> @@ -749,6 +757,10 @@ static int csi2_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
> =20
> +	ret =3D devm_add_action_or_reset(&pdev->dev, csi2_nf_cleanup, csi2);
> +	if (ret)
> +		return ret;
> +
>  	csi2->pllref_clk =3D devm_clk_get(&pdev->dev, "ref");
>  	if (IS_ERR(csi2->pllref_clk)) {
>  		v4l2_err(&csi2->sd, "failed to get pll reference clock\n");
> @@ -800,8 +812,6 @@ static int csi2_probe(struct platform_device *pdev)
>  	return 0;
> =20
>  clean_notifier:
> -	v4l2_async_nf_unregister(&csi2->notifier);
> -	v4l2_async_nf_cleanup(&csi2->notifier);
>  	clk_disable_unprepare(csi2->dphy_clk);
>  pllref_off:
>  	clk_disable_unprepare(csi2->pllref_clk);
> @@ -815,8 +825,6 @@ static void csi2_remove(struct platform_device *pdev)
>  	struct v4l2_subdev *sd =3D platform_get_drvdata(pdev);
>  	struct csi2_dev *csi2 =3D sd_to_dev(sd);
> =20
> -	v4l2_async_nf_unregister(&csi2->notifier);
> -	v4l2_async_nf_cleanup(&csi2->notifier);
>  	v4l2_async_unregister_subdev(sd);

This effectively moves the notifier unregister after the subdev
unregister. Is that safe to do?


regards
Philipp
