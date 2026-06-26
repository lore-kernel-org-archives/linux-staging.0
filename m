Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C8E3F23DB
	for <linux-staging@lists.linux.dev>; Fri, 26 Jun 2026 13:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782479900; cv=none; b=Ui5wWILkh/OcaNjIwk5HJP2uMhBaxInhf1UGxi5iMV+C2LPGXpDuObb4tDuKi7FCzUYBVcK+hBXeS4I5NCvnTbC6x4QXnhF+noZVtNsf6DZIEeOwIHfV0dqE6FKSkC/5p3KrlEzfyTfcLo9KMhY2cdABVAJM3euC6YGcX55fFG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782479900; c=relaxed/simple;
	bh=g74h5nMG2Muxpb1zKR1SzpZn4GOvZVqUJyiTDhZ+Qdk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q5rs0vDFEPKGtKRFOiaYuwMGrLgHH+E0Sqxha2ERZPU/r7qLxJ0+QpY2N5quVN79k2OM+9I4yGmyOSH1Nj9rcI7FwCkj5KWD1rZCxRUDiw2Eufl8W/uSpgqx/Y5ztQ0fuLE8BxHhVRhm4fLd8wf6D1QE2YkPKoiktLT7gA4bztc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=NECHJXPl; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="NECHJXPl"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490b1bbcf3aso5000305e9.1
        for <linux-staging@lists.linux.dev>; Fri, 26 Jun 2026 06:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782479896; x=1783084696; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/VJE2Q0wRemfAFmMp6oN0iCUsBxXjEe9Lpsiy0TlcHk=;
        b=NECHJXPl2TSKxhQ7Qk7yeBJ9pP9BNXtT3fTO5uRBGfy7mlYwoiMzZtRqzi3MUMct0y
         2zwAUX1SM5xOFBSO9G1v20Y9rb5uwXw5GK2lbhgpgYJFMzE4P1dMBdV82BTrKG69LYFu
         eEsYUN4pvszhIj749opJnzZVMr8BcmOG7lPwgRj3OhdsEL8u3LS6e+BnJDWru7/JrrVD
         WFxJDBCiwX6b6EUoPgPWXZBrVuDyp9EOiOS5ZPUqOnW7PXq/GC1IxJfWRtSam3knYFoo
         bCcVsUDaMjx/QSKI4bitwUEOXkkskex/XE7XRQBnyDoWYeaeUHrptS8jqRu+pc5JGrXX
         0KsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782479896; x=1783084696;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/VJE2Q0wRemfAFmMp6oN0iCUsBxXjEe9Lpsiy0TlcHk=;
        b=sszHKmf92WbP2H9hYR4R0YH6FVvP7IV0cpnyy+1Z8ZuvLZ9CaKf1Me7pWf5GIFBjMh
         dBKAmty2Ig2pYPUqyBAnbRWGjXr8+1dE8YaywU77+349D+jDTGMkkheJJ4Znj+y6Se3x
         F/0Y6G3YLAshBVJPUDnL/kjcxqhv/avdoyRNH36HgWQEXY3mU86dQhOk/J2prXOMFD9i
         LCUjJuCsaG/qrQnaBDRr42sjGnH2LRUT0c/EJLXNRzPTbvAQQi0iHeJDUviIWd8qP7uH
         pLScUZxGbdQ8lPNg90V9dt20uyuCqXgIIkAPsTnYibUjmbfz3T61UD7JD7MpuQErxwS+
         QtkA==
X-Forwarded-Encrypted: i=1; AFNElJ/Kv2whkNrMEJBUCJurzJ2cx6BPOOTWadXMnwQUAIxvCM3OMdYgFJyl9wPOAsElNEAuc8QddAGtVlSLL77Q@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6PUQAT9Mv6CFoX/kccSDJUGFLuxsi7+6IifAYEhJISyhkoLkC
	PIPAr38ZyUa48fMOscC4GvgXnd58HWMsfpb/R8qWwPNZyFuKwsWvCINGsaMpzGdXVXI=
