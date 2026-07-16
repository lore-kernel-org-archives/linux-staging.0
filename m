Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E88217F33
	for <linux-staging@lists.linux.dev>; Thu, 16 Jul 2026 01:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784164912; cv=none; b=ZvZQc8STkhiG8h3m0qxloNsBUGYO/WM9XJwb8bIc5bCY12NzXXTAEIFKD6mSeQPuT+pu5ZL5snBJqpd4X4PMpQqP5eB5x2PlDT6qLZppSWH/WvIgm1xHchijzbc29oJRCxvPnV4x65Dx8Mt3Rui6/cOUWxaJ/LMo7FraPIWeZbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784164912; c=relaxed/simple;
	bh=1i/rkDKMrWfeZzJlTSpM2d5VSdn3dkHNj6ILGCp75p8=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kalzEzBczPetIu9d3M1BxQTQvYeudAxbS2icFphIN1K1NsA9iw5f1TDyU2o/hVTEuHtQx63R/RE6+ffNOgdzRw6JNDwNCKosbJkReu5MwHueNj+Ed46ALZqAEMDGcII0KD3qDTaIyecj5wC3hdjM15GGbDwm/DmQGWuFOLi/9JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=bBfEIg7m; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="bBfEIg7m"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5bfdbc68bbeso1928833e0c.3
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 18:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1784164910; x=1784769710; darn=lists.linux.dev;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xIEX4i18qoVXbjqoK0UngJpGYgpYOqx2AEwOVZpDdYM=;
        b=bBfEIg7mCrO5Hmqw1rPUhR2KiJ+6i+TTLnfNBAbjvmrQ+5pVbBDW5yJx90CMKPY4BB
         MXG51/GnwFhz7uq0/2yeWN4pKfRbFtmgDP/iwaJt2FTVNdXGChmWWfNvIs3m98uZ1Y+I
         LolmRNHEXqtQ5CwFE/1KflhVrEN1tECijHSI3k2RLw/PBEyfTpNCWxL9BTCGNkzrIKuu
         XU068qNmO4T4xePj69lnWTBMKdMTRBq68uvrUTMsgSewQyIO4Cy2fZMaAwoKyDZTv6wH
         jGwrqovNLx67fY7EzhZ48D9unhZ8FUfjbfITHJikqzn7SYkHd2Q0t1a8Ud5fXvHs55lx
         5GcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784164910; x=1784769710;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xIEX4i18qoVXbjqoK0UngJpGYgpYOqx2AEwOVZpDdYM=;
        b=mqE8lPTq10XXy6MA6w/0AyhV/oLEm652oItJFypILVwtUAf97gJOqFn4Oj3D1Hw3C0
         0aruu6uYk1812KMMjSPtiGTLBw1mJHJfE3DrExxVTKiJ+j1wT98pAwBmlKeYQTIqVJN0
         zlM5iNT9gjrnmwbIL00yBOemamFL/zQaVCgxqZ05YtxBIEN4bnrYxhpGUeBcwXEC0Szq
         PERMThOLrMADxdMQi97urZcXRDTJfmLpHjQotKHKKrLsHy1Rt2OpbWk7/uJmRckUR7AQ
         VBe9IqpMb93uTAxB9zrf7IudULCZvMfU//IZxuj6gRtc+ta9Q6DfIaYhSVhkly9zxBq0
         /02g==
X-Forwarded-Encrypted: i=1; AHgh+RpecSljpeSEa4fWCX5JvHAV3HrmD1GColzlK3p/pP6GREYmOL5WQkaHinTbLDaliXcGGvJnD//D8n0+r4rh@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+0kJm9mBep383ochSHZpqN8ah4k6/Z5ac2SxLEzatcwtBWfHt
	IjQAGrngE497TPRFunvdyWmWTmQZYrHi2uRtH2pB/YTnDgixd0Co9P8HytpMCktzLSY=
