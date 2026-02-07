Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B468F823DD
	for <linux-staging@lists.linux.dev>; Sat,  7 Feb 2026 12:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770465899; cv=none; b=b4OA32Z8CqaobVGu/E1z+oq/Mtp8cxLcATrtaSun2ocRbY143VmnKjGviLBrQPbAhKFLbetlIYFLCGOJiuVPbnUIpQ10PBeds7kN5Ro7zEXzWZeiFaBMo27981ENlouN/kd7UDNK70SzONX9XxPmVR42bYj4yU9QKVFIQA/4Nno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770465899; c=relaxed/simple;
	bh=ooQatlNCXYK880zamA8TqFaU7B2dLZaim0Nn7Dndfeo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n7ypsLBRtBxamb97d1/gadXNZ5IuavzLRIzpeu48s0ULojsi7RzRhTQtz08F22OSQQnmuS3ulJTzsb3eoLkKRhU8phJmHKLvBLysJzbkquJ4X9bXlzVKBYD98cTUpM57uSnK3AEsQMw+v7FLmveVzGF/9l8XYRKcBGHdnIB+TfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=m9iaZ4Ub; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="m9iaZ4Ub"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7465C116D0;
	Sat,  7 Feb 2026 12:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770465899;
	bh=ooQatlNCXYK880zamA8TqFaU7B2dLZaim0Nn7Dndfeo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m9iaZ4Ub2kjlUiHUGETSnIbZtquRZl53N63twSFNlNJT9RiSAYAuPgU6nAKNlJb0O
	 KMa5Zt5ibOlIFFHRU4884qeVJMmUnOAUTyQ6x1YIxZ2L4VoWs9DkNdQRwqy5IYeqKZ
	 nH70un2tbD9tnxd8z3KuwdxlWsUV47QfXWvpKOr0=
Date: Sat, 7 Feb 2026 13:04:51 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Tejas Vijapur <tejasnv1@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: rename add_RATid to add_rat_id
Message-ID: <2026020733-pointing-stereo-cf4c@gregkh>
References: <20260128181341.10911-1-tejasnv1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128181341.10911-1-tejasnv1@gmail.com>

On Wed, Jan 28, 2026 at 11:43:41PM +0530, Tejas Vijapur wrote:
> Rename function to follow kernel naming conventions
> No functional change
> 
> Signed-off-by: Tejas Vijapur <tejasnv1@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_ap.c    | 8 ++++----
>  drivers/staging/rtl8723bs/hal/hal_intf.c   | 2 +-
>  drivers/staging/rtl8723bs/include/rtw_ap.h | 2 +-
>  3 files changed, 6 insertions(+), 6 deletions(-)

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

- Your patch did not apply to any known trees that Greg is in control
  of.  Possibly this is because you made it against Linus's tree, not
  the linux-next tree, which is where all of the development for the
  next version of the kernel is at.  Please refresh your patch against
  the linux-next tree, or even better yet, the development tree
  specified in the MAINTAINERS file for the subsystem you are submitting
  a patch for, and resend it.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
