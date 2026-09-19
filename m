Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBD947143B
	for <linux-staging@lists.linux.dev>; Sat, 19 Sep 2026 10:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789814692; cv=none; b=dVzUdjGh6+1KYxfXCIc8tuDQmc9tbejR3gq8EyRRWAFz3i2/QEzVmwY8kK81gYcGvpWH13TddrC+fWKxicFCGEztCdmT5sbVXJ6wHaFpXfZi1q2tzRxosLG/542C2P49bcS40zj70cuusSpggo01+uuA7KdAgkxtwpxtirCSR2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789814692; c=relaxed/simple;
	bh=TJmcyUMfUmcsYyZScDlt8xhUYwQRzwxjW+m4HiJ0NoA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nxc9/5ISYvewq0K8TGw6gguOLiq3B6FIUN6VWzCLtnHFsld/XcyWWitkHixOuhuYJQ/Dk+dEAvFunRhQkLzX3u4Vj6vCE3JVkf/TPlEPt2t1WkDrTGd5j53rNaegjfoxxBAqFOFcShNxuAXjNaC0iJk6gMIyox5HGtc3AXvnR18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UXF1AEmC; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UXF1AEmC"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso11350525e9.3
        for <linux-staging@lists.linux.dev>; Sat, 19 Sep 2026 03:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789814689; x=1790419489; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wg8QRQKmkIfgrPNpMhEYrYo1EuPYnVkkY2nrckW83dc=;
        b=UXF1AEmCBYalfjjNmh5PCWLvjDv0+N2JtXYUihTdTBvO/wKQawpaLfz6D3nvoG8jtN
         ebX9UTN/o8iwECDyw62jHlQaWOzzhDyiRu7nKuj+k5tf6uPu8d/s0luMOG3kgkSSnzgi
         q0ADHQ1EG7rNrtnR2V3mXYLBRpFww3+mmVYz5EK6WM4rYdT5uyTjxHSloFMZmC2ckWnt
         szVG46OafG/t0AiIDqZf95JECOLNtv3JobNp2lZBJo6yA8mNJMUKkaPNg14iVmIWU6Mz
         hmAD/fz9xxRcCpTsGhSOOwGKLJXiFAiBWeaqxlBYFH6mKTX9ggnTAyOeqSpB8YC2N7t3
         PSiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789814689; x=1790419489;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wg8QRQKmkIfgrPNpMhEYrYo1EuPYnVkkY2nrckW83dc=;
        b=B7XTEgPpbwHxb4CFxJTPQ6JUucu+YjBUB5XNJIzid/aAwiquZmtpXz2U41tfndwk40
         WXHhFn1EGc2zik3iI88EeUCKYzEfafJahezdDbk+BmUg9yS4HdQlBtI6gnw2GOfOeWgz
         m3BDBBP1TCs8YsfNavXzAEsRsCS+04sTFsLHyoH9jeM5pyrp05oOsrz54PqDlp1opFiW
         W1GmFiL100ODsdVInM4NW73JymcNyU4Onhx/XVOPKuNtcQEC7X3XrQpXXjxr+cQT0Vl/
         PUNRn+lOhsFtiPfQ02O0F1S+WXWu3j7cBDSUeVlEHvN74HLFk691/ZKpQHV02yxPQXkE
         xg3Q==
X-Forwarded-Encrypted: i=1; AKwUvBwrgVtn6GbeOMDOLKdGB9L51hfVbPRrLhnkOj0GhSeo+0UeVeUy2l1Nqec4+9uPNO7w4k6Wo8jHjkHq3VIH@lists.linux.dev
X-Gm-Message-State: AFuF++kG038QqJMM0bPX94ifFFuLgkAANtV/nPzUDEN0qx7fx5qNhj84
	nvPh5UIWfoYewwsQ1j0pqOlVTsWX3i17fAUSMAqNWWT7vvYl32RqfOcC
X-Gm-Gg: AYBFou2Y37SGYypM5HFSmRdNQnW3ZWsYxz1ZZMwGez5xWk/KgehhCLMXctSmHFAiQWm
	RkK3wubn2c38t96wXBf7fQVU8H8nrFtTunV13ThCNf8h7zOi7DaipTAEvi7NlUAv0jNq4nZRRxx
	GuX9/NbBk+Febew5lBSJb/Gy1mglJvpshS9B4fqrHvcNJKKR3OxqO1QFMfSjj3hEnDvx5x7djd6
	RL0IhsPDLV/nAg1/J7Zw/zhwSd+xHqX273w2OWeb7gFd2G4hUrgM1Qd5Rmt+iDSFrdrMKEJcehz
	KOdFYxVFxXrZsVo5AhF3lrlebHwgtzYzWa3Zb1vtgRxfcXtTQOduykyFD43iXdI1hCrObcovJb9
	YqTRu1XRAqXkco1+rKpSAyYnKXpBDM5zx6RpCgTADOBRT8hsg9K2HVMkxQUPL71OW2ZZ8atRQJz
	j84ujT7FP9XHnuXB8FtS+QAT+Kd0FFPyOzRI3tvKn8ktKQT5YpTEsB0ZxHDRPubtefXpo=
X-Received: by 2002:a05:600c:154c:b0:49f:c451:b4ab with SMTP id 5b1f17b1804b1-49fc5743c34mr68901275e9.29.1789814688641;
        Sat, 19 Sep 2026 03:44:48 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd074336sm62992825e9.8.2026.09.19.03.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 03:44:47 -0700 (PDT)
Date: Sat, 19 Sep 2026 13:44:44 +0300
From: Dan Carpenter <error27@gmail.com>
To: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Cc: jic23@kernel.org, gregkh@linuxfoundation.org, nuno.sa@analog.com,
	Michael.Hennerich@analog.com, dlechner@baylibre.com,
	andy@kernel.org, linux@analog.com, linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	joshua.crofts1@gmail.com
Subject: Re: [PATCH] staging: iio: adc: ad7816: Protect sysfs attributes with
 mutex
Message-ID: <aq5nnHPp-tg3C6k0@stanley.mountain>
References: <20260919085513.9173-1-abdelnasserhussein11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260919085513.9173-1-abdelnasserhussein11@gmail.com>

On Sat, Sep 19, 2026 at 11:55:13AM +0300, Abdelnasser Hussein wrote:
> The sysfs store functions (ad7816_store_mode and ad7816_store_channel)
> modify the device state and toggle GPIO pins. If accessed concurrently
> by userspace during an ongoing SPI transfer, this could corrupt the
> SPI transaction.
> 
> Add the existing chip->lock guard to these functions to serialize
> access and prevent race conditions.
> 
> Suggested-by: Joshua Crofts <joshua.crofts1@gmail.com>
> Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>

Add a Fixes tag.

regards,
dan carpenter

