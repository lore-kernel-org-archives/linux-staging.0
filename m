Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B6825557
	for <linux-staging@lists.linux.dev>; Wed, 27 Aug 2025 04:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756270055; cv=none; b=oUqQrEX7M9CMpAd3t5TX1vhKtMysQ3Iw+dq8ABFK98PwuIBHv6Bl3NJXD8EfqXCtjTCEiehkSW3UvokS6dkKfAb/LjqkiWujob7FXCQgFNowVreCI+snhDK8eQYSTKLq7TPFADx0g4W2MNKj2278vQtH2XesTTujMevJawlktdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756270055; c=relaxed/simple;
	bh=FH79sR3wwQwKOwJz4iMC16W4fPbO9VVTpyHth1+ZjzM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=eUJVBN4phxCxKVtxej6wsNLEVtTyR965TmefXXIQhQM2hLvSZcLDQB9PzUbDVZ9XZgil+0araU2EuoyA0auPJHbmaSPlFU2AXjMn8v0xKKODWv1hED4bh0cjJIERSo1v1O4zM5rZBJbLRGXhdAFAyHufuyNIQYkhO2q1sojfiOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PqRIKEHN; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PqRIKEHN"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-61c325a4d18so6873289a12.0
        for <linux-staging@lists.linux.dev>; Tue, 26 Aug 2025 21:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756270052; x=1756874852; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8TCMaff2/OOBuiGXhxSyW4vUb1EhEINJOzc43HDpiqA=;
        b=PqRIKEHNoWZru0FBC+jcszr9xAo3K0p85/CNbnn2vWdtE1/Bp0ok8ec18KjotX7vpU
         JieGycfQTxrtlqufGVbaWEi2TJuenwfdcYQkCpff7x7usmBf3roA7MGEihToTyC9N6k2
         O5j+Qe514kGvkofSkN3ezJhSCCPSAvzx9AWHNKhxwBuQ3j0hXtOMbGQwnr3qryxRutBZ
         TF5jWbcVUaPdWMFw8Ct8gjGvrTTPTToQtoFh1JOx+f1vMqOyqB+Xjkx5grDUCmy0bIcH
         fVGZsVQesoT8/BMI+f46uL0C3R8JlTlVLPYA+Zs7E/uR6Tf+90ABHMifdu0hW6d7C4MG
         8yvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756270052; x=1756874852;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8TCMaff2/OOBuiGXhxSyW4vUb1EhEINJOzc43HDpiqA=;
        b=Sfib+PV+slPlDSeMJHHpshnLIp0WtDlVjXRB+Mss2I7A/c/9LqgIE1Ut9kjf0juTzt
         M39+MIldNK3Itq4PkWZNekked4Iopp6YM+w9GtGWbmVR4PtdIteHRAwjUF4K0tJvaOOl
         WwCQcWvhu7NZaAxTy6ySCnydoOck5RY4tGcuRCv+bYx+J1Kwabkq0BZsl1IfoJuaV4g5
         W0BERa3W6sdxvL8I4z2Q7oIanVS/AiaItzWxnAmRX6+nSo44neXa6bZU+ajZkvmkoFvD
         bUy6fqhqtAo2Ubm1tdsPPkdvtLbxY6W9YqFu7L0x4FzLsr6Ng369XJ2cWzbZ/pECDsFF
         45og==
X-Forwarded-Encrypted: i=1; AJvYcCXVHjBDQZZ3jwsmejetDhXAyeHFhjkDJI0pv7pt57lAPdZqunEMkLmMpiSBk1qgYHk64oxckAihNkpjRrbg@lists.linux.dev
X-Gm-Message-State: AOJu0YysScj8F0fhCLPpb57HrmAVG2W1GzN2ikU+rUItFZGNaZK5Ociu
	9qeQRwmM4rlb2KgPQEYMXZLvdsFNUquCYsGX1o64nAnSXpfxnbCqHgyF
X-Gm-Gg: ASbGncsAqIMXi/xLBmy4viatPkAm2L/IaqFReiJ/tDL0lfIO+GlwfKVLWsU1Jk88PLm
	aHt8oWLW+ewDjti78y4jbX5LZTN62vl7IxuTIvx75hvZuZiaqFMSLA4TU37ZfiWkf/IIyHtfeFN
	ZDSQdwRM3/LLWOjf+rgiXVB6OVoN/fCVBfEn0ZLShA+YLfT4JiAkh9tE1Jh0S0AMYnlrKv0QjyV
	FIr2aJcWhcMqXgJG722itaGBSMacYy/tEaZO3BVFUCtEUTpKQ9e14eVjTWu9WQ2oirShcJi4Bz/
	TICxemrU7vjlms8gQbZSO9uZEW/8bF5YY5o837GM8QiR9mxzlYYLMMQaNXPe0aDYcqVorJT6g5e
	5U2SZ5XaOuiNqovlZl2znsw1j