X-Gm-Gg: AfdE7clLzt0JcuAQKVOMD3+ZrpOeJV19Q3Ax8dhuuQyQWsvZiBgmJQe+0UkY50XPMnE
	BQvo9dEZyRlSpmuZYcu66O6HL0tgpOgqD3UUm/IwQNgQj2/cKtLIhcOZ9Vgeun3SAmSaXKs/de/
	km+Z3sKPg/2CoSgmK++d2JjC1HvFyy8SJxzTrNPy9Bo6sct6ymOTjCTtraNV00vyN3v8iYEE4yK
	BUcuwG9nNEwXZGhIcsLv9uq6/xzQkvOljV8ai5wQin/y4vK4NpdTozkyQPZ+oLij/Yk/cA+7x31
	3wRBcbMV7tZPiwc/vLZA5RRb2U8FT7vG8l6p2mA3GUhJ9riRUGpaVUOvtXDKJjmCfuJ14AGJH3B
	eqiGx7gNqJK+vH+trc2zqNkJsACYyB7OkZ2Z82h8DkOGABtaPCaEkkbu1Qu2SvgSS3l3mmGbAmF
	YheIq41wI=
X-Received: by 2002:a05:6122:6d09:b0:5c1:2150:9de7 with SMTP id 71dfb90a1353d-5c121509e19mr2977113e0c.12.1784164909903;
        Wed, 15 Jul 2026 18:21:49 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::5ac? ([2606:6d00:15:e06b::5ac])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96ed663ded3sm12075936241.12.2026.07.15.18.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 18:21:49 -0700 (PDT)
Message-ID: <cf1251490bf5c07649ce5ef3a14ec3d8c4314639.camel@ndufresne.ca>
Subject: Re: [PATCH] media: meson: vdec: fix NULL pointer deref in
 vdec_try_fmt_common
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Christian Hewitt <christianshewitt@gmail.com>, Neil Armstrong	
 <neil.armstrong@linaro.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl	
 <martin.blumenstingl@googlemail.com>, linux-media@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-staging@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed, 15 Jul 2026 21:21:47 -0400
In-Reply-To: <20260624065809.2460720-1-christianshewitt@gmail.com>
References: <20260624065809.2460720-1-christianshewitt@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-KCwQdVf4kwVZHhK4QLVf"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-KCwQdVf4kwVZHhK4QLVf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 24 juin 2026 =C3=A0 06:58 +0000, Christian Hewitt a =C3=A9crit=
=C2=A0:
> When VIDIOC_TRY_FMT is called with an unsupported pixel format on the
> OUTPUT queue, vdec_try_fmt_common() falls back to V4L2_PIX_FMT_MPEG2.
> However, if a distro has locally patched MPEG2 support out (as it has
> been broken for some time) the platform format table does not contain
> MPEG2 so find_format() returns NULL and the subsequent dereference of
> fmt_out->max_width triggers a NULL pointer dereference.
>=20
> Fix this by falling back to the first format in the platform's format
> array instead of hardcoding V4L2_PIX_FMT_MPEG2. This is always valid
> since every platform defines at least one format.
>=20
> Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

>=20
> ---
> This fixes use of v4l2-ctl and v4l2-compliance tools when MPEG2 support
> has been disabled via vdec_platform.c - NB: although this is a fix it's
> also a rather niche scenario so there's no need to backport it to older
> stable kernels.
>=20
> =C2=A0drivers/staging/media/meson/vdec/vdec.c | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/staging/media/meson/vdec/vdec.c
> b/drivers/staging/media/meson/vdec/vdec.c
> index 4b77ec1af5a7..f3e7072f221a 100644
> --- a/drivers/staging/media/meson/vdec/vdec.c
> +++ b/drivers/staging/media/meson/vdec/vdec.c
> @@ -504,8 +504,8 @@ vdec_try_fmt_common(struct amvdec_session *sess, u32 =
size,
> =C2=A0	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> =C2=A0		fmt_out =3D find_format(fmts, size, pixmp->pixelformat);
> =C2=A0		if (!fmt_out) {
> -			pixmp->pixelformat =3D V4L2_PIX_FMT_MPEG2;
> -			fmt_out =3D find_format(fmts, size, pixmp-
> >pixelformat);
> +			pixmp->pixelformat =3D fmts[0].pixfmt;
> +			fmt_out =3D &fmts[0];
> =C2=A0		}
> =C2=A0		break;
> =C2=A0	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:

--=-KCwQdVf4kwVZHhK4QLVf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCalgyKwAKCRDZQZRRKWBy
9OvqAQDPEXcCfysbjMcLVok8WR5NVGdePin12f6DHmQ4YTlBWQEAsFlwChimwCuO
DdCcPjAuGpLhXWPu0UTxtMyQfsa74Q0=
=Wvj1
-----END PGP SIGNATURE-----

--=-KCwQdVf4kwVZHhK4QLVf--
