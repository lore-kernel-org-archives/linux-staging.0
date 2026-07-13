Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304A943B489
	for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 14:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783951448; cv=none; b=MQuVT1XQ7jcaFLjYKJUcfOTvok0fDJQyVkT5pxhsaQrI1wWzh1wuJperYrHWEnSjmEFm/b5WV/l+WboEVnxyozWvsZemkBY9nKT3+coUkrreAIN5CdNPv4Oz/5xyu9A8aTOKiwxj52gITAAQtJIijQd4xcb7sDHoPrxFmCXg8ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783951448; c=relaxed/simple;
	bh=2Ni+rp3D303cDLCJDbtlawZA9LsCwc4lSHkbd5AUdR0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=q432IAluBvKia5M0DFi9JP1oSPOu/JI+IfW/Co/ZW3n90nkAgsmHPPORhDmK+P2MxxFHoFzTWgs41DWBoydqYKa1iJU8dzvsxKkiRV1XJXwxdXNpdCh0JeVJbu4FmZ4zqYMN4e57AfpIrLbOcAqsUxsBPv/gO83XJzgd5kkbUcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=GcZp/VFL; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="GcZp/VFL"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-59d4aa96ef2so2859453e0c.1
        for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 07:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1783951446; x=1784556246; darn=lists.linux.dev;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eBW10Cfwapwvr0gihXMdckLTW8yiKSYBxKONjhqXCr8=;
        b=GcZp/VFLxiy9VxnPiAeTefP3yIizjlTHnAncgZ1B/pkTbV0crhyFljkeDzxW9XqMmu
         AQqoVlyrMeccZqL1IgvaoXlKHW3AXcFAb4ZkTfAUkNggs+gM2XVWourPh5vmGq5iTS4F
         xVnT3OXSdJd5ukZAhd72aE0rlcXxisoeEMU51N75lBLkkSi0flFOMSylarvTBddk954L
         HjotZApR88zKYUKWWF/w7SfC3oDBTZ0Txfy1pfYutjuzSG1rOJbQhdaVF7DRbsNR/Ggg
         eNFg98o0setonfg+lVKT4F0ed+jfA4RLIc1sUdkZ9v5GFGE71jXE6FZNu4OxhTed4jYn
         uLvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783951446; x=1784556246;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eBW10Cfwapwvr0gihXMdckLTW8yiKSYBxKONjhqXCr8=;
        b=tQyDu/NdItVsTDYphu3URHNfwu9q5fyHobwIlzG3wHYJokEQ/0nOAo4rVWt9wlYbJq
         E7QWR3/+TtjG6PPy6CeO0tZPKaBv4ACDrduNaByoPSpYqwX5bhc3ianMYVjhUO5uVcZd
         PCO8wGQqIEd28pK/Vdvng3PYuhonayW4ZzwEGyWXwn2EqYtEaOGXeiwhfxelSmWEbUeC
         mxi6G6NbvGioFTVoHhcGTRo/2L1C0A7m9lOPgsRPmqrfFQD0xpE9bcIuLkX2/F3FjsIu
         8wDQ3yWPSnfMXz59cTFb+FT9n+5GfQKPmG6jMJQXt9X5fsG52RL+wRX15lq7WXw41VbH
         dyrA==
X-Forwarded-Encrypted: i=1; AHgh+Rqy8IgNny1wlLzhoZEERwIW/ZDBejCvQ2UDQTklBvDfPXORl3l2jvCgg3BTcGKEp1kAGqBOGW+u6Tnt7D0n@lists.linux.dev
X-Gm-Message-State: AOJu0Yzm6lPI5URganLykC3IgH3buzsUvrClg9ZJ9ajbZJAXY03yd3fD
	05fVWeqiPNukA5oOg0VCfBt4zwmIFPemoTLiosHVXxqUJti0bu1A6jPWbVGgbiZotqY=
X-Gm-Gg: AfdE7cndttNnIvvAS0E3EChsr1aBMr8AXBfZ5AM7LYWSvUeEQ6mOECDo/jCQpfmegoB
	aCkWrE0TwNFqmqgFJeH/yZHT5D3lrTdEMsOV+IXIueHaI4nNSlGo7nN0FWe4Ea8T9ehIHfBBq+H
	ryFuNWbokujWaE3Wp6RKyFDFz1TGxWPej2E80Bk+ZoSC8x2UPzUcZ1umYoU9AZOgJsso+hhtqj1
	9fNaugnNJWLOXcCUQFUjKYL3i7REzZ2B+OShJ1HHGrod9lh9IJay5Qz/6UlT/c0BgBlVxWasJvI
	WQWAtQOnhfSkw3Fbjv9ikk+LLUX87f9GNp32kmjkrGNiblazQR3CQMJrEqCitywXozTK2NQwutb
	VHka9Ce/RiWVVjUM0GK/BXmzB2w5V+6SsZrShfvFX3zV5SYyAUG7juamQuJjXKzkSdCH+6VZi/I
	1gvdxaxbgtkAA2SaFq3g==
