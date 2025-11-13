Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8F22BEC55
	for <linux-staging@lists.linux.dev>; Thu, 13 Nov 2025 08:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763022075; cv=none; b=Adu4c3z3BFeEht6C8dy0cSFKPVww7dYqA6yuxADjk2UQ2mxVMVdooJIEoDLZHczuaQT1SpS/5m8WVBmy9781IQakV2BTX/n0UotRTHHpuQn2XLU5Hs/w/8/gNLAEe6akQNGbYZzpwl4nVs0tJ3g0cF0zb3jBXWDneUIRLeVEqXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763022075; c=relaxed/simple;
	bh=L7rrq4WiKIi6GSN+aCQUJaSUVAJ38fs+p26mjrNBcqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UUL7WrAGDd+keTVe5dyURaR2vvQWLwqpUOTXhFZS3pGU0UdjBVaXe9R9hTgYng0/2StopZNVAAwNPjQjGH6RJ/3SVdQUAfk4z/wL1lMWmm5nhoLPwu75BLKyOMgeTlSZrMPK8DH9Z/o9cbWeJNnZvgAHDp5AscFBz8c3NveaqNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NxMGAm5i; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NxMGAm5i"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7afc154e411so309844b3a.1
        for <linux-staging@lists.linux.dev>; Thu, 13 Nov 2025 00:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763022074; x=1763626874; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L7rrq4WiKIi6GSN+aCQUJaSUVAJ38fs+p26mjrNBcqA=;
        b=NxMGAm5iNK9wiJ5Uyp8hicI24li+q9/mtq+oFYI5f6GncBAg+1zGsuwNM/AHwH7rAj
         DcsfsxeCTcd+bXBu9b8jXsr1mHWkdLwQNjP/iKsIrOf/OCtj0+wiDBGqKA2PMFqBdO2j
         y2C0bXzPB0Vh2tGioz2u8LJ00/48xZ8gq8XCJayHNmrblgQ0yA2tNcgq9PQVVa66q7nM
         jk7AnL8jChrT3q1r8frYzXUoX3rHarx0cEkhld9o7CGGbUe+pU0cDKgvxR1PSqDz+COx
         4wy+Ox3vfYs62mjcMEA3T0/Hs/HizulmxhMqF25cD1PZMcjk75Qxj+clifJN01EkXTy9
         dhSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763022074; x=1763626874;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L7rrq4WiKIi6GSN+aCQUJaSUVAJ38fs+p26mjrNBcqA=;
        b=COBQ/eLMXRPUOnOz1MzSRRrm6w4XNDl22zjgGn2RWQKbbBMdPE0Q7kwXGg1EbCXOGM
         iwbak+w2q1JWpPSGWdigl7Hl38UXe/N4pRw0eR1OzXLGNyQds2kGxR7GWssjscTEE8ns
         5GsBbj9Y5yKTBAakpg41TLTNhB2otoYPkwH1abAPI4HS1oLZjkKFUbm3YAqXJjDhc3qI
         wFxwA4wUO9K8F4SAKz5hcFE9xX3oNIMpWgnyNOaloy3u1wSPVeMRJiA4P+TieXZO5w0f
         htkye8vVtdcjJrXCTUhBgA/AbKJOUtqMLNVWfi/+m5gOAnPVGQZZxkeItT1ySvuBjGpN
         UUSw==
X-Forwarded-Encrypted: i=1; AJvYcCXcFrOY15823ekM/GeuaKt1BiPUrWfm9MIIY7NMINtPVtMXcKwweRocFoEkEBV+uwrjjaI48yvb+NveHsCr@lists.linux.dev
X-Gm-Message-State: AOJu0YzIP9JgyGpK54KadyvekT4pHB8NQ8CVr0fNj5BiPErrsFN1I+7c
	HwMhLacQPIdK2U5tGzwv3mvM2KzXpMa1y6tDWLfFUNhIglQ/eoMddN+Y
X-Gm-Gg: ASbGncuCOv9pp7Df2Lz0shVrd4J8lFgt8wOhlKXkiahdgTqiXBCPRlR0sLMlonihaiq
	h19yV8Cz5QULwmz68XUPAbm9zVcdCT/qnuoyoerXksxdfHENJaKtS5JL0eAf4lApVzy1BUOmxYU
	tzz4EpoMiDA79eaAozMe81Mp33ycmhnQCSaDj+LckAondpzNJpkSJPDFv3a8hWNzhpvjrgiBbQa
	77ccOmpVFRcSiP4SDQPOhqbCIMnB7WKN4W808V3IhYZAPR6kn54t+oIJgxPe3RW/hWzAKy7v6Vn
	uGBIr6C9jUOjM0sVqSXXJLqIn9O2guled9JV4n00TIiMKXIUQKCUta25oWLFNTptLkhGxwnKYdJ
	hZ5Gw+rUJhE56vG/JKVHTQAXt1xzpWfWJ0+2dC2WnyRZlUxIPlnOziQ1UZxNbmPeuFghe03CoER
	1vYcc=
X-Google-Smtp-Source: AGHT+IFysTHUjNEuPh00MCrJEYLnKEdmVnsQMMpHldxJQNuHD1tNj4Av6uMadzQrVRooBE7mHyl74w==
X-Received: by 2002:a05:6a00:4d03:b0:7b9:a27:3516 with SMTP id d2e1a72fcca58-7b90a2738a5mr1716653b3a.21.1763022073646;
        Thu, 13 Nov 2025 00:21:13 -0800 (PST)
Received: from essd ([103.158.43.16])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b927c230aesm1431467b3a.68.2025.11.13.00.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 00:21:13 -0800 (PST)
Date: Thu, 13 Nov 2025 13:51:07 +0530
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jianglei Nie <niejianglei2021@163.com>
Subject: Re: [PATCH v2 1/1] staging: fbtft: core: fix potential memory leak
 in fbtft_probe_common()
Message-ID: <zvkfqrnqwksg5otoy2wzfx2xtmcyyk2fgottnqkkwm6q2uxdam@2fthfckoffov>
References: <20251112192235.2088654-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112192235.2088654-1-andriy.shevchenko@linux.intel.com>

Looks good to me.
Acked-by: Abdun Nihaal <abdun.nihaal@gmail.com>
