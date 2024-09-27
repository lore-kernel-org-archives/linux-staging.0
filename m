Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F60915B118
	for <linux-staging@lists.linux.dev>; Fri, 27 Sep 2024 21:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727473578; cv=none; b=dqvxNZIaFH2/ZWVupGmMlaUKuFEtaTuDPHTU1Hirsm0D5npvbYgiLEuFVDakUJb9nfaA8aC37L+lILBBtD+gYdh6uic6WL0tdO+TriyTH3azJF7YalDYlE28O+Hn+0wTcVfKwJgnUcdpZSRoKXrqGMIGh7j6EVss4dHN+pNDXJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727473578; c=relaxed/simple;
	bh=rTv5qH+Bh4guUKv1K7UwpM599lu2aof5Wd391gXejeo=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=k/us8Gn1Oio8BW3hrPo1TuziGp3U9D540tPzCx7Iq5Uhd+WbM4/vR3qMbIygbWLzqZp/TacLJcL0lDXe7ET0giBrCfqjIoklz/vMXjFv1StHNhk1Z08WW14+pCLaJzF2yraSTmDTF83mwaTJ0XRXjyzUezQzTRDuZu2SDpsFBho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=b1n.io; spf=pass smtp.mailfrom=b1n.io; dkim=pass (2048-bit key) header.d=b1n.io header.i=@b1n.io header.b=tN1aeluB; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=b1n.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b1n.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b1n.io header.i=@b1n.io header.b="tN1aeluB"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b1n.io; s=key1;
	t=1727473572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Koxx+HMI6BGO17L7q5OwR7Lh97f2cLA/hnmfVUq/8Ts=;
	b=tN1aeluBNgPaBpQmbl0b2xNJtJ1ZxlwVIVdqCrVpEQ4wm6yTyI1P/1O98JyHsoLmwiaNAy
	Me9fn99JvjgOKv4HfWJK/Zz2Q/x9az0RbSg8+TWpyI/Twi4yJhtuE470kPlAN7H9zEHTHV
	mZla+BgnBRAw+4iQCWykI6QnqI4/gkJY3heU7BwbnkGRxuIFibtx0xA7PMULIMPJ5WCujo
	+L1nnHlc5gf0GRzU4RWlStf6M1qgRDZUF91MBFuR+G9NcNCcu/rY/tYsiUMjDQ3736lFeX
	VGEwEtYkNoj7go62HcWja/4HwwaF3/KkU+GG0PtW86EDzCKEsVj9i7PZnou7Hw==
Content-Type: multipart/signed;
 boundary=38fc242aa460d1ec0979316fb3db603ebb8cc24bd3abec68c88481c151c7;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 27 Sep 2024 21:46:04 +0000
Message-Id: <D4HE9RRSW29S.2A9MR1WSWENZH@b1n.io>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Xingquan Liu" <b1n@b1n.io>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: "Florian Schilhabel" <florian.c.schilhabel@googlemail.com>,
 <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8712: Fix unnecessary parentheses warnings
References: <20240927151637.82772-1-b1n@b1n.io>
 <2024092735-domain-sharply-cfb2@gregkh>
In-Reply-To: <2024092735-domain-sharply-cfb2@gregkh>
X-Migadu-Flow: FLOW_OUT

--38fc242aa460d1ec0979316fb3db603ebb8cc24bd3abec68c88481c151c7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8; format=Flowed

On Sat Sep 28, 2024 at 2:36 AM CST, Greg Kroah-Hartman wrote:
> > Signed-off-by: Xingquan Liu <b1n@b1n.io>
> > ---
> > I ran clang-format additionally because I noticed the Linux community
> > recommends submitting code formatting patches along with other patches.
>
> No they do not at all, where was that written down, it needs to be
> changed.

I'm trying to find that documentation, but haven't found it yet,
I'll keep that in mind.

> > I'm not sure if there are any issues with this.
>
> so many issues, would you take a patch that did this?  (hint, I will
> not...)

Haha, sorry.

-- 
Xingquan Liu


--38fc242aa460d1ec0979316fb3db603ebb8cc24bd3abec68c88481c151c7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iM4EABYKAHYWIQRK8k7aQ0rr/Uwki+E2I1LDHPWnXgUCZvcno1gYaHR0cHM6Ly9r
ZXlzLm9wZW5wZ3Aub3JnL3Zrcy92MS9ieS1maW5nZXJwcmludC8zMEFGMUFDMDcz
MDg5M0VEQzE0OUI3OTVCMDA3OUIxMkU2Qzk4RUE2AAoJEDYjUsMc9adeDusBAL1K
w9zXe9ddMBbugw2AgLYR7MFxZLWgjuf76eMSV+bnAQCkoQXgCXuLTk4g0R7gYhw9
TOAUqU5PKp8rQN0y/cfWCw==
=FA7B
-----END PGP SIGNATURE-----

--38fc242aa460d1ec0979316fb3db603ebb8cc24bd3abec68c88481c151c7--
