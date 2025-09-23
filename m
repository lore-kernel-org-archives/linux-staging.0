Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1007C30E836
	for <linux-staging@lists.linux.dev>; Tue, 23 Sep 2025 05:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758606222; cv=none; b=XMCU1RYJ/PzTDEMbWKew14rUyI5hR44jGQ7zthLz7/V4tPT7+7TUqAWUOa3AIwnCsthna9+RdZKWWWSKhX5jPNWzW6lIQWx+ehdd+thUtj2Z9CUE8Vy/sHlfH/CTM19kSHNUcFR65EZ7c1fjKSQbwZ8aUewT1q58MjIKkG1PVdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758606222; c=relaxed/simple;
	bh=dVn9dbz/kO0mpv3IScTeJpkZ1v06TqC3yVwrf6YJ8Uo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YCFCLj6lMIIGUj+tCFrTlRdeESEscs1LOGetfc8/2+TIOdZtcjz90HZkdpjbFlJspS/5IMazeV9FGTsoEd5DECDWClz9hjBDrDpfbYSPYZ+7OrCp4X+EtCyWs1ob40gh+AriyTpayCsRqlgVdrUgxrj6E1potfMzOOnl/tIT+Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xc++tOQs; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xc++tOQs"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3ee12807d97so4409012f8f.0
        for <linux-staging@lists.linux.dev>; Mon, 22 Sep 2025 22:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758606217; x=1759211017; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NCXbeilKuthgziM3kejQj1ZvDe5vwkeMiKIsYl7n/j4=;
        b=xc++tOQs//6s5+UOnLEi4jc6g0icyp5k37W13pGbUEOjfEQxhGUP6xB21j5ZpiZYzC
         y2eXARtUZTPvURamccc7EaL8+cLzujQlo5cylyUTLHEafnHXb7i2Slg/DApERhJKas0/
         WYL38Hov6OHkbQ5d96SIUsY1sqNiBoPUYqNU6Agblb+OgklbnNsdVCFEp79MNLr0qFjQ
         cSGD89HfSSv9SfW1v5bIfdYdTfEGXqVlElBoJwt+52DgbJDPYfBKz55UqBUb0UFKUV1o
         71k9z7KF69VWg0isqCGEs98qVZSpTGBIAVdLkqFDMzbhGz/wJTFiIDTGyON7u1TcfSKk
         d7tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758606217; x=1759211017;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NCXbeilKuthgziM3kejQj1ZvDe5vwkeMiKIsYl7n/j4=;
        b=EeJ68R4JfNI4yihA2yGrfV91KDSVOmQR4sSLTEg5Io0kVSrO0Yq8Oq+wPXP8iRiT95
         mlc8eg3dYhW4zynkw52fOf0PWT/iMYSjO35BIdi40omZnESVrtkp0obcqaLpuojHOKuU
         ocxc7LkriT9AE+X6Gw5vXdN7OPzkqKgJdp4mM40MmbmcvmPvaSJATBz7xoY/eOz7W9qk
         ySoLLN8TmEC+YRXQWg/ySQ+YMt7eRie5O3HrMimlWCK1MRw+iDAHAoKSaSG6dkcGac70
         XdWyA0doiUWEtjg0QX907MBk6LwzCocDa2PM13OirpwL2mQ3WRVos9O3dw8zzjdcnisd
         QUOA==
X-Forwarded-Encrypted: i=1; AJvYcCViOjgVvR74dlOnJfQT+MXHpc7l58zAtmXJ8j/mcfTX8Rc+iTHcmtmIS50QnWMbE8rRBTgIyNGkDTogT5Jp@lists.linux.dev
X-Gm-Message-State: AOJu0YytATzuO//pRw0dwZo7H+zjSxdZA56wE3cV9OD8xGZqdRYrTAIf
	fBO2Mh1vS/co9eDQDfnXyqkBlKBa9uyoUgW6B4iQbXbUa7Nl/p5pKDsdCia8y/1E/I8=
X-Gm-Gg: ASbGncsVKxNlRqp0zmRCv050fHGHyOjPohqLubz/5DS59wUEcKD8EKydCRCQj/DyrPR
	UQjVp/Xghn1mXzRd42Fb7LhMM2PzR/fY09ltnAMdVsD9l5wbOnVOh9zP5iUuc5hBJ7b6H8og269
	QuiR3uUHxmlClgO2CzeHpT96TfnmwlxHC87BTiNhkRQWje7ahnhqw1iJ5un3rwpJ07paA3a+6Rx
	6ywzm5wy2HdTRNxVJXu5BTX93BFT6rExtCZLiHDRDyacSbTTjfutlGi2up/2SDzaCTb7tgiA4wX
	5guSL26v9qSgx0PKS/IK7kiFz+pA5MTreVdEIWTGAMm3u2Gux2RcoAwRCf1/udaNUM58kWFIRQz
	7FZC7VYtRruLjI21Bf3tnta2fg63J
X-Google-Smtp-Source: AGHT+IEM+qI+wkll4yXIDQPALD07c0wXIM5SX3N4XVyP9UljJExIym/bakqlIutoRVJPQNlIn4+xlg==
X-Received: by 2002:a05:6000:288d:b0:3f9:141:540c with SMTP id ffacd0b85a97d-405ca959d6bmr651083f8f.40.1758606217290;
        Mon, 22 Sep 2025 22:43:37 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3ee07407ccasm22469588f8f.15.2025.09.22.22.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 22:43:36 -0700 (PDT)
Date: Tue, 23 Sep 2025 08:43:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ma Ke <make24@iscas.ac.cn>
Cc: dpenkler@gmail.com, gregkh@linuxfoundation.org,
	matchstick@neverthere.org, dominik.karol.piatkowski@protonmail.com,
	arnd@arndb.de, paul.retourne@orange.fr,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, stable@vger.kernel.org
Subject: Re: [PATCH v3] staging: gpib: Fix device reference leak in fmh_gpib
 driver
Message-ID: <aNIzhU6m8zgxk-Li@stanley.mountain>
References: <20250923013603.30012-1-make24@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923013603.30012-1-make24@iscas.ac.cn>

On Tue, Sep 23, 2025 at 09:36:03AM +0800, Ma Ke wrote:
> The fmh_gpib driver contains a device reference count leak in
> fmh_gpib_attach_impl() where driver_find_device() increases the
> reference count of the device by get_device() when matching but this
> reference is not properly decreased. Add put_device() in
> fmh_gpib_detach(), which ensures that the reference count of the
> device is correctly managed.
> 
> Found by code review.
> 
> Cc: stable@vger.kernel.org
> Fixes: 8e4841a0888c ("staging: gpib: Add Frank Mori Hess FPGA PCI GPIB driver")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