X-Received: by 2002:a05:6102:8026:b0:737:2ce5:7b2d with SMTP id ada2fe7eead31-74533bf2bccmr6755210137.9.1783951445952;
        Mon, 13 Jul 2026 07:04:05 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::c41? ([2606:6d00:15:e06b::c41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-744d6a3eb8esm8744432137.3.2026.07.13.07.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 07:04:04 -0700 (PDT)
Message-ID: <5224ab5bffdee0777ecef73a3b96c88e8eed38e8.camel@ndufresne.ca>
Subject: Re: [PATCH v7 19/19] gpu: drm: meson: Fix DMA segment size limits
 and maximize allocation boundaries
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Anand Moon <linux.amoon@gmail.com>, Neil Armstrong	
 <neil.armstrong@linaro.org>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl	
 <martin.blumenstingl@googlemail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "open list:DRM DRIVERS FOR AMLOGIC SOCS"	
 <dri-devel@lists.freedesktop.org>, "open list:DRM DRIVERS FOR AMLOGIC SOCS"
	 <linux-amlogic@lists.infradead.org>, "moderated list:ARM/Amlogic Meson SoC
 support" <linux-arm-kernel@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>, "open list:MESON VIDEO DECODER DRIVER FOR
 AMLOGIC SOCS"	 <linux-media@vger.kernel.org>, "open list:STAGING SUBSYSTEM"
	 <linux-staging@lists.linux.dev>
Cc: Doruk Tan Ozturk <doruk@0sec.ai>
Date: Mon, 13 Jul 2026 10:04:02 -0400
In-Reply-To: <20260713120840.17427-20-linux.amoon@gmail.com>
References: <20260713120840.17427-1-linux.amoon@gmail.com>
	 <20260713120840.17427-20-linux.amoon@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-K7ZLBpNLX5/kwXKFKQKp"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-K7ZLBpNLX5/kwXKFKQKp
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 13 juillet 2026 =C3=A0 17:37 +0530, Anand Moon a =C3=A9crit=C2=A0:
> When importing DMABUFs exported by the Amlogic video decoder driver
> (meson_vdec) for hardware-accelerated rendering paths, the DMA core
> subsystem throws constraint validation warnings. This occurs because the
> display controller master device lacks explicit DMA layout configuration,
> causing it to fall back to a default 64KB maximum segment size limit.
>=20
> Address these architectural constraints during the master bind sequence:
>=20
> 1. Initialize and validate a 32-bit coherent DMA allocation window by
> =C2=A0=C2=A0 invoking dma_set_mask_and_coherent() with a DMA_BIT_MASK(32)=
 argument.
> 2. Maximize the contiguous scatter-gather allocation segment boundary
> =C2=A0=C2=A0 check constraint to UINT_MAX using the dma_set_max_seg_size(=
) helper.
>=20
> This guarantees that large video bitstream frame buffers can be imported
> and scanned out across sub-driver domains without triggering allocation
> warnings or page boundary splits.
>=20
> Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>

Acked-by: Nicolas Dufresne <nicolas@ndufresne.ca>

> ---
> =C2=A0drivers/gpu/drm/meson/meson_drv.c | 6 ++++++
> =C2=A01 file changed, 6 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/me=
son_drv.c
> index 49ff9f1f16d32..899e70bca4ce2 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -202,6 +202,12 @@ static int meson_drv_bind_master(struct device *dev,=
 bool has_components)
> =C2=A0	if (IS_ERR(drm))
> =C2=A0		return PTR_ERR(drm);
> =C2=A0
> +	ret =3D dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
> +	if (ret)
> +		goto free_drm;
> +
> +	dma_set_max_seg_size(dev, UINT_MAX);
> +
> =C2=A0	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> =C2=A0	if (!priv) {
> =C2=A0		ret =3D -ENOMEM;

--=-K7ZLBpNLX5/kwXKFKQKp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCalTwUgAKCRDZQZRRKWBy
9NNdAQDmsQSLx7lRRr/0dmnss88GGZZ8T5JiUJHYnp57V3Vo9gEA5tSuLIwnYukh
D1WBuDEOFQqGktSq40CeUMEDMi1jCgg=
=9ZVW
-----END PGP SIGNATURE-----

--=-K7ZLBpNLX5/kwXKFKQKp--
