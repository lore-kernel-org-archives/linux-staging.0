Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B071AD24B
	for <linux-staging@lists.linux.dev>; Thu, 12 Sep 2024 15:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726154721; cv=none; b=CiNHcRpwWUZhdZtFxJbNiux9b294gT357hIeBpb/FbkdH1hpxaxmoXe+PJvF9Vlpw7uHNApV3VblRt94D78elPDOgnf96wV02FStDjOYhkzazID48ZnbYUDlFTBMhQYc5+VwE11aCZ/My8p+U6BzWY4/Qcsqr+vZINyVzW/bKsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726154721; c=relaxed/simple;
	bh=axOYoJlI6bdZq6OU625j/kErOrfwkvuTb3DPmHXAtio=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=qJxMAnm3wzyrFgsIeswc6KcIANFr20MjxZoUZLzgpFnh9uCqD/0UCjAb3V297UUw7+0eyI5WwY4i7HHlAAV3SokEyvv1j9Ox02pE3xXLp09Q55Ft4edA4QBCJDFBo0FyKTcmJLjlKWB0nNNb9wdsChnx7Xnxl7d9J+jKJR30UPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=b1n.io; spf=pass smtp.mailfrom=b1n.io; dkim=pass (2048-bit key) header.d=b1n.io header.i=@b1n.io header.b=Vzz79M7C; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=b1n.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b1n.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b1n.io header.i=@b1n.io header.b="Vzz79M7C"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b1n.io; s=key1;
	t=1726154716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ny1DW933RdPYWKsafrbgXfgTl8R051z3hjD0hBkKkWs=;
	b=Vzz79M7CXg+G6gMwXnva4TGGOHeoWwPB5Of4osZYrBXPAKQuTur0b19dLsSXvPQhcTtfLs
	5j9FuEOPbOMjmbF8KzKiX2R/i5+RJpd7qs2viS5BTOs3H/kv247YRQhtCNrLEwUrkwgEST
	oSZxIPDYuav118C5s/z7a3yFW3LD9YYZXXtVKJneIWClb9M/pYg8YbnfK6DdvZbbvb7CRx
	lx+eg5vev5TuSw55WLIJJA7Xq+c8ywlMJYyg841OFh7kAbJ1e3gh5z5xtcwwbnajbMb7BV
	PD2yIUZGBz6KPqp48D5NCxzlQ9yIwcaI6f+RALfSdWAJ8EbcpU1vjYIs6orL2g==
Content-Type: multipart/signed;
 boundary=83bcee3f1348bd116570d71e3276ca0c0086caf96377bd8fca9839bf4539;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Thu, 12 Sep 2024 15:25:05 +0000
Message-Id: <D44ERWLRJH34.2CABCYZDI1SI9@b1n.io>
Cc: "Philipp Hortmann" <philipp.g.hortmann@gmail.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: vt6655: Rename variable apTD0Rings
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "b1n" <b1n@b1n.io>
To: "Dan Carpenter" <dan.carpenter@linaro.org>
References: <20240912145234.75499-1-b1n@b1n.io>
 <9d12ad46-d028-4be7-b8e3-2167e214ae66@stanley.mountain>
In-Reply-To: <9d12ad46-d028-4be7-b8e3-2167e214ae66@stanley.mountain>
X-Migadu-Flow: FLOW_OUT

--83bcee3f1348bd116570d71e3276ca0c0086caf96377bd8fca9839bf4539
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8; format=Flowed

On Thu Sep 12, 2024 at 11:09 PM CST, Dan Carpenter wrote:
> It's weird to have ap_td0_rings and apTD1Rings.  They no longer match.
ok

-- 
xingquan liu


--83bcee3f1348bd116570d71e3276ca0c0086caf96377bd8fca9839bf4539
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iM4EABYKAHYWIQRK8k7aQ0rr/Uwki+E2I1LDHPWnXgUCZuMH21gYaHR0cHM6Ly9r
ZXlzLm9wZW5wZ3Aub3JnL3Zrcy92MS9ieS1maW5nZXJwcmludC8zMEFGMUFDMDcz
MDg5M0VEQzE0OUI3OTVCMDA3OUIxMkU2Qzk4RUE2AAoJEDYjUsMc9adeHPoBANnU
FBIYCc/FRoAI0Ad8wOjxYDOL0Gd5zgnODepdrP9rAP4/KBlfmeO2Jrjlaag1ABec
OVNDhNYRhtP9phqwS4lHCA==
=BZcD
-----END PGP SIGNATURE-----

--83bcee3f1348bd116570d71e3276ca0c0086caf96377bd8fca9839bf4539--
