Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD833847B
	for <linux-staging@lists.linux.dev>; Fri,  4 Apr 2025 07:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743753228; cv=none; b=AdsS/t0r88msEk4xpwe52IdBcMObZ4crJPtWYHip9IhVUsAKBZcmRNO3Mx6FsdGC3JSmf5JjIInmPVdkHToIJuEexAbyySglsOevS6KWCeTMlfSforWY93rwrRS6GPUvgcBBVK+7NxJEBU95lx1t3czHLZl1uawZPoBY5MAkQNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743753228; c=relaxed/simple;
	bh=r9khSvMMV0yozH0rzjo8JBgc41XEfqOhVFzyTEndWgw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d5L++IBnY3NujZ20heXdLoTE1h72EJBFO009pjcC99c2/nyLE6TP2fTwOC1ZBbBy5F1NZf4GqOQMhVmeKE2pJ7PrMYkhvud6gbVqVdrKiCOmf7LRDma6krnQfmAJwRktdzTdksrQ5UbiLNXY67NrAmCsvgjGbtbvCjB1kfKVRWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gJSXMIlb; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gJSXMIlb"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so10533025e9.1
        for <linux-staging@lists.linux.dev>; Fri, 04 Apr 2025 00:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743753224; x=1744358024; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3GvNudHj43sLnU2IimkQsPqmval+E8iAU6S3i4j/9Ag=;
        b=gJSXMIlb9tFy4uOTXvd0hFMroJFUXoLbqEXgp1UQbBWouwLXdo+w/bvTcErbInDv74
         OzcmNmaxwWBKNpFh0mw33BbA8vhUPdXhHajGzbvRxxLwcnjaNTrhIqLO3G7lAaZIOFEK
         7BvDydm9lTO/iw5u75Z6wS2y9Neiy8fp+NXgqMgxcUZjr5Wev0diVnGG3+Ofz91FJpox
         F89vjDBgg6l14vE6gxwh9foGRIIOtPycF2WhTrfCMm2gflmyc34j2zbs90cmBvRVUHZz
         kSKwC6omNHDSIfyCgx4NMkjx3jxze2yR/afHoQU2SAQL62x+3HO7zxoGr+kQAAn38gOW
         fiSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743753224; x=1744358024;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3GvNudHj43sLnU2IimkQsPqmval+E8iAU6S3i4j/9Ag=;
        b=X4pK1SCxFbJS6kEVQs/tdaSbqzrSKFHOKKFCRWtFMD75H99E3UlVT9AAC3rHx/OJrL
         24sOqr4bQXEJulxOyJaCO/te08mhvMy7kSQW1UkQA02I4RgbNTL8SmwULKd0B2aPG9nI
         5P7CXrplMvKmzxfS48urDBi4juV3+B0yHt5HH/osvE4UjlrKn12rlKTRcHPGF6ADn61R
         OXwkuuSTntnGgbqALP9O/Gu6dZ7HJYFHBc4dOCPCRNeQ2Ai14fxcYLMbqFhPyMHmiKzH
         hrt/J5tReQdnkhIA9jVPvf19yZv0UOpWkcRWO363eLGCv8cWCEDQoptZJSJ11Cc+TjB1
         GIUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDiMh/h/Pno6TmxXQQrpRXYk5vBV7zhvvrSIMbb0e8DOmcjP5191oYFLqfhaRd8HrUUBOU7ZDVvAtOzhth@lists.linux.dev
X-Gm-Message-State: AOJu0YxS5DAH3D6qkI8hRZ6YckpzyXz4RpV5Xz2H8gBZzlVU3CHbn2tt
	wMfrQ6V9UtKxpSQ9adxxL1HF1UY3D51+Z6rU61baBO+eMFhOdj4QJVVf5+QUwMY=
X-Gm-Gg: ASbGncvYL5wK4KFpL4usci6IF0MNKtF6cC1SiBaWKskW7HCXoXrOuLBFFf4Yj3Mj5GB
	gxx//ONTuMMy4AbOYSbibjg0jse4ZMggZ73jGuX3i4CbGBQdaa4Z7Zo71CUsu7iWZy3nAy1/mfO
	rQnm3sLUidT6rl8AGH8QPhF+XjxEhVEkPKgyQvmxhnKMEp/OX7u2Q7TZtf5OI2ULEBdMae61ng5
	3inPsj/UWBh0XbX8l7hizC9tqxpsZjCzAwn6k8yZbciLSU1JEaI+Iavvt+SIcuJfvvnvfJZKiO+
	s9jhltgJiGoaQmMxBXDCwLDYNTdP8ym73UDDYp/KOdDjEvWEEA==
X-Google-Smtp-Source: AGHT+IEdqvONhq2YUwRwTjwRLNZUpJ81Q60Z9i3sMQ6SbaJbaM3ciB6FWcqPTl4o5r9FVChY4xceDg==
X-Received: by 2002:a05:600c:1d8e:b0:43d:fa5f:7d30 with SMTP id 5b1f17b1804b1-43ecef0230cmr19010215e9.16.1743753223927;
        Fri, 04 Apr 2025 00:53:43 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43ec364d036sm38271635e9.26.2025.04.04.00.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 00:53:43 -0700 (PDT)
Date: Fri, 4 Apr 2025 10:53:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sunliming <sunliming@linux.dev>
Cc: Greg KH <gregkh@linuxfoundation.org>, dpenkler@gmail.com, arnd@arndb.de,
	everestkc@everestkc.com.np, niharchaithanya@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	sunliming <sunliming@kylinos.cn>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] staging: gpib: warning: variable 'nec_priv' set but not
 used warning
Message-ID: <f6e2c865-7c9f-4301-a1a8-8a5b1dbbb5f4@stanley.mountain>
References: <20250321010649.10918-1-sunliming@linux.dev>
 <2025040310-poncho-armband-782a@gregkh>
 <8e92451a-4d43-1836-ce5f-afb6a523115b@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e92451a-4d43-1836-ce5f-afb6a523115b@linux.dev>

On Fri, Apr 04, 2025 at 02:08:38PM +0800, Sunliming wrote:
> 
> On 2025/4/3 22:08, Greg KH wrote:
> > On Fri, Mar 21, 2025 at 09:06:49AM +0800, sunliming@linux.dev wrote:
> > > From: sunliming <sunliming@kylinos.cn>
> > > 
> > > Fix below kernel warning:
> > > drivers/staging/gpib/eastwood/fluke_gpib.c:196:23: warning: variable 'nec_priv' set but not
> > > used [-Wunused-but-set-variable]
> > > 
> > > Reported-by: kernel test robot <lkp@intel.com>
> > Please link to where this was reported.  The report from the robot will
> > have the needed information in it on how to do this.
> 
> Get it, I will resend the patch to fix this.
> 
> Thanks.
> 
> > > Signed-off-by: sunliming <sunliming@kylinos.cn>
> > As per our documentation, please use your name, not your email alias, on
> > the signed-off-by line.
> 
> It's not my email alias,my name is sunliming too.

Why is it capitalized on your From header on your email but not in your
Signed-off-by?

regards,
dan carpenter

