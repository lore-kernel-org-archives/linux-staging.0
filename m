Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3AE8BE4D;
	Fri,  1 Sep 2023 13:16:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D34DFC433C7;
	Fri,  1 Sep 2023 13:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1693574199;
	bh=RjTV67R/hEUDAWI1b46V7RZdTKpGue2kHHHLhIT4Rug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bfnugBdvRcgYCREvcZmXmsRCq7aPgcyZ8nvkofATpt9NATglKGsEhuXX9O+VPT3bD
	 97vM0qo/oPU7Srha4l07Of7Vo20Q8bGzmOvcqo5wd8ZOPL9vBuxZK7zq/pGI7nRshZ
	 6IbsX0SBvuqy8eCdh6dRmTvpqqWf+OVsxe/jYtZQ=
Date: Fri, 1 Sep 2023 15:16:36 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Pavan Bobba <opensource206@gmail.com>
Cc: Forest Bond <forest@alittletooquiet.net>,
	Michael Straube <straube.linux@gmail.com>,
	Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vt6655: Type encoding info dropped from names
Message-ID: <2023090158-dimmer-jokester-f895@gregkh>
References: <ZPHfqlTmHWGnLrMr@ubuntu.myguest.virtualbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZPHfqlTmHWGnLrMr@ubuntu.myguest.virtualbox.org>

On Fri, Sep 01, 2023 at 06:27:14PM +0530, Pavan Bobba wrote:
> 1.conversion of formal argument names from camel case to snake case
>   for below functions:
> 
>       a.SROMvReadAllContents
>       b.SROMvReadEtherAddress
> 
> 2.conversion of local variable names from camel case to snake case
>   in function SROMvReadEtherAddress
> 
> 3.all instances of W_MAX_TIMEOUT replaced with MAX_TIMEOUT
> 
> Issue found by checkpatch
> 
> Signed-off-by: Pavan Bobba <opensource206@gmail.com>
> ---
>  drivers/staging/vt6655/baseband.c | 12 ++++----
>  drivers/staging/vt6655/card.c     |  4 +--
>  drivers/staging/vt6655/mac.c      | 46 ++++++++++++++---------------
>  drivers/staging/vt6655/mac.h      |  2 +-
>  drivers/staging/vt6655/rf.c       |  6 ++--
>  drivers/staging/vt6655/srom.c     | 48 +++++++++++++++----------------
>  6 files changed, 59 insertions(+), 59 deletions(-)
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
