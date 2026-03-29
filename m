Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81EC41397
	for <linux-staging@lists.linux.dev>; Sun, 29 Mar 2026 06:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774766021; cv=none; b=bq2RX/mSuvQ9pEPiF3SzMO4jVYpQc5ZUcZXuE277hjx0WIqL/5H/e8v8D61/lP7ZeCFab1L3ljMLz42+Ciw/ve96GUL4K2pb157bAQ08p66eEevUbhAoUxJu1wfe2LVFA/esxaX/LqECH7SRTpHmTAmxABLPONpL0cpcD08O6Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774766021; c=relaxed/simple;
	bh=/FPsWdmFoji+nVVSnDdSBj4l0mzT+hOaV4l0n8eYlgI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tt7Pqt+5pyphdiCbR+GE2zfAJTxGCfrOqQtRVIRgiB7DoSH+SHmUpRb5HsE4Yy1FRpVb19Z15Xdv7/2q0zYWplV+/F4biOz/Zz5ZcxdmoxnnRZySNcxws+ze+nZtLJU9IIUkZCGY4RtYyzbRscq+ggfp4c+lXBii+4z8CQ4w8fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=xTaLnEuY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xTaLnEuY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94C7EC116C6;
	Sun, 29 Mar 2026 06:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774766021;
	bh=/FPsWdmFoji+nVVSnDdSBj4l0mzT+hOaV4l0n8eYlgI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xTaLnEuYNnZqSlJuksdPBlXwRhrrQK76LfuvstYqhAqAHwqytkFCj2yNYxAO3z4Fn
	 8FTLrwKXQmd4LiJiZMfgPLnQqpxLa1ZgXhLVFTcRkgZD7blEehRF+DiUmx+x/j/71Z
	 s1KTz1on5SOQfK7YJeshRz0tT7/WYcUYgl4+yMcY=
Date: Sun, 29 Mar 2026 08:33:37 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sebastian Josue Alba Vives <sebasjosue84@gmail.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com
Subject: Re: [PATCH 1/2] staging: vc04_services: vc-sm-cma: fix integer
 overflow in vc_sm_cma_clean_invalid2()
Message-ID: <2026032956-railroad-renewable-3328@gregkh>
References: <20260329062004.492812-1-sebasjosue84@gmail.com>
 <20260329062004.492812-2-sebasjosue84@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260329062004.492812-2-sebasjosue84@gmail.com>

On Sun, Mar 29, 2026 at 12:18:45AM -0600, Sebastian Josue Alba Vives wrote:
> From: Sebastián Alba Vives <sebasjosue84@gmail.com>
> 
> vc_sm_cma_clean_invalid2() uses 'ioparam.op_count * sizeof(*block)' to
> compute the allocation size passed to kmalloc(). Since ioparam.op_count
> is a __u32 supplied directly by userspace via ioctl, an attacker can
> choose a value that causes the multiplication to overflow on 32-bit
> platforms, resulting in a small allocation followed by a large
> copy_from_user() and out-of-bounds heap reads in the subsequent loop.
> 
> Replace kmalloc() with kmalloc_array(), which returns NULL on overflow.
> Also add an early return for op_count == 0 to avoid a zero-size
> allocation, and return -ENOMEM (not -EFAULT) on allocation failure to
> correctly indicate out of memory.

Why not use kmalloc_array() instead?

> 
> The /dev/vc-sm-cma device is world-accessible (mode 0666), so this is
> reachable by any unprivileged local user.
> 
> Fixes: dfdc7a773374 ("staging: vc04_services: Add new vc-sm-cma driver")

I do not see that git id anywhere, what tree is it in?

thanks,

greg k-h
