Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20FA3EE1C0
	for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 21:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773179554; cv=none; b=F5maDjz3Bme9gRvLA+z8vm/mfq+QOzUmo2GmGTQuDHD9Rt/KDf7o0poTLi/Pm6tL3SpoFQQUiJh2ynNLxRkyBGhuHK40SxHUp2/81oxy+ZvT6pgEYsYO26axPVsAOYESHbCn+ux1MipvdsbOxinTAMpzPZR9K0hsrPSIiTSI6mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773179554; c=relaxed/simple;
	bh=y84qubhrfr3cMc6nAC3U/0mPJebsA1MPz29TDYveouw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ipk+AdC8rxx1EtRVTZ8uMQKS/hkYXiZdV5job+OD5i2mWszt+qTpM/7bRRjlVfqhmuZJ5P8FP4z5My1sn7V0JnCcInKJXzi/d6KuNGjnwOEhtrU92G+GLBgFDXi18lykjfTd4Lf4dF6t7EICQmLnLja/YHyeFVgSpwQTl0Xs1hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=GRL0OVTy; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="GRL0OVTy"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-4670bcc40d7so840435b6e.2
        for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 14:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773179551; x=1773784351; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KrG0m0+wGAmylYP6HW5DIMPVkIxjVDO5lBH833IMH8c=;
        b=GRL0OVTyOOEiE3BbeYrNzY3jCAsYeVA6jRueUb3EI8QyCT0zEnhTCSbVjKDSOi77q8
         f+Ua7TfmxUFmibinppZs0WPbPeaa9IBILPG1T7XxrnyUAy/eL6GPbrjQJA485JR5++Bs
         V3/CNXRrnXDRxePvegEMNQrX3ycGVHwhneYuRSzEToDOxcOtvYxEOYMQCDJjZTI+YlCO
         BRKtRupQMUftwHIo+2tip6SG0PFIRgObThcv5sqAVet1KuUInZeT4IGLukQWyaUrMYgR
         X1Dj+JXx52LsdH0WH//ws5lDbPbnq8fr+1dnRY+8AZsstr443+nUbYwrX4FNOxYbrwIZ
         D34Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773179551; x=1773784351;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KrG0m0+wGAmylYP6HW5DIMPVkIxjVDO5lBH833IMH8c=;
        b=X6Q0TDG5P5+/lQ1xT91ORrTrqKUvFm1BfM6BupUinBwTweAr402EpozUMbaHR5k0j4
         tEhcLSW7wFaQhl59fIevsNVsHgIqOkMP6QbahKd0x+Xmm0EoCtSgMzzRXazBzOu55ok0
         tw8Y7zOfV/uCNlvrja6T5WJtIFWi7X644Lhg21AbNiOINshdKW342WYKs/SRcaSz7Whf
         nvWqQovf0RQQi2vjwLzLGNHnLtU+pXkMBloExJJ5/vzNWEvooSHRO+X0Gp/0Hdc/jCD1
         Yjit2woUXbs/MazLk6X0TiKcZSsmJupLcZTtswdEi19bFRXcVhvFwaQ98I1xk71GerUl
         DBsA==
X-Forwarded-Encrypted: i=1; AJvYcCVLxCfM8AnG6vMd6NIeQ70+HAaC1TTFpo5n8CXvXSBCZvALC2cFGLNUx6BAI7T0O3btDGZJmK0r+gWkVzyg@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1lN+VbUoAuC0md7ImLWvd/pE0+dcHFnANee2XknvvRhJhDjrv
	u4net7QSiqTwKrILHDsjMskzQUX+ivsSFGe+0+Anf+PuVD1dthgGDIyrn7ZKVLpVFzc=
