Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2F14D116
	for <linux-staging@lists.linux.dev>; Wed, 22 Nov 2023 12:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Azv74f1B"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1cc1ee2d8dfso59105255ad.3
        for <linux-staging@lists.linux.dev>; Wed, 22 Nov 2023 04:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700657989; x=1701262789; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QW8tX1Rt7l90NZJE2e+BwQxvjumBfu6BosqaGgb2t5s=;
        b=Azv74f1BNREERjpDEqrDCs3mKRIzxxdDmafVFjWnL0eYAcLeC0SvfQZtcH+6QskTJ3
         FCnWqMMblz6NVWqyXupvpm3+tAoA+D/rNP+SXHeEyCbtzGL7DTQjY0mlxlrwuHxxEMEA
         P/0YLUVsCDfGJcDPkZgdGtqrs5e25n0dQBMW+hhOmkqo6Cd6R/cLuduF98ndrPdUcX2Z
         8ZTJZ0b//uUHQ3N1AUROQrgkcnW8Pd7lViI0x/RYsCSD3QKddTwB0e3Hn6zTDKCq77s2
         goFpuUq1e7SwMnGq1FWt4M6rW/4F7ZKhPHBGl3ONP8ZJ5yhFFw+qlq5e+FfCGVa6MRjk
         jk8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700657989; x=1701262789;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QW8tX1Rt7l90NZJE2e+BwQxvjumBfu6BosqaGgb2t5s=;
        b=B3oDha7hxd96OsdEJ9ET5OEgR+TDGZNjxqZOlZVuesbPdGVr/7IBBoLtQrICdLKEop
         yZzvssiRuMtAx1kF/zN2pywnSb4PDQwfl5Ol3ZogodnMfCw0cwphNzsRbH8KIMu4ddju
         pbD49shaP/ijvdt/9TMSkuwbMgtVLETjZubx5spk5DLVSf3mm/1KbLBYrH3Bc+zyyto6
         Q98cdGRtCKa6h5L7uRcxS6nsvD4xux6QqRBEAH7YbYNNjHiYYJXegNfxubqSEf40lWQ8
         2tks47IQdwIVUm/HuDNeh0I9AyU86rHgW5jYQvjKr3JJYHQZ7suwlOghS/FP9Ze3X/k0
         Igcw==
X-Gm-Message-State: AOJu0YwzEIYaQY6ukyqvXOpT1M07yEFE18Xjs25omsz0/1uAK1j1g8Lz
	qkwLBKFjLZzkQCC3hCCnYaM=
X-Google-Smtp-Source: AGHT+IFuWa8OmkRUyBAwazRj12HP4KY6Fo6QPFHJVHmgN2KnG25EHNg3/YcnMxKbGhWIZ+2KyWD4TA==
X-Received: by 2002:a17:902:da85:b0:1cc:3fc9:7d09 with SMTP id j5-20020a170902da8500b001cc3fc97d09mr2633927plx.15.1700657988620;
        Wed, 22 Nov 2023 04:59:48 -0800 (PST)
Received: from archie.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id y5-20020a17090322c500b001acae9734c0sm1405028plg.266.2023.11.22.04.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 04:59:47 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 3976010207134; Wed, 22 Nov 2023 19:59:44 +0700 (WIB)
Date: Wed, 22 Nov 2023 19:59:44 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Martyn Welch <martyn.welch@collabora.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Staging Drivers <linux-staging@lists.linux.dev>,
	Linux Kernel Janitors <kernel-janitors@vger.kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <error27@gmail.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Bruno Moreira-Guedes <codeagain@codeagain.dev>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH 1/2] MAINTAINERS: Update Martyn Welch's address
Message-ID: <ZV37QCEB9zEk368g@archie.me>
References: <20231122094156.30642-1-bagasdotme@gmail.com>
 <20231122094156.30642-2-bagasdotme@gmail.com>
 <98a17cfe-4358-44f8-aeb3-882a87de1177@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OEFSv2cXj1zn5if4"
Content-Disposition: inline
In-Reply-To: <98a17cfe-4358-44f8-aeb3-882a87de1177@collabora.com>


--OEFSv2cXj1zn5if4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 22, 2023 at 11:15:19AM +0000, Martyn Welch wrote:
>=20
> On 22/11/2023 09:41, Bagas Sanjaya wrote:
> > He is now active on the mailing lists using his Collabora  >
> > (@collabora.com) address. Reflect it in MAINTAINERS and also add >
> address mapping for him.
> Hmm, mapping yes, changing the email assigned to the VME stuff, no. This =
is
> not something that I consider related to my work at Collabora. Any time
> spent on it at this point will be personal time, hence the use of my
> non-work email address.
>=20
> Realistically, I've lost access to hardware to test anything regarding VME
> and it's not something that's particularly easy to acquire. With the other
> patch in this series removing Manohar, removing me as a maintainer would
> leave Greg, who has been amazing covering my shoddy maintenance of this
> subsystem (what can I say, life has rather got in the way), but I feel it=
's
> unfair to leave him as the sole maintainer. I wonder whether I/we should
> admit this is basically orphaned at this point?

I also feel similar thing when basically the subsystem gets more care from
kernel janitors (including outreachy applicants and people specializing
in checkpatch fixes) than real users, like the case of DECNET [1]. So
I'm agree to orphan VME.

Thanks.

[1]: https://lore.kernel.org/lkml/20220818004357.375695-1-stephen@networkpl=
umber.org/

--=20
An old man doll... just what I always wanted! - Clara

--OEFSv2cXj1zn5if4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZV37PAAKCRD2uYlJVVFO
o1qbAQDpALBJdNaAYVxFyVMxS56nF0gEM2UqT/loGVBX3h35TwD/bGyQnlqQmFHP
TD5HDyxFAe0m1504rF7uCs2fTjkDRQo=
=219y
-----END PGP SIGNATURE-----

--OEFSv2cXj1zn5if4--
