Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46645280018;
	Tue, 27 Jan 2026 14:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769523328; cv=none; b=GQLc1mJ/IqkiYVm4UEjSk/S8U8XIYVx4OfJXIX8gdTil0Zn9tLYgGnVGErBSmqTIUdEGK+NzoevDCCj1fvzHpwBcd9cvfQFIq9hKCuz07tutmzhAiQPI/QB8hGmm1i9Etq6I9wXGqTbqeU87GUiuNueTpkA7ATU6MNL84yBVjAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769523328; c=relaxed/simple;
	bh=F1GmToa6fsuEpX4hKcXfISZkGYQaM+u5fGe9r5NfHH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UNeXNXPFC9YxHscEghzGv6tB8m+2zVreu6/iGSJbuoGKvA1E0GaH9uddjK5mo/ilowqYvHLJHnmeYtD8whSu/VQs7bCVV5zllQH2XKl/b+RXjzW7DwZTjzaaox9LI+6Fb4VCpraqdMTjW5s++wwzYSpJtCpc6gk4Kh0MjPJz5nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=xuvkY+++; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xuvkY+++"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BC2FC116C6;
	Tue, 27 Jan 2026 14:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769523327;
	bh=F1GmToa6fsuEpX4hKcXfISZkGYQaM+u5fGe9r5NfHH4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xuvkY+++2f6Ks5vvG0+OX4uvLsiJbOjjDXMk06dNWuHXI9xcAiV9nclHK5FeiAnJ+
	 OrA7Tn9/3+KV9jFvsS9xnOYUCA1tiaPulPPHPvNV7ORY003FoHxAwX9HGhcD6ahvru
	 ECCwlBNlo3W/tPEkzQMexLveHAkQ2C1MMOPX98Vc=
Date: Tue, 27 Jan 2026 15:15:24 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Minu Jin <s9430939@naver.com>
Cc: bqn9090@gmail.com, dan.carpenter@linaro.org,
	abrahamadekunle50@gmail.com, straube.linux@gmail.com,
	bryant.boatright@proton.me, davidzalman.101@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] staging: rtl8723bs: fix potential race in
 expire_timeout_chk
Message-ID: <2026012704-lard-untimed-c88c@gregkh>
References: <20260127131035.731607-1-s9430939@naver.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127131035.731607-1-s9430939@naver.com>

On Tue, Jan 27, 2026 at 10:10:35PM +0900, Minu Jin wrote:
> The expire_timeout_chk function currently do lock and unlock inside the
> loop before calling rtw_free_stainfo().
> 
> This can be risky as the list might be changed
> when the lock is briefly released.
> 
> To fix this, move expired sta_info entries into a local free_list while
> holding the lock, and then perform the actual freeing after the lock is
> released.
> 
> Signed-off-by: Minu Jin <s9430939@naver.com>
> ---
> Hi,
> 
> I noticed this lock-unlock pattern in expire_timeout_chk() while
> studying the code and it looked like a potential race condition.
> 
> I've refactored the code to use a local list so we can handle the
> cleanup after releasing the lock. What do you think about this approach?
> 
> Any feedback is appreciated.
> 
>  drivers/staging/rtl8723bs/core/rtw_ap.c | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
> index 67197c7d4a4d..5947f6363ab0 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_ap.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
> @@ -179,6 +179,9 @@ void expire_timeout_chk(struct adapter *padapter)
>  	u8 chk_alive_num = 0;
>  	char chk_alive_list[NUM_STA];
>  	int i;
> +	struct list_head free_list;
> +
> +	INIT_LIST_HEAD(&free_list);
>  
>  	spin_lock_bh(&pstapriv->auth_list_lock);
>  
> @@ -190,19 +193,21 @@ void expire_timeout_chk(struct adapter *padapter)
>  		if (psta->expire_to > 0) {
>  			psta->expire_to--;
>  			if (psta->expire_to == 0) {
> -				list_del_init(&psta->auth_list);
> +				list_move(&psta->auth_list, &free_list);
>  				pstapriv->auth_list_cnt--;
> -
> -				spin_unlock_bh(&pstapriv->auth_list_lock);
> -
> -				rtw_free_stainfo(padapter, psta);
> -
> -				spin_lock_bh(&pstapriv->auth_list_lock);
>  			}
>  		}
>  	}
>  
>  	spin_unlock_bh(&pstapriv->auth_list_lock);
> +
> +	/* free free_list */
> +	list_for_each_safe(plist, tmp, &free_list) {
> +		psta = list_entry(plist, struct sta_info, auth_list);
> +		list_del_init(&psta->auth_list);
> +		rtw_free_stainfo(padapter, psta);
> +	}

Looks sane, can you test it to verify it works properly?

thanks,

greg k-h