X-Gm-Gg: ATEYQzxZom6pb8FqmYpg7g9wrqBC1CR97sv0vhPwqdn2C91g57cJHGAz1Qyg3gXrWiX
	N5UGN+tL3hRkRX7LhGMpED9RN1FP6Ks9XmwOQtcREAcY1x7zRohnrjylczRQ62p/bLMk8oTZzNx
	3NWwe5LAVHC3bc5PXEjieYk22DOBtAd0yHD8Y/EB7jNUp8wxhr/NHIU8qjjnSGn7mMQdro9bLbu
	deXoc6YP3ZmWkjIntLGrIS4a1Imp3YnqUSIcWyGkuSR+VAq25XG1ai08w1n/04HPXN8nQ0bQCMK
	L0mLmZVv3djOTual81bMB1qQ1Nih9ZKAbzw+jiXUaNebWP9yn2QBZkmhpTn61yIJNBLwMpqC1CG
	iWTZqfAB6M8NPi2g3JNiGBHsnV/1VdOZ8fW2QTD/1mi+zUL2VDnLtNTTdNqpVYt9OeBy8doLo9M
	LLencxQD4fsSDtbrLDlgxBVbNZUP1LqsFvSVCb8OMtx1XTObbMg/RknZtzalaSEqgonUIKDn5bc
	Q==
X-Received: by 2002:a05:6808:1929:b0:466:ecc2:6f47 with SMTP id 5614622812f47-4673354b18amr144459b6e.31.1773179551449;
        Tue, 10 Mar 2026 14:52:31 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:78e2:51e2:14b8:2e10? ([2600:8803:e7e4:500:78e2:51e2:14b8:2e10])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-46734160cebsm48179b6e.7.2026.03.10.14.52.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 14:52:30 -0700 (PDT)
Message-ID: <79bfac24-dcb4-4fb9-90d8-3ef2393f51e3@baylibre.com>
Date: Tue, 10 Mar 2026 16:52:28 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] drivers: Simplify cleanup paths using __free
To: Sanjay Chitroda <sanjayembeddedse@gmail.com>, jic23@kernel.org,
 m.tretter@pengutronix.de, mchehab@kernel.org, p.zabel@pengutronix.de,
 tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
 yunfei.dong@mediatek.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, johan@kernel.org, elder@kernel.org,
 gregkh@linuxfoundation.org, pure.logic@nexus-software.ie
Cc: nuno.sa@analog.com, andy@kernel.org, kernel@pengutronix.de,
 kees@kernel.org, nabijaczleweli@nabijaczleweli.xyz,
 marcelo.schmitt1@gmail.com, maudspierings@gocontroll.com,
 hverkuil+cisco@kernel.org, ribalda@chromium.org, straube.linux@gmail.com,
 dan.carpenter@linaro.org, lukagejak5@gmail.com, ethantidmore06@gmail.com,
 samasth.norway.ananda@oracle.com, karanja99erick@gmail.com,
 s9430939@naver.com, tglx@kernel.org, mingo@kernel.org,
 sun.jian.kdev@gmail.com, weibu@redadmin.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 skhan@linuxfoundation.org
References: <20260310200513.2162018-1-sanjayembedded@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260310200513.2162018-1-sanjayembedded@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/10/26 3:05 PM, Sanjay Chitroda wrote:
> From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
> 
> Hi all,
> 
> This patch series replaces manual cleanup and explicit kfree() calls with
> the __free attribute from <linux/cleanup.h>. This modernizes the memory
> management style and simplifies common error paths without altering any
> functional behavior.
> 
> The __free attribute provides automatic scope-based cleanup, making
> resource management clearer and reducing the chances of missing cleanup
> on early returns.
> 
> No functional changes are intended in this series.
> 
> Testing:
>   - Compiled with W=1
>   - Build-tested on i86_64
> 
> Based on:
>   <linux-v7.0-rc2>
> 
> Feel free to share your valuable input in context of the cleanup API.
> 
> Thanks,
> Sanjay Chitroda
> 
> Sanjay Chitroda (7):
>   staging: greybus: simplify cleanup using __free
>   iio: ssp_sensors: simplify cleanup using __free
>   iio: st_sensors: simplify cleanup using __free
>   media: mediatek: vcodec: simplify cleanup using __free
>   media: chips-media: coda: simplify cleanup using __free
>   media: allegro: simplify cleanup using __free
>   staging: rtl8723bs: simplify cleanup using __free

There is no reason to put patches from different subsystems
in the same series when there is no dependency between them.
It just make for more noise for everyone.

