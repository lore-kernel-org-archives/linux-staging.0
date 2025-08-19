Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE70026E714
	for <linux-staging@lists.linux.dev>; Tue, 19 Aug 2025 15:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755615914; cv=none; b=GxSvbFAENaIVlu4IHk7oMB25pcesoJKm6hgRYQsoj0JmmKF7EmE9lFyMBdO5mLHxMLYdMQO18Y9hPF8IZI0DF0lr2TlCH9UW+q83qybQ92milTnjUcaTK8Ne85+TXp9V5B3lPCUNPxqo+nFTE4g54XlASM+WLvqCamCSwDD3Xj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755615914; c=relaxed/simple;
	bh=dekGUVKlmgJ1LUcSokupcNE9gClnOhE48jKoE7QWVuU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=eQ6BKvOkD4BJ1gU/mMno5va+Y5cTJvXfzMFAqWyD2eHnejM5hSX/yXC/PyhsUGBDQZJWuOMLamETLQpw+3gmQ17DGrr9sRtzWO5bXyUZ4kZPBz7eYpO4qpdVimU0UK+iwnB/YnCv8xbTLpnirDf+lavterAz2Hjg6iRD8emDeBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=hPZ8va8z; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="hPZ8va8z"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-74381df8cf1so1520787a34.0
        for <linux-staging@lists.linux.dev>; Tue, 19 Aug 2025 08:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1755615911; x=1756220711; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vMXTmk35S229MAbkPFpiW+nflBx28g6QPg9NXy1ZgtA=;
        b=hPZ8va8zUbOLRM6S7J6tnNsLrEluyM3vJuXTWsl8BS03g6GiNxqcvU8/1tkoPGetJA
         tIwvdHmey4BeK/EEggmlbQ7F+Wrzyrte6/ixJxMulGFz4f0GvyYCUPJqHAkiHdVHKDKZ
         MpUNBrQpl3ftSuY7K2bmnG9zbJgQWBMON9HTUc+lpS4TWy7LT6Qfn/BRI0Lm8IXdrdUy
         Gibnr+y9viytcXQJ00oRObS4lUR5+V1/A06DiFJ/mIAp+vVQw+e/YfhsrNwVobqGZsfs
         2xIRme1KHLtzasXIXIxdW6WzT3LrOi5KJk56G4wlDtCCav/fzId+YTggGQbLLkrKlupo
         bm7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755615911; x=1756220711;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vMXTmk35S229MAbkPFpiW+nflBx28g6QPg9NXy1ZgtA=;
        b=p5kk0YHMVig2aSOgI1BUxaGzGcRF/7DyVeO7JwUvWvWdr+E82nFYmYrxY5YYPOiY3H
         9ZNzBUFlet0uBOuB52K3HWpJiaNJbSpRSDne+d6daVy5jbNBfRowtwHD32Gi4GtwYU/q
         quScspDqH0RkGE0bGez4Sts4TFPuhE7XtaUe1pNMSZBPEyfwaEJ24os2yDqPIswA5eg5
         D8mzVD5c+LU+Wk3RhFTMSUGs9Uvitloj2Y9AOmQ068sLYo9TISJoOVLuz8pxk2lYOXj8
         NUmpeEAk637P5y0WF24fB4sMDNhga80p8Y5yGX7S+2B1Kc1qCZnOi2u5qoRQYZTLAt7O
         OLkw==
X-Forwarded-Encrypted: i=1; AJvYcCWjNT+hL+ZHIRNMD8CiuhdaGvLe6X0G+GxEVfK3a6dI3CSrXEyj+Uzveu/3eMlS7aDPep7CYYzViVibPTx7@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/bxC3h2a9M7WhPJpE5rS1VaQZYfhuKx+dlfW0g4v941QO38Ia
	Mu5mbqJAoVNO6hf+1GA+n3tOM4KMYcvHaJbu5kLbhb6sedYyC1KjNDNly93ZIgE8nrc=
X-Gm-Gg: ASbGncvL3UhBmILF1hGtQFqj11r8JuixjEhbsD92XxfeO0iToUjE3xTH0m2k48NLrgJ
	tQSBacEzL8cfmWMlwuiuzdc520b8ArcwyPAGM8y90J5XijpQ5Zze/dReKCn/jaC8zGgC3abqAk6
	8bJKGQgrjEOq010I337Pcxi2OvvbiXOB/bqWWMjZUujqw9OEKy2SIKSk7khUgvkMEK0j7dHgq2S
	Z6M3GUCCSx4M3Q/hyg6Invqz0NPIbuYKW66pi3pBKdQYhJe7HUJCvU4LVbVWOugckLnfzbpsb9M
	xyIXUYA90awnp2VmN3TeoaH+VOwm/0a0fCczyowPgJbHsm+xC7J/H3aS5ABB+F7wAjLSDzVrpEz
	QoyfpIKsu7PRAmGO5GFuANowJ6Av/V4fBWxis3WFJUYlPccwhVH+TzMxOh/+jj1J+6TdKRSK/mJ
	M=
X-Google-Smtp-Source: AGHT+IG9hSIHsbvBSMuM+1DjW+6RnRyqFcbS8/ej/hb5PzR9IP8FISpX8gnH3Mud8EC9CDMd1mUScg==
X-Received: by 2002:a05:6830:4186:b0:73e:96e6:2540 with SMTP id 46e09a7af769-744e09dfa60mr1883876a34.2.1755615910866;
        Tue, 19 Aug 2025 08:05:10 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:990c:4d50:9c6c:f367? ([2600:8803:e7e4:1d00:990c:4d50:9c6c:f367])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7439204e556sm2418288a34.43.2025.08.19.08.05.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 08:05:10 -0700 (PDT)
Message-ID: <f7815955-7e8a-4f67-b699-8b19cb38683a@baylibre.com>
Date: Tue, 19 Aug 2025 10:05:09 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] staging: iio: adc: ad7816: Drop unnecessary
 dev_set_drvdata() call
To: Salah Triki <salah.triki@gmail.com>, Lars-Peter Clausen
 <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-iio@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <aKSRpTuwA0P-ZaUS@pc>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <aKSRpTuwA0P-ZaUS@pc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/19/25 10:00 AM, Salah Triki wrote:
> Remove the call to `dev_set_drvdata()` and the associated comment
> since private data is never read.
> 
> Signed-off-by: Salah Triki <salah.triki@gmail.com>
> ---
> Changes in v2 :

Reviewed-by: David Lechner <dlechner@baylibre.com>
