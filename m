Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1CD38A715
	for <linux-staging@lists.linux.dev>; Mon,  9 Feb 2026 18:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770660009; cv=none; b=p3EteE7opNrD79Trp60brzRDqnfrTlM7W1DroGCDOLhzf6YQAzZ3/NAuDtJ5u573O/At61mYxyljsuvEVS+Kq65YGqJ843pKMl4TlzX8UzTUCDIyumFKWhlZ8rCzpWEMBWRg2rIsLn5eC2zRyDaAM7aY/ozcKHIwjxycI2JdEt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770660009; c=relaxed/simple;
	bh=E67vUJVAxh/oOJCFAgb3a9BcGFAmjnO6dl4EytaKlME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gYf5CUPIWdzO6Vv9tdKXpdL9GTVdbJ2Q6x/Kqa5UmbsBicaC2zO2ziMkgrNjJi7jgS6tnYUFZjGupnfAbFYgx2VuFPa92fmMpaWBam0wgE4ahXpRxbFd/a3mS44ry0bFdPHCsf7Rp9ZHy5rhfXJoAYXGjkawMt8+AZInt/MgmHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C62uamfg; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C62uamfg"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4359228b7c6so2060779f8f.2
        for <linux-staging@lists.linux.dev>; Mon, 09 Feb 2026 10:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770660007; x=1771264807; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vn8z8aKDslp8wKRPa6u1IjzkqPgjZilFSbYuHP6Jsnk=;
        b=C62uamfgmV67zs79W9rjDa+TbXLUjbf0e6E0rWF90tZzy2uYKQW/epykpjdQBfxXMc
         PWKFopVd/MPcphIsNm11SU0hKws4KULvpnLie8wQxPUHF1PAxKzYuyTP9U9JbAAUF7ld
         nrVRPZCZUadrAW5PdYL6SyHWo55cJnXlRtliunHNTRaCWASdWwtiHz8LP8gDJO0npGuh
         yfHSBiLSGUrIedUbbn9HDfmxv+UEmvq6+315Tz1Abncp9b6nFVSZWOef1y1xOc0rMng4
         asW3Rcy8RyUPmG4cqwGBsUQ3Wx+5aKLCaivmPbSR5fJG2vdL5Q8A8duvbrm0hQ/17YXM
         0ihA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770660007; x=1771264807;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vn8z8aKDslp8wKRPa6u1IjzkqPgjZilFSbYuHP6Jsnk=;
        b=xThlfuYEfmeAFO4Hc1SS2xiE+yk75DQTjyga/L/P6e7/e9yWx4N/aOn2loStIWs52z
         4BjLgk/sPvmN7BnSE8t+QHfVyzNvPUidpXBbkTqBk5+TRXKmYhwDsWOgagOYDUxnfWcI
         rUiwx5oj5+ydnoak9L+vp+luhhyUJU0dG2hKnuFil29tLu/uVxS49Nsz8Njn/+jQrfxp
         TUiP3U4My6BQe+4u0XeF32c4jgbDgVge4iP9HmKAFdXubpAkjT3DLYFegOorw+YTIzwt
         m/jeBA2K3KbclNVqWMbjXwO5Z4P8dKQyIgTtdGijKDeP8w1HTwtHYgNh1TJ27yneS30j
         5+BA==
X-Forwarded-Encrypted: i=1; AJvYcCX9fwVoFS8SZJwXJ1cHcf1mRbqv0/tOkWHEMfR3SIL7FeyPEtemCbjRObyEQQn45YQvlZO9Ch0fwBE9+MrY@lists.linux.dev
X-Gm-Message-State: AOJu0YxQHe6B9e/DXCdnTFk/3PVqJ5T9XyYRj7slfWWIgIWe2dP687kg
	vBs27VLlU0yRlgfqEyl2I3HELic0709jTJsH6DIf2b+YyfEbwUyChJ53NJvQsvD9z+0=
X-Gm-Gg: AZuq6aKIkQq3BRoir9GH0puCF5toH0hLsxdTFZyqQrt2/FekRwITwtknDxo9EFTG2kP
	XPqQE/PI1mzNZvGj0vvDUte2MTHapgIlypdKD9p/gx6whGAx2+CspMDTr3DR8T1dZpsLt8wuC72
	HVCwHDFoXabxoE78cH0omYzmN4s7qAqQ2g5Wja0Ld1QDqtNLtlnhKODePyAlNGfAN1GWKZJHKb+
	tkejjP7JKzUUCHMySuhksKxkgHYPdiGGRfmt5GknMni80mfiLGXbPNBoE8GPCl9T0nMySHWMUux
	JwXhNyq3b6uGlzuL/ANt+TroJph7hDe2MkbyYmMvY8z7DQuMWBoJX1f5S6/PpV63saJFULRNV17
	0TudscYLr1vUTRkMm5Wh/wOMGU3hp2E06wFNnFb+VjdhHauOstlQ+lQE2cdHhbd4cYkKI81zuw+
	k85HJBy3Y6uej2jgKm
X-Received: by 2002:a05:600c:3f08:b0:47e:e20e:bba3 with SMTP id 5b1f17b1804b1-483201daac1mr184972115e9.7.1770660006926;
        Mon, 09 Feb 2026 10:00:06 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d7f1e4fsm4847105e9.15.2026.02.09.10.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 10:00:06 -0800 (PST)
Date: Mon, 9 Feb 2026 21:00:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sarah Gershuni <sarah556726@gmail.com>
Cc: gregkh@linuxfoundation.org, arthur.stupa@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: rtw_io: resolve all checkpatch
 warnings
Message-ID: <aYogo4xoBJrRYneL@stanley.mountain>
References: <20260209175530.3597-1-sarah556726@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209175530.3597-1-sarah556726@gmail.com>

On Mon, Feb 09, 2026 at 07:55:30PM +0200, Sarah Gershuni wrote:
> Resolve all checkpatch.pl warnings in rtw_io.c.
> This includes removing redundant parentheses, fixing overly long lines,
> and adjusting blank lines. The file is now checkpatch-clean.
> No functional changes.
> 
> Signed-off-by: Sarah Gershuni <sarah556726@gmail.com>

Split it up by type of warning.

regards,
dan carpenter

