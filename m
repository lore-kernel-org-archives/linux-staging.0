Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC9F1376;
	Tue, 15 Feb 2022 10:01:17 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B3FCA240012;
	Tue, 15 Feb 2022 10:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1644919269;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nDkpAMsVWyC4vbiV4Jpk59MCtZ8jwmChy7R2m0dQNcY=;
	b=UY+Xn3qSNrnrQgY1poqUomDjpsECubm9KK+hXagfT6L8LOJGb1MnDRx5qIsvozVpzbgxyC
	LVQwm8sbVcGeju1jUJKUIiduI6ibeXmqpgCxu3HSv6MdQsO3bx5xdDqvV8ESQdYo6BQCPx
	Zq37GNBy6guNvXiZ+37xUWiJD9kJqDVzil+Pb0i9cX049Fp5UzsdxUg+UkfbSo9/Zj2d4N
	Fq1jV+Qd61FBQsQHIjleun4X9dsrQcR5DEPRAHJRCYM3xb3aA7HkNRp+4k0pzcokbjPnHa
	feuh4b+7tfgO7ptP/UDIm+fufb27XGt6462XaC7pNpBldWz1U15AOvgj2VvzXg==
Date: Tue, 15 Feb 2022 11:01:04 +0100
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-staging@lists.linux.dev,
	Yong Deng <yong.deng@magewell.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Hans Verkuil <hans.verkuil@cisco.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Helen Koike <helen.koike@collabora.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 27/66] media: sun6i-csi: Add media ops with link
 notify callback
Message-ID: <Ygt54MQ/Nnaf4F0f@aptenodytes>
References: <20220205185429.2278860-1-paul.kocialkowski@bootlin.com>
 <20220205185429.2278860-28-paul.kocialkowski@bootlin.com>
 <YgqGGJJ0oVQgRoNy@paasikivi.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VkCV1Ya8HCPjEJtx"
Content-Disposition: inline
In-Reply-To: <YgqGGJJ0oVQgRoNy@paasikivi.fi.intel.com>


--VkCV1Ya8HCPjEJtx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

On Mon 14 Feb 22, 18:40, Sakari Ailus wrote:
> Hi Paul,
>=20
> Thanks for the update.
>=20
> On Sat, Feb 05, 2022 at 07:53:50PM +0100, Paul Kocialkowski wrote:
> > In order to keep the power use count fields balanced when link changes
> > happen between v4l2_pipeline_pm_get/set calls (in open/close),
> > the link_notify media operation callback needs to be registered.
> >=20
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > ---
> >  drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >=20
> > diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c b/drive=
rs/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> > index 6f04f86504bf..c8fe31cc38b5 100644
> > --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> > +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> > @@ -23,6 +23,7 @@
> >  #include <linux/sched.h>
> >  #include <linux/sizes.h>
> >  #include <linux/slab.h>
> > +#include <media/v4l2-mc.h>
> > =20
> >  #include "sun6i_csi.h"
> >  #include "sun6i_csi_reg.h"
> > @@ -574,6 +575,12 @@ void sun6i_csi_set_stream(struct sun6i_csi_device =
*csi_dev, bool enable)
> >  			   CSI_CAP_CH0_VCAP_ON);
> >  }
> > =20
> > +/* Media */
> > +
> > +static const struct media_device_ops sun6i_csi_media_ops =3D {
> > +	.link_notify =3D v4l2_pipeline_link_notify,
>=20
> Do you really need this?
>=20
> Drivers should instead rely on runtime PM nowadays.
>=20
> <URL:https://hverkuil.home.xs4all.nl/spec/driver-api/camera-sensor.html#p=
ower-management>

See my remark on the patch adding support for runtime pm.

My understanding is that the callback is required when v4l2_pipeline_pm_get=
/set
is used, to keep the use count balanced (as mentionned in this commit messa=
ge):
<https://hverkuil.home.xs4all.nl/spec/driver-api/v4l2-mc.html#c.v4l2_pipeli=
ne_pm_get>

Cheers,

Paul

> > +};
> > +
> >  /* V4L2 */
> > =20
> >  static int sun6i_csi_link_entity(struct sun6i_csi_device *csi_dev,
> > @@ -683,6 +690,7 @@ static int sun6i_csi_v4l2_setup(struct sun6i_csi_de=
vice *csi_dev)
> >  	snprintf(media_dev->bus_info, sizeof(media_dev->bus_info),
> >  		 "platform:%s", dev_name(dev));
> >  	media_dev->hw_revision =3D 0;
> > +	media_dev->ops =3D &sun6i_csi_media_ops;
> >  	media_dev->dev =3D dev;
> > =20
> >  	media_device_init(media_dev);
>=20
> --=20
> Kind regards,
>=20
> Sakari Ailus

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--VkCV1Ya8HCPjEJtx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmILeeAACgkQ3cLmz3+f
v9FiRggAjzv6FQ/wjR9P00HIcbyQ1TZZ0UlHjWr8fLJ7U9GfXZfxtnoAGCVLCg6i
xqOBPVyMllJ9vVYN1p5XIchdUjpcJr0KPG0pyzoCdmJG1+JXtHmvqCetTLEz7jP2
K9xUAUQM/3Gx5O0nA15ErpTbxstJg+YiTQJUpG0pYPf4oDkvYdZSvkwrQ6AeNBb4
wJt6HpENkhZhm1rrvl0ACWeXCponlUJzkWaVqDVDWvg3R2r3QmwmtfR2y1bLxIyl
jyYgxgah37KURsxIGLAp5qrcPnl32U3XYuUl2axFq1sSxmtFs4gkgtgB7pBS/afE
fAD1yLIVXAVSfF80YLV2pdPB0xpyXw==
=q3wj
-----END PGP SIGNATURE-----

--VkCV1Ya8HCPjEJtx--
