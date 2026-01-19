Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEEC23385B5
	for <linux-staging@lists.linux.dev>; Mon, 19 Jan 2026 08:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768811116; cv=none; b=Wd8TevUBSD3gpY1puBuZP+3YPiVFlsn2tVYr2pEYXUXyNCpQUvQ/kE6jkdAa6lbE0Wp6lLIwPEy3DYbDh1ZPvrWaQkXIZvX/XxwJWWoR+yO8MZ3m9/jW0/trbnlu4sPJdYS3RFjZ1vVZhtplKXkbmOoCnndeEi8pDTtdupDCbis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768811116; c=relaxed/simple;
	bh=7m8P2wh/P9RY7ZoVYLQR1DZib4nrIObZwm4pNZaAk9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gEg01vNCmx7cB27tDqigaO2S14Fe5lUErXePZ83y8jqnuXO6tMU+zK9fpssvHcQfu9TFEKzqdph3qHgGF/ZSMDfKbmLzZrIO2A2jpEIPm1cShyD2Z2ZfRLaRNuehtlh3ZeVSqCBsHU+uMfEzRfsP2y+A4/Jv1rhb83+zzhTqkLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cS54dH8I; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cS54dH8I"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42fbc3056afso2392302f8f.2
        for <linux-staging@lists.linux.dev>; Mon, 19 Jan 2026 00:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768811113; x=1769415913; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xYlZMJRmsbfaAH3MOcEttTmTmpnZhQSQBkmuE4OWNuI=;
        b=cS54dH8IZyYCbI63ZD5ZQ9de4POdw0ZRskJ5TI8HqUXWD7mc2BCz4J21UFWueR7eOZ
         zaiHmEcFg4/OuwcWPBDrsybTTnt3feyRI3kfDF7kNokYsfG+8EE0K0ECA1USeKk4LdYG
         GFEPJMAIvCjOORpYkQ4hEhzekl8ku6uLLqkFqWnwWBAXfYJphBpRh0mXy+EOEnTxHZhX
         vfu3oG0Ui2LrhQIqUn4XdcZWwJSvubbv28dTDFid2suHpmYkOct07AujaUY+64ZnEg4k
         yZJ+BLVvIELtcOknmrkktfpQcjepm418qgpf/h3OHkXvI10qkJSCM93qH/1qUaXoRQEb
         Gwog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768811113; x=1769415913;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xYlZMJRmsbfaAH3MOcEttTmTmpnZhQSQBkmuE4OWNuI=;
        b=pMrwjIkHW3MEyh4McdIzjalu7epPBbG8qDvSMxs2aegDBn8ZxraS2/MeQpHLyqLiST
         gfuZGPuVcr/u8r3BayeOfmXtd7MVmcp5Ez7yrTXUZy3nKKpQOoC4AxxUro/UvPiZgz+U
         2ERLpYr9uR7cOWSJ7Nl/B+1cdgBGYQRufFWF3YwbagEa8mekS5C2cve7KQe7EwUdraLB
         mHI4nKM6XlGUSqXZpsMMQzvsJfoe0bqcDuasaoAvQ1SLC0K+d+TNzuKPKUSAHSaj/u6n
         gpDsDFraCLVAPjT4ulFdj57WN4aubowIulYF2ggGMcx+feyWmJTZsy8QnddCZ49pccYh
         BP3g==
X-Forwarded-Encrypted: i=1; AJvYcCU2bnAULVO4lwy7LEmVedd09hjhJlc460UWShzXFb/7ysoPjDfrD/IcW1BlmVpblaJwvS3KkQBsm7J8hyVc@lists.linux.dev
X-Gm-Message-State: AOJu0YwrvUCQRFo4hcf0KIkAXEaLkvepMx1cCRahsyitC00NmUkztRSX
	JgD9x0tDzyBgXOGvEjAxIrnhMJc/NOUahmygt1yv4PjAr52Lqip23pgzsIrdVGT/3Gs=
X-Gm-Gg: AZuq6aKJfKN3OTTBPi0bJXD4TWw+LDCCGBCTbprr4EdOV6dyFP7Doc2IxC7I4S4IimG
	XRPIysjrMHbulCrK0x4+DzkuSWvITqvYGwJVwzSvm6IMhKxqC7CUV2TAgWlb+k13/PAHVa4q0gb
	D/lLk4P1u6yTvBDVb39EP5hCph3TL0Qk8vrSY1iyT69dqU6YS6edVDwRBLK/HQ3XXG5oHj+VgDR
	L9H0EBwPz7x8sfiPmuu6u7CJNF/fB6gR53Hd/l8q8pyC9laVF2XIoQdIKkVhDfOhMEokPDfSm0M
	DsvaX21rq0jNswkBfZ6O7ls1NiYnm471lHuJrwAe869AQcsuzRkJwsp+QvMMU8Ad4WdB7YNT98n
	KIt/xnq/Jw08NvSeWIUvavhaT21klZZxG1non6eIWvGZzBqJ1xXBRVYJw+0blJ6zxO+CG1zbIgM
	KuJXnCG4nV7P51HW1g
X-Received: by 2002:a05:6000:3101:b0:432:4c01:db00 with SMTP id ffacd0b85a97d-4356a031f1cmr15606655f8f.27.1768811113313;
        Mon, 19 Jan 2026 00:25:13 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435699982aasm22573839f8f.42.2026.01.19.00.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 00:25:12 -0800 (PST)
Date: Mon, 19 Jan 2026 11:25:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: 2023060904@ycu.edu.cn
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, guagua210311@qq.com
Subject: Re: [PATCH] [rtl8723bs] Remove unnecessary atomic operations for
 continual_io_error
Message-ID: <aW3qZahKi7UVQI7A@stanley.mountain>
References: <30BAC49CD5860042+20260119080606.189297-1-2023060904@ycu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30BAC49CD5860042+20260119080606.189297-1-2023060904@ycu.edu.cn>

On Mon, Jan 19, 2026 at 04:06:06PM +0800, 2023060904@ycu.edu.cn wrote:
> From: Changjun Zheng <guagua210311@qq.com>
> 
> continual_io_error is only accessed in SDIO IO single execution flow,
> no multi-thread race condition exists, so atomic operations are redundant.
> Change atomic_t to s32 and replace atomic_inc_return/atomic_set with normal ops.

So you're saying that sd_read32() can only be called by one thread at a
time.  What sort of locking enforces this?  I don't see any at first
glance, but I also don't want to invest a lot of time into looking for
it.  Please explain it clearly in the commit message so reviewers can
easily check.

What's the motivation for this change?

> 
> Signed-off-by: Changjun Zheng <guagua210311@qq.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_io.c       | 16 ++++++++++++----
>  drivers/staging/rtl8723bs/include/drv_types.h |  2 +-
>  2 files changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_io.c b/drivers/staging/rtl8723bs/core/rtw_io.c
> index fe9f94001eed..95d42025807e 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_io.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_io.c
> @@ -135,11 +135,15 @@ int rtw_init_io_priv(struct adapter *padapter, void (*set_intf_ops)(struct adapt
>  /*
>   * Increase and check if the continual_io_error of this @param dvobjprive is larger than MAX_CONTINUAL_IO_ERR
>   * @return true:
> - * @return false:
> + * @return false:
> +
> + * Note: Original implementation used atomic_inc_return for atomic increment.
> + * Reason for change: continual_io_error is only accessed in SDIO IO single execution flow,
> + * no race condition, so normal increment is safe (remove redundant atomic operation).

The history goes in the commit message not the comments.

regards,
dan carpenter

