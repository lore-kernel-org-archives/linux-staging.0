Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0EEA199B8
	for <linux-staging@lists.linux.dev>; Wed, 29 Jan 2025 14:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738162148; cv=none; b=DqJsbS2GI+nFFNwlpLWqZvgJrQJJwXsjY6RZCypq4Fsux9feRYdqaxeNy0ggwdIgEMtS3/mm4nwkYg0IvXk7pZB2H786vMvTfF5FZ3JqvztNbRyBSPbT/or6DINdPWf/MgA5JN369udE5qu+V+geaB1JisLllm4boN+Jvd30tXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738162148; c=relaxed/simple;
	bh=t1NL0hBfeu93pwmSKWKCLe6DNvNe+PaCC8pPv9JXU7o=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=gvEj0wWWl/F7011CZWxfXes8bVbVbMMr42Y07KhFgst+SgCoUnlvGKSA+LBDkId3AAQGwll7EQwKaSc+Go2wkLZ1g615I+6ygBs8Oo3t0uRPJBNfUgTV/KlgtaPdBFgPl9p2TYpu1efCEttNeJ3C9HdzmJ8xFAOr7sTOp6hBUCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f+aE8weZ; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f+aE8weZ"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5d7e3f1fc01so14450152a12.2
        for <linux-staging@lists.linux.dev>; Wed, 29 Jan 2025 06:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738162145; x=1738766945; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wy9Kd1tRNPjJ7fX39Zk0IB/RiCX0HA9i6UGO0pbaFf0=;
        b=f+aE8weZHuqX9ULM2rkQQXVMDnQP2AuTsGFK9qgmwOkMY5VTb6paP3rnVymMPn1ity
         U/0oTrUyB8wQbAp8D24+Q677IXCcJbGGFfNVph/4A3RvKm8IXMSEjtkd5sbYkzMbEZNV
         9u4rEx81sopDpKwNOGUB09o51RDmr0oME9lEz6B2hxV9I0ABR9c2Ryx7xkZnm3wSWwxh
         DPPlQMI0URQKSmU8D8oUgghz3Yr92dcpY3ANlhSz9tuet1i8KUwMW0OJFlnuMkiGyZp/
         SdPR51OGPz8QcdrtwCZj/Vhu2CkBit4onKGwbZP1nz5oMl6xruLC8Vfiud9O7qQYhMWl
         KJwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738162145; x=1738766945;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wy9Kd1tRNPjJ7fX39Zk0IB/RiCX0HA9i6UGO0pbaFf0=;
        b=bCQWWNt19aKHqgo6mT1fpCgGJKiQXVzPDExyXhlH2Njg27flEm2oA+QggHPJo5um2h
         61BhI4kmjo2x689wijwClXBcaHh+TC+ZMctA7Jeqrbn32dWiBepiR/vXPJPPsLYjSYcr
         gHPAc75iSuVhLlqf2s+xzbWZ3RwHvtRXA/U/ldhnf/S8t2YQJeP6Yygkwgk5cdg0nZa/
         i2eyOBnG65S4YWIG5soKq+C4/uunL6Az/cPSZYl1RlXW0XR1+PoLsTJ1VJyJHBUQQIqW
         LaRRtJmoxq8N7/gMsq0OiyKA9Oetqqupy/i8Qm+AsbC1Y4J3doSxghiUHummNCIV/RS3
         vUPg==
X-Forwarded-Encrypted: i=1; AJvYcCVXmkkUWY4Vdrqw5caPB/P1QTecYYrMMmQ6exIGhI2atz/MxRRmvxEBrKPeLJDCiehEDFMmvCtEVCGfywRR@lists.linux.dev
X-Gm-Message-State: AOJu0YwhBDJl/Fgxh2SeM30r3mF7oDPAePwEIsr83K8GKsV7Ka7sKQAf
	cIa8xPbmgJf0RVDJ985iTiTsFzm2AZCQ6H1s0JeGGGQQ/+sb0oty
