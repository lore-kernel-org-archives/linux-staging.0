Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB1E3264FD
	for <linux-staging@lists.linux.dev>; Sun, 18 Oct 2026 10:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792320334; cv=none; b=WZ0d3+91Rn382qqvQPFkK2hlMOISgQCWTcDmoOAv3D4xz8ZQPHlR/6xe2iy2z9LEKwxuz84gqLOYD5FSAOPnnwESMmXoopYewqE6e2xivAoCLE3xvB9OV8mXl/FEpQpBJ3y9lCgpiZlep2++utfjT6syS0ShKWeu8P8xH9FQloE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792320334; c=relaxed/simple;
	bh=rUVv7NTOXfNrMZsz3SZu0rAK+bIM7jv/2ZFJUYvuLJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hu25wYTldUQ9q9l3Ye+rqIncbImB7xXhR85CgAC24xJKQWvcAYCkCf3AZBP4N/eK3E12RLhYkjpfcEwVe7BVfSia3aJieU9mFdB4thIAI2+zJPBdBg7SLCAufpDT7i8j92GzCIqtMWXV1a3zAABPxsYXqyPmyZIjqBBCdGMO0tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fSJsah60; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fSJsah60"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso10292945e9.3
        for <linux-staging@lists.linux.dev>; Sun, 18 Oct 2026 03:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792320331; x=1792925131; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L/iMalGD3TEnhvJktxMOyufJx2rDQSoxS14IAcqEo0M=;
        b=fSJsah60HH4yym6SYtP8H6Yl8Hap75ar90kIAMz4CTMtHOWNtUw0k9JGvXg4BuozR8
         1oqe4ykE3BdNUOLO6meEjPhujz3SVo5xbkdtfQFOiqxHbHT0xE5eN7sqHtjbBQPqBbO8
         v9HZqT5J+iIb7pm1VBh2ZiFewMpVh95UNgseF1Sds6A7wFGSJEom7vWY4Jy0uUttPP3P
         Z5pyKrnV5I5aaN5t8vedlxwdcGuEX3eZ7XuGyc0JvqG2XcW/FXDELuG+46AXEsZLT9e4
         lb7X85nJ322NBaV71JI5R+DxV+c9mQeaoBZ9ml1MyltgJm5mcuXOtwMRtgpHgAZSkVg6
         0QeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792320331; x=1792925131;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L/iMalGD3TEnhvJktxMOyufJx2rDQSoxS14IAcqEo0M=;
        b=b8p4jBqlSl14bSA1/bi6432xsLS8PIWsLWGeFZi1DAfvAqRzu/prPOQKMQ1XRAxdU+
         Ux9ylQO8CYacKj+qrVwpq0RbCOqRti8lXN9C3fMoZ2w49sT5t+7kjzllywKvxlKwd/fc
         MZUIDGIfktwG65Jlzz9u98KMy37QO+HMrPuBe/vX5dX76HO9NZJSUQLW3FsMWuoTnQak
         ag21AmwN0RJfXesXuUz8ASYOtsoPcvBUqLMXenrjP9Bhwi/HmGR13Q3XJZ2hKikSaf6V
         /vbf3UX1mEhfl4oGSGPtPtjWmrRpRlJ6PeB9HAS45aJOeqaG2kwQQItklNcKXCGFXKmb
         NUnQ==
X-Forwarded-Encrypted: i=1; AKwUvBy+fS0+LytFqAn3qVfr4zSbMCjhCOvldjotXqb0uyM2eR0aC0LvziMkREEQgjkZ2yKsgVXykmJFWhi8/qlS@lists.linux.dev
X-Gm-Message-State: AFq9FYKXzMH1gGWqD4/alRfz7BsVrs1LtR4oXwHMISoMiDJSvnSTVRf4
	6zDruucY8vTBQgp+up7ElEuycJW3ObkacF+ICSNy3o1HBitoKd8cqK53
X-Gm-Gg: AYBFou0JTHVIf9u9bc0j/30rY3HeOLJn3MczuNt8+5JQ5+VrUaSdkMTqI5KgiHtLn6o
	dEZKhMJg9/z8dG134zTqNP70PsGluGNXMK1Ta7N3/tFogT3wnT+Vtjv2gLAo5EKBDKDVJ83mDQ4
	hxP/GMopmDjKzL/G7sdrexvjdXlFjbVU+tDUxkmigOxpB3v+wDABechhUAOoxE89YlXk/z+SBsN
	C69P+WcnqMoxBKIVTYJkoPIgE9TCTBYjHzCmvcD/QHffe4KwOS3zkTq9CFkkYNMIA5K2AeIOvSu
	isLsryzm4rtaKkIQVuTqKGOB5Z/IBrlAlvJbgcRhf5jNktE9rA+1DEa4tGHMKOHy1PaRfpcM/F+
	UPpG795YzRMJghw/UC0/E6LHrBqcUOIlooQa9vtLo/xM5ujkH05YHvFGx6kajKuIWv3HRYhAJtg
	CrPC+rT6c8XRGqGdiHwq5wUXuyr5Uz6sbaYYF42Y01ghRkzek8amYAjw+3+Gc2OkYx4BU=
X-Received: by 2002:a05:600c:a10b:b0:4a0:263c:704f with SMTP id 5b1f17b1804b1-4a1d7601226mr64363215e9.16.1792320331306;
        Sun, 18 Oct 2026 03:45:31 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1d30d778bsm177718495e9.9.2026.10.18.03.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 03:45:30 -0700 (PDT)
Date: Sun, 18 Oct 2026 13:45:27 +0300
From: Dan Carpenter <error27@gmail.com>
To: Melih Emik <melihemik@noirlang.tr>
Cc: parthiban.veerasooran@microchip.com, christian.gromm@microchip.com,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: most: dim2: remove redundant dev_err() calls
Message-ID: <atSjRzJ3_ORJ_uh9@stanley.mountain>
References: <20261018104223.164776-1-melihemik@noirlang.tr>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261018104223.164776-1-melihemik@noirlang.tr>

On Sun, Oct 18, 2026 at 01:42:23PM +0300, Melih Emik wrote:
> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"), devm_request_threaded_irq() and
> devm_request_irq() automatically log detailed failure diagnostics
> including device name, IRQ number, handlers, and the error code via
> dev_err_probe().
> 
> Consequently, driver-specific dev_err() calls immediately following
> these requests produce duplicate error messages on failure and are
> redundant. Remove the redundant dev_err() calls in dim2_probe().
> 
> Tested:
> - Compiled with W=1 on x86_64 with zero warnings.
> - Verified with lockdep and debug mutexes enabled
>   (CONFIG_PROVE_LOCKING=y, CONFIG_DEBUG_MUTEXES=y).
> - Boot-tested full bzImage in QEMU with initcall_debug, confirming
>   successful driver registration (dim2_driver_init returned 0) and
>   zero lockdep/kernel warnings.
> - Verified with scripts/checkpatch.pl (0 errors, 0 warnings).

Don't put this kind of meta commentary in the commit message.  It's
expected that people test their patches, so there is no need to say
it.  If there is something unexpected then put it below the ---
cut off line

> 
> Signed-off-by: Melih Emik <melihemik@noirlang.tr>
> ---
  ^^^
here.

regards,
dan carpenter

