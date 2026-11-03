Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793731162;
	b=HiBhmWpDVYRCOxR6EbuVi0eX7SKzCxy8eU95E27ePKCt84wINTSftlmfOyPxN1q74gY8
	 YcTkUJQ2hLyeCE9Qx9FAOz6KQ1DxtDHaip3MEoetl6giHLgAVOCyOCuNFcel6JpyFtwzr
	 yRmCv0/finpFBTPmBLpWPNF8IwlztFNG/VLTrsx89tQgA7ff09yqt9HDhxMMminp/j4+H
	 E/iWb+zzUiazFDOrus5j8wSf1OMWgWOHs0GAnSidrLdoy5X1o+c6mi5hoQ61g9Eta78hZ
	 OWQJK1qRWfARwpyPgjr1OUoCMzX6qBYI0IZcQUDFmsPnKERT+4Oz/rOhkvlLARihYRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793731162;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=fMJ5+/syPNsycgszjeQz+Dfq+eBdUioDgcU3E8qF97M=;
	b=kpSGv33SiUlMZCLN2G9PB9jDSTWigqYFAof2lque559XWfYfzoOEHqWa0+MZxqGuHlGw
	 VE6bLViqhQJ+Lh2anlwYZvPaDOD0gvWDVRHzrV4VxiPfsEDhS/71OSqd6fa92x4OifoPK
	 8EwFMVvDqbFM5AdMDaJ6puc8R87X5Ccr2eis9vMjP8P8BDKdk4r/PJKVJQJ9noXSxITMm
	 N+fnLbl3G21rq+lUnkmC2qkiwYfRvaGRYBHvOtHHMHefpM90p0mNlmYMhlb6UTi2KHd+5
	 uFv7CnsFu3qg1ZOdotDYhCu8rICFQy7FS2yi0Ih2XQRWkaWtJknSf13N/Tikg61NPNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=WAGisDgc;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B96606A333;
	Tue,  3 Nov 2026 18:39:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4B96606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=WAGisDgc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793731160;
	bh=SddPWJ3RxZPOXnGWNXHvie9IBIx0aAYAtlCLCEHvlbY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=WAGisDgciIi6wkoaN3ptsY0BHM1UYJ1es6fbh3ONSjiMc60cURniLExL1cBbCZ57M
	 XriuMufgxmnS4Fnht0OV9eh5LTqksdtPyZzdLpH9RvOmRD73Y6etNTl5g1Vdp+m4YN
	 nBHXRVGwbhQ8eGESPTdGMWotxbhy1b69sllnGatYXw9UVryD/00J7IGCO5Q66EfHx7
	 gcc2Ot0cPjB+oFRShok6QCi3NcFv3yGmDmqeq5LsRXZYU3nnRRGrW9P5VS+sum7Sl2
	 OuUOfBS+6asFL+gRAxW9mClJiS9sgC8kyNULM+STb+UyO+67jJVOBdZN+gAcBZlV+1
	 walO1nR4xnn8g==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B031317E0DFF;
	Tue, 03 Nov 2026 19:39:18 +0100 (CET)
Message-ID: <0ea4459f8f4d9cc274c58c5ab00b4952fce59c35.camel@collabora.com>
Subject: Re: [PATCH 03/10] staging: media: cedrus: h264: mark long-term
 references in the frame info
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Jernej =?UTF-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski
 <paulk@sys-base.io>,  Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Tue, 03 Nov 2026 13:39:17 -0500
In-Reply-To: <zYI0QcxKSEeu6sHIbu0-3w@gmail.com>
References: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
	 <20261102170303.1973892-4-jernej.skrabec@gmail.com>
	 <29e72b15007592f98dd000f5f62a85367c590347.camel@collabora.com>
	 <zYI0QcxKSEeu6sHIbu0-3w@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-4o970CQPk1yDQhl/dEtr"
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


--=-4o970CQPk1yDQhl/dEtr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 03 novembre 2026 =C3=A0 19:06 +0100, Jernej =C5=A0krabec a =C3=A9c=
rit=C2=A0:
> Dne ponedeljek, 2. november 2026 ob 19:50:44 Srednjeevropski standardni =
=C4=8Das je Nicolas Dufresne napisal(a):
> > Hi,
> >=20
> > Le lundi 02 novembre 2026 =C3=A0 18:02 +0100, Jernej Skrabec a =C3=A9cr=
it :
> > > The frame info of a reference has a reference type for each field, in
> > > bits 1:0 for the top field and 5:4 for the bottom one, which is 1 for=
 a