X-Gm-Gg: ASbGncsXRkgf2xnhGOKsusp2pR2qsKQhQqu7NazhK6z7Y2b+FEfrbNK2HzwomLgEtVp
	Z7B8ofPYXk5od7Zy2BZtngmt/pwa+HbDPz2v+OyJk1MTVbB1T9cWwQqc7GHNlOrmshZic/yyYIW
	yTb3VVpbODH3LlVjQiOm6LqwBfoxpnbtDopxft/mcW2zpj53XuBzRUQ2BK5VwC3zBUDJH9pnzHs
	KSYEYkGBlahWMn+oIuv6mhExTZuGoJ/yv6AUDfnajkc/54ZEc7xaBj47bsAw4AcTOeB6Z+JdqnW
	q4fb1ZShz9SrqLIPkX4zyinPaTSXC6FNS5YXy40alr68NmFRs35PCxKdZi0BAayWb5Xt5GUj
X-Google-Smtp-Source: AGHT+IH2RX223oR2m9txbeNFTWl5Np8ejjscYRjYqWj/WLr3tsu0nZkXz1s69kvMjRYyH6ERTmSECQ==
X-Received: by 2002:a05:6402:5251:b0:5d9:cde9:29c6 with SMTP id 4fb4d7f45d1cf-5dc5effb151mr3128289a12.27.1738162144793;
        Wed, 29 Jan 2025 06:49:04 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.chello.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc18628a5dsm9075610a12.26.2025.01.29.06.49.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 Jan 2025 06:49:04 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: Re: [PATCH 1/3] media: rockchip: Introduce the rkvdec2 driver
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <5969581.LvFx2qVVIh@arisu>
Date: Wed, 29 Jan 2025 15:48:51 +0100
Cc: linux-kernel@vger.kernel.org,
 Diederik de Haas <didi.debian@cknow.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Dragan Simic <dsimic@manjaro.org>,
 Alexey Charkov <alchark@gmail.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 linux-media@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev
Content-Transfer-Encoding: quoted-printable
Message-Id: <CE4343FE-94AA-4F84-8C43-8366013AED84@gmail.com>
References: <20240615015734.1612108-1-detlev.casanova@collabora.com>
 <20240615015734.1612108-2-detlev.casanova@collabora.com>
 <3333233.eAoTOS8U2s@bagend> <5969581.LvFx2qVVIh@arisu>
To: Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: Apple Mail (2.3826.300.87.4.3)



> Wiadomo=C5=9B=C4=87 napisana przez Detlev Casanova =
<detlev.casanova@collabora.com> w dniu 15 cze 2024, o godz. 21:44:
>>=20
>>=20
>>=20

> Yes, the vdpu34x decoder on rk356x socs should be supported by this =
driver but=20
> I don't have boards to test that unfortunately.
>=20

Detlev,

Just FYI:

I done some tests of rkvdec2 on 6.12.11 on 3588, 3568 and 3566

For enabling rkvdec2 on 356x i:
-add 356x compatible in rkvdec2.c
-add dtsi nodes like this: =
https://github.com/warpme/minimyth2/blob/master/script/kernel/linux-6.12/f=
iles/1078-arm64-dtsi-rockchip-rk356x-add-rkvdec2-video-decoder-nodes.patch=


With this i can say:
-on rk3588 i have some hevc 4k decoding perfectly but some others are =
failing
-on rk3566/3568 only subset of 3588=E2=80=99s samples is decoded well. =
(but is works then works perfectly fine)
-when not failing on 3588 sample fails on 356x - is see errors like:

[   95.666669] iova: 0x00000000f2e80000 already mapped to =
0x0000000037378000 cannot remap to phys: 0x000000002f8c0000 prot: 0x3
[   95.745082] iova: 0x00000000f2f46000 already mapped to =
0x00000000372b6000 cannot remap to phys: 0x000000003a403000 prot: 0x3
[   95.822012] iova: 0x00000000f2ee6000 already mapped to =
0x0000000037126000 cannot remap to phys: 0x000000003a803000 prot: 0x3
[   95.896802] iova: 0x00000000f2ec6000 already mapped to =
0x0000000029fe6000 cannot remap to phys: 0x000000003a403000 prot: 0x3
 turning-off iommu makes above errors disappear - but sample still =
fails.

If anybody hints me for way/tool to analyse of playing/failing samples =
to catch: what encoding specifics makes given sample failing to decode  =
on rkvdec2 - i'll be more that happy to provide details=E2=80=A6    =20
(doing simple mediainfo <file> shows no differences for me=E2=80=A6)


