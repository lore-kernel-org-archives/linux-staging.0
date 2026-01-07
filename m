Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A2635A92A
	for <linux-staging@lists.linux.dev>; Wed,  7 Jan 2026 14:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767797779; cv=none; b=NQX8eATGkzvBcLMtp0Tx1OsY9iRBCyq8TmXIrNhWgEQ0ysyXGONCM7lzjbyPGZlcFEYLAhOmC7BYPid0M8BnP9b4pAJ4mk5O4uddEILWgUGJtRxXlLGqOxyYRBnj96Q3KPAJrH1lkfE9tedAxKO+BHQi0lFo7nA+GURFC4y+jh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767797779; c=relaxed/simple;
	bh=6MeCMaVVMx1KZl/yJ4KYosMuuEBGYNEAE/7dkmKTwdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vj/AXSPAh1j2KKaT3UuaU/j2/nTnkaJ1wIqeeXldbUHq2jqj4yVqqIMe7Ezyj6YwRg29ZkvWH51lCW6pP7V0slhNlk9srKLBVA7WahP69zSFZ0DLPlZImUPI749xTDIyuF3Wut8N7W5hLo1ZVrQCao0I+VBeGRHsujgGKrjYGlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YogHvZHh; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YogHvZHh"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-42b3d7c1321so1284683f8f.3
        for <linux-staging@lists.linux.dev>; Wed, 07 Jan 2026 06:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767797776; x=1768402576; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6LhQhFurZpdgl7/b1kEWXbKN3m0snq1TE0Eb864rsD0=;
        b=YogHvZHhoSI6fvTZY2TkjYzT+6rZDRYFz5M+OTmPPQG1U1tCMyI2RK+opy1E0t2s7y
         TvoaSYNsYUlxf8xRGcyuSzGpm1M8c3kX4N8PNfZnlPfHE8Uw8Jseh624pPq90KpZMn10
         cmCPHYGCRdnsF9SJcvnJZAn3ZmIdjm3bBGNkinhclJbGEEDV7zhn2mWyOObYjxegF63P
         3D180J/zB04azeAgsmUeGz3tph5OO8wRf6qPB2yGQm/cMjmuU0FUr1P8k4kQ4n3pqtQw
         sx0i/5VX2baV09ictUJWiQiY9xO3IRvRtpu1CXULN5hQimxj1bkZdmc4I2BpF60Gzwy2
         fybg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767797776; x=1768402576;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6LhQhFurZpdgl7/b1kEWXbKN3m0snq1TE0Eb864rsD0=;
        b=GCjz+Xj0MbgKMwmMdm0p1Q84MP7hwv1eou5QkGyeLlJZD4qDqTgZL1JTVayqoooh47
         GcSyi8sHZQoDgAPYNR7alTpc0Yzc7IM2srihiVNJrl/rBTe0JlaxN1VPTTXb6OdH6mlv
         ck1xQGZb9BPOnOQBdt2Pqv0kHysFzzkJ/6fM1//QgF9tS/n+K0ZmdqPK4dC0XXSoJnhh
         oInxt/p99YKL7x1ATaf87+6/lISE8ccjBS2hYxNbcajd4hPqDZQLm1ZHAPg7G9x6aIsu
         Eld7obqRDJAdvyvSDIqEkzP9hTc4x1aGVyKEe7Zy8OcOXq7JwSMQ/TunViycS8CSlR+X
         hobQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5KJQuYfn9A1qkTWfoHT5N2mCQ9AGqZQRb2rbs098AoMFF+zcW02jxHroH0QlpNKWJBQqSC8YJMrCIBoRx@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6CJOM8Hbk+E9f58gRUCFiv4HYsWJCF456UxVJqRmAdVwu8tBp
	tJkph7jXS7tBGIHw1MaFdMwihBBmpEi1nhSzbL6BCgM6pbya8uNTr3ytoU8wXIguCW+EGNK/MIm
	fwsIa
X-Gm-Gg: AY/fxX5/Wlmf9q0b2ypIOzZKUfbKg9usl6XRqohJLRo7ZdwNVg6vadICfzUFf9P6Cys
	i2/kM7bi9t9mNq8sevLeHkQb+XasI+Quj8c4uH5sFo9dy4IuG3CTjimop/QxNcjTyWY4R1a8go9
	8z1QjFZrzdCSmG5k2duaS6bQFaPoerRFkwrElMCex3pop2BUH3mH75PxbHOACDkvqnulhFIswWN
	V8hlhcohxftvuNzoCTK3zLemWt4ntbW6EHbv+34uxjB9PVlbiocJ2ZxmSCjckD6OQJPhNQPTu5k
	wm+Gkolm4T1cCLQDJWKc7KgCp9ijcuEMC3o5LEO2Gkc+onC4Ko/aGr1+loY8PFuPdPZL4SDWmkv
	qOGhIkdBpYkhPSWmfhriGJLdY1t1CCN36pQIKYBx5uA8cuy5tzfEtmz5GaaCc6jB3JEigtIf/3p
	B5S5V3uhwVI3yci1eBcJjHH39WZZM=
X-Google-Smtp-Source: AGHT+IGzAiw5qZR+q9p4Fy6uJSg+53+pgybvwLfo0UUZlMsIyM2yRGUDdFyGy0Ml7AxMIPDauhXBXg==
X-Received: by 2002:a05:6000:2304:b0:430:fdb8:8516 with SMTP id ffacd0b85a97d-432c37983camr3732326f8f.35.1767797775753;
        Wed, 07 Jan 2026 06:56:15 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0dadcfsm10817190f8f.3.2026.01.07.06.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 06:56:15 -0800 (PST)
Date: Wed, 7 Jan 2026 17:56:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Karthikey D Kadati <karthikey3608@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] media: atomisp: refactoring and fixes for V4L2
 compliance
Message-ID: <aV50DGDcPPXUXsqU@stanley.mountain>
References: <20260107144252.74666-1-karthikey3608@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107144252.74666-1-karthikey3608@gmail.com>

On Wed, Jan 07, 2026 at 08:12:49PM +0530, Karthikey D Kadati wrote:
> This patch series addresses maintainer feedback and fixes build errors
> in the atomisp driver.
> 
> Patch 1: Standardizes the 'Bridge' structs significantly by using
> v4l2_rect instead of custom shadow structs and aligning ia_css_region
> members with V4L2 conventions.
> Patch 2: Introduces a helper function for statistics buffer allocation
> to reduce code duplication and centralize error handling logic.
> Patch 3: Adds missing error propagation for IRQ enable and XNR
> configuration to improve robustness.
> 
> Changes in v3:
> - Fix extra new lines in commit messages (Dan Carpenter).

The new lines are still there.

> - Remove unnecessary s32/u32 casts in atomisp_cmd.c, keeping only the
>   (long long) casts to prevent overflow (Dan Carpenter).

If this is a real issue, then shouldn't it be in a commit by itself
with a Fixes tag?

regards,
dan carpenter

