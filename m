Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA682FE041
	for <linux-staging@lists.linux.dev>; Wed, 10 Dec 2025 09:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765360269; cv=none; b=hP5FoSFzsTTmMekwacIW8sJkEtEXuqLTdEROCcPPOvJDgUiBj6rq6BtsiAOiHZKIHpB6BHgYBpp/j2qdapqWtDYxjp+t+b1rY155p5czYSz9Ld/kcdsQ0Yf2Jzl/Do3KKZa3LTDDNXvE+QcwEzDcYxpi2ZBP73qcqJlk8LFuE5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765360269; c=relaxed/simple;
	bh=x0Xy004ajIQ6LdE02hLKph2/qBXwTL7ZBVlAQEUVqUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H9d4Xbu6IE5dQ+IQH8R5Kg+GSze0G8aQUAR2adXOSRzfpkkZ/lKTVoWSIdeFmFoRlhRWbnDCvCBkzcUuSjHz6djP3Szsgc6+wN2zjbSnHsX8963rhX5pRVMUawlB1kaI89OMoMyzQmDQ3hH421/VTicFzNpNXYUj+m0qXpnil14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jnqy/NkY; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jnqy/NkY"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-477bf34f5f5so52258995e9.0
        for <linux-staging@lists.linux.dev>; Wed, 10 Dec 2025 01:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765360266; x=1765965066; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4B06qbhBhVCFFua5ibBTjFTdBd800LgTE6bPjUyYBuc=;
        b=jnqy/NkYys2XimhUK0XnyB8sqRtaRUiUt/Iulra9u5disR0OZ3nZPBs3BZ0tPxUr8l
         6RfSC7TeQ/LUg/Gi3iwG6fckg6HcHaKfydzdHjumAB7oXPjRdRIB2QESOYjmJVxK/VLn
         MRxJreNMGpiMLkIRHLlgM8a4xqVJmUzG0AQTNKyJIOfxWv+yL7w6E3NVKJxMCdN9OFBS
         Yuqw2AURYNHqrGLl3ZYIQNz2BXCAaDfdQXTxHUYkAe3gJF7vloAcXb6w/Twr+OxQnTgo
         BPnrSJ9nzifwbhb2JUF7TMdei57nEy2kir7f7NbpqnRBGwk68Ru1l3i9gKPW2OjAkmJF
         Kd8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765360266; x=1765965066;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4B06qbhBhVCFFua5ibBTjFTdBd800LgTE6bPjUyYBuc=;
        b=WdfUkBZRyEchef7fFLApmkXWgPYlcoNmB+JJqwOvS6KFi6ESCPDaO+puOOP8/noOvN
         sC/+0XZwRiqCoLMTvMlkKNqicgNWf/17Kjz4h4gCDoEJ2bzpVAKqz/Vx5dhN3To3rvS6
         9wYiTTjjFRmMkRcz80w1R1VMuVxuNgX3OiOvUKmwBMPXNAVYbPY0K9WN3veXRnf0eJTh
         faoozjl0SCp2we3U0jBPg6pYOmBVO+mc8iikwYZcUU0QfFQAQTOA8d/FyhhTZD0S8MVS
         4QF7OtxHDNoj2chQPWy/h6tDSmA33p/K80rRE1aFGRRnNAg2eABX7LDTtfot50PLyvT2
         /izQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbzx2bTOYSeMskNiGlJW+2bEzUGbls4u/pERDgd+v2THap0z4XLc9WP7kNUX16T1By3/6pXLF/tSUqq3mP@lists.linux.dev
X-Gm-Message-State: AOJu0YxpIxf12bguz7HiirR6QcKEoibUi6SLHYqIE0TGKUT+hbrhGHoA
	H7YoSKJHX89a00RqA7YUGAwwmDG/QrwQ7i7labDvBixgNXJb0ozg7BoXDqEmtQ3OzGSDDVDl+Y5
	A1j7W
X-Gm-Gg: ASbGncupppx5ynB87tA/zOuaBBfjmlowcHpXM2by62nEW8cH/tDaD7HgaP0WHYpWs1U
	wmu3C49TPQ7XAFBAVlHNP92iB45POxoal71XxsN9K+v/v5ldvADTaINcNz/zSeS5p/XUt91gL3X
	D/7+sYM50Rx2DnjkZLjS4TEwxruCxUApS/W6uOBOsdIs1IGzG+D1dE7TA45bbaI8NjXaMsaFDDr
	e4zjeqm4PP6LolpzP0P2YSm2bdAIhvhvg14PE8u4uOwMMYgTXaOGWQ0g6bs6Zz8DVqxXZgoG4tK
	3jtkpgyAC1+wRZsHyCkF5Z3L0mVESzYrjz8NdU2ncLoBtTunujO9/K0BdsU9Hq5J+SXJeIrt07K
	IKmtNFPpPq7ukHdd4Q4qc/UbvztJcyOCy3GTKVK5rLsL7xfsP0UNsGzw9o3b/eYWs9YueZzvqq2
	wv5v0hKUc7WxijSBFW
X-Google-Smtp-Source: AGHT+IFa/d2xPjcJ3GR9qiSLMDjzB7aq+qWaEk40sAjfzUvXODCPSHM38QrBJnIpCEE25wsU6L4OLQ==
X-Received: by 2002:a05:600c:3e8d:b0:477:b642:9dc1 with SMTP id 5b1f17b1804b1-47a8378ce43mr15130005e9.20.1765360265752;
        Wed, 10 Dec 2025 01:51:05 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d222478sm36232021f8f.20.2025.12.10.01.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 01:51:05 -0800 (PST)
Date: Wed, 10 Dec 2025 12:51:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dharanitharan R <dharanitharan725@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, david.laight.linux@gmail.com
Subject: Re: [PATCH v3] staging: vme_user: simplify bus number allocation
 using ffz()
Message-ID: <aTlChRvefnb6kwSX@stanley.mountain>
References: <20251210094207.33671-2-dharanitharan725@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251210094207.33671-2-dharanitharan725@gmail.com>

On Wed, Dec 10, 2025 at 09:42:08AM +0000, Dharanitharan R wrote:
> David Laight pointed out that the loop in vme_register_bridge()
> is effectively searching for the first zero bit in vme_bus_numbers.
> Add a check for vme_bus_numbers == ~0UL before calling ffz().
> 
> Replace the manual loop with ffz() and use BIT(n) for consistency.
> 
> Suggested-by: David Laight <david.laight.linux@gmail.com>
> Signed-off-by: Dharanitharan R <dharanitharan725@gmail.com>
> ---

The patch is corrupted somehow and doesn't apply.

patching file drivers/staging/vme_user/vme.c
patch: **** malformed patch at line 204:        return ret;

regards,
dan carpenter

