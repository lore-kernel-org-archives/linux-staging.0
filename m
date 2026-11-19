Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795114932;
	b=rLWhkxqpUqIrXO6rIIkKBu9ayYfagCujapBt0g2LibbsWrNrZ67vrNQEb0ln5rTSgcKI
	 tVCk+SihSOerW14GVvzw91lzZ1mH/+7xGLq/56Eredu1rF3lX1UGTtCZieTrbYvc+JDs5
	 l/+SFhnQzwJzforP5rX9E1+euqXFfjRseb4mq7D80J0EWzpgi09zCIn5Pzx+IYWBQpSOk
	 9lewxqRBQRJA6m0rQyjSJY+jsNSqiFxwoMr+bzp2MJ2AkLkRPQTS22xvKZf/Agyd/Uue2
	 d/i9sWzXfKIi2BJ1sPBOm14EJXguWo8qHrOQhm/l7SNx509Mygvycg8cq11YG5vqCFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795114932;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:User-Agent:MIME-Version;
	bh=hKkPpNGKPc9dB0PHZyw3/Ep3fUq1c/BlK7UqcWPEb1A=;
	b=Mst2lbJ+BfboLHUmVSEFVAbiYmqrOaz0oROsseMwjxIgkliWZ+uf5i4phzBLgts2XhdI
	 lgi3mj6lWgoZtmYyE9Htu94LFYPEIBndOMe9sDJ9pFZaUnriye8Rij3BKRA/EJU8YupRh
	 855ZsF9wCjZqptFl7jlTGZ6YBdSDUUwUnO2dL+fq2YrhsfN0ucNvRrWhqM1ZXvmDOeOBp
	 eho19unM9P7/nJy4uR26SK8pzV/YxXov7d57U5QkjuvIXytIzZzsO709dwL6EVyQM5cbo
	 zBhZfkANSu3LJ0vUNW/pF1Gc8SegMGJCqYhDBsAfUV6vA2Z+tzS1e5zP6c7P23czxEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=J1K3uzlH;
	arc=none smtp.remote-ip=209.85.222.48
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15147606A325
	for <linux-staging@lists.linux.dev>; Thu, 19 Nov 2026 19:02:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15147606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=J1K3uzlH
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-990703f817fso61422241.1
        for <linux-staging@lists.linux.dev>; Thu, 19 Nov 2026 11:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795114926; x=1795719726; darn=lists.linux.dev;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hKkPpNGKPc9dB0PHZyw3/Ep3fUq1c/BlK7UqcWPEb1A=;
        b=J1K3uzlH6p2N756sLc5rSBtHDJUBFbERDnP9PRQ7oIdok2AIReIaZd1lVrZMKg1qcd
         6pTtuXiqYIf0XZXZPfqecCFozJsS6t806RGPQtUHJPKBzNQ0QvIeHK7RoPEqOvTUk1eF
         fz1Tlu8ai5NHbcj6TToHX2E8wZbUjihBpmB5oF1KMOxLu8de3voI9EAjJ9KgI72il4+L
         TCXKYGxqXSgtFQYGoixPCwdOOGOJkqEiOyaXsWIVYQe01wfiEHUH0EtoMAmV2scnzGdY
         x8ifkdHuRESnDUykzkqs548ZWhI4A4+eH9BirVC+WCoVKB3/btdd3J3p7rR72t44lRKz
         sT5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795114926; x=1795719726;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hKkPpNGKPc9dB0PHZyw3/Ep3fUq1c/BlK7UqcWPEb1A=;
        b=jJZWsmDT45vE1+9C1kpC0oH5TV9TxtK85VnrtsAGq1ZiWfj79L17H5GOPenAdMEAN1
         ggSkz8WgJ7lLhgNxlJuf4pa4SlkgOQvTz6ODtAdvywD1fxeX/J6zeQEQPwXbJZnUXmjP
         UtdCUtu23j6XO+m7WDfKCADlxrbYz8tHpGh2nbiPTBeeSBBOBp9ReveTHOm5TXez6hyl
         1O3+6TBTg9xS3rffs54KnpWtfrf7G3iowi4suvyNiKLnUkWpYGdlVJ0dNGIkjJ+SBPzJ
         OFjdhTSc6XSopT1vNqGwM5ERJZQ5PhCxBh6SXc+lsx+BPDvaD+xX1E3yxN3dLW5/4Wfb
         30GQ==
X-Forwarded-Encrypted: i=1; AL+hErHZKwxcIqHcHtE6OL01MfsIqWVnVylRJSjEoDDc8J41RZSVm+dIH87AhLflgnUXVfD8wR11n3JAL8ZmWsqu@lists.linux.dev
X-Gm-Message-State: APuU4Z8oLc2IHnI5j31M+OwqQo6Y0K8fesLVbtbJcDs95+DD3FTDBkKi
	4N3iBLjMrE5r29zjljUp7B0HlUiTfXe4KmTbG6eqj25dC8s76AllefHZdAVvXcu5STw=
