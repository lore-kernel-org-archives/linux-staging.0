Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8949C39891E
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 08:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777277939; cv=none; b=lVeew/4SBmeXQEEvCxJsSOvAj9WSZUw5axsX0eEGl2vtrKJnws28MED3ifFYhwb9Fym2lgDf/qyqElSazR2GUR8X3L/ojJjsd/dlSYgSraKV2lJla93yCtADvTFe32c8PinUAzQ6I/lp1Axbx/IrZBTCW1tKcKXdPVRRoGIS1yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777277939; c=relaxed/simple;
	bh=T0sbXkSjL1mT5QotmfhxZTftm4nSnzjJ+BmkUXi3jYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KNrH1oSftD0Y4AYzGThriHdpZge5jiqp0xA7x1k8uysRJq/MN6wEOhJPOPYvtW7wnSlnZSEe6vNnRvDmVKByr+7uIkFESdAKZ7yH/4YVSIt4vIrYQ5BmHux6onNC+uXT7llPRuWKZvGXqsNAkric+0YD9LwtfloTROE+ePiDRLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LP4qyk7j; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LP4qyk7j"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso72046765e9.0
        for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 01:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777277936; x=1777882736; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OcwOCXeAR5ogbgmVs39szOKmOHLVy+rS144H43uqveA=;
        b=LP4qyk7jAJLi2yfzWt/2ub/ia2NGGywoazGN57OQH51RqeQu19Algu/6KU7zwaP/W/
         jpr48QkDQKEudHr1Sir1clCSRRVidtvWd6JvHSYnZGbNLGWjKU/PkXKDWV55ivWqdPN5
         ElJNFywKa1HBu9sZ5p8/1BpME1D5eUy2f18c+C0vJzkNtNBAxpaz0Bdfo3kVruPthjQG
         wj1wJrscPNQjqyWuA+HtW2MHiiqDyGhZ6zBj9swpCyHCky4KHbSexmRlUNBlH6dPx6yN
         uFU+cVhqct1/WJT2/zRNL+SAim1Hpy9CcMKTNa9R0pqypb58GpiVc7RAAABcyYy9IPYv
         ZXHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777277936; x=1777882736;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OcwOCXeAR5ogbgmVs39szOKmOHLVy+rS144H43uqveA=;
        b=LoLd/31cIw2dfYBhRG76ZiMrYz/WDQF2WTosNDyEV1egNAPr3aL8ZDglfehkZuMuK2
         H84Uu8GPr9UEHzpYHb7vlYa1V1Lu+Sv2yKKNg6wKj2SUhk0Ur3YDfVFAw5f/wCZtPFwx
         r7cguoe7gK1sdIazHkHGLTRMu88LdGUsd0vP6UIjKX7/DB6wm8Ey5L5UQQCKu70vra8/
         6pt9AS3kMDJWNgrhbcFqBc3pH6U18N5t1MUgBWXrxiGQg7gc8Yco+RsV3CyqHweQVHAP
         oT2WIoKvoh2Er0bw69kJhY5SFXGVhGEHi2/OSN4rgShHMkR4enOZJdXlWrWfSNc8oDAo
         /Zaw==
X-Forwarded-Encrypted: i=1; AFNElJ+Kz3OYT+OozNbK8Nx80MnPE0MKLuJbZexdrDGwWk7H3obfYOx6OBM2ekm9JT7kh034QGDD9w6KMPf9I/of@lists.linux.dev
X-Gm-Message-State: AOJu0YxZykhXIKEPkjFIlQfQeA71a+rNlfM5c4XldlpanS+9H/haKi5o
	zp1yqSzmr5e/H4xAF8gfC9KBE14h9o5lMqFgocidjMJxXdM7zK4rIVXn
X-Gm-Gg: AeBDieusehRJG9kEXdXkCEBh/HnbvRylldisGEQzru/iT+13WVomvto6WHC7pDH+VcO
	QyVgi7Oj/5kUEDJvTm0f4Z9UwDVhBes2a3qNzcDszUcvUGfjgCPp/xGyKhkTnOFziMNuI92njuW
	jzaZskK863dTOwRi0RfZpA+4UxhIBmiIFZ5BueXbfCO09VlCRZyb+w7Zvnu/Gw74zIuDqhuGc0U
	Bewn+6YJR+eCtVnE3PdrU15KWmmcYxUP4pt2LzLXpkzcOBKVEBlTJPT6DXbgvgwoNi1ghlqb3re
	VcOhACIbmwJjXul/gkfdDyJoN/ECGTQ6Buox52h2m7UcDq46g/cioSU2a+HTb5LBTNJ00Fm+e6s
	pmeEOOvErcNW2hiynU/8gg9UiGpx/GB0CzdE5iftu9TjwH07ocXihiVz5zCyxx1VKGviRjcjXRE
	bkNA3Tf+tEGSkcdejRj5xfLMMZUBnhnw==
X-Received: by 2002:a05:600c:5246:b0:487:219e:42d with SMTP id 5b1f17b1804b1-488fb750a1dmr588591455e9.11.1777277935677;
        Mon, 27 Apr 2026 01:18:55 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc1cfbf2sm814399735e9.15.2026.04.27.01.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 01:18:55 -0700 (PDT)
Date: Mon, 27 Apr 2026 11:18:51 +0300
From: Dan Carpenter <error27@gmail.com>
To: Maxwell Doose <m32285159@gmail.com>
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org,
	gregkh@linuxfoundation.org, David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: iio: adt7316: Add error handling to
 adt7316_spi_probe()
Message-ID: <ae8b6wdyNR-G-i1m@stanley.mountain>
References: <20260426205039.125818-1-m32285159@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260426205039.125818-1-m32285159@gmail.com>

On Sun, Apr 26, 2026 at 03:50:38PM -0500, Maxwell Doose wrote:
> Currently, the return values of the adt7316_spi_write() calls in
> adt7316_spi_probe() are unchecked. Add error handling to return early
> and pass on the error code if we receive an error from
> adt7316_spi_write().
> 
> While at it, move all three adt7316_spi_write() calls inside a for loop
> to condense the logic.
> 
> Signed-off-by: Maxwell Doose <m32285159@gmail.com>
> ---

A lot of the time, functions can't fail or if they do it means
you need to buy a new computer and there is nothing the
operating system can do to help you.  spi_write() feels like
one of those things.

Plus we wouldn't add new checks like this unless they had been
tested.

regards,
dan carpenter

