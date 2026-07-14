Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB5547DD5D
	for <linux-staging@lists.linux.dev>; Tue, 14 Jul 2026 14:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784039336; cv=none; b=Y/0OPB+d/B53tHuF113sKQsVFbHHKOEH2bh3XTP5S2bEhhqtL5CSIfZ1THyRPvIM8X0hyUznjmNyz4uWq8iMqiMltdY7nv5AZCQ82N4HFbzv4QETfqJWAdRZea6HJJ7yyG7wDqb3ha01yNf0Bu5ok+kknKJ49LXkR7qU5m4PLV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784039336; c=relaxed/simple;
	bh=5n8VbHtQhWz1Q91nPMs3Rqh2pcWVSlitrhif8Vd6au8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IglefVgTp2D6zzmU2HvL1OhNam3XOP80payUXVAjrLAoCMnGAZFAHfqJ+GKBp0c58fGvh3k6wiqWJ3qmaQbTu5aAqcpKZ4+F0Y6bvUeCXKQe18jKD/DXRWj//m9kHit4qxM1Qra+U0vS9LXUiJo3RPxRnDSooe7mxNzSk78WDrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=RzMZRmZP; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="RzMZRmZP"
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-7391d5504b5so740170137.3
        for <linux-staging@lists.linux.dev>; Tue, 14 Jul 2026 07:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1784039331; x=1784644131; darn=lists.linux.dev;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L25chsznU2xViBCoDsOOuGB4w/iTxvj+zhnZXq2fDI4=;
        b=RzMZRmZPgoZcI7GBNxOyEnKZWQ8CzFC7iD6qewqinh5pb8EMLYYUU4GkLf+RHwQ4xm
         a2ogmobVEVHVgp1u+gSc37ZKufgYeJUVdut+2EP3Pzdssiv64+5sI+klk63+QQVgngeH
         stbxjOj2+KRy3Hy63ZxLYk2gM6RhK2Rg98HA2RHsUuFu5uRq7Rj0TnVj3rwXHTtqlmvm
         4fIBQHqgx5v0kcn0McM4hpYUcE38jzulsHl1B3fre6UWHH+YGbXrFpAmGWZqZKa/tP8S
         14jERXqy+wFm0PlDCbfi3Mhrliola/Dgvi7Xuf6AHwMq4yKAg+sjCXj0UJ51LJnKVKmP
         ITHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784039331; x=1784644131;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L25chsznU2xViBCoDsOOuGB4w/iTxvj+zhnZXq2fDI4=;
        b=lPUau88v0rwysCDwLdFHea+qSWnfAUehUUKK3rIGxZ3jPDdNv/bvTkoiQUCRca4wA3
         yoex1OcwDpNumPGLrgV7dyeju/UK7d96oJFaNlCOqT4/6tLKzolKxsEe7VX4e6uC9BWF
         c+78JrnpPokpYEXZE3asmNv5kRdy1G2V8nDJhiU4xda3/KrxvlK98xxQfRhUurYJSnsk
         tAojf0JBrTcwAJo3WcS7ZyVpPXHeVhX4CKaoWFl7N8aUkRPrSYIjCNWHy6U6np39bkwD
         7uVAjdUYR5CZ16c9vwuYiqn7yobWw16Kk8ZRa2GSMKdX+ZJiOis4UrLUSf61nIKI0iF8
         Qz/g==
X-Forwarded-Encrypted: i=1; AHgh+Rqct2Kabs05xjXz0K56C1/uxoENxGfvYdpmUIouKKMtbKfU2UTbNPDqpEsjpwiLw12jffchPQsewr4kG4DW@lists.linux.dev
X-Gm-Message-State: AOJu0YwknmoEKwWEZ+F7yQXm5brWJerqGEehVgRZxyCAsoWzFlAscT1r
	XNPUtfl/oFmZFOeA4qvEk45xh+BFe2Jr+8l0u2adRB0hfZIaMReUoCsJAbUxoYSvrUE=
X-Gm-Gg: AfdE7cn/Whq69qgG924/CFCWi8crMREGy/wP754hdcX3xCoVS5s/W0RC4NETTL2nq4U
	s6hu+/F8WQEOKR/MUryK/q4eOsY/cd/ua7AY7X/gCPRp1xLwz+WaddzK/1XAG6wDhmYVNbeT8+u
	HqcrhfsdLUyDT1iYwyfOumPXdd3UsgZxXKcwjjc1yXPptlhdAdnXsPrDIy98BrUzebU8plcdqwJ
	ukjHyv0OtATE0HSOB3hkPc3KblGpmb+n9BhKOOsilVdhixabydzcAD9CzgRzJwTSy0cw+T1xVes
	Y1jnT6I0excc1Vhi8lCT+8J3lwzMD/bOMZU7WTedKaoLuvs1ZnM+w9L1c8z+W+ANoY6tyykkHjS
	ztB1g+5Ee73QLVwew6FvTWOZ6hBeT9vlzZvJFA8d1vZezCazSgQhTkP4JxcH1Dysk0vAGXDVS4R
	BIJyYylIn5NtUnyQHnAg==
