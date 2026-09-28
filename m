Received: from mail-vs2-f37.google.com (mail-vs2-f37.google.com [74.125.227.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154F74F55D6
	for <linux-staging@lists.linux.dev>; Mon, 28 Sep 2026 19:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790624077; cv=none; b=UWu2KUTvUbzSfqpI/3JBkvTH9E4QCMkpPQB/GU6cxEewU8q/EI4sYFnxLzcynlu1BMORUnrqi4rbevATk5MJjUeqS/5l+a3AYGjP8Rd+Zb6KlMfqWKGfu5TZjmJynDB1sCJsDMeHxwlK8R0lARGAplMiN61IaNAyskKpLC2uiIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790624077; c=relaxed/simple;
	bh=24LYI7ixiqJFkmTEKu7EMW+aQKI7xkdI9mRWWLKa1xE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ORR42MpR398xlnsNhWfkBriUc+gk4o59vamuOcZfJ1CgtpMclQbgvPppaOtAQmwAgyF3eKVykOUFDzG3HRQ8ahQ1etuVOEhAs3Z2ilrcrhO2jorfXyD0Q1e3WxleDugxuj4fsdzonmqzrvSWYNVuN8/MmEGfN5wWim58ExuQ9jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=S0o/hfns; arc=none smtp.client-ip=74.125.227.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="S0o/hfns"
Received: by mail-vs2-f37.google.com with SMTP id ada2fe7eead31-7b42f1cbcf3so1264587137.1
        for <linux-staging@lists.linux.dev>; Mon, 28 Sep 2026 12:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1790624074; x=1791228874; darn=lists.linux.dev;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6eqac1h8irF+zeWRR8Dm7dn5WwgpsnMLx6CDzc6fVO0=;
        b=S0o/hfnsl2UGmDwRyzQXpSHO0BtHGQfHn4ZUGGTvmgP9alW4+C/4dzDpa7zOsDiIDE
         cA0f9/bYnqlBDgZoEhrk/vq0YyT6Gs8j0BkUNbfRm7/LlCsJkEeHl2Xe2mF9BOcVM0uP
         U34ztltR01IAa+losI0G1ZskPsdeFeZlP3ubkFmfy8kfYQ7zyjUXgBZ3up2Tb10oxYZB
         0rtv+iWWXBuc6Zqf9hSl7OE9V22tlrKUli4Jo6hkhv3hLFWUDCPI3wJweRY7RuhatY7r
         m3b+W85AiEe9Tc7WKtTMouFOuelN5gDIDqGbzKYCmTWr1pFFny3yBegEGBm6qreytubV
         RyAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790624074; x=1791228874;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6eqac1h8irF+zeWRR8Dm7dn5WwgpsnMLx6CDzc6fVO0=;
        b=ACvyhsysIEMuB7arD8aKX0LVUiDayLSRpDwQV4yzYQ2gsgGGFIk9y7DYqtoQefk733
         tRpYE0FenK+aUIeZOU8+LDmBEvL3iltcn4kzcceS9rJ61g+W4ie4MLLDc78db0xdOgUc
         QFcS/w6mK3yJ0nf66o91OQFz7a20ov3EzbnDnj4bjPXffKGibZobpifA0DIKJ9KrLjBa
         A+ObbDlxxEP4M0E/xxvpjrxJh83sjnwl7fsNGAx5a7TEeeXU/tcIOVYnHRNonoxXjRVG
         9u7RI7M0T9XxxF1wzbh6iy/l8+qdVrAtIB8kfmVG8MTUjHTFonWoG1A1mPxLrtNu4oFk
         C22Q==
X-Forwarded-Encrypted: i=1; AKwUvBypDQk7dlQMm0pI1S/wReDsz/qWGLnFvccH1wU8mj9vybv+0BxMp58Co1XgUdUR5qQMjIV05/TNazWqoSpc@lists.linux.dev
X-Gm-Message-State: AFq9FYK64W2IRCMLnPEztAexcCww6LeP4O8p48TQ3BgZF/6+495kRvsM
	JAttsoXYH0JKHaa1duMWJxFsXJnHZ7gKreSx1e6fwwcnTyuiuVVbxwLwsDHE+6KN/Wk=
X-Gm-Gg: AYBFou2LpTAFbMI1/Klquwuq8Zizf2MP6ku3rxyMBf3bBrdnSo9z3N5uGTUkyEr7sv/
	uWfOND0x5akK5ihpfKumWKsWvYURXDhdvWknAwMWM1CqD0rk+rBLihw8+IXx4Ef0scQfkaKPzf+
	sHLzPVvs/yu20CelUpS75YD/WMGkJc8Uu7H1uPvjXaeG8BPSIERLFwm/rhLil5rr8hzOp+AtLtN
	qqYw+ZyEuzl++NDkS/cqGABvVP0MNzNzmuP/jO8t+NsNKeBt7qgH4izbzouHZocPAblye9k6UHB
	8/m2P7en/DQgZLX5pn2I1KODVHlYCZilRRqTii23l2HYmlj8e/dNpK2YXSAO4E2Bb4hmI0QT4n8
	oaLkaHN7xs3VB7Z2JxZdGRrdOyTtQfcd5GE4bwbY9OOEPwT23qxJwxuK2ogYUfD5SCGRX689W3p
	ZaHY+vSpW8RnNMuMj8qbWC4u6S15vsXhr+vzWW37rqGK3Cpwa/MhkvXhWInRDSWU6x3dDAwTcjr
	hFYFEjRASNczQ==
X-Received: by 2002:a05:6102:c94:b0:7b5:4700:3a5e with SMTP id ada2fe7eead31-7b547006f20mr1391763137.11.1790624073763;
        Mon, 28 Sep 2026 12:34:33 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:34bd::5ac? ([2606:6d00:11:34bd::5ac])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5cde6b43916sm10558755e0c.18.2026.09.28.12.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 12:34:33 -0700 (PDT)
Message-ID: <4f6f3ba03cc3520505a3af8a259bb1db4fc68e19.camel@ndufresne.ca>
Subject: Re: [PATCH] staging: media: meson: fix typo in codec files
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>, 
	neil.armstrong@linaro.org, gregkh@linuxfoundation.org
Cc: mchehab@kernel.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, linux-media@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-staging@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	hverkuil+cisco@kernel.org
Date: Mon, 28 Sep 2026 15:34:31 -0400
In-Reply-To: <20260508055731.19784-1-mahamaryamjavaid@gmail.com>
References: <20260508055731.19784-1-mahamaryamjavaid@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-ioRvVvCQ5XFlC4aqFG8O"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-ioRvVvCQ5XFlC4aqFG8O
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

subject should have been "[PATCH v3] ...", already picked but wanted you kn=
ow
know.

Nicolas

Le vendredi 08 mai 2026 =C3=A0 10:57 +0500, Maha Maryam Javaid a =C3=A9crit=
=C2=A0:
> Fix spelling mistake: substracted -> subtracted
>=20
> Signed-off-by: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
> ---
> Changes in v2:
> - Combined both meson typo fixes into a single patch
>=20
>  drivers/staging/media/meson/vdec/codec_h264.c   | 2 +-
>  drivers/staging/media/meson/vdec/codec_mpeg12.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/staging/media/meson/vdec/codec_h264.c b/drivers/stag=
ing/media/meson/vdec/codec_h264.c
> index 89e0f8624e5b..a6074de15118 100644
> --- a/drivers/staging/media/meson/vdec/codec_h264.c
> +++ b/drivers/staging/media/meson/vdec/codec_h264.c
> @@ -16,7 +16,7 @@
>  #define SIZE_SEI	(8 * SZ_1K)
> =20
>  /*
> - * Offset added by the firmware which must be substracted
> + * Offset added by the firmware which must be subtracted
>   * from the workspace phyaddr
>   */
>  #define WORKSPACE_BUF_OFFSET	0x1000000
> diff --git a/drivers/staging/media/meson/vdec/codec_mpeg12.c b/drivers/st=
aging/media/meson/vdec/codec_mpeg12.c
> index 76e9ca7191ab..ab4374e3b2ef 100644
> --- a/drivers/staging/media/meson/vdec/codec_mpeg12.c
> +++ b/drivers/staging/media/meson/vdec/codec_mpeg12.c
> @@ -12,7 +12,7 @@
>  #include "vdec_helpers.h"
> =20
>  #define SIZE_WORKSPACE		SZ_128K
> -/* Offset substracted by the firmware from the workspace paddr */
> +/* Offset subtracted by the firmware from the workspace paddr */
>  #define WORKSPACE_OFFSET	(5 * SZ_1K)
> =20
>  /* map firmware registers to known MPEG1/2 functions */

--=-ioRvVvCQ5XFlC4aqFG8O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCarrBRwAKCRDZQZRRKWBy
9LQxAQDbhfzAoaDPMzDhwB/2BfSnHFrathZiFBRY73XPw8V60wD/cj3/gXBOsU2H
IXhvc2D00xxNhwhw9hEzo1JUkC370Ak=
=AYIv
-----END PGP SIGNATURE-----

--=-ioRvVvCQ5XFlC4aqFG8O--
