Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BB23D9552
	for <linux-staging@lists.linux.dev>; Sun,  6 Sep 2026 14:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788704418; cv=none; b=BQYNkNU0Jvjw8320q6PpqWvQB2wo6WkqIxFyGO8swODUTB49PGpAIrQp4suwaCPIbosmvNxmfR1LJA+L7ptYKZgIEP4eQrQDANucvgsdRlzNTfan7PmdDYSVj6lkgkcFOTzZHf8s21AESAiLuZZmM/xyDYqubrWgxNoo1pN0xVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788704418; c=relaxed/simple;
	bh=bKv7F9ahkxh8W5WyR3qEm4fuAIz65mC5K/OoAxne/CU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IHlHc4J7au68hZcGZobWMnK67y9hmFOQgcSdPsokRyzgg2vuSDQhk5ZeiF5+wKPZGgvbVIWQ/IYmSgWyuc+vZGT5BV/+9/Ur4hCkWeks4SChoRbhjk9TfCVmlkqC9PqGA0hXDjG5T110NZyQTmHln9Qzj9b+C6bYaEPstNsw3Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WZCxonQi; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WZCxonQi"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4956869750eso21273035e9.2
        for <linux-staging@lists.linux.dev>; Sun, 06 Sep 2026 07:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788704415; x=1789309215; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PC/6bfIhSGPf12M7phejzb1AYIWg3N/E3Cnmwp3VYxU=;
        b=WZCxonQiqWRmZV35DmoAR8ZwIy6UeGIxGzk66ys5MnS/PW+T2ch3QQHhcGS86N04fQ
         boV11k0UiAHTXWYlfjPmOwIKGIswDVm5I2uaeYoULaIWSqQ0xwfvpP1W2tgw8PJ96gHH
         IS5NLG/3Eposwdno9TKy3a2GXnzG/Y5TkQk30ErYkRWnjqm8Z4zuJN81xYpy9v2JBDGO
         BoYTtP5VNArw7D/L4mprgBxriN3CCz0Cgx8ze2OvCNgd3YqKwdflGvx0cE3e4ElB1vLa
         0+jXjY8RlBWAR9IUoPV1+xcQKZcSKC/MNEK0lpHootGCfM78nyK7TwB66Bb5REED7S6G
         y7FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788704415; x=1789309215;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PC/6bfIhSGPf12M7phejzb1AYIWg3N/E3Cnmwp3VYxU=;
        b=WXiYcCJGfDfhcX4hdSboB/G19MakDgWZNWdrD3ZCYKG5CTOCZRfMc7NXB6HeuBGvgA
         39Vw0TWPifQgIhzAwRc709rvzq29EvOJ9tIbyCDQQQVyKqO+ChqSpdoaJtgC5iBTix+D
         W6PKP3yKgRhWc56b3WAPJe8oTd+A7EUW5eCCQO9Oq77PR0EC0qsI9vZPI7j6Haj1TNr8
         HwnWPm/wsal+txeIQPvEQAW4ks/swv5T7c8YN55UD81OFyqbMbNuA5jhVNJ7mdENDPP2
         vM63yGuy1jPCMQ5vkLnEn2Q7ftizSYomINGBMhcGKRIQcAgVQaSdIECqc5YI3dnY6Luw
         kKqA==
X-Forwarded-Encrypted: i=1; AKwUvBypwH9h0W39WRHA538600EiSYn/9YNQ1e03blbRmgvh/0aig2yJ1R+G7IaTFdYDMFD7R3Q2Brr/+c7Y6Jg7@lists.linux.dev
X-Gm-Message-State: AFuF++mS8lmgM8UA6qtgUfVeg5RHg6wkhR+KC/fFWM8kA97ssPIpHsYi
	+WaX+xsY/QK5wMnH6cq0OChUgF33ujAxT9TUh0M6oupBfZTxggF+t7/A
