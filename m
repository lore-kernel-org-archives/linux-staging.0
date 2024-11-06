Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422601D2F42
	for <linux-staging@lists.linux.dev>; Wed,  6 Nov 2024 10:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730890007; cv=none; b=S2YSGUb3lkq6F8TaNt5Kv4jxlTTypBI+0e5fcXH3rWoxixuom6zY03154buFuMMVZpxjvKokzHYBiDFUXKpUDHZouUoq3tE5SY1gvFBSTT9PHW1vzfKlU3+5F1Glp2X2Ftmt2hpJpkRe0NQ2xpv48WJQl/Hiy1f2aOShXkA4i3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730890007; c=relaxed/simple;
	bh=XbiIK6GjOS/yZ5j6g6CoF1rq3kPr/i/tae+WR3Cy8es=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u6qQIkiLg02dFcqAKPm6GnFoQ8AnybssvsJvOhkV0tNgaIWTL7gcouJVQrAmzK3xNhMk+CS25yOKsG1feJMeG45nugjJ+gOvEE1DCAZ6uKFpy/PztppLalXULDQpuPPYQJ/nGKV5KdXqr1GNL7rER2O9aAeBAnDbCzrDmE7UXBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NDyHRjly; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NDyHRjly"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a9a628b68a7so998829266b.2
        for <linux-staging@lists.linux.dev>; Wed, 06 Nov 2024 02:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730890003; x=1731494803; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jnvfOfDupOxyZMEu8q+2hpeE5bOttK1dIHZM5bV1S7U=;
        b=NDyHRjly7nT36q+HQqgvDJrae+zhlOszJ2Mz9bteuxQ1BZ+pcf0v4F8il7iawaVfuH
         53+g8qSFi7mZfNmAua3572Ckhy48rydqvNAyucwr9aB3/cnPFkG21TRnEOcb4z85VBLE
         Dqbhpuwc6LODgceyZZ0qsPRFjuJe5zdNxy1ek2cPrGb814dlCQDHJ/ck2CfTemtrqrMG
         shh2FFI1X8z9/rBH3olXj2rlKoSWNehnOPRtyhyCyZagcMg6kqF1hzNZr5aBzW6UgOzA
         ZsMAl7UU5GN9RhGoZpWLCgxElFLX8pUyoMQQVUOLpob8FYfdIDmkYKk3nhePJrzZJVCT
         maBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730890003; x=1731494803;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jnvfOfDupOxyZMEu8q+2hpeE5bOttK1dIHZM5bV1S7U=;
        b=Qede8lP1ki2/3W4qEpl1XmHAHpCEE877AazRKuHGXdQxIf1XaR1jV/a8F9o/4Oi10w
         uC52RTJ/FPJsvRBOXU8oN8Umvuw2mXO8jkByGT2S1h3caXmHquTQmtlvIviP1YpUy4lT
         KQL6Zo9DDdjJ4ibsaQ0/4wk5fXsBjYoCdeLLZS5/sQbyqULovfIGkEbshOr4rAm0ABkt
         8ANl7Ihefl8F6mfgHYaGgyZEPSWKNhGefVNPdLvRx5qUm8DdgHSCajUJy4TT1J7o8YZJ
         r2a7NTkaOST7F3/FrrJQtKGoHa36Oqb9LnMbqX/smewVRzTy3BJZLMSt/q9Xj5QsJ0hm
         fg9w==
X-Forwarded-Encrypted: i=1; AJvYcCWFdFDXUDkFGg/qKkootzTSdBZ9chD8YXvkg2MfU5pHkroEqdwRkU1WC3S8Oo8ywMcFpcgKgFAtSsN7DpxX@lists.linux.dev
X-Gm-Message-State: AOJu0YwlCpND3+GEgVI7AZqXcBSrQo80FoTrZBmkE9K+GITofx3Ek4Pn
	dc8ymUVY4D8xO9ya6xhNjGFQANRabZ6GoViqAfrgw3fTsPEwkzoF2+ei/C7TtGQ=
X-Google-Smtp-Source: AGHT+IFLqfCVbNW7IItqNBM12Hvln8l60e4gy4+M/K4utCO4TZx6BCGSX7in4grJXnBtZUzFTWezNA==
X-Received: by 2002:a17:907:3ea3:b0:a99:d797:c132 with SMTP id a640c23a62f3a-a9e654cdcedmr2089540966b.16.1730890003621;
        Wed, 06 Nov 2024 02:46:43 -0800 (PST)
Received: from localhost ([154.14.63.34])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb17fa445sm259358966b.169.2024.11.06.02.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 02:46:43 -0800 (PST)
Date: Wed, 6 Nov 2024 13:46:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Qiu-ji Chen <chenqiuji666@gmail.com>
Cc: dtwlin@gmail.com, johan@kernel.org, elder@kernel.org,
	gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com
Subject: Re: [PATCH v2] greybus/uart: Fix atomicity violation in
 get_serial_info()
Message-ID: <35c0f989-4618-46cd-9427-61f2a37269c0@suswa.mountain>
References: <20241106095819.15194-1-chenqiuji666@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106095819.15194-1-chenqiuji666@gmail.com>

On Wed, Nov 06, 2024 at 05:58:19PM +0800, Qiu-ji Chen wrote:
> Our static checker found a bug where set_serial_info() uses a mutex, but 
> get_serial_info() does not. Fortunately, the impact of this is relatively 
> minor. It doesn't cause a crash or any other serious issues. However, if a 
> race condition occurs between set_serial_info() and get_serial_info(), 
> there is a chance that the data returned by get_serial_info() will be 
> meaningless.
> 
> Signed-off-by: Qiu-ji Chen <chenqiuji666@gmail.com>
> Fixes: 0aad5ad563c8 ("greybus/uart: switch to ->[sg]et_serial()")
> ---

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

