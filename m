Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F2E383C8E
	for <linux-staging@lists.linux.dev>; Mon,  2 Mar 2026 09:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772442206; cv=none; b=PI2SiuyQEq0BReLhhX0hPdwi9M8UoQX1Wt7YGOkai3e4l76D6ci2BKgsYHp7pPcm8qUDOI+4K2LPAse/ptMY+sGtI4FG9EPITygfDC5KditoK7/2HW+7yw4iBwITErc96loA8LjmJUK+EwKEQK2OYRmyl7xqwY+UlGBW3q3V8m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772442206; c=relaxed/simple;
	bh=jini1gmWrHoKbvA0W2Iq6pdC7DPo2efUtewaLTVVXk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XC6yodyAligFSVFgBUlTAvR6M8VxGPhhan2gzXDN8lEIa93u/0FFXvVldmKS7RmgIxpKOfy7CMwC3dRB0TuPjf0qRQF6PZb94tfGh3dZtvZdfuj7cSquFmgBrxqn7yMwiLzlnfTlR1AWVcNHe6sOjg3038e8hb6x8/chP5iXx0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=arG8qR66; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="arG8qR66"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-480706554beso48432715e9.1
        for <linux-staging@lists.linux.dev>; Mon, 02 Mar 2026 01:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772442203; x=1773047003; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yqW1YsLQJ71Pun51dph/3MB6pDimJxfVNcUYg8pyw58=;
        b=arG8qR66FXV6e/oqBY/pAcQ3dxb/jCMBQ4RqxXE96gCKX2RaW3iL2HpGiqOiPbftKO
         SMGg6Mj7frEGzLXnrXoyZIOhy9NWKi5U+nfFl6fq8kDmJJRGpaxEuFOOm4SE/FndF7jK
         7Z09d7QtyQ7DQ8tg3+SNVYcYzRHB5bB3z0PoRqQ7VVCIties93WK5gaaLiKGD4ca038n
         /2DYKMEWegBpT5VyBAgnyKraka/UWJ4nbVtKItMKyaUgGgfFEyc+jZ2Wo3jVkGtG1Zr4
         V/nwFfP9oj/bI4dPilBdGUj2xIF2A8r1mR1hfK0GLDXxQ1vGZJS3Ts3llKt4HeoKzNpb
         OVjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772442203; x=1773047003;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yqW1YsLQJ71Pun51dph/3MB6pDimJxfVNcUYg8pyw58=;
        b=NtvjEuWJ/LWvDgGoGIQ5xFEq7SXH7LkmfLHQ7LDWl2MmxS5BmXye7kLtk85y/c5X68
         1T4K+63u+2mUC0KkCICCzpvbHXWZ6Q/QYTA70G9DRAj4eyC6mTdyxgNyisFU/LwnHlOg
         5TDTaOG60HpsHN+bbdnLdJFADuPzmZ2U2HUP2x6Adikn/Nx703aBzbiBQDcw+l6zQFvt
         zfLx22pdlKDeF36hWZf/GinpmxghA49sYreViQRhGsTZs2ZXZyns9vVp6OFfmUoj0rJn
         wkRKGYuJ7D11u1Px0GunN6ufMuFqu70TfXcWFdWn4xpXavljLBbJUbg8OQOWL2/+DJrw
         W+OQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdKB/VYsN+I6mcDS9RbBAHEK14Rzjx3Vd0QBbCf8bnlAgDI4n0PCi4SYRtNZypERqihdlVBv+LrsdWmc1J@lists.linux.dev
X-Gm-Message-State: AOJu0Yxh6ITAioN80urMJvzGI+p3z8hyTLY6YQL+cwDhj6LXKkEoHuSk
	AOdXfstto3LwC36OQSPS/tUS99gP+3zmB2UW90Gw/09uHuwb52QR14eofZ2/QkXMgkU=
X-Gm-Gg: ATEYQzyHRNqD8Srjqh+wTmNCrKKCFMNw2X8Z/jP8H+aI4fADbsShp7ukkOCxcM/aDVE
	Fp62BqzXrfdKtqoeSe3wu+ha4A2sOSAK9/U3/xWvO37n6B9Aqm5W87FdEkuBKrKow6tFglfTvRO
	y53h369idbGPpLkkQIS2GyNfjbS0jVq2xZynhql+jOdS8b+fYHRK0bMO486FbO9Nj4cIalM57ky
	LA4upinsr1CQYTWmuJBIiUMguGH0HngWzMRkIGTmUY01VPU66lPl0B2xl+mE0t155X5955j34na
	Q0QqZuwS+3Z9rYZyqJiquk7SSNO++AVHBW/E7K4BzLYUv7SDXFTkjsfex2WB5YWIE7pct/h0VZH
	jDerOJRKywklAD4Bl2z34fThFpFnPqEnGWDNx4mog5THEPDIb/o/H+V2BqjakBlv6NnOhDpuMfs
	4pNk57KWgxi6Bb/LzGXEA1Fj4RIiIC
X-Received: by 2002:a05:600c:3b18:b0:483:612d:7a5c with SMTP id 5b1f17b1804b1-483c9bc55b4mr184465955e9.25.1772442203208;
        Mon, 02 Mar 2026 01:03:23 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd68826asm633389215e9.0.2026.03.02.01.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 01:03:21 -0800 (PST)
Date: Mon, 2 Mar 2026 12:03:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jack Tanner <jtanner0786@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] media: atomisp: ov2722: move sensor init from set_fmt to
 s_stream
Message-ID: <aaVSVhKPxGzqyuPv@stanley.mountain>
References: <20260301041728.577647-1-jtanner0786@gmail.com>
 <20260301041728.577647-2-jtanner0786@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260301041728.577647-2-jtanner0786@gmail.com>

On Sat, Feb 28, 2026 at 10:17:28PM -0600, Jack Tanner wrote:
> Move the sensor reset and register programming from ov2722_set_fmt()
> into ov2722_s_stream(), which is the correct place to initialize
> hardware. This removes the ov2722_startup() helper and its fragile
> retry loop that attempted to power cycle the sensor on failure.
> 
> Signed-off-by: Jack Tanner <jtanner0786@gmail.com>
> ---

Okay, fine, retry loops are fragile but it was solving a real problem
but instead of replacing it you've just deleted it?

This feels like an AI patch.  We've had a lot of people who 1) Find
a TODO and 2) Ask an AI to fix the TODO.  But it's like, if the TODO
were so trivial that an AI could do it, then the original author could
have done it.

regards,
dan carpenter

