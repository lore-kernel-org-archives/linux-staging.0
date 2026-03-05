Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE75140E5F
	for <linux-staging@lists.linux.dev>; Thu,  5 Mar 2026 05:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772688882; cv=none; b=LZBAqg6YghAQREXcOMV8gtycL0SLtbHoCUIEcsIiWNBb0aFGT329bHTDsOafn9fZ8tP0wWXLZVbi2wzPZNyMy+gzxbU4k2VMWPCRxdfE31h4olfjLz8IE4nUZtpDfNtBzLNouqEzgZu3rAu01xwVQw3yksRGe8GACv00BrK9pgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772688882; c=relaxed/simple;
	bh=MdT53VNsJo1KTOqLFXLHrv9hSp5uEa2RzIedrlI5hlE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dj3hbENiFyN1h0Q1RTvh77AKQf9/eqg4gNqePL3p+Vmf64o5buLD/AE61eCM5tN/WPSR/PRmjKvZrWgrjA+c7JEBLJYwTzTGCoPqIfm3bJAPTtgLlEbJhv3YQQpjT5UKL7/n1JT8TfuVPDgSL+PlXnZnyo4R47UZSfffcvL9PFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ion2x/Uw; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ion2x/Uw"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-439bc14dcf4so2459082f8f.1
        for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 21:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772688879; x=1773293679; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MdT53VNsJo1KTOqLFXLHrv9hSp5uEa2RzIedrlI5hlE=;
        b=ion2x/UwIRyUcXwZBbJZQav18UyEIfSgCywnsruyxKJ3uDTGwp/D2vNKFsSd+pPuY7
         3GpO3pnUCW/ZuGPfakOSwBV0ePGMJZH3Wl4FIG17qaKSoYSofbpxk2FzjpSMOpnShw8l
         HPJl6XxvMVTOvCz501O+kt/uABr0StHIL8YqDiGDJtiBdCfjHgABu07baKj14EikbTeX
         R9sMZV1Zu7sLYAxWULLMZFvFOboPFA2KWisBglxVHVGeEFb8837HWypusclrQH0sOSIR
         wFyBOI5A2AC0epw+wnwp+O4UNzw1IeakVPb6TF9xb4XjjN1V3KC9awkGHR1i7RZ8MybR
         JNNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772688879; x=1773293679;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MdT53VNsJo1KTOqLFXLHrv9hSp5uEa2RzIedrlI5hlE=;
        b=tM3NVg+qrY3kG4EKVrDo7G85xsOf1Y+EyCmQtI+TB1OEhINsrbMS6gaElzirvlLgbZ
         0eQ1y+uppmFf+ASpZ519OUatPtyJzclqAsC1GCc14130DWaGrwJuoSbv3hoRr06hKX1V
         GVsFLFpvwxEHk9vNsCaITMx0KJEDA/uZIcWJSkwI4eWbr316A5cy6zEQCcQyWH5D/DFb
         ScGkVScOp5NL7SzZA/5YlxT0x5jkgrmJi9UI0jKr7ao6KHsye26qGzLrcEI+1yXR1q56
         63MJxyf8pnBAaLL6PrrIXb+DcdsU4G1OVZ8/n/bPF/9p2noOW+XwJW1fzFDerw05YJP1
         JWCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrkSpXSZLDGKnGlX6hVJWPGa0w60tzWI7mh2uyLwo8o50l6eY6qdWfpvyjBxsnDj/apiaaIOVuzT6C05LK@lists.linux.dev
X-Gm-Message-State: AOJu0Ywi5Q4Aestd5+5aeYR17zTiexSmidK6+zTVgHKFwpzURWOsqZhv
	jJabR0XJPCsZE2F31IceeTd4uHHudxrizeDReuyga/0AORpCQt07vxHrLQnnjmj2myM=
X-Gm-Gg: ATEYQzzmE3LvNom4XsZhdPVESQhCiOA6I4b5vC2LKEbAT42MCd0c21l2+AxXUGDyrzl
	imWMllvakX4HnP7Vu6x9fAFQuTOpm0yvlsbrwN37xyD9RcD20QGf32PU2Ing/5Fqb++bsl8BMLK
	+vA449JqjEjy6P4bE6msK55Zgwj8mQXfdFyK0xwl4o0Gm5JqLcccInO8vQnlgkLTWhok/iZTCKK
	70YZmoqmXOMsf7QEfVfglsHHFYw8EVHVmICyqmqvQASjh0IuIIw2JtWAmAJpPQUSPIRm9FGJlRQ
	1HdCTRHDxXQISJYLf6Rpc8Vw/OaDXbsBhythMCMKE6i13ddTNeTBX/XmURoIekAvhRQKUKt66nY
	OIBIJbUwniAxqOuOlex6ZIV3dgKv+p7CFx+5gLLs0IfLcqF/n0HsiSkScayIhwNCRXrGFWaMWtW
	VKIYU91k1zfrXJiVq/Z7a0IWc7Hkno
X-Received: by 2002:a5d:584c:0:b0:439:cc67:abe9 with SMTP id ffacd0b85a97d-439cfd461camr1819806f8f.27.1772688879158;
        Wed, 04 Mar 2026 21:34:39 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b8807a4esm26871282f8f.4.2026.03.04.21.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 21:34:38 -0800 (PST)
Date: Thu, 5 Mar 2026 08:34:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Soham Kute <officialsohamkute@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] staging: sm750fb: sm750_hw_fillrect: propagate
 de_wait() error
Message-ID: <aakV6zJbUAJR7j8M@stanley.mountain>
References: <aaVT1mSeKrSSlrha@stanley.mountain>
 <20260304173529.192067-1-officialsohamkute@gmail.com>
 <20260304173529.192067-2-officialsohamkute@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304173529.192067-2-officialsohamkute@gmail.com>

On Wed, Mar 04, 2026 at 11:05:25PM +0530, Soham Kute wrote:
> Propagate the error from accel->de_wait() instead of returning -1.
> The caller treats all non-zero return values as failure.

No, the caller just ignores the errors.

regards,
dan carpenter

