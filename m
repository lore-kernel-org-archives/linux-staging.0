Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB101863C
	for <linux-staging@lists.linux.dev>; Fri,  5 Jul 2024 14:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720189518; cv=none; b=WUiNNvY66vghjqjgvlpEgi4yV9PploPP85aOOU4asP49d5kzOMAV3EO50z/dL/uPJMSBcDkusVDMfRj8Efae+Z0YfzCiL1g9JH1gr67MWNOpeBkCD+tfctJH1cw2g95y+JWVjXUB54G/x1Rkb4HsHVWq4zJyvVXlg5JJaQ4tABA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720189518; c=relaxed/simple;
	bh=C4tqAmHM8v4mD3hhTZJZUBWCm1/4vg81FUX8llaVkDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UW0PPRSzrwOafeQhLhPxM+aIEK1uEzm6qQvyZCiTB9JWEo5pCCC6bohwinhlw4fUznIxalCHYzFUsVIV90dMT3RYwtQI2VeDmGbxlsyzMD/f30c8/n5DC4vCEn6/3FQo8JMMOdeyQ3iaGj0ZCBBCjgDcvsVft06HjVKEXG62W7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TQ1sX5IU; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TQ1sX5IU"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3d561d685e7so1096355b6e.1
        for <linux-staging@lists.linux.dev>; Fri, 05 Jul 2024 07:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720189516; x=1720794316; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nXc3UlGjeR76mLpFRQ7ArGxbQkbw5AvjaQ5WOZ1mVMs=;
        b=TQ1sX5IUH5eFZLmSyV7nHq93qqyKKTCwZVK7ctvfjR0bQqtBm8fc3p5t+Ti9JNsTSr
         H7W4uWDyWHRcoknOIQ7bSA6RkrII0Vwd6nlqho1SocqVXC+Jd1iLS5X/H88G+4zGqul7
         skpICvqvJIMMTxEggPszo7Z7tU5Cv98kJijS0r5PKvM+aJkJmB4MtY6fbDtmdrmMDY54
         U0QrDVkAKKOOvznV2Y/Z3vJ3bCTHZhV+hVaXheNKu8cvuDiKrSAGt/Mx21m2dhW5mK0A
         SyhBYZ2PgBB+QOiDxTDNN+1VtFE3PGlBrsC6rz8FRIfZgkQVyNniFpqQjAQt881tUJA3
         V+jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720189516; x=1720794316;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nXc3UlGjeR76mLpFRQ7ArGxbQkbw5AvjaQ5WOZ1mVMs=;
        b=ulCRbB159PWskTRwIc6tepqjgJoUQwKSUFf+5AhwsCnNIA0rAFujDHYrgWkJ7aZfPX
         VCVixGNt8nJX/AP3kJCVejGl6/seHWH7ChlkvvI+oGWi+mnZChcwYi5TcnFpbB4iSoOz
         W84dxZcEtKDrQN136Xv43dhZtNHS474BBDi92XUidLyqgM4XmmXlJ4/GU4bPA/Ycrkot
         8Ko/rM+CTQCQXERMJKJnsKeGm5D/AvclrvSuJKkUMR5Vilvu/dFmIZ7/jNs9kvvKFYPS
         XV5vDiB3FI1SX/Kyu3oM/Q3Odr5cvYNh0+1cqAYUPCc9FeG/4ILPy3mqzZiuUUHiK8FT
         DYtQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4C6choTiknuoQfK51SE7tOqLrccBxfzY03WFZxVkU8MyMnzPKuPMOmFVHPDvKvUiYevHLTjfok3GyoGc20mQ+ZGng7ZZW2sEQfong5w==
X-Gm-Message-State: AOJu0YyG1utKOL1ZHsuYhtGyeAhM6hqu7omisH7l+kcYdQNZEGigi+Vn
	PlYoEZkrDUwmCcbAYgS3oP5SRVIwFdzZZP0eONcbrAZBCsL/x/+fHdl2h15tE2M=
X-Google-Smtp-Source: AGHT+IHPlj4ATuT25r3JDKsOmpgXkUlB9bwlGVA8tDvmU40oqlMbYDXNcAQKERtcZUZ6QmueddNTAQ==
X-Received: by 2002:a05:6870:8182:b0:25e:2208:6c8a with SMTP id 586e51a60fabf-25e2b8cf279mr4072132fac.4.1720189516448;
        Fri, 05 Jul 2024 07:25:16 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:45d:774f:47f7:bb6a])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25e4be5ae0fsm209740fac.29.2024.07.05.07.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 07:25:15 -0700 (PDT)
Date: Fri, 5 Jul 2024 16:25:14 +0200
From: Dan Carpenter <dan.carpenter@linaro.org>
To: =?iso-8859-1?Q?=C1gatha?= Isabelle Chris Moreira Guedes <code@agatha.dev>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Luis Chamberlain <mcgrof@kernel.org>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	patch-reply@agatha.dev
Subject: Re: [PATCH v2] init: staging: Fix missing warning/taint on builtin
 code
Message-ID: <19a4a521-2e68-402d-83d0-618c299f2c10@suswa.mountain>
References: <n5plxnkubcnbuyv7l24i4cwsauh4odwk6g5yiys6oiiwj3i34r@izcjggvv2om2>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <n5plxnkubcnbuyv7l24i4cwsauh4odwk6g5yiys6oiiwj3i34r@izcjggvv2om2>

On Thu, Jul 04, 2024 at 09:20:49PM -0300, Ágatha Isabelle Chris Moreira Guedes wrote:
> +#ifdef CONFIG_STAGING
> +/**
> + * staging_init_taint() - We need to taint the kernel whenever staging code
> + * is initialized (from built-in drivers) or loaded (as modules) and issue
> + * a warning the first time it happens.
> + */
> +void staging_taint(const char *code_id, bool module)
> +{
> +	char *code_type = module ? "module" : "builtin driver";
> +
> +	pr_warn("%s %s: The kernel contains code from staging directory"
> +		", the quality is unknown, you have been warned.\n",

I wasn't going to say anything but since you're resending anyway,
please, don't break the line like this so it starts with a comma.  The
comma can go on the line before.  But if it couldn't then we would move
the whole word "directory," to the next line.

regards,
dan carpenter

