Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB45338F25
	for <linux-staging@lists.linux.dev>; Fri, 14 Nov 2025 14:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763131937; cv=none; b=FvzjBpIanyXIFfiTFZSFq5KRJSnftJR6MjA1ToUIAP3lgV2rlylJgn9OiupgSTZdyaS/BGniXC176iTK22Go4Ys/E7wo+wkC5cZHBq9xbIPrWrxXfTt7Un/r1iPuDGGYSa6UdR+0d9dLYlN8h0TYz6lQXVi2D9ZQv3t5jyLb2Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763131937; c=relaxed/simple;
	bh=z+RzTRp5r8OzCOGGuAh/YrjdDUCoh1Vi3Uu3Kf9nFqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rKYsFyUcBbaJiijPEoBRwEMb3QFgTohYrhihRyzQPX1TNxdBFW65IKFzwNb6xzCJS5LGiVXPghOngGXXAZnAnQLMO063BsCAOpaRJku+jPsUvRJj/mxR3FY4TcCkyCfycn5wr9xv8USIJEDRsIQ1MI/u+cS04cPW6SLb0F1y97E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N+1PPTFO; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N+1PPTFO"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-477632cc932so10174915e9.3
        for <linux-staging@lists.linux.dev>; Fri, 14 Nov 2025 06:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763131934; x=1763736734; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5E8Gdb2sthQ98VUv6X44UK4wYs+INDyJZkDCznTeVWQ=;
        b=N+1PPTFOYYzLLZwTjvPh/Ui+zqFd2m9LM1MSp/7kmM54S6y4Hr3RWHdSvoCQ9mv2js
         2dWOj5lKuH/xfHaaEsfcrffKHYXo4gncguehvt0sdx8MmGrlHudSwLGy8gUAlPcO1Lz+
         vraF9QWerftihsC8szPYV8Ddw54LXJo9a9TbiOl1JhBrX1ruAceaWIQez654Rv2XNNjB
         vS5Eeu8GuM+dvkdZ6j8xxeBKP/q2eEBrA9a4VZbqpljx9ARxn/3UCJCcfWyVjn0/2mmi
         s1fEeGwR2zxImptt0O112+DT7tY9LFdvQP4jjR9l2ZQ7DhTyDnUbADp99Cu5GJJ30dcY
         wE8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763131934; x=1763736734;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5E8Gdb2sthQ98VUv6X44UK4wYs+INDyJZkDCznTeVWQ=;
        b=nw/L6KIWAUhTjBBVarEJLlnK4m8trK5ZmZvyvW2BXPql0/l0njClVjZXfVVwaLnhRB
         9d/j/VC2lvTuJUoSFNIHOypqIB5yH/LUJbDK/FA4/hcyO0JqISIb2ocgOa5OmA4Xauz+
         5qhlghzJfDphhxo7v8YuYjP8RH51zDBeXuPyKQnwr5WnifWSp04TIiL/27mPnBIBismV
         M/nxozl6ygD5vegJ9TD5FNQtszdQs8SS5sJD+duqQH20PoSsQJ3kR3sgG6YFnJ58Ic1p
         31rIbnAmJlkK+LIrLRhS8ZawOg8KM37oD1uNBZ/gIQwo/KST832Qq+UQuOdWjLeAjmaE
         /ITA==
X-Forwarded-Encrypted: i=1; AJvYcCWu4WQl3oxyeo9ChvCXU6AT9YdkzxX6ADiwmJV4BpLz1Yz4NH1LBm56E/wn6+wg5ewRMF+hjjCDpYSxlaK7@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1S5egYygV1E4KX6wRgTC54Z8YAsROsg2lU3auqYfZxzDKgejR
	8qf31LRJ/h+X34GM31RSvOR2ZV3PY/A1oh6Lf9aaokFi5VXJsEgFvxaR
