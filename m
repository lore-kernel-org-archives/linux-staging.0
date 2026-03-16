Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AC22D6E74
	for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 07:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773647099; cv=none; b=fqsiMC96p5uiwsD54bccL5eCm6qY1NlPlsAMs4PIIfAgLUWUifVfjKL8tX34dq8HNnVd4dwL6znNEwuu/CWvPP2hLq+g3okeyFBKhK9bEr7J9pYCsr8xH7x/QZL2YyqcGLBVG/s37pSfB6MoSibiNIdPZIxgwKtWtmFL81gmUoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773647099; c=relaxed/simple;
	bh=1RfqJGfRdFLRXoHUVxP7vta7xyvxWsldHLdDG61UM6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VhpEjQJI6dYALZU+Wny85fozT9PaMLKvlmI06siI3sFOfx3ibumJcYrH0cQrmPOLZrq79WspwaSi4L7pkUGVjaQpwdRxix/gbb/PDw7RhvKCejfQydhuONa/9Pjmf31Qb2ytdfX7FDSfSxZZaWXTsWapRn8gMjt/b7Rj92QIMSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uGztaUeL; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uGztaUeL"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48532925a4bso21395985e9.1
        for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 00:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773647096; x=1774251896; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2D0O8SjSzwAzQxCfBFMk6mn5JoB9+VPa05Rt+NX6daU=;
        b=uGztaUeL1I1VoqdEgwayXWQGqV+XbHL2uRB7HtIaznPCx2OjgpA3is/lwqZ8sfmX9/
         pYH5mD5GreACYoF6UqY7OlSsT9eCvAr8fp0wMRx68qA6eJXqEqwN9y3W8YNmwKcFIlgo
         hDbjWNfUvaHgxbOKHI9hrPSB/iyv2UQuX8DcE4FWFTYVZ7FHu53PLA4ra7jiOflrT5K+
         S4LLHqEFFimQ285GR1qC4A6UycIw3qZakWV1uWHO2hB/6MD6tAA6dvZL+Et0+mvmz/Rs
         GAKXnT3JGv0TFCZkXuOmO9Vbt0HH/6QWBSo+/9mdrYYt9+PdOFy20j5eilEBD9V8zKip
         yh8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773647096; x=1774251896;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2D0O8SjSzwAzQxCfBFMk6mn5JoB9+VPa05Rt+NX6daU=;
        b=lemnWHfyhYf+nQHPdWMRgF+t0W5kKgh5Rdlxu3tHFGcmgTux/D/yhOlxMdlixihXsC
         rQtT4NwBL7lC0Bfznywij9c3fVqAx6Ux0oE/DScGO2kIq3NIRYqD1D1tHT5le4w6bRZ8
         ZVjAa77zV+S7jTfBqSPPm5UZ3lDRUK1rLTDYoVAbfVTpvjGkMipj74rBundLAKWrYSse
         3A5OTFSr4o/peLZ8dAZxMf4E0ecbUZBtsuZJ3FiwxP5Fyf65GegcDu7acXspefEyxq85
         T/n0WzV/zyFkEo5xU10reqxFxgVHjljlM8goGbDUKt0kq5VeLrTMT77OtIEyhgoIifMT
         rIRg==
X-Forwarded-Encrypted: i=1; AJvYcCVF+g1izKhxxTpA4ngataxWexaRNep/4hdLPIj2aSsuc0xqKrEwEQmsBrd6p+pTs1cUznfLhL4u2duq4V/Y@lists.linux.dev
X-Gm-Message-State: AOJu0YwiKjvduCUDCK8HiqLtinbCqyf0r0IELpitBEGPWPlgQgM5kNJb
	jPkSed4kl6PzUJj3lA8PpJ7XMwv9nc4IYBalfRSYzsZ+8P0z3uop7Ft4bs9plhxcP8s=
X-Gm-Gg: ATEYQzzqBMeF4VW2GnkAIP9uXoKMM/IymX5VoAAheXadzlh8xNExC9JVmupTWI9tFC9
	ITfpp41p+Zhk3vPB6DS0+2mJvyHblpXKv+dR4SFd7J5hFFNV3zZBmjyBtfc0f682MhestFA+kHY
	q0J3f6bpbwp5o9F3JHd718eOH4aJyMQQyKVcXyaMcOa8Ot+2VYsBBpnE/DiBhyzbyEmFvhEFdt0
	AEVH4llOVwtHHS4Bxw3HCgQCFgK3Fo6i6qi2PYqPOTPCN0G8E1vkthwREsgnBDnYVFz0mIvyv83
	yGSoxKp5Ob3YL78yq5ECgiclMCsrBH3/ipw1mu8/t7jjXb7gWf/0lBuV4vNmAKxCC23lgXmufNj
	uJMl1yJfzaTgdj+4KRAed+zJY9kwtFOMbe/oYsmfLKXkr+/DZ6ceJH3VmEDOPx1nvJjvuaAt6wZ
	D1ETI87DDrMtVfBXhkmoJ1njWdny++
X-Received: by 2002:a05:600c:8b83:b0:477:54f9:6ac2 with SMTP id 5b1f17b1804b1-4855648f5a3mr192856735e9.0.1773647096249;
        Mon, 16 Mar 2026 00:44:56 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48557c6700fsm85177635e9.22.2026.03.16.00.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 00:44:55 -0700 (PDT)
Date: Mon, 16 Mar 2026 10:44:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v5] media: staging: atomisp: Remove unnecessary return
 statements from void functions
Message-ID: <abe09JiclfebsrXb@stanley.mountain>
References: <20260312-atomisp-remove-void-return-v2b-v5-1-4f68de466c3c.ref@yahoo.pl>
 <20260312-atomisp-remove-void-return-v2b-v5-1-4f68de466c3c@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312-atomisp-remove-void-return-v2b-v5-1-4f68de466c3c@yahoo.pl>

On Thu, Mar 12, 2026 at 09:56:18AM +0100, Tomasz Unger wrote:
> diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
> index 856561e951a5..0fe5ff64ba00 100644
> --- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
> +++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
> @@ -339,7 +339,6 @@ int hmm_bo_device_init(struct hmm_bo_device *bdev,
>  	spin_lock_init(&bdev->list_lock);
>  	mutex_init(&bdev->rbtree_mutex);
>  
> -
>  	INIT_LIST_HEAD(&bdev->entire_bo_list);

Urelated.  There are other unrelated changes as well.

regards,
dan carpenter

