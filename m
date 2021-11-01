Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC37C2C82
	for <linux-staging@lists.linux.dev>; Mon,  1 Nov 2021 13:02:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C498860FE8;
	Mon,  1 Nov 2021 13:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1635771720;
	bh=VYx73tcpjpexSamiB+yt/silKL4ndXPFt8SomZn4KFI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pw+pDF+OL6KL8IWekUsKbgEV3jgusKkgitoQORVYV7rVt0A1rhIrpeLo3pH4jW4f8
	 joj49/RTG74cxZ6dadR0yYBf3QeHlnzOCLMxiXGF2a2QVfGtYFdQMyuykVGj4nEW9i
	 soqIn/gOxUUlPVjb0nTUOPD+ZB5QC714N6kMbaY8=
Date: Mon, 1 Nov 2021 14:01:56 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Saurav Girepunje <saurav.girepunje@gmail.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	straube.linux@gmail.com, martin@kaiser.cx,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	saurav.girepunje@hotmail.com
Subject: Re: [PATCH] staging: r8188eu: hal: else is not useful after a return
Message-ID: <YX/lRMNGsCZMKAV3@kroah.com>
References: <YX7iBmKKNZfj8Gca@Sauravs-MacBook-Air.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YX7iBmKKNZfj8Gca@Sauravs-MacBook-Air.local>

On Mon, Nov 01, 2021 at 12:05:50AM +0530, Saurav Girepunje wrote:
> In the function rtl8188eu_hal_init() else after the return statement
> of the if section is not useful. As if condition is true function will
> return from if section, On the other case if condition is false
> function will not return and statement after the if section will
> execute, So there is no need to have else in this case. Remove the
> else after a return statement of the if section.
> 
> Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
> ---
>  drivers/staging/r8188eu/hal/usb_halinit.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)


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

- You sent multiple patches, yet no indication of which ones should be
  applied in which order.  Greg could just guess, but if you are
  receiving this email, he guessed wrong and the patches didn't apply.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/SubmittingPatches for a description of how
  to do this so that Greg has a chance to apply these correctly.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
