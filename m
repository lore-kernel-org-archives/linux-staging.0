Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132067C
	for <linux-staging@lists.linux.dev>; Sun,  3 Apr 2022 11:15:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D554C340F0;
	Sun,  3 Apr 2022 11:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1648984523;
	bh=3/02qgq2W7WAA66zUjzaoQPC8uVWNkOWSOwDoAZAqrU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nR+DcjPcTcqp4jM+ilIGIBd8OCvEI6wEJrPE6xe+rYMnM7GuSYTJ2jfwWsOuZd4cJ
	 DoJm52NHXPJxq+Lxx6CvGHIH1ykLG2EuRoN+/SDUiRipKNHIv5gpf2IydXEDL8DHFE
	 nbffh8vv3ZlT2ABGSPZbyYhWGm+hSI9wgVHBfNog=
Date: Sun, 3 Apr 2022 13:15:16 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Charlie Sands <sandsch@northvilleschools.net>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: Fix unsafe memory access by memcmp.
Message-ID: <YkmBxD4H+tUgiuVg@kroah.com>
References: <Ykdcv6Sm3oDE9IEp@sckzor-linux.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ykdcv6Sm3oDE9IEp@sckzor-linux.localdomain>

On Fri, Apr 01, 2022 at 04:12:47PM -0400, Charlie Sands wrote:
> This patch fixes sparse warnings about the memcmp function unsafely
> accessing userspace memory without first copying it to kernel space.
> 
> Signed-off-by: Charlie Sands <sandsch@northvilleschools.net>
> ---
>  drivers/staging/r8188eu/os_dep/ioctl_linux.c | 20 ++++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
> index 7df213856d66..1cfac1b27eb7 100644
> --- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
> +++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
> @@ -3233,23 +3233,27 @@ static int rtw_p2p_get(struct net_device *dev,
>  			       struct iw_request_info *info,
>  			       union iwreq_data *wrqu, char *extra)
>  {
> -	if (!memcmp(wrqu->data.pointer, "status", 6)) {
> +	char wrqu_data_ptr[9];
> +	if (copy_from_user(wrqu_data_ptr, wrqu->data.pointer, 9))
> +		return 0;

Please do not add checkpatch issues when trying to fix up other issues
:(

And that's a very odd variable name you are creating.  That is not a
pointer at all, and either way, it should not be part of a variable
name, this isn't Windows code :)

thanks,

greg k-h
