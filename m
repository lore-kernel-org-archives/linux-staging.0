Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C88019F120
	for <linux-staging@lists.linux.dev>; Thu, 30 Jan 2025 10:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738233985; cv=none; b=P7/wDw2/q6MzuiR7M49TdOG9ks+vjDbT+O6VzMuTr+4VYw20BY5pSPbaBwlHGpQwo5gTnhH3Fpr36OPlhLsUn+1FI6mxzTooKZ6WVgCuVAKPo7fQEcHEtKTyat+mxRVc7XY7qS4Aswu34xFN+GYEqBPN/pOgC9wxTBlP/KcHBzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738233985; c=relaxed/simple;
	bh=gnlUmrWlO7OgOPSRJanEmk9xOsvql/02GYnysEms+X4=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=rQapo+/cVhZy4bz/zKNaueIbXF9m6ih+gkdjIlmLrj33ZK+P7LppjUHW3ArZaimhtqGP5KkTZ3hpxMbuiaj6lLc6pYv55hYnPNZ8f3JQelYYYg3FurKeUyZse2jFsO5674QUUYv42P2Ce7qZwjUbgesWyQ/rphsuvB39FcLYSUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TTXWl8Jj; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TTXWl8Jj"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5da135d3162so936583a12.3
        for <linux-staging@lists.linux.dev>; Thu, 30 Jan 2025 02:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738233982; x=1738838782; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dvH7kPRqDnGEpR7MN/c0OEfUDsiKTUq2RFU3G+hwaFA=;
        b=TTXWl8JjNoAfx1VRR2hMCvrjdWqeJ2ai6B/jc46iDqLp+DGKxQgwHuZh4srKOIYHZa
         sm685zA2eRuCtCsVZZp7ttAEDYEn5F7+yffgFFURvGw23ONA8Kw1rtKoU1Cxk9I9xYWb
         mdpzXyqAfS6mJvmvfRBFog6vlG84uhZMOtcvg+sM/prus/neq+5zLPE92g5N622vauHm
         I6loHls5NYfssQ1uH5bOb6glaTWgBLlWjuY8Gr6xOsPqjaQRy3snIkVU/o6AVwZEjTev
         NXXA1riiqRhZZIoDAJnMvSIwlr2Ib7v04+jb51s7fNO+V6G3QYf43gu+sbYNl8gZW9UQ
         9+NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738233982; x=1738838782;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dvH7kPRqDnGEpR7MN/c0OEfUDsiKTUq2RFU3G+hwaFA=;
        b=tzjRIxJE7LiMFzt84OqwmVEGVA6JXViRA3k+ixHpgL0i5hPVGu9xGzq1fPYnWzjcwX
         JZFHhuQhF9sK0pvEsSojPGJXcppKhje7jd7lzDGlwLC83hq7t3tL8kfZKhZ9cQw3qLqo
         4ADtoBMGK/RU72PhuriN4zlmRJFMcNCn4vkqTON5ojnj0Dg89aEeLTMnBCcCqLEuFTnJ
         Z5ccD8GezqJ/JKXmWKxc/aRCoqJsx+yWZcqY+j1X5ukyDbHRoPyMXxCxXuml+89axGrp
         d9eE8uaC5AGCIWSUDZXWJw5ZSXUHGL4E9RkmoFci5QGCyXmvUaXcQeBfIXn5tfeYYk94
         YPpA==
X-Forwarded-Encrypted: i=1; AJvYcCX2maUmPmW0RwkAJuH1T6tNr13a69aCYVku3aZMKBbe3VN+qkyJvv33RGyY2k13L5KzlhquuF3fMCGdhVyC@lists.linux.dev
X-Gm-Message-State: AOJu0YzUJvW4ZfF7wI5hp9Wwt1XlqjE+/a42hu+qzTd2pzDE8fRB5Z2r
	wwU26GMxKd1fdpLdpWrYOnJNvJ9H2JNLzdghqWQ7Yc+4FPt39czkSWPNNA==
