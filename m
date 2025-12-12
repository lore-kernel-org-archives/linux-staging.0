Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE4030F7E8
	for <linux-staging@lists.linux.dev>; Fri, 12 Dec 2025 09:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765531431; cv=none; b=bebrsBhropkwJaxamtvWsV2phWQE5uahOWtlOYMLFQMRfBiyG0u5HMXOpOzGqfHasQ24xKARQWaziD7Sw0gkHgrNOUWSlADAMPpArwlLHxrcE/r3CJed+cWKTtnl8L/arEApSiJ3RBLQXaUxs6+4Y0L/XLLBPW/8BewAccURx1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765531431; c=relaxed/simple;
	bh=pUmu5YYgJZI53LKWuHsTZlhBNq17Yk013vZCURf+aRM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kXKiR7MlKydOXGbtW8CanpwMHfkVTy8FOiFks9ptk0HLLMcIoAhF+kmVcsIlTZlEJqnnM+XVYBGSA3yphvyqFEhc6w3XzVZsPCfKFOiARC/1f9DeWbSBQ+sd4beB2W+94sib3ssH7oPUDs0SELJPOHmYXaCCaghORfgIuK0YrD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r2TO+7Gx; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r2TO+7Gx"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42e2e77f519so517064f8f.2
        for <linux-staging@lists.linux.dev>; Fri, 12 Dec 2025 01:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765531426; x=1766136226; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bMc6iMu0ORBBPfwsIOc5/gxE4MTIOFMRwhH2GjIgDPw=;
        b=r2TO+7Gxo02P9+j7GUHo8tegvWG/gA0yQ2coX3P3Pmg3s5uLZH3WcWswDqp8WI0+Sr
         OrmZYmfgCkEy6qiguftnSO8ZwRiAa6Qf5N2qaadoXv+vNYkX8ktI36Sy+DFWXa86cux0
         Db1QQa/SrnKHkotZohxE8715Gamnq2X8ZbdW6yLmZkwQgXVcSYUtUS/WYKVZmVewm4Vs
         obdMxLpQ1t6LeJmKY9E4OVOOEIr4DGmgvcm10klK+VX9KWEeJ2QVl1WhyNAJVXsH9rgn
         kdsSYu1xk9pKSsKx1WkYqkisyY7k8xem/lDaCZp6sCVCqRlaWU5ZPpnkwbbnXy+h4NVf
         XmJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765531426; x=1766136226;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bMc6iMu0ORBBPfwsIOc5/gxE4MTIOFMRwhH2GjIgDPw=;
        b=Y+jLUehQXKKFwdxcuKqdKImA8LZlsBk1DynA8Zjhb4IKLWMeiOhcd2rl9sxHH+5yaA
         ZNS0dMnNVdaHwQBzyeXLE11URa1Y1+TtHClhNupk7H+PNpitdNK5GLF9u1wDzTB0eu9m
         TwZQ9fUSWx5NeOEGXD3VLCQSuwruTtz/DrtYunAJqykvhy08l/6lKVUNkKchuzPDBcJm
         fMvdU0K7lIGm18nDb6anNF7mdVAS+6s2l4NERDZqsf6YAh/+aYlhfL0ArdQSN1JqiZmg
         VYVUpAeOpGXBN7VD8HmF/6M+rLxmMnqeSkE7md0uO5JVKOUA1WSflsmg+rRzHq64jnYR
         1koA==
X-Forwarded-Encrypted: i=1; AJvYcCWVu5pk4Lxp+NebG0DnaXDemzHuOgjmvb0Y1m+c6QcZXeJm7/JQSUzCTQWF3aGtJ1h4YhRtwSbCqOio+5+i@lists.linux.dev
X-Gm-Message-State: AOJu0YyGZY0KtPxZ59izc74wa1ingjZCmvaINV3MVNTP0aRE2BA8FtRX
	FLawIykCQLQ1QERTjRa9mwc76ArhI8bXCBhR8VlPOYYF39wEjeFop+iaIwjAc529w3OfcurmmQK
	eJ9Zj
X-Gm-Gg: AY/fxX7T2yP84dslZNBTPk4CvWkNErNGtELw+V66R8LGpb6UMFHFaMOGZAFYF4e/9YU
	LJBEUV0FOWF0aXQIcpjrm2zeGDuw+wLBsMGsZZQwvQ5lFZd0yx/EQWj0b6JyUGoVE9FffztbEVt
	YeL9FXcK+lyePrG7dc01Tj8G9cB+CxnYSDIhI4Yni0q/d5zs497h3Q0ItXirdyZwXX94wW1Kiju
	m4TSGbhVNX3NnMRvZK9pGb5P0tu4Uzne5YoyQ/I3AtQir5aQMF87LXPCnw2EwR9Go2xLn7RgPug
	c7cJQ1S+DEr1YoGOekWBZ6nIRvv8d1E1eXJC1V6T+A+9CzkzStDioMtD2ha9qOesRlx6lvqMMbG
	4/9rOOmpeGx0tdS6VeBM0c2iS+kbD5feDtDaxZ4MLzDxbTqRgJPlmOJMOXy9tUmLucBkY7CPJZz
	7e7yZ+uTqkNg3kJsFXNxaa1GfZLQc=
X-Google-Smtp-Source: AGHT+IGyGi6GtcanElUSbdpdBuCTCLxzjBEe65AwAMydnmnIMqK4IYKr9EV/HpJTdhOxZ7j6PM+wSQ==
X-Received: by 2002:a05:6000:2401:b0:42f:b219:2f2 with SMTP id ffacd0b85a97d-42fb44bc2a6mr1461470f8f.25.1765531426398;
        Fri, 12 Dec 2025 01:23:46 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fa8a6fd62sm11842098f8f.10.2025.12.12.01.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 01:23:45 -0800 (PST)
Date: Fri, 12 Dec 2025 12:23:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix memory leaks on
 rtw_enqueue_cmd() failure
Message-ID: <aTvfHr0E7X4fU6HD@stanley.mountain>
References: <20251212090920.84238-2-giorgitchankvetadze1997@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212090920.84238-2-giorgitchankvetadze1997@gmail.com>

On Fri, Dec 12, 2025 at 01:09:21PM +0400, Giorgi Tchankvetadze wrote:
> Add error handling for rtw_enqueue_cmd() failures in multiple event
> reporting functions.
> 
> When rtw_enqueue_cmd() fails to enqueue a command, the allocated memory
> for the command object and its parameter buffer is not freed, causing
> memory leaks. Add proper error checks and free the allocated memory on
> failure in report_survey_event(), report_surveydone_event(),
> report_join_res(), report_wmm_edca_update(), report_del_sta_event(),
> report_add_sta_event(), and survey_timer_hdl().
> 
> Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>

What?  The patch is apparently against a tree that doesn't exist and it
just messes up the indenting.

I've reviewed some of your other emails to LMKL and I'm wondering if
you're doing AI stuff or something?  What's going on?

regards,
dan carpenter