> > > long-term reference. The driver never sets it, so the hardware handle=
s
> > > long-term references like short-term ones, also where they differ, li=
ke
> > > in temporal direct and implicit weighted prediction. The vendor libra=
ry
> > > sets it.
> > >=20
> > > This fixes MR8_BT_B and MR9_BT_B of the H.264 conformance suite.
> > >=20
> > > Fixes: 6eb9b758e307 ("media: cedrus: Add H264 decoding support")
> > > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > > ---
> > >  drivers/staging/media/sunxi/cedrus/cedrus_h264.c | 12 +++++++++++-
> > >  drivers/staging/media/sunxi/cedrus/cedrus_regs.h |  8 ++++++++
> > >  2 files changed, 19 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drive=
rs/staging/media/sunxi/cedrus/cedrus_h264.c
> > > index 892193c12b2f..a716955655f7 100644
> > > --- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > > @@ -69,13 +69,21 @@ static void cedrus_fill_ref_pic(struct cedrus_ctx=
 *ctx,
> > >  				struct cedrus_buffer *buf,
> > >  				unsigned int top_field_order_cnt,
> > >  				unsigned int bottom_field_order_cnt,
> > > +				bool long_term,
> > >  				struct cedrus_h264_sram_ref_pic *pic)
> > >  {
> > >  	struct vb2_buffer *vbuf =3D &buf->m2m_buf.vb.vb2_buf;
> > > +	u32 frame_info, ref_type;
> > > =20
> > >  	pic->top_field_order_cnt =3D cpu_to_le32(top_field_order_cnt);
> > >  	pic->bottom_field_order_cnt =3D cpu_to_le32(bottom_field_order_cnt)=
;
> > > -	pic->frame_info =3D cpu_to_le32(buf->codec.h264.pic_type << 8);
> > > +
> > > +	ref_type =3D long_term ? VE_H264_FRAME_INFO_REF_TYPE_LONG_TERM :
> > > +			       VE_H264_FRAME_INFO_REF_TYPE_SHORT_TERM;
> > > +	frame_info =3D VE_H264_FRAME_INFO_TOP_REF_TYPE(ref_type) |
> > > +		     VE_H264_FRAME_INFO_BOT_REF_TYPE(ref_type) |
> > > +		     VE_H264_FRAME_INFO_PIC_TYPE(buf->codec.h264.pic_type);
> > > +	pic->frame_info =3D cpu_to_le32(frame_info);
> > > =20
> > >  	pic->luma_ptr =3D cpu_to_le32(cedrus_buf_addr(vbuf, &ctx->dst_fmt, =
0));
> > >  	pic->chroma_ptr =3D cpu_to_le32(cedrus_buf_addr(vbuf, &ctx->dst_fmt=
, 1));
> > > @@ -128,6 +136,7 @@ static int cedrus_write_frame_list(struct cedrus_=
ctx *ctx,
> > >  		cedrus_fill_ref_pic(ctx, cedrus_buf,
> > >  				    dpb->top_field_order_cnt,
> > >  				    dpb->bottom_field_order_cnt,
> > > +				    dpb->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM,
> > >  				    &pic_list[position]);
> > >  	}
> > > =20
> > > @@ -174,6 +183,7 @@ static int cedrus_write_frame_list(struct cedrus_=
ctx *ctx,
> > >  	cedrus_fill_ref_pic(ctx, output_buf,
> > >  			    decode->top_field_order_cnt,
> > >  			    decode->bottom_field_order_cnt,
> > > +			    false,
> >=20
> > nit: Not a hard objection, but I really hate boolean parameters. It cou=
ld be a
> > simple as:
> >=20
> > +			    false, /* short term reference */
> >=20
> > Or using an enum. My preference being documented here, its yours to dec=
ide.
>=20
> I'll use VE_H264_FRAME_INFO_REF_TYPE_* as parameter. I have to fix sashik=
o
> issue anyway.
>=20
> I'll keep your Reviewed-by, unless you object.

wfm

>=20
> Best regards,
> Jernej
>=20
> >=20
> > Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> >=20
> > >  			    &pic_list[position]);
> > > =20
> > >  	cedrus_h264_write_sram(dev, CEDRUS_SRAM_H264_FRAMEBUFFER_LIST,
> > > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h b/drive=
rs/staging/media/sunxi/cedrus/cedrus_regs.h
> > > index 05e6cbc548ab..961fe023bb43 100644
> > > --- a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
> > > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
> > > @@ -616,6 +616,14 @@
> > >  #define VE_AVC_SRAM_PORT_OFFSET		0x2e0
> > >  #define VE_AVC_SRAM_PORT_DATA		0x2e4
> > > =20
> > > +/* Frame info word of a frame buffer list entry in the AVC SRAM */
> > > +#define VE_H264_FRAME_INFO_PIC_TYPE(v)		SHIFT_AND_MASK_BITS(v, 9, 8)
> > > +#define VE_H264_FRAME_INFO_BOT_REF_TYPE(v)	SHIFT_AND_MASK_BITS(v, 5,=
 4)
> > > +#define VE_H264_FRAME_INFO_TOP_REF_TYPE(v)	SHIFT_AND_MASK_BITS(v, 1,=
 0)
> > > +
> > > +#define VE_H264_FRAME_INFO_REF_TYPE_SHORT_TERM	0
> > > +#define VE_H264_FRAME_INFO_REF_TYPE_LONG_TERM	1
> > > +
> > >  #define VE_VP8_PPS			0x214
> > >  #define VE_VP8_PPS_PIC_TYPE_P_FRAME		BIT(31)
> > >  #define VE_VP8_PPS_LAST_SHARPNESS_LEVEL(v)	SHIFT_AND_MASK_BITS(v, 30=
, 28)
> >=20
>=20
>=20
>=20

--=-4o970CQPk1yDQhl/dEtr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCauoqVQAKCRDZQZRRKWBy
9A8TAQD+Ry4FbmqwUPe+CY+SuLTohAJ3Ka3OO+jZx92frXbjMwD9HhnN1J2i6c6E
vla3dVABSCurWRbXxU3IIzC1ZTRiagY=
=9Lq8
-----END PGP SIGNATURE-----

--=-4o970CQPk1yDQhl/dEtr--
