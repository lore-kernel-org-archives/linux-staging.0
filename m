Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F422F35957
	for <linux-staging@lists.linux.dev>; Wed,  4 Mar 2026 14:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772634339; cv=none; b=bFpQzp/Np3S90MTWKE3o3KFcpdTNnK4nHu9t0FMsJ7R5Oq473bCJBQFAKFUIkc60GCL8VbbwBNJqLr3QwZ7H3eGHI4CMJ5kfjvU6pg2g11lBp8jUjnQ+FPHmTtkxS356o2FhRI1uzHU5fN0SkO68CP2h6JJPNYHV/YTfGE2E26I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772634339; c=relaxed/simple;
	bh=6V2qYjxCYdKujrfKdfTH9jaCaXDQM6SLHUezFjdUNIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V0PfvK7xtNiOoiA4dI4LrwVGCDNMXiqyXDsXJ9NSBkkhSNAaVdDwgoPXMDLq9qaqDubezr5GE5e3k1cf+P9EVHHmH589zIiojYjbhl9r39G8kQjU7Gy4LuwyteggJTAcmsEoQcLNvOaxyJIJW4qzuGslVo6BDWG+gFQ8KCMjRRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fg7vF9/S; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fg7vF9/S"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4837584120eso51624045e9.1
        for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 06:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772634336; x=1773239136; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6V2qYjxCYdKujrfKdfTH9jaCaXDQM6SLHUezFjdUNIE=;
        b=Fg7vF9/SLnOPALEoXQrN215e89mCnV4lDc38JkxoO7pVjrmCtxFRidx6WPcAuXvTT0
         0Ec44cFIJsM2G4geuFHcH0WCT8Pb5iSvqrtMYtY1hfwzyt2EUTQzsqfpjnesHQEQWM2F
         chmemNamRZNzLIx77XTEY/ndglrf9eCu8SiZS54dq24N/GUEbYKiuxiJ9IaoUMyVH4OR
         AfSt2NpJu0PR6sX4bp1WQZ2Alfw9aMLXIHNH9j1SwybRO3U6ExDidSIOxpm29fEqZPbl
         u/rIB+E1Cd4y66F/FWTO/B+TOpob/ZUuwNbdb1xGaMa7P9wNAb1oqlGKMzYIXLXr4RE6
         ngAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772634336; x=1773239136;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6V2qYjxCYdKujrfKdfTH9jaCaXDQM6SLHUezFjdUNIE=;
        b=S9B5rIeQOnwj+kHl4hS8eKVsvvRa8JwsXS0U0kjHwd1hOkg+UPy8AmzJSlG20Erh+6
         cnAJvre2Jm03lVi2nWl6wpka1BhQPsy5KTaC4prXtlU3usBg/AX+ORqYbl3OySlv7/1x
         4qP7Fwq/g8xnBui7T4G+9KHQFFfj/alGUzsfk88q+y7JC7U01kS/7VlTxaDH4GJPWDT4
         qupWXABj4ge03sjklQdNwyIsIRPnTRWPT/HkLwMQ6X1kLIjFKEMyQXBUIZyHzLVY9WKe
         7H7/fTT98nLjLsbLhkdRfffVj+4rl1oAN4jF8gOOLYqhIQC9ocBoB0nw1s+VCylfiOA2
         ToXg==
X-Forwarded-Encrypted: i=1; AJvYcCWI4s2l+TnnZ+PeHiPQf0ajs/5oc+vhvigkUM45aT9hwRHZ+CsEeKN2eeY+dReKpWh4sVWypuuM5ghj8tza@lists.linux.dev
X-Gm-Message-State: AOJu0YyXELCrGN1SrryD52zdikFpeL4Ur+QvdaYHtOPHHOLLuL8DkiXi
	L2ewMNNZ2xvToFyGs1cUFoWWpxMuO3jhZdgxEwy1/51KzlI8ytZpG0gPfY4OaTkLEX8=
X-Gm-Gg: ATEYQzxGX2z0+FjXK9Vmiwjcw6MjlUjrSz3yJh8owS1yS0QFqEwZt0ZGRQVRMkcGtV9
	rJ0NBXprwsB9mcPn9kS3C8YLfRx98XCJ2uS36noueo8mffNqCqwbptZgv19osU4HD/T35g4tFO1
	Nnu/645v4IWrPpQNSZbdHTwSG6aECIIzTVzjxccCSvkmk84rZqZGk8m6tEW7eyjcO2vojeVvkxK
	EgE3MZht2DDlLzEbx4B8mTCSQghJ4OTQyOUyGX6PDWVitrNkiQvscwHe25O9VXu0qkGfsNIcjUX
	CdYhfHSoWAjV5ZMWL0nABNj0vDnT6u48tpO9kLORI5byqPQR6hmU+4+NXBHeuvIWw6yeu2OCzzG
	A42NWfgqOtbfI482kGQ2bvAq4av2Kr0J9dn24akspclXbk2gFm7hkSEpWVLQzbCPe3+MvM2MIV9
	UMYlZd6Xoj3HtFQjRAI1drqeDpwDSb
X-Received: by 2002:a05:600c:444e:b0:483:702f:4641 with SMTP id 5b1f17b1804b1-485198270efmr30791045e9.3.1772634336224;
        Wed, 04 Mar 2026 06:25:36 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851acf9cabsm10615715e9.14.2026.03.04.06.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:25:35 -0800 (PST)
Date: Wed, 4 Mar 2026 17:25:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Soham Kute <officialsohamkute@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] staging: sm750fb: sm750_hw_imageblit: propagate
 de_wait() error
Message-ID: <aahA3J_yiTNwUrth@stanley.mountain>
References: <aaVT1mSeKrSSlrha@stanley.mountain>
 <20260304084545.156170-1-officialsohamkute@gmail.com>
 <20260304084545.156170-5-officialsohamkute@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304084545.156170-5-officialsohamkute@gmail.com>

On Wed, Mar 04, 2026 at 02:15:43PM +0530, Soham Kute wrote:
> Propagate the error from accel->de_wait() instead of returning -1.
> The caller treats all non-zero return values as failure.

The caller ignores errors.

regards,
dan carpenter

