Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793729570;
	b=d30YkbvbkKaH23nnYv6pYV+DB1yMkN6ATLuUmYzKMmEjrW1gyynm5Nwz+cyRauaS4VqT
	 IE/6o8BD5ga4KQBiyzO3RHaowiEqPe/n8/JlefDn9ak4JQdw+igi2ctkwzmBKT71Q8cGA
	 HONIQzzlM71NJSiuoY4lncHTeEZ9UAA/d13AbOC1bgmRFfM0LijB9s9UoDnnD+3cFA8VZ
	 cKDkCMfe8ZTquWr8eircIIncp/C4CSeQ4W51C285yFTzI6dkIwKbrvE4XEY9ydN30S5d1
	 i4FIClgaiY0/JAdroXdcAQVLdr3gJ55fKSyc28q+lXsx6n5OvG015xmvbiGf412mIpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793729570;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=axeQ5CIE2uW000DJFHLDIWC6PSnHJaM+7ICNLkjh1BE=;
	b=CR92Ze3Q/6FV0IkphMbZvTdzL2/gJ8lzltWXudz6NiR6h8J5cJA+Jn09Af2uY6agC1J7
	 F+gQH12VFBYqOXLY5JYenDhhe8Zay6Q317mgxxn6cgQAQ1rqu70hNHRlAkleU+wNULT1w
	 qJrYc18K5M2Wbe9oioixqcHNnRQApqgsdNeOp8zzlh+wdgr9iLck/LAtX6cBE5KX7fN6o
	 aDU8CIih16Z3B+mIqoQLxwm/Lm3hO/rWG9ROw/ZMlpgEPbryjhVgi53grjRUzZE1bQefL
	 IavLLAie2Vf8ecfWbCzVgjWmi6UVgVSMjAODZDTyccdJTlNPResD5M+XEb4Y3YVvm2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DwmhY2Q6;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C800A606A326
	for <linux-staging@lists.linux.dev>; Tue,  3 Nov 2026 18:12:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C800A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DwmhY2Q6
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48df54150dfso2298959f8f.0
        for <linux-staging@lists.linux.dev>; Tue, 03 Nov 2026 10:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793729568; x=1794334368; darn=lists.linux.dev;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=axeQ5CIE2uW000DJFHLDIWC6PSnHJaM+7ICNLkjh1BE=;
        b=DwmhY2Q6n0SBsR+iUoh/HOTzqgF0tCmTpLLs+Yy7J1PDfkzoIUMxLCiPa4TW4mtXxu
         0oLRXnjlvLuBKX2LFp2MOUbR647HUXs9WhsZ+n1PzFiHm1HS6i5x7w8gz5tYQoS08UGn
         +90B0nk5SWD08YcgwGJQJAeDpZHNaaXK7VodcgUh9Ox232Vc1xOJ1RSxWZmjZqzM7GfQ
         RGl2UvS1F93cXBdmkXov2CPKQwZC5ChcwxVzkv/QOMDGlmrswRlXozfzZpmsDu71VuoC
         pptumAalxPc1EiVfJHb1GhPZDjU9oh8Erv/RZZ1OLxoDA7u9geWASW9ov8xb4cTt53GI
         f9wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793729568; x=1794334368;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=axeQ5CIE2uW000DJFHLDIWC6PSnHJaM+7ICNLkjh1BE=;
        b=QaUwAo/vW5Sk9QWHt2KvLoCMfoQ3ceXYYGR8khKkqeX9E2LqAF6yjcjkEBCuwNyN8k
         WDTPsoHz1KVj7xu4C7GLnT2kVJhNOY/VA6RS+gbxzt0rE5tYf7tlcHu2+p8gugWSublP
         eyto5DF8ICHaNCUe9mIKkxNq5SG3dgmYajfEfmotk38LsjybUFKhfstWYTLWbwuWj7Bp
         DXQOjPhJXA4o6u+dIa5sPTuhIfkWBjd8/Qn+mT8zFYtw0ghF6wju49dk6HbZ6ItMaxuK
         GM54mL4AJxC5cKOaQ43H4aQKJNm5y/w7O4uU5tBCaYzEaz18Hv/ARiz9Ms3W9Et1oHEn
         SxDg==
X-Forwarded-Encrypted: i=1; AKwUvBxmUZ6NdvA2Qc/rLCf8ozgwSST5movVzeVf7whOAhh0n836PCPeVaQJO7JBuNzF5oCgBTv9oek6aMI8SolX@lists.linux.dev
X-Gm-Message-State: APuU4Z8y/253Y4bx1e5ZMnxAQvIYQCfClFljo5npCX6OfVjch3R80kkA
	hV7VZQBQ/nG0LFSmHUwBIu5ieYdswbVnxcSleyp6NCBoA0Fjvdje4Lqv
