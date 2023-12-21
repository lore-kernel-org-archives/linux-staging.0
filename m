Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E0936085
	for <linux-staging@lists.linux.dev>; Thu, 21 Dec 2023 14:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FYs6Jurh"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6d940d14d69so570160b3a.1
        for <linux-staging@lists.linux.dev>; Thu, 21 Dec 2023 06:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703168017; x=1703772817; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/54ktMLGsC/HbIUHpgdYFftx5wBmSSsuqjyv83RFiYA=;
        b=FYs6JurhdUAbJhZLIjR3HuhBr9MEAjR0UF+Q9sHCCu5uzcNlGEks9L2UAVLIP4FHj1
         hM6FtxVHOCTWS3AFl7oklUb/ZxDr3nxisMlAGLwlTqViuLvDxrdPsXGhbQUxu2OgQEJF
         MVNj0uU3akMBupx0ieRxj/WDp2sXrPU1RxT+C+0DQCeE6k0OwFRf6lkL00wgKYTozy9k
         xgpsYtBzTTfN1Pc4I9n5TLGM+Kc1mtILmOo3mEKXFulBI3+vsohyZNm4HWe2/yBzf0hC
         Ir6qX7N8CuWzaxZFXkF/W3Bwijy80ap9l67113xVDxjCpRMhnCFvdC+MwgYs/fYv7mGe
         pCOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703168017; x=1703772817;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/54ktMLGsC/HbIUHpgdYFftx5wBmSSsuqjyv83RFiYA=;
        b=AVfImMbqp+qR97JNVEhHsOJFZt4RDjNP1oEd1Nfe4/dkqDbCkWafPcOO21gkSExuQv
         Zp/y+VncWzSYGNVGlDH5nHbpaq76C23K67O2qMJi8MJY6lGkPV+LvSvhVFx7OemTs8uy
         5M59iNcFmIacCNEN6SHb3uzRBXBlcgAtcjXxElt2By+TNLid4Or/DD2eRkXTAuZ9MmuQ
         CC4BS0+bZxOD3sDpAEGJ+lOPcs7gWdEbEMq9yHhNC8q3Qn902IlSSPi2nPxiOVAfPfHG
         YWaG0TG6sY8H5HtNglqvnk/9w/HIKkUxdtztq2I8addEjxArZ24BBS0s5JcyxZOm7gcD
         SMnQ==
X-Gm-Message-State: AOJu0YzwkMaEkQ0LXFJhvEcAWdsKoaATTrXm0DDhpkpOY0WEMX/jgpwt
	vf8LBza/SYWFB0nQzpGycxw=
X-Google-Smtp-Source: AGHT+IEtaQfZsfB6upC3isHiwaxPkyOGymhFNYfry883ZoVaD4IQmGEfSnrGICbQDUWzb4eyA5kBFA==
X-Received: by 2002:a05:6a00:1996:b0:6d9:3981:5903 with SMTP id d22-20020a056a00199600b006d939815903mr3268088pfl.0.1703168017089;
        Thu, 21 Dec 2023 06:13:37 -0800 (PST)
Received: from archie.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id u36-20020a056a0009a400b006d62cbf10b4sm1626440pfg.194.2023.12.21.06.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 06:13:36 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 3189010206DCF; Thu, 21 Dec 2023 21:13:32 +0700 (WIB)
Date: Thu, 21 Dec 2023 21:13:32 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Staging Drivers <linux-staging@lists.linux.dev>
Subject: Re: "Link in bio" instead of Link:/Closes: trailer
Message-ID: <ZYRIDDD_XR5HdVJu@archie.me>
References: <ZYQeZjN_3bPOdKKf@archie.me>
 <2023122112-rigging-january-7618@gregkh>
 <cc276c0e-99bb-4422-9771-d864db4287cb@gmail.com>
 <2023122129-twisty-mumble-c667@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ki5XL8WJal0E6W8j"
Content-Disposition: inline
In-Reply-To: <2023122129-twisty-mumble-c667@gregkh>


--Ki5XL8WJal0E6W8j
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 21, 2023 at 02:10:03PM +0100, Greg Kroah-Hartman wrote:
> On Thu, Dec 21, 2023 at 07:57:21PM +0700, Bagas Sanjaya wrote:
> > On 12/21/23 18:51, Greg Kroah-Hartman wrote:
> > > On Thu, Dec 21, 2023 at 06:15:50PM +0700, Bagas Sanjaya wrote:
> > >> Hi all,
> > >>
> > >> Let's say that there is a content creator who submits her first kern=
el
> > >> patch (touching drivers/staging/ of course to get her feet wet).
> > >> The patch supposes to fix a reported bug, with appropriate Fixes: ta=
g.
> > >> But instead of using Link: or Closes: tag to the actual bug report in
> > >> the patch, she instead writes "Link to the bug report in my bio", as
> > >> it is the norm in social media world. Here in the context, her bio is
> > >> LinkedIn profile (IDK if there is a way to add arbitrary link there).
> > >> The link in LinkedIn profile, when clicked, will list many links
> > >> (including her usual social media campaigns and of course the bug re=
port),
> > >> which makes reviewers confused about which link to the bug report she
> > >> means. In some cases, she may disambiguate by saying in the patch,
> > >> "Link to the bug report no. 99", to refer to the specific link numbe=
r.
> > >>
> > >> Is such practice a good idea?
> > >=20
> > > No.
> >=20
> > why?
>=20
> Exactly, why?  What problem are you trying to solve here that has
> actually come up in any sort of frequency?

I was scratching my itch whether common social media practices (such as tha=
t's
being discussed here) can be applied to kernel development.

>=20
> "Link: " is something that should be used to point to a well-known and
> stable reference for any future things, like red hat's bugzilla, or
> lore.kernel.org.  It's not for random social-media link reputation
> spamming, sorry.

Understand.

>=20
> The "proper" way to handle this is to have in your Linked-in, or
> whatever social media site you like, a list of your committed patches in
> the git.kernel.org tree, don't polute the kernel log please.
>=20

That's the elegant way.

Thanks for explanation!

--=20
An old man doll... just what I always wanted! - Clara

--Ki5XL8WJal0E6W8j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZYRICwAKCRD2uYlJVVFO
o2NQAP44SSFDD9rldUnNHUdaTP0OtROrwm9CyrQ4dUweSQqGQgEAl54b7oc1Uxbv
bfcLEe4kCoXXRrRH2wtyTHHG8jCUxwc=
=mAw/
-----END PGP SIGNATURE-----

--Ki5XL8WJal0E6W8j--
