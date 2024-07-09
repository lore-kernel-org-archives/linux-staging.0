Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B4713D63E
	for <linux-staging@lists.linux.dev>; Tue,  9 Jul 2024 06:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720508321; cv=none; b=a6hJGHNsEnjxf4zhNdUvPZjIr2v8f22HrMIJfcYcba8kRNGe91+U+Gk7sOLPQOXZfmkPN71Zj06f9texswBK1aVgZ5DNex5qfve9WHrfhtV4cVgXT6QnghjWSUdGF5BjVtoIeceipDExY+pnTC4jCKLer2xEmOQZ4xLvPxKTSPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720508321; c=relaxed/simple;
	bh=6cpbzmjkMj/+KT7yjNAf9Um11QZ/lIiDyJuGkRGSK4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uzzTkC9vCctLfakRZudGOw70eiYdFvBLqHF7UTlwWTlkjseXTiS+yqguYGCHumP1lsPaQgNp425hoEd3IPoNbdYtd9p4W6BWIGYTXt0Fvq4BwbBRVGpcYqWowFx7YUxWuIpHZqkHDrT510B8zaeE4WtIO7huuWc0yencOkUsDB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=CcWZ1l4u; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="CcWZ1l4u"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52ccc40e72eso3031093e87.3
        for <linux-staging@lists.linux.dev>; Mon, 08 Jul 2024 23:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720508318; x=1721113118; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KBZlTb8Eof6R20qrr/sRa7dwLCzeq9PnMFLS9YGLiLI=;
        b=CcWZ1l4unjsEEY3Nl94IHzI3q0IYffdcja0aCtmWWzHNGdqZX0Y6vh0rTwy8TRNTuZ
         En30kI3i95A2Z/+o2omoKZpGprZzG+MuFzdlJbbBbiwgp/PJaE36ZBtgYVdbeAAGEEtt
         3ZLDtzDZPwEXOK/wRhjHhZUytYk841XZuQKn9lIO7mPXyg/O3LSqr5ZFF/ntrZD3rWf3
         6NvnVF/aLooXry62ykhn/mFh6lPjgoKLDhQSHwuUhcmbSh0IiT4WDRnFThgMU8ZSy3U4
         gK6q09BStB9ctIFaSNuvCj2XxHzykpLpFBFEGFfPo1irf8Wa3LCcypdcBx/AG74mPRoI
         DTcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720508318; x=1721113118;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KBZlTb8Eof6R20qrr/sRa7dwLCzeq9PnMFLS9YGLiLI=;
        b=xR9qSTwswaSJoYL2mglQgAJyDnaBRZkx/3f/DcqZdNBzMDUNvqWu6CxW4s+U1Kxm+B
         8q809u+lv6TrhxTy6wjGPcndaS3Qo9ZXafp3ZOVVfCz1e6Fe9fovOgMwIbUoIxpqgcTd
         dLvqTqVbVkjOZpb0YxO6QhBLc+Vkw2M4YeXRKyqqARxDY1Yz86Z/JmM1wFo6PwEOHxGp
         hIxjizSq32oHIiYjRApl6NY9AoGQhahVuPV80qrxhGCsEQKchy4DvTbuexxtKVGN/YtW
         Zvxpo6Ceeln3i7pfvuXE9EINEiUjy/O6stPMmIWoweAcmCaoACpovrzvJZS7mRbbL7ZA
         iB5A==
X-Forwarded-Encrypted: i=1; AJvYcCXN57Opynxmp3sNQOIifhTkjgDJgxrwKbQWrkgS2u4T+3OkCHittwLAQFKePLgWhU9cnmWLwdaiVbHCIvSadY++TjayTQATWeWXxo8Vxg==
X-Gm-Message-State: AOJu0YxB4NqJ/qHPrd9aOPJqjJuL8hvcJ6zTKI8tvDCXO6SzrnUXnFrv
	9pcBePy1bTw62yQBxsxo/YU3eseBDXmqgckNvHtL+dWThEJs8yg1/chSSxgr/dA=
