Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD733385D92
	for <linux-staging@lists.linux.dev>; Sat, 25 Jul 2026 17:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785000577; cv=none; b=rJhz1FbDZHLpCQuN+dz08KDymZyruYmK3RXDK40beRvYv3vVnHg/uGSx+UQXp/35JKevfNZSI/eJpSiDSEx8OSKgCKWRMd0TRjJSeIUE2xYuIkWUJPtmDoA2WtdlItchZpPxPfHzxDwmQKbFTOLnuKODvZW5PE3ZtJF9QCnRbeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785000577; c=relaxed/simple;
	bh=v+w3lYlWPFwICST/q/k4nV1DKNLcKra9Gdgk71fWnn0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hNiNLgVdX4E5nn+rAgsyAwkRoGn8u5AlSkEmd6LZLbY/JIctJzQfWshldMZGmt7VOBUt/8KKR6plUNnjXDRpNLCTBT/apo1xWz+BwL7cQ8Pwm6e80YhCfU4UzMMmw6yBctyDOxpO+uRQXetxg2fx4nLrAV/k/SvcVFt/49AWc+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FEE93jea; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FEE93jea"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6D8A1F000E9;
	Sat, 25 Jul 2026 17:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785000576;
	bh=NQ07hR5OAvzFlxOrZ2dJQUcESfc2plXUq8yrDAfhV60=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FEE93jealceemKksX7rpnsWoIl5i3jE0m+ee7cN5OZMY0Ukxg/iwifj++CevMbczD
	 XRwbAoATUztSqQRHRI3xkTnFkkCvRtlIGfPN9nPfoVLH6Jlb2AH1e/rGmKlisz5+m1
	 ZQ7f31DyEE5wEYhFkHyKMrBXRE2fCNZh3qk/3v28=
Date: Sat, 25 Jul 2026 19:28:11 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Akhmad <akhmad100913@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: coding style cleanup in rtw_mlme.c
Message-ID: <2026072552-helper-monogram-5bb4@gregkh>
References: <20260725135755.39512-1-Akhmad100913@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260725135755.39512-1-Akhmad100913@gmail.com>

On Sat, Jul 25, 2026 at 04:57:55PM +0300, Akhmad wrote:
> Fix multiple coding style issues to improve code readability:
> 
> - Break a 140-character line to comply with the kernel coding
>   style guideline of maximum 100 characters per line
> - Move comment before the code for better readability
> - Fix typo in comment (varable -> variable)
> - Remove dead code: empty if block with only a TODO comment
> 
> These changes improve code quality and compliance with kernel
> coding style guidelines.
> 
> Signed-off-by: Akhmad <Akhmad100913@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

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

- Your patch did many different things all at once, making it difficult
  to review.  All Linux kernel patches need to only do one thing at a
  time.  If you need to do multiple things (such as clean up all coding
  style issues in a file/driver), do it in a sequence of patches, each
  one doing only one thing.  This will make it easier to review the
  patches to ensure that they are correct, and to help alleviate any
  merge issues that larger patches can cause.

- It looks like you did not use your "real" name for the patch on either
  the Signed-off-by: line, or the From: line (both of which have to
  match).  Please read the kernel file,
  Documentation/process/submitting-patches.rst for how to do this
  correctly.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
