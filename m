Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3359B335B5;
	Thu, 14 Dec 2023 12:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hhI7F+0K"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-28b0a9876c8so149623a91.3;
        Thu, 14 Dec 2023 04:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702556521; x=1703161321; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wdkMvlmQKDEjb01URG4TvG4VxvCoEXt3iAKwNgfPtHw=;
        b=hhI7F+0KCnYnSq0M5TnlFn8IcJ93XMgtNgixZ7qNIZwc/LTeNuWHTUnLkIIedmT/df
         qyrgxfC7chhCT3CqbMz3lru77gkH78+ndWkzPiKXH+/5L9FAVJkPbEKav3cvAS/YAHmX
         t96p6I1p+3r8DBWjVl0MIVvifAVZegeEQibBwjJoko+rEIZ2bSaeFCL82+ySUbY3R5qP
         8GHMrYH4XpRx0/V8iZYnzxAS6Ng7pLG1Y3DGkatTtXMiV9j5zPXJIgHKjLPYZtXXXHS2
         zID7AMP6DQYYqNSBIVtKTmyC4xGd6qKjc8bsMRQ+phfZm4KRwIuhQAZGJMkb6S+xsgZT
         epSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702556521; x=1703161321;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wdkMvlmQKDEjb01URG4TvG4VxvCoEXt3iAKwNgfPtHw=;
        b=pnwBYhPzn1oEr2kx4ED/OcawU4O3zsetwmS1U6d55N7VJYfxkXFH0vkcE0zQs3Sfo+
         cNuXNpvDUEI3fW6roV6c7wg5IyIaMP3gU7/D30yQgi/s/n9XkrQEF4YyxB3X/KlML9QD
         BWcPheWZmRSXC5ZWExjspsuMLu9kIaoHDf8K7RIndAgcHJbe5PQMlX48T7om+un/PTjs
         JZiBokTSU2gDI3ZJw2qhaZpAVGgSQ5uD2A/pHN5jP+WGS0ooaK2jnhMWWY7egGLvPzaA
         2MWJZcDW8zg0RXDXAMWShrQeSUK/Ow8HWf/Zx80YOaFNGL0Bte0aCc20Cad8NmQ9LmLq
         Hh2A==
X-Gm-Message-State: AOJu0YzgPikyEDXQ/LoIRG1Zb36rEaaQpIkB8jqmYzGLU6VU5/DTzdn5
	2KBPetw1JgMvREIQJ9waXnM=
X-Google-Smtp-Source: AGHT+IHbBUlyiWnQL0ZKhN6GUkjXp9o1sUaGiprlLSq9PpYCXYmE0v5xf604HXaQ/15w6RmWBHjD3w==
X-Received: by 2002:a17:90a:a581:b0:285:a1fb:4ffd with SMTP id b1-20020a17090aa58100b00285a1fb4ffdmr4559000pjq.1.1702556521351;
        Thu, 14 Dec 2023 04:22:01 -0800 (PST)
Received: from archie.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id o10-20020a17090ac08a00b0028ae9a419f0sm3042882pjs.44.2023.12.14.04.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 04:22:00 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id A393410205C51; Thu, 14 Dec 2023 19:21:52 +0700 (WIB)
Date: Thu, 14 Dec 2023 19:21:52 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Ryan England <rcengland@gmail.com>, Larry.Finger@lwfinger.net,
	florian.c.schilhabel@googlemail.com, gregkh@linuxfoundation.org,
	Linux Staging Drivers <linux-staging@lists.linux.dev>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Outreachy <outreachy@lists.linux.dev>
Subject: Re: [PATCH] staging: rtl8712: remove unnecessary parentheses
Message-ID: <ZXrzYJrgewdXP6NH@archie.me>
References: <ZXn/JjyrLGQzS9zD@kernel.ryanengland.xyz>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s5FMv0bSj2naLsZb"
Content-Disposition: inline
In-Reply-To: <ZXn/JjyrLGQzS9zD@kernel.ryanengland.xyz>


--s5FMv0bSj2naLsZb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 13, 2023 at 06:59:50PM +0000, Ryan England wrote:
> Adhere to Linux kernel coding style.
>=20
> Reported by checkpatch:
>=20
> CHECK: Unnecessary parentheses
>=20

tl;dr: see [1], [2], and [3] for why Greg NAK this kind of patch.

Thanks.

[1]: https://lore.kernel.org/all/Y%2FiaYtKk4VSokAFz@kroah.com/
[2]: https://lore.kernel.org/all/20190626015622.GC30966@kroah.com/
[3]: https://lore.kernel.org/all/20190401060216.GA5286@kroah.com/

--=20
An old man doll... just what I always wanted! - Clara

--s5FMv0bSj2naLsZb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZXrzWwAKCRD2uYlJVVFO
o8+NAP98FzD1B6CV4uL2FchjaZ3vn6JaWdAhDfuSox9ccpgixgEAxp0n7hdXcxzO
48a5vUg7cL57+Q4Pet5w+m0GjJWRdgY=
=CuBH
-----END PGP SIGNATURE-----

--s5FMv0bSj2naLsZb--
