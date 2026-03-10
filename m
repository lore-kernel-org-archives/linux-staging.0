Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD73643E4AB;
	Tue, 10 Mar 2026 09:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773133325; cv=none; b=eo+XsTfai7XmyKoXMjhMjae//kWzVbF1QzuAOz0FITVSbSdA80ivXRGiXQbUT0ZA3QpSqRXw6p5nPrbigFIi3abDjDmWn1FgoXwuG0i5KyVX2+k7nkWnqS4Kd9jK+x9JrUhfnehZ7J9Q8Ln/uENRO77Qx1cu1e8RC1/aK8EInJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773133325; c=relaxed/simple;
	bh=3aMl+awcBKX+02/ZBPFwCrIYTsxiHV6k4itDIrny7Gg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KO2denUo48GOnvCEoSBXO0jmrMNF6gAG/eWrULrBBf8uP+NxybpOAZV3UGxDT1kX9bbdtVJPXFZb0zrlSAZp2TcViIxaF3SlQ3c3clkiejYL41100Aj5TvT21cr13v8mOSgOk46lQA1lWHNEF9SqiiBKLnje31E6+YHFNYVv4vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GLoz6jQ/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GLoz6jQ/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F29FC19423;
	Tue, 10 Mar 2026 09:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773133324;
	bh=3aMl+awcBKX+02/ZBPFwCrIYTsxiHV6k4itDIrny7Gg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GLoz6jQ/JWH7vnnIj/tg/GKGSCrxqLDU1X9qyqHD3mN7xZHVY6YxRBxch/xQ/4X2I
	 vCnpIww6V0ZhHRveHuWMyPElQwQB35jZx7NY6L1wcjp7JJa1DjPRUpZeRXucp2NS9C
	 i6HDanbTyrcPCtaN5RBG3+1YSh2K+iwAKez9xFlI=
Date: Tue, 10 Mar 2026 10:02:01 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Gustavo Arantes <dev.gustavoa@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: convert mutex_lock/unlock to guard
 and scoped_guard in rtw_pwrctrl.c
Message-ID: <2026031039-deranged-primal-f6ab@gregkh>
References: <20260310084806.34265-1-dev.gustavoa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310084806.34265-1-dev.gustavoa@gmail.com>

On Tue, Mar 10, 2026 at 05:48:06AM -0300, Gustavo Arantes wrote:
> Replace simple mutex_lock()/mutex_unlock() pairs with guard(mutex)() and
> scoped_guard(mutex, ...) in rtw_pwrctrl.c, simplifying the locking by
> using cleanup.h guard API which automatically releases the mutex when the
> variable goes out of scope, reducing risks of missing unlocks on error
> paths.
> 
> Signed-off-by: Gustavo Arantes <dev.gustavoa@gmail.com>

Let's not convert existing code to use guard(), but rather use it for
newer code submitted to the kernel.

thanks,

greg k-h
