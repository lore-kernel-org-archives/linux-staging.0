Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB5371
	for <linux-staging@lists.linux.dev>; Mon, 17 May 2021 05:47:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8DBEE6024A;
	Mon, 17 May 2021 05:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1621230444;
	bh=w59UwCiSLOhbtdKqh3N/du4k7Gn1qTyxuGFJJ9mEekA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=zDSOf2NohZtP6vC4cj689FQ/Qc6i+/7rimCtlcmt1OikTw086tWMohZcgWPhuMuFu
	 tD48UimkTepWRmNZkd7bNjULuQ9+rXoIz+q+5h6OHKUIpszeWaM0kuaONi74B+QjwJ
	 Bj56CSW/aQTjjX2gz28E0VSgWloyKbM0U8R+pBiQ=
Date: Mon, 17 May 2021 07:47:19 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Yusup Badiev <ybadiev@gmail.com>
Cc: Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Fix typo in commented code. Issue found by checkpatch
Message-ID: <YKIDZ+GIchvrFI3p@kroah.com>
References: <20210516173138.GA586734@yusupbadiev-17Z90N-R-AAC8U1>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210516173138.GA586734@yusupbadiev-17Z90N-R-AAC8U1>

On Sun, May 16, 2021 at 01:31:38PM -0400, Yusup Badiev wrote:
> This patch changes the typo "Atleast" -> "At least" as checkpatch.pl warned
> 
> Signed-off-by: Yusup Badiev <ybadiev@gmail.com>
> ---
>  drivers/staging/greybus/arche-apb-ctrl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/arche-apb-ctrl.c b/drivers/staging/greybus/arche-apb-ctrl.c
> index bbf3ba744fc4..45afa208d004 100644
> --- a/drivers/staging/greybus/arche-apb-ctrl.c
> +++ b/drivers/staging/greybus/arche-apb-ctrl.c
> @@ -445,7 +445,7 @@ static int __maybe_unused arche_apb_ctrl_suspend(struct device *dev)
>  static int __maybe_unused arche_apb_ctrl_resume(struct device *dev)
>  {
>  	/*
> -	 * Atleast for ES2 we have to meet the delay requirement between
> +	 * At least for ES2 we have to meet the delay requirement between
>  	 * unipro switch and AP bridge init, depending on whether bridge is in
>  	 * OFF state or standby state.
>  	 *
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

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