X-Gm-Gg: ASbGncvciE0cBFs/Sv0sRiiHM2vvMxIkOrOytY2IIFAlYjwAaxnQcc3gcgXCwZo+cfG
	sZfl8CkHCpf2M+jFbZxbqwPv+g3swiLnQam98L6a8rrSFtov/7Thl8I8p76WWUP9P73vWULG0v1
	/LKIuQP9pzQqlptyrUiUsYZmXUxPLbum3S0Z9IiN8/LBFmAO5nqoc3yo/hWdvxr7CNA6LfRxg1t
	kvK1Ok+DCrP/QTZACGSfGwFY3t5u2/fFBaiH+MMUHzPnuA8mnRI0Lo8iTaV4AauPL9Snsx5H0fu
	1SAoz7CO1eBpsEEroeBr/+Jft2bMd5wPeT/OhgIJVXmeH4ZctQwOodKAikaaRYSaMjtk0LvSFHI
	W29y9RLLyfw6u4PFzFttuJAyLn+t1NIEwQ7096U3h1HWpBHL+tfvM9H/gMI+3xang/VQt4CJJCM
	RyeU+YGwGVAfo7UUwWi341MdRsn/j22Oo19ZiYDvB4AJzl1aG4WBfkinfv+pvdpXc=
X-Google-Smtp-Source: AGHT+IH6EdaXd2gX/Js68QxagND6wDOIWhXEebCdhFFsFPTeLjXVAI/EuqIEEN3kSXnIM4e9UFmSXg==
X-Received: by 2002:a05:600c:1387:b0:45b:47e1:ef6d with SMTP id 5b1f17b1804b1-4778feb2507mr33143185e9.36.1763131933899;
        Fri, 14 Nov 2025 06:52:13 -0800 (PST)
Received: from orome (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e7b14bsm9992753f8f.9.2025.11.14.06.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 06:52:12 -0800 (PST)
Date: Fri, 14 Nov 2025 15:52:10 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonas =?utf-8?B?U2Nod8O2YmVs?= <jonasschwoebel@yahoo.de>, 
	Dmitry Osipenko <digetx@gmail.com>, Charan Pedumuru <charan.pedumuru@gmail.com>, 
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, Aaron Kling <webgeek1234@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v5 13/23] arm64: tegra: move avdd-dsi-csi-supply into CSI
 node
Message-ID: <hk2rs7o4lsxh6uofaro4tsjbdandaq4txpsdx6ggx2zgtjpuxa@zdz66zl7as62>
References: <20251022142051.70400-1-clamor95@gmail.com>
 <20251022142051.70400-14-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bwlwwn5ocbycp5js"
Content-Disposition: inline
In-Reply-To: <20251022142051.70400-14-clamor95@gmail.com>


--bwlwwn5ocbycp5js
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 13/23] arm64: tegra: move avdd-dsi-csi-supply into CSI
 node
MIME-Version: 1.0

On Wed, Oct 22, 2025 at 05:20:41PM +0300, Svyatoslav Ryhel wrote:
> avdd-dsi-csi-supply belongs in CSI node, not VI.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     | 4 ++--
>  arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

This looks completely independent from the rest, so I've applied this.

Thanks,
Thierry

--bwlwwn5ocbycp5js
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkXQhoACgkQ3SOs138+
s6GyTxAAlZCHN0/OeOSiVj5R+zlyhttYKy2tPfEzQFAFYVDR7MVrwxLczkHyQzR8
YJdAuuU48wLJ5R/PTldehaf8j+inFtyg5r2WZr1rzfK5Wgj1Ont+RDwb1ohoTLto
6bSXG8Tr8AXEyaL6fycm5fcxWo1GemuiV6oxpaiUtS+I/HUbcJPhe1RuNwYpsubF
P9KGdbbv8XMeaem7fM8j0VLUwObdN1mQBTvI1Wh2Krf7CpevtMRVZf/TCB3d8aI5
HGBTW+TiCBIyGfBTnzV4OjZaKrcVvgzE2lHPkAbu/ZBZNz0dFGkSs3xduMhtg/kg
uPxJz0CQBAkTybL2Sa4k8NapAYg+bhyUj7clt0rqcA79W4BABHdF4ihlVvkrPzJz
p9UQCNPvsh+EnayF5E1AYEWDfnIswAYmUoTqGmZmWz9HLE1pn/TUrPVEXfilfccK
ehav4axp746hfEhvfPg/PXOcJQxIhRbJ6goACP4XB0Jvz/67JUKPS7vybcYa2Ggd
NvBgBnkhHSdbAvENYMdosj1lt4DWUTm2boVCA2GY44NauAI70vJO1bQSfNACQbpK
p/Hk7iF9V7yoDcPeJWh0flowHetdtjJylnQVV53S2V37goFuwovw7b13bsvInLHw
pYq7VeF3eirNU4QbWOCiLFoJ9vftiP4vTbtWR1PbVb3WSbyIEsY=
=vU35
-----END PGP SIGNATURE-----

--bwlwwn5ocbycp5js--
