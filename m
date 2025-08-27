Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E201C26C3BF
	for <linux-staging@lists.linux.dev>; Wed, 27 Aug 2025 04:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756268911; cv=none; b=hDoudMcYvGtkdvfjLuoM7OuM6O2WhYWLo9KjXsHyuNRv2deD4zibTMWXKwG20AzbJanVyOCxU1c/M1pzYzj8QNsqbzfi5a/U9l1i+DzyU7OJ4NyAC5QQUYe//eSxTckKfOTGeJ3DsbOAi1HZ6sMiReVZVWWnHjyGyYlGaIAPSOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756268911; c=relaxed/simple;
	bh=/X4cG8A8n780jxD0ghQ5x/C/JrFopH/89LH/Zgv8NPo=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=tC5TowaHA+BF9+FZtGDbZs1bFMdGTkXQA+7Vs49AI8pPMgrSvD6sOQ5ihFcpCw9aRWvsJdYBZ0VzrZvVgyzM8AZu0q0wf59lzJDHlSNVhS4/flblpAoVYLl/j76saXQtewqS97sjW8sfHv/Utlps4FOJVaVGOkKU74Jeczn408o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iq6Nd1eq; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iq6Nd1eq"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-afe84202bb6so348447266b.2
        for <linux-staging@lists.linux.dev>; Tue, 26 Aug 2025 21:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756268908; x=1756873708; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8PzH67qVhc1HJfhL/IUyEczDHRosqco9gYe1CLUj17w=;
        b=iq6Nd1eqLLtax1KpPXp56zNZRQNsoh4DsS5rwQc2eX/D/wVCC3K2fHi4Bu6pdqx2BW
         tAx8k7yu07VDxzY5LswrSv5j0PcP6Qr5gBNIIz8SnpPRGIzsKolJ8lWJb9606XK1GCHY
         8pqoOxV1fbiZQpTA+zM/FHF/vLZlyEH37dYj9eDyEieubAcknZ6PCU3WyNTNq8GlSN59
         YYJ6lxdGSgQiM7mrfuutXvUg1TfitMo7v7FYdZ4r4+orXnXInCy6OWGy1PJndq8PTkcU
         jvb5DemA/J/Bjix9Zjnbp6lfXAg0ZM+Lm7h67FXUvR6I7Yjx3vTt1XFlBB5GjLGBPVuP
         RwsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756268908; x=1756873708;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8PzH67qVhc1HJfhL/IUyEczDHRosqco9gYe1CLUj17w=;
        b=bilfXFtJ9Y3GLJltcqYhtCWU2ytDxnDTP5kYhh/yCp9m4SYPlc/9TKLpx/rn/kEqlF
         HKQ40kZDK8rRpPll2soTEr0z8InurcVTi7BdkLFxloMqvDnnQdtkp/frTvYdU4EJWQgt
         fRS4jf/cBO3Tsgdw0rYs+OQn3gqBVca2jXrCw5brdRWRdqnEVI3cOV4WfpxzC338D6xc
         q9yg4fzsZuP7lpT0pCcceqVyQKmvBiiZB5mO++2YbCLNWV4CEvxhsSyroygEeiGsfzIX
         9IrEXB+Nl+KUufVBS7721M3Ou+m2Q2pKthbnLneSIUi5anYlcyEalbMUcmo3FB5jzDwm
         kAgw==
X-Forwarded-Encrypted: i=1; AJvYcCX7S3hRupqXdOqDW8aRIIgjUUWaz0whKL3gQf2A89TiLU/6x4bYx2ZPpjwbjjaaPFKuiu5zT+t3B6K3PmCk@lists.linux.dev
X-Gm-Message-State: AOJu0Yym750vfBkJTzgJdmrsh1HP0uIIhBvyoz3kdRxzxvSTaaGWziHI
	uN7n3LX+0JxDsS/hg/qL1in1Vx8pI0rkuTgxef41n/mlj8mSaAo5DZe6
