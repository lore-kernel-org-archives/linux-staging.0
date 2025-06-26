Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BAF52EF9B5
	for <linux-staging@lists.linux.dev>; Thu, 26 Jun 2025 19:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750965603; cv=none; b=OrB+5J3561DM44gHpRAA5wKVKKA9AdUH4JsuSiPWRNgocDanlzS161dvegiTuATtw1PB3R2OxuDYyaFIp3uOJJ5pVjk4eyU2todCUgGAhgnmGZvKOZhopS0Ej+Xj3wLp3POZDLLbASH9XJErAKi5DaIFah2QnfL5axTJR6DeZW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750965603; c=relaxed/simple;
	bh=NXZiagHgTh4ICA7Z9PcDT/eyqyxuGCGLWpxNSBxlOw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P6KYTm6YsSBmTDnqt4Gv1TYOKkyiCDOLsf0DJSiHSTQ5JJZzVqRIQaZEZ0UyEzAQw8t5QgNYb6oYRl5MR1uRGie+NBGQTVFYmyVdXASnfKpuMYmRtqEEdkydkUd7cEem5h0hwOOp2mHPeqmBuo2w0KyVw9EVx5OOZ7cZiwBSFFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I9DYoKKY; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I9DYoKKY"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-40b32b6af9eso130254b6e.1
        for <linux-staging@lists.linux.dev>; Thu, 26 Jun 2025 12:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750965601; x=1751570401; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Jw2OSuwMAy9W3gBCyzotqn/e/diunkHgHz26UnXH3Nw=;
        b=I9DYoKKYoopg7HGOaPTAv2JvYOfVG9rUO0QBTtFHkaJxTBiuzM/ufJxT6pOfXXdOwA
         bHHqAUl0TqDV9nsebv/c7K4Qz6ZZc6wXjmGREUbl3Vwj93tgXIq4zlqxsM8STvsDn/+D
         xfDIyLbIXU4ndh0MwUgwBl35oNVz+tFG+u9qmxDrRCl+mwjcxKSMQjVhBw0BDeQNeJ9S
         YACt+XUEhaOZ9e+fZu4eFHfhmhr0lmOkLcBZ5wGs+QrFwnosYyiaUVEFNQhe5835uo1c
         Qdnu/gq1tdzUzqF1HhaiDZ+qBx4sK1YPPLJ/XqeM5A/JZ3OHA8Oq+WWAAiNWB8S22Xoj
         iSbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750965601; x=1751570401;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jw2OSuwMAy9W3gBCyzotqn/e/diunkHgHz26UnXH3Nw=;
        b=GP0qI+RM98Nfn91UXa6x4sA1Hhszbzt6BPSRfTYGr1olzvk5egcuheMHUgftFqzkSV
         y1OITKzSO9QmaaKqMosLKnMe8/zdGyz7s9XyfnwQg0n2XAa3GJoTBgZoKduRsIkbgG3C
         JkbF+ZWt3IQadbOmpbSoYvDZthWUsbQ2IgvSPAOTS80gs5iZ5lVwicwSRq8eqqjiiUjP
         GhO5iSqwWKQeP7ElEyfeYHVU5s7YFqOVjgbE/qdk5L0ojAPRDaTnv3eGED3df+02pXyv
         SP0BFn7baMKiDE5olztk9TtpSWcuyYm/hkE9muiJHwoU9O42zpTLlt6bQHgbGZQPEPJu
         VFqw==
X-Forwarded-Encrypted: i=1; AJvYcCVaOovt7Uentc+R68DfLQ4bDh9lYFXnANzxBFIsT3XAUcFKRlbZr08iLkM/vD35xBrWBjB+JMFC+JW/u3y5@lists.linux.dev
X-Gm-Message-State: AOJu0YyA0qgkGcG3tBZZxJzuddQe8AGeAUD8LGK3BbKuwr8kDH2ki3Tw
	x4jAL9YSfA34a9KzWwVsYk4QgTcVDkWeAw3EPEyDMhbl5ePgjmXVhIBmeycfh3pdI+M=
X-Gm-Gg: ASbGncutqpmRJW5lLOmGT7E8b5HsvzRHHGXBn3KWLpvVFsGQOXaB9YYYu8n5Q9+Wj9V
	NfHlmk0puCfyLHG3/wPpSwuRExcYUi/a39Fd977Nbv4vam3EmTxA9tJDjK+zT9SkQdbK6xFY6ns
	zrQa1G3F41/O36aTZwwo0a1JICqipM9m5/wagbWay9NKUOX8CJ1mleiRwr5pNifXGpwv0scukj+
	7s2ngfFRmW5y1RoBo+ipNymw1HSVMu5hL4diguUwAQV9hOzKU0NJ/BejMpill1mmTxCKW3LER8F
	5LllkHWhPMobBMgGpMs9ts142fAAvcfr9CXqVnHbTrIvsdbpJE5SAAmYx1nVX1U0MD/T
