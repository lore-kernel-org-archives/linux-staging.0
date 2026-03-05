Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D7C30506A
	for <linux-staging@lists.linux.dev>; Thu,  5 Mar 2026 06:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772692236; cv=none; b=ZyfhhB4kDFxx66s4Sc1iAZ9SI8r4gP0sVrS8Vpssowfo7re7nLGrov11llUSQeg9SFl9benijVFHCHondlgyvVXaKUiHJ0ymyDxeARorfGK5WpEXovxSDMm3IwfnFT+QOA3U8z2PL73AD7Mq9hD0YV0k0TJHlE5wm6WKwEBT7qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772692236; c=relaxed/simple;
	bh=mHoHdI5w2SuoeJSnbDuo/FCwnRARmmMmQQ9TYO2xQ1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LB+dP0rREpZDzw/PQ0QOHDHMEj+8e+t7fss6waRHitLjAsJuASB3o1mLKvd+N/hhuhHgBTtsTAswHZnxCA9J5ILH48kEOkn42Dbr41CTi8N449rzHN7whOub4xs02v3UZxcKguN2uzQefOAT7dmBnA2N1y5Gckb9MxBYjTcWD9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PowDop7H; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PowDop7H"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4837907f535so68866555e9.3
        for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 22:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772692233; x=1773297033; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XnoqO+Dz4YYHuPGEXnm385hs046xHUlElL9Myj9haT4=;
        b=PowDop7HHiG3VVacIrG46yeQ9SvbT+wbVbUTF9yxv2G3vs3C5YvgnAGuzuKB9Gx/as
         N1n6Up/uNuvDeLkRnaaI/i1LCYSYQLH10EMaMmFBsq1d1QG/X05pyfASlC3hGEbIfvOP
         dhRuFR24TOS5CbUZTgtmMQ5qft1elB3BA5i24ETAIXTu1PRh8ezh9igRXxqx3qXK50n0
         nf+YvHL9qExsTJoo4ii2BSNnZXRKa7tV4njdwiW3BkcYBjdabhmyrB5jbxE7LycO/TZr
         yb98ws45qjngGv/seboJFVbNakV/ISFwrraZTJEY9gBXBI9tTC32aPjzjQ8Tl7Ll+Hkd
         VcIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772692233; x=1773297033;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XnoqO+Dz4YYHuPGEXnm385hs046xHUlElL9Myj9haT4=;
        b=dlfgMTUE8e56UY9ZPYVRG1uQDwmhH1EsurOhDa/DfANrLIG59AaVw0Pa6IWUlE4L0m
         CAKhp+T0kkuaeNuOugFaRsFdTX1OwYFCQA1NRvkfTvLuO9dG7pURjtNKEBWLFSOoYxhk
         UVwvIAdvxV/pmMahoLQbIgh54vziKIhfP6KmWiuup7wTWM5qaBbYKS5gu2lFlJO6NRvd
         Rog1rWOuYy8NfZUsdi6rEKz+FbS9+Ai5Nn5YcDYqnOaqo8Glq7TWqGm7QyLDaQDF6xgg
         OWF5l7+FnTzZ0loZdnMMZWpCvIXgUPP5GGKjHWr26Dk4sx1HUIsnWjtouOraCUs1K8QJ
         Grsg==
X-Forwarded-Encrypted: i=1; AJvYcCUx0G3Mi5NPMNs76CoUb5d2zs/ZSWD3oegsFMp1bAHaWwUFBEjueh9b8nydKAROIP43BHhOb+BZXAEBLqQg@lists.linux.dev
X-Gm-Message-State: AOJu0YxHl6I2UAjPLWfG5KAMbGYWS9uiTQrEstXdfShgjgvJgaTjMutR
	LtGJnRAwWIti630/yFAtsbTBysrVK+pdmUhjrSEflXsslGXx1gmfNJm9BOymQm1/X9o=
X-Gm-Gg: ATEYQzyxflAYpqF7wE3f6um/+QvHVx0K1cC0VwJZtDG+nWdeCImAwZ2m4gDQDNjuH3c
	LVQ5BdytvWoLHjVR3KCGq0LHAX5qHfAmT1U1RzH6kpq6Eb0b1A30Qm8WlhFqTTtVltsLb24GAgY
	r/IrifbIJgfQlV5CysBc5zlHIsG0AK5ccvYtp33TtGhaw4LGKbUPvk3YJnTsk9R1rg9EqxpbJW2
	LopoJaFq0AtCr9+hRjjxEE3BSMAfEOI+goxRM0TvrIYrT0Epkfdec9GPfK44ekjXBFkMdvtNHv2
	uVOl3fWhitIk2S1N1kLGNGigxaacFJ6z59zvVCm4YTNZDnygekEHQuW3x2M72s57xjh1dhjk21L
	1xMFvSWrx7pW4FiN/qPpleQ28bMYZXq1UpqVFYAXfm7brvS7jDRgJ/6G3wO1a2BelDcHAEjx/xM
	n2JNk1WLgRdkxx58KNE6rQNFFMGMhN
X-Received: by 2002:a05:600c:a087:b0:483:badb:618b with SMTP id 5b1f17b1804b1-4851988467amr74748955e9.24.1772692233099;
        Wed, 04 Mar 2026 22:30:33 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851a82dac3sm61667235e9.0.2026.03.04.22.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 22:30:32 -0800 (PST)
Date: Thu, 5 Mar 2026 09:30:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Alexandru Hossu <hossu.alexandru@gmail.com>
Cc: parthiban.veerasooran@microchip.com, christian.gromm@microchip.com,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: most: video: fix read() length underflow
Message-ID: <aakjBUMpIKpFkAWY@stanley.mountain>
References: <20260305015703.41762-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305015703.41762-1-hossu.alexandru@gmail.com>

On Thu, Mar 05, 2026 at 02:57:03AM +0100, Alexandru Hossu wrote:
> Avoid unsigned underflow when fh->offs exceeds mbo->processed_length.
> Use size_t for length calculations and clamp invalid offsets.
> 
> Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
> ---

No, this patch isn't correct or required.  Look at how fh->offs is set.
It can't be more than processed_length.  I was worried there might be a
race condition but that is prevented by the:

	if (!atomic_inc_and_test(&mdev->access_ref)) {

which prevents multiple concurrent readers.

The other thing is that "count" can't be more than MAX_RW_COUNT so
ret is fine as an int.  (Also it can't be more than
processed_length which is at most U16_MAX.)

With this kind of change I would want the commit message to have
an explanation of all the variables and the list of functions
where they are set.  That shows you have done the analysis and it
speeds up my analysis as well as a reviewer.

regards,
dan carpenter