X-Gm-Gg: AfdE7clEnSFysjsWX29Z+8jRAHjgQFgG5MCXJRELPe2Rl70O8oWio51Pp7nwx22GeoG
	CxtwpCRHhMfxlnlojm3oRug0u2tLBrEFPP5bNzljCdV8foqc07aTt4eD42QstDmbIsF2LfiZ6y6
	YrFsp6N2lNYKAbzUzuDPmbQZ99EudZVZlsxz3Z511tZCpLQZ9sqmWEB89tZZlS29PmcC/Vi/mqj
	SwVofACUN/keNXB7usSi5mXNQFb8ih92OK9jQoB1HwiJOj0Ii6U3z52VyI5sHC3pkHd9QgjjK7h
	3Hx4DCpi8yQMcXdxDoZKw1l1pefu814IehX3GQBJ0vPUg0Un/hths7Lmx1sT012RwmAU5ajXArr
	yIHyKy7mHY9auDZo6rBz5pcarENy6miLFJJwqylUa8XeWzNCbMNRWtcld4c38Arje5EZRE/a5m1
	Vv4IfSXiCNCQKAeBwtVNReBf/NPjUdYeKOn5vdVrlaxdjwLy++HxHC0WWZe2I8Bf6o6gPOcGru2
	ox2
X-Received: by 2002:a05:600c:8b82:b0:492:6fa2:fffe with SMTP id 5b1f17b1804b1-4926fc2ee01mr11951535e9.8.1782479896318;
        Fri, 26 Jun 2026 06:18:16 -0700 (PDT)
Received: from localhost (p200300f65f47db04b3606a871f5f1c38.dip0.t-ipconnect.de. [2003:f6:5f47:db04:b360:6a87:1f5f:1c38])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-46dcbac0c9dsm15087448f8f.19.2026.06.26.06.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 06:18:14 -0700 (PDT)
Date: Fri, 26 Jun 2026 15:18:13 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, David Lechner <dlechner@baylibre.com>, 
	Andy Shevchenko <andy@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux@analog.com, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 13/13] staging: iio: Initialize spi_device_id arrays
 using member names
Message-ID: <aj570BhA6oCEOgJ0@monoceros>
References: <cover.1781883685.git.u.kleine-koenig@baylibre.com>
 <cac7a68e6a6adb1b58207640ab045e59eec86f53.1781883685.git.u.kleine-koenig@baylibre.com>
 <20260624185419.27db9ef9@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7thw2omwi5v34cxb"
Content-Disposition: inline
In-Reply-To: <20260624185419.27db9ef9@jic23-huawei>


--7thw2omwi5v34cxb
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 13/13] staging: iio: Initialize spi_device_id arrays
 using member names
MIME-Version: 1.0

Hello Jonathan,

On Wed, Jun 24, 2026 at 06:54:19PM +0100, Jonathan Cameron wrote:
> On Fri, 19 Jun 2026 17:54:41 +0200
> Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@baylibre.com> wrote:
>=20
> > While being less compact, using named initializers allows to more easily
> > see which members of the structs are assigned which value without having
> > to lookup the declaration of the struct. And it's also more robust
> > against changes to the struct definition.
> >=20
> > The mentioned robustness is relevant for a planned change to struct
> > spi_device_id that replaces .driver_data by an anonymous union.
> >=20
> > This patch doesn't modify the compiled arrays, only their representation
> > in source form benefits. The former was confirmed with x86 and arm64
> > builds.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@ba=
ylibre.com>
> Applied.  So that leaves the pair related to Andy's comment and that ADI =
IMU for
> a v2.
>=20
> Thanks for your hard work on this.  I merged it fairly quick because
> I know we are going to have some merge conflicts (mostly other folk
> tidying up individual drivers as part of more complex changes)

Thanks for your cooperation and merging it. The combination makes this
worthwhile.

Best regards
Uwe

--7thw2omwi5v34cxb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmo+fBIACgkQj4D7WH0S
/k6eWwf/Tvn+bgvNG3NK+tD84r9aiGJo4jpMK1kWEL1eDrhI0sCrR2Kr8jaYb0Kk
Dj7pzmKa8uyYV+saXCth2I7y8rWNSmsphOwE87zPEfRDCGgYq3L0Ei77FE30GtOT
OYEz+uBkcsDyz0cIEKrueEUBViG3KhnmKcXr4jwF271JP2VbAqPiGh6ctUrUN4Nf
AJkQcx+VQjQsRZovjvaPeQGkymlKNlHSqngjNuGpYFN4zCEPL2/BcPrm7qqXiG/T
Y5RwvpwNMC/uBZ+0Mv0DlIrlVe72dTCk/F+eX0Nid0BGVLyefvVaPJdoy2Ntfsck
/xsSrJhj3o1OTf9ZgY1aooUnGcxLKw==
=ADFr
-----END PGP SIGNATURE-----

--7thw2omwi5v34cxb--
