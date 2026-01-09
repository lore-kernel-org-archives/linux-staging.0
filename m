Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692202C326D
	for <linux-staging@lists.linux.dev>; Fri,  9 Jan 2026 06:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767939286; cv=none; b=fo5UEgk3mIXxbvIyyvy/fMKLwcOK3i8qs+7BUYbI1QTxW2yorBEalJ64Pyxy8FizbIcEsumL9v6+osJXplu1rPsG0+hcTqmVRIk8SHTl2fsvTvskKq2IpimyjAfhWwBwbR2AxtMLcy6cqnvRE95bE/ONv0k2ERDlDKLMb6EtBsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767939286; c=relaxed/simple;
	bh=P89mL8EUdwdPy2mb3P31kjWVpZSt5XhJNKN7W1rkSeo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WVsOrEkw4m24B6ylbJIctiOqcG3c0BLACUy1OBJH7n4JXngx3qcnBr8ah8vVwvVHNdrcmhD5u9axKlQFNcPe8vL9owIDboTvVVtV+KDWdhtA2YmgyV523tczgNEu50l9luo4ncB4BKk+mHLWoIpqKrN4vYKINC38N2owD7Uw8Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LOzewN8s; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LOzewN8s"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-432d256c2e6so955803f8f.3
        for <linux-staging@lists.linux.dev>; Thu, 08 Jan 2026 22:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767939284; x=1768544084; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/O/Eq2DaBroAxHgsa1v0NiIqCw4CsEf3jankMI7XtDI=;
        b=LOzewN8sYLf59e4LKeKWqm9qnbN9DbFMipj9crHBFD66yq8wcjHWzqweV95XCIDSwB
         vyCUyWrfrY8QNI/XjzCe6EdvXLdTrLrAKw6tUgYGbtIT30b88OV35uTDMgOxft7flG4O
         qm/hLDu8EbR0Og94X6iMQezgJfKl3iAKDqMZTC4a/DGqlWRA2V+Y7j94Efd9feVxPMr8
         qBYa/ynv3r3woJ00XHDlx91CdEhqZnY9nssgAs1pBJwYsfc4F5bDvkU/BF3mI1Mx0alu
         zIlDQtETRA8M9PSSRWi5hdpcMHvKHGp6KqXh3XEc653wCI1BXDjyLETFC3EJ9iRyWc07
         xE8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767939284; x=1768544084;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/O/Eq2DaBroAxHgsa1v0NiIqCw4CsEf3jankMI7XtDI=;
        b=jgUIIRwCWYTHU1F5Fn9+Q/oo6BsnrDdjLQIt6pTAx/UTZGGF8o1V0M2cUwyopaFx9y
         i2ZkqUekBddsN0ZU+1jR/wS8kOQ4Mp2lTBHEHnHKTRC+T557G/4YsSLnKUT3OtnyYgsH
         dpzQrmx8gnaMg1eGnOxT/r3WGMA14FmEcKsHUhWrbjfJvhARMDlya4R9vQvkB/iCNhdE
         lEMYHEazdRtmFFjKayMD2nMCAuDUoTP8oIgEqhvYWPODwcYxQ2pX2F6ZZUUucKjuFjT6
         92HZwQyedQKCxiglVgcz+3CA53t8dlqR3F8EJuwByxOMUnepPqHD9v2hPMIEa8Q7hYy1
         6xlA==
X-Forwarded-Encrypted: i=1; AJvYcCURzUIZzcR3wuPJFFNczvbdRtRpG4LTxrz2vOPPdZtuyeCghmxcOzjhLS4efhERVPbBB5+xnz/UFbWNJMwS@lists.linux.dev
X-Gm-Message-State: AOJu0Ywe4dTVTnAGaJd4uxXULr911+Lc008CfkynXKOlgGo4eHKKodIK
	e+rvBWX9ZFldndW8E0f/kGkj2mvsdU9y2DbSd3YmTfmENUEj/Jd0I9QXiXNU9LnEXYc=
X-Gm-Gg: AY/fxX7zOTLjkO0m540nSxfJSMVDBObq8cF0wVNmS+KY3cNjT6MLARcCLHAZJr+dj3U
	SQngFIH8ikOGP1YDbVZgYYzvUpToMLpYzNFzbcG93b2Cu9so2C7RMpocOwNonfx274hoVwZMyAj
	XRnsBonwVCix5ID2nRdlxG4ovektV5ezu6YBXBaClMwbYKtM4Nz8vOOHmuCt8gPRiYEivFXUhrD
	mSrL5CcJPT+DCJCyhuPqYDa7DwpuUgDkhlXj7wGZCl5ZvIT9uwqqr68obzYQ9kwGrANTHZW6bW8
	EmmSU6L001M0/frWNyCr+hmiU5S3pMlTOjb40/ZlMEydOfGyn56MO0ScOZqwdZBuaoHQijzpk2U
	/Gv9Kb6CHSeM/pFpvX6kBqf6/rFBkeTghVIOk7ziFWf8eE48BX4a+c8Fb3bklkFc1ouqHm9qyFk
	ouVJTGn8ZqvA75ZSnp
X-Google-Smtp-Source: AGHT+IEBbn7jf3NOZrQrn9TgtiAQQTD6UVcOylSPHCZVWqMEvKJLOUdWlv+HLP63NALGjSxFuvQ0+w==
X-Received: by 2002:a05:6000:310d:b0:431:7a0:dbc3 with SMTP id ffacd0b85a97d-432c37983eamr10259558f8f.29.1767939283781;
        Thu, 08 Jan 2026 22:14:43 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432d9610671sm2321918f8f.34.2026.01.08.22.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 22:14:43 -0800 (PST)
Date: Fri, 9 Jan 2026 09:14:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Samasth Norway Ananda <samasth.norway.ananda@oracle.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] staging: rtl8723bs: fix firmware memory leak on
 error
Message-ID: <aWCc0Mq_m_1lKI7H@stanley.mountain>
References: <20260108181612.2340796-1-samasth.norway.ananda@oracle.com>
 <20260108181612.2340796-2-samasth.norway.ananda@oracle.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108181612.2340796-2-samasth.norway.ananda@oracle.com>

On Thu, Jan 08, 2026 at 10:16:09AM -0800, Samasth Norway Ananda wrote:
> After successfully calling request_firmware(), if the firmware size
> check fails or if kmemdup() fails, the code jumps to the exit label
> without calling release_firmware(), causing a memory leak. Call
> release_firmware() directly in each error path before jumping to cleanup
> label.
> 
> Signed-off-by: Samasth Norway Ananda <samasth.norway.ananda@oracle.com>

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

