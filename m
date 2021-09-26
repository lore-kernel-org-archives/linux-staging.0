Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2AF3FC8
	for <linux-staging@lists.linux.dev>; Sun, 26 Sep 2021 06:52:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 538A060EFF;
	Sun, 26 Sep 2021 06:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1632639146;
	bh=81xpS3q2UnTLTS7hZjj+PjNPBljHJgePYoS+NnHrNCY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AkwGttSCGwnT9qhKGQxrSEduHbkFHr6WKINk4rBJCgsgnFznYy/y9VjydP7hpWJdF
	 oKb8x8nCOiXOz1uCmi/sLpKLxRlklKp+yH9Fw5FV8PBPqs8IwSMLa1lF8FzY1w+JIc
	 U8i5NwhghUEVIKmBFbomw+htafj2ehQ0Xj4SuMPc=
Date: Sun, 26 Sep 2021 08:52:18 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Michael Estner <michaelestner@web.de>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Remove uneccessary parantheas
Message-ID: <YVAYornUTU7jTNIW@kroah.com>
References: <20210925192018.6745-1-michaelestner@web.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210925192018.6745-1-michaelestner@web.de>

On Sat, Sep 25, 2021 at 09:20:15PM +0200, Michael Estner wrote:
> Fix to be conform with the checkpatch style requirements
> 
> Signed-off-by: Michael Estner <michaelestner@web.de>
> ---
>  drivers/staging/pi433/rf69.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/pi433/rf69.c b/drivers/staging/pi433/rf69.c
> index 7d86bb8be245..980afa801e08 100644
> --- a/drivers/staging/pi433/rf69.c
> +++ b/drivers/staging/pi433/rf69.c
> @@ -470,9 +470,9 @@ static int rf69_set_bandwidth_intern(struct spi_device *spi, u8 reg,
>  		return -EINVAL;
>  	}
> 
> -	if ((mantisse != mantisse16) &&
> -	    (mantisse != mantisse20) &&
> -	    (mantisse != mantisse24)) {
> +	if (mantisse != mantisse16 &&
> +	    mantisse != mantisse20 &&
> +	    mantisse != mantisse24) {
>  		dev_dbg(&spi->dev, "set: illegal input param");
>  		return -EINVAL;
>  	}
> --
> 2.25.1
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
