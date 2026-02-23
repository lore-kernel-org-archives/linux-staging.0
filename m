Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D622459ED;
	Mon, 23 Feb 2026 13:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771854759; cv=none; b=rFffQwsH9HB8b5weOeVmidshZUvOwmU1/gRwMjQY9rbGjqtE3yH34Qv1/MbqbxinMC97OJKXeYWMswiw4Maqjpi6kCOE83/8yAmc2a4AEzA7tP1BLEKqXEPosabi5Zgg9URVjDhpg9SguaIN8Ck7h2plMl+yFepjCjbN+c7j384=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771854759; c=relaxed/simple;
	bh=/gVv37IntBEz1K49bWZjl6nsqlI3XOcXb7j5u5LUcXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C6lTLP+Xo1v0WYqrgaUvyBS8l+5mi5PjQT+rMJKULQPwylp8B1pvcCELFiuNZo3k+rOEPK8ZIk0it4Nhjn5KCxdtYllqVQwgIpi2p1jRHn247jTLOSBO6ZT2WN4mXLO0JqNKXbaqZVPJkXPjy9boFY7hHLaXNdqryHWzgYJugLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=A+atfTBD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="A+atfTBD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71604C116D0;
	Mon, 23 Feb 2026 13:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771854758;
	bh=/gVv37IntBEz1K49bWZjl6nsqlI3XOcXb7j5u5LUcXs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A+atfTBD5q2c8HRM45RtnfXlj4V/XBDQG5k7RilsS4gIxv2NDZBVFyoa5d7zo3Zre
	 KM9reOxI5RMEHIFzBhvKJo5zKjm5fB4qzV1fEoEiCCDLiMaXWIM3+PUfMgXDRJNqwY
	 AutpOjKu9u69DP3Ja54hkhmsCkyDGi/CnUCzQgVY=
Date: Mon, 23 Feb 2026 14:52:20 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Yuho Choi <yqc5929@psu.edu>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	tgkim@psu.edu
Subject: Re: [PATCH v3] staging: rtl8192u: ieee80211_rx: free rxb on reorder
 alloc failure
Message-ID: <2026022304-speculate-extrovert-f467@gregkh>
References: <20260213134834.14056-1-yqc5929@psu.edu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260213134834.14056-1-yqc5929@psu.edu>

On Fri, Feb 13, 2026 at 08:48:34AM -0500, Yuho Choi wrote:
> RxReorderIndicatePacket() allocates prxbIndicateArray with kmalloc_array().
> If the allocation fails, the function returns without freeing the incoming
> prxb and its subframes.
> 
> With JOHN_NOCPY enabled, this leaks the original skb as well because skb
> ownership is transferred to rxb->subframes[] and ieee80211_rx() does not
> free skb in that configuration.
> 
> Free all prxb->subframes[] and prxb before returning on the allocation
> failure path.
> 
> Signed-off-by: Yuho Choi <yqc5929@psu.edu>
> ---
> Changes since v2:
> - Included this changelog as requested to document version history.
> 
> Changes since v1:
> - Corrected the sender's email address, which was misconfigured in the initial submission.
> 
>  drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c | 8 +++++++-

This file is not in 7.0-rc1 at all, what branch did you make this
against?

thanks,

greg k-h
