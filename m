Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626C638E11A
	for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 07:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772089817; cv=none; b=J+/0zsNui/9AxnRO/0O0Q+IDKIeLwzI1dH52yCBv5BDrrSNX51AYlgX9nxP4c4FMxVTYZUe034ffGQsEVv0vvP0Z92mMRMz13tzOhtbsncdDdWLx/g3G63bT6NwBPGDWWmnOZvLFbVr9XElDOZlm7n4ckJUtSJofAQwwCKR1YGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772089817; c=relaxed/simple;
	bh=wsqbhwDhZpEMvoda23woLLoHV6EEItTGqnq17uBuaxs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DSpWb2nv7CSZ5DSfmHFIOSVQZtrdMuG8VRRZI/EANC59VTtAsch8iJyfGq4gTHEyKNwlelpSbkI843pUupA+zwMUpH3Bt+uw0VjYN/XNMna3VR+MKK9qOHNmHpT+mLpMHbVx31cF7YyZrRFuCdXxhpO/XmtlgK0vayeOG5+MpNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dbatgpfD; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dbatgpfD"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48375f1defeso3514355e9.0
        for <linux-staging@lists.linux.dev>; Wed, 25 Feb 2026 23:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772089814; x=1772694614; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UQCU464whOVs3Bp2v9fOpjBAOwoVO8nIkf2alxRfU50=;
        b=dbatgpfDq8XiJZoVx8QjkgnYvj9We90nXcI2b++215OUr0Xgp482EQLULCxktMjvQ/
         XAT8vDEWtb6WD6sNPlJrwCC9N3Ft+HHOI69NDkbFNPA5Ri4j1oaVctCYDWFvLds6whw6
         QEBIgACjDNp0yxoddTYL/Va+4nKWmnrOQNYUU/3yGJl/s9hJGpDxmCOmJ5tvq3ml740+
         6PoHq+vNk7zQkiuHVFnJKfPAYUNgS27x0Kbg+XR+30+WEG2rhkAeB3mhnIlo7d0pNzWi
         LnbBF52ywkSNfSDaa4UzheGAvvvAt+5XqFf6z2C1UWyWaDe5VmDOzkndKEQOAMz61WBn
         B0hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772089814; x=1772694614;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UQCU464whOVs3Bp2v9fOpjBAOwoVO8nIkf2alxRfU50=;
        b=oaPx2/YSKXAUFPjHdFS09tDY2xinTZnygilXUZfgf3mF6b2FD+85qjTp2gHnLBeFG2
         qjPeTpIvApG7blxsNQl+8MU9umAqb4c7qYDBVH/K0QaZASNLChci1zeJb/eM98Q7VFuh
         /8gWyAPvHt/tdUHnpRa9d7pLecD+hHZ2sA6U3jsmqIBqmhrEGkpVJp9plRsU6aPDfgnD
         oui3SP/yQnY0Tm4JNHznePYi9haLT5Wbodn9WmJwe1RMPMRjeqLsNZGgF/Dx91SkRLGv
         yJRhd9h6c+Y2g1/2ti0NxLHycgWS2X4oOl5I295jXl9cImaY9Yw1Wcv5LXwM/AxHMSMX
         Z1pA==
X-Forwarded-Encrypted: i=1; AJvYcCX4z4xcmUSOdxvwRiQytogUOw08ZMn9ES8LnZUN/P/XZVO2gWmyLZvy02OcjTC7VLWG98lguSyNxQvkGvbo@lists.linux.dev
X-Gm-Message-State: AOJu0YykADNeNVzqG0xBFmj6pSIiHCAyYuLpIsZ7mjJAV368LCiBgcCo
	MRw2sAUg5tdgXIjFiPJUTXpRxddoS2iVtt4k0ZzDGqGdR6n5CL4KDhB+q9Yd1AtApGY=
X-Gm-Gg: ATEYQzwxatXGmNOaHzj5vBabcQSkxfMJZrHg09fDVlRS/BDZFUYZILQzI8GCFX+bCdd
	QRaX1OB6Ln5kH6MmegVYum9XC/UyCi6YU6hQ2Hbr7vcEHyVFR8pJF97ZnCGn4Ue5cmf+hcuJHmy
	ruqHyq1s+O1jxRUuPdV8tbG6YKH3iZoM8KF9deo/cjYuRO/mgiKWSO5cfws0RmuRelRLhT/zKsq
	tG6PGGcamWIUIjROm520oKki9rLndCdJNRkDgraCt5Wv7QjLMJauDPWPiyU764OOQl+k73zI46o
	BqDyNcwz7f7a4QhpuBAh8hRPFgdZyoC/Cwu6IHsStq8UIRsoIsemBIzrDDEOimsU2JIM6iV4zQm
	yJHifeIBFoMadtB4FaF5HRbuBtMVin9yovd142uRWUrtkK1XW6479eVYw8QT8aFKJBjo9v3qD6x
	yACQ1jpMl2GlTpq7e4UOnRwtJYBoBQ
X-Received: by 2002:a05:600c:528b:b0:483:afbb:a064 with SMTP id 5b1f17b1804b1-483c3da0545mr19284865e9.1.1772089813433;
        Wed, 25 Feb 2026 23:10:13 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b841absm26509595e9.13.2026.02.25.23.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 23:10:12 -0800 (PST)
Date: Thu, 26 Feb 2026 10:10:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: tomasz.unger@yahoo.pl
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: atomisp: replace sprintf with strscpy
Message-ID: <aZ_x0QmR66q8R4MZ@stanley.mountain>
References: <20260225204548.168092-1-tomasz.unger.ref@yahoo.pl>
 <20260225204548.168092-1-tomasz.unger@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225204548.168092-1-tomasz.unger@yahoo.pl>

On Wed, Feb 25, 2026 at 09:45:48PM +0100, tomasz.unger@yahoo.pl wrote:
> From: Tomasz Unger <tomasz.unger@yahoo.pl>
> 
> Replace deprecated sprintf() with strscpy() which is the preferred
> kernel API for string copying. strscpy() is safer as it guarantees
> null-termination and prevents potential buffer overflows.
> 

Technically sprintf() also guarantees NUL termination.  :P

When you're writing a commit like this I want the first or second
sentence to say "This patch does not affect run-time because sd->name
is a 52 character buffer."  I would prefer to avoid any talk about
"potential buffer overflows."  It's the same as me claiming that I am
potentially an NBA star.  Something like this:

    I am doing an audit of calls to sprintf().  This code is fine
    because we are copying 9 characters into a 52 character buffer.
    But it would be cleaner to use strscpy() instead.

> Since sd->name is a fixed-size array, the destination buffer size
> is deduced automatically by the kernel-defined strscpy() macro,
> so no explicit size parameter is needed.
> 
> Compiled and tested by loading atomisp.ko module successfully.

This information should go under the --- cut off line.

> 
> Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
> ---
  ^^^
Here.

regards,
dan carpenter

