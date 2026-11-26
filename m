Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795713246;
	b=4+f/OZoQ2AIc7+bY+h+PR3W7B0DAH0mMs5HD+5QlZy4r8q5AJ97274C2rIUrJPy1OxVK
	 GTkq/op6+e/Q1015GUl6CAnABWivNOcWNganRA1+AKpzaJhUynZl788r2g0vv3DhJvgyg
	 vyaG6hXB/nv8VG8nZ3LRCSYJCYKDVuHI15dYzgphQkiE8afLEc2emkgTt3kpX7yjkkhMf
	 8cpiWb4YmXZXYQMaR4Me/el9xw/DK7TdaDnuUyHtZGqAtPbIkrhgI/tALCN5S5wB73Prs
	 DRVRt7/MHhFcKe3BT6kY7233kDSU5N/UPrFaTTsX5LRGQBvPkfj8zViOdan9fdddFLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795713246;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=Yi/ivCTbo4DPg8u3yeaJ2VRoY8CK+U4XBvUgOwH9f/A=;
	b=dHRZ3s76S8nkaLwW7PSFLzRU+47yJdhguc9dTam+qFDI88GkJgFufq3xJzT2v9VpgXrq
	 0x2b6uoIHY2++sFCYOAAu7vPbzgTKsWC4BVtrveI/a44i+Vhs5CDljJHe4PITJvQZa45w
	 OmF+lUvlLuhwpsJfKc5mgSJs0PDCpx07pvoKJZxJUF5Ue2zNScKyFe7aU2/Jo6AXkzEJj
	 x4omgEaGlwk+dZBL/h8b+HNJZiuasb1xExxXaLdLvXKbh71abLLEjCOKVKqYO1z0ZETx+
	 vgdpOZx0oY2Ier+clTncjmgf2RzCslY/oGpufqK9GbwmepXCBRT+Kz/W00IQpnw414w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AloF2klS;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7382606A31C
	for <linux-staging@lists.linux.dev>; Thu, 26 Nov 2026 17:14:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7382606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AloF2klS
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-49465892f7bso5307999f8f.1
        for <linux-staging@lists.linux.dev>; Thu, 26 Nov 2026 09:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795713244; x=1796318044; darn=lists.linux.dev;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Yi/ivCTbo4DPg8u3yeaJ2VRoY8CK+U4XBvUgOwH9f/A=;
        b=AloF2klSV2AeKN2DtlscWAEDtkrkIgf66rIl4EVX2aWdP41tjP86FwGW6H3ng1Wh5P
         F3qyemzbMe6mdFNJAmbJDPWm4Pzyv6x4+JqIAbe8QLH7D5yty917qI4f+kicmbn1wxI1
         JfVThxJLFzQgoUvNQboMV96pBBArDHXoa4l6t82lpApG4CaInCI4hL/BPLS9NEMi73fv
         4NJPyviaMd/3PR8WNyAGVebHeDTLFenDeD6A9se2/eUUOvvYsZkU9ZwUqe2OBie2Yd4B
         pnFt2xw4N40hTmXcU77GtKVuzGpQBc3opZqs+W9JsxOGgSCPU/vf4Kr+q5c0xwlNzHV/
         NZ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795713244; x=1796318044;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yi/ivCTbo4DPg8u3yeaJ2VRoY8CK+U4XBvUgOwH9f/A=;
        b=toyQKX3Q7XJAb+gL8Sx1zHE+h8ge/sEB8fSp3pHQ9VJV9qCFWQPgixGP4HRhYJ2Nd1
         k2wj9t7Uc4gsXStBtulpKHYZfAHz0MHt5qYfnJE31lI3FhSUKiYwIPLcQAfXGdLfrWZy
         ICSL1yalg6hnHQxINWk7+uspRRZ2O8EMADTfiFV/cPUgz11aM6IyQhfjnZgZtfRHdIjH
         0YyeeNv4r0jmc3mhldfY5hif94asjbFMQzEooP9Dz0NfcbOXspZfF5spuQtKrwy4+6Ds
         qOQM6WR6RoA9s/VybiUtOtjoeP4W8sPQHyE/p9YeK6JkoYdOoaV+d5zZnte4ruV83xCl
         Ro/w==
X-Forwarded-Encrypted: i=1; AL+hErHgl1Lrf4iw0eSUZKG+FLBw3xwn66N6sfg5BuAywztSimZXEhYMeQTpI9KouvCn7Si8Bhptc7XQh3PYRl12@lists.linux.dev
X-Gm-Message-State: APuU4Z8jpQW5Kp1UOYc/lHVDRmJxBpmUSMHrGAkAZTqp1362UV3Y+ixA
	ca0v/C3G8ZkX1+85FYAlYhPtg5ytU0FpxRj/Jh6s+UTfiXmveYF4YiLi
