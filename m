Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com [64.147.123.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31932C80;
	Wed,  9 Feb 2022 09:23:38 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailnew.west.internal (Postfix) with ESMTP id 832362B001FF;
	Wed,  9 Feb 2022 04:23:36 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Wed, 09 Feb 2022 04:23:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; bh=ynnIBDyxddplj0yDy1ftsHwCIVNF26bdpyTej6
	p+4/g=; b=kvvo+EBSJ3tR004LCR4sJSPmSM9GWoMkJaSz/UTAaZ/WPclvitGGoz
	jNm1YpYDJVvBTIYxTkMdab3mTaaivqubtsY1/ecdBPtzYmRSkMVb8puAlZMhrmjZ
	Ipxi8Oq9uCV2ZWwktot+TpGStnzJnPyHJCluj2fz3gnQf4dnAmh036wQANAXxacM
	IPW4TzyCfixYslCMhVrIYcC5G42HyfoH8lOlXMwEHU4yu+CNwAViEZwaKoaHRyyc
	7JhpeE3n+Iqc8XS89f7YjbBZO9fdXefvbjUymatB9hdJK24zdYl0I0NIw7okrpkw
	KRxZ3hUyQ/nAB6m7ibQZ+fHQUSA1hwgw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=ynnIBDyxddplj0yDy
	1ftsHwCIVNF26bdpyTej6p+4/g=; b=TR3ish91hzSufC8jLjr1Iyo1DhoQ4qzBv
	5nd81B7nrZwoT00wAY9RTPibr/rydxHczP1laGwhn48fkjN96RY4cUtlqeNfsoPl
	uhujkGPKV3vh3aLT8/bTQtd+ubv5KnRX0fjaH8S1ljRcNBcdveLbZwK3FNOlTSOB
	KbyjbG3mOIDL0Z9lfLx8TTgbpdAJwQsSjX9WI0YrwDAsmdK+3WQte8sBdEk5FX8N
	+uFRXS3e0stV55KI48Hk2TsILvtjDWlDCY8T1UuTbFsTabtGLXVrn4bgO+GQlsKN
	JB190aDUQoxlDB1GhsEtepoHT4F5sMFZymajfBSDzeKN5bM6VZFxg==
X-ME-Sender: <xms:F4gDYrxCvLtXo2ifHjHR0DYDEl7ucELatEDpEcIVJtq__aNckdAUJA>
    <xme:F4gDYjRuY-hjiDVgSDZ_iaLLk4wUph3ANSWgkF6EBGiYt2ZrPYZx4Oo_ZjNDF0VIE
    ib9tXbWu48MBKLkON4>
X-ME-Received: <xmr:F4gDYlX8qO7DppudciOhz147Q0nhfaqUpzvTejTsEP8olGFzyIgX24f4Mmp03gB6ilISS6mI7Qi0y_Mdp3EGyupOT9CuysslOoP0Pcw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrheelgddtvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
    udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:F4gDYlg65wljSBYqfsTf4Baop9UP5uZvvnV9dQWoeVKrE49Cp9jqJg>
    <xmx:F4gDYtCrQkuzciz5ye4gjCPhH2a9rOS9vG7stD1BNy6tcsFAv99lkg>
    <xmx:F4gDYuKjZjYVcjABNgBdvazdhGfQFYZbUA1NaG8kua1os3eHCBz-NQ>
    <xmx:GIgDYl6pAWJRUjxHsVZ7Zto9bEJUghYLgg1xXcvwtAve-iu-ynj4_IO0zFI>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Feb 2022 04:23:35 -0500 (EST)
Date: Wed, 9 Feb 2022 10:23:33 +0100
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
Subject: Re: [PATCH v2 29/66] media: sun6i-csi: Move csi buffer definition to
 main header file
Message-ID: <20220209092333.76pu7dpimgsz443z@houat>
References: <20220205185429.2278860-1-paul.kocialkowski@bootlin.com>
 <20220205185429.2278860-30-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zs2otepylosvwibr"
Content-Disposition: inline
In-Reply-To: <20220205185429.2278860-30-paul.kocialkowski@bootlin.com>


--zs2otepylosvwibr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 05, 2022 at 07:53:52PM +0100, Paul Kocialkowski wrote:
> The buffer structure is a top-level definition, put it in the main header
> to keep things tidy. No functional change intended.
>=20
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Reviewed-by: Maxime Ripard <maxime@cerno.tech>

Maxime

--zs2otepylosvwibr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYgOIFAAKCRDj7w1vZxhR
xemTAP9H29JYiSyQC8X0RLZBbi6rB8nkBPtKbCCr4GXaSXzuogD/bju3syA/cSSZ
HfH6KHazoj6sNSOVjjf3VxMWJOwBPgo=
=mj5l
-----END PGP SIGNATURE-----

--zs2otepylosvwibr--
