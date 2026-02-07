Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9D0256C84
	for <linux-staging@lists.linux.dev>; Sat,  7 Feb 2026 13:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770471582; cv=none; b=Krn5xykMfahVBQtfuAdVmy3iAyWxTkWdqZoEJ/ZZFJmlzBNQ6GYMWKShGZrUfY5iOcANYTp3ox0hEBPsRBXxt5joGsevRDRlpoDNUR4C78c14+KfV4etCwOtsGWuifSt7zOBbOKqEYplPxi8r/ess2O/mqe+ZiIB0SDuIssIHpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770471582; c=relaxed/simple;
	bh=g5yayyoccT0ooEwDH/Na6zdy3OYvyfh3X2JIypx1x+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A7RF6Ob+M8vgm6mcoyo7qf6u6Olpjl1jMHhNi74ctYjhA1Etp9uNsya86EH3gzcrNXoeXeDoFBaKoh/NRMF5zO72U9qFqsH4w2gDJ2++oxoOrw1N1wDeTaJf4TfGf52BZktNkAs2U/VXQwTn53BCM+5AohAzghv8d0RRUpr4aYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=muRLe4b0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="muRLe4b0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F5BFC116D0;
	Sat,  7 Feb 2026 13:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770471581;
	bh=g5yayyoccT0ooEwDH/Na6zdy3OYvyfh3X2JIypx1x+Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=muRLe4b0fZOrej/zZ0I1oCPSaQ6UEhIbcke9OJNgqQtBOXZ+5fCZcA7FwfJn0i15l
	 r1K+siIQxi2/XjWwlEme6uhBWCyP+0Zx8n5JdI9jOwZEEbJknDYgq+RRYTfXwZUkvY
	 JNKGpa/jMWQvLUeJukYk4wGPXEvIl6uBUsdFRRco=
Date: Sat, 7 Feb 2026 14:39:38 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: frankfmy <pryanishnikovartem@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH 1/5] staging: rtl8723bs: fix spelling errors in core
 driver files
Message-ID: <2026020708-donor-unhidden-0512@gregkh>
References: <1770319619.1.pryanishnikovartem@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1770319619.1.pryanishnikovartem@gmail.com>

On Thu, Feb 05, 2026 at 11:26:59PM +0400, frankfmy wrote:
> Fix various spelling errors found by codespell in the rtl8723bs
> staging driver core files:
> 
> - rtw_efuse.c: fot -> for
> - rtw_wlan_util.c: overwirte -> overwrite, Vender -> vendor (also
>   fixing CamelCase), get_realtek_assoc_AP_vender ->
>   get_realtek_assoc_AP_vendor
> - rtw_mlme.c: varable -> variable
> - rtw_cmd.c: beucase -> because
> - rtw_recv.c: temporily -> temporarily
> - rtw_pwrctrl.c: willl -> will
> - rtw_mlme_ext.c: receieving -> receiving
> 
> Signed-off-by: frankfmy <pryanishnikovartem@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_cmd.c       |  2 +-
>  drivers/staging/rtl8723bs/core/rtw_efuse.c     |  2 +-
>  drivers/staging/rtl8723bs/core/rtw_mlme.c      |  2 +-
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c  |  2 +-
>  drivers/staging/rtl8723bs/core/rtw_pwrctrl.c   |  2 +-
>  drivers/staging/rtl8723bs/core/rtw_recv.c      |  4 ++--
>  drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 18 +++++++++---------
>  7 files changed, 16 insertions(+), 16 deletions(-)

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
