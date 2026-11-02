Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793646704;
	b=edehj7xADXcQFpwGYimOC3RkYrO3sObI9XDGWwZUFNQornQnMMYffXn8Smfe2BqGBMS4
	 CS65lqE3bCVK2kqSNXvjQBlqawP+QIgZhvEzLs/grdlXoobZU6TLjB9NyTmOMnkYi9BCH
	 KkXzoZF/tS4nTRx187GE2eIBI7t1i5Ch254ziuNrBMPWYAAVdLboCDKZYV46f42g+U5I5
	 QHMJ03pf7KOZ2NQVJ/D14BMnZmTebpyxE91NndmB8NpYl4o7dLHvuZLd4xlGDM5zJ6s6r
	 Gv4WfX9z1ffj4q3UhApWiBtp1p56BtkHP9a+UIMZcTGIfGVwqsWobQu7s/oLJB1pwaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793646704;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=8m+OLwIKwAxl3Yo6BqrrXG2lnGq3krn0gCAbeNdSwA4=;
	b=WdwTLlHi6eKjtcxQk94HrQX6Lc7mtgDBIAxXgxt7UxQSGb7gY9kL5J5Hh543tYNo43za
	 tcbj2fDX4Dr4yOTLgZhubGuzGNrg5tynvyPGo261XtACTSZ2bAEcuVYX9gZUY8pevRy0r
	 81iODSCgekMWznETdcKZYymxo4Xz7i2Ne3U6DEWl7KPqf+LTKk6qce7RXutTK7fWphbcN
	 qht/Z+pAjCvsrZN8m2sMDA6RpG3iXlTuL8lHWXOoiFJQ25zjQ19f/fAvIeiH04eTTVUuY
	 0nywp1i5VomraSPqwtjIrKhPKo+T3UF+ZUFqiJdTd9FMr8Q2H3A4diq6ssdvxf43Mkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Rj6zrNE8;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0857E606A327;
	Mon,  2 Nov 2026 19:11:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0857E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Rj6zrNE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793646702;
	bh=2bw38SQHViussxJIXbLBvs1V6mhhWBzXS42chSu9hbg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Rj6zrNE8SU70J8ewdYtM4VrWPT9hQxqzjmxcuSeGZ+l0beXmDEd2xjIX+cOjjqeoc
	 sO7RBKOT+Ner5TIs23e+rDJ+H9PsWC6DcrA+DxFyUUWrrYH0ktRc0PtHVUHud2ftUQ
	 6fYTCorb4W8MOcnEKGsIK8/d4qJlhOQBH8AA1igatDPHVFJebBJuBTB/oB4/d1fel8
	 WtyvWluU/a/40kc5R8ba/GBN9OfCFJcokx/v8KORLv7MtIh3xBCXruoyQiNhwp2ofL
	 c9bgEAudToAZ2Uu573DljoqF9N1Y+qmRpqUMnv/eh8mSwzwsZY0Xv8ZXKNVZp9mOU+
	 BN3ksVxQZmGsQ==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7A3BD17E003A;
	Mon, 02 Nov 2026 20:11:40 +0100 (CET)
Message-ID: <e3de9fb175ea02f6b49fd8bd2e173f04823fd17b.camel@collabora.com>
Subject: Re: [PATCH 08/10] staging: media: cedrus: vp8: use the vendor
 probability table size
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski
 <paulk@sys-base.io>,  Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Mon, 02 Nov 2026 14:11:39 -0500
In-Reply-To: <20261102170303.1973892-9-jernej.skrabec@gmail.com>
References: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
	 <20261102170303.1973892-9-jernej.skrabec@gmail.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-4+OrXPDXnu6jqB54Yvxz"
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0


--=-4+OrXPDXnu6jqB54Yvxz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le lundi 02 novembre 2026 =C3=A0 18:03 +0100, Jernej Skrabec a =C3=A9crit=
=C2=A0:
> The driver allocates the VP8 probability table with 0x2400 bytes, which
> is the size the old Allwinner A10 library uses. All newer vendor
> libraries allocate 0x5400 bytes and never write the area past 0x11b0
> from the CPU. The hardware uses that area as scratch space, most likely
> for the segment map, and its usage grows with the frame size: a
> 3840x2160 stream makes the hardware access memory past 0x2400 and
> causes IOMMU page faults.
>=20
> Allocate the table with 0x5400 bytes, like the vendor libraries do.
>=20
> Fixes: 3c39a16d30d8 ("media: cedrus: Add support for VP8 decoding")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/staging/media/sunxi/cedrus/cedrus_vp8.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c b/drivers/st=
aging/media/sunxi/cedrus/cedrus_vp8.c
> index 969677a3bbf9..6b00efa77c22 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
> @@ -25,7 +25,7 @@
>  #include "cedrus_hw.h"
>  #include "cedrus_regs.h"
> =20
> -#define CEDRUS_ENTROPY_PROBS_SIZE 0x2400
> +#define CEDRUS_ENTROPY_PROBS_SIZE 0x5400
>  #define VP8_PROB_HALF 128
>  #define QUANT_DELTA_COUNT 5
> =20

--=-4+OrXPDXnu6jqB54Yvxz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaujgawAKCRDZQZRRKWBy
9AI/AQCxJz9EnnPrAIoA5yNTvO9ljlCZI3TJthPIfdHbuGic4AD+JHTwuW9a6dOj
gPGEjbipn75MeJAFopj4V59Bk7om7A4=
=JMmO
-----END PGP SIGNATURE-----

--=-4+OrXPDXnu6jqB54Yvxz--
