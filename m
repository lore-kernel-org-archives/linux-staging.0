Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795448209;
	b=qXEN5eKa9r51x6azRYB1Vh9l6grKiAL5gmnjrnFUjDzuL/auYwfg0Fmh/Tc9ZMCzGko+
	 /ixG2qMCgUWaerMMALQ4DVqGgZpVFdJ3AOS+5McC0SQgnkbEojp2xmp7NRQ0mm0QA8FLH
	 a6hnnjmMl6bfUNyJc1eyzb6MvvINhsyoiXPcyMMBO88gXn+4Q8auClxVdh30hII/bf/Mr
	 K2HMun+2YNDJG+AW8wNUXWC0XwBAdEmXQjvr0mmEQuVcFaZt0b1YNi2/4fhVNYa//shGt
	 3BluwOrnxiCovKfODS8sTc6L+DJ7/QPfLEKoEpM8zT+I2pqHB5z+YJ3Vwd5L52hr/iA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448209;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7pmbTprJSDMNaET1p8KH97keYwTTHp2TnWKNbSbIQnY=;
	b=Ou4ghXeKSRQCWp6qKogZ8rLnFzJ7dDjNqLKa2Tphmc/dE5nSiWU4UGSPBAW0bFNy3JTT
	 jDinyg4OK8ZA8HJiXW29HOFvjEHqv2cOQrVptD1Tu1X0pr2kj8a1atkzM8h0fBWu0tHWF
	 uK01/i4dbL0IxDr2GaK6BPEquRNiUtFrgGUgJ1Pz977XoG3Y9dSFwmp2l0NoPAXppFsp1
	 N/RYXcjmgbhPrvrWU7gIdFNb9yJgVRBca3Zs0JgUxDpIXcS+WpJf6yFBQNx7Y1V6xmq5J
	 38q1wxJM9fVlPD72vfc0hmqPE6ZsJs89pN0spEFm45L4eniRMBg3r4XZWpvbyiJSVCQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PdeNHTQy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A379E606A334
	for <linux-staging@lists.linux.dev>; Mon, 23 Nov 2026 15:36:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A379E606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PdeNHTQy
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-38699cf08dfso3315173eec.1
        for <linux-staging@lists.linux.dev>; Mon, 23 Nov 2026 07:36:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795448208; cv=none;
        d=google.com; s=arc-20260327;
        b=kVdvCr141m44dLXS6T2TtvCHtLioKPD2eBTzdJtN94Agwib3XnTsJFTV7D+uK6Og8l
         YNr671lJtN+WZrwMPi8HDrvyRBCD5c4bV4MrVVEqbIbRhFX7lQZRDHEAvQKDQkIKxV4i
         7fLiChxNVqNgycaMCNThdMg89Bx2WvK+ypqqQ/dyU71c9SqEa0UdbsUgufdk+DygCFv8
         p+RyEZFcuH99jxVWKxVbGYDjLO97nhSFqW9r/qvwDOjjtXf/jDXi2wCEWjJ5t1fr/DyC
         WUPEbbzoyIQXGibBKew44hHTo4n3F38/0KYDVhjSRx364jkHc1vm+k3dm8BCWe5ec5CX
         x5bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7pmbTprJSDMNaET1p8KH97keYwTTHp2TnWKNbSbIQnY=;
        fh=8vOdJxbTebmrYmMszME1JfTbzoaIprIpf5USYEz5xsQ=;
        b=gvkE/eH3BOizWNS/vZz4u+Snp5rOG3hvNQioMfEv9+EkusyCeIlksjVOgVTmblGeSv
         hGPu2aezEfnECpSEVudiKsGIcxhc1Rf3OZGz62Lg9x/uoXlpp5ssp7g1RxL5Wr7yBtkF
         OFwJzWycTTU5Xx7T/ITxOb6spEnH3BK6jEApXUNEn3V96O/UMnxzch+T6Oel63ls+9X4
         SMDtSqsp8x3HoMMa5r8LvvVkk2pRjiH1K3rjUofxw2x+ps4vaptuKd5d8fUkkqCbi7Vv
         1LBbMJfqB6I2cyPrJegiDS5Af5IvtYBoRIvAg7bEzlqB2B2HSgrKpcG/b1P56Sx3jIpF
         CDYQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795448208; x=1796053008; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7pmbTprJSDMNaET1p8KH97keYwTTHp2TnWKNbSbIQnY=;
        b=PdeNHTQynkhll1GycioR3QpImr65HfeUWnYwY26O/B5qPAqX8yXYr3QYouk09ETPfi
         6K1Mr+u53qQma59mOPAsfnZ3mDRqF5h9xvvREucs+tMuLw+bSwlX4m52T+djxUuHRzaV
         owVbFqmNHQvxgM5J7uK6L+DBp+nO1stZZLKhtMM6Yh9XHTTzKyNhS3Ur0ipybGY7vOTF
         GHyeK6FAe/uCZWDSMzNtos1tHuTUn2bltOes5Mci7u4K86+2eR3Vxu5MnqF9n6g5LdXh
         jrGq/Bp+7HVa0NbzFNTV435W+Go85jiE470dEX8FEILkQVbmkLlnDkfXUcTCVVkYX20x
         7HWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448208; x=1796053008;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7pmbTprJSDMNaET1p8KH97keYwTTHp2TnWKNbSbIQnY=;
        b=uYXde9oBpSonv55WbJ6v2Q4DFFXOYSctU0eFkt79nvcp9UAKVev6vga+u6VV0oRbEc
         ci2o+y8b5xJ/NlklHz7WZ+dUFMGnPXjxQ/sig4GrEWNs8vka71Y9TxgC9ECN3lnRNeMU
         6w4wZtFmR5pUJKifRdtQ1ZyOCwuAzTFeYh7X+8DO9fI0n2Vjn7T0W8ABOzk7PHDxu1gc
         cLN/bT+ExIgGyB6Q6kqxZfx/onxFidZHQ73uvqBcGJfErWxfvbeCH8p5oDQrwBU/ZZ4s
         b4Vf6ABjqLT265b5KgYaXCQ1SBdmwAimK8m/+i+9cIHdIhfwT69Skd9ZkxpNqKXsbM21
         wX/g==
