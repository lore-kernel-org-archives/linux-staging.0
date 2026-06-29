Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B690265CC2
	for <linux-staging@lists.linux.dev>; Mon, 29 Jun 2026 07:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782717907; cv=none; b=q3H/kG9ZQnIfo4F9J4iPge/7KOFSVDrrpqS1+6OP5flekBD8P/1wM/+ANEfCgKwxSZximjfa1xsf5yY3/ynjZDHY2IjC5hqLy6yB40A4d/VWz98zPG4zVQHni4WMrJBvIvq/MxEBHpygXkoGGr5CjHe+RujkK7lgXAUrfFBDB1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782717907; c=relaxed/simple;
	bh=n+7c8QnQ8pPwghaAGQ5hjT3Ypry9KEiXXo6pN4533q4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nz9+0cMWmyzNIEv9FrLxtOx7z0iIRRnSnI06jNsLaF7ZbQNnTZ/6ykIEwnXZ9+JPqVWAjXe8P/QIRf/pl5OOi4/wk1WbsX21O0TtOpttwV8CYkUEXG9wlGDYQhqNtspv37ylR2gMf2HqOEAk4qf8k6YcwzfnXNdY4o2lAgzqN+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nVYQ4sEm; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nVYQ4sEm"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso38497615e9.2
        for <linux-staging@lists.linux.dev>; Mon, 29 Jun 2026 00:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782717903; x=1783322703; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eLDWMh4ifhAAqWhEnL83ySDPMpXcU8bUP9rQJHl3ghI=;
        b=nVYQ4sEm//xpbfodPvtxSPxiRTo95bcBikqlFZFnx37oiT5KKOwMpTOEVu78hsWO5T
         oMDAIMN2mPfT7Cc4VE68lBpeiS4bIe3CnOno2nnUM9jNB/Ook4AecKdBN7hpDu4rch9o
         FVw+NOlFQS5GvgK+rrsHG0FYWuEOuon9FGQhmgOrbFpQLbIzVJmTQXfQsiKo+UGZmA3T
         AOjU+e+SuCE8wTXNa3lV4s12jlk1s2+3HvDEQkJOXIoGg7AQNoNvIrk4qOBrY0isqdbJ
         hi54fcbU/5Gvko2xjp+fuKHBZiZb50hezV55wsUJH3kZsv+YgAVRijtZu267/YLVTQBV
         8CAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782717903; x=1783322703;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eLDWMh4ifhAAqWhEnL83ySDPMpXcU8bUP9rQJHl3ghI=;
        b=MyJu500kBKsbCxS/r8TOXHfxIjnd0uTIei57xp5KoHRD0DRsjgYmRg2r9wWIkHOURC
         eIPBTwsgiYRVGFjb128eN/OaHf8cIc7WjsvA4vIHK5s9l9+pBhSDQyM+UWOMXGLt5QTX
         kJNAN8+AFEnG4718C/klDy+oECNdVuFMi7WABDy/U322aBQCCLIvG0vT9ySaShNJJo3T
         NAm1X+h/A2KDlDnya2ZTR7WgPnBIN8n6sROWGtlT3+CAQTboKC5egtsVHULVT0PnksN/
         s4seK2YmSEGRMO7f9f8QGp/EKQKfdua7H87fzCVEf7CizKA6IHtOV63ySRQ1n95Thx1t
         BlMg==
X-Forwarded-Encrypted: i=1; AFNElJ/Dgm2XRqNZeW605kphTP9O5aqhsODa05KzpIo7iBzuSStYSdpYYWSSUJJM+ESgfzhpoS/P4jZZrocTCE+v@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/fCGjjo8q14rITLO8dWEtNhLuB7CHhG4vz6YfNnlSgcIMBfrI
	/pdf4mEqmT6RWnS/hItTUedKQAKQaNp3Dvo4YhC0omef5qftlNUSFBz1
X-Gm-Gg: AfdE7ck5fBHMe4pTxtacAc3b5Zx0P284CLmg8rQs/YQcptNGmoREBcGMtSKilN8NmW6
	iIqyjQb7we6Fa8fDX7xLsb15ERRUiSQ9r2JfEg6tK+UUDuQrovCXvL/0vHcRVn3PLaPsYM5Hl50
	K3FCwq4bh+fz3e8jvYowGykGV3IxMeJlUPSDvLMH8JkON57mpzAshsivmU8FM1k1bhF2x/rOmZT
	6PrUpv/x8caCm/xVVuFHxACfKvLC8YNaDYU2UrGXhN6hVCTd/3bQHkhb6Nisa6PPWL97X+TmcWx
	8SqfKNzgvMEV9Y6W9nGCAekITRcuY32R+JmzcbRWDd0TZT3hTcNFKpbWVOh1f63NoZ1kTPoV30+
	DzZ2pGXQ27zE6DFAIlhWuc//FnPa28ehBd9u72cG6CCbU6oAWY5pZOHQoi2OPM+gwAPyeHWs24q
	2K1qyFfmxBPw==
X-Received: by 2002:a05:600c:8109:b0:490:bad9:de43 with SMTP id 5b1f17b1804b1-492667ca5fbmr236735665e9.0.1782717902646;
        Mon, 29 Jun 2026 00:25:02 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:9cf4:43df:e612:817b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4926c285fc1sm198695665e9.1.2026.06.29.00.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 00:25:01 -0700 (PDT)
Date: Mon, 29 Jun 2026 10:24:57 +0300
From: Dan Carpenter <error27@gmail.com>
To: Prashant Rahul <prashantrahul23@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] staging: octeon: Improve initialization error
 handling
Message-ID: <akIdyUhcH6O-Iczx@stanley.mountain>
References: <20260628-staging-driver-octeon-panic-v1-0-fe8c34989254@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260628-staging-driver-octeon-panic-v1-0-fe8c34989254@gmail.com>

On Sun, Jun 28, 2026 at 12:31:23PM +0530, Prashant Rahul wrote:
> Hi all,
> 
> The TX and RX initialization paths currently call panic() on some
> initialization failures. Instead, these failures should be reported back
> to the probe function so that it can unwind any resources acquired during
> initialization and fail gracefully.
> 
> This series replaces those panic() calls with proper error logging, propagates
> the errors to the probe function, and adds the necessary cleanup to avoid
> leaving the driver in a partially initialized state.
> 
> This is my first time working with drivers, so please let me know if I
> have made any mistakes.
> 
> Thank you! :3
> 
> Signed-off-by: Prashant Rahul <prashantrahul23@gmail.com>
> ---

You need to say when you haven't tested your code.

You need to say when you're using AI to write patches.  There is
a format for it.
Documentation/process/coding-assistants.rst

regards,
dan carpenter
