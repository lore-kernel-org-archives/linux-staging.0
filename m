Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2D01EFF9A;
	Thu, 15 May 2025 05:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747285707; cv=none; b=sWJcYAoywi8Tz87t5Z3F4aVPCnZHAI1OpfLo8LoB9GYHkEmH0Se69IEoLTz4/clAa6KcMVYo9OStYZpDh+cpVqRjuENQwxbcXwfulqtG39lZ8G6tCZi5m89448E5uf54Lnlgrw0sVX4cshs8IS0pZhAGcfjsAcZOsc544rbXhWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747285707; c=relaxed/simple;
	bh=DfKzu/2uN/ZhVEJNr+7vI8iANsRzWUhlIsxjCoy7V9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TxaXf5MLrbHIatLOwHy4Yzn161LKlwiPsgmm/ldpfKDoXt2WbrMnXU8vI324QixmclXPFIcgrugmoWCUolDvoFU/cvfFr58mEiE68/b4yuDN/wjAZ3E1kfNyC5qySFSbhRDL1y117VXSMCuoXMfgX6pGBULrVGraM4EwiClFJJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kMAT4aeR; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kMAT4aeR"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso551063b3a.2;
        Wed, 14 May 2025 22:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747285705; x=1747890505; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DfKzu/2uN/ZhVEJNr+7vI8iANsRzWUhlIsxjCoy7V9A=;
        b=kMAT4aeRxlx7NzkOmHIZR1D3CU6tOokj5/Z0uBRsadV3y4l+pJOsWCzEMsSZCBF++1
         qwzLl+VTvTGtOpHHN8QTMgR58cdYwXPk+P3xCmPdtISZfIb+4dGo4dGJPvBXzaI9lexT
         pVjd0TmfTaN9LdkQfU1DCqawiO76IQeReh2TBfr5tUFQ3S+yGkYemg8/vxOV7Xx5dgzg
         sjQA5eorrfT8ZxoUi5SHC9Ns1uF9AQWiPaSAyHPyyNBVXIVrrck/f18c+MTerPj0/Oru
         J+DKyP6z0Fel4WWutrnsP+uE48WPIwu+n73LpPsaDGYpQaUy3s4ee+FzTvGtdEDe6uxz
         shNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747285705; x=1747890505;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DfKzu/2uN/ZhVEJNr+7vI8iANsRzWUhlIsxjCoy7V9A=;
        b=lZ10DGZw2UhjO3gEzT6KmGXRmnAnsL8W5TqzxAvFnAaNdu4u51VkSSYR82FmvHBVrb
         Q0VaNWJ1KvAOV3ocsWFlpJQGnL0PGt7mkHCxQATvu9XGSvhqU0Vz2LYX1f1LHgs1zx9L
         N6cUDeqknI06rKgFFYRAvXbBBMx11V0dr5awozJpmBUrf9jhb92LTeK4iWXtCtJuN9xQ
         gSGDGc9wmal3Uz8qw1Wum5y2431sOIPmu3VHUKMIOXRU6rBz0sSILPcjDminx4UcHxF+
         iBby7XYO8eh05s31CRfTANg93VXpLkWn6RbrPE9VRaCbifOOZg/XCK0oR3YwtqWNFZZu
         tnOg==
X-Forwarded-Encrypted: i=1; AJvYcCVUkEX+vutYod62P2ErI7axTmB+mPe/adcTS5UnuBHGduQyoRgNDTp1RG/5TZDSB3J3mCgDdKnZFCyiVZHhIQ==@lists.linux.dev, AJvYcCWpyWVPN0c5cq/Y+hH4lQK8w187Lbb8wd4hlPG3/mFZvKi+KS6nOnb+45FcvXql/fdGzMmBvg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyJTaK537XGAZPRhySGlr/YRWZW9sROmWxNZTCGPG77NVKq3tAe
	Sew9LEpbALuwmkAym17cTc1MBq+kR/nqVZ+Uji5r1gk/ZgRmgNgq
