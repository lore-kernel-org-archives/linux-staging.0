Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F28B253F2B
	for <linux-staging@lists.linux.dev>; Sat,  1 Nov 2025 23:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762041331; cv=none; b=O0lcFILHafdsWvzF48wbYKT4kOGmWqW3N8973VmN024imvvq0Y8UhtdM8XokH/zsJ+j/eTb1ZlJqi8U7mZ5N7IM9fETtTOLrPECHcP6hBF14owEUPU59jkgH4vR5/Ff0KMqwTqFKIRyOOOqnR/8J+gITAtNuTMMRZQDQX+OVL2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762041331; c=relaxed/simple;
	bh=tZnELm08j7of0Xfv0WmU01hVCDM6ZuupveTtZqvPt5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YSxDPrSCfrh3ArnaemFK4RqpBorctSPODQ2lE9S6Lob3hu0FmLC4EAyZeXqp20icnvJFu6pDpsWAQnTUwN/5M6gIB23qZ1zeTqcdpM0a71GdAZYSkDL3t+BJ2csMrpI2biPSUJvTy1VjN6WqZL3C21ecGsjQJy3vk0zx2IRikBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CXwntRLo; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CXwntRLo"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b98a619f020so436101a12.2
        for <linux-staging@lists.linux.dev>; Sat, 01 Nov 2025 16:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762041330; x=1762646130; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W4d9NbVLbZ71yjIsFOR25rdS14CzByZ0HAq9jJrJxxc=;
        b=CXwntRLoyuosnCCVnY/tMGpBR0uWygXpgm9QWtEZedf1anh0BqJgWgOJ1u56NHILd9
         6pQ7T+wP8qOWE1RdbuhIjO2j2yf0hBI889LY0ySNTGt/qY51QIm0VOV66KYzPFncS7f3
         PL3ewm2egkiX78y7POm+QCTPTGiVjme+13eV9vO49julDFmhVMRB4rLBtQQz2IkESoAm
         ZLXttqsvLiI0tC1k5t4tYADu7WtPbQ4bAKbR+BODbMCpgupyISoyRa2Tun7to9NmVgwd
         q/rRAUPh14GA5ic3YnBDEo+iWHTfW1tcvsR8Mum66TIoo9lCpaxlR4xY0na2QLBq6xUO
         y28g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762041330; x=1762646130;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W4d9NbVLbZ71yjIsFOR25rdS14CzByZ0HAq9jJrJxxc=;
        b=jQlsJ5tRaRoFa1ITIeUdUJI5NbRCnFmSOHc/RIm9pK833giGpVz41ybX0ktkRKLjNZ
         TaVLHbAPwGpHfmBdb1RKveLFV1OpisgZkpz1Z2FdU4JwMbz6y37XPZC2MrZ74YXBkPw7
         dshZ4NjXv2WjEdJpWLPJ6WkXiBxO6nOXK2GEjJxSMrIwBLBgE8U5K0/dsUOBMxPI3ml8
         e4VhyNidOmEjoI+cHkE9BoEyIJbyh0WHhLGPam3zSVU0RpnZciAJFp1MltGcZ2/xMCvf
         SY0dQ7OULjOmAIPNyjjjrhib2sWgmOKTl7gC9dBFYJ2FuqO3uV/rgBnJOcfrV5thZGYg
         5xVA==
X-Forwarded-Encrypted: i=1; AJvYcCVpFo/rgpNEWW0SB8rC0nrqmgrRGgfYhZxjeOfwjha9Zw6pyqgCB/7e3iZjwr0nIz71ddm0tohVyrBx2V5T@lists.linux.dev
X-Gm-Message-State: AOJu0YzheRdpLBcPsoOULtxyhIJzwVR18eqj+h1Z9+ADoPGdIZlEwIa+
	CtRSinM6SWymf0DHJbOV7nS4s2GNcQwxWv65mIdL8V68tGpRbiDtp5Dg/9z+8xuJiSM=
