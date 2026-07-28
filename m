Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4CD3CDBAA;
	Tue, 28 Jul 2026 07:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785222971; cv=none; b=OmpITbW/mPo83M+iPWDaqpoQUxJ/nTwoUwLrzwR0ZK6IOXpm1P9v9ztEDV7VtAcNJ77se6X+yP5w0nDmk7C1sZZaKo0vc3bhDWDngfS8LJmdSuW/pMrfIxrJHvR4+K1K/2o25lwF/r6f6IOF3+Hs4UdSE9C2fUAWiyvRf1whasc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785222971; c=relaxed/simple;
	bh=Gc8JuWbS07nVFD2sjEqNK6JNVTns95JV13XLBP5/hnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eZyHC6e27qc8keM7IpjonChLBSszr25adtqhXV65HKiXt5bu45aFYtwZ9dxDjQJZf0+cebwlBXCFQAVWF8zqmBomFcaUbW/sqIk4yfg+fR3oossj0wt8yD2wMFS8l+mDUM8eHG920M9f45PYt41LNKDSN2N0+4BfZzr6bCyaQmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=P9rBo0PR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="P9rBo0PR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A90C1F000E9;
	Tue, 28 Jul 2026 07:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785222967;
	bh=qFen/HUwT9GC5wZA639hU1o+zvKJ9DPKPPs/lN6MAlE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P9rBo0PRr6Z28vp2lDOtDGxoyPdNQSuYUauyrM2BYmjE9G7ofBlFLRsWJWCn+69Ph
	 +KltGYhBb+cjmHm1tLblGBX78FIKzvwrdteUZvHXREBaPhmiwvjQGdLKsLmJ8DpJ5h
	 SC1FTG3s3xBSbIhrZ0sj9kASe1vDixvrGZmeXXeY=
Date: Tue, 28 Jul 2026 09:15:54 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Joyeta Modak <joyetamdk@gmail.com>
Cc: vaibhav.sr@gmail.com, mgreer@animalcreek.com, johan@kernel.org,
	elder@kernel.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org
Subject: Re: [PATCH] staging: greybus: audio_manager: add missing newline in
 sysfs_emit
Message-ID: <2026072833-wrench-delouse-eaf2@gregkh>
References: <20260723215610.700701-1-joyetamdk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723215610.700701-1-joyetamdk@gmail.com>

On Fri, Jul 24, 2026 at 03:26:10AM +0530, Joyeta Modak wrote:
> sysfs should return a newline at the end of the
> output buffer. The missing '\n' is added to all
> sysfs_emit() calls in audio_manager_module.c to
> follow the sysfs convention in Documentation/
> filesystems/sysfs.rst

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You sent a patch that has been sent multiple times in the past few
  days, and is identical to ones that has been recently rejected.
  Please always look at the mailing list traffic to determine if you are
  duplicating other people's work.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
