Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF38C2D73B8;
	Thu, 15 Jan 2026 11:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768476054; cv=none; b=b5h6Tt8XZNIp588U9ZUjeyNLv+MluP9eXewF4DC4E3qGAFIuaikmshzWZ7P7sUCYpMS55jnP256+3yzKrUFCuGtsdxSVWHeF1dm9uSFipV+mBxeW0RY3WK0iresVDrnr1FoxvZYhEWxUgDs59l5Tg0vgUjCZYBrGpa5lNcCNNNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768476054; c=relaxed/simple;
	bh=+0L3Sv3z2GMHtNvRcZkGL7W/gUjEdIj+M9RunGTS5jY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gxEMbzaKIIJLiu+EDwnBnrxh6cdTQAbd8KSlAMNlADooP4arvM9f6QLXp3MS1c+FTlQoKRd5XddoI4YUaxHa/50gNBDaxjvxtI9HixaoOIPyKcxVsSOGiV84e34oYtLeaR4jzX12rjWT+ke3i16iSEIeNgOIXYg8Lzf55FOjk5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=grEKY7BX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="grEKY7BX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDD8AC116D0;
	Thu, 15 Jan 2026 11:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768476054;
	bh=+0L3Sv3z2GMHtNvRcZkGL7W/gUjEdIj+M9RunGTS5jY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=grEKY7BXDey1c+Jvh8lImLgmlW9Znk4kZjbkAL/gbwnpHRBMbZkoVL7L4iehMKf7S
	 38KjkT0hHpwNG2F9VdEH6uOAPJfZfkXKMeIjFVjLZLAvwL+WehfKWJl0Gx3GLVUC3E
	 /0Fj3XSAHKA/5jZfg7CiPQxcedrh7CP7VhqyfPkI=
Date: Thu, 15 Jan 2026 12:20:51 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Khushal Chitturi <khushalchitturi@gmail.com>
Cc: dan.carpenter@linaro.org, hansg@kernel.org, straube.linux@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] staging: rtl8723bs: coding style and refactoring
 cleanups
Message-ID: <2026011535-geiger-harmonize-5fd7@gregkh>
References: <20260115102910.10018-1-khushalchitturi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115102910.10018-1-khushalchitturi@gmail.com>

On Thu, Jan 15, 2026 at 03:59:06PM +0530, Khushal Chitturi wrote:
> This patch series performs minor refactoring and
> coding style cleanups in the rtl8723bs driver,
> focusing on rtw_xmit.c and addressing checkpatch.pl
> warnings.
> 
> ---
> Khushal Chitturi (4):
>   staging: rtl8723bs: fix operator and type cast spacing
>   staging: rtl8723bs: simplify boolean expressions
>   staging: rtl8723bs: rename CamelCase identifiers to snake_case
>   staging: rtl8723bs: fix line length and alignment issues
> 
>  drivers/staging/rtl8723bs/core/rtw_cmd.c     |  17 +-
>  drivers/staging/rtl8723bs/core/rtw_mlme.c    |   2 +-
>  drivers/staging/rtl8723bs/core/rtw_xmit.c    | 238 +++++++++++--------
>  drivers/staging/rtl8723bs/hal/hal_btcoex.c   |   2 +-
>  drivers/staging/rtl8723bs/include/rtw_mlme.h |   6 +-
>  5 files changed, 154 insertions(+), 111 deletions(-)
> 
> -- 
> 2.52.0
> 
> 


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

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
