Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1667A;
	Tue, 19 Apr 2022 13:35:50 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 5DFB2E0014;
	Tue, 19 Apr 2022 13:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1650375343;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n2gXfB12UETk/0YkCHJoIk+2+NcrnNVkqApXWSoKx1A=;
	b=GEuJKEtyxj2/+YziJQOOA+FTzEB5IngtS596j1m9yXkig3BMgyV7ahEYVrhAumjrKgoSXy
	5IrTcokHfYXTkkA2yQUOeAm8/xbI0jFpxqd8ROjKpubNqK7o9y3zO+5qNuHLwKXhyNfg9N
	OL6aS0p0xJ9NfYLfQlsehG9UGUeAAP8gXoozWzEIW7X/5AKCWmW9bJyP9rgAkGcDkupTBt
	Apf57pUrZj6TaIhntYLJw0aSqzVaT2hr1SiSRdJ9tsqydxkxIS+Q6z/FKOZkLCApOzGZ1R
	DzQw2lDfwVH+RYDaBigDB+dpAwq1D4XPxru9ZntK8wqTsLuLR/nYH+bi32gaTg==
Date: Tue, 19 Apr 2022 15:35:40 +0200
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hans.verkuil@cisco.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 2/4] dt-bindings: media: sun6i-a31-csi: Add ISP output
 port
Message-ID: <Yl66rM5DRlp9ZLc1@aptenodytes>
References: <20220415153708.637804-1-paul.kocialkowski@bootlin.com>
 <20220415153708.637804-3-paul.kocialkowski@bootlin.com>
 <Yl60TLYX+Cgkvb00@robh.at.kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ARCMrhh6iwx1/baF"
Content-Disposition: inline
In-Reply-To: <Yl60TLYX+Cgkvb00@robh.at.kernel.org>


--ARCMrhh6iwx1/baF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Tue 19 Apr 22, 08:08, Rob Herring wrote:
> On Fri, Apr 15, 2022 at 05:37:06PM +0200, Paul Kocialkowski wrote:
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
> > ---
> >  .../bindings/media/allwinner,sun6i-a31-csi.yaml    | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/media/allwinner,sun6i-a3=
1-csi.yaml b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-cs=
i.yaml
> > index 53aa6dbe8e2c..1b41a6008195 100644
> > --- a/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.y=
aml
> > +++ b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.y=
aml
> > @@ -87,6 +87,20 @@ properties:
> > =20
> >          additionalProperties: false
> > =20
> > +      port@2:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
>=20
> If there are not any custom properties, then use=20
> '/schemas/graph.yaml#/properties/port' and drop the 'properties' below.

That's right, nothing specific about it. It just represents an internal
FIFO between the different blocks.

Thanks, I think this also applies to a number of other bindings I submitted
in these series.

Paul

> > +        description: ISP output port
> > +
> > +        properties:
> > +          reg:
> > +            const: 2
> > +
> > +          endpoint:
> > +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
> > +            unevaluatedProperties: false
> > +
> > +        additionalProperties: false
> > +
> >      anyOf:
> >        - required:
> >            - port@0
> > --=20
> > 2.35.2
> >=20
> >=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--ARCMrhh6iwx1/baF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmJeuqwACgkQ3cLmz3+f
v9HqMggAmP/958OcmYqTH1jIFaa7MSn0NwtiZYpWsEdszQdFikJbEDrDmOzM0GMQ
VPGG4kmVyjpEt/E71a7P7SSmPn6Az7NzuUqmKWXqSZdddA1unOXpwJMH2cadG5Lu
TUgb/fw0or93UOmr9yriT2aOq4RHcPt1kPVnnK8jg3KOlph60MuxdQsqiR/mMr1W
5YYVbyQTJxqVB6ldyy+y8vkA3GDIMEO6Lqef5ishLQTvlcjNanNlNxThXtShm28l
BfE+eWclHe/vdCVRvxmEW2eG4NhE0ndLbPsHUEUPmt861JA5QTYykA49n7sBWmZp
GxX55AcFR6KBxiJ6qv4/iQRpcL4iYg==
=Jy+S
-----END PGP SIGNATURE-----

--ARCMrhh6iwx1/baF--
