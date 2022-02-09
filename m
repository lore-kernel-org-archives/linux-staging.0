Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com [64.147.123.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3C82F25;
	Wed,  9 Feb 2022 09:24:23 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailnew.west.internal (Postfix) with ESMTP id A5BBD2B00092;
	Wed,  9 Feb 2022 04:24:21 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Wed, 09 Feb 2022 04:24:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; bh=r+WHi0R36h9MJU2BZA08FzSXL4WE61GwNPzCwG
	RlIiU=; b=jdkynVt8Z4dVXBoxPsF91bObzh15W0I1gL/kqrI9rX/sI/hFfRX8Dk
	cptu+4xbmlSddxAb4emtuRR4o2OGeWxGp9PEs80HoyZ8rTeaQ0h3BoLnLi9R5tHY
	NyXXR3ecJhZtJP7uLot1t/xqbJ7XwaMwicVAoWboUo2rf9mDbpHNab2y680+0+mb
	DSb9SvneSMV1yWrXSzqbh3Y2O5goPBX22jv+4LjUNtCZs1Z3Dp5CQ98PBIQHgcn3
	KHYHBq8tTztMpcsJwRf8mGuhpn4f12wIfgb6i71Jx1q6+MoKjeUuPM5Po/VoK9x/
	piN+8tdZ2RjDhl/oYN2le6QQzqUHQQsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=r+WHi0R36h9MJU2BZ
	A08FzSXL4WE61GwNPzCwGRlIiU=; b=TQaGFXa5pQ0MGpWqmy3qzElf5g8TvOFJY
	mSdmJA6zMrvgCd63lm9lj3kwQdR3ldPl/in309SqXs/y5yGkVKUoQheJ4t5WfUwf
	/WVWaYjvTgyQvE6a18n43tVikbDHPE2Vd0K0Sy1MT2D4A7mmxlaO8gHRNVVRGV99
	Th5gROo4Nl7igPdbqWQ8mhBDGqTHvQu1Kv5nvdBWF2d7dIu3o8XYB/e9uA7sNjKi
	YxTO8mf3oZ9XwfuTxrh8L0GEjdxYqTqBeoYWMRY/tqK9ADE+QqttnZUSFrBKHtyj
	oijNJRa3YVpZmQvO2PSfe59ooq4QMKH8VmXepBSO1SiNFojPXheEA==
X-ME-Sender: <xms:RIgDYiH8OaEGKA048FXosMiSvf0HFOA6rDhfUxcewWCFao5e5TDArQ>
    <xme:RIgDYjUcmBJNVH_kVtYhKUphQhrFjjKAUlzSrmJGVIKcXm9vqtzXQTavBIIrugKAZ
    9bbAlPtjy0SfJCBX2Q>
X-ME-Received: <xmr:RIgDYsL4V4IeE7bcxpEyK6D-OrTSA6RCFEESSSWOORhCAnEyG4Z8IP5OLFYJUW-vJ2zg1PqBEw3y6BVfdDT_votGP4MKx8V0NzdzuUQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrheelgddtvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
    udenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:RYgDYsGirlyUeHCQINzAZh1zb5RV3T9En_BRcFH3w-ymcZYU5xaVtA>
    <xmx:RYgDYoV2xAD6VVKYIv-i-3_DDg7xbhND6c_T1M230gqtGDrIWctKIg>
    <xmx:RYgDYvOQpO_DW-kkwMefZRIAQyZ3iW6NsIKdYFtlV6iHL7o7b_W2AA>
    <xmx:RYgDYvP0C5oZwFBS5GbgomnuUxHv3IES5_J7f4_WSoHXAUVp1vLrwZiTKb8>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Feb 2022 04:24:20 -0500 (EST)
Date: Wed, 9 Feb 2022 10:24:19 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
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
Subject: Re: [PATCH v2 30/66] media: sun6i-csi: Add bridge v4l2 subdev with
 port management
Message-ID: <20220209092419.i3kver4f2am7mnow@houat>
References: <20220205185429.2278860-1-paul.kocialkowski@bootlin.com>
 <20220205185429.2278860-31-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="g7zgo7b3vyccwkg3"
Content-Disposition: inline
In-Reply-To: <20220205185429.2278860-31-paul.kocialkowski@bootlin.com>


--g7zgo7b3vyccwkg3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 05, 2022 at 07:53:53PM +0100, Paul Kocialkowski wrote:
> Introduce a bridge v4l2 subdev to prepare for separation between the
> processing part (bridge) and the dma engine, which is required to
> properly support ths isp workflow later on.
>=20
> Currently the bridge just manages fwnode mapping to media pads,
> using an async notifier (which was previously in the main code).
> The s_stream video op just forwards to the connected v4l2 subdev
> (sensor or MIPI CSI-2 bridge).
>=20
> The video capture device is now registered after the bridge and
> attaches to it with a media link.
>=20
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

There's a bunch of checkpatch --strict warnings that need to be fixed

Maxime

--g7zgo7b3vyccwkg3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYgOIQwAKCRDj7w1vZxhR
xUGrAP9MfsAjtas6E+7vA9TK2tBtzcbdwELvIFIyyBZWy0dc4QD+IswKSRQieQXt
DCSL3vcIVMqHg/e27Rl4TkrPKnfZmQc=
=Lx4Q
-----END PGP SIGNATURE-----

--g7zgo7b3vyccwkg3--
