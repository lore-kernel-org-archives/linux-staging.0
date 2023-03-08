Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116EF79F5
	for <linux-staging@lists.linux.dev>; Wed,  8 Mar 2023 16:53:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 497C3C433EF;
	Wed,  8 Mar 2023 16:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1678294416;
	bh=4+zJsyme2mSgSvWgH8oHJzEqeQsM0feQlu1GnzXc8z4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oYSc9bs3VPUQ/mScOwSc6RoWVddMaySx5+wqI86Tt13Do0qy5mBmljMP+4l+zD15T
	 ZY1ziadz309957otbGSRSYnUdaBVmXQ5VmyW2QUH9uQjbdb37qa8A3QKvyIjYyKLzX
	 pz9zuZfGYoaIkyR4vbKLgNNcO/LE64l86ub1sS4I=
Date: Wed, 8 Mar 2023 17:53:33 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Leonid Pershin <leonid.pershin@gmail.com>
Cc: Dan Carpenter <error27@gmail.com>, Tong Zhang <ztong0001@gmail.com>,
	Rebecca Mckeever <remckee0@gmail.com>,
	Deepak R Varma <drv@mailo.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8192u: remove split in user-visible string
Message-ID: <ZAi9jb9Po09FoSI1@kroah.com>
References: <20230223193559.157880-1-leonid.pershin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230223193559.157880-1-leonid.pershin@gmail.com>

On Thu, Feb 23, 2023 at 10:35:57PM +0300, Leonid Pershin wrote:
> According to coding style, user-visible strings in printk()
> function calls cannot be split across multiple lines.
> Issue found with checkpatch.pl.
> 
> Signed-off-by: Leonid Pershin <leonid.pershin@gmail.com>
> ---
> Changes in v2:
>   - Replace printk(KERN_DEBUG...) with pr_debug()

Now you are doing two different things, please only do one thing per
patch.

> 
>  drivers/staging/rtl8192u/ieee80211/ieee80211_crypt_tkip.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211_crypt_tkip.c b/drivers/staging/rtl8192u/ieee80211/ieee80211_crypt_tkip.c
> index 9bfd24ad46b6..c378bdff453b 100644
> --- a/drivers/staging/rtl8192u/ieee80211/ieee80211_crypt_tkip.c
> +++ b/drivers/staging/rtl8192u/ieee80211/ieee80211_crypt_tkip.c
> @@ -72,16 +72,14 @@ static void *ieee80211_tkip_init(int key_idx)
>  
>  	priv->tx_tfm_michael = crypto_alloc_shash("michael_mic", 0, 0);
>  	if (IS_ERR(priv->tx_tfm_michael)) {
> -		printk(KERN_DEBUG "ieee80211_crypt_tkip: could not allocate "
> -				"crypto API michael_mic\n");
> +		pr_debug("ieee80211_crypt_tkip: could not allocate crypto API michael_mic\n");

Are you sure you need the prefix now that you are using pr_debug()?  And
as this is a driver, why not use the networking debug macros instead?

>  		priv->tx_tfm_michael = NULL;
>  		goto fail;
>  	}
>  
>  	priv->rx_tfm_michael = crypto_alloc_shash("michael_mic", 0, 0);
>  	if (IS_ERR(priv->rx_tfm_michael)) {
> -		printk(KERN_DEBUG "ieee80211_crypt_tkip: could not allocate "
> -				"crypto API michael_mic\n");
> +		pr_debug("ieee80211_crypt_tkip: could not allocate crypto API michael_mic\n");

Same here, do you still need the prefix and why not dev_dbg() or the
network version?

thanks,

greg k-h
