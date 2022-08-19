Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176CA17EE
	for <linux-staging@lists.linux.dev>; Fri, 19 Aug 2022 08:57:04 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1oOxoK-00016s-4O; Fri, 19 Aug 2022 10:57:00 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1oOxoI-000g6G-Vf; Fri, 19 Aug 2022 10:56:58 +0200
Received: from pza by lupine with local (Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1oOxoI-0003l2-5I; Fri, 19 Aug 2022 10:56:58 +0200
Message-ID: <b77936e0227d7046fa97433128b56c752dba1fde.camel@pengutronix.de>
Subject: Re: [PATCH] media: imx: Use get_mbus_config instead of parsing
 upstream DT endpoints
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Jacopo Mondi <jacopo@jmondi.org>
Cc: Steve Longerbeam <slongerbeam@gmail.com>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev
Date: Fri, 19 Aug 2022 10:56:58 +0200
In-Reply-To: <20220819080347.wvzb6avyaperfcy2@uno.localdomain>
References: <20220818124253.753080-1-p.zabel@pengutronix.de>
	 <20220819080347.wvzb6avyaperfcy2@uno.localdomain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.38.3-1 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-staging@lists.linux.dev

Hi Jacopo,

On Fr, 2022-08-19 at 10:03 +0200, Jacopo Mondi wrote:
> Hi Philipp
>=20
> On Thu, Aug 18, 2022 at 02:42:53PM +0200, Philipp Zabel wrote:
[...]
> > -static int csi_get_upstream_endpoint(struct csi_priv *priv,
> > -				     struct v4l2_fwnode_endpoint *ep)
> > +static int csi_get_upstream_mbus_config(struct csi_priv *priv,
> > +					struct v4l2_mbus_config *mbus_cfg)
> > =C2=A0{
> > -	struct fwnode_handle *endpoint;
> > -	struct v4l2_subdev *sd;
> > -	struct media_pad *pad;
> > +	struct v4l2_subdev *sd, *remote_sd;
> > +	struct media_pad *remote_pad;
> > +	int ret;
> >=20
> > =C2=A0	if (!IS_ENABLED(CONFIG_OF))
> > =C2=A0		return -ENXIO;
>=20
> Is this still necessary ?

I think not. I will drop it.

> > @@ -206,19 +204,21 @@ static int csi_get_upstream_endpoint(struct csi_p=
riv *priv,
> > =C2=A0	}
> >=20
> > =C2=A0	/* get source pad of entity directly upstream from sd */
> > -	pad =3D imx_media_pipeline_pad(&sd->entity, 0, 0, true);
> > -	if (!pad)
> > -		return -ENODEV;
> > -
> > -	endpoint =3D imx_media_get_pad_fwnode(pad);
> > -	if (IS_ERR(endpoint))
> > -		return PTR_ERR(endpoint);
> > +	remote_pad =3D media_entity_remote_pad_unique(&sd->entity,
> > +						    MEDIA_PAD_FL_SOURCE);
> > +	if (IS_ERR(remote_pad))
> > +		return PTR_ERR(remote_pad);
> >=20
> > -	v4l2_fwnode_endpoint_parse(endpoint, ep);
> > +	remote_sd =3D media_entity_to_v4l2_subdev(remote_pad->entity);
> >=20
> > -	fwnode_handle_put(endpoint);
> > +	ret =3D v4l2_subdev_call(remote_sd, pad, get_mbus_config,
> > +			       remote_pad->index, mbus_cfg);
> > +	if (ret =3D=3D -ENOIOCTLCMD)
> > +		v4l2_err(&priv->sd,
> > +			 "upstream entity %s does not implement get_mbus_config()\n",
> > +			 remote_pad->entity->name);
>=20
> This makes mandatory for the remote to implement .get_mbus_config().
> I think it is fine, even more this is staging, and I don't think you
> can use any meaningful default in case the op is not implemented...

Yes. Many of the relevant drivers already implement this (adv7180,
tc358743, tvp5150), but it's missing from ov5640 and some of the other
ovti drivers.

> > @@ -1254,13 +1246,13 @@ static int csi_enum_mbus_code(struct v4l2_subde=
v *sd,
> > =C2=A0		break;
> > =C2=A0	case CSI_SRC_PAD_DIRECT:
> > =C2=A0	case CSI_SRC_PAD_IDMAC:
> > -		ret =3D csi_get_upstream_endpoint(priv, &upstream_ep);
> > +		ret =3D csi_get_upstream_mbus_config(priv, &mbus_cfg);
> > =C2=A0		if (ret) {
> > =C2=A0			v4l2_err(&priv->sd, "failed to find upstream endpoint\n");
>=20
> Should the error message be updated ?

Indeed, I updated one and forgot about the rest. I'll update them all.

[...]
>=20
>=20
> All minors, with the error messages fixed
> Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Thank you for the review!

regards
Philipp
