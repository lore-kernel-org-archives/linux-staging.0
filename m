Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8158C36B05E
	for <linux-staging@lists.linux.dev>; Mon, 20 Apr 2026 14:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776694467; cv=none; b=TQm1Yg2y0+xI6qhnOCuEVpWTOpVWlBIlx3XJ2ydYPoiWZphUSZOD2pSeazLHTlT5ON+OevlfzNtbv4tLKDEBwg23wnoEDRBMrkE+b/qKHp0Po0zqMuRPu/1LqzG/p7UnybV1gYvGmNSy+L1RqHm8thy5oZtamDEvoeFN/J5onu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776694467; c=relaxed/simple;
	bh=r/3TQyTdeACbct2VMrDk6A6brSOZqDT8/S5t4YPU1H4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HBm2OuE38m1B/fu87IoWoVo8jwP6J6UOuCeTGdHR/D6bvastdxQIZvkpQQqRn2y/SEDMdPyMB+FIqNXIi0kPAzGMzqNfDRzmp8/mrLUo0qiyddDybYFLj4+We2Gxj2HJAyJxmKAIgRQCiJm7M+yVZhi/BhMPQkqc6lX1seCf1vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a2lS6HTh; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a2lS6HTh"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488b150559bso24019515e9.1
        for <linux-staging@lists.linux.dev>; Mon, 20 Apr 2026 07:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776694465; x=1777299265; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vc8FQcgydKaMUzFUbien21ok3uP5S2x9/skjAvQai0U=;
        b=a2lS6HThe2z5+FBxC8i01a0bxq3JARgVe4NURRFKc2Yp9crG8b8EVC657cg/vGarun
         LghqQ57cPCCg2MOhJFyOXbZK08WOERH2DR4yLcQR8XwRtlFJZie8p/FvU+J3rGV9H5QJ
         IVjH5vmNlRpLEXQaCSH2/RFYJcXVuajwfQEfKV61jkKgTRz/g0tVwe+miM85/hiyp7ac
         4nTANQgM1pZMOkLVDKHql7vTHmXwgkPAePi5SDkqTmss/YI8VtvOjURjLA1DIHwWtzEg
         TOLOsbqC+sYQZAHN2E6muUIDKCQHTLaiVHmiyJLZAlpsS9AWXaCYYF1z8+finVmaecX2
         RwXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776694465; x=1777299265;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vc8FQcgydKaMUzFUbien21ok3uP5S2x9/skjAvQai0U=;
        b=GUYBSHoDCpyMh47Uc35l5HSoMrTXg9/jROqvEcF7vIxZX2nRq7SgupsbTDeapm6Qe4
         W5o+jQ7BTRY9M5kXE5kg2oJCvqeC5vJbkzX6IEHYZSBfYBB0BdTbxndr6TPEUCAo458v
         Wq0H1qs72Huwe5w1qtabpvBc9ogdOnIJbq7TlrAavFNbabH5G+94Ppw6u7B/aSDHwr37
         rB+gVy48sdPFhPfe4BJXg2OQqqLNrWfx2dIJ7L1XCquFlGtkgX3SQkr9pzYcqnnLPy+S
         RsXPLHWY5/B7VdQp4WTxNMHBcq8mRBxkBxQebWwLoZahoPDwWdouHUCKm7YM2dPya3kd
         Y6bg==
X-Gm-Message-State: AOJu0YyZbZfs6T/xSQuEfEXrsjW7mgKJa7ts7dRmDbnazXHPXsshKeCG
	s97aDriD931TLjCCpTbri1ddYekOGQOWckZ9Y0mq++0EmuGFWF53pWAP
X-Gm-Gg: AeBDievZHFC3wH9KXQMnPZVYhPhU0u73oPG3W6K2KoaAeFVMduzFuKAyhPr4ahGdDW8
	P6/h8GOWPyaB2a8Y45QILRNF8YL59kOIihBksU+uCjha11cRyU9KUKq4xrks3ThAOlzA0JbXHyf
	xqec6utjz5HvOpW5h64YISkSyAs8Z4A2MOr1gHEpLCzRU6cBFPq2cxf4PhpOhZpdmjADL70L59a
	5oKtdUm8LIOiR+tE82786YNc1lzNWrnqX7AIVMfG+sr36+1r7P1c/0eVjKHBA9SVJ+QmY70PjOS
	uG1P9XV66hOtAfn7Gm9mnvcRKfZIa9upUx8paaLPC9WZzlp2W7Hf7kh83V5JBFB9BsHa5gY6hp1
	cBtxGeB1ev+11PMLLlbO1yof2lDhj7pRWC9v+TsS6VQN9rNDC63ynqZGGCOvW6B48SxGXQv5XCb
	9NLXtSj7MiNXv3unc/yMjl2YE6dI73hg==
X-Received: by 2002:a05:600c:c10a:b0:483:2c98:4368 with SMTP id 5b1f17b1804b1-488fb771613mr151733305e9.18.1776694464799;
        Mon, 20 Apr 2026 07:14:24 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb74c789sm88386765e9.5.2026.04.20.07.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 07:14:24 -0700 (PDT)
Date: Mon, 20 Apr 2026 17:14:20 +0300
From: Dan Carpenter <error27@gmail.com>
To: Matan Cohen <matan@matanco.space>
Cc: linux-staging@lists.linux.dev, parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com, gregkh@linuxfoundation.org
Subject: Re: [PATCH] staging: most: video: replace BUG_ON with WARN_ON_ONCE
 and add recovery
Message-ID: <aeY0vL0SEteMZUbz@stanley.mountain>
References: <20260420113503.62552-1-matan@matanco.space>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420113503.62552-1-matan@matanco.space>

On Mon, Apr 20, 2026 at 11:35:03AM +0000, Matan Cohen wrote:
> BUG_ON() halts the kernel unconditionally. The check after
> most_deregister_component() guards against a bug in mostcore: it
> currently does not call disconnect_channel() for linked channels on
> deregistration, so if that ever changes unexpectedly, video_devices
> could be non-empty.
> 
> Replace BUG_ON with WARN_ON_ONCE so the kernel stays up, and add a
> recovery path that drains and frees any remaining devices to avoid
> memory leaks in that error case.
> 
> Also document what the spinlock and mutex in struct most_video_dev
> each protect.
> ---
>  drivers/staging/most/video/video.c | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
> index 04351f8ccccf1..4ade49569bd63 100644
> --- a/drivers/staging/most/video/video.c
> +++ b/drivers/staging/most/video/video.c
> @@ -33,14 +33,14 @@ struct most_video_dev {
>  	bool mute;
>  
>  	struct list_head pending_mbos;
> -	spinlock_t list_lock;
> +	spinlock_t list_lock; /* protects pending_mbos and mute */

I always dread these kinds of patches...  The comment is useless.  Way
too vague and kind of wrong also.  I want to see a much more thorough
explanation.

regards,
dan carpenter

