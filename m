Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C566743D4F2;
	Tue, 20 Jan 2026 14:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768917916; cv=none; b=qPny3PLlPWbylCks8ajF6TthgMH0Y7xOwGGVE4h1hPX9ifTGlfRoQtwiTKDofpaRflyw3hXpogjkuS0TxNPS6qYKj3ejAGAZSw9UGmAW9Lx782Sfkf4OBkN5Y9pYcEljD/xovXEZTQC32022+EMOIeyeVOpi43+dZnMFewbY4D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768917916; c=relaxed/simple;
	bh=180eOceph/qdjc3c3vWDemrOYuBc/sg7Vo/BGeDQvkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kA3h4AxN2hJ0lop/dxazgBQ06CoEinLDILwN4xMZfop9Bvjp3Q2HDRb+iOmvDx0Fz6QMv78En4yXPXtshfbKrfJlZpcNN9UzWF9TtMaukyCxzAmVkAziF8biGWEChyV97rHX/KD3GJP6RiZ3m3mmtSxUxpVxjvvFt3qvcKyutuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wptPAGmf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wptPAGmf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 145C9C16AAE;
	Tue, 20 Jan 2026 14:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768917916;
	bh=180eOceph/qdjc3c3vWDemrOYuBc/sg7Vo/BGeDQvkQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wptPAGmflWg6dA8ZGLWO+Gz0pHkGXPcDMBfo2AJ9gvEz8RyROxfmZCDoH3SqVFoUX
	 X2vp9HK+f2Ky2ezcG2CxaOsdjLxq7lXEGUU+G69YKRUuN8Gh8/BFkV+8VVARRgRxMW
	 WdmP6fsv0Ptgbm2HPPYnlZ6HpogAtx3F4+90V/TE=
Date: Tue, 20 Jan 2026 15:05:13 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: 2023060904@ycu.edu.cn
Cc: dan.carpenter@linaro.org, guagua210311@qq.com,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] [rtl8723bs] Remove unnecessary atomic operations for
 continual_io_error
Message-ID: <2026012047-delighted-unvisited-f151@gregkh>
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
> 2. **Driver code logic**: Within the rtl8723bs driver, the sd_read32()/sd_write8() functions are only invoked by the driver's dedicated "IO processing thread". The entire IO execution flow is linear: the driver receives an IO request → processes it via sd_read32()/sd_write8() → completes the request before handling the next one. There is no multi-threaded branching that could call these functions concurrently, so race conditions are impossible.

Did you use AI to generate this?  if so, always say so.  If not, please
properly wrap your lines like the email client asked you to :)

> I will add this detailed explanation to the v2 patch's commit message (instead of code comments) as you suggested, so reviewers can quickly verify the single-thread guarantee.

No, please do not.

> > What's the motivation for this change?
> 
> The motivation is to follow the kernel's principle of **minimizing unnecessary atomic operations**:
> - Atomic operations introduce small overhead (memory barriers) that's redundant here (no concurrent access).
> - Removing redundant atomic ops aligns the code with kernel best practices (only use atomic types when race conditions exist).

Again, please drive this check down lower in the call chain.

Again, read the mailing list archives where this has been discussed very
recently as to what should be done, AND examples of how not to do it.

thanks,

greg k-h
