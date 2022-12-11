Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0759186F;
	Sun, 11 Dec 2022 11:06:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE0D2C433D2;
	Sun, 11 Dec 2022 11:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1670756768;
	bh=gjPL3MEV9t4ErlkVqGFGfA27Nd5zV7/i7g3GgTTXPoc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NkBTZnscTg+QPGWzbGHWmDkrDAijkBIUEPiI566gJzolVS4A9y+RW3zbPd+qyaRm2
	 3LzhPAdbZuZLeUQr61EBZgRVgN1Q4ZVwTfbOVgeoR9j4Gq4lYOMWSDebJTad0lEiSD
	 Ok9YIypDGHipA9q9n4hqdQwIb5j6mTANe7cG8jaM=
Date: Sun, 11 Dec 2022 12:06:04 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dalvin Aiguobas <pharcodra@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: wlan-ng: fix checkpatch error for spinlock
Message-ID: <Y5W5nKtLMV9b4xnm@kroah.com>
References: <20221211105649.GA4683@koolguy>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221211105649.GA4683@koolguy>

On Sun, Dec 11, 2022 at 11:56:49AM +0100, Dalvin Aiguobas wrote:
> Checkpatch Styleproblem fixed by adding comment.
> 
> Signed-off-by: Dalvin <pharcodra@gmail.com>
> ---
>  drivers/staging/wlan-ng/hfa384x.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/wlan-ng/hfa384x.h b/drivers/staging/wlan-ng/hfa384x.h
> index 0611e37df6ac..ad117d570bb6 100644
> --- a/drivers/staging/wlan-ng/hfa384x.h
> +++ b/drivers/staging/wlan-ng/hfa384x.h
> @@ -1171,6 +1171,7 @@ struct hfa384x_usbctlx {
>  };
>  
>  struct hfa384x_usbctlxq {
> +	/* lock: Protect structure fields */
>  	spinlock_t lock;
>  	struct list_head pending;
>  	struct list_head active;
> -- 
> 2.25.1
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
  Documentation/SubmittingPatches for what is needed in order to
  properly describe the change.

- You did not write a descriptive Subject: for the patch, allowing Greg,
  and everyone else, to know what this patch is all about.  Please read
  the section entitled "The canonical patch format" in the kernel file,
  Documentation/SubmittingPatches for what a proper Subject: line should
  look like.

- It looks like you did not use your "real" name for the patch on either
  the Signed-off-by: line, or the From: line (both of which have to
  match).  Please read the kernel file, Documentation/SubmittingPatches
  for how to do this correctly.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
