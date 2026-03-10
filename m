Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFF53A4F2E
	for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 09:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773134725; cv=none; b=ie4UeGyR5J0n3QD5p215zNRdqrQEy0ztC+lsK39pH8h2cb+OMbwNek5J0RtpLIx3nxFCWvAtpP8utMX8bsVRWZqyD3+cNX74M1aYl/ud3JCxrBJcoASRzJwfrBW/awPZTn8JLwPZNcd9a6GQx6HubjRGCzOHjml7opgenDnhaWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773134725; c=relaxed/simple;
	bh=zgeuqfwH1RMXDtuXkgPogtnnY6LRwXDN+uCdc5XzBxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zz1VvRAO6228+xAXBDqFr4F+ToUDyoHT9Yi5eGNQmcQ2KGfN+76vJQyy/DjDdiMS5sGuHf5/6B5ge/7C3jS4WhQOdiDttEe27QzQwDcfxifwLaJGoBvdSoqV9gh4DGd9yeonsygo/OPUcPc/64WYNqDYXQZiFGiYCp7mlim8BK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yvO6y3x+; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yvO6y3x+"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4853f2826f7so16700095e9.1
        for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 02:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773134723; x=1773739523; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pURy18WRph5P6M8o2xJ9EbetJ9xY8Ah782hTM5xM1b8=;
        b=yvO6y3x+ETSA5nIWhTyHAOb5zCKulYg27sI2QayChMX0Zv1booLd1kiqCWQOqYV9Dz
         C18NMmjMoQR0xNoBKxEIYok8E36WgQkSbh9DuaBLsg6ja2ZwuYlv3vo0hL6AtWmDmjsV
         8zOkpdR3vWLF0v7JKdIYJWb056MTmxG3RZcT3CS2SjqTCchVlC5FCfIJi/4YX6vClwKk
         vbsSUsad12L0MhTPcJA3TltTwNLfmYGI/GG20wHesz6XMenoadPxMu4xCKAQCGI1cQA8
         eOGPzI7mTggF6n6IaIqSSaH9OPES0MixNWkyndnEnNgZA9vJJZetrMMHP+cJpLj4z8aT
         QNkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773134723; x=1773739523;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pURy18WRph5P6M8o2xJ9EbetJ9xY8Ah782hTM5xM1b8=;
        b=Z6Miy7fnc7xFJE7D4pWimQ23nws4idz+CzzoTggj9/gRRMyBx2ej6DnEaZyYLr8tnu
         3B53SPxE0rb4boujQGcbq/eByKvKD6J+jPIUcRZsko0Y2Ol5CKzsv36P1FDSNCLg2N7e
         8GV/sMpaSBoJ110rlBY/xjcyeq8uYAI16Ile9T/uWDR6qDTTJqYhbHxtdNLayTnkuxEl
         pWvo8+1w3pQafdPansTZRIt2NcQHc64QOMgtzvYodc0tLURGt7uxwdXXd+NJcRvQ3TJQ
         Ms+3seNfof3ti+4QjKpmNxoDRBZvYZJPhMUsD3AieiAzZNC2nHBLXrlhaf865DFuuD+n
         XWiw==
X-Forwarded-Encrypted: i=1; AJvYcCUce1djzMOgup/llBoZuQ33aoMp0jXh24QaWjH4xJovuIcYZHQm7tt/96mxqDN0yoT2I1B7pW7GOAcsBNca@lists.linux.dev
X-Gm-Message-State: AOJu0YwL+cfdYX9SxKgnEgAhN6c3SutPNawrlrkykEasFgY5z0vCDagi
	FsXywthT2Pc7S6qV3ZGmgspLzSdc/pSq1l2x93FKWiYu6HJ+ULqmo/ws/ZQolqGC2GtS7IsJijH
	7fBaF
X-Gm-Gg: ATEYQzy0qSsfUDLX1EYT5AMX6mVRST5TVnVYJdVeYlgA41Nw2pywUZETfSTgtcbQWB2
	Z7h++cYpsvo8Yvh5Uh15efq4FrX03c02Vix+NVK6n29nDQ96V7cOVE/eCutwUmK4jINMVd8S9PM
	9JQn04SNNqn8iZWP1HtdL/CCl1lyJmPbht/7tfC/Wh9iiEycjtC2UhCsma7nTwpyh/JbDZiAcmu
	DUzzhoKuhwtRSSpBudVhfqOX5nn10gf34/yXAEuGll4tt2U1X/6XagwZWOI1mfk8n0TqJpHINY/
	O+D0CrekstNz7GFh1jRR5hgNKtZj7cSgkKhVWo5Av9dpehEdmH5IkL8zV5Li8dm5ZRyndAiBZ5W
	UYgdfrLihII4iXTFEpxMWsjdeHX1J0GLa4DY4owAuPS9fMajLW/iLxqxwmWZ5mqjuVCsJ+E+ub8
	oMbi6xWGtbvySzpjjI5tqCreurq/7Y
X-Received: by 2002:a05:600c:1382:b0:485:3423:727d with SMTP id 5b1f17b1804b1-48534237536mr151744995e9.26.1773134722526;
        Tue, 10 Mar 2026 02:25:22 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541a7f1f5sm108748215e9.4.2026.03.10.02.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 02:25:22 -0700 (PDT)
Date: Tue, 10 Mar 2026 12:25:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Gustavo Arantes <dev.gustavoa@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: convert mutex_lock/unlock to guard
 and scoped_guard in rtw_pwrctrl.c
Message-ID: <aa_jfgmjx1ZE5MGa@stanley.mountain>
References: <20260310084806.34265-1-dev.gustavoa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310084806.34265-1-dev.gustavoa@gmail.com>

On Tue, Mar 10, 2026 at 05:48:06AM -0300, Gustavo Arantes wrote:
> Replace simple mutex_lock()/mutex_unlock() pairs with guard(mutex)() and
> scoped_guard(mutex, ...) in rtw_pwrctrl.c, simplifying the locking by
> using cleanup.h guard API which automatically releases the mutex when the
> variable goes out of scope, reducing risks of missing unlocks on error
> paths.
> 
> Signed-off-by: Gustavo Arantes <dev.gustavoa@gmail.com>
> ---

We're only doing these conversions for new code or when we're fixing
bugs.

regards,
dan carpenter

