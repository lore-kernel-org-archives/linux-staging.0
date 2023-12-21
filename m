Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD6F6ABB3
	for <linux-staging@lists.linux.dev>; Thu, 21 Dec 2023 11:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rp6kIfdU"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-593f7a1afd7so427099eaf.0
        for <linux-staging@lists.linux.dev>; Thu, 21 Dec 2023 03:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703157356; x=1703762156; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ntJX02IfwYFQ+8rtmxZSVkWghtloy7GUaFsfd5/JpEk=;
        b=Rp6kIfdUW5Zq9zunRGdHNI1hmJthvcQzyFmWS6Fy53ksiGNOT6NiphgHeXmBHkDMJp
         06qNIcW3MtaEg1HMUhSPLNpks6ODmBRsR3+Zp2i3+2zHjonstmj8NdW+BxTYLh57OwcW
         4pbu3PykEKPivxpx3Y4pWuk/1eHUUe1dQQ31US8gfPjdtwv+YakVwQv39Pwu/7H5Ql8m
         HYL+ajp/fuiISwF3x5gdtsduLrFN+qprk7QGTl2TG+DQu/3Cd13OmRpUB/RJ/4id5P3+
         kImRyYKupuCl7mJIN95Ny1l7wjyHj2VzL9WaoZZ//r9a10I1YwivvRqg2J0VEAKlD5km
         32Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703157356; x=1703762156;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ntJX02IfwYFQ+8rtmxZSVkWghtloy7GUaFsfd5/JpEk=;
        b=KY3afo0D+W2HGAqQ0wI6lsdAfyiDWNcICbRjX2V3e23EJ73zkt8vQ4Di193LgVt1Xc
         jFskjtk9PzyZQT9jzijioOenWwQrn1F9yXZ3zr4EmjwAbuuisCgDy2wizMkoFE4UMnnN
         6wVi1uluWGpzNa8Cq2y/fSCSJzFjhMO3II5fWIC74fdRWNCv+K1wrc5HjUDqGPDnpyYV
         u7tvYsGXwyPCKsysHmMATzCKVx6aV9n0ERuoePEo8j+Wb62CwjkWPkYYHDwfrlwQfVRX
         /gz3id0UNOWLzITGLbxC1Ug54NH8HXGuDOoPS8/5t86Sp6RyjuqxaTmJxMQjYK1ABwj8
         T7yg==
X-Gm-Message-State: AOJu0YwptZr5fNw0GRsFvBox9Q2ABFP4utvadZEYC/1Gv/4uKDNMtegd
	TcnalOst5fsmtJl0VYG5J0w=
X-Google-Smtp-Source: AGHT+IF1PX2xxqgpxykKHUBh3IkVlPqnoWcPe4bNr3ejM1J0EeoraIuo705ems1ceqEBSKjsuTTh6Q==
X-Received: by 2002:a05:6358:887:b0:174:b138:6192 with SMTP id m7-20020a056358088700b00174b1386192mr781431rwj.26.1703157356156;
        Thu, 21 Dec 2023 03:15:56 -0800 (PST)
Received: from archie.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id j1-20020a63e741000000b005bdd8dcfe19sm1339266pgk.10.2023.12.21.03.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 03:15:55 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 655A3101B1174; Thu, 21 Dec 2023 18:15:50 +0700 (WIB)
Date: Thu, 21 Dec 2023 18:15:50 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jakub Kicinski <kuba@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Staging Drivers <linux-staging@lists.linux.dev>
Subject: "Link in bio" instead of Link:/Closes: trailer
Message-ID: <ZYQeZjN_3bPOdKKf@archie.me>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IOy+elnsY4ZQ97PS"
Content-Disposition: inline


--IOy+elnsY4ZQ97PS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Let's say that there is a content creator who submits her first kernel
patch (touching drivers/staging/ of course to get her feet wet).
The patch supposes to fix a reported bug, with appropriate Fixes: tag.
But instead of using Link: or Closes: tag to the actual bug report in
the patch, she instead writes "Link to the bug report in my bio", as
it is the norm in social media world. Here in the context, her bio is
LinkedIn profile (IDK if there is a way to add arbitrary link there).
The link in LinkedIn profile, when clicked, will list many links
(including her usual social media campaigns and of course the bug report),
which makes reviewers confused about which link to the bug report she
means. In some cases, she may disambiguate by saying in the patch,
"Link to the bug report no. 99", to refer to the specific link number.

Is such practice a good idea?

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--IOy+elnsY4ZQ97PS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZYQeYgAKCRD2uYlJVVFO
oyl4AQDFmpF+DPHFIzFJyphKvMA2JTCPGUl3MdlFX7MWpYCtCgD+KAmls0qYS/hC
3dMHV3vv6tOClNLTn4amwF/0384xzQo=
=Vqzw
-----END PGP SIGNATURE-----

--IOy+elnsY4ZQ97PS--