X-Gm-Gg: ASbGncuBHjqSIQtjhsXlu7+sSGS+nblAv4q1zj7CR4ER1Nb8bM5yTJmP4aCIx+O9nRD
	48WE8nIdMJ4TgzWvf8Gkriz7S1CNdaynJtGGw2gCQWoceJjglmNn6GoPRHTs8vC1ghiarjpw7/K
	AV8W8cZZmYU2lX3oK2leAUsR9JLhENpHHsRr4eu5I3BopYKEyEt/2MM5JF6NrZ3hAauQav88NQ9
	cnr/OLv3NtIb5pQPgOuEHvW7qDqIiEEaesruL/P9kdpnH+7ewi/N2gcn/mA14gCs8TpVsUYjFh1
	U1btjQOzNZ+rGxPWLSbZps5hC7wxUYdVwBfOOHNoTQbyef8FABIQ/bIlOsfue26uURTRLCc79P8
	M9gGrptzHKu5q8X7vZByUVDP0D0TEc3xf1wc=
X-Google-Smtp-Source: AGHT+IExRye3++0RibNpkbuBt9GdpOdlAkhvl85P7LOJTrQQyRm+u65q2iKB4iA790zlmhnpjTVnfg==
X-Received: by 2002:a17:907:3f29:b0:af9:a4de:f092 with SMTP id a640c23a62f3a-afe294c768emr1670874966b.55.1756268907959;
        Tue, 26 Aug 2025 21:28:27 -0700 (PDT)
Received: from [127.0.0.1] ([5.248.55.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afec096c7a0sm88309266b.43.2025.08.26.21.28.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 21:28:27 -0700 (PDT)
Date: Wed, 27 Aug 2025 07:28:26 +0300
From: Svyatoslav <clamor95@gmail.com>
To: Mikko Perttunen <mperttunen@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>
CC: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v1_02/19=5D_dt-bindings=3A_cloc?=
 =?US-ASCII?Q?k=3A_tegra20=3A_Add_IDs_for_CSI_PAD_clocks?=
User-Agent: K-9 Mail for Android
In-Reply-To: <2451218.NG923GbCHz@senjougahara>
References: <20250819121631.84280-1-clamor95@gmail.com> <20250819121631.84280-3-clamor95@gmail.com> <2451218.NG923GbCHz@senjougahara>
Message-ID: <268A6593-1FAC-4A4D-925A-801FB6FEE9F6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



27 =D1=81=D0=B5=D1=80=D0=BF=D0=BD=D1=8F 2025=E2=80=AF=D1=80=2E 07:19:39 GM=
T+03:00, Mikko Perttunen <mperttunen@nvidia=2Ecom> =D0=BF=D0=B8=D1=88=D0=B5=
:
>On Tuesday, August 19, 2025 9:16=E2=80=AFPM Svyatoslav Ryhel wrote:
>> Tegra30 has CSI PAD clock enable bits embedded into PLLD/PLLD2 register=
s=2E
>> Add ids for these clocks=2E
>>=20
>> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail=2Ecom>
>> ---
>>  include/dt-bindings/clock/tegra30-car=2Eh | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/include/dt-bindings/clock/tegra30-car=2Eh
>> b/include/dt-bindings/clock/tegra30-car=2Eh index f193663e6f28=2E=2E14b=
83e90a0fc
>> 100644
>> --- a/include/dt-bindings/clock/tegra30-car=2Eh
>> +++ b/include/dt-bindings/clock/tegra30-car=2Eh
>> @@ -271,6 +271,8 @@
>>  #define TEGRA30_CLK_AUDIO3_MUX 306
>>  #define TEGRA30_CLK_AUDIO4_MUX 307
>>  #define TEGRA30_CLK_SPDIF_MUX 308
>> -#define TEGRA30_CLK_CLK_MAX 309
>> +#define TEGRA30_CLK_CSIA_PAD 309
>> +#define TEGRA30_CLK_CSIB_PAD 310
>> +#define TEGRA30_CLK_CLK_MAX 311
>>=20
>>  #endif	/* _DT_BINDINGS_CLOCK_TEGRA30_CAR_H */
>
>The commit message refers to tegra20, but contents are tegra30=2E
>

My, bad, it should be tegra30

>Regarding the CLK_MAX define, I agree that it would be better to get rid =
of=20
>it=2E Perhaps you can check if it would be reasonable to calculate it=20
>dynamically in the driver, but a define and sanity check in the driver wo=
uld=20
>work too, I think=2E
>

It is not unreasonable, but moving this elsewhere may cause issues with ad=
ding new clocks=2E Addind new clocks would require updating not only header=
 but also a place where max clocks are moved to and ai am not sure how can =
I dinamically calculate amount of clocks in the driver without updating bot=
h header and driver with each new clock added=2E Maybe you can propose a me=
thod?

>Cheers,
>Mikko
>
>
