Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30F9358385
	for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 10:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776076078; cv=none; b=YsRKtE1AXsJvHb9ZdnvtKUe1Q34leNfst5sRKHfCm/UwktTSuZ7j/qidpMyhgjdYIE5Qdbomx8Srw75r4M2PufrdgSbGSwwq5claE4YcMSM7i1CgyGq67n28YFHkTwV9nMFO3R+TTEWudVWkeeFijvVEqS5ib11HDgP+5TBgRE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776076078; c=relaxed/simple;
	bh=Wo/H3nkvnYfDOPwSOhXRPoLWQlF4HiLgzcjjj9Gxy8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Eczh/rrF8JO9oYyxR66SpPqz8PwGVhjBCsGSS6tFWhMr2oPKWuf4JQAfIqrV8kl/eEcgIqwKW0rEobXn9B1JZZ5byHdXXapg/eldxZ3xcJXMmzEUj3EmpAy4rc8zoHsY3Wi+w7RCGQuiXK2peZoEmSe9iNxgz2Vu3/d2pQr1XbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a2EwVvcy; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a2EwVvcy"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488afb0427eso53520915e9.1
        for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 03:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776076075; x=1776680875; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5191h31g8rBCcVHs7mCj4zrQVM2ZH4x8IA2+cTQ4Cgw=;
        b=a2EwVvcyaiofmavpU/AcVa0bwyYQvWegn2nCt/dHBKvzTKSUaZK+G/PDQLOg8A6DrE
         n5bT61Er6QCSiC3fhffK3MXJQo5F/4HhhBjlPShv7UZIcRQsYnsCdqLhvwJVBmGBYJDR
         Uo4z2CtISCfrpZGAApuB/OP97Lv9kyl7ZNDIQqB2fYxl/lWPmTa1EK8fRPX1qNlBWWtA
         pv3yZ/jQNxzvdxT5d35r8xrJDNCvYORXX7Ul2cVeDmYrL1mXPJeY8QyRJXeAKn1Qlbn2
         4dgqHV5Zs0LETJ7DRHRu/bm+95/e08yQUz7G4Tkjxhpls0zdXIeYKsQn0nlEODw03J/k
         p65w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776076075; x=1776680875;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5191h31g8rBCcVHs7mCj4zrQVM2ZH4x8IA2+cTQ4Cgw=;
        b=gMUmsJ0iVNfNazivFT+0KfoFKT1W/ITExVHsbHJHLX64yZQUIM2cO7XeSecQD+jxTo
         KnjTbICHOzkMwy8gzJXQe1BGrIaUOFMqn5S9o0Q3SI+8M8E8wqVeyiwzjM4+WVXYtlsk
         Nazf5X07zuX4YrzTLfGGFiPV/cNnafIg0gv84H3em2vjIKaJYjDDdCuJnprD+0HJ2+vh
         oKCHsEpTWGvapB6zUdj640ISgT+LWuu6dzUITmL6DMWhF8tb02Cedg8WGmqTqlO7AGbf
         c7zTklTmbbjJyex7DVF//HKwAIbyIzw2qIzMrvNv9dtQQ8BY3k61XHHk8u7AVxk08z6F
         7R3Q==
X-Forwarded-Encrypted: i=1; AFNElJ+XeTW560QPCmPgDSGgYG44EYu6maqyVvwLj4fcqNo18/knITVBYCEly7fN/WFQySnLHIisvSGekSX0n46I@lists.linux.dev
X-Gm-Message-State: AOJu0YzmWHMVQ5vKFQVAYv0pnNdhcMSVIuUEfx820Fam7Scevvxot+mJ
	AS0lO+fsxZI3FV2Dweplqy/OZAwRTyELYJ6hEeTcjJe3PrUql7/qBt76
X-Gm-Gg: AeBDievVi1yf5wJ5baQOK6wvaPwnM84bFkpAX5NCYl+C7Kj9ByOManz1AZwtm70VBgF
	oT88nBIoVwyqQrUF6Ly17YOFMX+yCcKsI1PWjfHYGfcmDuCw5i0P7BdYKfKyPVkJI3ZA2Ltuhtu
	HeBoxqQQA+sRZWgSQ2+ii1TUBGpkn3R91mJgfOLgLvS+scu/m+B/ipQ3VQavDS4ZO41epnIQDDL
	udIwZqm3sJG3tq+BEn4USRAlnkB3FWV8Mkl063bU0PxvA3iGyN3OxU2bNNKkSQdnrnS6eNtMocE
	wXwfJedXd1rAceUrLFlg26Kl05jpdPstvg5LoZ5QKUtMDU+OeFupLWGK6+jKTvTNgENmc/2VTh+
	vQfdLbvBj/798cRiLOGj+9VV5JzBNxNGphDVBAXMKGXyD2t4N7gMhz7i9ICRu0pdt9TpDYFwKFt
	fepbbRHqbWxXlPhFxDPg4=
X-Received: by 2002:a05:600c:4987:b0:488:def6:bb17 with SMTP id 5b1f17b1804b1-488def6bce5mr60305855e9.4.1776076075070;
        Mon, 13 Apr 2026 03:27:55 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d66773c8sm203145935e9.0.2026.04.13.03.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 03:27:53 -0700 (PDT)
Date: Mon, 13 Apr 2026 13:27:50 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alexandru Hossu <hossu.alexandru@gmail.com>
Cc: linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
	bingbu.cao@intel.com, mchehab@kernel.org,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: media: ipu7: fix double-free and
 use-after-free in error paths
Message-ID: <adzFJnr6Ru9RjqoP@stanley.mountain>
References: <20260412205057.386856-5-hossu.alexandru@gmail.com>
 <20260413101533.496090-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260413101533.496090-1-hossu.alexandru@gmail.com>

On Mon, Apr 13, 2026 at 12:15:33PM +0200, Alexandru Hossu wrote:
> In both ipu7_isys_init() and ipu7_psys_init(), pdata is allocated and
> then passed to ipu7_bus_initialize_device(), which stores it in
> adev->pdata. The ipu7_bus_release() function frees adev->pdata when the
> device's reference count drops to zero.
> 
> Two error paths incorrectly call kfree(pdata) after the device teardown
> has already freed it:
> 
> 1. When ipu7_mmu_init() fails: put_device() is called, which drops the
>    reference count to zero and triggers ipu7_bus_release() ->
>    kfree(pdata). The subsequent kfree(pdata) is a double-free.
> 
> 2. When ipu7_bus_add_device() fails: it calls auxiliary_device_uninit()
>    internally, which calls put_device() -> ipu7_bus_release() ->
>    kfree(pdata). The subsequent kfree(pdata) is again a double-free.
> 
> Note that the kfree(pdata) when ipu7_bus_initialize_device() itself
> fails is correct, because in that case auxiliary_device_init() failed
> and the release function was never set up, so pdata must be freed
> manually.
> 
> Additionally, the error code was not saved before calling put_device(),
> causing ERR_CAST() to dereference the already-freed adev pointer when
> constructing the return value. Fix this by saving the error from
> dev_err_probe() before put_device() and returning ERR_PTR() instead.
> 
> Remove the redundant kfree(pdata) calls and fix the use-after-free in
> the return values of the two affected error paths.
> 
> Fixes: b7fe4c0019b1 ("media: staging/ipu7: add Intel IPU7 PCI device driver")
> Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
> ---

Both the resent patches are fine now.

Reviewed-by: Dan Carpenter <error27@gmail.com>

However, please could you resend the whole patch series as a new thread
(with the first two or whatever dropped)?

regards,
dan carpenter

