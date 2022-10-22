Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C87020F0
	for <linux-staging@lists.linux.dev>; Sat, 22 Oct 2022 05:57:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3E35C433C1;
	Sat, 22 Oct 2022 05:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666418273;
	bh=IJ+1ChbV+AuNZ3jJtulLPbuwkBPemms0TDHufKO/CZk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xDWFp8lsB5TcreZjH+eG7y4wkArrhM9oZSQ2ZJmOlHIlgwb1adOh0fXxws9rCIdXZ
	 0kM1yVBE6vL6qLgicYVxmk97gMj8VcAXZXKrE2oqrBqr9iJGEPyPtjJlX9rHfPHkIr
	 oSsEQa9JHQUJFwgwwFwgSUayNdN8vRLnt8HPeXoQ=
Date: Sat, 22 Oct 2022 07:58:37 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Aaron Lawrence <t4rmin@zohomail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Staging: rtl8192e: fixed multiple coding style issues
Message-ID: <Y1OGjf7gRmhTQFJV@kroah.com>
References: <be839b05d799ff8e62fc2f79e6f0aaec81a8cd19.camel@zohomail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be839b05d799ff8e62fc2f79e6f0aaec81a8cd19.camel@zohomail.com>

On Sat, Oct 22, 2022 at 12:05:58PM +0700, Aaron Lawrence wrote:
> 

> From 66a313db135ffaa86d2aaddb3b2286c7b004b5f1 Mon Sep 17 00:00:00 2001
> From: Aaron Lawrence <t4rmin@zohomail.com>
> Date: Sat, 22 Oct 2022 11:30:22 +0700
> Subject: [PATCH] Staging: rtl8192e: fixed multiple coding style issues
> 
> Fixed multiple coding style issues on multiple files
> according to the checkpatchscript.
> 
> Signed-off-by: Aaron Lawrence <t4rmin@zohomail.com>
> ---
>  drivers/staging/rtl8192e/rtl819x_HTProc.c    |  1 +
>  drivers/staging/rtl8192e/rtl819x_TSProc.c    | 11 ++++----
>  drivers/staging/rtl8192e/rtllib_crypt_ccmp.c | 12 +--------
>  drivers/staging/rtl8192e/rtllib_crypt_tkip.c | 28 +-------------------
>  drivers/staging/rtl8192e/rtllib_crypt_wep.c  | 10 +------
>  drivers/staging/rtl8192e/rtllib_tx.c         | 15 +++++------
>  6 files changed, 15 insertions(+), 62 deletions(-)

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

- Your patch was attached, please place it inline so that it can be
  applied directly from the email message itself.

- Your patch did many different things all at once, making it difficult
  to review.  All Linux kernel patches need to only do one thing at a
  time.  If you need to do multiple things (such as clean up all coding
  style issues in a file/driver), do it in a sequence of patches, each
  one doing only one thing.  This will make it easier to review the
  patches to ensure that they are correct, and to help alleviate any
  merge issues that larger patches can cause.

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/SubmittingPatches for what is needed in order to
  properly describe the change.

- You did not write a descriptive Subject: for the patch, allowing Greg,
  and everyone else, to know what this patch is all about.  Please read
  the section entitled "The canonical patch format" in the kernel file,
  Documentation/SubmittingPatches for what a proper Subject: line should
  look like.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
