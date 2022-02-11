Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4112F23;
	Fri, 11 Feb 2022 15:17:34 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E31931C0010;
	Fri, 11 Feb 2022 15:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1644592646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VXF0Q98TnY0VF6LJAgT1z6iuK0gMwIZwwneiqBq9XCk=;
	b=G8KjfCt1YjfMmLzINgPygwXjdiDJuTBXGcWdih6FT3BH8KxHmLHoIySqIwrDwRTnJqFzrH
	CI8LuS6bc5QZYy6LUti6DoVkMDbGujFz2h5EusKBgKQ8fdsJQd/CesNJIXQMkXP0sOSsMc
	Gqk0pXSP1BufwkzJbeQlNiQSB9QGEjEd6i3c7x151zt8HSGGhlotI0wxsr2ZlCWArCjgRu
	VcldH6O2ZkPYE47GF7YdHqeLsoQownp3RBGOPZkpCX/Yidwzj3adVOOiVhqBY+/xPGeW3s
	rbK9hv/QMEfMZwR0u+MwX0ZefOVSbjnSmfKE/CgcmmvB8Y6JcGFBcvpw1S72lw==
Date: Fri, 11 Feb 2022 16:17:22 +0100
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Maxime Ripard <maxime@cerno.tech>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-staging@lists.linux.dev,
	Yong Deng <yong.deng@magewell.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hans.verkuil@cisco.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Helen Koike <helen.koike@collabora.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 33/66] media: sun6i-csi: Rework register definitions,
 invert misleading fields
Message-ID: <YgZ+AgGD4n1ELpcA@aptenodytes>
References: <20220205185429.2278860-1-paul.kocialkowski@bootlin.com>
 <20220205185429.2278860-34-paul.kocialkowski@bootlin.com>
 <20220209093945.uertj7wut72tximz@houat>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nAZiK7IJGde0Oma+"
Content-Disposition: inline
In-Reply-To: <20220209093945.uertj7wut72tximz@houat>


--nAZiK7IJGde0Oma+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed 09 Feb 22, 10:39, Maxime Ripard wrote:
> On Sat, Feb 05, 2022 at 07:53:56PM +0100, Paul Kocialkowski wrote:
> > This cleans up the register definitions a bit, adds a prefix, remove ma=
sks.
> > Registers are now fully defined, some additional fields were added when
> > needed. New format definitions are added for future use.
> >=20
> > Some fields are wrongly defined (inverted) in Allwinner litterature
> > (e.g. field vs frame prefixes), which is quite misleading. They are
> > now corrected to reflect their actual behavior.
>=20
> How was it tested?
>=20
> In particular, see
> https://lore.kernel.org/all/20180305093535.11801-7-maxime.ripard@bootlin.=
com/

No oscilloscope testing on my side to investigate the matter in depth,
so the polarities inversion is based on what you changed in the driver.

The idea is to change the register definitions to match what the hardware
appears to be doing (based on your good look at the oscilloscope) to avoid
the confusion of setting register fields that look contradictory.
It's just a rename and the behavior remains the same.

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--nAZiK7IJGde0Oma+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmIGfgIACgkQ3cLmz3+f
v9EnTAgAhApdzmVhN+9E++U4/kVhkozTecPPIQB7VC2eBNFFzHUCTDxUeNLba3bZ
xSc4Hhkj5k1i34BXCJQr7fn4EJ65pEiT4cwzC66oPzS+xsEtguAiOPAWfRKPACdv
PXhdORHKu5tYfhCHuUcT4OOe+Bq5ug0sERvnkpeMvxmVOHmheguf1USya8NKz0DS
xKGn4Y8//yY1h3Ho2We4t9aTCG6W1MnpW5N45tb8vAK2y0+cOsObQvSRfEDkPvyA
BfE7zj7LWmdXO3KPEqycnULT0NtLKYzH7Qqj4bMxZYnNxSCq8k8rXbNUd0d+A3AF
NIXeKTJBhwrrsnAvBfNFkLSFfGS6tQ==
=dcHQ
-----END PGP SIGNATURE-----

--nAZiK7IJGde0Oma+--
