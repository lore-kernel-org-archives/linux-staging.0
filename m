Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA56309EE9
	for <linux-staging@lists.linux.dev>; Fri,  6 Feb 2026 07:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770362457; cv=none; b=YrPs1TegLjLvWm7fLf89a5v2EDKSC5oe93evyaauZz0A1dqwWnQWr9jrUa5LCdlhYC+37MLYvMX7Q675saks5GzLWYOypCbEVEZBDranQL4QG6yskKhTh2jgjdBE3ng8G1kvGbtxbpZ/4ybMvz6NdK0AsMvfLKy0za3oJdqd7qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770362457; c=relaxed/simple;
	bh=Jrm4Ma/v+IaVgMg41NUATuqbPrO/dRmuxqslx6LV7p0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s/nleUZPVXr0ry3JRlheEXrPwcl+ZSU0in2Ri/M86xmOatxxdqSKryOljaxnBEtz2p764Hp+7ektSyYxmmOlHqVtYXjbXNLa3zdPD5J0D+shRl0uBX+k5lsUDp31xX6G9Rbm4AWFpAB6oo68qAC47gw22Ec73igrUejqdhjDDHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DOA8ys6n; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DOA8ys6n"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4806f3fc50bso3978315e9.0
        for <linux-staging@lists.linux.dev>; Thu, 05 Feb 2026 23:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770362455; x=1770967255; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rDqn64e4F5pKd1HvFqedoy+PkTst5qOy46EJEd/J7Ks=;
        b=DOA8ys6n3JcFjibSchttsh875sWcGsESm8Ml0PFIkVkanW61CEJD0iHbu1MGJcaAYk
         shpAMlTLVWGhHV/t8X0pYKREPhMLmCzE69slPcsCMJu45/SAVKIXF8ieAIIiY7wrg8xk
         qDHQpDK31VTSInRJ7GMCT6JodzMHgQZyCo8NgxWOMK0zhyNLBUBBQOw8hQBwJd7V0+ss
         UU25wLfdspKH9fapPRbrFvOkrVN3q+THjlrSKl0iBbz86AONkxacctM39EZCWiIhA6z1
         lsgSm9OSNP6e1V1Q/eFyh+W/Gk/OK9qUDtTzlWt7xm+RF2WUXOttIhoV0OGja/ei9f7M
         6muA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770362455; x=1770967255;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rDqn64e4F5pKd1HvFqedoy+PkTst5qOy46EJEd/J7Ks=;
        b=hF2WElcbAyNwFzns78cxo7mleQ03N0ibTDPbdAQ2hJjzUPcRGHbQO3raWWVEP4+fro
         5xOcUFQfmSWm0uzVsF2Vw68o1Wttr8vWf2v2LQUQ7r/H0lawrxeAtG6TT4YAiV0Q5Dkr
         PShQT5VhWnBg1eO9A83+hq9jShuAflCGGoXeb1F00r+KmNWyJCEc4XRdiT43qUZLrRPM
         yxuraILdbf4/wg6pA9HiE0ADdge4m/yJaeK3fozOlwDjvAaWeZtYu0j6bEzV0qZdK347
         XfpOqUz5yl60gF8CzjYfq1GHzEJFFJCPmSiOVonD1L6rqTIeE+R7Mq7T0KnIrBtc4pNO
         shKQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4eNaVkOg9OpkW7XXVmEnp7kzmZgo1P83eou4XoKA+SYCDk2b18l+2h9ZoAFS48hEhlksCxRZO273hzzN5@lists.linux.dev
X-Gm-Message-State: AOJu0YwZ8zrdq3M7eVngLDsayjAUcAYR1PIFYnvTk87V84ddGUGPUcUz
	tmqDrt6hucotxkjXXuI/JaVMroEvtI6T4mUqMfwg6UrDm7VzeINS7SVUSqiMASn1mNA=
X-Gm-Gg: AZuq6aLMj59A/Oi9kNKIVw0DDm/fLAAGKfTTUZC/KdDJUOWpTbJvR2Xf5ToDGYmtlZL
	khqCn33K7dxyRRJGyvmbkqMOar/B6C621LqxHKVJ6icZJ2auPc1jD/yo4mKTmuY61kDL4gC7oBK
	0xd8jTE3OgLvm1hbLIglaW0wMlxWeu9IWg0gvubEWkocm9XEuhE1KiuU6WuDE5bctMC+ViVpHSV
	KpUnpHa322lSv63dqXqVvHHjPIqrAkrnqy3thCCM/2ypjYt/i3c3B5Lw/GG4muLSdSrIaJ5UamZ
	QLfteRRBGLkP973S+Ajh7A6+8mNuF2byNi5zce7AjS1zhMT5vbXdVfV7oyUJAOU9f7FRuJgVaAB
	uLY3WgkDJqNOy8VSI0QLmf9bICJoF1NPqf023mEPkRp2800jemfOcu1F219VrgY6jFzGuU6nEU5
	rz3H53FibdMRTlZQcu
X-Received: by 2002:a05:600c:46d5:b0:480:1a3a:5ce6 with SMTP id 5b1f17b1804b1-483201e4bcamr22234895e9.14.1770362454701;
        Thu, 05 Feb 2026 23:20:54 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48320719b8fsm33987255e9.9.2026.02.05.23.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 23:20:54 -0800 (PST)
Date: Fri, 6 Feb 2026 10:20:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Minu Jin <s9430939@naver.com>
Cc: parthiban.veerasooran@microchip.com, christian.gromm@microchip.com,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: most: dim2: fix a race condition in
 complete_all_mbos()
Message-ID: <aYWWUwHJyAXOp9Ak@stanley.mountain>
References: <20260205160231.1543828-1-s9430939@naver.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205160231.1543828-1-s9430939@naver.com>

On Fri, Feb 06, 2026 at 01:02:31AM +0900, Minu Jin wrote:
> The current implementation of complete_all_mbos() repeatedly acquires
> and releases the spinlock in loop. This causes lock contention.
> 
> This patch refactors the function to use list_replace_init(), moving all
> entries to a local list. This removes the loop-based locking approach
> and significantly reduces lock contention.
> 
> Signed-off-by: Minu Jin <s9430939@naver.com>

The subject talks about race conditions but the commit message talks
about reducing lock contention.  It does obviously reduce lock
contention (althought I don't think anyone has benchmarked it to see
if it matters) but does it prevent a race condition?  Let's review:

This complete_all_mbos() function is called when we do a
most_stop_channel() and we ->poison_channel().

The list heads are &hdm_ch->started_list and &hdm_ch->pending_list.  I
feel like if we add something to the list while we are also freeing
items from the list then we are toasted.  In service_done_flag(), we
delete items from the list but deleting items is fine in this context.

We add things to the ->pending_list in enqueue() and
service_done_flag().  We move things from the ->pending_list to the
->started_list in try_start_dim_transfer().  So if any of those three
functions can be run at the same time as complete_all_mbos() we are in
trouble.

The hdm_enqueue_thread() function calls enqueue() until
kthread_should_stop(). The most_stop_channel() function calls
kthread_stop(c->hdm_enqueue_task) before doing the ->poison_channel()
so that's fine.

The service_done_flag() and try_start_dim_transfer() functions are
called from dim2_task_irq().  When do we stop taking interrupts?  To be
honest, I don't know.  I thought we had to call disable_irq()?

So that's the question, when do we disable IRQs in this driver?  I
would have assumed it was in most_stop_channel() but I can't see it,
but I'm also not very familiar with this code.

Let's answer this question and then either add a Fixes tag or say that
there doesn't appear to be a race condition.

regards,
dan carpenter


