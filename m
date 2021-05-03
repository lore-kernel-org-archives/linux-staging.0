Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842B070
	for <linux-staging@lists.linux.dev>; Mon,  3 May 2021 16:48:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1C91F611CE;
	Mon,  3 May 2021 16:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1620060483;
	bh=pqQt+ufivPLeHfDzgYO6blIaZRqsbQC3VMEA9EWcKbM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HA3aXBnB3YjQaRuuC/hNpBOfQg7bHvFYdroZGq16La6nfkXDpDT6ewCPdFY2c5k/p
	 RvLM5w1IDKInW5dbmiKtBAE+/rhbRDvf2SyMeKK73r8uPc3VI9aps74d8U7fbnmtle
	 B6tvGcFvuKtWyJ8FoPDtAu2ZNpZwsIAzxZFeCpE0=
Date: Mon, 3 May 2021 18:48:01 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: Use list iterators and helpers
Message-ID: <YJApQTRSEWUuR4qd@kroah.com>
References: <20210428173301.149619-1-linux@roeck-us.net>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210428173301.149619-1-linux@roeck-us.net>

On Wed, Apr 28, 2021 at 10:33:01AM -0700, Guenter Roeck wrote:  
> diff --git a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
> index 85663182b388..9cb2c7a112d2 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
> @@ -124,11 +124,8 @@ void kfree_all_stainfo(struct sta_priv *pstapriv)
>  	spin_lock_bh(&pstapriv->sta_hash_lock);
>  
>  	phead = get_list_head(&pstapriv->free_sta_queue);
> -	plist = get_next(phead);
> -
> -	while (phead != plist) {
> -		psta = container_of(plist, struct sta_info, list);
> -		plist = get_next(plist);
> +	list_for_each(plist, phead) {
> +		psta = list_entry(plist, struct sta_info, list);
>  	}
>  
>  	spin_unlock_bh(&pstapriv->sta_hash_lock);


This chunk didn't apply to my tree as someone else cleaned something in
this function.

But that doesn't even really matter as this function does nothing at
all!

So I'll just leave it alone, and apply the patch without this chunk.

crazy code...

greg k-h