X-Google-Smtp-Source: AGHT+IGObn48yczLVOSPPn2MgOHMOxVpueStKydNv/bOLPNKAJELBv0hX605oHaZX1AC9SAjpv4s/Q==
X-Received: by 2002:a05:6512:3142:b0:52d:215b:9028 with SMTP id 2adb3069b0e04-52eb99d5d76mr931572e87.60.1720508317663;
        Mon, 08 Jul 2024 23:58:37 -0700 (PDT)
Received: from localhost (p50915e7b.dip0.t-ipconnect.de. [80.145.94.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-594bba548fesm706835a12.11.2024.07.08.23.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 23:58:37 -0700 (PDT)
Date: Tue, 9 Jul 2024 08:58:36 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: 
	=?utf-8?Q?=C3=81gatha?= Isabelle Chris Moreira Guedes <code@agatha.dev>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>, patch-reply@agatha.dev
Subject: Re: [PATCH v3] init: staging: Fix missing warning/taint on builtin
 code
Message-ID: <yttxdeeg6uxosoiom3jf6h5wfkgk7ths6qnqf5s3sr2nikftgh@dvexcjeznxpp>
References: <zsk54zosv6tht4j4nma4ix7lq2knxi3ylqadd2foznc72nkaa3@xbc7gpozx6ai>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3knqfckw67jieu3n"
Content-Disposition: inline
In-Reply-To: <zsk54zosv6tht4j4nma4ix7lq2knxi3ylqadd2foznc72nkaa3@xbc7gpozx6ai>


--3knqfckw67jieu3n
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Sat, Jul 06, 2024 at 12:15:01AM -0300, =C1gatha Isabelle Chris Moreira G=
uedes wrote:
> Fix the absence of warning message and kernel tainting when initializing
> drivers from the `drivers/staging` subtree from initcalls (when
> configured as built-in).
>=20
> When such a driver is built as module and the module is loaded, the
> `load_module()` function taints the kernel to signal code of unknown
> quality is loaded, and produces a warning like this:
>=20
> [    8.076352] rts5208: module is from the staging directory, the
> quality is unknown, you have been warned.
>=20
> The same behaviour is absent, however, when a staging driver is compiled
> as built-in on the kernel image, since loading it happens through
> initcalls and not through load_module().
>=20
> This might prevent relevant information of being available on a bug
> report (i.e. on a panic log) among other possible problems.
>=20
> NOTES:
> - The patch is written in such a way that all non-staging drivers are
>   kept the way they were, except for staging drivers built with
>   `-DSTAGING_CODE`.
> - Since it changes some macros related to clang LTO as well, I tested it
>   and it works properly in kernels compiled with both clang and gcc.
> - Some `checkpatch.pl` errors, warnings and checks (with `--strict`) are
>   present. Some were already there, some I introduced but I think
>   they're unavoidable. Some IMHO don=B4t make sense at all, I think they
>   would apply for most regular macros but initcall macros are just way
>   different.
>=20
> Fixes: 061b1bd394ca ("Staging: add TAINT_CRAP for all drivers/staging cod=
e")
> Signed-off-by: =C1gatha Isabelle Chris Moreira Guedes <code@agatha.dev>

I didn't grok the complete patch, the but intention is good.

Thanks
Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Best regards
Uwe

--3knqfckw67jieu3n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmaM35kACgkQj4D7WH0S
/k53Wgf/S2QsAUpX9rVxaP4UXEN1jtI8O5t43BTPfB4g7rEmwB4vhT3ntuPY/VqU
nuebxMkdmMp7tiEb99uCfp2W9WDtZxsc6bf5BXuFyp1opwsvZqZXQBMVMndPTRf/
0xPF4vpb4ypXwI/XYXjRSnh7mRdF9UP309w87TGpqxde1/CZ4Q0QMldBpOUyfVZr
BrikXOzKfp4psA0fB1y7NLWXJeZHsaN+zGkzATc8w8ZfN1A67aPHsQf/Xj4cX9RA
Hd4aHHo2wp1DASkaevPXPna/kSVCxBpEbrBKqschrC1NiE4wexB1r79XbWnLOujZ
y6oCH3XDle5EvxxLWHHTpek8sWNbrg==
=Y6sb
-----END PGP SIGNATURE-----

--3knqfckw67jieu3n--