X-Forwarded-Encrypted: i=1; AL+hErEy7pCTMFLv/YpFVwVH2pDnys3Mb7ueyK/AXJddZ0zdea9rXtrNTn4POW+5mrn05d10/Xncm9o4yVqiKlP0@lists.linux.dev
X-Gm-Message-State: APuU4Z/lrpHqkzuCoI+KNzR7uIG83p8lmDLWUOyH0j3Q4nZgXW6wjHIN
	f3/UsU+b1aS9ePC1eBU1fWc8DZyEsVhx+/l/mOpPCr+tIYY0iQUJZESRTtQPGfEdvHjL5hc9CJP
	Rsij4XfacW7nsdDxE+HwIseCS8EpguC8=
X-Gm-Gg: AZFdTZcUF7uxF36SSCyrHEXKJVxHsQ1jQKezzLhRAmtFLRZ9pW4DVo7aZEjhIbYeKca
	BJiOxZYsL4Ldx7FqYeldU6VekjxkZ92cO7dRgLHrw9RcPlZLq0Qv1IivQyUB2XY/ZWLsvP8rCB9
	3M77tX4++58LbScj/QscOkXebg5MtnyLp7+f7rEMxOGlQbpxlbiLssdj289yfFMfc3dvpmyo0h3
	oMS7uoGm4INQTPvvH+U60FebMQjrXLsmGWBHevmsYW9nEiqJLnG1ePPR7Ji+nFa85BBQkMqvoA7
	pDWy6l4d6xVDNvRI9T1j/DX19hGCIjYbIt1c5POyDhXFzJEY4bPb8vn3lS57BE8QwrykcgFe7/B
	0vRX20p7xkFa9ZUlBmCHsdbbv1wSJ4v1ugY9oBSiGNufgul5i/iLvruTiPFW6AX8kWSbYwZjOzU
	tsGHw1fptkZ7uZAi48JsWxnD3wVlZ+JQrB9eRdb3JTKJj5E6quv50=
X-Received: by 2002:a05:7301:259a:b0:36e:800a:71fe with SMTP id
 5a478bee46e88-3856c4b844cmr11761769eec.1.1795448207689; Mon, 23 Nov 2026
 07:36:47 -0800 (PST)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261113161819.36847-1-clamor95@gmail.com> <20261113161819.36847-3-clamor95@gmail.com>
 <20261123145520.GA2412988-robh@kernel.org>
In-Reply-To: <20261123145520.GA2412988-robh@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 23 Nov 2026 17:36:36 +0200
X-Gm-Features: Aa3M54rUDkGOVQLPkkzUTzUHY6vBcwEurritNE5bPXzc3P_S34AV-IYkX1z3J3o
Message-ID: <CAPVz0n1sOsC2N+MWEZXN3DYGBgLicS=+e-q53KjBYcJtLiWXRg@mail.gmail.com>
Subject: Re: [PATCH v1 02/10] dt-bindings: display: tegra: Remove Tegra30 fallback
To: Rob Herring <robh@kernel.org>
Cc: Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Cong Nguyen <congnt264@gmail.com>, 
	Faisal Mukhtar <mukhtarfaisal03@gmail.com>, Dan Carpenter <error27@gmail.com>, 
	Hungyu Lin <dennylin0707@gmail.com>, Hao-Qun Huang <alvinhuang0603@gmail.com>, 
	Yury Norov <ynorov@nvidia.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 23 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 16:5=
5 Rob Herring <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Fri, Nov 13, 2026 at 06:18:11PM +0200, Svyatoslav Ryhel wrote:
> > After further investigation, I have found that Tegra30 requires a sligh=
tly
> > different programming model than Tegra20, the maximum VI clock differs =
by
> > nearly a factor of two. Additionally, Tegra30 does not require the
> > APB_MISC workaround.
>
> If the clock rate is a function of the sensor or input resolution, then
> wouldn't the h/w design prevent that scenario?
>

VI clock rate depends on hardware. If wrong clock is set HW may still
work, but be unstable, which will result in unpredictable behavior.

> Does having the APB_MISC workaround make things not work?

It does work, but my main intention was fixing clocks since Tegra114
does not work properly with 450MHz. That was why I even start digging
into this. APB_MISC workaround remove for tegra30+ is more a side
benefit.

>
> It sounds like things worked or could have worked with only knowledge
> about nvidia,tegra20-vi, so I'm not sure this is really justified as it
> is an ABI change.
>
> >
> > Therefore, remove the fallback compatible and add a dedicated compatibl=
e
> > for Tegra30 VI.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml | 5 +----
> >  1 file changed, 1 insertion(+), 4 deletions(-)
