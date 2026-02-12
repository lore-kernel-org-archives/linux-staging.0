Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8E5770FE
	for <linux-staging@lists.linux.dev>; Thu, 12 Feb 2026 05:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770874519; cv=none; b=N/ubHJ0LgGEg+BsIOTlzZAJ76AulUoevYzJB0fol1orMRD89sLySxxcEDfJGe9R/suqxyIc8k4EXDozo0EWc4k7Zl1n7VA6W3h6bhLP8s37GMP/mTDeQxvOjIJEOXQoL9ycq3a4SiJT7rsKOdHKVcOX5Q1XW1rBEE5FfWm6NevU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770874519; c=relaxed/simple;
	bh=83veI/vhVwq0xQcmpgxHqz2Io5xC4iuoCU9FzcUMvQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I9sokTbqOefztsoHFxadM2WXZ+lKNtimtgl7+UEE+vp6D62mQmU/3B7FEtHspGxyW75QnfLAWAIRsDSZFq0F0KvxSGgL5vZpyQmecHLHLLMIirF/0DwIZ8d0s8o3vFIlzKqrvFBPvEfL2Q9GbZmdNhB2bTTBDZwrXMpP0Fzj9cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zNn8xUgM; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zNn8xUgM"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4359a302794so3976448f8f.1
        for <linux-staging@lists.linux.dev>; Wed, 11 Feb 2026 21:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770874517; x=1771479317; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uGlTAM0CcQ9X7JUlNOqc+vi1n0Z9fGaUWQXZE25x85M=;
        b=zNn8xUgM5qYHxS1sa5FRDUF4f2XTKjAhK9EmOsajTJS0FNGqBfMIT8vB3hnGVGPCVc
         zdH7vQ3FWUlorTR+DPYcycq1syhqUUPeAXp/lGvP8lgPHexbE4sA0NqDI2DquWeGjH5P
         4uWeVCcvLRgzRcJMjvc/hlrF2g6DMuhtpkF1VCVyWMFxZTa9tRhjYc1A7ftD0Uw+R7ku
         rC0w4E7cQ7do8ve8f9a/stq8mXRaQ3xM/4z8GFjsKq3LOlxenrErB6C3ybz6a671CG+T
         jH6Yg0vZ8s3ABxq6AoMXB3/nXwmYd8V5f/GbC1jVc2Eej6X4/L83MGnywEGii8ls7UFU
         vWfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770874517; x=1771479317;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uGlTAM0CcQ9X7JUlNOqc+vi1n0Z9fGaUWQXZE25x85M=;
        b=JTDpdv5k0E+CZesjcCUUzZhqzm7FZ+xKatbkkhQH5Tja5zKLn1HiausL3kUYa3ComS
         pULWF0itYNZ7R7w+70teYbEl9rN9Qhhb34ewzElhdKjZxtUm/3Vei1ym6OBJU+EZFaDc
         21Do+V0ukDcguFF5YWvpMo4qi/0EI6kV93prZjinEm+JneoIe3oDOBvlv12HJH6kovZv
         KXRqNRjwAICCi2RR2HfQ7eyhveJufbTF9ERRTiatvzPpRPgJjtAxJTB+MW5LUSNOlIcA
         TIIaBaXfX2Nu7dFmz/0lOH55/De7DH9ZVoMy7TATDbF91di41D/G9LzkH5c2yDNhkfdL
         euCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdMRNo2pqbeULOPQxpjDV2rldY+jJmHk79iwk09o37CuahJzx8Hn/52Fr+5MEo3WGmLnSaoheNO9hqOGJL@lists.linux.dev
X-Gm-Message-State: AOJu0Yw95fFn64kelDUaU4jNzjaRRBVSgbSkZvLXSYjEqlKvtvLAAk+b
	fle33E03cxiF1EKw7EipK1oCli+ez934ZiETntM6Zn2TXKHUbXprjT7pviOPWUm+VcI=
X-Gm-Gg: AZuq6aJc/+LyVMMoUqcqjpK2yQB7jJ+KSEN23VsgJ0aT/9alSV6qoIqxMf+XSzkdaQo
	odmmnrSzkT0SwEdE7VlfAQaDtyu5wEBurXWn3AJhZl+VBvMMt6dukooed/9lXtYZB/ueWN8jW4m
	1Q6vwQaN5hN1VbC7D3iOLv9c2oCEeaBEbw9RI0Qy/P9cgnKJfYvVmdtPNBOr5ZlFwym5wxF3Vyh
	9qFRjzIUxgjRh1R/euI2G+kbzs1LCwzhMqSxDPaib3logHHFN5AHfhPMIb6Aco5r47+18ZYbB8j
	QBXZ+M9uCNITo+P7HeKWj19lB9Ox4UAjJTIHQEupNLMPSvYDvzef6NE2Mecgv4S3gF/auflzZNs
	cOGynNWZRWqcWuFio3zrjknwEY/hC/g4mMfmwQsBs6bt340nuDhV3zYe9nnNio81aChXoGBsW2q
	Z+D0iqgwpunYG3EmBHuNIHyLlVaM15
X-Received: by 2002:a05:6000:1883:b0:436:1989:46b7 with SMTP id ffacd0b85a97d-4378acad908mr2605377f8f.15.1770874516749;
        Wed, 11 Feb 2026 21:35:16 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43783e5c93asm8309333f8f.39.2026.02.11.21.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 21:35:16 -0800 (PST)
Date: Thu, 12 Feb 2026 08:35:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rachel Ovrani <rachel.ovrani@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: sm750fb: convert nDirection to snake_case
Message-ID: <aY1mkfl2lKKj4d55@stanley.mountain>
References: <20260211142423.4922-1-rachel.ovrani@gmail.com>
 <aYycB-fAZn-uTO6r@stanley.mountain>
 <CAPs_yZVzsHMqiMwWqM7m_7q9CRGDwRcHiAbx4VModZnCNzc0fQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPs_yZVzsHMqiMwWqM7m_7q9CRGDwRcHiAbx4VModZnCNzc0fQ@mail.gmail.com>

On Thu, Feb 12, 2026 at 12:24:44AM +0200, Rachel Ovrani wrote:
> Thank you for the review!
> 
> The 'n_' prefix stands for "new" - the variable holds a newly calculated
> direction value based on the overlap between source and destination regions.
> 
> That said, if you think 'direction' would be clearer, I'm happy to submit a
> v2 removing the prefix.

I would have never guessed it was new_.  Normally n_ means number and I
couldn't think of any meaning in Hungarian notation.  Naming it
"new_direction" is even better.

regards,
dan carpenter

