Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7AE3C0635;
	Thu,  9 Apr 2026 14:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775745103; cv=none; b=qawoMZHOcT+LykFvsqboN9B16PUYpYTvgSphNcNk4eJKD1x4JLOM2KRpBOb825CUvmTDaroaQDsApOcWwSXKeKMA4Kwj1PtF1uvz8D14EYQ4A5cijQF7n7bd5RXPPfTxFg4itjmvDjhpJJ1KlX/apPRIeFasXUlEnKCJbKqIWa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775745103; c=relaxed/simple;
	bh=P/YfQOtwjLOP/lcGW8lJlKyL1A/iEGQcOkauFWYi2Xg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oPUpTvCPiBnQ1OkKMpvAPR0sR5/YZ2/3sJqqltifZ3Bp0nCW6bBzUbq+wcFu8MgEn9UdJhfSbvyHjhyK8dsmQE91dZdie7h3UVHpxyqY2royDBzVzLWp8w3/9UKVa7sDWDmI+t5aOcoAJmm+2aDEV+nxk7SSXWY66wKn9nmt3pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 8B0081F8005C;
	Thu,  9 Apr 2026 14:31:34 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id AE554B401BA; Thu,  9 Apr 2026 14:31:32 +0000 (UTC)
X-Spam-Level: 
Received: from shepard (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 2976AB401B3;
	Thu,  9 Apr 2026 14:31:31 +0000 (UTC)
Date: Thu, 9 Apr 2026 16:31:29 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>, mripard@kernel.org,
	mchehab@kernel.org, gregkh@linuxfoundation.org, wens@kernel.org,
	jernej.skrabec@gmail.com, samuel@sholland.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: cedrus: skip invalid H.264 reference list entries
Message-ID: <ade4Qe4OS04au2Ba@shepard>
References: <20260324080856.56787-1-pengpeng@iscas.ac.cn>
 <adeqkmA9VhaPkSAk@shepard>
 <4bd5d70a6144f3e8d4356c182f314cf735f1921c.camel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LUVlA+KHkNw9pXHz"
Content-Disposition: inline
In-Reply-To: <4bd5d70a6144f3e8d4356c182f314cf735f1921c.camel@collabora.com>


--LUVlA+KHkNw9pXHz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Nicolas,

On Thu 09 Apr 26, 10:00, Nicolas Dufresne wrote:
> Le jeudi 09 avril 2026 =C3=A0 15:33 +0200, Paul Kocialkowski a =C3=A9crit=
=C2=A0:
> > Hi,
> >=20
> > On Tue 24 Mar 26, 16:08, Pengpeng Hou wrote:
> > > Cedrus consumes H.264 ref_pic_list0/ref_pic_list1 entries from the
> > > stateless slice control and later uses their indices to look up
> > > decode->dpb[] in _cedrus_write_ref_list().
> > >=20
> > > Rejecting such controls in cedrus_try_ctrl() would break existing
> > > userspace, since stateless H.264 reference lists may legitimately car=
ry
> > > out-of-range indices for missing references. Instead, guard the actual
> > > DPB lookup in Cedrus and skip entries whose indices do not fit the fi=
xed
> > > V4L2_H264_NUM_DPB_ENTRIES array.
> >=20
> > Could you explain why it is legitimate that userspace would pass indice=
s that
> > are not in the dpb list? As far as I remember from the H.264 spec, the =
L0/L1
> > lists are constructed from active references only and the number of ite=
ms
> > there
> > should be given by num_ref_idx_l0_active_minus1/num_ref_idx_l1_active_m=
inus1.
> > We can tolerate invalid data beyond these indices, but certainly not as=
 part
> > of the indices that should be valid.
> >=20
> > However I agree that cedrus_try_ctrl is maybe not the right place to ch=
eck it
> > since I'm not sure we are guaranteed that the slice params control will=
 be
> > checked before the new DPB (from the same request) is applied, so we mi=
ght end
> > up checking against the dpb from the previous decode request.
> >=20
> > But I think we should error out and not just skip the invalid reference.
>=20
> Its been a long time I haven't looked into this. But what happens here is=
 that
> once you lost a reference, the userspace DPB will hold a gap picture, whi=
ch as
> no backing storage. Since it has no backing storage, there is no cookie
> (timestamp) associated with it. This gap picture will still make it to the
> reference lists, since the position of the reference in the list is impor=
tant
> (you cannot just remove an item). It is an established practice in usersp=
ace to
> simply fill the void with an invalid index, typically 0xff, which is alwa=
ys
> invalid. Because that's what some userspace do, it became part of our ABI.

Right we definitely need to keep the order of the L0/L1 lists even with mis=
sing
references and the question is whether the hardware can deal with it or not.

Our uAPI specification currently doesn't say anything about handling missing
references. I'm generally not very keen on considering that undefined behav=
ior
becomes de-facto uAPI that should never be broken, because there are cases =
where
it is obviously incorrect and the fact that it didn't fail previously is the
result of a bug in the implementation.

But in this situation I agree we do need a way to indicate that references =
are
missing and using 0xff sounds like a good plan to me, given that we provide=
 a
uAPI header define with this value and that the doc mentions it.

> Decoders are expected be fault tolerant, though the tolerance level is ha=
rdware
> specific, and so failing in the common code would be inappropriate (faili=
ng in
> Cedrus could be acceptable, assuming it can't work with missing reference=
s,
> which the implementation seems to be fine with).

Okay I agree that we should not fail in common code and tolerate a value to
indicate a missing reference.

What the current proposal is doing (skipping the reference) results in the
SRAM entry for the reference remaining untouched, which will keep its value
=66rom the previous frame. This seems clearly incorrect.

> Hantro G1 notably have a flag to report missing reference to the HW, and =
it will
> manage concealement internally. G2/RKVDEC don't, and we try and pick the =
most
> recent frame as a replacement backing storage, which most of the time min=
imises
> the damages.

It sounds like an approach that could work for cedrus too.

> As future refinement, we need drivers in the long term to properly report=
 the
> damages (perhaps through additional RO request controls). As discussed fe=
w years
> ago in the error handling wip for rkvdec, the V4L2 doc specify that any s=
ort of
> damages known to exist in a frame shall results in the ERROR flag being s=
et. We
> can deduce that the error flag with a payload of 0 indicates to userspace=
 to not
> use the frame (which typically happen on hard errors, or errror at entropy
> decode staged) and ERROR flag with a correct payload signal some level of
> corruption, and its left to the application to decide what to do.

I think it make sense yes, but it would be good to document it in the uAPI
document too.

All the best,

Paul

> Nicolas
>=20
> >=20
> > All the best,
> >=20
> > Paul
> >=20
> > >=20
> > > This keeps the fix local to the driver use site and avoids out-of-bou=
nds
> > > reads from malformed or unsupported reference list entries.
> > >=20
> > > Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> > > ---
> > > =C2=A0drivers/staging/media/sunxi/cedrus/cedrus_h264.c | 3 +++
> > > =C2=A01 file changed, 3 insertions(+)
> > >=20
> > > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > > b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > > --- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > > @@ -210,6 +210,9 @@ static void _cedrus_write_ref_list(struct cedrus_=
ctx
> > > *ctx,
> > > =C2=A0		u8 dpb_idx;
> > > =C2=A0
> > > =C2=A0		dpb_idx =3D ref_list[i].index;
> > > +		if (dpb_idx >=3D V4L2_H264_NUM_DPB_ENTRIES)
> > > +			continue;
> > > +
> > > =C2=A0		dpb =3D &decode->dpb[dpb_idx];
> > > =C2=A0
> > > =C2=A0		if (!(dpb->flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE))
> > > --=20
> > > 2.50.1
> > >=20



--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--LUVlA+KHkNw9pXHz
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmnXuEEACgkQhP3B6o/u
lQx37RAAjcuV3N9iurEZViUlvh0HCe+Uf8aIugIBVA027PVD70pQ8gUeJ3uaWmNx
4iFHr7M9T2VxVcIdoDXcgUrw/6ptYmi6bXtPhTt2Ktm8gy1p7uR6PIRmSk+qAkWj
6NSsZuSNWp2BomyP337Kl9/dj4M6txYnLx4kjJl2fbPLlPxndnWFf1GpSmlPFUeT
fttZ4aJHRnEElrtZ7bzOqCgvtSd5TDGjbzjfaJV5cvAx6iDKHCj7uHHBxdTKUrGa
fZ1+mPFmRHo+N1EeICtR6wPAtL3mHAvAKLYopX9Sz8uwy0ilci/3IJQ/iAun7p+W
PWAH+8h31CI2pYWst6XZPa/diBMEMpKN85Igt24U6L7RQk/jTJTTBcB7HST5rCI8
JSXnQx4gcmY+J3B3ysGUX0UTYoAAXYEWHTAX65PGMOvFLnNGEASdzjQ1tYrphFkL
RfxdUmOudot0gONj/zIxJ+q7L1UJP/GSRAeVVu/y6yjSmv/gBK6H5zCqCHgbdf4j
T3PNaCrDRVjilSlcHJQIi8UVBCg5lkObO1pqQ1UuHDA/+eq1zzZM6JEXjds5MoVX
Y3PZhJGaTPAz4Jb4xdQ6xyEwuMwVX0Uu+06usTtw9aylL8LgmKicqWHu9cE1Uv/R
c/nlwWXgjtUM7h1SN5A/l/XzJhuSbIxPXls+W+p+jYn63fVACyo=
=qfUh
-----END PGP SIGNATURE-----

--LUVlA+KHkNw9pXHz--
