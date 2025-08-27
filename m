Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69103223DD5
	for <linux-staging@lists.linux.dev>; Wed, 27 Aug 2025 07:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756278942; cv=none; b=pWHx6m1wTEcYlb7+uRPl/kidRml/dQjsBNp/nbAzkQtzVU2qRlkUnzfZBcClWcn1QU2w07loFgQuNF14qLg6NMBI+39IBt56h0VPogJTh6/7jCQt5qzTP01YSWY5f+qnzZLafsCt9M3X1zZyhqLWlESSPx7SeT0/Z54SwLU46Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756278942; c=relaxed/simple;
	bh=eJUdkWuojsgRcPJQERC9HoSP+HFyVytDvOc649sWpJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HUgPT+l9+eJtrcB6C3AuV5Zn4iKN4yuWXk4PWe/Snovfb5H6j5BCzaL4uzaTzBAI7TMT9YAX40jrOSs3H/19ZA9ZDjpVsCF8fKjrCVVqplE7NRpxqAbp7AQzB3djf9gC5G4+RIB+BHdtlCOwd+VY45PG9BbOUE0nyV3TbMUxFHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jULbaoCx; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jULbaoCx"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3c380aa1ad0so3367277f8f.3
        for <linux-staging@lists.linux.dev>; Wed, 27 Aug 2025 00:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756278939; x=1756883739; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hlLv4S/UPFBuBEfiiKihhCuycUkTi3/tZ4pnK9d2kGk=;
        b=jULbaoCxy/x6Xxl4bgmkXXPP50YRPAKFlstR2Dw9F6CkcV6h1X4EqvQ0IQTvanjIYq
         mDdC/5Fpc2O+WDvv2gLIWdKaWJpSKrb/JIQFLl7tObmX/xRfEJBC74UuteHLH+x1QhsE
         F8y6Vo0dn6B5F1k9ju7+JZ4aQ0UidqpA5P9E5OMBc5L6Vt3+E36WPyXci4AMaLL53WFb
         oPN4Fpfq3ZWYMTYDhIPJojG36HtVlf9PXDpOyCZVsA7WYX3X4HU3t29y6dkFZ82pJSXO
         p2wGaB8yfNGzIOv2jtjMKhFQKX57fE88qBtDH3yBVd77Eae5wZA5aUBA/mhDJGFgJLFw
         Z4pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756278939; x=1756883739;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hlLv4S/UPFBuBEfiiKihhCuycUkTi3/tZ4pnK9d2kGk=;
        b=wBWLKdqrLVFNms71Ou9zQcVg0Osl1kjguxRO7CjowACBBV2wrV7kBR54bd663ZZZMx
         cUivu5vL/ye7iGP4wvN/4Oa1b+WdzE22cA8zVsS/bz5IPSWbaF/DSbzVi6zkrd2WcQPt
         L5oJtcN62zgac9t7B5Ibghge5MybRI5IVo8R86zWW2GlIsic4hBfpHF5paigxmx2dBzo
         Rq1gAI8Ht0fj6kqMd1uRrb8XlFiQ//ONEaHtBOR9nNo4//qPXfVU6RcMf8vJkwLJXYK8
         wwUa14N01f7OdaFm72RKMjJl5AnDvx199YdsoXbfWFlWXZYvxmvxPjj9CujdkOmxP4Pz
         G9Rw==
X-Forwarded-Encrypted: i=1; AJvYcCWmKeAE03OwZ7Rj1SgVn3NUMtbNukIEdwbqk94q5I8RtizE2o2V+hxla0p19TDYpGBvR+Pz7TdxGVjbjgcY@lists.linux.dev
X-Gm-Message-State: AOJu0Yydkw5BIUp+vZS3NMmYTZD2KzAOzA9DEZJ/xHaiucuKrowqCzmo
	+5s3Ay2WcidGdpsoavZwKupmiofMTWS/T4O+DwiEhWTAs9TX1Pf0dUJVcmi81pYBRug=
X-Gm-Gg: ASbGncsrvKfU2d0j2DZeNleRGzVIiAZPWs7MwaZbF8uibTX7pYeXStUmh0F43zEABkF
	4XMvND2xh9FsDVUR0vJTcI4H/hqJMBPonaMyx1+ve5fAY6b4UmVDqqI+uyfohOexdnumsYBjM79
	i8xNOJSt29WYRF8onprKG1NZA/49Xqt46wuhOh5L4BTcbkf7yKNQW0PKQNxTnZe0zU+FUbGpJZw
	4cApnu8Yk+X2Q3IiAUQ3R6KQogg/fxF4GEZwdnpmMHe5XOLkTKPgDrkd9e6uetuAzw3PETrXjkL
	RINnX3lO6ezk2keE7WJu9YSLtuj0VOpAqvQTy35S1GT5Itt72opUTWRQgRFSYHTAwOsNXufi7HF
	AOnrxBya3Kl6J6etX1mGI9Kbp4zM=
X-Google-Smtp-Source: AGHT+IHGLQK+/bIqO0EGakdV6TeJY1UPjMkYcLkAtbFxpvXgRAwvr0BTLtLlmQ9ZA9cZOdmyT34Qdw==
X-Received: by 2002:a05:6000:2304:b0:3ca:ad45:6363 with SMTP id ffacd0b85a97d-3caad456a18mr5084286f8f.17.1756278938614;
        Wed, 27 Aug 2025 00:15:38 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b6b1cdf05sm14123395e9.1.2025.08.27.00.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 00:15:37 -0700 (PDT)
Date: Wed, 27 Aug 2025 10:15:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Osama Abdelkader <osama.abdelkader@gmail.com>
Cc: gregkh@linuxfoundation.org, dpenkler@gmail.com,
	matchstick@neverthere.org, arnd@arndb.de,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: gpib: simplify and fix get_data_lines
Message-ID: <aK6wlcLBN1HclMpl@stanley.mountain>
References: <20250826220502.210485-1-osama.abdelkader@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250826220502.210485-1-osama.abdelkader@gmail.com>

On Wed, Aug 27, 2025 at 12:05:02AM +0200, Osama Abdelkader wrote:
> The function `get_data_lines()` in gpib_bitbang.c currently reads 8
> GPIO descriptors individually and combines them into a byte.
> This has two issues:
> 
>   * `gpiod_get_value()` returns an `int` which may be negative on
>     error. Assigning it directly into a `u8` may propagate unexpected
>     values. Masking ensures only the LSB is used.

Using the last bit in an error code is not really "error handling"...

What you could do instead would be something like:

	int ret;

	for (i = 0; i < 8; i++) {
		ret |= (gpiod_get_value(lines[i]) & 1) << i;
		if (ret < 0) {
			pr_err("something failed\n");
			return -EINVAL;
		}
	}

	return ~ret;

Which might also not be correct, but it's probably closer to being okay.

regards,
dan carpenter

