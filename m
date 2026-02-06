Received: from cvsmtppost02.nm.naver.com (cvsmtppost02.nm.naver.com [114.111.35.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D1F426D1F
	for <linux-staging@lists.linux.dev>; Fri,  6 Feb 2026 18:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770401655; cv=none; b=dptLCRttXdD4MTL+Ydybjnu7NoCiTmfjagvaAguxdU5hTCGVvTDqfEeRCH99eI/2AAFZu8yWTSSuOWYH1ATb4Iowi49AKQzxl3FXQLzQOPfZFHOwxxOEK5CPLhiHScAe57Yre3qkj/c3YR26YMxrQOmEKvUeNJc4iEwSuy4OIp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770401655; c=relaxed/simple;
	bh=UMogAMuEcVtgk2TgBqEiu8gmW/ECcjT6jlWPcgVGUNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QPn8xjsye53PKgjhfxC+fXEVx9tv9lCzd5wTBnOOHRCYq1TUgBQwuhX3sjX5u2e+y0qgQeQSLuBANRh5ihB16N6Tm9P0ELVP7vy2DTIe6rsGZxWpYpINPS1NgSXpf2Upk71CNA4UAIttNiMs7jZVWX9R5jsOYruDQJ4UtkdrMwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=VFJQyIRs; arc=none smtp.client-ip=114.111.35.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="VFJQyIRs"
Received: from cvsendbo016.nm ([10.112.24.39])
  by cvsmtppost02.nm.naver.com with ESMTP id 8uSPOd8uST+EZRDG3qsyzw
  for <linux-staging@lists.linux.dev>;
  Fri, 06 Feb 2026 18:04:05 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1770401045; bh=UMogAMuEcVtgk2TgBqEiu8gmW/ECcjT6jlWPcgVGUNw=;
	h=Date:From:To:Subject:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=VFJQyIRsLuJiZIytfGYfgeX+BiNxEG5fyJUiQ20cXE6hpwbnXlhoZ60X3tL4SlDtI
	 zi8HZ4M5ldQlH+9+gb080Un/LaRdgiNuX/LajFGpFtv8OnbxO+e2/PE3Y2pY492dYm
	 We1QpFsxlafxBWo6OA3SSr5/L60uLCRU3eaUgZJG2FL3dKdpXwcf0HoDinjGHwdqgH
	 e1jFVAKlHSvCxZ3xKmoBHmvYMu8zKp9lus7GEvioKtQUHai1tXBvibbU5jFRzlKD/B
	 oVjp9Rg2yI3a9W5tGwGDK74fpRiQMBbdvCbZYp72E50WvQAuSnHY/xbZ4kuZTu3/oF
	 25av28ZPyMtgw==
X-Session-ID: g7EA1p2gTX26EFX4k2cFZw
X-Works-Send-Opt: 6/YrjAIYjHmwKo2qKqJYFquqFNwkx0eFjAJYKg==
X-Works-Smtp-Source: /dYrKqgXFqJZ+Hm9FAM/+6E=
Received: from JMW-Ubuntu ([14.38.141.199])
  by cvnsmtp004.nm.naver.com with ESMTP id g7EA1p2gTX26EFX4k2cFZw
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Fri, 06 Feb 2026 18:04:05 -0000
Date: Sat, 7 Feb 2026 03:04:04 +0900
From: Minu Jin <s9430939@naver.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: parthiban.veerasooran@microchip.com, christian.gromm@microchip.com,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: most: dim2: fix a race condition in
 complete_all_mbos()
Message-ID: <aYYtFOW1E2Uv1Wiw@JMW-Ubuntu>
References: <20260205160231.1543828-1-s9430939@naver.com>
 <aYWWUwHJyAXOp9Ak@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYWWUwHJyAXOp9Ak@stanley.mountain>

On Fri, Feb 06, 2026 at 10:20:51AM +0300, Dan Carpenter wrote:
> On Fri, Feb 06, 2026 at 01:02:31AM +0900, Minu Jin wrote:
> > The current implementation of complete_all_mbos() repeatedly acquires
> > and releases the spinlock in loop. This causes lock contention.
> > 
> > This patch refactors the function to use list_replace_init(), moving all
> > entries to a local list. This removes the loop-based locking approach
> > and significantly reduces lock contention.
> > 
> > Signed-off-by: Minu Jin <s9430939@naver.com>
> 
> This complete_all_mbos() function is called when we do a
> most_stop_channel() and we ->poison_channel().
> 
> The list heads are &hdm_ch->started_list and &hdm_ch->pending_list.  I
> feel like if we add something to the list while we are also freeing
> items from the list then we are toasted.  In service_done_flag(), we
> delete items from the list but deleting items is fine in this context.
> 
> We add things to the ->pending_list in enqueue() and
> service_done_flag().  We move things from the ->pending_list to the
> ->started_list in try_start_dim_transfer().  So if any of those three
> functions can be run at the same time as complete_all_mbos() we are in
> trouble.
> 
> The hdm_enqueue_thread() function calls enqueue() until
> kthread_should_stop(). The most_stop_channel() function calls
> kthread_stop(c->hdm_enqueue_task) before doing the ->poison_channel()
> so that's fine.
> 
> The service_done_flag() and try_start_dim_transfer() functions are
> called from dim2_task_irq().  When do we stop taking interrupts?  To be
> honest, I don't know.  I thought we had to call disable_irq()?
> 
> So that's the question, when do we disable IRQs in this driver?  I
> would have assumed it was in most_stop_channel() but I can't see it,
> but I'm also not very familiar with this code.
> 
> Let's answer this question and then either add a Fixes tag or say that
> there doesn't appear to be a race condition.
> 
> regards,
> dan carpenter
> 
> 

Hi Dan,

Thank you for spending your time for detailed review and analysis.

To be honest,
my original intention was to reduce lock contention by optimizing
the repeated lock/unlock in the loop from O(n) to O(1).
I wanted to minimize the overhead of acquiring the spinlock multiple times.

However, after reviewing your feedback, I traced the code again 
that you pointed out. I confirmed that IRQs are not disabled during 
the call path. `most_stop_channel() -> poison_channel() -> complete_all_mbos()`

In the original code,
the brief time where the lock is released inside the loop create a time
where an interrupt (eg, dim2_task_irq()) could trigger and modify the list, 
leading to a race condition.

Although it wasn't my original intent, 
I think this patch could also solve this race condition.
By moving the list items to a local list under a single lock, 
it provides the necessary isolation from interrupts.

Does this reasoning make sense to you, or is there something I am missing?
I would appreciate your opinion before 
I update the commit message and send a v2.

Minu Jin
