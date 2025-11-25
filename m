Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DEB731A565
	for <linux-staging@lists.linux.dev>; Tue, 25 Nov 2025 12:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764072628; cv=none; b=cqFi8dUxuyCoXJ0c6+Q4QyvqzxnDO+CNHt2U/+W79zV1lpsJaCCznSnINgxwj7CR0CDAX3gE8YHaPir7y9dh2e9B9JtoeS7wyIGILzDF8joN3ckK+2O0lkRqiT5MEYI+Gr9GTL9tn4wGWtitnd3a5OgdD0C/fVHVNm1NiDEWNsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764072628; c=relaxed/simple;
	bh=vc4ZcsBT3hancraizAwEboUrHxG2gb53cAJYp9rMBSM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qNHwzc6UNcDvpVEZcK9t2CnI8ENK1LlS7LUaYsO+tmMICqBsOLFH+OH6XLpTClxgozMMgAVsvLeC7sn9SGZXeSf9WBRixLbwValTQA87p12RxQRNbFrH7GdeAmD/XtDuFMU2cXjqRv8Q/m/iCiMFo+U07nmOs53FpeEcRuM3VQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DU3Oh0i/; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DU3Oh0i/"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42b3720e58eso4123847f8f.3
        for <linux-staging@lists.linux.dev>; Tue, 25 Nov 2025 04:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764072624; x=1764677424; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K2OO2QVScy6triwwM1Pq5PaJWVgHVZPdOO72BhX0Y1E=;
        b=DU3Oh0i/bSQW0j1rJ0f+Brc44dZl4uleYhxZ3C/3ooR8LKlG8TI772wDOZ7zuXIhjg
         ieiVpP/ng4ZSsooWAR3YNhaXlWrrdtloaVFk0kFTXfk3iP5qis98OhT1JeE7Q6O37VhW
         nxLFFVoOgH8/VkK4Af46HoIza+acnwbzHIVZ8WKsGc5yZ3aIA7e0uCjlHDe9ICrCqb5U
         aFPxzs9pMGpXNPVj4+ETcSLyM4kFGDza3pC7X8idhGXDHFxDY//WxpuKAVNdeKRT9DF/
         Y2e2tLYQphofMi5C/NLCbzsLuB12mqdRn8Tcc/CXYrpQYdfZ/XkYPz8tLoUgGExhzYb1
         ryRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764072624; x=1764677424;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K2OO2QVScy6triwwM1Pq5PaJWVgHVZPdOO72BhX0Y1E=;
        b=smZogo+9McZPvdVusaMCxepi97xtUxKAdaGYGZ6uUuSBiczr8fQhhWFuJUr2IxLyGA
         sne3H95fg5GuUYv6jFLhaOHDGO6nnSTMrY4HEOiAXj+BxeP/8BmgrrCzdaPgkGAkqnFw
         1uDGOtF54B22w9rGzdvZasP7EDLWNdsiocqKHwfZwIpuOky0YArunE/liNPP70722a8o
         zzLSNsNkITXfhTJTQuX0rGyFki2vzeYRxOAAcij+hvap1N7saNYeu+gmve5/0xoN3JZx
         xAxqxeGt0As8zpErNB/sbgG7cxM4wolzNDcpmvKeCyKGMpknP8PXuz/W2uC4TXnn09HX
         8wZw==
X-Forwarded-Encrypted: i=1; AJvYcCXLc3vl3PuamOzlYMkOL2a5NxMdFQSCkWmoahBoZFX8hAawAC2Pkf1iPJnhVSIrKJi3KdMsbmed/s0jZrCg@lists.linux.dev
X-Gm-Message-State: AOJu0YzjfatwckxcKKLzuNmqsZfFRKQXSDKB0guL4hzZYpUg8LJfsZ8D
	zR30yKBgBtUnddEDBxCfQ+h1o3bp6zf6Je3hiL0UIi0M+5WZHjISO1gBTIFWlVmd2oE=
X-Gm-Gg: ASbGnctRgfmNYONrcL33Z3e5CsVEyb/sYpyqD2M528C/26LvZtT4DSczc7W/pYcYOUZ
	stj++yvCb8lsb3cvzdwryEsRnE7cF4DcOfEs4+t1WNdnAzmmpqFoWvmKDtHbZqGFPo7vEHArdl5
	yMb6Bq5zYCcAKCCmGOP+nnS/RXY2eLaqaLFz/ApD+X7igV4VOyrtWRfRDUbmFIvAuTToGInyb7y
	y83vc6NYq1n+3REB0rcl4lGf3PksV2Hsv+1Nbmts4s18emScWht+3iZXDtcvkWcx26+E9srAkLc
	HaigsqPSD/8lH2YwPPN74VgwuURsU7kvIh5Z/737h/z/Yx5Zm54+N/ORcJK93RDwOGAgSBPvUh1
	NidpeFtl3MsSVv4iggdx0ab7F1z5k4V89Tksz5q4m0umE8wcU2cP9TVazxKTkdpDZq5WIrucRXf
	hIuwN+TrMw/rEJxCCn
X-Google-Smtp-Source: AGHT+IExT+Ek+xNvguyC7BgIOl/onhEbrt1EeiBDSXVp/RXupxbve6p1sGi/hZmNng9xoP+N92kDvg==
X-Received: by 2002:a05:6000:2385:b0:3eb:c276:a347 with SMTP id ffacd0b85a97d-42e0f1337b8mr3257360f8f.0.1764072624229;
        Tue, 25 Nov 2025 04:10:24 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42cb7fa35b7sm34583833f8f.20.2025.11.25.04.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 04:10:23 -0800 (PST)
Date: Tue, 25 Nov 2025 15:10:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Navaneeth K <knavaneeth786@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, david.laight@runbox.com
Subject: Re: [PATCH v2 0/5] staging: rtl8723bs: FIELD_OFFSET macro cleanup
Message-ID: <aSWcq26kQ4s7NeRT@stanley.mountain>
References: <20251125112059.16913-1-knavaneeth786@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125112059.16913-1-knavaneeth786@gmail.com>

On Tue, Nov 25, 2025 at 11:20:54AM +0000, Navaneeth K wrote:
> This series cleans up the rtl8723bs driver by removing the custom
> FIELD_OFFSET macro and replacing its usages with the standard offsetof()
> from <linux/stddef.h>.
> 
> Changes in v2:
>   - Split the series for proper bisectability: the FIELD_OFFSET macro
>     definition is now removed in Patch 5 (after all usages are converted),
>     rather than in Patch 1.
>   - Patch 1: Now only removes unused RGTRY_OFT, RGTRY_SZ, BSSID_OFT, and
>     BSSID_SZ macros (dead code not used anywhere in the driver).
>   - Patch 2: Split long line to fit within 100 columns. Also added
>     <linux/stddef.h> include to basic_types.h to support offsetof usage.
>   - Patch 3: Fixed brace formatting issue caused by removing commented
>     code. Removed unnecessary outer parentheses, moved the inline
>     comment to its own line, and added braces to the else branch for
>     consistent style.
>   - Patch 5 (NEW): Remove FIELD_OFFSET definition now that it's unused.
> 

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

