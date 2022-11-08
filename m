Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB388BE1;
	Tue,  8 Nov 2022 15:13:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD78CC433B5;
	Tue,  8 Nov 2022 15:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1667920395;
	bh=yjUEyhaRIiHMqqO27oI8Zj9p/9BwETLNtnjjbRI3gdc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TnykQP2KcAzGAG/+CJJg8u7H4NN9PjTW3S24WLXdrw/LYKque3tsoHXiT/uT1NJB1
	 +07FaD7LPaEt5y2Lp1nW6IVlWLQLOdqIFoURyuKEKAwO5/+oByVWgdECQuB+I4vpro
	 z7ab5TdoPCnhUQetg4jz2Xthrnl1bdez0tJRFONM=
Date: Tue, 8 Nov 2022 16:13:12 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Deepak R Varma <drv@mailo.com>
Cc: outreachy@lists.linux.dev, Sven Van Asbroeck <TheSven73@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fieldbus: convert snprintf to scnprintf
Message-ID: <Y2pyCA/tRunNVRQt@kroah.com>
References: <Y2K2MD7+WBu4QouU@qemulion>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2K2MD7+WBu4QouU@qemulion>

On Wed, Nov 02, 2022 at 11:55:52PM +0530, Deepak R Varma wrote:
> It is recommended to use scnprintf instead of snprintf to accurately
> return the size of the encoded data. Following article [1] has details
> on the reason for this kernel level migration. This issue was identified
> using coccicheck.
> 
> [1] https://lwn.net/Articles/69419/
> 
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
>  drivers/staging/fieldbus/dev_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/fieldbus/dev_core.c b/drivers/staging/fieldbus/dev_core.c
> index 5aab734606ea..d51f2b02d5e6 100644
> --- a/drivers/staging/fieldbus/dev_core.c
> +++ b/drivers/staging/fieldbus/dev_core.c
> @@ -70,7 +70,7 @@ static ssize_t card_name_show(struct device *dev, struct device_attribute *attr,
>  	 * card_name was provided by child driver, could potentially be long.
>  	 * protect against buffer overrun.
>  	 */
> -	return snprintf(buf, PAGE_SIZE, "%s\n", fb->card_name);
> +	return scnprintf(buf, PAGE_SIZE, "%s\n", fb->card_name);

No, neither of these are correct.

Please use sysfs_emit() for sysfs show callbacks.

thanks,

greg k-h
