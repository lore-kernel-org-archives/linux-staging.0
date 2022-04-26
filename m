Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF6138A
	for <linux-staging@lists.linux.dev>; Tue, 26 Apr 2022 05:29:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4501DC385A4;
	Tue, 26 Apr 2022 05:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1650950999;
	bh=5LrqUf7TnS/zJTYHwPYnI7/LpjFy8TZ0dufJyIWXtrE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m6cj1pggf4sC7Qf63Rut9upWu2JqcVD7IKFixt0LH9WKI9Sh2jg1fsPMYt74aTNYI
	 K4vVYtJeLKg76q3sI0LEp/uuQ8zLAXyuGovYDcyKaRriKZorLVvwY+WOMxQmI5OjoC
	 5QBGlQywUNAigUOXoyxOLIAPJ0VLNmScvY6BVbXw=
Date: Tue, 26 Apr 2022 07:29:56 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ian Cowan <ian@linux.cowan.aero>
Cc: Sven Van Asbroeck <TheSven73@gmail.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: fieldbus: remove unnecessary double negation
Message-ID: <YmeDVEYuyxjEV1WI@kroah.com>
References: <20220425222526.6023-1-ian@linux.cowan.aero>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220425222526.6023-1-ian@linux.cowan.aero>

On Mon, Apr 25, 2022 at 06:25:26PM -0400, Ian Cowan wrote:
> The values that are being double negated in this case are booleans to begin
> with, so the double negation has no effect on the result.
> 
> Signed-off-by: Ian Cowan <ian@linux.cowan.aero>
> ---
>  drivers/staging/fieldbus/dev_core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/fieldbus/dev_core.c b/drivers/staging/fieldbus/dev_core.c
> index 5aab734606ea..6766b2b13482 100644
> --- a/drivers/staging/fieldbus/dev_core.c
> +++ b/drivers/staging/fieldbus/dev_core.c
> @@ -28,7 +28,7 @@ static ssize_t online_show(struct device *dev, struct device_attribute *attr,
>  {
>  	struct fieldbus_dev *fb = dev_get_drvdata(dev);
>  
> -	return sprintf(buf, "%d\n", !!fb->online);
> +	return sprintf(buf, "%d\n", fb->online);
>  }
>  static DEVICE_ATTR_RO(online);
>  
> @@ -39,7 +39,7 @@ static ssize_t enabled_show(struct device *dev, struct device_attribute *attr,
>  
>  	if (!fb->enable_get)
>  		return -EINVAL;
> -	return sprintf(buf, "%d\n", !!fb->enable_get(fb));
> +	return sprintf(buf, "%d\n", fb->enable_get(fb));
>  }
>  
>  static ssize_t enabled_store(struct device *dev, struct device_attribute *attr,
> -- 
> 2.35.1
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

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/SubmittingPatches for what needs to be done
  here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
