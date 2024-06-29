Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4825660
	for <linux-staging@lists.linux.dev>; Sat, 29 Jun 2024 23:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719705281; cv=none; b=nRkEaAKgH3zmehWtRcJz2PR1WMa18fo+slZBmkQIoRxdumxDMfcJlzrtgoc6Ys0eCQ/rj4iAoxrNGme6xWEv614OE4gJoXnapx+RQ1WYG0ORjlp+I9utQOeWnE21rRcnXW0TQpk6Fe9ecEz9myQqwLhRn8BkopT0c89R3T7euOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719705281; c=relaxed/simple;
	bh=HNKSnvjndFDSHXGnRsk2y67Mg3MJw2O1ab42oLbeluM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oTrIcQGLgOeyNYMcDzNw2PWhcas8DBvskXEkyWHCEeMqnmE/HFCYkp4ggpnFVWqloHDEFi65H3uWh2dDpcgYP5VO72Y3dhJ+86jnUkYu3x5NzZ8ptBB1jsNRmjBiw2497NJljArChlEhSn46Y/h0WfXXqzr5jPaO7jWkcHkw8Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UcqTpCfF; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UcqTpCfF"
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-375e0e258b7so7722285ab.1
        for <linux-staging@lists.linux.dev>; Sat, 29 Jun 2024 16:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719705279; x=1720310079; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HNKSnvjndFDSHXGnRsk2y67Mg3MJw2O1ab42oLbeluM=;
        b=UcqTpCfFfQM1OX5GsyHOzLr/mxfWkPiAswsur1J620zCGnW4oasf8nw6F0QP6Zev/X
         0HweS4rCJTwVfAmX7fNxNapJJPzS9Qs0f89Ch/LdD0VOY//Ue/bC56GPetEN6uV0hsXC
         bxdm5FGLZzxyI71rqMIZAKoKc2Ms9Ne3X4SsffZ9m2qir3G04sLZSVfk0gI4L211Ikqe
         Dl0jUncAdAnrcsjq3ZifP7S30qxpAcgD86YCXLLayh1ScuW0RMgh8Oe22WecomepJNVO
         wd/HT4tjTRxNUueIMP02K1znp+Q2iAMQr52UNarvgeamz8JgU7Hm34pcDWt96pioZTNE
         BBmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719705279; x=1720310079;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HNKSnvjndFDSHXGnRsk2y67Mg3MJw2O1ab42oLbeluM=;
        b=C8PIu2Qil9oeIVKbgxcoWLxtpq2Yy9e3fLhGs1sXiu5w2eI/48BxqY0VNxPbG/9Db0
         6YlzR6iZfJXi0oEVjOfjD/FmUItVqzW+FygRvJWIdgieaRkPIJhX/JCRst4DL34xoQ/u
         Yc+ALQEnZpBqrn3TTJvZPlgA2ujRGlp7WQ4Jswy3XhNApFxOD0upd/T6EjUAgoWzz/WP
         TVMQyQhcF+sTpgpir3R765JWR0fJudO+WTVWSUh/RhFa2PjQcXJTdv7k6QwO3izDnVck
         1KWUeOzDMCCSAfciGlQIboM7v+7KkkmBvWU1nxAnsIjeVSL0OTMm3G+biJunduvfhGdR
         4M/A==
X-Gm-Message-State: AOJu0YyQu0laYpYNWarWwBKZy0o648TBf6gfXg6Q2wCQjjcUYAE7lLsR
	+bYki6lIh3yjuz3VOaLX70ew2pSn5U09sGvAJdoYTdmFL+CFcpb4
X-Google-Smtp-Source: AGHT+IHzkEWGzka9+7sZ/fPfgApaRYQew1kLnqeJ5l8qDXOb+dRdERKLjHPG8Ok9L3fCttLw5kh5PQ==
X-Received: by 2002:a05:6e02:1a4c:b0:375:da94:e46b with SMTP id e9e14a558f8ab-37cd0de9cafmr25528895ab.5.1719705278878;
        Sat, 29 Jun 2024 16:54:38 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac10e2cc5sm38521475ad.80.2024.06.29.16.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jun 2024 16:54:38 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 8F5DF1852C705; Sun, 30 Jun 2024 06:54:34 +0700 (WIB)
Date: Sun, 30 Jun 2024 06:54:34 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Yusef Aslam <yuzi54780@outlook.com>,
	Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] Staging: rtl8192e: rtllib_rx: fix alignment
Message-ID: <ZoCeul3pAjZLOT8E@archie.me>
References: <CWLP265MB65165E806F938F87CB67BF87FDD62@CWLP265MB6516.GBRP265.PROD.OUTLOOK.COM>
 <2024062727-diabolic-lusty-7baf@gregkh>
 <CWLP265MB6516AB499D407C0AB0CF106EFDD72@CWLP265MB6516.GBRP265.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="91Qoq1IeelA5QvL4"
Content-Disposition: inline
In-Reply-To: <CWLP265MB6516AB499D407C0AB0CF106EFDD72@CWLP265MB6516.GBRP265.PROD.OUTLOOK.COM>


--91Qoq1IeelA5QvL4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 27, 2024 at 07:09:50PM +0100, Yusef Aslam wrote:
> On Thu, 2024-06-27 at 15:43 +0200, Greg KH wrote:
> > This all should not be in the body of the email, please use a tool
> > like
> > 'git send-email' to send patches.
>=20
> Oh k thanks, I was trying to use git send-email but in the end I just
> copy pasted the email into Evolution as msmtp was not sending emails
> for some reason.

Authentication issues?

Confused...

--=20
An old man doll... just what I always wanted! - Clara

--91Qoq1IeelA5QvL4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZoCetQAKCRD2uYlJVVFO
o6I1APsHLrevLZMMM0lYJnxtWSvhmiuZ6aAFFByjryG/++/10QD/YcCo8RNKbXVA
8wPGTFp+EaEp6BP5jD6AcZm7cOj8RA4=
=3B0Q
-----END PGP SIGNATURE-----

--91Qoq1IeelA5QvL4--
