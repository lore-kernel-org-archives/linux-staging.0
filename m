Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5BA237180
	for <linux-staging@lists.linux.dev>; Wed, 27 Aug 2025 04:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756269153; cv=none; b=FKra44Q9TAqvo7Lt4jFAnrT06FApiihC7MqB2Q+k9oeWIV/0/RhriRtu6ggucR583akKWXm55Mu8rTKPFR31vVuuLqbzOzgt3h+Z/WtuQu5bnivVQSEMpdD+46Rjsrt2QA6Iuf8m98EdgkLjcyUfRW390zMHlIGBdA7WvDbWm58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756269153; c=relaxed/simple;
	bh=P9yK6j01vQIjUrDmFztN5hiPanzCry8mwLN54etanfw=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=HcNSWwAQMOXaF+iL7Gz9RmytdsWODmKUQoHGUifg1/dmrqmbOpPOZvTfA3VQ2yNI/l0EXlDqwXaLkgjELutswarfmOsl2XdASILIBcuCfxA7bZng9C2k03XGJTU7uM12+qteJI6APkAD1ngHiDftj+tAqSbMofPVQg0OhJP0PZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JvOZ534C; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JvOZ534C"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-61c266e81caso5608218a12.3
        for <linux-staging@lists.linux.dev>; Tue, 26 Aug 2025 21:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756269150; x=1756873950; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nPT7S7ck2OMPXfBxc+RzMc8Kxenf3tVh8lBsVSZT310=;
        b=JvOZ534CWtVbTPwkkgJo7Lb0/VRaJC8OF5XVQgjBrQoK6kzpFXT2B6Y9NehXIcmMLg
         SW0dXub0GFoVkRiumB0peVSuiffSCajf7aPvSnP9b01+3US/Fs+1rFX+C1z0HoBIGcXx
         wPOf6z38/xTnyLYVMaz/8M1L5UKx3mlSfREbZ3rgR9KNsksb5nSyxiEVfArQ3sAmMbTu
         j8264BzRKkVunSvvmNlIsPVeJFot8GVwiRD/+GB+01ar5YKOB9Cv3J7yLUTCto1odmwP
         C750eh3VKyHio2MXjcUVyiktFatcfN4eLTOqL87vIu87x/k42dDdzTgkAuRaGJsl9Z3A
         Ol/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756269150; x=1756873950;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nPT7S7ck2OMPXfBxc+RzMc8Kxenf3tVh8lBsVSZT310=;
        b=IxuumvsBvfEte3GqqENQM6xYVenFQupm3DPKjFRmClUa6GcrxpxE9FXBB/F4pWCUNa
         NUiPTiQz9nt/APZaUl+HBaP5hixeJOqeNf5cJmjRVhikH3rmgHuGXyUZxgSf2fNzhdFO
         QpXfe9gTF1oiyQS4gGNgt/+S9KZsH0uQ7WNGEjr6i4wPtIUnB9BuH8/lZEANjXIgL7Sy
         f2M/7KIbwvY3ZsUlMtj5zBc4yjxYSZr6f5Q5XJPzuOKH3uhj2yHe4pr/UhxfuK+a60Az
         bEvsK39Ff6tPRCOyrfLcn1NxEn+Tdldj8gV4NxPQ/p8WmLMMGcBmEdsnDZVRV71qZiIC
         3WWg==
X-Forwarded-Encrypted: i=1; AJvYcCUPVtO1ctbN8TfZmPnOSHGYUql1dYyXxV1PQeBL6GuDK/b7XU8YiNeZyNK16OIV/Takn/yaprF1Rmzk+F5E@lists.linux.dev
X-Gm-Message-State: AOJu0YzYbPqbUCBzQacCv9v0xINcjXuzoxLhXOLQ7vcbHvAygpQyiCgx
	l0E7YRkzfSIxSEVNPmz9UZPo6+5pmlD48zW9z5HOpI/OW76K/FtTICJb
X-Gm-Gg: ASbGncvrVXzvXbgxSEKOje7K1mqtPEIRLXf16FBMRNU1VBWheXeJggNww9/9+ml/h3k
	j5tnvigA8034kHkLVWNuvt8lii4REAbCPL25xdacLuT/JCUeICBpgpWurOsjfwIK+ZTXKCb2N85
	g6lXTby89hxKQ7LPGy5hScWRLl2aqvYUhKw98XtOWz+Vr8H/NcdOJx4/IeXxksj5lPLYiDf+27F
	PtODHSB4fSKwHDeFFUQ599tJypecgorNhQzAmpINzCBOobkHSQ5285R2DVEoIBjAa3zxgB1hEjx
	+S/g7fao3vTbquBzfAuSCE7G+RjjUSOxc5xOEGM3zn6xdcwDxPdV9gnlrLwgZp+DWL0cvVdMX+w
	yfeMWuWjiWGiDoA==
X-Google-Smtp-Source: AGHT+IF+5wxPF37wRl5q6Zpcp5YXeXsq5X1FBZFa1yIqF0zMTpeqok9u42a8ivFBmKB0sTZEfjjT5A==
X-Received: by 2002:a05:6402:13d4:b0:61c:4c77:cb8 with SMTP id 4fb4d7f45d1cf-61c4c771153mr10662557a12.15.1756269149569;
        Tue, 26 Aug 2025 21:32:29 -0700 (PDT)
