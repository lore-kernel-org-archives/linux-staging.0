Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7899E225791
	for <linux-staging@lists.linux.dev>; Fri, 10 Apr 2026 19:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775848336; cv=none; b=S0BgTqW5pLHba+hfN+edooRMXm3M7Pl7GTtq6Dy0iCidRdTqHh2h9rMzZfifRuPXO5JHLy9gb2Hl0lh7wfCQvMHNQ62zt4e7iZ2IoZPC9gKWvewgKdVDwprl4914AtEuNrV56cj0HOULJC+g+5ym2lWn84AxZ8IsaYTlZxjaDtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775848336; c=relaxed/simple;
	bh=xS5yxi31tQpIlRofqULfInSdfXxuzoD45QSLJ04eDEE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M5/HFXrvBv0+7MJY3bVHxFYGOYKb5l/HpzlQIfXFGLQL+0nM5S6VWUOx/F01Jmw2nAg9NWEBR/l9BRsz8BRpE/QmnpcH9GqtLDJ/EYJmHAR8hscjuGOsiiqwZGYaijx7nCPBKf73K92K3SyzK/exKsxmsvhFeW02Z3oYmGaNhGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=cUdva7qn; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="cUdva7qn"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-47018d3416aso1512281b6e.3
        for <linux-staging@lists.linux.dev>; Fri, 10 Apr 2026 12:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775848332; x=1776453132; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zLsRMFsMCnWy/dE1MVi6bp8gCipvA2+DQtfeIR8z2qA=;
        b=cUdva7qn8U8EQXdD/rtRmDn7bLJDXP1hMoHX+X6VhyAfkcqU75RImUZao0KXNhcmez
         mUkiCn+TsgaZ1O7jCNaKtN6k+grf3DCvcaMh62A5CjuB4/CfKgSgkESUZ0wAn/6cpB7q
         ULBktWVnAIeZaXrYbI6Xf2KNngikbo7QxXOeJ+jVFnB51I2OTTzUyy6PLqoDLARIwlV8
         7geuGeeaFNAlcdZ/Bk9yjswlg7YerbPGd0KN6s59nO5cguYKW5/7NkK19AXEV6b8UoaU
         GcpHfBxZjDY+tI5T5mTiBwhYt4hDHbLPL22cOgAa7F4L3OlH6uEZl4LtRuNLsccF+Seg
         SoFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775848332; x=1776453132;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zLsRMFsMCnWy/dE1MVi6bp8gCipvA2+DQtfeIR8z2qA=;
        b=DMuLxyMvCDA8yQJcWmad1sLJXeA6ePP1LcYrXTsFcxOwvrFKPz1OWNfIu3W/YFxC3x
         gNiQ4Eq46YR3wSVC+815XTWAp5XzBytDQ66QnMOKgh2JEuznHSXWrn3LjBvqzr1z9Mk5
         Wgqjvy0PuueQTijE8M2sB+j7OSBleWvRuP1rNR7Pz7azUQxFBQEybF/pqyIZP84OLB2b
         kv3pedPxsReWyWViRANaToXoHVlugBbwxPVQyAG80Tcz/y3h7iAisAEqEp1HkKQMEwYr
         NziJ7E+wyNSSg9cN/rnLSOd5jvNTe6f7ZB6lhz8SPiMdsv9e122/aK1cQpzwwKIXEqXn
         Qz5A==
X-Forwarded-Encrypted: i=1; AJvYcCV6/nUw2k3URFwRW08Crn6r+rqIF+8XPIkOYe+m4W1bAtJ69EEzHkTLee3GGh1okWFF/3x+tJoCDwj+kMlt@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6zq+4TIYHZo8PZBz8KyYGT2gE7wQNfvjhGCbRXGOa7q/h4uDv
	dl4i7OAlj3wIt0j57Dripr2YngEcj/8QhMFn96X08AK0Lz51tMwntaBhu1juhQyyt1I=
X-Gm-Gg: AeBDiesa3oXKdUYXHw2sssrEIZ6i3A83YIOofpnYp7LBKHZjAEWH54pCtl5KY/80Wq3
	FzpQ3yZkVwQSetZmFM9gxqOgAOL8QnRZekHs0pZacfXwgbCNw36OeKZiwRliZh6NgrbhKZ7TrLo
	nnFjq4ofnrm5XZOiAOfI3XVBGayUjuIs2XASyyNDaPQlk/P5vkHmsXJtcmRk+4dtfE78IxaT13T
	WKCxCWx4E+NIZ4oza/PZDe7vZAvo5kjBgub+esHMoS+fR/aGjbjR9GKwWqtpftNEuC8ZZ8bCb/Q
	v35U6+bGr6XbTtU+U/p5vLYDHXHG3WMr8sfQTacQh9djSteAY1syK1+x0dJnYmmZZNK0MwugZtK
	zPlp7wBBA+nYVXuhQofAA5bE1h7QXOjvFiHaZ47ofbbcGwTuWLI8M/uh9lPKyEdq+JRV5n0n7VG
	KXMgNzgExkMMj02lTUjRCgA/kej1A0Hh0O/CZiEhflCGqm217OBereZnv5Y7dAQlSMy6zeFdvn/
	Q==
X-Received: by 2002:a05:6808:67ca:b0:467:27d2:96a7 with SMTP id 5614622812f47-4789d33ff74mr2585325b6e.15.1775848332294;
        Fri, 10 Apr 2026 12:12:12 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:b75d:2440:dc10:808b? ([2600:8803:e7e4:500:b75d:2440:dc10:808b])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-478a3666dbfsm1887177b6e.15.2026.04.10.12.12.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 12:12:11 -0700 (PDT)
Message-ID: <2c29f960-1e0b-4d66-858d-576e685f0812@baylibre.com>
Date: Fri, 10 Apr 2026 14:12:11 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] iio: frequency: ad9832: simplify bitwise math
To: Joshua Crofts <joshua.crofts1@gmail.com>, lars@metafoo.de,
 Michael.Hennerich@analog.com, jic23@kernel.org, gregkh@linuxfoundation.org
Cc: nuno.sa@analog.com, andy@kernel.org, linux-iio@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260410100832.1388-1-joshua.crofts1@gmail.com>
 <20260410100832.1388-3-joshua.crofts1@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260410100832.1388-3-joshua.crofts1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/10/26 5:08 AM, Joshua Crofts wrote:
> Refactor the ad9832_calc_freqreg by adding a BIT_ULL()
> macro instead of manual bit shifting for better
> readability.
> 
> Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
> ---
>  drivers/staging/iio/frequency/ad9832.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
> index 1f6ece79b8..260c2e3a9b 100644
> --- a/drivers/staging/iio/frequency/ad9832.c
> +++ b/drivers/staging/iio/frequency/ad9832.c
> @@ -113,8 +113,7 @@ struct ad9832_state {
>  
>  static unsigned long ad9832_calc_freqreg(unsigned long mclk, unsigned long fout)
>  {
> -	unsigned long long freqreg = (u64)fout *
> -				     (u64)((u64)1L << AD9832_FREQ_BITS);
> +	unsigned long long freqreg = (u64)fout * BIT_ULL(AD9832_FREQ_BITS);

If we are touching this line anyway, I would change `unsigned long long`
to `u64` to make the type name consistent with the cast and makes the
line shorter.

>  	do_div(freqreg, mclk);
>  	return freqreg;
>  }

