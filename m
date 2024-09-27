Received: from out-175.mta0.migadu.com (out-175.mta0.migadu.com [91.218.175.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC03B15443B
	for <linux-staging@lists.linux.dev>; Fri, 27 Sep 2024 15:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727452430; cv=none; b=SWFyhLMp6JLRs8jJbL9P2VqU9H0QKBGfCnoCDi7Rur6IVf7D8LJZ9vOxgeHtoxcR09phpFmCQqZjq+YOGeRF8bFmHs5TVUu4qJTrKt1QNw5KbeWzyOazqCuifghNNzCVds6UrZPBm0dgkAuF8s4t5gF4kPzbvaGUxFkPkqzCBko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727452430; c=relaxed/simple;
	bh=m73kTn1FiOVjNDuAAijNwcVvwqRvcR31r50qp6jVgys=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=syPdfLJZPdUsenj6Kkk+WuyrzCVzAJifGwasZcK8/UM5Bk+3otN1yxqAVW+dvRqycja5VU8MSkKVWYaAC2cwtuHVlKgB9oBZ1wYD/smM1Me3y2ovway/SVzkI08uH2T2f90pxMzyy3cLYhAG/jX3pqG+L4irgauWmQWIlDzI62M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=b1n.io; spf=pass smtp.mailfrom=b1n.io; dkim=pass (2048-bit key) header.d=b1n.io header.i=@b1n.io header.b=q2K/+3Qa; arc=none smtp.client-ip=91.218.175.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=b1n.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b1n.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b1n.io header.i=@b1n.io header.b="q2K/+3Qa"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b1n.io; s=key1;
	t=1727452425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MrRWjp70LLWukpDeEqzl+DxRbjw0dZRDDnsvuRSCUtQ=;
	b=q2K/+3Qa8JVirMw2MrvS1IurBVxTV8aniXUYcR128zktaKIt49wkqyAXjA46A7Rtpy3+KI
	/8l7e/RGJBEGWVllZhGJyG+hZiGZ1JsDvluO64z5dT+4UwKUHcJ13cSg6mul9rgI+fmXxN
	3D5LJxljlR9E5gvkkEK27QBqDsI9m1dSetd/tl/wpITDDQawgG1CtgvlRzBRI0axIndXkq
	39pKeIiX1TR5NZEthnCvVKBXRUe3lbRIZa98oFEzqS56DfRfxl9hu7vU/OFhJLmnzIMIX2
	fQ/h8s+G1mzzYucOEIBD3EKcpZMJQ6ej3SB4FIZ5gTvhDClwXAD2u6KFDj4YLg==
Content-Type: multipart/signed;
 boundary=b8bd27bd84e1265222b75fe1216dfdabde64cd8d460f647eb948bcb0026a;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 27 Sep 2024 15:53:37 +0000
Message-Id: <D4H6RX1ZCSQ8.1BQ8LW44D65X1@b1n.io>
Cc: "Florian Schilhabel" <florian.c.schilhabel@googlemail.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>,
 <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8712: Fix unnecessary parentheses warnings
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Xingquan Liu" <b1n@b1n.io>
To: "Dan Carpenter" <dan.carpenter@linaro.org>
References: <20240927151637.82772-1-b1n@b1n.io>
 <9bf11c06-85c7-4ef0-ba26-e4780a28f23c@stanley.mountain>
 <D4H6EYM973NS.13D8BVWVTVO2D@b1n.io>
 <75267b21-f800-41a5-8a7a-ddbf0062ffcd@stanley.mountain>
In-Reply-To: <75267b21-f800-41a5-8a7a-ddbf0062ffcd@stanley.mountain>
X-Migadu-Flow: FLOW_OUT

--b8bd27bd84e1265222b75fe1216dfdabde64cd8d460f647eb948bcb0026a
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8; format=Flowed

On Fri Sep 27, 2024 at 11:45 PM CST, Dan Carpenter wrote:
> Greg doesn't agree with checkpatch about unnecessary parentheses.  If the code
> looks like this:
>
> 	if ((a == b) || (b == c)) {
>
> then just ignore checkpatch.  However if the code looks like:
>
> 	p = &(foo);
>
> Then change it to:
>
> 	p = &foo;
>
> This sort of change would need to be split up by driver instead of all of
> driver/staging.  So it would be a series of patches.  You don't need to split
> it up by file.  Split it by driver.

Thanks, this information is important.

-- 
Xingquan Liu


--b8bd27bd84e1265222b75fe1216dfdabde64cd8d460f647eb948bcb0026a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iM4EABYKAHYWIQRK8k7aQ0rr/Uwki+E2I1LDHPWnXgUCZvbVCFgYaHR0cHM6Ly9r
ZXlzLm9wZW5wZ3Aub3JnL3Zrcy92MS9ieS1maW5nZXJwcmludC8zMEFGMUFDMDcz
MDg5M0VEQzE0OUI3OTVCMDA3OUIxMkU2Qzk4RUE2AAoJEDYjUsMc9adecmsA/1CT
ARv7d7BNP8jqMV01kDzfhh6aMo18uku1ssSaCCm/AQDxRh6mwE9BIwRfYM85Iu7F
GHZ/mLrhGgDY9tQ7kGJaCw==
=0GIo
-----END PGP SIGNATURE-----

--b8bd27bd84e1265222b75fe1216dfdabde64cd8d460f647eb948bcb0026a--
