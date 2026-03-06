Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85EF23321D8
	for <linux-staging@lists.linux.dev>; Fri,  6 Mar 2026 18:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772821032; cv=none; b=YYbrfhXcbc7LixiyT7DZSCz9WMq79bmMI3HjKcoRKhZXeP/qlSTSbXhrl9Lo5CtTGauSqaHXgHBMOZw97Aw2GG8yqeR3LYqA+39INzJvPleUilTNhoK6i9/isOSFzhA60QzDuYvi8HoD2yFYgMPzgidFsduJbS1sf7dVoqVpSBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772821032; c=relaxed/simple;
	bh=tSfUI3NJI4sLf/nmJL25/P/qckWuIbQ2wxSW9jiF/QY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WFi9MrS1kBwYxA6Ql448tiWgKB79apT5Vvvq/f88U0H/G2J6XKUTtkkkkXXB1zTtdFnZhXXNPBsxDBIr19hqhKtkU23zaC2b1q0RniXx7Cik9sUIYTyPHrs2lL+s1lDt3SMA20NDlAnD5ZwmH2VWLNiviSw8BY2CPaaW7GFvTHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZK/DGCoV; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZK/DGCoV"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4806cc07ce7so109417835e9.1
        for <linux-staging@lists.linux.dev>; Fri, 06 Mar 2026 10:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772821029; x=1773425829; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JKhWB5WYBOgtNloQxw0BE+V1Qr8Hll+qJ9pU1AjFn3k=;
        b=ZK/DGCoVJjUsh7ZDTYjAixrmktVQkrIVC8yRJ1li5ppbdnm/X4X0/0hziKbeLubbWQ
         RHZgl29Y1qIJp5M8Uf2vbYyKKx3uyS42IObFEO7GayA1ZIqB8/rtRNgGpoisbvugVx4n
         43gd9Zbw3o+AcEzBvvZYCzZB6dFr4oN9Q6ULBKtf+oc5Ir9UdhI67Q23B3xBW+K5JrWH
         89TiJLkN9lk4VR3Wwj/04Uw+g1JXc8Nr4ALC3SMW4LN2feF8B70ni2Qkdh1aEglR7G0E
         srKqmAVmeWTk89wMCJoGQX1faEKqrRJRut/hExhxpMckYxi65A0Tiaaa8kLQMtO2kdWc
         BlkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772821029; x=1773425829;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JKhWB5WYBOgtNloQxw0BE+V1Qr8Hll+qJ9pU1AjFn3k=;
        b=GN2gtKWt2NGahPTZB1F8YslYdGxduPRz0wi4VY63opHPO8SLntBzY43T+Cwr64YHhG
         UhWa1Vc/k8YuQjY9XB5pH+W3H4DxtZuUuxBEbVImw2014Nn4GgWaf2vJLB/3+dYs4bzk
         WDs4m5kOHXjmlOmgrEjdJ6QblM4x3cEClA3PsYDG8e24iYDEihhsvlpyKxk7JNfKryb6
         2W602FTZV/LtW69j9Ng6QZbqdvjTP/9CmtD74IeLEkBZDzodA2hsRdUFyv/p7r2dp/y/
         LX4oPY+O/qd58pS6lkxpPaz9f2mImY7BzKGyjp/zqmRuCcaNeA4hhRujFGeE78ZteoVI
         FaBw==
X-Forwarded-Encrypted: i=1; AJvYcCWf7lSzS3pEUPZ/hqMA4EJ/BDelTZnVW3+tuZd9PLlAgPAQedbmU33oQl6zWiKUEjpB2+ts0JNYOYdbIWU6@lists.linux.dev
X-Gm-Message-State: AOJu0YyjiUncsK2OME22ybeWqatEtI56kC3RoxbQZbuCZE7XiLC9jb1J
	h0via3r6ZeBW8BWy4u53PPn8+WVa/Ctkwlo/8Yea2yX3u2D7p+xSkbeRia4xaY2saE8=
X-Gm-Gg: ATEYQzxcpe2CtEFUiYp1OUmXAGlJwdMh7DJmpI4/US3MCEgPyYcTxN99jfQW4TC5pFC
	Bvz4Eqr6mIzNZWZYKvY8s/D8g+Qn9iJKod23vJa7VtWgDjzNiQVqjzTAg44yhMdEsTe766Zdric
	8KuwPuvkIp7pdK4GTol7HIt6a3pgJWT666hTJuhh0VSJf8SOhl0Ed+KR70D0CfQwzHI8z6FDrm+
	uperMr3mJJacsAUmBbBcJpUp/UHWl/9hYZYPgppWlJLDOR3vdJ/1B4Op+g9t/jOB4BD5HolWlTU
	Om8PlYx4DX47OBcoC08PUggLD5rWQmyUI8n7Ho+4Q/Uwku/A7HK0RQzvjRS2+OCNEKq1NJzu+Ww
	f0OzYblQitFkWH/qQH3pzH1u2Fk7QK/PzwvKxkNskMKWty2bsXlWZd8F9VE0ktrsKtowbfdBDOR
	ip4hmCuV6PVDSdGP114QZEY8j9Cd+M
X-Received: by 2002:a05:600c:c088:b0:483:79a6:e7e1 with SMTP id 5b1f17b1804b1-48526919935mr46682665e9.7.1772821028821;
        Fri, 06 Mar 2026 10:17:08 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fb27a20sm250849705e9.9.2026.03.06.10.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 10:17:08 -0800 (PST)
Date: Fri, 6 Mar 2026 21:17:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Richard Lyu <richard.lyu@suse.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: staging: ipu3: img-mmu: fix sign-to-unsigned
 conversion
Message-ID: <aasaIXvtS36ke9f_@stanley.mountain>
References: <20260306144307.670648-1-richard.lyu@suse.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306144307.670648-1-richard.lyu@suse.com>

On Fri, Mar 06, 2026 at 10:43:20PM +0800, Richard Lyu wrote:
> imgu_mmu_unmap() returns size_t (unsigned), representing the number of
> bytes successfully unmapped. However, when the alignment check fails,
> it currently returns -EINVAL.
> 
> On 64-bit systems, this negative error code is implicitly converted
> to a very large unsigned value (18446744073709551594). The same happens
> on 32-bit systems as well, although the resulting value is smaller.
> 
> Return 0 when the alignment check fails to correctly indicate that
> no bytes were unmapped while resolving the following
> -Wsign-conversion warning:
> 
> drivers/staging/media/ipu3/ipu3-mmu.c:393:24: warning: unsigned
> conversion from 'int' to 'size_t' {aka 'long unsigned int'} changes
> value from '-22' to '18446744073709551594' [-Wsign-conversion]
>   393 |         return -EINVAL;
> 
> All callers ignore the return value, so this change does not affect
> existing behavior.
> 
> Fixes: 26f5689592e2 ("media: staging/intel-ipu3: mmu: Implement driver")
> Signed-off-by: Richard Lyu <richard.lyu@suse.com>
> ---
> v2:
> - Added note that this affects 32-bit systems as well.
> - Clarified that all callers ignore the return value.
> - Added Fixes tag.
> - Link: https://lore.kernel.org/all/aarQeHfQuq20gXH0@stanley.mountain/

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter


