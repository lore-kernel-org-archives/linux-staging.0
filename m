Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100B87EE
	for <linux-staging@lists.linux.dev>; Sun, 27 Aug 2023 05:49:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FF65C433C8;
	Sun, 27 Aug 2023 05:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1693115346;
	bh=zU2OZjeNZeUgz0oyUUk2xOzC7VimSyXciicKURU48/Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G7GHOjzniW+ejQHzLRi92RCA2GrYVkO7XtJWYwEczC/EhnqqSDt4YgTvoanC/uGzn
	 OUPPSr52uoSyZMyWW5gkcHzYCXJRNlf98gC/C4AgmlzLU8A14SpYYZ7xHIsO2dQq81
	 1rWwkYwovyrwATRWFVR1hZYMe5TVZgG5LaBNvO/M=
Date: Sun, 27 Aug 2023 07:49:02 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: ozlinux@hotmail.com
Cc: colin.i.king@gmail.com, sumitraartsy@gmail.com, nhuck@google.com,
	u.kleine-koenig@pengutronix.de, geert@linux-m68k.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] Clean up the octeon ethernet driver
Message-ID: <2023082729-clang-cause-cdc3@gregkh>
References: <PH7PR11MB764393FA00BBB83B25B8853EBCE1A@PH7PR11MB7643.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PH7PR11MB764393FA00BBB83B25B8853EBCE1A@PH7PR11MB7643.namprd11.prod.outlook.com>

On Sat, Aug 26, 2023 at 08:49:47PM -0400, ozlinux@hotmail.com wrote:
> This patch cleans up the octeon ethernet driver,
> and makes it better adhere to the kernel coding
> standard.
> 
> I am sending in this patch as part of the 
> Eudyptula Challenge.
> 
> Signed-off-by: Oliver Crumrine <ozlinux@hotmail.com>
> 
> ---
>  drivers/staging/octeon/ethernet.c     |  6 ++--
>  drivers/staging/octeon/octeon-stubs.h | 50 +++++++++++++--------------
>  2 files changed, 28 insertions(+), 28 deletions(-)
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
  Documentation/process/submitting-patches.rst for what is needed in
  order to properly describe the change.

- You did not write a descriptive Subject: for the patch, allowing Greg,
  and everyone else, to know what this patch is all about.  Please read
  the section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what a proper
  Subject: line should look like.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