Received: from [127.0.0.1] ([5.248.55.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61c78e49ca4sm4263216a12.47.2025.08.26.21.32.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 21:32:29 -0700 (PDT)
Date: Wed, 27 Aug 2025 07:32:27 +0300
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
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v1_01/19=5D_clk=3A_tegra=3A_ini?=
 =?US-ASCII?Q?t_CSUS_clock_for_Tegra20_and_Tegra30?=
User-Agent: K-9 Mail for Android
In-Reply-To: <1909286.atdPhlSkOF@senjougahara>
References: <20250819121631.84280-1-clamor95@gmail.com> <20250819121631.84280-2-clamor95@gmail.com> <1909286.atdPhlSkOF@senjougahara>
Message-ID: <76B1EB6D-B149-43C2-AA56-A15C9DCCA3AF@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



27 =D1=81=D0=B5=D1=80=D0=BF=D0=BD=D1=8F 2025=E2=80=AF=D1=80=2E 07:09:45 GM=
T+03:00, Mikko Perttunen <mperttunen@nvidia=2Ecom> =D0=BF=D0=B8=D1=88=D0=B5=
:
>On Tuesday, August 19, 2025 9:16=E2=80=AFPM Svyatoslav Ryhel wrote:
>> CSUS clock is required to be enabled on camera device configuration or
>> else camera module refuses to initiate properly=2E
>>=20
>> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail=2Ecom>
>> ---
>>  drivers/clk/tegra/clk-tegra20=2Ec | 1 +
>>  drivers/clk/tegra/clk-tegra30=2Ec | 1 +
>>  2 files changed, 2 insertions(+)
>>=20
>> diff --git a/drivers/clk/tegra/clk-tegra20=2Ec
>> b/drivers/clk/tegra/clk-tegra20=2Ec index 551ef0cf0c9a=2E=2E42f8150c611=
0 100644
>> --- a/drivers/clk/tegra/clk-tegra20=2Ec
>> +++ b/drivers/clk/tegra/clk-tegra20=2Ec
>> @@ -1043,6 +1043,7 @@ static struct tegra_clk_init_table init_table[] =
=3D {
>>  	{ TEGRA20_CLK_GR3D, TEGRA20_CLK_PLL_C, 300000000, 0 },
>>  	{ TEGRA20_CLK_VDE, TEGRA20_CLK_PLL_C, 300000000, 0 },
>>  	{ TEGRA20_CLK_PWM, TEGRA20_CLK_PLL_P, 48000000, 0 },
>> +	{ TEGRA20_CLK_CSUS, TEGRA20_CLK_CLK_MAX, 6000000, 1 },
>>  	/* must be the last entry */
>>  	{ TEGRA20_CLK_CLK_MAX, TEGRA20_CLK_CLK_MAX, 0, 0 },
>>  };
>> diff --git a/drivers/clk/tegra/clk-tegra30=2Ec
>> b/drivers/clk/tegra/clk-tegra30=2Ec index 82a8cb9545eb=2E=2E70e85e2949e=
0 100644
>> --- a/drivers/clk/tegra/clk-tegra30=2Ec
>> +++ b/drivers/clk/tegra/clk-tegra30=2Ec
>> @@ -1237,6 +1237,7 @@ static struct tegra_clk_init_table init_table[] =
=3D {
>>  	{ TEGRA30_CLK_HDA, TEGRA30_CLK_PLL_P, 102000000, 0 },
>>  	{ TEGRA30_CLK_HDA2CODEC_2X, TEGRA30_CLK_PLL_P, 48000000, 0 },
>>  	{ TEGRA30_CLK_PWM, TEGRA30_CLK_PLL_P, 48000000, 0 },
>> +	{ TEGRA30_CLK_CSUS, TEGRA30_CLK_CLK_MAX, 6000000, 1 },
>>  	/* must be the last entry */
>>  	{ TEGRA30_CLK_CLK_MAX, TEGRA30_CLK_CLK_MAX, 0, 0 },
>>  };
>
>I looked into what this clock does and it seems to be a gate for the CSUS=
 pin,=20
>which provides an output clock for camera sensors (VI MCLK)=2E Default so=
urce=20
>seems to be PLLC_OUT1=2E It would be good to note that on the commit mess=
age, as=20
>I can't find any documentation about the CSUS clock elsewhere=2E
>
>What is the 6MHz rate based on?
>

6mhz is the statistic value which I was not able to alter while testing=2E=
 I have tried 12mhz and 24mhz too but it remained 6mhz, so I left it 6mhz=
=2E

>Since this seems to be a clock consumed by the sensor, it seems to me tha=
t=20
>rather than making it always on, we could point to it in the sensor's dev=
ice=20
>tree entry=2E
>

Sensor device tree uses vi_sensor as clocks source and sensor drivers don'=
t support multiple linked clocks=2E

>Cheers,
>Mikko
>
>
>
