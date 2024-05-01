Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DAF312DDBD
	for <linux-staging@lists.linux.dev>; Wed,  1 May 2024 14:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714572056; cv=none; b=dw+Yzwva1U2CJnleqzqbk0Fmuisks60OIWhrV05kkVPy7NOSaCGYnE1o7UqJ5vb08nY6NT1KZ9oxEJiAt6NbYb/0LsbMiRsI94RoowDRCzRn79Jci1SjDINshBekO3Ob90QCYiLb5NLzc3ObsGovaTu16fCEaUuoRO4A5o1uqa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714572056; c=relaxed/simple;
	bh=rdAIHRb5K1bT7Od1HyC3wAX9P/OYSoTvMRkvbnnLFZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m7eM2D5U1R07qkXzCbqR99k4td+mv4qB9kf1DOQzbyvcX2S28pPD43iQeofH8D45OkzncwS+uvQqE8uIJMNL9FeJUHLArj33Aa3CaU/d3jqUZ9Ezh4ie7UlisQMH9Zj2jI5Exnwe7gcRg8WLvinT+2cIP/4xEQ2SkgY4kzVXfss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mutlpAwK; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mutlpAwK"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-41adf3580dbso4574165e9.0
        for <linux-staging@lists.linux.dev>; Wed, 01 May 2024 07:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714572053; x=1715176853; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ce2ghPDIUabAJ7BTjIQdi05k+ciDOHn/xruVAQep5Rs=;
        b=mutlpAwK0Fzl91QXhCozkobh7fF0aTd3fieC4mMluipn20XEnnzeAi6ZAaI3YAXrh0
         cIvkmAvVeOs4uFQantRIqDifYLx3kX7BHjqqWhinxbzLjN1SP9Xqf/BSQ+vSHHMdbOvF
         5RxzrwrI7fxU3AEzMGYHt7jHupKERV949W6Wb6xaJowNyrnXK+Kv/aEB3ZQgjmiJIarE
         XlRBfsVozrGtsvs4El1NN43wuZf4AURTNIVwT2AwKKsG61RkmDIa/8mXgDTC9+W7g7Ss
         OvgGJ8/BL+b+dyC7yc2X2kGXX4NFzXlmmch9aVRCvq9coJF27qvG6od62SZqbR/eI9fi
         jsxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714572053; x=1715176853;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ce2ghPDIUabAJ7BTjIQdi05k+ciDOHn/xruVAQep5Rs=;
        b=lelG0Lo3zDm2A3VkLGTh+lxG+KmilpgLsraG2R7GP9PTbWJAAs+i7pkuWbwPOpTFyf
         W1cIMsMF12YoVEoN2QNRkE5Bi5y3QN4d4fgslSTGOkUBmGrmTFHDzwT/lfwfREmLyWQS
         ucnCf0cUZp755UZHcaIUhl3xzkjqftu9BQLIAj9+dQk5qzGTHT8h0Ee/Xxc4xSdWMB2p
         BD+s8NnqNinNzdvzFSIMkc0Equg+ErbpUz//eg84LE7rYVq5/WyCIPwIhBBxoqy3aeu7
         +8Ar9/oJOab+RyMsxsUwQs7X3iFfs8Boif9Stp3QJTnDLmSWzcvQ6PhBra5rrDxrfpmv
         MfOw==
X-Forwarded-Encrypted: i=1; AJvYcCUkaRm3r0Yo5c+AmcCN1Tq56pN6E62rmyJH+/vxn7arGVeVxG67VyhTaV1DqX0HJ68Accb3J9ylCHf4QaUpKy72f2CvBpl6XAvS+PC3Hw==
X-Gm-Message-State: AOJu0Yx23s8BR26mWaCEvg7PXNI7O8uTvLisPF+mhimtgYKZ+DsA0nFb
	PWifryKXExBpxrFm8ih+OXyZgRH3V4h6G1yMPuJ/6KTucnUyEhGHw2umYJfr5YM=
X-Google-Smtp-Source: AGHT+IEhJeHYMc24dikdGnQsg7CdYY79Z3xZ0Or5bhU4+pyqRK8XrrawQDghDkZ/w6GQsTHKEF5j4w==
X-Received: by 2002:a05:600c:4e8e:b0:41c:2334:fffd with SMTP id f14-20020a05600c4e8e00b0041c2334fffdmr2398224wmq.9.1714572053033;
        Wed, 01 May 2024 07:00:53 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id bg4-20020a05600c3c8400b0041bf29ab003sm2313844wmb.30.2024.05.01.07.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 07:00:52 -0700 (PDT)
Date: Wed, 1 May 2024 17:00:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Shahar Avidar <ikobh7@gmail.com>
Cc: gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl,
	andriy.shevchenko@linux.intel.com, robh@kernel.org,
	felixkimbu1@gmail.com, krzysztof.kozlowski@linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: pi433: Use class_create instead of
 class_register.
Message-ID: <cc00ea68-0ec9-40af-a147-e8f67f7f29d0@moroto.mountain>
References: <20240501055820.603272-1-ikobh7@gmail.com>
 <20240501055820.603272-2-ikobh7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240501055820.603272-2-ikobh7@gmail.com>

On Wed, May 01, 2024 at 08:58:19AM +0300, Shahar Avidar wrote:
> Make use of a higher level API.
> Reduce global memory allocation from struct class to pointer size.

Doesn't this move the memory in the opposite direction from what we
want?  Originally, it's static const.  Isn't that the simplest best
kind of memory?

regards,
dan carpenter