X-Gm-Gg: AZFdTZej1HM4uvH3S4RxpZJV5Rl1uiVJ6sYcSQHxm+MhrHrsQS0slqGE02zk3ZgJFMs
	1ri3qnPi9lHnDUkPG+F2h9MxP6MoDsLsEzkgidrnLRwUuQvZiVahJIn3Wu4yzha6BaRw/4mM24p
	j5q+rQhe8J4/KMBXsixXBQ+l7Rkb7I5DPX4a5NP2wZcpbffDjezNFDTv7MIgTd/ppBKr/eJNG9L
	bg3Az4ARDRSqkavL2c1B5cOIWKmYpPAkuOp5vy4bkvbG5+mbRechOpep8SlsM69AFwgn9SP8u9r
	xYdHRrvbwmud0YFIAEdl53ZReF1RpshnBfz+z88C4xGp4XMuR9M0ZHeF5pQDgZkX9I7ljZoXfFA
	L+jZ63K2VvCqUTpq/K+fd2Y3q7pSs7AI/OCTL6sJagRFFyyFjxg3iUhk7U+F5bOfzRvbqYYqAps
	B707+6KGfJ0Lhq/GQR96AvYEt23YqOLT5X+21TtrWFzh5cTdnTFArYMmcwsfgmCr8iGpBpNNw1t
	vR0FeDgHaIpalUH6K1S+9iIL7eb36H1X+Qt09cVye850YUViFh8GcJz1heS0HcHeKfy5uJACH1i
	AuZTTenzXUF0k8OjMrj7+wwE6JFj8pqrm2ZCn+H64hA+ANPblRd6yaY=
X-Received: by 2002:a05:6122:c88:b0:5ca:f811:25ac with SMTP id 71dfb90a1353d-5ee8aefbb61mr486259e0c.14.1795114925522;
        Thu, 19 Nov 2026 11:02:05 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e6df8a28dsm809462241.4.2026.11.19.11.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 11:02:04 -0800 (PST)
Message-ID: <84fd9703862c225d63d973cf170b06ab7a962312.camel@ndufresne.ca>
Subject: Re: [PATCH v2 6/6] staging: media: cedrus: Use
 devm_of_reserved_mem_device_init()
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Daniel Scally	
 <dan.scally@ideasonboard.com>, Jacopo Mondi
 <jacopo.mondi@ideasonboard.com>,  Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Eddie James <eajames@linux.ibm.com>, Joel Stanley	
 <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Minghsiu
 Tsai	 <minghsiu.tsai@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>,
  Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>, Yunfei Dong	 <yunfei.dong@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Joseph Liu <kwliu@nuvoton.com>,
 Marvin Lin <kflin@nuvoton.com>,  Dmitry Osipenko
 <dmitry.osipenko@collabora.com>, Maxime Ripard <mripard@kernel.org>, Paul
 Kocialkowski	 <paulk@sys-base.io>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  Chen-Yu Tsai <wens@kernel.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland	 <samuel@sholland.org>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai
 <billy_tsai@aspeedtech.com>, 	linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	openbmc@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, 	linux-aspeed@lists.ozlabs.org,
 linux-mediatek@lists.infradead.org, 	kernel@collabora.com,
 linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev
Date: Thu, 19 Nov 2026 14:02:01 -0500
In-Reply-To: <20260902200703.2016410-7-mukesh.ojha@oss.qualcomm.com>
References: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com>
	 <20260902200703.2016410-7-mukesh.ojha@oss.qualcomm.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
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
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-Zy5+UcnjO9CPStg5/eKL"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

--=-Zy5+UcnjO9CPStg5/eKL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 03 septembre 2026 =C3=A0 01:37 +0530, Mukesh Ojha a =C3=A9crit=C2=
=A0:
> Use the devres-managed devm_of_reserved_mem_device_init() instead of
> the manual of_reserved_mem_device_init()/of_reserved_mem_device_release()
> pair, letting the device resource manager handle cleanup automatically.
>=20
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

--=-Zy5+UcnjO9CPStg5/eKL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCav9HqQAKCRDZQZRRKWBy
9KPMAP43HkphsVrqQTwGITR+0glsiS4Fp5Wyse7t/ZPwvyRH2gEA4/6BFP8fPbe6
9p9JGy6Ck2BZu8qjXZw4UU8oUtkiJgI=
=GZdK
-----END PGP SIGNATURE-----

--=-Zy5+UcnjO9CPStg5/eKL--
