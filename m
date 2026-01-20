Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B44D43637D
	for <linux-staging@lists.linux.dev>; Tue, 20 Jan 2026 14:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768918709; cv=none; b=t4h+SAl9ewVpe0JhnVOu+ergkQox11ggBvYlT2ZUovWiW4hZ1w4REVfkrrkulsc057HzjZLN8M8IPJZ8CINFKXVFIsRJMzxkp8qX68I23XugX4vwZcxTfeI6jYROF3O6vKWfUZ4jhCwHfKXr+r41XBcQwLnjaCBRZhCOsdXOPH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768918709; c=relaxed/simple;
	bh=FAEvE+KY3Bozf0GMzPzVME5634rbvsrm4k5+A0qDzb0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RpPKp/dJKHIduYfvkxB18uNUIynEQaLO5TptOkz49eNLBrWcV/sgG4K1OluDar+5Yp5zZA6fwg8/7Pu25PDLDRZkZWPrEVeejI6o8+cz+fHWEKj6b+lGK78uCr4LWKb/2fWhZPB3kFUl6rVLjMl617j+f5S1OX3APqyIXLXBNcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BUiJqzZ+; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BUiJqzZ+"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43284ed32a0so3001162f8f.3
        for <linux-staging@lists.linux.dev>; Tue, 20 Jan 2026 06:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768918706; x=1769523506; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AqsKmSOstHprq9CwwYJsoJis5vwZf6zzd2V48Y6mEVY=;
        b=BUiJqzZ+kJ371RDV9bPOewQDC62p9BdXuZ7Bv6rAFMKxJJcQ+dzGoz9LWp8kjCMtMP
         3wW9+rJHmURD+EomZCqjCckfAmud8OMPFld53qbhPDwMPWrW4CUAmm9VpUwA3l3EfhCo
         uQZtwjhQ1easKUwKYvP/wCJ15Cjugo2xa5bjbLPyd2JLzYOW8BeS0kHtsqFH4IhXes59
         wfQVnMj+++NtgF3bh8EIfOGJ4pxMt7Lx9E/9zP9wGs8K1Wt5q7ZatCzU/f3AMEmvoijg
         S0DiKYugmXrE5SpX9Ct/w0B+rEK/hFSa+ATcZJCjivIbGtP4YhP/YbdNrXrJp4LFKd1O
         cxFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768918706; x=1769523506;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AqsKmSOstHprq9CwwYJsoJis5vwZf6zzd2V48Y6mEVY=;
        b=dU6+OtPeMXrDyjbHqE08UUUxgx39j0KwAvdlUB5x7n475hZ5vYZqIyTUVVZ50MfwMr
         MgYA5NpnY4o8VYeqOIC8WJ/qsxdavnzHsGYJmMyImK5hnL+y5u9UdAkWKNZmPsrEvCWu
         wjtqcVAzfi29foIKBTXqwApRFqcnSR6egR4h4iJ21ZAlQlSIGLwdvDQgW7OhqEVP0/TC
         vKYMhPj4CFDvyY0wWzjjxKf78SkQJu0s15AE2EH7SjsRJqXjzjqCZWKTul3afUdZpIqN
         dy6G5zNfuGuLN5iEjQfSWo3aAOinrikBrwG3OMv0TnncYmdOjblQ2BmbY+Y6JGxhnnem
         fb/w==
X-Forwarded-Encrypted: i=1; AJvYcCV7fLBu5rSH2868MM60y+IXp0tKEi4No2a3DMcM1FwepyLgwSI6qHkq7UxXbXHiRbUkBlbkamNa9NSSJCCj@lists.linux.dev
X-Gm-Message-State: AOJu0YwO297OluLlpiR3A99AvFVQcpifaJfw1FM1/L2HXxmGq/2tzP+q
	kXYtIJStxwxgne6Qu3GKzUMe1DeLul9aA+n2XGS0Y7lEApfiQcEyYko3YUCkas6n4ZML4u8w9qD
	IYCqKxtw=
X-Gm-Gg: AZuq6aILzhgmQeE3CpuMe0nKxq6VomCHepC9WTrSBo/NVLvN8p84chDseOBCAhFawcn
	4gKSBBuAT1sTI8AkM8cg9CnbxBta/+LlJ/Vh7Qii8SES3CdMf9RW6x83DlquerrOMJ7rhyydDAy
	l6r5L2Shg8wEl9jtRNz+ZsFGhTMjSV59jNCdK98rDHQtIccHfcJ5UG/TmoWVCsOEVPrprzUvrdV
	eaO0LYpcW53ugHZ3MtquB6GeKq+AodiCxaSrqh4HNxKjyHSYD91Py1nTNinKAuYu9sB1wwBfx3D
	F33N93CCgiK/3xoxxs77N0RekPy9Kg5NMScQN8QMiNPYriAny1CbyUrtA4sTJMJQJLSCvqEBTCK
	TG8XdWwjz4uXl/8pndmQUL7qvgEOnN3TNv3JtZp7ZxqSFlJLpPMFTMR/iUpaUT8XT/qoP/AsRIc
	DeY2EjX5EdNvuSNYzA
X-Received: by 2002:a5d:5d12:0:b0:431:a38:c306 with SMTP id ffacd0b85a97d-43569bc70f4mr17867458f8f.43.1768918706056;
        Tue, 20 Jan 2026 06:18:26 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43595e0a705sm1472796f8f.14.2026.01.20.06.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 06:18:25 -0800 (PST)
Date: Tue, 20 Jan 2026 17:18:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: 2023060904@ycu.edu.cn
Cc: gregkh@linuxfoundation.org, guagua210311@qq.com,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] [rtl8723bs] Remove unnecessary atomic operations for
 continual_io_error
Message-ID: <aW-OrprZjcRx8rb_@stanley.mountain>
References: <aW3qZahKi7UVQI7A@stanley.mountain>
 <641DA44821579DC7+20260120133939.7347-1-2023060904@ycu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <641DA44821579DC7+20260120133939.7347-1-2023060904@ycu.edu.cn>

On Tue, Jan 20, 2026 at 09:39:37PM +0800, 2023060904@ycu.edu.cn wrote:
> Hi Dan,
> 
> Thank you for the detailed feedback! I'll address each point below:
> 
> 
> > So you're saying that sd_read32() can only be called by one thread at a
> > time.  What sort of locking enforces this?  I don't see any at first
> > glance, but I also don't want to invest a lot of time into looking for
> > it.  Please explain it clearly in the commit message so reviewers can
> > easily check.
> 
> The single-thread guarantee for SDIO IO functions (sd_read32/sd_write8) comes from two key aspects:
> 1. **Linux kernel driver isolation mechanism**: In the Linux kernel, each SDIO device (e.g., the rtl8723bs wireless card) corresponds to an independent driver instance, and the kernel's device model inherently isolates IO requests for different devices. For a single SDIO device, the kernel serializes all IO requests to it — meaning only one IO operation can be processed for the rtl8723bs card at any time, no concurrent requests exist.

The AI is saying obvious stuff here.  Reviewers are supposed to be
familiar with kernel basics.  It's a waste of time to show reviewers
this paragraph.

> 2. **Driver code logic**: Within the rtl8723bs driver, the sd_read32()/sd_write8() functions are only invoked by the driver's dedicated "IO processing thread". The entire IO execution flow is linear: the driver receives an IO request → processes it via sd_read32()/sd_write8() → completes the request before handling the next one. There is no multi-threaded branching that could call these functions concurrently, so race conditions are impossible.
> 

The AI is spouting nonsense.  Which function is the "driver's dedicated
IO processing thread"?

regards,
dan carpenter