X-Google-Smtp-Source: AGHT+IG9JdOvxAI0JpZC7UN53cppIId0lE2cbYaF9wAYpBd5bYrwqo7A7y/TJvWUTacmrbOk5BBATg==
X-Received: by 2002:a05:6402:44d2:b0:618:fe3:f4c with SMTP id 4fb4d7f45d1cf-61c1b6f1fbemr12637501a12.29.1756270051831;
        Tue, 26 Aug 2025 21:47:31 -0700 (PDT)
Received: from [127.0.0.1] ([5.248.55.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61c90ffd677sm2710258a12.46.2025.08.26.21.47.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 21:47:31 -0700 (PDT)
Date: Wed, 27 Aug 2025 07:47:29 +0300
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
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v1_05/19=5D_staging=3A_media=3A_tegra-?=
 =?US-ASCII?Q?video=3A_expand_VI_and_VIP_support_to_Tegra30?=
User-Agent: K-9 Mail for Android
In-Reply-To: <2271797.NgBsaNRSFp@senjougahara>
References: <20250819121631.84280-1-clamor95@gmail.com> <20250819121631.84280-6-clamor95@gmail.com> <2271797.NgBsaNRSFp@senjougahara>
Message-ID: <4BD9010B-3F5B-4EE3-B57C-A20DFAEC5276@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



27 =D1=81=D0=B5=D1=80=D0=BF=D0=BD=D1=8F 2025=E2=80=AF=D1=80=2E 07:29:40 GM=
T+03:00, Mikko Perttunen <mperttunen@nvidia=2Ecom> =D0=BF=D0=B8=D1=88=D0=B5=
:
>On Tuesday, August 19, 2025 9:16=E2=80=AFPM Svyatoslav Ryhel wrote:
>> Exisitng VI and VIP implementation for Tegra20 is fully compatible with
>> Tegra30=2E
>>=20
>> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail=2Ecom>
>> ---
>>  drivers/staging/media/tegra-video/Makefile | 1 +
>>  drivers/staging/media/tegra-video/vi=2Ec     | 3 +++
>>  drivers/staging/media/tegra-video/vi=2Eh     | 2 +-
>>  drivers/staging/media/tegra-video/video=2Ec  | 4 ++++
>>  drivers/staging/media/tegra-video/vip=2Ec    | 5 ++++-
>>  5 files changed, 13 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/drivers/staging/media/tegra-video/Makefile
>> b/drivers/staging/media/tegra-video/Makefile index
>> 6c7552e05109=2E=2E96380b5dbd8b 100644
>> --- a/drivers/staging/media/tegra-video/Makefile
>> +++ b/drivers/staging/media/tegra-video/Makefile
>> @@ -6,5 +6,6 @@ tegra-video-objs :=3D \
>>  		csi=2Eo
>>=20
>>  tegra-video-$(CONFIG_ARCH_TEGRA_2x_SOC)  +=3D tegra20=2Eo
>> +tegra-video-$(CONFIG_ARCH_TEGRA_3x_SOC)  +=3D tegra20=2Eo
>>  tegra-video-$(CONFIG_ARCH_TEGRA_210_SOC) +=3D tegra210=2Eo
>>  obj-$(CONFIG_VIDEO_TEGRA) +=3D tegra-video=2Eo
>> diff --git a/drivers/staging/media/tegra-video/vi=2Ec
>> b/drivers/staging/media/tegra-video/vi=2Ec index c9276ff76157=2E=2E71be=
205cacb5
>> 100644
>> --- a/drivers/staging/media/tegra-video/vi=2Ec
>> +++ b/drivers/staging/media/tegra-video/vi=2Ec
>> @@ -1959,6 +1959,9 @@ static const struct of_device_id
>> tegra_vi_of_id_table[] =3D { #if defined(CONFIG_ARCH_TEGRA_2x_SOC)
>>  	{ =2Ecompatible =3D "nvidia,tegra20-vi",  =2Edata =3D &tegra20_vi_soc=
 },
>>  #endif
>> +#if defined(CONFIG_ARCH_TEGRA_3x_SOC)
>> +	{ =2Ecompatible =3D "nvidia,tegra30-vi",  =2Edata =3D &tegra20_vi_soc=
 },
>> +#endif
>>  #if defined(CONFIG_ARCH_TEGRA_210_SOC)
>>  	{ =2Ecompatible =3D "nvidia,tegra210-vi", =2Edata =3D &tegra210_vi_so=
c },
>>  #endif
>> diff --git a/drivers/staging/media/tegra-video/vi=2Eh
>> b/drivers/staging/media/tegra-video/vi=2Eh index 1e6a5caa7082=2E=2Ecac0=
c0d0e225
>> 100644
>> --- a/drivers/staging/media/tegra-video/vi=2Eh
>> +++ b/drivers/staging/media/tegra-video/vi=2Eh
>> @@ -296,7 +296,7 @@ struct tegra_video_format {
>>  	u32 fourcc;
>>  };
>>=20
>> -#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
>> +#if defined(CONFIG_ARCH_TEGRA_2x_SOC) || defined(CONFIG_ARCH_TEGRA_3x_=
SOC)
>>  extern const struct tegra_vi_soc tegra20_vi_soc;
>>  #endif
>>  #if defined(CONFIG_ARCH_TEGRA_210_SOC)
>> diff --git a/drivers/staging/media/tegra-video/video=2Ec
>> b/drivers/staging/media/tegra-video/video=2Ec index
>> 074ad0dc56ca=2E=2Ea25885f93cd7 100644
>> --- a/drivers/staging/media/tegra-video/video=2Ec
>> +++ b/drivers/staging/media/tegra-video/video=2Ec
>> @@ -127,6 +127,10 @@ static const struct of_device_id host1x_video_subd=
evs[]
>> =3D { { =2Ecompatible =3D "nvidia,tegra20-vip", },
>>  	{ =2Ecompatible =3D "nvidia,tegra20-vi", },
>>  #endif
>> +#if defined(CONFIG_ARCH_TEGRA_3x_SOC)
>> +	{ =2Ecompatible =3D "nvidia,tegra30-vip", },
>> +	{ =2Ecompatible =3D "nvidia,tegra30-vi", },
>> +#endif
>>  #if defined(CONFIG_ARCH_TEGRA_210_SOC)
>>  	{ =2Ecompatible =3D "nvidia,tegra210-csi", },
>>  	{ =2Ecompatible =3D "nvidia,tegra210-vi", },
>> diff --git a/drivers/staging/media/tegra-video/vip=2Ec
>> b/drivers/staging/media/tegra-video/vip=2Ec index 5ec717f3afd5=2E=2E00e=
08a9971d5
>> 100644
>> --- a/drivers/staging/media/tegra-video/vip=2Ec
>> +++ b/drivers/staging/media/tegra-video/vip=2Ec
>> @@ -263,13 +263,16 @@ static void tegra_vip_remove(struct platform_devi=
ce
>> *pdev) pm_runtime_disable(&pdev->dev);
>>  }
>>=20
>> -#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
>> +#if defined(CONFIG_ARCH_TEGRA_2x_SOC) || defined(CONFIG_ARCH_TEGRA_3x_=
SOC)
>>  extern const struct tegra_vip_soc tegra20_vip_soc;
>>  #endif
>>=20
>>  static const struct of_device_id tegra_vip_of_id_table[] =3D {
>>  #if defined(CONFIG_ARCH_TEGRA_2x_SOC)
>>  	{ =2Ecompatible =3D "nvidia,tegra20-vip", =2Edata =3D &tegra20_vip_so=
c },
>> +#endif
>> +#if defined(CONFIG_ARCH_TEGRA_3x_SOC)
>> +	{ =2Ecompatible =3D "nvidia,tegra30-vip", =2Edata =3D &tegra20_vip_so=
c },
>>  #endif
>>  	{ }
>>  };
>
>If tegra30-vip is compatible with tegra20-vip, we don't need to add the=
=20
>compatible string into the driver=2E Just mark it as 'compatible =3D=20
>"nvidia,tegra30-vip", "nvidia,tegra20-vip";' in the device tree (and as R=
ob=20
>alluded, have this compat string pair as an option in the device tree sch=
ema)=2E
>

While I am fine with using fallback but it may be a good idea to have a se=
parate compatible so in case tegra30 would need a specific set of ops (tegr=
a20 and tegra30 VIs are not exact match) no additional changes into schema =
would be required=2E

>Cheers,
>Mikko
>
>
>
