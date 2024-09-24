Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BAD91A726C
	for <linux-staging@lists.linux.dev>; Tue, 24 Sep 2024 13:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727183358; cv=none; b=LEeTfLF21gUo4mcDrf01400f/bIhrInxbwLIeb2xINbrQL7VAJIrGx4mJ6Nom6T7T+/XaCTI26aODy+mGkbA2VccFok81ERandxLHbCpiGZEHi1djrggtY+weWeaGUq1Dc3LVRq1gdVvSGOxP8MYZgvdRf54C+9vmrCEYwfIJ78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727183358; c=relaxed/simple;
	bh=8vY3bKchTGUj1enX3mJ1uxQ9j9KooQtF6sEvhy2D0u4=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Subject:
	 References:In-Reply-To; b=o98wnaUY1GDSNBZ9PMm/wnGI+zCbR8Uu8f3EYvhGiD4S6UztZyQl8cq+5TFfHwJ048ky7ykw6METbNIOUpbUJNJJ/Ft558swXZCm9GqNIEvslm5oI2tye/E376U1j4fXLMXersQgVw/nlqFtr41K5G/mGkUqDs7T1FrelzDBxg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=b1n.io; spf=pass smtp.mailfrom=b1n.io; dkim=pass (2048-bit key) header.d=b1n.io header.i=@b1n.io header.b=UKuNAIdZ; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=b1n.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b1n.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b1n.io header.i=@b1n.io header.b="UKuNAIdZ"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b1n.io; s=key1;
	t=1727183354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iuKw4rgw1LWlutVzOZZn8tqJFI5aJehVM05I1O7443s=;
	b=UKuNAIdZDzR5UhVdJah7RWqmzZTNHi35hBYVKhPyp4mc5NbuGkYHi5MdoRCCQUY7padplV
	mzzlSGG1fqw2UXPqBT0iDqdX5zhMck/jnIEAplvF7PV9/hvKyLQDoSfJNUJF9QGLaOS8GP
	+h0dSTK0wHtnKrfiXu8SXQqDRsfUsKfl0smqN4/TLzuwS45m1vfP4lw3u6ZKO1jJCq9QsF
	zmXDYpdLyoOBdv6753MOC+Syf3W52C0N4c8McW8jZfMvLuYXzTVFqTDr6YqQDVA73QBHWv
	crgoSnEXacoQ6CGUPp42gun9VLj+/L38SO9d7y1a6WOyzecUYGexpbKJGtAm9A==
Content-Type: multipart/signed;
 boundary=5b9416032f3b1648a5b9fdebd51c1ce201f2bcc573241a38627275740479;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 24 Sep 2024 13:09:06 +0000
Message-Id: <D4EJEBJEGR9K.786CM798YI9N@b1n.io>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Xingquan Liu" <b1n@b1n.io>
To: "Philipp Hortmann" <philipp.g.hortmann@gmail.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/7] staging: vt6655: Rename variable iTDUsed
References: <20240920162025.31465-1-b1n@b1n.io>
 <20240920162025.31465-2-b1n@b1n.io>
 <e7bfce0c-74a4-4c0a-9930-a3fe9d5ea5fb@gmail.com>
 <D4DNIARBI7Q0.13E9XY3QTDIW3@b1n.io>
 <c20e4935-faca-41ef-ab66-09199b38a6d2@gmail.com>
In-Reply-To: <c20e4935-faca-41ef-ab66-09199b38a6d2@gmail.com>
X-Migadu-Flow: FLOW_OUT

--5b9416032f3b1648a5b9fdebd51c1ce201f2bcc573241a38627275740479
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8; format=Flowed

On Tue Sep 24, 2024 at 3:29 PM CST, Philipp Hortmann wrote:
> The following is just my personal opinion:
> You can keep working on this driver and your patches will remain in the 
> git. But I think I will propose to delete this driver. Reason is that it 
> supports maximum 54MBit/s and the connection is always weak. Its form 
> factor is mini PCI that is really old. I use an adapter from mini PCI to 
> PCI to get it into my Desktop PC. It furthermore is not buyable anymore.
>
> I like to focus on the hardware that is really well useable and on the 
> market available:
>
> For example:
> rtl8712  (r8712u)
> Backard Bell: AW-NU120

I agree. I'll take my time to learn and make more practical contributions.

-- 
Xingquan Liu


--5b9416032f3b1648a5b9fdebd51c1ce201f2bcc573241a38627275740479
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iM4EABYKAHYWIQRK8k7aQ0rr/Uwki+E2I1LDHPWnXgUCZvK5+VgYaHR0cHM6Ly9r
ZXlzLm9wZW5wZ3Aub3JnL3Zrcy92MS9ieS1maW5nZXJwcmludC8zMEFGMUFDMDcz
MDg5M0VEQzE0OUI3OTVCMDA3OUIxMkU2Qzk4RUE2AAoJEDYjUsMc9adeZg4A/2xp
9GUGEFxkCQayPxDyjbWBid+Da1wDmBrfc+IGwqTOAP0eBOuErJfHjcoxuf7/DKUV
6vF8tVxLC0yEOicIM/MCAQ==
=yhkb
-----END PGP SIGNATURE-----

--5b9416032f3b1648a5b9fdebd51c1ce201f2bcc573241a38627275740479--