X-Google-Smtp-Source: AGHT+IFY7CJ7QeQO5lGm3SZuq1NkH2K1MhQoLCsDuDsQ1TcbQSnB0KYdrUkAGt1PGEgX5gAvdU6Ntw==
X-Received: by 2002:a05:6808:1592:b0:401:e67c:b3be with SMTP id 5614622812f47-40b33c495a1mr285207b6e.4.1750965601252;
        Thu, 26 Jun 2025 12:20:01 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:154:5a01:d5a1:16d6])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40b322b1d89sm75889b6e.19.2025.06.26.12.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 12:20:00 -0700 (PDT)
Date: Thu, 26 Jun 2025 22:19:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: andy@kernel.org, hdegoede@redhat.com, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v2] staging: media: atomisp: remove debug sysfs
 attributes active_bo and free_bo
Message-ID: <8b08f2a3-8219-49b8-be47-fc33a95a3953@suswa.mountain>
References: <20250624144943.39297-1-abdelrahmanfekry375@gmail.com>
 <cef03d37-715c-47a8-81d4-0872d505c39b@suswa.mountain>
 <CAGn2d8ML8eTcN2G18B7FYkapROnOeAKJir5fJvOXDdXTLY43aQ@mail.gmail.com>
 <5ce9dac3-0b7a-45d1-8313-2f65165b50e7@suswa.mountain>
 <CAGn2d8N8GrRR0FnaB7S2BsPs0HXHhwHfg+q55HbfkMqy1kMGTw@mail.gmail.com>
 <5d579b8c-0676-46d8-a020-77ee91e1e7d3@suswa.mountain>
 <CAGn2d8PdiBRN09L__XEsH=cNYz4rDR2A-GnSqCM6Y5TmtT+wcw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGn2d8PdiBRN09L__XEsH=cNYz4rDR2A-GnSqCM6Y5TmtT+wcw@mail.gmail.com>

Thank you.  This is good analysis.

On Thu, Jun 26, 2025 at 06:19:40PM +0300, Abdelrahman Fekry wrote:
> Hello Dan , Thanks for your review
> 
> On Tue, Jun 24, 2025 at 9:31 PM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> > Yes.  Nothing is checking for if hmm_init() fails.  Step through the
> > code and verify that nothing crashes or bad happens as a result.
> >
> > For example, I think hmm_bo_alloc() will print "hmm_bo_device not inited
> > yet." and return.  So that's kind of annoying but it's not a crash.
> > Search through the rest of the driver and verify how it will behave.
> >
> 
> So, I have been searching through the code as you suggested,
> and found a couple of interesting things to look at.
> 
> Firstly, no function that calls hmm_init() checks its return code,
> and it doesn’t crash anywhere because of this, so it's not a problem.
> But the thing is, the hmm_initialized flag inside the hmm_init() function
> is set even if hmm_bo_device_init() fails, and this can be misleading for
> functions like __hm_alloc() that check this flag later.

Yeah.

> 
> Secondly, the function hmm_bo_alloc() and others don’t check
> the return code of hmm_init().

hmm_init() is called from two places, atomisp_pci_probe() and
__hmm_alloc().  Is it really possible to call __hmm_alloc() before
atomisp_pci_probe() has succeeded?  That's an important question.
Please try to read the code and find the answer.

It would be better to only call hmm_init() from the probe function
and delete the call in __hmm_alloc() but I don't know if that's
possible.

> Instead, they check the flag
> HMM_BO_DEVICE_INITED inside bdev, which is set by the function
> hmm_bo_device_init(). The problem is, if we inspect hmm_bo_device_init(),
> we find that the HMM_BO_DEVICE_INITED flag is set before the calls to
> kmem_cache_create(), kmem_cache_alloc(), and __bo_init().
> This means that if any of these functions fail, the flag will still be set,
> which can lead to misbehavior in functions that rely on it, like hmm_bo_alloc().
> 

Yeah.  That seems correct to me too.

> Should I tackle these problems after submitting the original patch of
> removing the debug sysfs attr. ?

Perfect.  Sounds good.

regards,
dan carpenter

