Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017713BC67C;
	Thu,  9 Apr 2026 14:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775745590; cv=none; b=lxQrDK7GvWXOkMgzmOFuZUEK26ktMJ0L/eSZT5VqCs38MHMtz4aDv0FRxLi118Ec0wmjHqGmftnmu06YMTsemtjFWQvvRWsviUAuMwcFs6CQJzDPZnaRQObG5IZ42hOIR8Gs9oezUsxuT0vEkii54O2aCXnmqjQKIOsNV8MW7fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775745590; c=relaxed/simple;
	bh=tvuRwRkxn8yyqW5u+9Ug+mi7EY2+Rrh1Yf0vc/rBDTI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ogFa7Jq24yYSH8sNMI0MXgMkJmTaXNTGJw/34mw57YUGEf9Dbx4hPE3hWmtmeX7XK8LiSI0GkGSUU17uv1oA6nKf+NMGHFHxnRxvQl3KRnpwWNpI0uyvA5emEQVH9ZXnNiIU6fP0/m937TDOsYmj6dQgWvTjCSc0GK1HBbRIsmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=SuZRrpru; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="SuZRrpru"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1775745587;
	bh=tvuRwRkxn8yyqW5u+9Ug+mi7EY2+Rrh1Yf0vc/rBDTI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=SuZRrpruZNs2VoZYP5hr/VVy5mKu7bEpZwUEGg5Y7aonyk19S2w2ijPcGgV671zeR
	 FyDYZ/099+Ofx5kf0owGBQy2WTJCULuELgHhWFaMNDZ7F0fZ8yelx2biG9dRRpjej2
	 bkMrdPp6CvC+cHWJDj+dAG+k+4yQPwP2ehVW6hK6FyKLPRZFwgyt19LfbVZxAhj1tz
	 55s+ZWiEmaDR3tGnt4Xty5vhjbaxjZZ4s2P6idRMQUttGAr64jbKMIaxFmWvArLpQi
	 388vvKVMJa0isD7sGNIA18i0bXvy4qO+m+0r/WjuMeUUvu9KIE/wgoa5Ui4g0ULBjv
	 ZOswuCd5VWqqg==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9392417E135D;
	Thu,  9 Apr 2026 16:39:45 +0200 (CEST)
Message-ID: <a5f8c14becdc926f14ea852c8c5a2d4665a2ef8a.camel@collabora.com>
Subject: Re: [PATCH] media: cedrus: skip invalid H.264 reference list entries
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>, mripard@kernel.org,
 mchehab@kernel.org, 	gregkh@linuxfoundation.org, wens@kernel.org,
 jernej.skrabec@gmail.com, 	samuel@sholland.org,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Thu, 09 Apr 2026 10:39:43 -0400
In-Reply-To: <ade4Qe4OS04au2Ba@shepard>
References: <20260324080856.56787-1-pengpeng@iscas.ac.cn>
	 <adeqkmA9VhaPkSAk@shepard>
	 <4bd5d70a6144f3e8d4356c182f314cf735f1921c.camel@collabora.com>
	 <ade4Qe4OS04au2Ba@shepard>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-jkYxU3/N85lPIzmvy2j7"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-jkYxU3/N85lPIzmvy2j7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le jeudi 09 avril 2026 =C3=A0 16:31 +0200, Paul Kocialkowski a =C3=A9crit=
=C2=A0:
> I think it make sense yes, but it would be good to document it in the uAP=
I
> document too.

Basically, extend in the M2M decoder spec(s) on the existing documentation:
  =20
   V4L2_BUF_FLAG_ERROR:
   -
   When this flag is set, the buffer has been dequeued successfully, althou=
gh
   the data might **have been corrupted**. This is recoverable, streaming m=
ay
   continue as normal and the buffer may be reused normally. Drivers set th=
is
   flag when the VIDIOC_DQBUF ioctl is called.
  =20
  =20
cheers,
Nicolas

--=-jkYxU3/N85lPIzmvy2j7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCade6LwAKCRDZQZRRKWBy
9DvpAQC6ecbg43McOvC02BU2O9ovdwzht+CzRVOQLfnF16QH4gEAkE+bOFKHp00X
0OnIN+nfr6wWDh512LITs4OMudJbqQU=
=8WuQ
-----END PGP SIGNATURE-----

--=-jkYxU3/N85lPIzmvy2j7--
