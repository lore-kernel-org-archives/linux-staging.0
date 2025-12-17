Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B37C359FA0;
	Wed, 17 Dec 2025 13:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765976874; cv=none; b=aT7YZ5N9qwm2rBvFCuDp/57sq5K8uCqogKrxjvwNk12D5+/pnCPYbCQ2sT5yk6PQojs9rg6/OZO4z3LuDcQcluIFOxNMZ7WrCvzUf8nj066UDk3wPKyAaAHbGA6YkHXLznQ4MmAadFH8Bo3SZdDJ/eY4em8VM9fld0yFDztzfOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765976874; c=relaxed/simple;
	bh=VUoJ2dRKglj1YYCmVgMWFqitMehp7gZby2Gx6qvRFak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ixIKa3nGHJTnLwZXi+v7AYcBWU8IDX0kQrb33C2TI0bC93svnScVcIYCltazoxb4h9lDZ0yyvrgUKughh+TL3uCe+WiqrPB1jfslKTPKswDUi++s0cQMl/M5t2sgrXfn9MBVt6eTaoSZcEg+/anqEWidBGEDY8xhQIMZxQBWh5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=H4kuBvGM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="H4kuBvGM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA44CC4CEF5;
	Wed, 17 Dec 2025 13:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1765976874;
	bh=VUoJ2dRKglj1YYCmVgMWFqitMehp7gZby2Gx6qvRFak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H4kuBvGMT4dfpJPwMaabgIutiryAlUJlsiUtioewYwzxtCcISTi9KgIJWq1aBXu06
	 Wz2EN+yi5Hh4T48Zt9Mu6nCIQEMQDVuep+wnjVT2vpqmmLMWiknic2z7fAUFnipdFL
	 r+3JRPgiP4M/MQNeUJTQQveLZhZY9ZMAGXdh5+HM=
Date: Wed, 17 Dec 2025 14:07:50 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Can Peng <pengcan@kylinos.cn>
Cc: weibu@redadmin.org, karanja99erick@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] staging: rtl8723bs: use LIST_HEAD for
 stack-allocated list in xmit cleanup
Message-ID: <2025121709-cuddly-essential-46e3@gregkh>
References: <20251215031150.49165-1-pengcan@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215031150.49165-1-pengcan@kylinos.cn>

On Mon, Dec 15, 2025 at 11:11:50AM +0800, Can Peng wrote:
> Replace the separate declaration of 'tmplist' and subsequent
> INIT_LIST_HEAD() call with LIST_HEAD(), which declares and
> initializes the list head in a single idiomatic step. This
> improves code clarity and follows common kernel coding patterns
> without changing functionality.
> 
> Signed-off-by: Can Peng <pengcan@kylinos.cn>
> ---
>  drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
> index abb6fdfe7e1f..8c227ddc8e53 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
> +++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
> @@ -548,11 +548,10 @@ void rtl8723bs_free_xmit_priv(struct adapter *padapter)
>  	struct xmit_buf *pxmitbuf;
>  	struct __queue *pqueue = &pxmitpriv->pending_xmitbuf_queue;
>  	struct list_head *plist, *phead;
> -	struct list_head tmplist;
> +	LIST_HEAD(tmplist);
>  
>  
>  	phead = get_list_head(pqueue);
> -	INIT_LIST_HEAD(&tmplist);

Is this really needed?  I see the wish to clean stuff like this up, but
why?  What is causing this to happen?  The code is identical both ways,
right?

This feels like an odd change to me.

thanks,

greg k-h
