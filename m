Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F49419D8B7
	for <linux-staging@lists.linux.dev>; Fri, 11 Oct 2024 21:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728683177; cv=none; b=ZyC1Qz3N/vNQcAMTjm7wNoNBsjDXdReFxV+01ajR5B7KKF8sSx1Tv1qXGbFuzIl1VGYf3qol3NKj8hwu3wOJKxSql9nS10YkOdt1IGEgUutxPmuYJPANbIbagYdzbhaNuIeFa7wWIxVcEskJri94zdqjHfwAi7dMBq9efzxcvgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728683177; c=relaxed/simple;
	bh=7LipFZSSP1A4HekPYhO5ED/zfKXvS9Q5aHhRMPLupWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V82FCZUyhxdYLkBI9XJ2em+Ya9PRNYgYLFxiDIVzxS7PVrpVgm5vqe5rSWY5Ju17IlNCCjjMLAyfnPPnEyWrX2ltX0KXI4XhGIzC2gK6tephulLnlFhg2eA5E2s2IxU9x9KDcVG1pm8BAX0DffSMs6ECvTG+2hlkB+6yTWMZPGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=UHlc6njv; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="UHlc6njv"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53997328633so4175765e87.3
        for <linux-staging@lists.linux.dev>; Fri, 11 Oct 2024 14:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1728683173; x=1729287973; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7LipFZSSP1A4HekPYhO5ED/zfKXvS9Q5aHhRMPLupWI=;
        b=UHlc6njvt7GgH6rpWpQVcwqe/rPJaAIgbfGKVWxVu6hMyw+xcZlSivNIysYC61PiVj
         w2LC7VCxlZNFLBL+AxFDCQ+QQlEbAoYNPMl8DzOdp0Gn/D70KsyrGf+xK/GIQg8HLg1X
         hX3T/RdJZR30c34/ven8jDiCtOwkwBOzhbrG0oNQfV9/IcebnWb7DMTaGXbJRCQES6k9
         TyEeCb7639Ezy2Xmx20D8PbCd7G3g8fw0CJZt1Ok1DW5yQ3mA9G5+RdfEEkeGfOE6UYR
         YwHHGZFaP0mk9s2QKX44GdvfMWTeN68HJCxKNP1yUedVKjuGdpW2jpptUOdYFZF/tOow
         DsSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728683173; x=1729287973;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7LipFZSSP1A4HekPYhO5ED/zfKXvS9Q5aHhRMPLupWI=;
        b=PesyfZrbr3Koj6jMUeT/doxYkLnK4bh2LBmK4NtZ40foLTPmXqBZv5aOMpNZZD26L2
         pfZm+2cjzX4eulrJm0iExbBkBt7xc6sk8OW7ty2q1Iib3z3M2PxV39OJEciYclAnlB83
         9x3QzdjuRtVWVzUAq41OSvOflHmHueXGIekM2kXwX/QfKYh8kNSvuDqGq70759k+O/Ey
         6oVqCvrmpSssyD1fWQlSis4AaGQhdSVa24MfQ8ru/9o1nQgZqYdHxXR7UStAbkovtnY/
         SqSEz39bdg2CjpSmRw+d1s1VSjoyrEASyYH+4utajQ6jhnb187kRtODHDP/mtPElCAW5
         YRqA==
X-Forwarded-Encrypted: i=1; AJvYcCXri1HaGA7eDbaqfTHxxNHg510cIiDgxZjGLHOxJ9Pwcl4ZJxjo9nrYhK9xi+uqFdXiaZSzPyHgbPZLFVMP@lists.linux.dev
X-Gm-Message-State: AOJu0YyUVrXGgy2BPuprN8S7nTIRGJP4AgVIufg2dH4JL7lmgt2uP5fX
	pzvtDOpe3XehaokDu9ekQHsedZqaH30nux9CKgUtB5h2Sx7ddUeq5ORveiejO5M=
X-Google-Smtp-Source: AGHT+IGVM2TG+HOhlrOFFnNHSE/mhcMsJ2lxfliGNd/+NilQIDLR9TUVsI8Yc5YydiTcMV93MR6pxg==
X-Received: by 2002:a05:6512:12c7:b0:539:947e:18a6 with SMTP id 2adb3069b0e04-539e571ce25mr479695e87.47.1728683172437;
        Fri, 11 Oct 2024 14:46:12 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:5bea:757f:d71b:2501])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a7f5cebdsm255629666b.93.2024.10.11.14.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 14:46:11 -0700 (PDT)
Date: Fri, 11 Oct 2024 23:46:09 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: media: Switch back to struct
 platform_driver::remove()
Message-ID: <m5ezhgxp5kwup65cieicws5fviwdapqmwm6ldiojic53pgs5tj@iu5u4wf74fzk>
References: <20241011070828.851449-2-u.kleine-koenig@baylibre.com>
 <CAMhs-H8-8wmg_OqxQrO93ZV1Mrh-2GKowoWpvdk5qkvQbQ-F=A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6j7f5lqnyzxrx46e"
Content-Disposition: inline
In-Reply-To: <CAMhs-H8-8wmg_OqxQrO93ZV1Mrh-2GKowoWpvdk5qkvQbQ-F=A@mail.gmail.com>


--6j7f5lqnyzxrx46e
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] staging: media: Switch back to struct
 platform_driver::remove()
MIME-Version: 1.0

Hello Sergio,

On Fri, Oct 11, 2024 at 09:39:09AM +0200, Sergio Paracuellos wrote:
> On Fri, Oct 11, 2024 at 9:09=E2=80=AFAM Uwe Kleine-K=C3=B6nig
> <u.kleine-koenig@baylibre.com> wrote:
> >
> > After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> > return void") .remove() is (again) the right callback to implement for
> > platform drivers.
> >
> > Convert all platform drivers below drivers/staging/media/ to use
> > .remove(), with the eventual goal to drop struct
> > platform_driver::remove_new(). As .remove() and .remove_new() have the
> > same prototypes, conversion is done by just changing the structure
> > member name in the driver initializer.
> >
> > Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
>=20
> I sent a patch the other day to convert all staging drivers to use
> remove which was applied yesterday.
>=20
> See: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git/c=
ommit/?h=3Dstaging-next&id=3Dc1a5060ec80020ce879fa5b2a16875bd9a5ab930

If you really must grab this quest from me, please coordinate, or at
least Cc: me on your patches.

Uwe

--6j7f5lqnyzxrx46e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmcJnJ4ACgkQj4D7WH0S
/k49Uwf+LrZMR9SYVsbl/YHY2WCj3oTc/G5d/Pxtt5jEjTkQnbyowL4KYRlXgcKJ
yRtSpF9nuIGRqrzPjZJm2jdDkNLmw21rwGvYryePDVeI4CcJQHdyUJ8Tqcb3s2pT
ZVPAZp9j7EjuJbmDJeQE+d+MiOOtKIujCtKNWiDfW1orHl2vcG1POjlVRXpR0EEV
oC+NCbY8RKx00gYpX/H6wxybcO7DdMxqmkWOhRUF2DvFrhfHxmqRSggnj9zZZ/kh
LRE9FGbxB0DHzkuxgwrS4lwlBEa/5WspzpmipXYb407Kkc0RrT132TqD3Suylc3R
F27mRtuPAmB9Ot9aJY2j0AtRtejn1Q==
=beLi
-----END PGP SIGNATURE-----

--6j7f5lqnyzxrx46e--
