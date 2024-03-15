Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002A5DDBE;
	Fri, 15 Mar 2024 05:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710478835; cv=none; b=l6YcqcNaAHcoUNyhIPLfSGKR2n1dcwcsONsrhdcp6Vo4mU/l6QjeFRIDOa9uEyUcwZxXHKz8/tDHkD3jNYUWnZ/9dxzdcqDIE4+cvuhywfzYXK0BKtcg8PhL79u1kDaivJqmd/d9U8h9pFfTJi8shf0Fuw/6iB00WhSwO9jdfKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710478835; c=relaxed/simple;
	bh=AVxJAgDOM1ertOYhdYUbMC4hF08+5zIp3K2E7vpV13I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j74am3E61PbeTsLXDva9SOUe6uYgAgZPma9pAWQflhCoh7TC/wZewpJiG682KuALn4XQxrdb81QpeD5Ioy7woPCFMtIcqg6rjOx75C6jNuMTLWkBpDc30NIhACjyNyhz59MXkjw2HvXqn7QKxLW16xz/5CQdlrLzE/Gu5DlGIyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C0SZX15E; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C0SZX15E"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-29de4e12d12so738794a91.3;
        Thu, 14 Mar 2024 22:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710478833; x=1711083633; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nDUa4LKKJrS6V184wfFwzG/nLApNUTkpy9A+j/WZdjQ=;
        b=C0SZX15EyiyX2PTFLkVoC+s7joNtHQOa0ARRnxFbXlfyXq+gD0A39mvBtnYffEhHFp
         B83O6s5J9OrXX4rGlD5wg2w3Omz6ie88czuQwuiSSV29eIVAZZ29BF8TnkmFHbFys6yy
         x42qjOEWhff7Cl1B3ECUjH2d8QcL/dGiPfxS8UFyNIuOQs7ifCjU2HzLOrYZT9Ai2y+4
         7I5T3iIdyc0BhL+8TTVzpuWRGM8V1Khw6Ybtk4XX4TwISwEaOVLNnTcAKNrYjuxSGJTZ
         bOPr0cdsMZoBfhxeL3Xc/QzWM2dXlK/fTjj3OGiSARJxfJgwGBeo3h0FE5TOlhk8amym
         lEQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710478833; x=1711083633;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nDUa4LKKJrS6V184wfFwzG/nLApNUTkpy9A+j/WZdjQ=;
        b=O0Ts5LqUQCAy7d1Qxj4y+sd/SfLYOJcKu3Ms4LurYSYDcZBQqTlO0ZV8aQmkCxXlyf
         Gc/fZxGSCGBcE1NB9J6f5rVgnCV3TGi4Z0oWBQCRq2foZIDqMjKV2haRlQh7hG0BBsR3
         QTiWQwRmr+9+8lkp0ozeR5B/+98xANHQbe4TkVEfq46RdAoaJ4wY6PyBWxBNB0bPkJl6
         8TnEAO+AnjMzhgq5LDWOIPLUd/3VFiAUZecuTWy9gYfETh9innB/m7X7Be4vy4fnc9Sr
         OHrMe1yO19CGckACtk1lRGXbFcRHptpD8l6lIdnQHEUB4oM2pRFr9YwOwoMyeBVkbE0r
         cq9A==
X-Forwarded-Encrypted: i=1; AJvYcCXvWoTQ2KnL7pAxRRymigrP3eFWTxyxWYJV/TFtGE/Z32xN+1TY2IUr7qROKVotJKrwX52E9RYF2jIoHE/U9mEl8/1SDa1pawO06AQOa29q1Dz+L4tNnVmWNzupzBNtM38iaeLNwBevXg==
X-Gm-Message-State: AOJu0Yz0Aw6DvLk0bok91+ZhjZ9Yf2+6SQ3jmuVJxIu7x0gs/K2JPWjr
	pP4983XrNkiIKvceuLWNNPSBPUmYd3G42lEvF+eNK5CZy9lArxpB
