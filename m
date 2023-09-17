Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA042636
	for <linux-staging@lists.linux.dev>; Sun, 17 Sep 2023 16:24:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD511C433C7;
	Sun, 17 Sep 2023 16:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1694967882;
	bh=x/KCXyBRbWjiPXZK4Pl2NG7NFg623HRFzxPQK131EHY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JVkvnBgvVX3wnfIA/CgdWTBsIJM22hply72nxSabdldgmRZZQ24OmH5eiKxifJEz0
	 3V3kNZGVfVqaopFdRfrq1IoBPO+tn5SBzwSY5ZVVy5i2tg+3ww+hU1Lky1hfFCien/
	 q2AZGf7ZyMifimFQz3wY+JmHsFzCHTls7t/e7nSk=
Date: Sun, 17 Sep 2023 18:24:35 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jonathan Bergh <bergh.jonathan@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vme_user: Replace strcpy with strscpy
Message-ID: <2023091756-pastel-ipad-6cd7@gregkh>
References: <20230917154302.913956-1-bergh.jonathan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230917154302.913956-1-bergh.jonathan@gmail.com>

On Sun, Sep 17, 2023 at 05:43:02PM +0200, Jonathan Bergh wrote:
> Replace strcpy with strscpy as preferred by checkpatch in vme_fake.c to
> prevent warnings.
> 
> Signed-off-by: Jonathan Bergh <bergh.jonathan@gmail.com>
> ---
>  drivers/staging/vme_user/vme_fake.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/vme_user/vme_fake.c b/drivers/staging/vme_user/vme_fake.c
> index 9bcb89a84d53..0cf5700e151f 100644
> --- a/drivers/staging/vme_user/vme_fake.c
> +++ b/drivers/staging/vme_user/vme_fake.c
> @@ -1093,7 +1093,7 @@ static int __init fake_init(void)
>  	tasklet_init(&fake_device->int_tasklet, fake_VIRQ_tasklet,
>  			(unsigned long) fake_bridge);
>  
> -	strcpy(fake_bridge->name, driver_name);
> +	strscpy(fake_bridge->name, driver_name, sizeof(fake_bridge->name));

If it were this easy, we would have swept the tree and done so, right?
Are you sure this is correct?  If so, please document exactly why it is
correct in the changelog text when you resend this.

thanks,

greg k-h