X-Received: by 2002:a05:6102:4188:b0:631:37cb:1e64 with SMTP id ada2fe7eead31-74533b5d732mr8759191137.4.1784039331337;
        Tue, 14 Jul 2026 07:28:51 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::c41? ([2606:6d00:15:e06b::c41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-744d6a3eb8esm10251628137.3.2026.07.14.07.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 07:28:50 -0700 (PDT)
Message-ID: <263a79327f88e75a821abbbeb6f1dfa0448da86e.camel@ndufresne.ca>
Subject: Re: [PATCH v2] staging: media: meson: vdec: propagate
 devm_clk_get() errors
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Alfie Varghese <alfievarghese22@gmail.com>, neil.armstrong@linaro.org
Cc: gregkh@linuxfoundation.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, dan.carpenter@linaro.org,
 error27@gmail.com
Date: Tue, 14 Jul 2026 10:28:48 -0400
In-Reply-To: <20260714140458.1276-1-alfievarghese22@gmail.com>
References: <20260714140458.1276-1-alfievarghese22@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-WDqrlTDAgquoB2fbpaws"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-WDqrlTDAgquoB2fbpaws
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 14 juillet 2026 =C3=A0 19:34 +0530, Alfie Varghese a =C3=A9crit=C2=
=A0:
> vdec_probe() hardcodes -EPROBE_DEFER for all devm_clk_get() failures.
> This masks the actual error code returned by the clock framework, such
> as -ENOENT when a clock is not registered or -ENOMEM on allocation
> failure.
>=20
> Return PTR_ERR() instead to propagate the real error to the caller.
>=20
> Fixes: 4f75e7dfa6dc ("media: meson: vdec: add driver")
> Signed-off-by: Alfie Varghese <alfievarghese22@gmail.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/staging/media/meson/vdec/vdec.c | 10 +++++-----
> =C2=A01 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/me=
dia/meson/vdec/vdec.c
> index a039d925c0fe..fba1e7f88d81 100644
> --- a/drivers/staging/media/meson/vdec/vdec.c
> +++ b/drivers/staging/media/meson/vdec/vdec.c
> @@ -1026,24 +1026,24 @@ static int vdec_probe(struct platform_device *pde=
v)
> =C2=A0	=C2=A0=C2=A0=C2=A0 core->platform->revision =3D=3D VDEC_REVISION_S=
M1) {
> =C2=A0		core->vdec_hevcf_clk =3D devm_clk_get(dev, "vdec_hevcf");
> =C2=A0		if (IS_ERR(core->vdec_hevcf_clk))
> -			return -EPROBE_DEFER;
> +			return PTR_ERR(core->vdec_hevcf_clk);
> =C2=A0	}
> =C2=A0
> =C2=A0	core->dos_parser_clk =3D devm_clk_get(dev, "dos_parser");
> =C2=A0	if (IS_ERR(core->dos_parser_clk))
> -		return -EPROBE_DEFER;
> +		return PTR_ERR(core->dos_parser_clk);
> =C2=A0
> =C2=A0	core->dos_clk =3D devm_clk_get(dev, "dos");
> =C2=A0	if (IS_ERR(core->dos_clk))
> -		return -EPROBE_DEFER;
> +		return PTR_ERR(core->dos_clk);
> =C2=A0
> =C2=A0	core->vdec_1_clk =3D devm_clk_get(dev, "vdec_1");
> =C2=A0	if (IS_ERR(core->vdec_1_clk))
> -		return -EPROBE_DEFER;
> +		return PTR_ERR(core->vdec_1_clk);
> =C2=A0
> =C2=A0	core->vdec_hevc_clk =3D devm_clk_get(dev, "vdec_hevc");
> =C2=A0	if (IS_ERR(core->vdec_hevc_clk))
> -		return -EPROBE_DEFER;
> +		return PTR_ERR(core->vdec_hevc_clk);
> =C2=A0
> =C2=A0	irq =3D platform_get_irq_byname(pdev, "vdec");
> =C2=A0	if (irq < 0)

--=-WDqrlTDAgquoB2fbpaws
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCalZHoAAKCRDZQZRRKWBy
9ICYAP9pdhNwuOwbtfpwNZ80VSG7CJ/koMU0FTTz4mI20OIOhgD/YYFDt2jAB7h2
ZcXN8NZl9UQJkwnOiSpvH96NmWi2ZA0=
=7elq
-----END PGP SIGNATURE-----

--=-WDqrlTDAgquoB2fbpaws--
