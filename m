Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12171352002
	for <linux-staging@lists.linux.dev>; Tue,  1 Sep 2026 10:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788257237; cv=none; b=EYw2iPzfOhhUy5izYRhQfGhE9t01InLtzgOoxmZVlXxah09uOaR/e9RSzUIxAQ/ahYF2OOnVhOEPKUhTYkwhvB4drYF9qVcrUY3HX4QVeU5uwaHXp2NEF2OaV3hawP9UjjoQKj1oe0W4yEhpRwXlegxAT5ARvcuu4N0ap1eCQB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788257237; c=relaxed/simple;
	bh=Y4MxnBJ9m+O4DlD7p5xVg++CCt9kqOVrCPhTVBLWUL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XxneTq/8lvvpDAo/5H7pYnIHf1bPkKPYGAMC7n9Y8xPyYjYm0qRAFrTpwL2kJGl8n6dbGruaHg80EbT87H6R/U2shtFZTYFmDffAbUnRCgiS7SDDjnxu6zFj8Dr5Z/ZIPdorZzfOFFyW7ftUP7PVAPYdQPJoiHl7VKjNXhtQWKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=zlFJAMTB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="zlFJAMTB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CAA01F000E9;
	Tue,  1 Sep 2026 10:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788257235;
	bh=clSLYp/Uct6XkiW+Jk5tzOAoq9Zk/PgiDUzAfoHxKzI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=zlFJAMTB1AAT2ZL+MGhaWowfHNkYesTVL+yjNYqWL0m+i8g03moir33DKuTn34pdO
	 do6VUpQRQnANCrWmE9cUPmoAFMXr1BWEavSYCUw/PAgK1ccy67jL+OJgMmU4sZeQHQ
	 Srni5uLonFjUnD8H5XoL+M8eaMp4KdEP+VMINcNg=
Date: Tue, 1 Sep 2026 12:07:11 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: alwaystabs <reservedstep@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: remove unnecessary parentheses in
 rtw_ioctl_set.c
Message-ID: <2026090154-spindle-silly-e962@gregkh>
References: <20260820195458.11689-1-reservedstep@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820195458.11689-1-reservedstep@gmail.com>

On Thu, Aug 20, 2026 at 10:54:58PM +0300, alwaystabs wrote:
> Remove unnecessary parentheses around variables in rtw_ioctl_set.c
> to fix checkpatch CHECK messages.
> 
> Signed-off-by: alwaystabs <reservedstep@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_ioctl_set.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)


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
