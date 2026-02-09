Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA391A294;
	Mon,  9 Feb 2026 10:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770633232; cv=none; b=c1dyC0DSuiOLmQ27FDDMhlg8Lu7qEk0CPb3TLwM7SwQCuEbhDV1rr+YF8VRsHuLDdLPxlS2aJbQovb/h/RrLVx9iqHfIFpte3nhvBCUJFaIKZxEiOQ76IxiaTxokIDpWvvtarULYchiriVydK4E3fj4BVhayIg6ShBMKRyKKLIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770633232; c=relaxed/simple;
	bh=8s7H354MjWWaXOPztc3qF4wENqjw18MLJJ4PSNB1Lio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gIhENTYSndOQJdCX75//4FHW1qTThYR32wyTuwh1JZjV+qazDo90iJmEg8K6Z1HXPv39BQCnUq9uLm113WJGHZkbwwh3pCagzLRUW7YKnA5VN3ApnEs0dYP2/pABW9DgN3z87Rje3QmayFsDkH2J4EhPFOmPg112OPpip+D1Dds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LzTDH/bR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LzTDH/bR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78F16C116C6;
	Mon,  9 Feb 2026 10:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770633231;
	bh=8s7H354MjWWaXOPztc3qF4wENqjw18MLJJ4PSNB1Lio=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LzTDH/bRnkCdS7RPkAAr1oG/OtfqcuxP1cJT2dEmCf3a4zk7yOjYvi+278PVORW9m
	 WYPp7dLCk4JJSLx4afOzRztGwZ8yO/3bssv7rGU9dqFlym21bZ/wHcKMMzJrFsqANr
	 ajXpre/grsNvSnoZmzmwyzFGlOw7fiO9hgcLXn8c=
Date: Mon, 9 Feb 2026 11:33:48 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Yuvraj Singh Chauhan <ysinghcin@gmail.com>
Cc: parthiban.veerasooran@microchip.com, christian.gromm@microchip.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: most: dim2: replace BUG_ON with WARN_ON_ONCE
 and error handling
Message-ID: <2026020918-cognition-lemon-b050@gregkh>
References: <20260209101829.2121131-1-ysinghcin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209101829.2121131-1-ysinghcin@gmail.com>

On Mon, Feb 09, 2026 at 03:48:29PM +0530, Yuvraj Singh Chauhan wrote:
> Replace BUG_ON() with WARN_ON_ONCE() and proper error handling in the
> DIM2 driver. BUG_ON() crashes the entire kernel, which is excessive for
> conditions that can be handled by returning error codes or exiting the
> function early.

WARN_ON() also crashes the kernel if you have panic-on-warn enabled,
which a few billion Linux systems in the world currently have.

So this isn't a valid change at all, sorry.  If these things can happen,
properly handle the error and recover.  If no recovery is possible, and
by hitting these cases the system is so broken that total loss of all
data and memory is the only valid solution, then BUG_ON() should remain.

hope this helps,

greg k-h
