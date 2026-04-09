Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C6C21771B;
	Thu,  9 Apr 2026 13:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775741598; cv=none; b=c4lqR0hlSHtm57Ojl0Vl5vMJn5JydJIMwEqTRgc/1l/8QeEviantiqCsIcqGV6YXQpHESJFHM2Gpw9SfUJQCUgrGDr69PNgbcsiJv0gaFl5XY2hN2FpNcCnvErkf5/DC5EdZXVgLQDuckRTA2C2IIxiyJ8M71l4x1TFET8sX04o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775741598; c=relaxed/simple;
	bh=Vk3pPD/Gc1p88nyH4rzkDAj4Wlf9h7ovPxfYHM4QgZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MuNlQteQ39jum1hHDZPoRcCIpUqKbrObpfI7ZxNNcCG2ogJdHEKg/+GIJzbI7jmmR1+hlO5FESAnco8NRPWYdCP2XvMTjQ6AxEc+5FvD3cGkpFIke5j9rk7dXv95M/oMNtBxNwyToB8DcMYnvYdMs9S6/4K5/HrIx9pg/KI0zlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 9C8F71F8005A;
	Thu,  9 Apr 2026 13:33:11 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 136E0B401AB; Thu,  9 Apr 2026 13:33:10 +0000 (UTC)
X-Spam-Level: 
Received: from shepard (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id E0762B401A5;
	Thu,  9 Apr 2026 13:33:08 +0000 (UTC)
Date: Thu, 9 Apr 2026 15:33:06 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: mripard@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
	wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org,
	nicolas.dufresne@collabora.com, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: cedrus: skip invalid H.264 reference list entries
Message-ID: <adeqkmA9VhaPkSAk@shepard>
References: <20260324080856.56787-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qcME/vMivydd7zm5"
Content-Disposition: inline
In-Reply-To: <20260324080856.56787-1-pengpeng@iscas.ac.cn>


--qcME/vMivydd7zm5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue 24 Mar 26, 16:08, Pengpeng Hou wrote:
> Cedrus consumes H.264 ref_pic_list0/ref_pic_list1 entries from the
> stateless slice control and later uses their indices to look up
> decode->dpb[] in _cedrus_write_ref_list().
>=20
> Rejecting such controls in cedrus_try_ctrl() would break existing
> userspace, since stateless H.264 reference lists may legitimately carry
> out-of-range indices for missing references. Instead, guard the actual
> DPB lookup in Cedrus and skip entries whose indices do not fit the fixed
> V4L2_H264_NUM_DPB_ENTRIES array.

Could you explain why it is legitimate that userspace would pass indices th=
at
are not in the dpb list? As far as I remember from the H.264 spec, the L0/L1
lists are constructed from active references only and the number of items t=
here
should be given by num_ref_idx_l0_active_minus1/num_ref_idx_l1_active_minus=
1.
We can tolerate invalid data beyond these indices, but certainly not as part
of the indices that should be valid.

However I agree that cedrus_try_ctrl is maybe not the right place to check =
it
since I'm not sure we are guaranteed that the slice params control will be
checked before the new DPB (from the same request) is applied, so we might =
end
up checking against the dpb from the previous decode request.

But I think we should error out and not just skip the invalid reference.

All the best,

Paul

>=20
> This keeps the fix local to the driver use site and avoids out-of-bounds
> reads from malformed or unsupported reference list entries.
>=20
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>  drivers/staging/media/sunxi/cedrus/cedrus_h264.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/s=
taging/media/sunxi/cedrus/cedrus_h264.c
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> @@ -210,6 +210,9 @@ static void _cedrus_write_ref_list(struct cedrus_ctx =
*ctx,
>  		u8 dpb_idx;
> =20
>  		dpb_idx =3D ref_list[i].index;
> +		if (dpb_idx >=3D V4L2_H264_NUM_DPB_ENTRIES)
> +			continue;
> +
>  		dpb =3D &decode->dpb[dpb_idx];
> =20
>  		if (!(dpb->flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE))
> --=20
> 2.50.1
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--qcME/vMivydd7zm5
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmnXqpIACgkQhP3B6o/u
lQzEug/+L0i5WTWsYIfonjrs2jQjpLwvRKyR7+XhxwJUfL+txU8E2UXge7nNq3ja
ArsUnJXyjCzhaj1Tot8ptBKjfcSYOjbsFYHeiUIHvHNIm56Q0G1k+801TVEWRcXQ
LwKfkyBAl9HMf4FtR++yMoZ4f90tSJzpQJqjp04pTxQKErxB2S8V3HeW85m7qs/y
tORRrEawCMgs8J/Wn23IAl5j7mJKE9BK4WMasgmTqOG1qmTpw7FzyOR4peCD/pUx
L+QonrV1TRVGR3HW2ICL4Gmmu7utCzdgy7Sy/JN1wMgM1mLIEhIz+YuMmMjUVR+o
/yae3q+Ht3a2L/+nm4fhpElg2AVi/Eo0YpIrdE7TqqmHMxtY5sXllJBZGUHwdr/L
wF2XxBcP7bNx4IfBwkT62iAVxGaag4fzRsYGr3uG3En8i9Oo96p4rD8cDRS1/l8N
3WSYF8oVIG7hkaiqX4drUkqXGkt14HLB8+iNPz8a5cE9WW9CYeYwVJ2IC9F0DEgW
PbAvNDNpaCLdJjNxV0eFdggl0Ipq94xALhjOSFobhOlJjreOqNjLrsKpynsnD5K6
FWAw+Pj/fPDMhZvj8lfW3RW4T6pZ/KTFHzZ9wWjEgCiTbFNtjOxWc2V2CY9Q2YNI
3fDtG+tv1cKs0uLyMdwLLYcyo8BdtoCuTQas99LdqZv4TTKafxU=
=1orP
-----END PGP SIGNATURE-----

--qcME/vMivydd7zm5--
