Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11ACB3403ED;
	Tue, 11 Aug 2026 07:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786434795; cv=none; b=bV9VXiPttGWQPDO5BtDTN1r3IRid5T9Lp6gHE4CWz3GgEvu1BfmzKArg8FGZmygA5EF+IWUZ/mn4K6r0FZ6nTkeFQGlJK9tXWffEsdGLUkZbEIrRTUNQ9gpCMXCBR8g2TptGMKwSkZFgOVdL51qkHubiaXpq2qUXwGHLxJk062k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786434795; c=relaxed/simple;
	bh=R0db2upGXYpSZLmZSDkprD5ja69yP8iB7RVLEs5mZeA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uqOEr2B3PffHjcyGhSdcjSFS2u3Nxnq1HpSS70oWmv/SSPsVEmfaXg5wJpquYR/1sdNVzCi8oyEc3P6bfFix1La31NNpkLZ2cC599jNxJ5dlqJmFbW00WA1O7nngJ6X9K9V+rrxlG4djaSWqZzi7WaGMFspvl+mzNRvTxi1icM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=2uHsjQ6o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="2uHsjQ6o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 507451F00A3A;
	Tue, 11 Aug 2026 07:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1786434793;
	bh=R0db2upGXYpSZLmZSDkprD5ja69yP8iB7RVLEs5mZeA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=2uHsjQ6oBLpbdgFjBjuvZgU/q0pxseWlJu4QrXnSz9oVURJy88xkEp5QzsAy1Unkz
	 UCVOeN0rstrnO/Jd2RX8iWZNOTqs0xLy209TrT7isX7m33k6koxR+GK/F2/KNVRWuD
	 JL53cplnJqXjDC8L97qDX/phYlfja3IzyPX/a+zU=
Date: Tue, 11 Aug 2026 16:51:40 +0900
From: Greg KH <gregkh@linuxfoundation.org>
To: Yunshui Jiang <jiangyunshui@kylinos.cn>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	martyn@welchs.me.uk, kees@kernel.org
Subject: Re: [PATCH] staging: vme_user: fake: stop tasklet before freeing its
 data
Message-ID: <2026081116-flounder-facing-6ef7@gregkh>
References: <20260811073039.288957-1-jiangyunshui@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811073039.288957-1-jiangyunshui@kylinos.cn>

On Tue, Aug 11, 2026 at 03:30:39PM +0800, Yunshui Jiang wrote:
> From: jiangyunshui <jiangyunshui@kylinos.cn>

Full name please, not just an email address.

> fake_init() arms a tasklet whose callback fake_VIRQ_tasklet()
> dereferences fake_bridge and fake_bridge->driver_priv. Both fake_exit()
> and the err_master error path of fake_init() free
> fake_bridge->driver_priv (which embeds int_tasklet) and fake_bridge
> without calling tasklet_kill(), so a pending or running tasklet may
> access already-freed memory (use-after-free).

How was this found and tested?

thanks,

greg k-h