X-Gm-Gg: ASbGncsrtNXCNT0UdqgcyoCUWsSiwosoegBVONJIKgUdpqG5KiaTbXSNnmlR5a9ycBh
	V7B3bcHzh6z/HNyorTKTHNxEJ5kXk3ha7pxwacXJlKxIkH/fqPFkEXAXS/8R/ds78zLRkMJfBq+
	s1+kJuTMhQhIw4/rlcPWIkMbg2WPAG09jvnxFP7NNXygv2Y+rzZOCLc/DD0q8I7p6PPrfxaTA93
	sNE4xTchUYyZRzXLzbquKc0tTCNPDbcCKQ9hxSnQNrDyVhg2Y1mArSFraJtW3mIET8gQoNMzgmQ
	vnCwHRab3UPTyYGrz23wFuD8qb9uBcIYQX+4GwjI6VM8ibtpr+4JOXavHSHo7V0FATWC3SXq
X-Google-Smtp-Source: AGHT+IEqE7nySufMnirHCjAVfxj7jngqk9FZNYT/ymSENzVPV3ZLZzx1oB1e3XlK0q5RDTVUp4kFhg==
X-Received: by 2002:a05:6402:50ca:b0:5d0:b2c8:8d04 with SMTP id 4fb4d7f45d1cf-5dc5efcab34mr5837467a12.18.1738233982119;
        Thu, 30 Jan 2025 02:46:22 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.chello.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc725aae6esm854530a12.1.2025.01.30.02.46.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Jan 2025 02:46:21 -0800 (PST)
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
In-Reply-To: <8541055.T7Z3S40VBb@trenzalore>
Date: Thu, 30 Jan 2025 11:46:09 +0100
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
Message-Id: <278CF0E0-7277-40F3-942C-6FA61AA759A0@gmail.com>
References: <20240615015734.1612108-1-detlev.casanova@collabora.com>
 <5969581.LvFx2qVVIh@arisu> <CE4343FE-94AA-4F84-8C43-8366013AED84@gmail.com>
 <8541055.T7Z3S40VBb@trenzalore>
To: Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: Apple Mail (2.3826.300.87.4.3)



> Wiadomo=C5=9B=C4=87 napisana przez Detlev Casanova =
<detlev.casanova@collabora.com> w dniu 29 sty 2025, o godz. 17:50:
>=20
> Hi Piotr,
>=20
> On Wednesday, 29 January 2025 09:48:51 EST Piotr Oniszczuk wrote:
>=20
> I suppose you tested with my hevc branch, which is not really ready =
yet (Some=20
> ref frames will work but usually, it won't) Can you confirm which =
branch/commit=20
> you based your tests on ?

Indeed  - i=E2=80=99m using your rkvdec2 hevc code from: =
https://gitlab.collabora.com/detlev/linux/-/commits/add-rkvdec2-driver-hev=
c with iommu from =
https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/-/com=
mit/bc47c445bfd9586115e9bcf5f231c5a5c5f0f828
and =
https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/-/com=
mit/9a9fd791513bc0d02c2242c88f23b41bd47de30a
=20

>=20
> For the iommu, do you see those errors like that only on 356x or also =
on 3588=20
> ?

3588 has no any iommu errors.=20
I see iommu errors only on 356x
=20

> The hevc branch should have the iommu patches to fix that kind of =
things.

I=E2=80=99m using:
=
https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/-/com=
mit/bc47c445bfd9586115e9bcf5f231c5a5c5f0f828
=
https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/-/com=
mit/9a9fd791513bc0d02c2242c88f23b41bd47de30a

I see there is: =
https://gitlab.collabora.com/detlev/linux/-/commits/add-rkvdec2-driver-iom=
mu
Let me update iommu code to above branch and report back here how it =
goes in 3588 and 356x


>=20
> (but note that hevc support is really new, so it may have bugs with =
buffer=20
> allocations)

It is already great work.
I=E2=80=99m awaiting for hevc in 35xx during last 2+ years :-) =20

>=20
>> If anybody hints me for way/tool to analyse of playing/failing =
samples to
>> catch: what encoding specifics makes given sample failing to decode  =
on
>> rkvdec2 - i'll be more that happy to provide details=E2=80=A6 (doing =
simple
>> mediainfo <file> shows no differences for me=E2=80=A6)
>=20
> Few features are supported for HEVC as of now:
> - No scanlist support (only default 16x16 blocks will work)
> - Long term reference frames are also not configured yet.
> - hevc 10 bits is also not supported yet
>=20
> These are specific to the encoding and mediainfo won't really give you=20=

> information on that, except maybe on the 10 bits format.
>=20
> You can also checkout YUView (https://github.com/IENT/YUView) to get=20=

> information on media files structure, but I have had issues with HEVC =
support=20
> lately.

oh great. will do and report!

