Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74ABED4
	for <linux-staging@lists.linux.dev>; Mon, 19 Sep 2022 09:11:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33382C433C1;
	Mon, 19 Sep 2022 09:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1663578669;
	bh=iPtMgy84ffC2WEx8YZJwblVWX8+zlevMF6aBQX0ahwo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=zYETymyv/i77cMV3T+NriXDNBjsqX2bw15dqG6W1/rgXdYxBCbEUMJjEmiZpf+GT1
	 P7ei0DnMIosp6ORaAxGWu52JQYdhI6X/6kbQ3izagldhg2YRZ+Bv+vyZ7RXZv9V51b
	 4Rlk320Nffy2lkz7yJv0JKbd2ogw6I/hPOHvGLSU=
Date: Mon, 19 Sep 2022 11:11:37 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Shang XiaoJing <shangxiaojing@huawei.com>
Cc: andy.shevchenko@gmail.com, ilpo.jarvinen@linux.intel.com,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH -next v4] staging: fwserial: Switch to kfree_rcu() API
Message-ID: <YygySR0Zh1gw5M6d@kroah.com>
References: <20220919091056.29527-1-shangxiaojing@huawei.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220919091056.29527-1-shangxiaojing@huawei.com>

On Mon, Sep 19, 2022 at 05:10:56PM +0800, Shang XiaoJing wrote:
> Instead of invoking a synchronize_rcu() to free a pointer after a grace
> period, we can directly make use of a new API that does the same but in
> a more efficient way.
> 
> Signed-off-by: Shang XiaoJing <shangxiaojing@huawei.com>
> ---
> Changelog:
> v3: the first version of the PATCH
> v1: v3 resent as v1
> v2: use kfree_rcu() instead of kvfree_rcu() for clarity
> v4: resend v2 as v4 to avoid versioning confusion
> ---
>  drivers/staging/fwserial/fwserial.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/fwserial/fwserial.c b/drivers/staging/fwserial/fwserial.c
> index 81b06d88ed0d..8d2b4ed1f39e 100644
> --- a/drivers/staging/fwserial/fwserial.c
> +++ b/drivers/staging/fwserial/fwserial.c
> @@ -2117,8 +2117,7 @@ static void fwserial_remove_peer(struct fwtty_peer *peer)
>  	if (port)
>  		fwserial_release_port(port, true);
>  
> -	synchronize_rcu();
> -	kfree(peer);
> +	kfree_rcu(peer);

What is "more efficient" about this change?

And do you have the hardware for this device to test with?  It would be
good to finally get this out of staging, or to just remove it entirely
if no one uses it.

thanks,

greg k-h
