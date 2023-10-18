Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686958486;
	Wed, 18 Oct 2023 07:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="RKJRBP7Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31A6FC433C7;
	Wed, 18 Oct 2023 07:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697614769;
	bh=DOT4lFyDPmpnV7LNhAX7vgMrRhFylHUDm7eC6XlMQpg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RKJRBP7Q5AOj9uas6TiNVEJ9C23ujJ3Kex45bw9Z6aFY4gjGyQhNR0H4MT3MsV5Sy
	 tmiV7HymHdsavP/YUqVOk966+Onn9lOXY0D90rRxPzdcDkUsB+a03nK0NJAw6S0bji
	 uwqHVfm2PDZET7joHbpeaf66KjSQzSO8tnU9Ko9w=
Date: Wed, 18 Oct 2023 09:39:25 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Calvince Otieno <calvncce@gmail.com>
Cc: gustavo@embeddedor.com, outreachy@lists.linux.dev,
	Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	Julia Lawall <julia.lawall@inria.fr>, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: vme_user: replace strcpy with strscpy
Message-ID: <2023101844-phoniness-gory-635a@gregkh>
References: <ZS+Jb2rQWbOIIQ42@lab-ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZS+Jb2rQWbOIIQ42@lab-ubuntu>

On Wed, Oct 18, 2023 at 10:29:51AM +0300, Calvince Otieno wrote:
> Checkpatch suggests using strscpy() instead of strncpy().
> 
> The advantages of strscpy() are that it always adds a NUL terminator
> and prevents read overflows if the source string is not properly
> terminated. One potential disadvantage is that it doesn't zero pad the
> string like strncpy() does.
> 
> In this code, strscpy() and strncpy() are equivalent and do not affect
> runtime behavior. strscpy() simply copies the known string value of the
> variable driver_name into the fake_bridge->name variable, which also
> has a fixed size.
> 
> While using strscpy() does not address any bugs, it is considered a better
> practice and aligns with checkpatch recommendations.
> 
> Signed-off-by: Calvince Otieno <calvncce@gmail.com>
> ---
>  drivers/staging/vme_user/vme_fake.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/vme_user/vme_fake.c b/drivers/staging/vme_user/vme_fake.c
> index 0e02c194298d..09b05861017a 100644
> --- a/drivers/staging/vme_user/vme_fake.c
> +++ b/drivers/staging/vme_user/vme_fake.c
> @@ -67,6 +67,7 @@ struct fake_driver {
>  	unsigned long long lm_base;
>  	u32 lm_aspace;
>  	u32 lm_cycle;
> +
>  	void (*lm_callback[4])(void *);
>  	void *lm_data[4];

Why did you make this extra line change?

>  	struct tasklet_struct int_tasklet;
> @@ -1091,7 +1092,7 @@ static int __init fake_init(void)
>  	tasklet_init(&fake_device->int_tasklet, fake_VIRQ_tasklet,
>  		     (unsigned long)fake_bridge);
>  
> -	strcpy(fake_bridge->name, driver_name);
> +	strscpy(fake_bridge->name, driver_name, sizeof(fake_bridge->name))

Are you sure this change is identical?  You need to document how you
have proved that.

thanks,

greg k-h
