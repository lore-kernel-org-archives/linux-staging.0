Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3C43876AE
	for <linux-staging@lists.linux.dev>; Wed,  4 Feb 2026 09:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770198931; cv=none; b=Oaii/NCax8Qz7LbHeBT2dv86i729d7ssHm+i/wm4sQ+FbrI2eWcKCcNRqJm/soxM92zXxIPQ6JRt/xulYxw1yKnEIy2PvMDKJxLqO7vlU4NKfCEWqXT+V1XFkxDszniRVRqtOiZdsoVMorgbWtYpatIwmD6YqgqDUdfGO3HeTI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770198931; c=relaxed/simple;
	bh=fDc9+RnTuNqnqK2DLJw2MgkTQPt1U2igsoiMD6lUu2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MFmb6SUZ8aMel4zwm5kwDjmg1U8Sctn6duwrG+0G41jWhuOyhQfhMgnpclaM+MjxhEAUCHnkttAfbzHptXvLm2rxDABPMKvi/7QTMSFzmQdkWrT9dwNa/NzlU0f3ZP+KkoRwDvWPCo4VXoGm8wQo9nnh8OO1p5+5/TqtcuAHC/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iAaxRS62; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iAaxRS62"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4806d23e9f1so73572025e9.2
        for <linux-staging@lists.linux.dev>; Wed, 04 Feb 2026 01:55:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770198930; x=1770803730; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XzUjtBBrjfJBhBDao8Y/buom6ruqtjiudppkV5j4hu4=;
        b=iAaxRS62IfSk5FHkOKx+sqq/km2YgYQQjMH1sWZ+UY4ZGhDkYpXxONhMr9yux8/kee
         y2g83lAMGODUPQrzRmmIdVNjP9Y+HDs7UMjgJomXPBhpjP0jbhucL2J0dyzUnZuor7G6
         iH0TPz9RJy7MTgmOrItjXytgI0QWNmKtBcU5xlxUl5BRALJRExrniHt3w5hzGzYqI8VP
         FNww+qTBH8CDTJ9BhGtU5Ei0jfUDYST0HOFcEHOv9xMqVZe3KghWoTzyeBG3itAg1Pc1
         +nkbG7Q2st62Rcls6Xg4F51QRNCORlqkIWYZAhFAwfx18ZOqKRZDyzRXJ4mJfKOg8jst
         rPWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770198930; x=1770803730;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XzUjtBBrjfJBhBDao8Y/buom6ruqtjiudppkV5j4hu4=;
        b=ELRr9o4vtZfHNIhOPFIAB7dt2kO1EplDOWp6piy+E0YOZzs7gd5rmJnDBicbCUIxLT
         HYcPKTHw+IbUqREagwtCSVPDZyRJ7nryc1DIIZN8h7+Oku2c1Gg3uedHmw9mGVRi0AH5
         MTZNrZoqhpN8HXax2/c7gXcxtIGxjHvwNqlsp2TP6vlxhTWqu859GjpfN8r58pNfCjgE
         AA4TnUXYmRJCBffQpPCBhS08ORkDDL07M+ENFr3PdiFuq0v1kzq2gQV4VdgA4nMrVooc
         2EvQG7+MSZ15t1EvXCTXY+vhmY3oveQEmZuz/80K7CWhjAxMdncgo510dzzhckOY740D
         l81Q==
X-Forwarded-Encrypted: i=1; AJvYcCWuSkmRXUjt+6J0ZhIv4083MCv3uyY7DXn2ewjrNuuRee7mpUtJvlCBKFjqMH7Zvs9whq8NOgAhmqx8wV52@lists.linux.dev
X-Gm-Message-State: AOJu0YxR5a6DtfjjyYfhg4XHTYiJt4HAdLS2ApK79VDKTjexkB7CDKSb
	xEOb3tfQ1p0sbhqWlU60eJ40N43DlSF69xI5dXtn2Jy4xqjvXZefPSa63n5sutq6FAQ=
X-Gm-Gg: AZuq6aJRvFhTRQ8Fx7C934RWk1GnxJ4tYLBDsRXlYDXyNFs2VrvzQVTglLXX8a2Eoa9
	5YWRmdt3AW4w3y24pqjnvDJcAhh3wiSMfqXPpcMPTWy9/fWa9FWfUiYcsxy0QFeOKLK7I+XXNP5
	Niq/jzahLpttAoUkmGkQHoR0cFuLBtyV/rimEqF6TjiV/Abgevs5K2g5nwIJYXUhsPdjfKVzXn1
	YEf3gKc0MCl+ItVpwAG0SJ6/byuWJCK4lNqwwmm5Hx1lCu2qh+6czrIjsI8MqBNxmqXczV8Ppda
	A1yNIsr1anuhUVK6iu7kbrmjhzPapVLT+gyn3rLuPiAaSrZBAJb1+imoAEJaWi+vrviQEV0UWbw
	D8E3fuj1GKgN7OhxC3jI5N9B0HN5m3ipMaCZjZSxnK0+5sc1DhDFAKxZhOsppXJo6gjGqq7VYB1
	aoIrtfhcC+50Hveunm
X-Received: by 2002:a05:600c:358d:b0:465:a51d:d4 with SMTP id 5b1f17b1804b1-4830e93ec05mr37014135e9.6.1770198929624;
        Wed, 04 Feb 2026 01:55:29 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43617e3a486sm5477520f8f.16.2026.02.04.01.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 01:55:29 -0800 (PST)
Date: Wed, 4 Feb 2026 12:55:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Artem Lytkin <iprintercanon@gmail.com>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] staging: sm750fb: convert pr_* to dev_* logging in
 sm750_hw.c
Message-ID: <aYMXjuXKIPHVADeD@stanley.mountain>
References: <20260203230758.3056-1-iprintercanon@gmail.com>
 <20260203230758.3056-4-iprintercanon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203230758.3056-4-iprintercanon@gmail.com>

On Tue, Feb 03, 2026 at 11:07:58PM +0000, Artem Lytkin wrote:
> Convert pr_info/pr_err calls to dev_info/dev_err in hw_sm750_map()
> and hw_sm750_inithw() where struct pci_dev *pdev is available as
> a function parameter. Functions without direct device pointer access
> are left unchanged to avoid unnecessary signature changes.
> 
> Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>
> ---
>  drivers/staging/sm750fb/sm750_hw.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
> index ce46f240c..60f9f7135 100644
> --- a/drivers/staging/sm750fb/sm750_hw.c
> +++ b/drivers/staging/sm750fb/sm750_hw.c
> @@ -34,7 +34,7 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
>  	sm750_dev->vidreg_start = pci_resource_start(pdev, 1);
>  	sm750_dev->vidreg_size = SZ_2M;
>  
> -	pr_info("mmio phyAddr = %lx\n", sm750_dev->vidreg_start);
> +	dev_info(&pdev->dev, "mmio phyAddr = %lx\n", sm750_dev->vidreg_start);
>  

Same.

regards,
dan carpenter

