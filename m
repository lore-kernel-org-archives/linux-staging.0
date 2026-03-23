Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3901537C110
	for <linux-staging@lists.linux.dev>; Mon, 23 Mar 2026 08:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774254762; cv=none; b=gC+fXE8LQ4WOF8HCyqHb2BDVcgf3qW4btm08Q0W2pZcgDfhAc6YVU4mD0HOrIzzTCPJMn1bkMNnHnWyWwAf/vL8S8rZ2uKW6y+kX8edYYbo78Fi0twbLjhbo1q6J3P39LuAmIKdGJ128iFHUv6P/ctJns6SWIPGB3nw5HFdCA+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774254762; c=relaxed/simple;
	bh=OM4/8EjqVIC4YfRgUxJxtAfGfU91Jx+od/JJ0lKT8ys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IAv8GM9VxXTtQ4aoBzf5ttJzMebCkgjGAbWn+PcaaZI5EPst449gaQ0HzGPRrZatEQUwPslsxf6bPdqGcZZWiAXRz67ENy/k3bd5ooC6oA785YxQtg4SEfVw2AtTkL03Yjtzw5AHxcVYNdSIAFvT8kIJusfRNmi+E6jI6gfJva0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mmssKTHr; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mmssKTHr"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48540d21f7dso29665765e9.0
        for <linux-staging@lists.linux.dev>; Mon, 23 Mar 2026 01:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774254760; x=1774859560; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fr3pV3yyRiJVOwrQfx1saRdyigbk5kS5X76An04qniw=;
        b=mmssKTHrT1YUhA8XFDoa4N3B3w8mmTvpEk41xe0M+2bubgJEV32Npf8hbmkyDroSm+
         3i7cz/60Eb7DsZLMZmAddAVoW07jv+Ugc3XZFNzZ0/OrC5xftgBin37EPNL1MiLzgefr
         F/f3zj6Dwos6VXXrNzgREbGUO7RHpfRdJWDPeIfSbvy9WYxRWU+L5ZsSLnj/n5FmioZg
         2UDNnmkG2jk9tNecTyYGS169ePZtQGxxgE9rhtX1wKGxlgUnzDJs14Sbthaa+bCZhQM0
         msGY/qpIySM8GVCyWV0EcI3QWb7Ix4fMuo3+/IGQAEZ++VSkyWJo+fk5mmjYIsPyw5kY
         H/5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774254760; x=1774859560;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fr3pV3yyRiJVOwrQfx1saRdyigbk5kS5X76An04qniw=;
        b=YDtCvO7iDD+PU5dw4yLMWxjLg+2sZyYHqnHEK/Pyl2/gbDVupgM95EgR7ieg0pMfht
         2foliYV1asxNRECB0Om+g77R5JXuEx0iQgZuUMjtb0boQu8l2MeGKkQjh4cYBt+vlXNZ
         2H/sIlFizsmm9zdMDC0lAdCPJ/HrfJnhzszdSp6Q3F6RJ6nuwVqQBq24iufUY0sIhNC+
         7B6j50Yvd9ewgw4+4gMgNKYs+bxyrJDxvv+SBN1dGXZDAWaYPGy5xNkW0/KDOXIy6iRA
         LKs6diPC3Oct3BuOk3GazHH/42IYOd0lhD0hRXISRBSTAkE04X9ktQIb5eZclVjvYrl3
         HnrA==
X-Forwarded-Encrypted: i=1; AJvYcCVOUn9v9LLVj6sVPTFVT+eTXRJy0r1FT4hO/1ytk6lIpN8MDwnxN5qf77a+kDgmiZA1Eg8SGJQS1KvOPJ0i@lists.linux.dev
X-Gm-Message-State: AOJu0YxoDm2dNCQPUXc0H4S2GnC/+yiTAkIDQxW1aWrB4GFA0ohYrXNk
	oTb3MbWlQw738nXayAg8f4LdZNtAfpz1vgekKFhWI91YtdIM+vvnRfmZ8rSQwKmsVsI=
X-Gm-Gg: ATEYQzzwmgnQzYT95uSuvHHdvlQd5hMXr8pJ++YMz4Hj30Yv8q8ZqVWqq3fngnzPi90
	mZjyw30WSwXc8zCYUrfTU7qvzMUER7ynbW4zVIW6OaW0uGAOk5VO9hwdDqbxA6qpKqqZpdH2psa
	e2el0uVU6N2H+HaQgoEWpQOuDsI931XlxzBEs9kvLT9DftQ+eGTgmm0vDNYo+QqC6Z8r5ken4t5
	RMyu0V3aRJvM/mm8OXShHIzV5Kb9BBguQiv0gc4iqDObpbBh0VPVjIipGp/7S5n4vcwayrRAuzd
	8mFhI45HFNWxehufQn89s8XDP/K+pZQQHf5fEmH1EoSDV+Zq4TOx2Akcs+xir61C2Xce0+oo5li
	AFDRFtk3pIXAZuR1BCNAPABfCaZwhc6abqKpFCIY8DBRuGBbI9HWhFmF7siQbHLWAU2UtzZlZ9n
	1DZAn4FZYl9J6dyYmrxvY7NoMHGNjX
X-Received: by 2002:a05:600c:1e09:b0:485:4526:ee06 with SMTP id 5b1f17b1804b1-486fedfb677mr162420025e9.11.1774254759594;
        Mon, 23 Mar 2026 01:32:39 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe032a55sm515752485e9.7.2026.03.23.01.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 01:32:39 -0700 (PDT)
Date: Mon, 23 Mar 2026 11:32:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Junrui Luo <moonafterrain@outlook.com>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, Yuhao Jiang <danisjiang@gmail.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH] staging: sm750fb: fix division by zero in ps_to_hz()
Message-ID: <acD6pMfM9XjTXdhf@stanley.mountain>
References: <SYBPR01MB7881AFBFCE28CCF528B35D0CAF4BA@SYBPR01MB7881.ausprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SYBPR01MB7881AFBFCE28CCF528B35D0CAF4BA@SYBPR01MB7881.ausprd01.prod.outlook.com>

On Mon, Mar 23, 2026 at 03:31:56PM +0800, Junrui Luo wrote:
> ps_to_hz() is called from hw_sm750_crtc_set_mode() without validating
> that pixclock is non-zero. A zero pixclock passed via FBIOPUT_VSCREENINFO
> causes a division by zero.
> 
> Fix by rejecting zero pixclock in lynxfb_ops_check_var(), consistent
> with other framebuffer drivers.
> 
> Fixes: 81dee67e215b ("staging: sm750fb: add sm750 to staging")
> Reported-by: Yuhao Jiang <danisjiang@gmail.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Junrui Luo <moonafterrain@outlook.com>
> ---

Seems reasonable.

There is no Closes tag.  Could we get some more information about how
this was found and tested?

regards,
dan carpenter

