Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3584421892
	for <linux-staging@lists.linux.dev>; Wed, 29 Apr 2026 19:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777489687; cv=none; b=btoxmO+00O+BDzFUS6sqlsV1kUoSEFHjiRX8LBWs6eAdqseFusJ/xUT4HAcyK9UJwdpDQtlr1VOcKibRmgjuJ3nvkiyNuFLjHCE6PVERzvWjGzEVgo1LvV+EeiWlm0pTnUGP+eDnIkI54SUjngxL5cl+QdTraslGC7wbHVqa794=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777489687; c=relaxed/simple;
	bh=7+Hvv4+54ohcqqP5bPt0lbTIfMcofDo1/arHFiSOaAE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DFTUm/qWxKbg40a5ZYGtKN2umNjr9QlV7+10MzrLWZNcaU/HCAWt7szxQT6sw9cKjVsxnEgEyPl/uDIQQ8lSyp6fk/cQzkPkHae7nogXb4F1SDE8uGOeVqmTRjFSjPu3ZTVvuPkTM2nZFEoiE49vE1eS3T2sENRzFQeaQJypUuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=GDvG0Dlh; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="GDvG0Dlh"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-506362ac5f7so474971cf.1
        for <linux-staging@lists.linux.dev>; Wed, 29 Apr 2026 12:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1777489685; x=1778094485; darn=lists.linux.dev;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ysVs+tGOn7Mjhq3uiCYR8hMiyn+nHB8HC49fRVE07mw=;
        b=GDvG0Dlh13ZInCGqoD7h7dXiFSRvNXVpIa4IrVqanMwaddjxPKbcR0Fn9hxUN40KJB
         L1irIrXkXIZfxg201ePNSS1cfC4B2skj7u3RlbQ1tOjx6MJx7SH9xw6nQgPIJwGH107b
         UBYnrSpbU9UoueDC5KuVAND6CXi64CacZZ/elGkL7TnCvPuAlawsIXZPzNLoEQl+AG8n
         o2WwYv+y2zHsASLDbNkuvzCmu0Bc5QovPNQMM8ME2/fuXOp0KKJfi0r/TRYZ9K8yrUqc
         CUgzI5v0EBIn8rO5VNecw/uSeLjzWyFzC8kpubIto4PPwUIuA9BatxD3NjZUNixYQjIY
         WOIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777489685; x=1778094485;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ysVs+tGOn7Mjhq3uiCYR8hMiyn+nHB8HC49fRVE07mw=;
        b=AawJ7gKI1jT3/tAh6/ln+X8DNRdSwS/y1Kc5oCK/Q5ll0gIwKhFSMr2gyq3gQL1Tu5
         PQkYzr5wixwPAkxwn6DexkvS7tCz1vJxyaeLWdIqeuZvHK7X8m7rgwHTldh0cJR05XWB
         bQXViiIwViWSWHA0KTxQqGDQHqvMnW0mkh7aY7qz1fWLbGWWv4lPhH4W72EIuFtd0k0f
         UUxU3Gv3sO/XuAH0korSQQWqcaWGe4Gd9c9pgIe7A9Xx7j3c54DiwZqwOZ0lsEl8OfAK
         16iUPD1Idkc/2DXWNHd1zaQZJmBceb3810TMzOOSW/Xe61mx/kV9lHuUqVo1TjSU84e8
         Jp/w==
X-Forwarded-Encrypted: i=1; AFNElJ8rt3Vte9U8VmcoHSm0opcqY0pOH37+XJBuDE4+Z5VJ6lxfsVrFSDUNWBtuySDQtw/mYHmY4dRBEzDCe1mf@lists.linux.dev
X-Gm-Message-State: AOJu0YyPpjvkldJUpgK20+h0hYajpMcWkIrGSoF22xLUjxTC2Xlb4Y9n
	dA575OVytGrdSSrBy9Ga/+MwWeVzhol4+B42hKUoQvVo4h8q1IAjRRe5f9UJ+m4+jhs=
