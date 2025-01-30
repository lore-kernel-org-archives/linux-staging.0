Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E5A1E376C
	for <linux-staging@lists.linux.dev>; Thu, 30 Jan 2025 14:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738248869; cv=none; b=SfyCvTFOIqb7ayF5rA/4srgoUQYP2bwjJCo+AM1QPK02U71uBfw5geUOQHuR62hzobYnRICNYTFyCdx6p1MgPrhXXSUedEZG0+BwL1CNInoWuHs41KKbtC2glWIlAVAlzP6YhssiBxn9oKktg/mIo6PqtnHvE9NlkgfDQUes9Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738248869; c=relaxed/simple;
	bh=ePC6fMP+mBRkjMGGu/8MplwouXSIvjGXh2QC88juEJc=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=tFtuCFS0Mx4Z5X4C4Uy4G2owjPEoUHM/m2KacLQH+A7UcE8gEDlKrixRKHYdCGOO/C+kBXNSiY8eWj4GrdAymgkfYK4gQEBn22wITWSbZXqo09e0imEzCyDdB8GSt0eAKfrG/3I63E9KaWBXk/Kzh9naz1KawqBGSeWymXBMvXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mO7r//Bg; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mO7r//Bg"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aaf6b1a5f2bso2666566b.1
        for <linux-staging@lists.linux.dev>; Thu, 30 Jan 2025 06:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738248865; x=1738853665; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qbp4EtOkuC+0iVMNyfHjqvPw/lKMjNnZSdESNc6UztA=;
        b=mO7r//BgDBmo7/fvNgQjVyyf1m3pgDNiBN7YwFyVuMVdxfQxAcYHe9/WiPhsiJgRiq
         P/1N2A7LMElCK1yOTgvWvETNzyfayLMbWesHsvs03LX9gApc1RG0assw36PSRef8FRnS
         2ZX0ciARRSl3wCzZWQummcjOh4jbI05sEVrlnFTV5bgRKC6qdwfpg4AXNED4IAZ5XlSV
         pAwrEXu7GuK8jVZhlP395joItSSQBptbwYyKgfXr8WnvijEfSc06WCe4BBAwcrxn/B5a
         ii98CkbY/6mAGpHnpZAcAeAS7dcjj7Z9XYpGDYS0G/YiKJogFZFJgXIakSrqhPSLyEeY
         LezA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738248865; x=1738853665;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qbp4EtOkuC+0iVMNyfHjqvPw/lKMjNnZSdESNc6UztA=;
        b=k0RRlJv7aZOb33GHiuuphLW5U78KdXiWiYPS2D61XM2Wpo5j6ixtq+RmFFTPs0sMCK
         SgXlQlhfN8oQEk4bM73d27LQtCXccE5PdBTyYIKH/apC6e9Cj1aSLum6+HMDOMm9W5Q/
         IUdjLAUXPzQhFt3Drg5vUIwKn817zDW2Kos2bQ69wmKcDkE7FbkmoOL6HI2poWir0SK2
         kZTtIWE1oiA28s0Yn+lETb4548rayE5I0LRIpaqmutfG5nccIjosyJ9eIgxxt/VHWqQ2
         XmBAGyKCvzSTbAm/38pK3jcgomx7vH5cYm9S8WSzvnfEB91vc++PwepNW958xi0BATEP
         1TZw==
X-Forwarded-Encrypted: i=1; AJvYcCWT3zbB6MlJdmXKYDBcTmwcCWMKoScqHXmLpJywAlmt1iQYs+an+X7d8mNwo7QrmSdwPx5qGB2QhiJzEQyp@lists.linux.dev
X-Gm-Message-State: AOJu0YwQFPuan+wYsoaT7myVK37GDOUHzBFMMj+NIdniFH8GbEdecS4F
	7x3IwuMBf8rmtAaD3pDy+uF7wv+veK47VwbLf3FRsIr4ntScpcjW
X-Gm-Gg: ASbGncuDnpae91ottjCqk8uLt9BSxApV4GkrmgLcJPBrVDPyZ+OXqBAp0DWBpafirLW
	TpXn4XiMtutwys/ie4sfZY4QfPIzVl+ktQYughWfCtFPNCEKZiw9gAK47oJkDc5H6Uf6gcdTKxI
	Yw4fhEal6onQ9dlprjmd1w1atO4p7MKODDPUJKp/XXyo0QDyf7Lj8fyZETAktdZxydwdrhkrTwv
	no6rr6jAoYtyBlRfQZZGtJDsTWqfz9CgAjOr4GA3O/6uid4bGJuClZRv4lbEpYdTl69V0IV/5ec
	0MXTPxwF5rDEkpBW6s68q5RwHAfi7s27idjzFhRKIGaJMyi5bRtTUqFKcrQweYHkvHWGNtAd
X-Google-Smtp-Source: AGHT+IEscLo+ZglJ4iQ8yhcikhYDyTBbGC16YkQrOwamLjmGj9mpYIbrbWr8u+H0RMfLebwCb6ojRw==
X-Received: by 2002:a17:907:1c13:b0:ab6:8bb8:af2e with SMTP id a640c23a62f3a-ab6e0cc500cmr358429766b.26.1738248864471;
        Thu, 30 Jan 2025 06:54:24 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.chello.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e4a2fe78sm129297166b.125.2025.01.30.06.54.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Jan 2025 06:54:24 -0800 (PST)
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
In-Reply-To: <278CF0E0-7277-40F3-942C-6FA61AA759A0@gmail.com>
Date: Thu, 30 Jan 2025 15:54:10 +0100
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
Message-Id: <B8B4C7CF-B2C4-48CE-84AD-52DF6002D17B@gmail.com>
References: <20240615015734.1612108-1-detlev.casanova@collabora.com>
 <5969581.LvFx2qVVIh@arisu> <CE4343FE-94AA-4F84-8C43-8366013AED84@gmail.com>
 <8541055.T7Z3S40VBb@trenzalore>
 <278CF0E0-7277-40F3-942C-6FA61AA759A0@gmail.com>
To: Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: Apple Mail (2.3826.300.87.4.3)

Update to my last email:=20

> Wiadomo=C5=9B=C4=87 napisana przez Piotr Oniszczuk =
<piotr.oniszczuk@gmail.com> w dniu 30 sty 2025, o godz. 11:46:
>=20
>=20
> I=E2=80=99m using:
> =
https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/-/com=
mit/bc47c445bfd9586115e9bcf5f231c5a5c5f0f828
> =
https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/-/com=
mit/9a9fd791513bc0d02c2242c88f23b41bd47de30a
>=20
> I see there is: =
https://gitlab.collabora.com/detlev/linux/-/commits/add-rkvdec2-driver-iom=
mu
> Let me update iommu code to above branch and report back here how it =
goes in 3588 and 356x

I updated to =
https://gitlab.collabora.com/detlev/linux/-/commits/add-rkvdec2-driver-iom=
mu and basically i see no change (the same iommu errors on 356x; 3588 =
all clean)  =20

>=20
>=20
>>=20
>> You can also checkout YUView (https://github.com/IENT/YUView) to get=20=

>> information on media files structure, but I have had issues with HEVC =
support=20
>> lately.
>=20
> oh great. will do and report!
>=20

Huh - here in need to switch to Linux as on maxOS i have issue with =
ffmpeg ver. mismatch in YUView
Will report next days=E2=80=A6.
=20
