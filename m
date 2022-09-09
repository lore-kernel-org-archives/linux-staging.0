Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7572D808
	for <linux-staging@lists.linux.dev>; Fri,  9 Sep 2022 11:48:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DF76C433C1;
	Fri,  9 Sep 2022 11:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1662724095;
	bh=3WE3eiQtpiFf52y/6DbiRSF8e+Ppp9dpc6tzPoSUnYQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aISw6mgWMdXOLvlfIFAon0kEj74DXSLnY82cyLINjcGFwfVAgD4SfI+ikob4qxWZO
	 zl1ZWRUKEjwlFIpHIIoItki9Au7Tkk9DYmI6+0cwta5FyrOUR3Ro628BtLybTTZebN
	 0frtmUzJrxMqdCyTRqh+ZF/6DrUyjxEyLw03jR5s=
Date: Fri, 9 Sep 2022 13:48:30 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Burak Ozdemir <bozdemir@gmail.com>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: sm750fb: Coding style clean up
Message-ID: <YxsoDh7U2ShyekOj@kroah.com>
References: <631b237c.170a0220.aed56.04f5@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <631b237c.170a0220.aed56.04f5@mx.google.com>

On Fri, Sep 09, 2022 at 02:28:49PM +0000, Burak Ozdemir wrote:
> Adhere to coding style and fix camel casing in function name.
> 
> Signed-off-by: Burak Ozdemir <bozdemir@gmail.com>
> ---
>  drivers/staging/sm750fb/sm750.c        | 2 +-
>  drivers/staging/sm750fb/sm750_cursor.c | 2 +-
>  drivers/staging/sm750fb/sm750_cursor.h | 2 +-
   3 files changed, 3 insertions(+), 3 deletions(-)

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
