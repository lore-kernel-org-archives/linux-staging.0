Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFF87F
	for <linux-staging@lists.linux.dev>; Tue, 22 Aug 2023 13:46:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E67A5C433C9;
	Tue, 22 Aug 2023 13:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1692712018;
	bh=2tqfJL32FPqN+NczC6Z7cjoqXSXsEnZTlELEtiARWsQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=My70Q2bs6Q/y5DFcmYjS1m6KCp6pY76c9xj6l4FFEnpJxdz80oCRW7y1nLnaYMqAz
	 X3qhL+cPLeVFoyI22kjEGbQIF/LwustXk8klus5TMAkAt/9p7As9YMq6ewBaQ0hbBc
	 jXB94CcMD2G/2No2W/zqaAgPZycuv9wwDHpNR/E8=
Date: Tue, 22 Aug 2023 15:46:55 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Nicklaus Choo <nicklauscyc@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] Fix print formatting warning for some functions in
 drivers/staging/vme_user/vme.c
Message-ID: <2023082228-staunch-carload-5553@gregkh>
References: <20230817015634.18428-1-nicklauscyc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230817015634.18428-1-nicklauscyc@gmail.com>

On Wed, Aug 16, 2023 at 06:56:34PM -0700, Nicklaus Choo wrote:
> Fixed a coding style issue.
> 
> Signed-off-by: Nicklaus Choo <nicklauscyc@gmail.com>
> ---
>  drivers/staging/vme_user/vme.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
> index b5555683a069..d583c4abbf50 100644
> --- a/drivers/staging/vme_user/vme.c
> +++ b/drivers/staging/vme_user/vme.c
> @@ -1742,12 +1742,12 @@ int vme_slot_num(struct vme_dev *vdev)
>  
>  	bridge = vdev->bridge;
>  	if (!bridge) {
> -		printk(KERN_ERR "Can't find VME bus\n");
> +		pr_err("Can't find VME bus\n");
>  		return -EINVAL;
>  	}
>  
>  	if (!bridge->slot_get) {
> -		printk(KERN_WARNING "vme_slot_num not supported\n");
> +		pr_warn("%s not supported\n", __func__);
>  		return -EINVAL;
>  	}
>  
> -- 
> 2.41.0
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
