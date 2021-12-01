Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0900129CA
	for <linux-staging@lists.linux.dev>; Wed,  1 Dec 2021 14:53:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 377C4C53FCC;
	Wed,  1 Dec 2021 14:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1638370400;
	bh=tRM4IQypyfZVK9brbWDFPwHw3IeDdbvPH2Degh5/8EM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NtjLUf7dliZnPzEewNM40lni40UsOdOYjzog3ZAJpOt8zihkR4qHrzDbYMdrdjc12
	 MmOC9VyV+9wSeHy+wqkbLRFFZEvy4h3uk+9ywizTDDo6X7BMs7seu0UpGIKqjF3oWw
	 VxM6ITp+6gwJWiQeLcTBCTHFOo00T8nGs58+/49Y=
Date: Wed, 1 Dec 2021 15:53:18 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Adam Kandur <rndd@tuta.io>
Cc: netdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] QLGE: qlge_main: Fix style
Message-ID: <YaeMXk3L0Un0OcYE@kroah.com>
References: <MpqQpIa--F-2@tuta.io>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MpqQpIa--F-2@tuta.io>

On Wed, Dec 01, 2021 at 03:39:08PM +0100, Adam Kandur wrote:
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

- Your patch was attached, please place it inline so that it can be
  applied directly from the email message itself.

- Your patch does not have a Signed-off-by: line.  Please read the
  kernel file, Documentation/SubmittingPatches and resend it after
  adding that line.  Note, the line needs to be in the body of the
  email, before the patch, not at the bottom of the patch or in the
  email signature.

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
