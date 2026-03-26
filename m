Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2075A340A6C
	for <linux-staging@lists.linux.dev>; Thu, 26 Mar 2026 09:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774519200; cv=none; b=q7SZKHj7s8hp0Isb5cyxaNB+4RznM+mGwuE2CW5QMZNChQAc/q8pNWBw8zR4TvfmBCxTNJL77q9OsIUxbFpAmNjs/Myc5Q9bOmd7eP8fcduWwDso+gDc/FqN3HOg68r5vC3CnDUGiIAp/Dj6neBJopeOohhRGwPc+P8Wg+Y+eiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774519200; c=relaxed/simple;
	bh=Pj5h/oDu8ID7Dw6VRhEPZstzuIHIZyMvA7LInc4eovU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hm6aF0URNF5ZNzfj4IiVpvok5PdCCWdPncjbtxufxfw08NC8y2jk97D4Odh+OgvpnYwtHe6nlSiApLBC39CI+iJ9s5DC7Zws7OGGfYPmq7tIZJmdtymjxeJBX8YM2dgtVS1xxG6/tzN3RZBQoqMmFBx0MgQ1aqiFEzo7zv6/oZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dEE5Vq1B; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dEE5Vq1B"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso6793065e9.3
        for <linux-staging@lists.linux.dev>; Thu, 26 Mar 2026 02:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774519197; x=1775123997; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fXbM9LKwktfrVnpq6ZaZDntXsBEfIV9FPgOfN8uZ+I4=;
        b=dEE5Vq1B7wbXKkbQKP8L3XAJj0cwotV6KpDlUaqEW9ZEJ2ixWno9oMdPrAXxOgQWp4
         Vz4D91MTKpGdcaxzuLf9aam2FcnbhJDJA5HBKNX+pZ1i5wq8zYpvBdpfJ5Xd5lpovOb1
         LujkMJRUDzsNw5mtwF7KnL5JUwHfnAz3B1k8W36gWf7BD/7SlNDlb+9OA3ATIQ7GMEK9
         QBY6sxAtUL6ZK5MBHt99FU4nDtUYCHvGcPlDzFwKS0ZnRRlRNuF2aXFLBI40925TIx+Z
         Ph9jgtaseOnCJ4A8R2xKcYMEE+5XwsmsoGK4DMDvxKqAaAgJoS9yIg2Nwd0PT3mq5GMQ
         f/Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774519197; x=1775123997;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fXbM9LKwktfrVnpq6ZaZDntXsBEfIV9FPgOfN8uZ+I4=;
        b=AMg1HHDafZwrn12AfuWsy8k/Kj1zpLGKx2sLlpInxa4bQj0ZcAMVL8X00X0ClxT+lv
         /zNJ5UTsNrsdrwhRqlOb4gtlLPlY+dFPYXP4oEwX7KwX/NEqpgtqWmQNPmOHQmqTOk+l
         NczW0Llt+1U4BadYqIdZNv4yWJh6yuVogbBJyj9DY7yiVgTQ/n4nGbnBECzWlazbAUGF
         KbDuglpUzC9nRr1b/8mUpavJgbTgcVLpwHc2zVuOnGqTXmgIYJ5AhDXgRJWC7SY2I4hm
         Q9aPUA5Ew0YHw4hGUN1gqDkYV9okSt5SonU3/7A1SvY9/WJWmJLYj0GX5wZPHlqFe4xV
         6OWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDRL0aIKvlPbPYsphlDYk3Fiyt2uLfB0gcHiXQkDvOmX7K0o27IbJgHKfkIcDUxtpoyPlNnoJM+SOL9v8s@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4LCr2BH4vZF4S3RkftJbYDp8EWkfMQMVqSA/hxK58qbt+D6on
	c6vC1aIrXVQPWevz6UiA6b+2ETmL8hlDUtjjyJQESwBSW9ztRiQG5o0b4bapYVPtZBQ=
X-Gm-Gg: ATEYQzzl2xCalk4T03jFjWp+oZ/3MTjXgxl1r37GCBF2yHCbmgydkfDEtFnCD16BiRY
	hbAGYO8bcP6R01knuQGF3cjnZgTuaws3WrH1f7b1SgxBzUQJvAwlfMd0ulJ0aXO/YX+bp5/Dveo
	j4ajNrtt9NmY5j66YEi7oCfOps8AVoNpnCGRo5PbGS5/jKDjIQB11G4/qJVourv9IvQQnaUCBUr
	Sai4ocOZghlOWB3vpb5iJzbiAt7G5hYsYEXAs7Iv8HYfE1KeUFo9B5dCTWq3N7YzEoZtY/u5qIf
	mF470nCVfgKJpBlOoLzGUJZJhETLkXsm0+J5QCylarTeRJLBnLKokzUPxcdoZ15VZW6kbhZF8Xd
	uyurXY07hAKSAeO64sMXVh5fLvF9kBXot+PLXs8yy0P4IsT4T/BRF4squmx4IIMboIxmT0Jb2Fn
	tyVM5iyeD2obiGgpbuy8x2lLRcS8ZE
X-Received: by 2002:a05:600c:a112:b0:485:5c6e:8a38 with SMTP id 5b1f17b1804b1-487160429dbmr83472295e9.17.1774519197406;
        Thu, 26 Mar 2026 02:59:57 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c6b4d0sm21168265e9.3.2026.03.26.02.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 02:59:56 -0700 (PDT)
Date: Thu, 26 Mar 2026 12:59:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Omer El Idrissi <omer.e.idrissi@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] clean up error handling
Message-ID: <acUDi8Mi7pw3KNBB@stanley.mountain>
References: <20260326093607.13011-1-omer.e.idrissi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326093607.13011-1-omer.e.idrissi@gmail.com>

On Thu, Mar 26, 2026 at 10:36:05AM +0100, Omer El Idrissi wrote:
> This series lets sdio_init() propagate standard kernel error codes 
> instead of returning _SUCCESS/_FAIL.  There are two callers for this
> function.  rtw_resume_process_normal() already returns negative values 
> but the caller doesn't check for errors so changing this doesn't
> affect anything.  sdio_dvobj_init() returns NULL on
> error so leave that as-is.
> 
> Signed-off-by: Omer El Idrissi <omer.e.idrissi@gmail.com>
> ---

Great!  Thanks.

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

