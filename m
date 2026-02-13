Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC3123F422
	for <linux-staging@lists.linux.dev>; Fri, 13 Feb 2026 05:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770960206; cv=none; b=pM6UBXEf6Z24l0Lr7v8IxWTt0GGpR0mrDPKbvLLDTh09xaQhCTXqDbhT48nY1gBOhhrw5MKjp4ROIKjY32A1jC1O287l1gK71wmIwoh7jLlvkUTyCk/9BffXDLTIxnYshIgaw6uIxPpPUHXAfiMfor1Olm0df5p0eTbnitHH4FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770960206; c=relaxed/simple;
	bh=YznDlfWASpy1xpDN6uAIUlTCrHe6S60V25yURhSlVqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iv3ZZ9czddxWYn5fXD0aEdm9ReATAvL+B6lrhWhEfUkJpc0gNDmSCJgNFi0DUGt4ED9bDkWi4hTBBjGBzwTOJbgEu/E66APzexYRjzXdgqqcMGDfYBsdtLEb/J3mM2FD+HX9gVoHlhOeItSY7y2pz8hxGVjYOab5WCeVZP6swxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tuWCbOV5; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tuWCbOV5"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4801bc32725so4234185e9.0
        for <linux-staging@lists.linux.dev>; Thu, 12 Feb 2026 21:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770960203; x=1771565003; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ovbPn1UM2C0c4dxdYOWcvaxL8edCYnFQjJ5+Lm/SiyQ=;
        b=tuWCbOV5br5mmA0E3MENPqh+j4oYdigCCus8el2D2Oxd+WAmKw9X6d3ZPJjG+u2deL
         ObkV973oQmp9VGvuDdVIaQ8+BJ0TCrEx3NqbsqJtGrUHcPfvjf3w9Zu78J3B3fxPEThg
         eWEA8qYcklGr+YADFkosbUCmS6jl0Qj0WQN1A//5pVTLU7UXvQx/jrxKZZDM8BU+TuOe
         HSWpYkQl64BMnWKfBzDZXmDX0b7dGNSI8yCBGm7CwXLDqh525j8kVxA+YWu66ciNfEeA
         cCPCDkZixPBKTLBBN6iO39m9+cuByboSoPI88bPAtG1zcDj08vltd0Z/r5auPIv+Z3le
         i5AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770960203; x=1771565003;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ovbPn1UM2C0c4dxdYOWcvaxL8edCYnFQjJ5+Lm/SiyQ=;
        b=LEeIbycvlCC7ymAt9JW3+xg4cdw8osgYMnzfTmFfy860rKA87YhFE/0R0xSC43Jwqq
         EqEqKQvBqK19C14UBPfgiY3LriEpWjdr2jaFBbcj020kbi8m3SWFKqkCr1xcESxdABxa
         qRXIR1ALrd2CrJSec5z/R7bsER2LUjAGXCtg+DKNapiOycWlkygWEzmx7GVKtLqpTXWh
         AWHSvF5n3r6ryShIRu/31Af8vv+uuPHiczhue2kq9cAmkJ28gGSQAAp23OcjelXK33hd
         VpVbsQjIirSlKR+lUsyO9OCQUzvpo/Gn9eLt3jOwl7f3sSQwjQsLpKVbgLHM89gPOvvu
         EaEg==
X-Forwarded-Encrypted: i=1; AJvYcCV9gZfqE9whq22hG+LRkCcj1NknoJZ0/yqAMyrLooaiSaV7cyz5ROVopuH1ujAgBggyqhsFNyh5EwXNx2vh@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8Qu1yHLqgI4lIouCL7zNlssUM0OM3DykMKpyoK/2QaZuq1DVz
	AD94iICooH9T6/KCUHckK+/f/WL2fuXkXtGylELZLHwapynJ2GpP6IxCdrOpkWoFX3M=
X-Gm-Gg: AZuq6aJ8lLINc7bbQ1ttj16i9bo6ipIeZg292OObCWjKhAmSXrehZlgAalpPdLL6/7l
	LSnaoEiWO6oPJUl+jTp26ZsELVaqp0fsXSQoa65EfnbY99kXSDVGJTCJHXwsiEAHVwR+kggB+c8
	eXjKwabMUqPIOIoOGKQyhHjt/baAqfT0okgKttrXonIE0q769pRt5jTQC7Q9SFDebn5Sr3/VqgU
	lLXFsEAiidnz9kFZkgYKdvJOUKUV9SQkrQNGDmYbjjggaIxrLtY7wMAyRfJMrsY+HpXLqM8vfUV
	ZmKxihNnCW/FfWMGKCEGpL3NDvgmOc+kr0plPsy+VwNG25lKboyS/cTfzJnqgNwPXrPmrjh/bXK
	I4j93emvJCNXCxk78id9zT9sJhXp1wHLhVw1qZAsw97JOMCiPzTu0l/NRkJHy1aycnHnnpjAZwb
	bLUtbzdPR7L/0GJwKmcrdqh45RyTeD
X-Received: by 2002:a05:600c:3d87:b0:483:702d:2df with SMTP id 5b1f17b1804b1-48373a779c1mr4996895e9.32.1770960202851;
        Thu, 12 Feb 2026 21:23:22 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835dcfb28dsm164575935e9.11.2026.02.12.21.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 21:23:22 -0800 (PST)
Date: Fri, 13 Feb 2026 08:23:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: RachelOvrani <rachel.ovrani@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] staging: sm750fb: Rename nDirection to new_direction
Message-ID: <aY61R4Tv_vlvgANf@stanley.mountain>
References: <20260212180402.69356-1-rachel.ovrani@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260212180402.69356-1-rachel.ovrani@gmail.com>

On Thu, Feb 12, 2026 at 08:04:02PM +0200, RachelOvrani wrote:
> Rename the variable 'nDirection' to 'new_direction'
> to fix the warning reported by checkpatch.pl
> 
> Signed-off-by: RachelOvrani <rachel.ovrani@gmail.com>
> ---
>  v3 -> v4 : Directly rename from nDirection to new_direction
>  v2 -> v3 : Change the commit message more appropriately
>  v1 -> v2 : Renaming n_direction to new_direction 

This still doesn't apply against linux-next...

regards,
dan carpenter


