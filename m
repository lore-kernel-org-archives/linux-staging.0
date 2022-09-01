Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0F85C82;
	Thu,  1 Sep 2022 14:57:38 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7C4BE10000D;
	Thu,  1 Sep 2022 14:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1662044250;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fTIPUvR6Kg1MdIRVJEFetX2DVyRFLn/K5hDyVlwXeq0=;
	b=JRf/f31Zr+iQG1WfwUbx+DyE+WxW+UtZdcYuxz9I7irSd6OrLR54AgteN8Wkj6q8jcmVNq
	V1pblHtO0yrZWthBdBFM47U6/NkQN9RBq3+nAmDm8XuB76orr7SrmDQ1PYgccdk5sWvYgT
	MrU92RDReh2z7nApwCvoL8DIG/Now8sTH7K3DDQIJlcYxOWcDu86PLniQoML84J1nY/ghW
	l/auGwgzvdiWGIVi1TVSMYvkwv7vq7WSP8cJsTKL5Eo9CPTftIlutaGgdp8ZbARyC+ZbWr
	2R8lP3eVcnEjAZadjPnzqXlf4bWNNymNvxxuP3sUBHeO32KMiJcIqTlm6M3LPA==
Date: Thu, 1 Sep 2022 16:57:25 +0200
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hans.verkuil@cisco.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 2/6] dt-bindings: media: sun6i-a31-csi: Add ISP output
 port
Message-ID: <YxDIVZALmaIo/Y6X@aptenodytes>
References: <20220826184144.605605-1-paul.kocialkowski@bootlin.com>
 <20220826184144.605605-3-paul.kocialkowski@bootlin.com>
 <YwlJL3umZrVC4FLc@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zak6f8vSQKBH2kPD"
Content-Disposition: inline
In-Reply-To: <YwlJL3umZrVC4FLc@pendragon.ideasonboard.com>


--zak6f8vSQKBH2kPD
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

On Sat 27 Aug 22, 01:29, Laurent Pinchart wrote:
> Hi Paul,
>=20
> Thank you for the patch.

Thanks for the review!

> On Fri, Aug 26, 2022 at 08:41:40PM +0200, Paul Kocialkowski wrote:
> > Some Allwinner devices come with an Image Signal Processor (ISP) that
> > allows processing camera data to produce good-looking images,
> > especially from raw bayer representations.
> >=20
> > The ISP does not have a dedicated capture path: it is fed directly by
> > one of the CSI controllers, which can be selected at run-time.
> >=20
> > Represent this possibility as a graph connection between the CSI
> > controller and the ISP in the device-tree bindings.
> >=20
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > Acked-by: Rob Herring <robh@kernel.org>
> > ---
> >  .../devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml    | 4 ++++
> >  1 file changed, 4 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/media/allwinner,sun6i-a3=
1-csi.yaml b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-cs=
i.yaml
> > index 8551c4a711dc..54eb80e517e3 100644
> > --- a/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.y=
aml
> > +++ b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.y=
aml
> > @@ -73,6 +73,10 @@ properties:
> >          $ref: /schemas/graph.yaml#/properties/port
> >          description: MIPI CSI-2 bridge input port
> > =20
> > +      port@2:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: ISP output port
> > +
>=20
> I'd write "Output port to the ISP" to make it clearer.
>=20
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Agreed, thanks!

Paul

> >      anyOf:
> >        - required:
> >            - port@0
>=20
> --=20
> Regards,
>=20
> Laurent Pinchart

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--zak6f8vSQKBH2kPD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmMQyFUACgkQ3cLmz3+f
v9E72Qf+JUqBNPJxnYRP3CDIdAusEIcEorc/b1N0Hzcfi8xOLVzZL0/cIuaCVt/A
xXngf5KFBW8h8cJJ/wflHMP7PN8e5UPpHTlVMx+EfNzkNeL7gAfHYUh6EmpmS0t1
a+sEDPevYcn36Jnnoi30Pn6rCd0n5ibFC9vKYoDkOaYrfSlGtvUw8ZljQWQwVLWq
jv4mhzj8qCRJQpf7gP8DYckAA2unewY1dsqI5xgEhhgCAjCvrtwsjrYfWYieCfMH
YR1ahUJbG63JgD9SKw6pwkAwGIklv2+ZQ0J40ZtzXby0vAoWUDPawchJWvvXIim8
bsOnx4MaPlqhohaAjEIaxFZ+PSBROw==
=J+Ve
-----END PGP SIGNATURE-----

--zak6f8vSQKBH2kPD--