X-Gm-Gg: AYBFou11KtHCWmVC66oz64Q+M2+sGqlDA1TypwW+e+XgbyoIJH4efxVoDzMZM0g8r8x
	XXXN37IM5XGSnoOsyIlkxzAqlkDpn3ngc+T1w5XO1mA4IVjxWoo9hdpDX+C3g/gCwHih3YHzHyz
	Kzi9VXNP0wn0WbWhLgsXrjo+CxSDn6L0rFYTRC7HQdYPXFvObEpLDf9ulLxAW/r48MrQTD1aOTF
	JdjTBPYTRMQjD8jk2miLNZu2hjGhPA582cGB+C8u0LLzIh7S/nX8rAQ0qxXTkQQw/fIZFCRGJ2F
	4FIxvbNpouUShpoOIwy2o7uKW9ZJQHKnOWDPw7DuWKqLi3fWAPqlhbpdz2mZ8ByvCuAnPPECM9x
	S7xWgoW523/j6b/Z0G/rOCrWHIG2a+Z9F6uGiQeU0aJT4GgVKPsuFeh2/Z3uAoVzqBTeAEENYyi
	GCOe8YN2q7LtK9QQUuOec61DmRk5gcoCgs1pNQedtEr43FzxDUBVGi8pqSLVivO+LKCCROjzBSO
	3pCgxLJybFVAW6W31tqYp3JOrafvx3ffz2qrGfCuy55iiW01mC6NhXCSChgiYuB0U+GwH5gPPek
	QN3ijwzAOC1fLVcKsD3g+vEQDpAp9zv+Zpffo16yxPy/BAcXU0E5sls03Im3VvkOyQlq9Z5K2Th
	dIwjyL4L+BuwcKVW30nhFM87Jzwv+8RMyLS3MqJbUJZ9Myd6ywf1ZUnOy0bOj8kjz9kYj
X-Received: by 2002:a05:600c:8b32:b0:49b:d03:8d3a with SMTP id 5b1f17b1804b1-49cf8244878mr203713775e9.11.1788704414481;
        Sun, 06 Sep 2026 07:20:14 -0700 (PDT)
Received: from systembl0wer (78-80-112-223.customers.tmcz.cz. [78.80.112.223])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee80eda4sm315898635e9.15.2026.09.06.07.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 07:20:14 -0700 (PDT)
Date: Sun, 6 Sep 2026 16:20:10 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Cc: gregkh@linuxfoundation.org, jic23@kernel.org, nuno.sa@analog.com,
 Michael.Hennerich@analog.com, dlechner@baylibre.com, andy@kernel.org,
 linux@analog.com, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] staging: iio: adc: ad7816: Fix SPI read
 operations and VMAP_STACK issue
Message-ID: <20260906162010.07781ebe@systembl0wer>
In-Reply-To: <20260906114049.32912-1-abdelnasserhussein11@gmail.com>
References: <20260906114049.32912-1-abdelnasserhussein11@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun,  6 Sep 2026 14:40:47 +0300
Abdelnasser Hussein <abdelnasserhussein11@gmail.com> wrote:

No overall description of what the patch series actually does?

> Changes in v4:
> - Separated changes into two logical patches.
> - Patch 1: Used guard(mutex) and devm_mutex_init() instead of manual lock/unlock and mutex_init().
> - Patch 2: Used __aligned(IIO_DMA_MINALIGN) instead of ____cacheline_aligned.
> - Patch 2: Fixed the sizeof() argument in spi_read().

I assume you forgot to send this patch? It's not listed below...

Either way, NACK to this series until all of the patches do exactly
what their commit messages say. Applying patch 1 causes compiler
errors. Ideally, you should compile each patch separately to prevent this.

> Abdelnasser Hussein (2):
>   staging: iio: adc: ad7816: Serialize SPI read operations
>   staging: iio: adc: ad7816: Use DMA-safe buffer for SPI read
> 
>  drivers/staging/iio/adc/ad7816.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> 
> base-commit: 3d6d817622b0a9721e3cc404df3469171582be13



-- 
Kind regards,
Joshua Crofts
