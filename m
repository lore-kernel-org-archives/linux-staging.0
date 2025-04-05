Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6FC2129A78
	for <linux-staging@lists.linux.dev>; Sat,  5 Apr 2025 16:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743869783; cv=none; b=RVQeQgnWcsX/eVYhmem1ZPOxBnDlN0djhcKw73bOlb/m3n7pJ7urFJGQsK+D7HjJ7JvLWvQLi0eDtEN2y22r4vRR3L3AJDB9yyv67ayk/u0rTlFagg+rffnmpALh7R+XtEA8Zs2MEOCRk3USNvsm1hR+u8jisobcVktgSy8uMFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743869783; c=relaxed/simple;
	bh=f9fwwNv03NbODRWqKK9+JE9Q2mHw9mQ/GAhJTTxPSIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DSrRZ0Lr3SWohJQUBiGcCarpUdoNti5Cn28maaZ0N8YdF6rvil1oLA9nZ03qYLwHy3s6izfLKcvq9pQMf2MyrCMT+jwOg1/r9ODfeJpWIplAnUvx0Mp3ZNR8ouYoWE3b2i5StQx4jwOgCAFTjEdrXJCKkp+1Jp83hGN9RRzPYyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r9T7KrJf; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r9T7KrJf"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39ac56756f6so2477098f8f.2
        for <linux-staging@lists.linux.dev>; Sat, 05 Apr 2025 09:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743869780; x=1744474580; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kQA4y1FzPmhivnWC1Pgg4oxOyq8Cr4ueMJktDOHR4oo=;
        b=r9T7KrJfIaSbXDNTP1BBVnguuFKioV0q96Q/y42gYNxxNMV2KS84o80XUi9wRstvjH
         8byN+mS62ppwtiLL1LvCkzdCb7iv5VAfzSYr8xKRzsoimmXIdbzzLfTudehZIjoUmXiV
         njqGTzta/RNLBTups9mjky7s9COW/E88DSBDR/v6sgYFgHfNriJv8/Z5nelIlaJm/eg8
         RLJZDWD6mnJ3nSfgPUB3A4f2s46y1WN86CNmU8G55Jxzlq2J17ClFfBF4DvrgcQefTg9
         gK8x0JKCZQOACnrm0MVVHMDZRMUTYyW6GNwSCi8oq+CMc+Ek1tL7+PR3aCDb902g+eAJ
         jubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743869780; x=1744474580;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kQA4y1FzPmhivnWC1Pgg4oxOyq8Cr4ueMJktDOHR4oo=;
        b=ws/986ffppthx9xzqwuzwb/QVR0H1y1sJE9FTr9tlS2cFB7Ng8N2Rv0UDODOCon4YI
         h9R4EtagyqWkPcIaC+JMhQHfIw863pyzfdNoxSMRxZw0Oi8jx8oMtCyuGjXmyOrXtB/t
         6hOdi2L5y5xpYnXpH6OWhd48LFf11cn1uEvDw1ev6N5+3qJJfE4Um8ha2wFGggqgpuOD
         mxwZlS3PvPns1ol8FYBqedR1kdkifeLKVDq05PFT2cdJEcTIkgWTdJ44mc6RARUCsGtE
         s4vfnL23fy5g5FO/xaYx93yffX6ikK25eHnHmuV34GLfidSYVVALxMgG4ULghy4WEGTC
         lHrA==
X-Forwarded-Encrypted: i=1; AJvYcCUZPjbAvqbM1XCYdL9UsOEfI0ccXdi0WjT9f0zCF6X2mo9MfOAYDTnovslY4XaKXLRUlXb2o+0j+eg9jj5Q@lists.linux.dev
X-Gm-Message-State: AOJu0YwhL/E+1dt87AAyrOdVjEU7zBVRjL4vbhBWgK6prh0ebvlmwJX7
	ZaExtW12UGoLgE41IH4fbf+XyrUtnmgrGBls7wsiT6MymVCYVg3yx5bRiWbxe/Fe2/boIBCeMGp
	dhKE=
X-Gm-Gg: ASbGnctfqczvtsRhhj5X4aYlMvhQ6GQdV7Ys8MdK9QYqHsxegIPRGlQaxemDJjchyKd
	0IDwf5gnd1fpu2CHqffijsY8X1f7gXJd0rmVAZTVPdZwl0kL9mdUHqMQoKb69TksT2ovCBB+wBx
	4T34KkDshcCGnUvrvMjnERz+nqg5utsQtjEc15tR5wzZe4rFZ0i+sUKDocIqarDNVca0rgMLjDp
	BV8JAnSdT9hsWFvbZqthfmkOrGmD7X7212Z/jzIVNidnV6vgTGAPO0QGsXAIqBEvGj2j7eIGKP6
	CzB7dvf7F3EcwdsGfLegXv2i1cYmQo6RM+Rty5mLIzn0xqgXZWER3YKtCaWw
X-Google-Smtp-Source: AGHT+IHUbTxn+Ru3ccdmf6QiLK+OvdKs5Vbjv0pWdVZVEKvUSxpiHrDhuhyHXkzdAGYKFCiWEJML5g==
X-Received: by 2002:a05:6000:4282:b0:39a:c9b3:e1d7 with SMTP id ffacd0b85a97d-39cba93ca51mr6004112f8f.29.1743869780109;
        Sat, 05 Apr 2025 09:16:20 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39c301a9da1sm7148016f8f.22.2025.04.05.09.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 09:16:19 -0700 (PDT)
Date: Sat, 5 Apr 2025 19:16:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: gregkh@linuxfoundation.org, philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v4] staging: rtl8723bs: Add error handling for sd_read()
Message-ID: <8fd63a84-0fd1-4596-a9da-913e9c8eb110@stanley.mountain>
References: <20250405160546.2639-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250405160546.2639-1-vulab@iscas.ac.cn>

On Sun, Apr 06, 2025 at 12:05:46AM +0800, Wentao Liang wrote:
> The sdio_read32() calls sd_read(), but does not handle the error if
> sd_read() fails. This could lead to subsequent operations processing
> invalid data. A proper implementation can be found in sdio_readN().
> 
> Add error handling for the sd_read() to free tmpbuf and return error
> code if sd_read() fails. This ensure that the memcpy() is only performed
> when the read operation is successful.
> 
> Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
> Cc: stable@vger.kernel.org # v4.12+
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
> v4: Add change log and fix error code
> v3: Add Cc flag
> v2: Change code to initialize val
> 

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

