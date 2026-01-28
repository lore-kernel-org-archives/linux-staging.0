Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C5734D909
	for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 13:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769606808; cv=none; b=a2Dk5r6iWSZIOy9MR+oP6zHVH5EWdYM0LjtPUkcyiPZjIHdfDRG13ZcNk+2LjMrCQpwOsbOXU0MFlQkp/5RSJ73zP9s/5iIOqfd4kIES9e428Ij4c/vi+EglW2vd2VCu1jm2oF3ki7FwaZcUqLA+CKRIfHdsy66Dkyv58iGQWHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769606808; c=relaxed/simple;
	bh=OAgapCzSygvH2aPcfO6jzz2bFprxpCX1t+xt+2Pzxr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FF5NfsdSHHX+WXkNy5/s0H0fnG9QWnkI07lsEo/h/3tw1pKfpwqWDK40WVdL7OzWMRUR8S5OGFX3FPdstUAwYa2yPvtS9cibImNgpMqAhFMCTc9tznvyn87BNbqqQFqH6t0cf8ksDYfQyBp6ZQwOc//2rBUNrywVROe0Ei8Mi9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FJcGLjbN; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FJcGLjbN"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47ee937ecf2so8805905e9.0
        for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 05:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769606805; x=1770211605; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=loXdXykH2/xF3NA+Uwx4RfRbCLma9XM176QXX5TmjYg=;
        b=FJcGLjbNYmeFSZ+hzxIPjOzH8eohCFthXrkDn9GYVmyG/60hxTdhP+WcRJfef6w0UD
         ON8FkPI6F4momOWsB0M3UY4clCOtR70AkE7zGEpvSdakcXqMiRmPHQFj+i64XdIj3+el
         2K3YlxZw58l7N1NRAstVTI4kkwYU2b3w/deBzA4LGHJFG0/rV+HT1NaXiR1GwIqUoJX/
         VmlNZYO0kgtoDd4g45ksgFjiA1YbJauaQxStm9Kq1r/TieH3cq2bQXgccMhNVka7nSBW
         P9i1Wpg9Hzre9Y+Jkuf2ahb+OivsiLVltIsUVZontB5YfInJ+jdWj4KfA6T85UZTBuNG
         LPWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769606805; x=1770211605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=loXdXykH2/xF3NA+Uwx4RfRbCLma9XM176QXX5TmjYg=;
        b=R9qfUsg7oDv1uVBrngE8hre6fPhI2FXI0vhFf4bnPG+HppXErnPoMIugNmAN5QYz6i
         xQoSX9PR/+qiuYtY1APBZAzfpMUKwB/XZBVGqLN6L4L7uCzKk4G7MTew895QXVgzRP/H
         oaTyFM7yZ5zYyZteRxQ6nO/a1AhM6VC3zIjBzZPSYDMrAwo81h1rEFDd+yMwyTlAJUc8
         mJHyZ9hTn5qgi75UHgVb/kaEKJy60PAdHXXj7i1FHMPeMYdLgNThacBJTJEPd13I7rmz
         hfjDSlIoY58+mT5A+/rj7EVkL8edcW5zJXSTGBIWK6zshc4LMrd58EcAb30BhiQfeGOw
         +/rA==
X-Forwarded-Encrypted: i=1; AJvYcCU5Rr/ObtMzw+n4OaXvXXD27BkSa9ghrDE6J873QSQI07C3Gb+NPjcW7w2elqsNppkyVsWJE2j8Xbs1/BrH@lists.linux.dev
X-Gm-Message-State: AOJu0YxKT5cUVufbJxw7RuHIeR2FMs7nKBVoocrTcbmOX+SaDkIfhu0r
	oIiJ9OLj3VlkWJbxfk+tGp7e9KulqQJKiJGZve1e+o4w7kWBQ3jqBwOyRL4wUPpzmg4=
X-Gm-Gg: AZuq6aIVPU58sb+j+kobsYkXIZK9UqXkrW/Gxgb77dmkJzmHaoKSDZfd7FYb6/gDwQW
	sdK1tHysgTb3J35qhPZn64AhpXLq8AWY3+ELmBiC54URV+aCWVu+EqtW8f2RKrwyrQAg2fIPqe1
	j2j6VkpWCnClHBOwHuSQK5vDhdWapyL8JFFFX7s4gs2wm9KbZRI36QiGqsBCaGTTbd0WsvK7KfD
	cHb+tCI4mYty2oKY5FfzrPWmLH78OUQCAF65nwyWeN4tFSqCUeDXlvJVXqAbzNCWjZRwzjd16uZ
	paPyA6kpo3UZen/KArvQ9GGPZzkea3oroX1xZIe8MGwf3XAx8wrTUPBM+bqEUdLLNocPUawKzdw
	cLDIEtfEYtiyaCpAQW+mFgnnmAQ1NNiV2AQGspIVdRnvt94Oc0b+WOoNCRlaITIRcCyshOzBpzJ
	jUbJzPKuBVZVqoLlLJ
X-Received: by 2002:a05:600c:4587:b0:47d:403a:277 with SMTP id 5b1f17b1804b1-48069e24034mr70902875e9.4.1769606805009;
        Wed, 28 Jan 2026 05:26:45 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806cde00e8sm66387125e9.6.2026.01.28.05.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 05:26:44 -0800 (PST)
Date: Wed, 28 Jan 2026 16:26:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Waffle0823 <csshin9928@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] fbtft: Improve damage_range to mark only changed rows
Message-ID: <aXoOkXRK2e44W_nm@stanley.mountain>
References: <20260128085720.862399-1-csshin9928@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128085720.862399-1-csshin9928@gmail.com>

On Wed, Jan 28, 2026 at 05:57:20PM +0900, Waffle0823 wrote:
> Instead of marking the entire display as dirty, calculate
> start_row and end_row based on off/len and mark only those rows.
> This improves performance for partial framebuffer updates.
> 
> Signed-off-by: Waffle0283 csshin9928@gmail.com

Please use your real name that you use to sign legal documents.  The
email address is in the wrong format.

Have you tested this patch?  What was the speedup?

regards,
dan carpenter

