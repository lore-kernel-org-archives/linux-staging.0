Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6BB3EDAC7;
	Tue,  7 Jul 2026 10:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783421924; cv=none; b=DoUfsfwQ3pId3nKiIIDtlJfZ2TZAXof2F8wE+zwIuMqIZe/DUDqSwWvRvn4QbSBkqD+w0XbdHd2f20NFh5U8UucNQdOyqzc4CzWKzQ0hGJ3OrjxzB5K9fv+87GnInCxv0OxB2yq06sdYcGFfpScVOwNYa8BPUuYCZp6JZRLzUjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783421924; c=relaxed/simple;
	bh=gZcjIuUOsHE25id+FeEZoAagQX8zCDMRiJV1cMrSDOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sts8Vu6M7R96YMHeinX4B+X1IwyH4kWJhgMKbgp9h5hxr2mFYnFZnRh0NaQbp9taWB27ewIOx+yiG4nTunEqjivndgvTQp86dPZS8XfcXhlEIoAEPXFyzZBgJAiNDOvPiuBwMWdeg+JtuOZ9grpvCxJfjaiLcV2i1uiYmgX5MIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=POoQGFj1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="POoQGFj1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 540321F000E9;
	Tue,  7 Jul 2026 10:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783421922;
	bh=0rQKsO7YG0nsfjBS/liRUu+wHkfVZ9DMEjLk5ksOXAg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=POoQGFj1lCpzToT1Q7Bkx2MZyPln6tb+LpS2i+hpa/X/LImMs2YfdSWMasBuJ18oP
	 fYGfpnOZlszbJVN/dcODWYFvuyMwQ+aGzorK8nRSsxuX6BDEfVha49q6dVbQnpsZEd
	 dichSnArV9wOp9Ag/9onP97Wh3DMsA57RrM3lNsg=
Date: Tue, 7 Jul 2026 12:58:40 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Parsal Baral <parsalbaral@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: Use PTR_ALIGN for rsp_buf alignment
Message-ID: <2026070733-entryway-cost-91a0@gregkh>
References: <20260603182602.658589-1-parsalbaral@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603182602.658589-1-parsalbaral@gmail.com>

On Thu, Jun 04, 2026 at 12:11:02AM +0545, Parsal Baral wrote:
> Replace manual pointer alignment calculation with the standard PTR_ALIGN
> macro for rsp_buf in rtw_init_cmd_priv()
> 
> Follows modernization of cmd_buf alignment in commit 69dc48dc5506
> ("staging: rtl8723bs: use PTR_ALIGN for buffer alignment")
> 
> Compile-tested only
> 
> Signed-off-by: Parsal Baral <parsalbaral@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_cmd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> index c1185c25e..38ce3156c 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> @@ -184,7 +184,7 @@ int rtw_init_cmd_priv(struct	cmd_priv *pcmdpriv)
>  		return -ENOMEM;
>  	}
>  
> -	pcmdpriv->rsp_buf = pcmdpriv->rsp_allocated_buf + 4 - ((SIZE_PTR)(pcmdpriv->rsp_allocated_buf) & 3);
> +	pcmdpriv->rsp_buf = PTR_ALIGN(pcmdpriv->rsp_allocated_buf, 4);
>  
>  	pcmdpriv->cmd_issued_cnt = 0;
>  	pcmdpriv->cmd_done_cnt = 0;
> -- 
> 2.54.0
> 
> 

Does not apply to the latest tree :(
