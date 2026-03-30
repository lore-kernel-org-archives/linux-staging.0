Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FED3A63F9;
	Mon, 30 Mar 2026 17:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774891511; cv=none; b=eEDw8ZIIHk9v1ggxbP/xd3LQYYOWs5Yfkw69HbnHDyNPyqGO59o9m108NrM7ldsmj3U2f2uSy24d4OKnDYLErPJzT8xPulD+VSWqVS7vJErVrooaq2FdoBKNakVsWg9euoCyLOcQJm9eJJjNHrI9FWYp23Uyxg1aAsQfSh+KUdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774891511; c=relaxed/simple;
	bh=snboJ56/tuu4LInm2uBbEIuuC3OdUBOKGKwi806JEhM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hkYa35CpcfWIds/Sp2sx6ks/k8bCDBbR9kj6G7vnXDuVJdBTBgqYHd+NA3IOIq/a7I/TXVJ9dLDwhBfwLsjMLraTVJ+Cx/WbW+bh6TlpN5U36hHpy/HXkbbv2yzsdfVdSrDvhx+fbiMjT1A2NgYxRRTLUgDkVzOOEe43oGjj8PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=DIByJdXb; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="DIByJdXb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774891508;
	bh=snboJ56/tuu4LInm2uBbEIuuC3OdUBOKGKwi806JEhM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=DIByJdXbo1mAf4Yz/+doITCn2QTvqRJ4cU2Ela+ECvqjqXsWRc81bhXlztRFGsUSa
	 UCLr/naMvJFonDGWOk6DgzZgE96LsmbbddJsb3uryadr6wJu8S+JzNLa9RkThjTUv+
	 tF7HmoYBfYWW1spjwkPa27qTd4Hej/jGd8qiudD+KbdcrLxy1ZzWKDK19wk6yyGgfF
	 9D4CjT/PULF2SlS6cA6okATRoskq6G5tFz7yTg2MjG4/DEtG4E9yg0TSrTb1r5XO0I
	 FIaloKls1XR3wfB9d4cw+oFImd/HIlgfrdsaM7XjiBHcJMOxCRZLTxcEty7kEJi1UN
	 Ih7imzAR03T0Q==
Received: from [IPv6:2606:6d00:15:e06b::c41] (unknown [IPv6:2606:6d00:15:e06b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3BF1B17E4A67;
	Mon, 30 Mar 2026 19:25:06 +0200 (CEST)
Message-ID: <e2051f28f9d94481d42751e5ee766fedacbe862d.camel@collabora.com>
Subject: Re: [PATCH] media: cedrus: skip invalid H.264 reference list entries
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: wens@kernel.org
Cc: Jernej =?UTF-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>, 
	mripard@kernel.org, Pengpeng Hou <pengpeng@iscas.ac.cn>, paulk@sys-base.io,
 	mchehab@kernel.org, gregkh@linuxfoundation.org, samuel@sholland.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Mon, 30 Mar 2026 13:25:03 -0400
In-Reply-To: <CAGb2v65EM1rZwePR2B8Y-ipz4iEJPLnd4jsfu140N9vq4GYL2Q@mail.gmail.com>
References: <20260324080856.56787-1-pengpeng@iscas.ac.cn>
	 <2823210.mvXUDI8C0e@jernej-laptop>
	 <CAGb2v674Ei2uFh6O0LoFoJrPcqGKGr_v+hfvE7TSfwztxDfTAA@mail.gmail.com>
	 <603785eb48d69bc50c0296fc696eb0985c2a3ac5.camel@collabora.com>
	 <CAGb2v65EM1rZwePR2B8Y-ipz4iEJPLnd4jsfu140N9vq4GYL2Q@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-rCSNRuOlNw3r+3Ki2bwA"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-rCSNRuOlNw3r+3Ki2bwA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 31 mars 2026 =C3=A0 00:45 +0800, Chen-Yu Tsai a =C3=A9crit=C2=A0:
> On Mon, Mar 30, 2026 at 11:55=E2=80=AFPM Nicolas Dufresne
> <nicolas.dufresne@collabora.com> wrote:
> >=20
> > Le dimanche 29 mars 2026 =C3=A0 20:44 +0800, Chen-Yu Tsai a =C3=A9crit =
:
> > > On Sun, Mar 29, 2026 at 5:21=E2=80=AFPM Jernej =C5=A0krabec <jernej.s=
krabec@gmail.com> wrote:
> > > >=20
> > > > Dne torek, 24. marec 2026 ob 09:08:56 Srednjeevropski poletni =C4=
=8Das je Pengpeng Hou napisal(a):
> > > > > Cedrus consumes H.264 ref_pic_list0/ref_pic_list1 entries from th=
e
> > > > > stateless slice control and later uses their indices to look up
> > > > > decode->dpb[] in _cedrus_write_ref_list().
> > > > >=20
> > > > > Rejecting such controls in cedrus_try_ctrl() would break existing
> > > > > userspace, since stateless H.264 reference lists may legitimately=
 carry
> > > > > out-of-range indices for missing references. Instead, guard the a=
ctual
> > > > > DPB lookup in Cedrus and skip entries whose indices do not fit th=
e fixed
> > > > > V4L2_H264_NUM_DPB_ENTRIES array.
> > > > >=20
> > > > > This keeps the fix local to the driver use site and avoids out-of=
-bounds
> > > > > reads from malformed or unsupported reference list entries.
> > > > >=20
> > > > > Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> > > >=20
> > > > Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > >=20
> > > Tested-by: Chen-Yu Tsai <wens@kernel.org>
> > >=20
> > > This fixes a KASAN slab-use-after-free warning when running fluster H=
.264
> > > tests.
> >=20
> > Ah, very good, can you cite which test caused that ? I didn't expect fl=
uster to
> > cover cases with missing references. I think it will be handy for futur=
e
> > testing.
>=20
> Looks like it is FM1_BT_B. And it only happens on the first run after reb=
oot,
> or KASAN just only reports it once.

Thanks, its one of the unsupported stream that we didn't find how to detect
ahead of time, and so we try to decode it.

>=20
> BTW, this would be a lot easier to figure out if we could get fluster to
> output a system timestamp for each decode run (at least in single job mod=
e).


Well, that's not magical, they have to trace the same timestamp. An example=
, the
kernel and gstreamer both uses their own uptime, which is of course not hel=
ping
it at all.

>=20
> I had to hack in delays between each decode rune, and then look at `dmesg=
 -w`
> and switching back to the window that has fluster running once the warnin=
g
> triggers.

If all you care is which streams caused what kernel trace, I think the leas=
t
amount of effort is to propose a patch against fluster to syslog the start =
of
tests. Your logger will aggregate. Note that its only going to work for sin=
gle
job run since the kernel error trace don't give enough context to trace bac=
k the
error into the V4L2 FD and back to the owning process.

Nicolas

>=20
>=20
> ChenYu

--=-rCSNRuOlNw3r+3Ki2bwA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCacqx7wAKCRDZQZRRKWBy
9D9kAP4rqAwjlJ5IpkRSTF21dvZZkRhgLMR0Pazn8xtE1zpK6gD9FRpUifG3Vl8w
TyIy5xkzF0vhMRJx0SxIUzYWT/c+dw0=
=FqY8
-----END PGP SIGNATURE-----

--=-rCSNRuOlNw3r+3Ki2bwA--
