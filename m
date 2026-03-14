Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287FD1A9FA7;
	Sat, 14 Mar 2026 10:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773482432; cv=none; b=kv5TyMSSvM+LxWA29QkUfK+Xebdj71+5i6Gsgvc0o7qL7Kp4Rle3NiN8XHz2Vmm3E7Pi3xZnIRU3GNMztI+B8hcSIozmXrE/FvC3me2oKHggjcUoVYjXGL2YEvZcIlY5/u4OMeZtYbikKHGrXRIQehX0tANa66iYUnfgg8oz7u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773482432; c=relaxed/simple;
	bh=BrX0h6/Db+JwitCFnijTLJ2YdtLyOtsro0fGbI7wQZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RPIobcQUIhSlBuhioaHNkrgxxIKVN2IJfBtH/j91DDfO7qs92PSkkknOol9r7iGpI8/viZsJS0AmTgU3VyL5YvgVsatHJ3uniRCkJTYeYqPNFiHjxdARZoC3HB3V5lhvDoFxQ/s5cFKTBUTJJ4LKG7GxvBGQTSpHZEWoO8zhuPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GqSOhTPZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GqSOhTPZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 510CAC116C6;
	Sat, 14 Mar 2026 10:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773482431;
	bh=BrX0h6/Db+JwitCFnijTLJ2YdtLyOtsro0fGbI7wQZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GqSOhTPZw0Q/7O7nWB4vt8ivV5JwCt18qZbnYJOhD+pBbumgtxyHHmdogT+K5WTTJ
	 1Nb/c+qM2cEtQOpkVurOsgRvE4kwwiUPoqaTOReXgKn0GtBxA6lZ2HL+u8m3D709uw
	 Nf/I0sZr83MDguabwtt8eqNs9CXNN1wGHpqSQ2wE=
Date: Sat, 14 Mar 2026 11:00:13 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: replace kmalloc + memcpy with
 kmemdup in ioctl_cfg80211.c
Message-ID: <2026031426-datebook-evolve-ed6b@gregkh>
References: <20260314-rtl8723bs-kmemdup-v1-1-8280a436f20c.ref@yahoo.pl>
 <20260314-rtl8723bs-kmemdup-v1-1-8280a436f20c@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260314-rtl8723bs-kmemdup-v1-1-8280a436f20c@yahoo.pl>

On Sat, Mar 14, 2026 at 10:11:39AM +0100, Tomasz Unger wrote:
> Replace kmalloc() followed by memcpy() with kmemdup() which combines
> both operations into a single call, making the code cleaner and more
> readable. The zeroing done by kzalloc() is unnecessary here as the
> entire buffer is immediately overwritten by memcpy().
> 
> Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
> ---
> Verified with checkpatch.pl - no errors or warnings.
> Compiled the rtl8723bs module successfully.
> Tested by loading the module in a QEMU environment - module loads
> successfully with no errors.

Loading a module doesn't do anything (you can do that on a raspberrypi),
you have to have the hardware to bind to the driver and actually call
the ioctl to verify it works.  So while loading is nice, you didn't
actually exercise your change at all :(

Not to say this change is not correct, just be a bit more careful as to
how you attempt to test this please.

thanks,

greg k-h