X-Gm-Gg: ASbGncsgVftfdA5rvSMGoY+licftetrJ3wURLpQdbocdBmn7i+h4owvJz2XD09m9xjp
	pCMvCDvQ+SyvKrf+B2BajYzpxeAMnjd5THSw49SslKy0hSui/WITE6bKfYm7IvwVxMwBDA7kzvf
	opdUWmSPsGS10N/EYHA5kq3Lt8xCXz9di9knxpOkBTmo843xySsaceD7KxIghVZULXQgD9H/jIk
	9FQgHWizvn+K5CrRfTjfJNGgeQt7BLstkLTUjieTvW2yDGvQ+xpOXXII89KZNgIwhSyMNULywfw
	UmLIwCeWJyfxbKqp41fCv65hTE12En/dVb5R0vD/eVuv19Hw/Tm21KFrQjwNh5gRU8YwOaCBxIA
	=
X-Google-Smtp-Source: AGHT+IH+z9/gvNAIgVdBiQEFnvWLdzvjUXhJQoW/YC8WK0Cl0SXJkOGyFoyiodBt7ZVwXDHT1gBPow==
X-Received: by 2002:a05:6a20:6a20:b0:1f5:55b7:1bb4 with SMTP id adf61e73a8af0-215ff0f95efmr9042786637.11.1747285705060;
        Wed, 14 May 2025 22:08:25 -0700 (PDT)
Received: from [192.168.0.120] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e128c5a9dsm4077853a91.1.2025.05.14.22.08.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 22:08:24 -0700 (PDT)
Message-ID: <e6a5a737-ce64-4d31-aeea-2e6190da2ff5@gmail.com>
Date: Thu, 15 May 2025 13:08:19 +0800
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Subject: [RFC PATCH v2 0/8] staging: apfs: init APFS filesystem
 support
To: =?UTF-8?Q?Ernesto_A=2E_Fern=C3=A1ndez?= <ernesto.mnd.fernandez@gmail.com>
Cc: Yangtao Li <frank.li@vivo.com>, ethan@ethancedwards.com,
 asahi@lists.linux.dev, brauner@kernel.org, dan.carpenter@linaro.org,
 ernesto@corellium.com, gargaditya08@live.com, gregkh@linuxfoundation.org,
 jack@suse.cz, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev, sven@svenpeter.dev, tytso@mit.edu,
 viro@zeniv.linux.org.uk, willy@infradead.org, slava@dubeyko.com,
 glaubitz@physik.fu-berlin.de
References: <20250319-apfs-v2-0-475de2e25782@ethancedwards.com>
 <20250512101122.569476-1-frank.li@vivo.com> <20250512234024.GA19326@eaf>
 <63eb2228-dcec-40a6-ba02-b4f3a6e13809@gmail.com> <20250514201925.GA8597@eaf>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20250514201925.GA8597@eaf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Ernesto A. Fernández 於 2025/5/15 凌晨4:19 寫道:
> Hi Nick,
>
> On Tue, May 13, 2025 at 12:13:23PM +0800, Nick Chan wrote:
>> 2. When running Linux on iPhone, iPad, iPod touch, Apple TV (currently there are Apple A7-A11 SoC support in
>> upstream), resizing the main APFS volume is not feasible especially on A11 due to shenanigans with the encrypted
>> data volume. So the safe ish way to store a file system on the disk becomes a using linux-apfs-rw on a (possibly
>> fixed size) volume that only has one file and that file is used as a loopback device.
> That's very interesting. Fragmentation will be brutal after a while though.
> Unless you are patching away the copy-on-write somehow?'
On a fixed size (preallocated size == max size) volume with only a single non-sparse file on it,
copy-on-write should not happen. I believe the xART volume is also the same case with only
one non-sparse file.


[...]
> Ernesto
Nick Chan

