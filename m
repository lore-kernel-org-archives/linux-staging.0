Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D33E37BE61
	for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 12:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772107281; cv=none; b=ClkHPpIM1YAoqkh7cyC0dBP+9Pj6BbawfN2XiZH00AaTweRrsFEcywTMmeVR2lFGc+rnLqXwwJzip9Wobc9e3PzncimTB6D3KjY8r5m+QRrOBjB01uQUz+aGNxyncjkV8piXd6qNchzC8wOgSf8j1cTuIfUvGGI4KCLq4wvic/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772107281; c=relaxed/simple;
	bh=6rJNYnzuTkh5WwwqWmcNActQn5KLZirtrp12d4+C6QA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d7n+PMhczLtJCfoImOnnpDQC7Gv4FUk+rRGXy9uBCBsuGGE9+R7AiADU8YWaoc8j1+uB1RsxAU1nVCsRpsZY0CcsS+/mzA+RMwukXbPf9jhdU09LBef6aqrE+0BVj7I0U1vEfRmrIyhb8ZpJC0bPw8MnAqnc3f0028ZmCV3hfRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OLQvCbYf; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OLQvCbYf"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48371bb515eso10592915e9.1
        for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 04:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772107278; x=1772712078; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CVm53FXc7NhFRHAhfOKSIzY4AVtkoS2iWS1y3j0TwRs=;
        b=OLQvCbYfD5URTdtzcqkU/jZgA1ULJcmLvzBaaRnmTEDVIbMIEq5IXgg6LJBv8LGadV
         akld3gIO8lz961fRjQ5vZ0kswCqQcCibNVPxjIL9z0nqjmfTIDWhlo4y/gYgctEyDx9i
         kVI/x5wyjQMO3G7YpYUVce8FmVIHTz3Op9yXv+DZsg6A4CeiRWddoR/d3Kf9c7X5/kUW
         JBuOpFxTQz6VJyb4Fgy0FY9WK0qIW4E5xMI1XjXr06AMLI2TevA5w7xtLJCIMv+ibRGK
         omxTMOWlDQ0pcyMvDTHcuwNCpPq6MViqqwNdK/U/27ZTd9m7XDdI9mUHwHZDDx2hFtGG
         1IlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772107279; x=1772712079;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CVm53FXc7NhFRHAhfOKSIzY4AVtkoS2iWS1y3j0TwRs=;
        b=n1JCiloCBkagM7jK7ZQBnD17GjxC0dLCQn8x8+/X+/QCfzAYfw1JcpQyWDbq65w65G
         lP4sItK6n+xk0muYkCb1v7sJ+iXO1Ofk2pbDeTzO/eZy2Gbc9Kb0PoKByestbtZ276Fj
         g2OLQRh6Z/7wLCJ/tpdJoP/qF21xAKWI0TTKq39Z7XnKmb/OTrjqwcMLv5WnAdX7hXz+
         NewrEWpmkHKqqR/p96NKj2Srrk2aAJ3V5eOKyuWzphtJWREfH72H5fheAy/NV8MLAWdt
         iBGppb1uopasnhCeT3hgSf2cDWegCfQbQ7sBY42s5v/ifAowjn4edO+6R5UeectU4xBs
         0xQg==
X-Forwarded-Encrypted: i=1; AJvYcCVNTLCyJsQC+WBNleCQN3aek7XBNEiWGsJoPh2pXy8hIh+vxzVgYosKAdNnIN/dfMYY4bVbscWM+Wl2h1r1@lists.linux.dev
X-Gm-Message-State: AOJu0YxWYTlIZpPy/yEpAptjB6HxLVJKpEoVxHhIKEA0SVrOue3Ps6V4
	+/J1qQxhZ+R6nN/slcfcpIgiLVuMOGCFTcOwO9O+LGV4iNunxTdiYvqH9sYvIby4d5c=
X-Gm-Gg: ATEYQzzdwCsZSDuUD0ezzRwvoAO/m68IJfEoMKoHU2T0+8krLxrX88lUOao0pN4vzS5
	eM5oqamOGSrM0J4pl9RQJwCQsPLb88jO+SqcaB/siunCy0hkYKOkhYQYL+8SeaO51uGGAcYnAkY
	eAD3OF5atELiFl8hgoT6L6X3KuKNQJug3BjbSK7R+K1s1fCYW6KqTUCzO9Ccr+serKhhS/BuHsD
	CfT9xjIr3dC0njw4epsyBdu6L9djkH2JncAJJMZvuUvjzYjtEPeu4nroDwto4l1dzVMWKhNcPlb
	+tsupIRQyV/qd/XgfCxWiVS+OkjFWzmLDecQ1EvckevkpanZB3enGLUqot/+otqYuq2rrLX5H3J
	DdoVznCq7MAFCgKxeIUY7RxaBN5jBIWqivsfdNFkGLbka7EWrg0mRXJFsPb9Eysr6mZAGH5EUTk
	NWB6pUaBIL+ELbj0kRKcV57ILrL0TR
X-Received: by 2002:a05:600c:3146:b0:477:79c7:8994 with SMTP id 5b1f17b1804b1-483c3df2ab2mr33696325e9.30.1772107278470;
        Thu, 26 Feb 2026 04:01:18 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfcd0b14sm34546285e9.27.2026.02.26.04.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 04:01:18 -0800 (PST)
Date: Thu, 26 Feb 2026 15:01:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: tomasz.unger@yahoo.pl
Cc: hansg@kernel.org, mchehab@kernel.org, andriy.shevchenko@intel.com,
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: media: atomisp: replace sprintf() with
 strscpy()
Message-ID: <aaA2C0j97GwbUwmZ@stanley.mountain>
References: <20260226111653.74371-1-tomasz.unger.ref@yahoo.pl>
 <20260226111653.74371-1-tomasz.unger@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226111653.74371-1-tomasz.unger@yahoo.pl>

On Thu, Feb 26, 2026 at 12:16:53PM +0100, tomasz.unger@yahoo.pl wrote:
> From: Tomasz Unger <tomasz.unger@yahoo.pl>
> 
> Auditing calls to sprintf(). This code is fine because we are
> copying 9 characters into a 52 character buffer. But it would
> be cleaner to use strscpy() instead. Additionally, the 2-argument
> version of strscpy() checks at compile time that dst is an array,
> not just a pointer.
> 
> This is the only sprintf() call in the whole driver.
> 
> Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
> ---

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