X-Gm-Gg: AZFdTZc9KAK6oW1hC44PzfrMGSqoUc6UZAI94erI/cGwFGtZg9lRAhp2Yzn6Nep5ynj
	TEprsZBGrOmz4vqj0j96GCBThWRnglYHIa/mthYT9xt87i2+rG1wzqUP0T0uH8MZrvCUbAiqQ6N
	KtC5kMEFfaYtL5cq1wgNfsInp25bkv47t0Pxnb9KF9StFCSamjtJHmIXpoIMLB3a06/Ip0KRGLO
	DK+sg+sanS/BsC1yrfQgAc8chgDP0bAeFpJUonqKoNgRxGVqFLAWuViOYhvlYqadkHzCw0/gu0r
	h6FTVw5kqDHepKOk82xKqXSGd7RQ1NQYfyV23JyXgaoLjSfQDJlatbniWuArc1LRk7Wd+oSKzDQ
	Txtx0Rtap818c32eEDqg3jRTQkbEaFH9YbCiKIuzOgOUVGZ+0myU9ZDFGl/NjgKhXSCjgx2sl2/
	LgI5wohCt3VA/likGm3IsWR2mwOVjKpoEQWtPY1JYXX6Vovj28M7NxX0TlD2gcAGNUplJl76Oqx
	4tWviOu8185q94cAxDhHyGHD0VsWUmg8eMvUBH/V8dTfFioBbd2P5GGModw9UQ4ScRSiPSp+9k5
	ovvt+rhzV5NBFnwXX6j/jGmnfZAej/ZpoZAxgNuGhzxBGCD30Znt8gRrdqkdwVAW7hrgqAojGQ/
	gzB3coogkyrqTuPwHi3NrQIJImXYRFQyarfeluk0nGdpsE4Tm6KT3Emtd1Z4ZeUYPrDiXMmbUZy
	gxO8cSwX744utXh+iHOV8IRZ8PsPYjZmHHiqFJqUS1n/Nfk6n34LbVXhIkJZb1EYEiSlRN8QRj0
	SBfEVtopMXsKwKORcmWvy07ARocL9KAQOHsj9G3NKTRNkLPeW0yhTa5o58gO8nS
X-Received: by 2002:a05:6000:4704:b0:491:6a7:b4ac with SMTP id ffacd0b85a97d-4abb5eabd6bmr42342899f8f.56.1795713244030;
        Thu, 26 Nov 2026 09:14:04 -0800 (PST)
Received: from jernej-laptop.localnet (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm39494189f8f.34.2026.11.26.09.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 09:14:03 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: mripard@kernel.org, paulk@sys-base.io, mchehab@kernel.org,
 Caio Vinicius Ferreira <contatocaio.ferreira7@gmail.com>
Cc: gregkh@linuxfoundation.org, wens@kernel.org, samuel@sholland.org,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 Caio Vinicius Ferreira <contatocaio.ferreira7@gmail.com>
Subject: Re: [PATCH] media: cedrus: fix typo in comment
Date: Thu, 26 Nov 2026 18:14:02 +0100
Message-ID: <A2PFvd_UTOK2TCyMMfkywg@gmail.com>
In-Reply-To: <20261007140056.7447-1-contatocaio.ferreira7@gmail.com>
References: <20261007140056.7447-1-contatocaio.ferreira7@gmail.com>
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

Dne sreda, 7. oktober 2026 ob 16:00:56 Srednjeevropski standardni =C4=8Das =
je Caio Vinicius Ferreira napisal(a):
> Fix a spelling mistake in a comment: Neightbor -> Neighbor.
>=20
> Signed-off-by: Caio Vinicius Ferreira <contatocaio.ferreira7@gmail.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/staging/media/sunxi/cedrus/cedrus_h265.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/s=
taging/media/sunxi/cedrus/cedrus_h265.c
> index 780da4a8b5af..f57642c0d8fa 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> @@ -755,7 +755,7 @@ static int cedrus_h265_setup(struct cedrus_ctx *ctx, =
struct cedrus_run *run)
>  	}
>  	cedrus_write(dev, VE_DEC_H265_SCALING_LIST_CTRL0, reg);
> =20
> -	/* Neightbor information address. */
> +	/* Neighbor information address. */
>  	reg =3D VE_DEC_H265_NEIGHBOR_INFO_ADDR_BASE(ctx->codec.h265.neighbor_in=
fo_buf_addr);
>  	cedrus_write(dev, VE_DEC_H265_NEIGHBOR_INFO_ADDR, reg);
> =20
>=20