X-Gm-Gg: AYBFou3Ipiblym5R4WFzDsgME0sIiL/f9/6cPHXQlTrBkf9OJUpSUjT2RPYL7MBuSYs
	5+O87CDJpKshQNiHPByXEhFxj9Shu7QjKW+Ywp+m1C5uhplf+T14DfOkLhsNiB16EZRKpMDOrI5
	YKK4BWzdcbvMA59FOKzZnEeWkL33VhrOXupR7T7WN/njCLN2w2FDd5Qp3fT3ohcCpTLH8S9fV8I
	FZFoKIU9FwZ2xtbTkj2o3v5C2xqTq005qFk+OVwHcg4T6sgNpqcEFB9V1JVJ7xRGTGwaaFv/TXk
	Dkqv79+gqS1gcjgxyLTwxNAkhEFDZrBa0ta3SzbO3Bh3xuIwL+fAtLf1tZnoU0K5Pm2+N9wr4cL
	Fii/RVDZ1ngOD/0QMtX1WfOkXYrLceS3FxdubXjOfWooSzkmMmIojj8cce1Slhh3JNHI1Q5/of6
	LJWDQ58JMsCv5y+tAC5hgCxS2kwBK9rQUmV97XV05Ai5heSiH0a59e1qx9a7H0Z3nIfYC1PeTwL
	6pG8unqOYhs0vWsmwJWracSkusIhbshIQIfK8j2j6340dgW3QGEZwPjJ48/YZ4CxDGp2YJXJ6Pv
	sHKqvuzFULVM4DE2be2eM1DhXg4Wb4plzHg7gJH2+6fPyXmISbDtISvVCK0KKJX+RDKZjP6GDI1
	z/iB5i4yRj6djU8HWqeFq2la1R+fD6ubaB0gz8gbSe/9q6AKflm9QdTxuwedej8HkqP8lsdfPY3
	zrg3XJbmLaCHfJbC62/jX2DJ+vhTU52Vd5nsKNW2Ut4406RF3Gy8NtRVcnGNAAuCP+4+AbzHsTe
	MmDtR0MOdh6atOZaflNUxX6WmEHdkIlCabsFAIy75EgpyaGcuXFzpSdSMjsrA==
X-Received: by 2002:a05:6000:310d:b0:48a:f59f:8b70 with SMTP id ffacd0b85a97d-48e6e4f8c71mr33769566f8f.46.1793729568150;
        Tue, 03 Nov 2026 10:12:48 -0800 (PST)
Received: from jernej-laptop.localnet (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b789c6sm28261090f8f.26.2026.11.03.10.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:12:47 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 04/10] staging: media: cedrus: mpeg2: use the field height for
 field pictures
Date: Tue, 03 Nov 2026 19:12:46 +0100
Message-ID: <vCPa4waZQ6-kwYC7OOX3Kg@gmail.com>
In-Reply-To: <cd5780876274ab5aa73739f890a32ceacf2e793b.camel@collabora.com>
References:
 <20261102170303.1973892-1-jernej.skrabec@gmail.com>
 <20261102170303.1973892-5-jernej.skrabec@gmail.com>
 <cd5780876274ab5aa73739f890a32ceacf2e793b.camel@collabora.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 2. november 2026 ob 19:56:52 Srednjeevropski standardni =C4=
=8Das je Nicolas Dufresne napisal(a):
> Le lundi 02 novembre 2026 =C3=A0 18:02 +0100, Jernej Skrabec a =C3=A9crit=
 :
> > A field picture covers only half of the macroblock rows of a frame, but
> > the driver programs the coded and the boundary size of the whole frame
> > for it, as for a frame picture.
> >=20
> > Program the height of a field for field pictures, like the vendor
> > library does.
> >=20
> > Fixes: 50e761516f2b ("media: platform: Add Cedrus VPU decoder driver")
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > ---
> >  drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c | 13 +++++++++++--
> >  1 file changed, 11 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c b/driver=
s/staging/media/sunxi/cedrus/cedrus_mpeg2.c
> > index 10e98f08aafc..ca66a3c6b830 100644
> > --- a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
> > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
> > @@ -58,6 +58,7 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx,=
 struct cedrus_run *run)
> >  	struct vb2_queue *vq;
> >  	const u8 *matrix;
> >  	unsigned int i;
> > +	bool field;
> >  	u32 reg;
> > =20
> >  	seq =3D run->mpeg2.sequence;
> > @@ -108,13 +109,21 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *=
ctx, struct cedrus_run *run)
> > =20
> >  	/* Set frame dimensions. */
> > =20
> > +	/*
> > +	 * Field pictures cover half of the frame's macroblock rows; the
> > +	 * vendor library halves both the coded and the boundary height.
> > +	 */
> > +	field =3D pic->picture_structure !=3D V4L2_MPEG2_PIC_FRAME;
> > +
> >  	reg =3D VE_DEC_MPEG_PICCODEDSIZE_WIDTH(seq->horizontal_size);
> > -	reg |=3D VE_DEC_MPEG_PICCODEDSIZE_HEIGHT(seq->vertical_size);
> > +	reg |=3D VE_DEC_MPEG_PICCODEDSIZE_HEIGHT(field ?
> > +			ALIGN(seq->vertical_size, 32) / 2 : seq->vertical_size);
> > =20
> >  	cedrus_write(dev, VE_DEC_MPEG_PICCODEDSIZE, reg);
> > =20
> >  	reg =3D VE_DEC_MPEG_PICBOUNDSIZE_WIDTH(ctx->src_fmt.width);
> > -	reg |=3D VE_DEC_MPEG_PICBOUNDSIZE_HEIGHT(ctx->src_fmt.height);
> > +	reg |=3D VE_DEC_MPEG_PICBOUNDSIZE_HEIGHT(field ? ctx->src_fmt.height =
/ 2 :
> > +						   ctx->src_fmt.height);
>=20
> I'm not entirely sure, but I see:
>=20
> 	fsize->stepwise.step_height =3D 1;

Where? I don't see this in Cedrus.

>=20
> But I don't think interlaced video can have odd height in the first place=
=2E But
> it also have an implication here as you are not rounding up to a multiple=
 of 2.
> Not sure what is the proper fix, but I have this impression something is
> missing.

Odd height shouldn't exist in practice, but I'll use
DIV_ROUND_UP(ctx->src_fmt.height, 2) in v2 if you agree.

Best regards,
Jernej

>=20
> Nicolas
>=20
> > =20
> >  	cedrus_write(dev, VE_DEC_MPEG_PICBOUNDSIZE, reg);
> > =20
>=20




