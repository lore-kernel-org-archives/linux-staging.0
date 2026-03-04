Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4A838C2BB
	for <linux-staging@lists.linux.dev>; Wed,  4 Mar 2026 08:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772611653; cv=none; b=nzd8T4JiNBtRvMxGAJSMEjJyqzzx/OQ0oEkJEjNhZ819hlvGZR8NkAfqeKUHB5mUf0hBVbygQ0QGDBXkl9rvav2YxCGQfiL0Ft5xncdbWhvTTs2ytSS29I4ML8HlYeEbF1j4mXwhyOfynW+U5t5qi+uQX2nrZJ5VfYTaQrbGBD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772611653; c=relaxed/simple;
	bh=4ZI+SD3jD+IY3XcMnXZ2Lccr40hmpqlA1lS3Z42+WWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aQEDmF+uKGeyFJHVmBiFvJ/TzZiqa+5VWhx+hkHuxLKQ6S/hEVFQrtGgauNEJpomxK/zqfk7ClmIL7vkEFBJmu7JNY5gWZqhqcjmnKC5ZX5R6J6xqQa+OUgZjgLIxKpgqGLTZmzqdAhF2129A/w69aiBUZLghiQnTF9/sqJsZF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iMxJILvT; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iMxJILvT"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-439b97a8a8cso2909301f8f.1
        for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 00:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772611651; x=1773216451; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cVXPpCyp/KjyhGEHsF5inZ+ZQgDHJ+B5qlUBdv6NHDw=;
        b=iMxJILvT240wy92Oi6drU+ZtP5MiYPmnaMWrRipvwYVWUC8W6N0yrUTn1XXqiNEF7E
         XVrxHsGxcH64EzsnyhEqzs1ujELmxJy6Adk/hkun0J8rCV79c3e8Wrrl8wQ8om/tadAf
         I00Ez+Z2SsPstrnFsO/H0UC7irbZEqNbz1hoMzZGasdo/7Oeiag6DhZ4kpkJ6bmLV/ad
         a8pAOq8yUMVcv8MmmCi21NKK81vPUjBKtnD3DN1CmUFOEwg91pyqto+LkwoAJsLSrGLf
         BgyRStTcpclUcl12MILm6i7HkXHAJemUzqrgRFKFEYuUveGkBZPz3lGZMDo6HozwrQM3
         8xVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772611651; x=1773216451;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cVXPpCyp/KjyhGEHsF5inZ+ZQgDHJ+B5qlUBdv6NHDw=;
        b=kdKwaFqYUeGXqP6KM4Vu0zQyyRRy+9Kt8sp2C+HS5Z94tBcIbxMxB3GiSINIs+OD0D
         mOWAfH14yscuCCIi6iB1XfsVDuJzdz7q9IGhECs8lzUJdrRD/dsSKtv99m7OhllD2iU3
         eS6uMk7Pcb2rsKz0NRwCemtTuubSHVHz26Pt8csvh6IfFIdXoCDDEyw2r7KWNNMESC5B
         BITHWzJ+gklFXnLlEWPxewm8paHvesfWsUW+wqZqe1gMrdKeVVc6A4xqlo7ytGvqL3nQ
         5Lp2MhF+F+oK1HlUK33h1TE+xoUZwt+prfHZbXdl59yZaZOIQyPYRA1WI/gs75ihN8/d
         IsBA==
X-Forwarded-Encrypted: i=1; AJvYcCV1f661JK6fKue6WpvP4Q608hNQoHj4sel4S19uI032N1cXtDK9vGOTeamBiXnDKM5NvfmYdSdKIxvVPWg/@lists.linux.dev
X-Gm-Message-State: AOJu0YxdxqJryIHnaTUcFR1bYRC3KUcWAuX1ojdLs/OwQvn+de5n4rx1
	XX1fB+SzUWZolWf1QbOpEbwCPtM3vLhn9LwJ2A393+5RDIyzCP6VCW2pS/IiakG1fWg=
X-Gm-Gg: ATEYQzy3aJJX6YIMHo82j7mTgZwuGCxyhcwmJ9dIAmdRvM9L5hUSmoF5F5DtKwPI5WA
	AxhPcHRCTxLLv5m7AoMbrDoxp71urpfN3qJS9mAIM0skmLOUyUidXLwnCLb2Y7tj8LLBjbAM1b+
	ShQEZQOPIJT4+EGkft+/iTVxwFvZ7X4yFvJtKJS8qjYreelUQ+QGCyWqPW+R8mSuaUpuduA7wGz
	DCpCaFLq4UmOyd6uwT9jqMYVc/I/7xfS1gVyPCKr4JQgi/4MtYGs5oekX6MtPhYi9uQNtmIyHy4
	xHqw1G7cZBFAVMUDtCiGaZo2mDtjWTcOGYSHaTnp8ExGmtMZYs/UjbAPOm9ZM5aol0aDOTuCORx
	pKL/pmr4ScnwKAREeos51Ttn3ZV84Kl726xyVC4poksT6UHYRiXw1w1Usp3Kgjyv9smvNM/W1QM
	NbkzH7AuDQkBuOcEcuB05WGBmPYo8o
X-Received: by 2002:a05:6000:1842:b0:439:b55d:b0eb with SMTP id ffacd0b85a97d-439c7fd3a59mr2271566f8f.38.1772611650336;
        Wed, 04 Mar 2026 00:07:30 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439c1fc577bsm9446052f8f.19.2026.03.04.00.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 00:07:29 -0800 (PST)
Date: Wed, 4 Mar 2026 11:07:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Soham Kute <officialsohamkute@gmail.com>
Cc: marvin24@gmx.de, gregkh@linuxfoundation.org, ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: nvec: kbd: use -EINVAL instead of -1
Message-ID: <aafoPlld7S2Nq76W@stanley.mountain>
References: <20260228202008.40063-1-officialsohamkute@gmail.com>
 <aaVXtbHMfUFJW_Tu@stanley.mountain>
 <CAFxoRw0yZM8opXig2vgnFZR6mTPFgj0JFxKYx4vtv2VyqUWSJw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFxoRw0yZM8opXig2vgnFZR6mTPFgj0JFxKYx4vtv2VyqUWSJw@mail.gmail.com>

On Wed, Mar 04, 2026 at 01:13:05PM +0530, Soham Kute wrote:
> Hi Dan,
> 
> Thanks for pointing me to smatch. I built the DB and ran the queries.
> 
> >From what I can see, dev->event() is called in input_handle_event()
> but the return value is not propagated back up. The smatch caller_info
> table shows type INTERNAL for that call which I understand means the
> return value stays internal and never reaches the caller of
> input_event().
> 
> So yes, this patch has no runtime effect. The reason I sent it was
> that pcspkr.c uses -EINVAL in the same type of event callback, so I
> thought nvec_kbd should be consistent with that.

Put that kind of thing in the commit message.

"This patch has no effect on runtime but returning proper error codes
is the correct thing and it makes it more consistent with other functions
that implement it such whatever_function() in pcspkr.c"

> 
> Also noticed atkbd.c has the same -1 in its event callback. Should I
> send a fix for that too?

If you want to do that, then sure, absolutely.

regards,
dan carpenter

