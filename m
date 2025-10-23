Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340EF2D9ECD
	for <linux-staging@lists.linux.dev>; Thu, 23 Oct 2025 09:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761213448; cv=none; b=Jd7G9pwfMQnIoD3s8AMiQoTrb8X+eReEDxJ4eWWhv/f5TobVem7erU5aq5gdWhaiprOHe8rnKb96tP/BxQeHk7wgjB+ZR6bIprio54B25uXeWXtjCkOfTtwg+6I5/kkyDwIvE3XgpKWq2DKYYcofgyaBPWDJkGa/gsb6wXaqC+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761213448; c=relaxed/simple;
	bh=t5tIUiuiwyp/I16reeYwzAyGxJmOwPnhLLfC0dqajIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M6md1UPIOpeUKxapijllCe6xjOKETfiQv/gAodjemnh71iRSJ2fW4vrmxib2zwxS78hKAdq0CGPQ5+ZlYSPCXkywg2BdA1BqIb5c1dMzjtTTxWmCKsmcUiuSQ6E+HtYzJlEp2fLSTxCq6kL4zdW+ciju0oM2uco8NGfZMojF3xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fiARi96u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fiARi96u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BF6AC4CEE7;
	Thu, 23 Oct 2025 09:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1761213447;
	bh=t5tIUiuiwyp/I16reeYwzAyGxJmOwPnhLLfC0dqajIw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fiARi96uN8yxXuDPS31z3MYDDLbIcRFjQ2v58zenLcNYu7KnTsIXgj9QcdfRwNAhy
	 SLRD9kPU2FkvFuJV8d1tIGGMBkDgW3YUUB4VYJzEqN7IQc7guHJFAHfcaVIQXd9F75
	 FOGkCBJbeneipaGOBVNzkf1uw4A9p0zegYcWzsKc=
Date: Thu, 23 Oct 2025 11:57:24 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dharanitharan R <dharanitharan725@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH v4] staging: rtl8723bs: use ether_addr_copy() and
 simplify NULL checks
Message-ID: <2025102338-sandbank-croak-5f1d@gregkh>
References: <20251023093052.1822-1-dharanitharan725@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023093052.1822-1-dharanitharan725@gmail.com>

On Thu, Oct 23, 2025 at 09:30:52AM +0000, Dharanitharan R wrote:
> This patch replaces multiple memcpy() calls with ether_addr_copy()
> for copying MAC/Ethernet addresses in rtl8723bs.

Take a look at the documentation for the kernel on how to write good
changelog text.  It's usually the hardest part of writing a patch.  It
says to not do things that say "this patch" and the like.

Also, your Subject doesn't make sense, there is no NULL checks happening
here.

> 
> These changes improve code clarity, align with Linux kernel best
> practices, and fix checkpatch.pl warnings.

What warning is being handled?

> 
> Tested by compiling the module successfully with:
>     make M=drivers/staging/rtl8723bs

That doesn't always work, better to use:
	make drivers/staging/rtl8723bs/

Also, that is always implied, and shouldn't be needed here :)

thanks,

greg k-h
