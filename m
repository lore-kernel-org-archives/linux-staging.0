Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8316257B;
	Wed,  9 Nov 2022 07:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C5C0C433D6;
	Wed,  9 Nov 2022 07:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1667979029;
	bh=A7qt0zFqAaMzmKHQqsEQpxmG5gXY5Z/MDjAh8xxm+Gs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MKbJbSnPC/vbm6nr0l4ySwZbWNlOLsm4jzpCufyhgeV8ORzOrhSpquySZriHG1/Tk
	 h4A4fJNBqvNNQ1kHPeSpc/xqDaVOuBzakyMuE+5LTg1D9aJVD9T6Z4KjJIC8lSQMXs
	 Nrb96WvDIgbV94vy9Prf5Huj0GWzGZEeb6IVzF9I=
Date: Wed, 9 Nov 2022 08:30:26 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Deepak R Varma <drv@mailo.com>
Cc: outreachy@lists.linux.dev, Sven Van Asbroeck <TheSven73@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: fieldbus: replace snprintf in show functions
 with sysfs_emit
Message-ID: <Y2tXEibm2QxH37FK@kroah.com>
References: <Y2tBJFSsyUzdb+eO@qemulion>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2tBJFSsyUzdb+eO@qemulion>

On Wed, Nov 09, 2022 at 11:26:52AM +0530, Deepak R Varma wrote:
> The show() methods should only use sysfs_emit() when formatting values
> to be returned to the user space.
> Ref: Documentation/filesystems/sysfs.rst
> Issue identified by coccicheck.
> 
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
> 
> Changes in v2:
>    1. Switch to using sysfs_emit instead of scnprintf
>    2. Update patch subject and log accordingly
>       Feedback from gregkh@linuxfoundation.org
> 
> 
>  drivers/staging/fieldbus/dev_core.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/fieldbus/dev_core.c b/drivers/staging/fieldbus/dev_core.c
> index 5aab734606ea..d32599f4eb44 100644
> --- a/drivers/staging/fieldbus/dev_core.c
> +++ b/drivers/staging/fieldbus/dev_core.c
> @@ -67,10 +67,10 @@ static ssize_t card_name_show(struct device *dev, struct device_attribute *attr,
>  	struct fieldbus_dev *fb = dev_get_drvdata(dev);
> 
>  	/*
> -	 * card_name was provided by child driver, could potentially be long.
> -	 * protect against buffer overrun.
> +	 * sysfs provides PAGE_SIZE long buffer to take care of potentially

No need to ever mention PAGE_SIZE at all, this comment should just be:
	/* card_name was provided by child driver */

But the larger question is, why did you only convert one of the sysfs
show functions in this file?  Why not do them all?

thanks,

greg k-h