X-Google-Smtp-Source: AGHT+IFmcs4XPaZqyYyeIE5sgz7nkxXjr67N+8GULN2WVj8RK43nW2q0bZJiYW90DlcvMHk6JvkzBw==
X-Received: by 2002:a17:90b:4f81:b0:29d:fe34:fa16 with SMTP id qe1-20020a17090b4f8100b0029dfe34fa16mr38368pjb.21.1710478833254;
        Thu, 14 Mar 2024 22:00:33 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id sl4-20020a17090b2e0400b0029c71d2ed4asm1896164pjb.2.2024.03.14.22.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 22:00:32 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 73C6F188D9EEC; Fri, 15 Mar 2024 12:00:30 +0700 (WIB)
Date: Fri, 15 Mar 2024 12:00:30 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>, forest@forestbond.com
Cc: Dorine Tipo <dorine.a.tipo@gmail.com>, gregkh@linuxfoundation.org,
	Linux Staging Drivers <linux-staging@lists.linux.dev>,
	Linux Outreachy <outreachy@lists.linux.dev>
Subject: Re: [PATCH v3] staging: vt6655: Remove unused function
 RFbAL7230SelectChannelPostProcess
Message-ID: <ZfPV7rd0YHc9pChi@archie.me>
References: <20240311035649.25043-1-dorine.a.tipo@gmail.com>
 <20240311060747.32876-1-dorine.a.tipo@gmail.com>
 <36c92e00-213e-4f25-9720-66912b4da56f@moroto.mountain>
 <d0f975e8-3ce4-4a2b-b52e-51b748a8601d@gmail.com>
 <4e162fac-078e-4a37-9a6a-fad186b0d27a@moroto.mountain>
 <66b9d80f-94f2-44f5-8ad9-b73caa14bb44@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="A/wsE3nBWaWtq1T4"
Content-Disposition: inline
In-Reply-To: <66b9d80f-94f2-44f5-8ad9-b73caa14bb44@gmail.com>


--A/wsE3nBWaWtq1T4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 14, 2024 at 07:45:28PM +0100, Philipp Hortmann wrote:
> On 3/14/24 07:36, Dan Carpenter wrote:
> > On Thu, Mar 14, 2024 at 06:33:58AM +0100, Philipp Hortmann wrote:
> > > On 3/11/24 08:31, Dan Carpenter wrote:
> > > > The main issue with this patch is that it doesn't apply, but I have=
 a
> > > > few other comments as well.
> > > >=20
> > > > Why is Forest Bond not on the CC list?  Please use get_maintainer.p=
l.
> > >=20
> > > Hi Dan,
> > >=20
> > > reason why some omit Forest Bond is that the emailaddress seems to no=
t exist
> > > anymore - find below. Can I issue a patch to change this?
> > >=20
> > > Who is then entered to the M: in MAINTAINERS?
> > > STAGING - VIA VT665X DRIVERS
> > > M:	Forest Bond <forest@alittletooquiet.net>
> > > S:	Odd Fixes
> > > F:	drivers/staging/vt665?/
> > >=20
> >=20
> > Yeah.  His current email is forest@forestbond.com, but let's mark it as
> > orphan.  You actually have this hardware, don't you?  Do you want to
> > take over?
> >=20
> > regards,
> > dan carpenter
> >=20
>=20
> Hi Dan,
>=20
> I do have vt6655 and vt6656 hardware.
> But I have no idea what commitment I am entering into.
> Please send me a link to a description of what my obligations are?

Hi Philipp,

You can refer to Documentation/maintainer/feature-and-driver-maintainers.rs=
t.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--A/wsE3nBWaWtq1T4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZfPV7gAKCRD2uYlJVVFO
o9bOAP9ARntcFJnxfn+AEXdbWsmYMJ7wbCYm/eVhSLBlf7NphgD/c7z3qIsAPiAt
/Hetmk4fUeHIUqEVOtAbcc5/lumSMAw=
=C2TH
-----END PGP SIGNATURE-----

--A/wsE3nBWaWtq1T4--
