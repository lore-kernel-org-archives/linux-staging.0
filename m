Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3B53F8247;
	Tue,  7 Jul 2026 11:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783423978; cv=none; b=fp0eGIb+5N6AXYG8Z6/z/knjoi2T/ZgeUMBu9tffDm3GIzxjEJpuwit06YWC4jmVqxNxW5Iz4BQi11ujPcO4Z9vb/KTp5gAXuKw3g69Pvn+2OYhbAl5e/vjFeQb2yPdOEJi5nFZ9v90HuGgnI7g2mf9/jedTmPVLrZCnciq7eUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783423978; c=relaxed/simple;
	bh=yJANDuxykUY7l+KkmJjS2f/01t5XMGGpyKANi44Pyic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h4TwxhOW0TsR2pyo9NDzVSJgzzq5DPqkWrZZUavRKG8PZzxqo1jigr/iRQbI5RcG0zzji+bWyUabcsBdkLJUK5Cdr8UI6DMiGC98nOjyqVDRnmNydwpsbyAAlXu/Rh5TOqv6ChQIkX1K/9lh7CboI41fgNGx0ZOm220FyKf74AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=nEU5x7BO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="nEU5x7BO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 116111F000E9;
	Tue,  7 Jul 2026 11:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783423976;
	bh=37V9Ati7rcu15vdAbwK/bSGbCUvJFLkSilTz4uzv9Xk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nEU5x7BOcMtfPR2I48JTHnLw1Ma8PoCF5dWUAZj8Yj5BWyCGcUMKO0+lMIsWxOwOo
	 TbFD9p3I8nBq8PO6v0EyiDVj5cEV0/tkUWaA459WqU5ForlK+VHV4SrRNWmn6VAivR
	 lqIK5miTgL2xwExdxmCz5sNzg7CsGe0a+yw+3sYs=
Date: Tue, 7 Jul 2026 13:32:50 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ruziev Miraly <miraly.dev@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove unnecessary braces in
 rtw_wlan_util.c
Message-ID: <2026070742-gravity-ritalin-d1e8@gregkh>
References: <20260701034552.5668-1-miraly.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701034552.5668-1-miraly.dev@gmail.com>

On Wed, Jul 01, 2026 at 08:45:52AM +0500, Ruziev Miraly wrote:
> Remove unnecessary braces for a single statement block to comply
> with the Linux kernel coding style.
> 
> Signed-off-by: Ruziev Miraly <miraly.dev@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> index 1d37c2d5b..cc05decd4 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> @@ -256,9 +256,8 @@ inline void rtw_set_oper_ch(struct adapter *adapter, u8 ch)
>  {
>  	struct dvobj_priv *dvobj = adapter_to_dvobj(adapter);
>  
> -	if (dvobj->oper_channel != ch) {
> +	if (dvobj->oper_channel != ch)
>  		dvobj->on_oper_ch_time = jiffies;
> -	}
>  
>  	dvobj->oper_channel = ch;
>  }
> -- 
> 2.54.0
> 

Someone already submitted this patch before you did, sorry.

greg k-h
