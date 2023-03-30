Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CF21FC4
	for <linux-staging@lists.linux.dev>; Thu, 30 Mar 2023 12:53:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07A82C433D2;
	Thu, 30 Mar 2023 12:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1680180796;
	bh=8qLMey7kTMh7dd1/XYcwvnGwz0i7C9tIuc0XxBH8KfU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZT2HO1VWFd3Hjn1k63iLvOMXx+WRMNxySdHOa7mDIvrY47i7M2KZyaRwWBk4l4TVL
	 IFdBwlx/r2/OJ6LCYTuqdS42VaDW/t+Q1XI9v0D9BJA2n1oqc0mcbsGM0FdLGhMTmT
	 nxVdnzcNTGDWzgEQ7NOyvwQqdKq/KtravszbGktk=
Date: Thu, 30 Mar 2023 14:53:13 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Joel Camilo Chang Gonzalez <jcchangg3@gmail.com>
Cc: driverdev-devel@linuxdriverproject.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: ks7010: remove unnecessary parentheses
Message-ID: <ZCWGOZqdH1kWtOEq@kroah.com>
References: <ZCWFHFogxD+O9N51@joel-ubuntu-desktop>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZCWFHFogxD+O9N51@joel-ubuntu-desktop>

On Thu, Mar 30, 2023 at 08:48:28PM +0800, Joel Camilo Chang Gonzalez wrote:
> Remove redundant parentheses
> 
> Signed-off-by: Joel Camilo Chang Gonzalez <jcchangg3@gmail.com>
> ---
>  drivers/staging/ks7010/ks_wlan_net.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/ks7010/ks_wlan_net.c b/drivers/staging/ks7010/ks_wlan_net.c
> index e03c87f0bfe7..eef1a1e70088 100644
> --- a/drivers/staging/ks7010/ks_wlan_net.c
> +++ b/drivers/staging/ks7010/ks_wlan_net.c
> @@ -193,14 +193,14 @@ static int ks_wlan_set_freq(struct net_device *dev,
>  		fwrq->freq.m = c + 1;
>  	}
>  	/* Setting by channel number */
> -	if ((fwrq->freq.m > 1000) || (fwrq->freq.e > 0))
> +	if (fwrq->freq.m > 1000 || fwrq->freq.e > 0)

Do you want to have to remember the precidence order between "||" and
">"?  I don't, so please don't make this change.

thanks,

greg k-h