X-Gm-Gg: ASbGnctu4KYVtpBFVEgEgwXKt3udydwFAwhpKK5oDmKgZHTU0fboDwkrpQZbfCqMJ7D
	QxKf53GWVUZ+cS3BHQuvXku1J+DL20Lz0kEwoKmRa7mB8RfJbN78/Pw0g8+GRxJ9P4VgOVpBCX4
	dosBB5r0PGCnvEOu8IN2cPNQc1SyXmyUnhh4tSOhX1mQgUlMa3pvQhrsb4B+YeJRz13dL8U3HDC
	AbXboo0q+7EvNW8XQESSXhmNxe88nIYjXkEUMv4+oRnIBlhQej4zKrkNr6kML1GbPNi7pvosC5p
	jCH7WP753O+Ng6trCvJNDH6JEz9nqGjkrrjI5lgQgLRodbW8/ma9BJyMnlyJWITuGZ1NNCoWTVk
	zyFobAzOUSlCSd8I55s6iVse5+wFZ7fV7Fetcai9xb/NonrSOFpdLXDZqrMArRaqA7/oMm8+F5X
	pr
X-Google-Smtp-Source: AGHT+IGRpA4EWSge9FEynJVlD/uzoZDN7jjxeaAWcd0tXEWkjk8DFuvwHJ/1T+lQA11kadREYpegYw==
X-Received: by 2002:a17:903:2f8f:b0:295:19e:487b with SMTP id d9443c01a7336-2951a39060cmr108779475ad.5.1762041329538;
        Sat, 01 Nov 2025 16:55:29 -0700 (PDT)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-295424bcc39sm49189165ad.17.2025.11.01.16.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Nov 2025 16:55:28 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id DB5154206924; Sun, 02 Nov 2025 06:55:26 +0700 (WIB)
Date: Sun, 2 Nov 2025 06:55:26 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Staging Drivers <linux-staging@lists.linux.dev>,
	Jonathan Corbet <corbet@lwn.net>, Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [PATCH] staging: Pull in staging drivers docs into documentation
 tree
Message-ID: <aQad7uZ-rxCKs07Q@archie.me>
References: <20251101124053.62544-1-bagasdotme@gmail.com>
 <2025110115-nineteen-diner-186e@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t5NhrSJKm/+QMYFc"
Content-Disposition: inline
In-Reply-To: <2025110115-nineteen-diner-186e@gregkh>


--t5NhrSJKm/+QMYFc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 01, 2025 at 03:24:51PM +0100, Greg Kroah-Hartman wrote:
> On Sat, Nov 01, 2025 at 07:40:53PM +0700, Bagas Sanjaya wrote:
> > Some staging drivers have documentation that are spread out in
> > drivers/staging/*/Documentation/. Pull them into kernel docs tree by
> > using the same technique as in 1e9ddbb2cd346e ("docs: Pull LKMM
> > documentation into dev-tools book"): wrapping them with kernel-include::
> > directive as literal include.
> >=20
> > Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
>=20
> No, please do not do this.  staging drivers are "self contained" and do
> not spread out into the rest of the kernel.  If/when the driver moves
> out of staging, then it can be included in the normal kernel
> documentation builds and the rest of the stuff (i.e. include/ locations
> and the like.)
>=20
> So leave them alone.  Documentation does not need to be built for
> staging drivers, there are much bigger things that need to be done for
> them instead.

OK, thanks!

--=20
An old man doll... just what I always wanted! - Clara

--t5NhrSJKm/+QMYFc
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaQad7gAKCRD2uYlJVVFO
o7RhAQC0xzjwMgYiLreuKLkmTjcmM51HZTpIv8zjWVHi3f6mUQD+NPHKZvvycT38
Na4hPtfWLiY/vsvsW1I/rzyMKGKusAY=
=KA70
-----END PGP SIGNATURE-----

--t5NhrSJKm/+QMYFc--
