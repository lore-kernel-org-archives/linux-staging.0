Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9ED20127A
	for <linux-staging@lists.linux.dev>; Thu, 10 Apr 2025 06:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744265987; cv=none; b=uo0YuPb3cJaLRF1AZRn6dj/CliUMW5wlQhT5vAosDSJKwVNcExjZwaOfuy+rVjwis9mm1K0eoCUnueaHP0p7tTK1ELrnV3g8/Le4bQz1mxjK5gpT529ykRX6tvea/L7bCGZTYvPfHCh/jkEOwI9F0JYAXKDSAZKEeyO9l2SUZ94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744265987; c=relaxed/simple;
	bh=fNKcWfeOv5X1UZBWJNkpzhwgnAdoDWDmVg5nRct5t9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a5FoHkyROZsEWLbAavFMVetXuc9l25sR7mwf2aHTy7unwE+ELiZAiBhRuPaW8r1NUBXW+qF0AvwPblTwAZ1NF0B80rsQvytoLNgjYNSHTSmGvelxrBFeE59BATiL07cgXJpKb3cI75PQPx9i3xYWleepz6oNaMOHrToxWs+7Q5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TKVQnQUw; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TKVQnQUw"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4394a823036so4339105e9.0
        for <linux-staging@lists.linux.dev>; Wed, 09 Apr 2025 23:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744265984; x=1744870784; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fNKcWfeOv5X1UZBWJNkpzhwgnAdoDWDmVg5nRct5t9Y=;
        b=TKVQnQUwye6wJv5hyVbLDZh8srvRR7hfNJK7TMHv6RrF+Jxu8DRrh/eBWmoeQEplwj
         uDZs8kBbUkSr1Lvv1hbPEG7c2TpUGsFgRcrjLtFgPpRpJjjxZvJYKEHeXQNk1CLtuFBB
         2x64ccRaj5SQ6Sf1oJt8Sv5VoHAG8i5wdWYy3bhxJp8AbLPEfkYeOFixZkgtI7xSlIuS
         HkmxQnTmtqw0anaOdO5fxdcE2amW5M8bxFD/hUax26wWpN7UOYB061w3Q9VauC8CLBx2
         V2BuXtFllYzD4Cp0XfsWfY7Kc5K6zNoa44KXdjR/+d76uq4pxTiS+SBu+HHvr+2KSub7
         0e0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744265984; x=1744870784;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fNKcWfeOv5X1UZBWJNkpzhwgnAdoDWDmVg5nRct5t9Y=;
        b=B76znWTIK6eykQZN8hBPwABXw9Fr1YDfzZSS/fiv8rq54nesTsXq99s9WLuZ9sp37m
         lq/Ccmc6Ssb8v4+h3Yv7eNPvbgWg1FLrV6/RnEcOnjXr8X2uv4pEdFq28mM/WNowcGf0
         MmkHeihW4SoPliG4a2X11w9nCsVC9V1R34f2lEA8imlGL6CDdV61e72Oj7wr9zD5Q2Rg
         FkWLlUaeHeoOtTQwmGu2dMJXvQWBsR4b2r0Q5jbchJd+7kwuaUpAF20otV0Btj7/6xm6
         Vltvglms3jzw0UHZ9A+yNt9dx0UYlaB2LXC+Wd4j40WbakVyij6wmWzB05A+Ep/GA4ES
         YZWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWugrMcZ9+PZvoIl1/7a/JzpT2wcqmkNo/NHSoCSamKSmR0k+EpmvjM/NskBdS7Ualj9qDVWrxeFUxllTt8@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6BAD9CTYvZMNwvV6l4Lko8SCzhiCEDaqWJUkQJTANfSCWogNK
	PdWshg9PhoNzWFrejMC8P/NTPPREYkYyF++jUubyuOz3FHwl/Zffx07fv72/1cI=
X-Gm-Gg: ASbGnct9GUQnpNwUa4aj+ApH7qFNTPnVHUjS8PMsGz81RgbhJUeFyuguIc1hnpWlk7x
	KgpKjzQtBWaf5ftAUJAbnijHkQ4ODOhUIlx/xgUd2Gi03u0NxN0UjbbK2xMuu9lfPFfkwsvpAow
	bNEMgGRlwLLLVWzbGWMSt6026zF5X7VSBsuyCpOeWBlqcQTfc+6P8qU781oHBk7PYIXd+Fr709z
	MeIZtez0gDIX+qKlM3nXhiO583EpdQfri5F+rRuqfA8IzXZqE2ldoY/myk7aCoSGpjARv7sG7+X
	QwErynuB6QZi5/BZkEhypi1CQCJadOUhi+hFwgtA6qK4BqvNc/g+M3GE
X-Google-Smtp-Source: AGHT+IETxKgteFp+KK8rObwmu67CyaszSv6hN7I3pcGlN+mzeZYmJ4TDp+koJRpZX2WmH9ySINK8Og==
X-Received: by 2002:a05:600c:b8b:b0:43d:4686:5cfb with SMTP id 5b1f17b1804b1-43f2d9604f3mr15862495e9.27.1744265983907;
        Wed, 09 Apr 2025 23:19:43 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43f23572bb2sm39720035e9.29.2025.04.09.23.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 23:19:43 -0700 (PDT)
Date: Thu, 10 Apr 2025 09:19:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Siddarth G <siddarthsgml@gmail.com>
Cc: slongerbeam@gmail.com, p.zabel@pengutronix.de, mchehab@kernel.org,
	gregkh@linuxfoundation.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org
Subject: Re: [PATCH v2] media: imx: Fix NULL pointer dereference
Message-ID: <e4252054-69e0-4f65-bb75-54ba4a24e5d3@stanley.mountain>
References: <20250410050543.6963-1-siddarthsgml@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410050543.6963-1-siddarthsgml@gmail.com>

The same comments apply.

regards,
dan carpenter