X-Gm-Gg: AeBDieuttMJPTvA81N5HUenPWpZzaOR0FILJig7mQkw/TDdLa9ygTO/yeIh8nH5B99q
	XgfyWYZ61sUVvvFScJCHzJguJFbV5joxT0g68PvXfiOJq3aaWhZkFE4oCjIH0iCXfekU48WHKAU
	uvTeC/YJib+vfmaccJ4k9lN2EOt2Zh7tFxaxLTOaHuPl/FRwAgg2rlUeCGJaGxHe2+DA0ibTs4W
	m5Z9n4RnF5PYpGRQ6wmtwXPbqLa3vVmRpkSHzQzVBDjZH9o2nT8q1a1oC6AUomjBk59qwxbZBoe
	hUfOMn0fevtDeDN7GLV+Onz3j8aCYlWO9yzLGwdPfRjDgt81BwrdsalTglEKXwfAVsaHHJZ/CX+
	kd9SVviaV0yNBJAhPtfBJHXvjZi+PiA1zUBzaNZ2IcAPySB1gjwEzFOAcEb31K9sDAMhxf8VfFT
	q255o+hEdJsHjsh0wzp6EwYTxaWhOXl8eJeqM72X8ADxZ/Xdvosg==
X-Received: by 2002:ac8:7d51:0:b0:50d:6ee0:3822 with SMTP id d75a77b69052e-5100e0f4ed9mr120711691cf.4.1777489684869;
        Wed, 29 Apr 2026 12:08:04 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::c41? ([2606:6d00:15:e06b::c41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5101ae657d7sm23790771cf.21.2026.04.29.12.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 12:08:03 -0700 (PDT)
Message-ID: <6b9544538177a833c7de635782c67f3fae0beef5.camel@ndufresne.ca>
Subject: Re: [PATCH] media: cedrus: clean up media device on probe failure
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: =?UTF-8?Q?=EB=B0=95=EB=AA=85=ED=9B=88?= <mhun512@gmail.com>, Maxime
 Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>, Mauro
 Carvalho Chehab	 <mchehab@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  Chen-Yu Tsai <wens@kernel.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland	 <samuel@sholland.org>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, Ijae Kim
 <ae878000@gmail.com>
Date: Wed, 29 Apr 2026 15:08:02 -0400
In-Reply-To: <20260427100049.29034-1-pakmyeonghun@bagmyeonghun-ui-MacBookPro.local>
References: 
	<20260427100049.29034-1-pakmyeonghun@bagmyeonghun-ui-MacBookPro.local>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
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
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-ArOwzQZ1bmZyT5qFP9QG"
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-ArOwzQZ1bmZyT5qFP9QG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 27 avril 2026 =C3=A0 19:00 +0900, =EB=B0=95=EB=AA=85=ED=9B=88 a =
=C3=A9crit=C2=A0:
> From: Myeonghun Pak <mhun512@gmail.com>
>=20
> cedrus_probe() initializes the media device before registering the video
> device, the media controller, and the media device. If any of those later
> steps fails, probe returns without calling media_device_cleanup(), so the
> media device internals initialized by media_device_init() are left behind=
.
>=20
> Add a media-device cleanup label to the probe unwind path and route video
> registration failures through it as well.
>=20
> Fixes: 50e761516f2b8c ("media: platform: Add Cedrus VPU decoder driver")
> Cc: stable@vger.kernel.org
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> ---
> =C2=A0drivers/staging/media/sunxi/cedrus/cedrus.c | 4 +++-
> =C2=A01 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/stagin=
g/media/sunxi/cedrus/cedrus.c
> index 6600245dff..2c25654640 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
> @@ -507,7 +507,7 @@ static int cedrus_probe(struct platform_device *pdev)
> =C2=A0	ret =3D video_register_device(vfd, VFL_TYPE_VIDEO, 0);
> =C2=A0	if (ret) {
> =C2=A0		v4l2_err(&dev->v4l2_dev, "Failed to register video device\n");
> -		goto err_m2m;
> +		goto err_media_cleanup;
> =C2=A0	}
> =C2=A0
> =C2=A0	v4l2_info(&dev->v4l2_dev,
> @@ -533,6 +533,8 @@ static int cedrus_probe(struct platform_device *pdev)
> =C2=A0	v4l2_m2m_unregister_media_controller(dev->m2m_dev);
> =C2=A0err_video:
> =C2=A0	video_unregister_device(&dev->vfd);
> +err_media_cleanup:
> +	media_device_cleanup(&dev->mdev);
> =C2=A0err_m2m:

This label is left unused. Can you fix this warning please.

Nicolas

> =C2=A0	v4l2_m2m_release(dev->m2m_dev);
> =C2=A0err_v4l2:

--=-ArOwzQZ1bmZyT5qFP9QG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCafJXEgAKCRDZQZRRKWBy
9Jb5AP0W2NO3lfYARP66qlgaOk81oBVFPzJbTkbCjtmBnCuWbQEAqCvyLm4BXXjp
0DRDRSToJuHjR05VHYK2ozXTCeXXgQw=
=JKEn
-----END PGP SIGNATURE-----

--=-ArOwzQZ1bmZyT5qFP9QG--
