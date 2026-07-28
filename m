Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD183E0C4A;
	Tue, 28 Jul 2026 07:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785224164; cv=none; b=J8Bi6QF8J+uVV+AZ79Ku+S12Taoin3MjV7SCARbqRtzoRimqqHFgr47h1ABrQ6YWbIo0lZBs99+WTBOy2iWVs4yRUyDwkb/tNrue8d2oYL3ajinTbridJXzP9CrBsBFqNEAA6GCTr9Ja50Pbm0vY1Hrzd6P+Bdef7Ii9y/6gAz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785224164; c=relaxed/simple;
	bh=S5Zz761jZow+l50f7hztCZ+IFyINxE+w2vEbGYTtyfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iDGjQkN2BJijnIp9Qe1AkNQBrFvmLeFD8xRLcT1N5wWH7m/N/DQy0NcTNGA4HTJYkvqMyrAhQbKbLKLa++OpvcchTkAhP0hpOzosn6KJNiR+O0TDBEBDm9AFlY7bwx+m2mNwy2mPc7Ff2cAohxjdQm+E9Ncm70DPUZkZshkXwpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=rlA2zpLn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rlA2zpLn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D41D81F000E9;
	Tue, 28 Jul 2026 07:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785224162;
	bh=hKy36sdcRu8h+lGJwCcRyW9Fe28mk7rz6q2aGFdKXIo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=rlA2zpLnzaurDMJwIHHY17SiFxmt9es7GJMXNUW+BUWRvaNHKUe9NBPdwFUxujOXo
	 r05RN3rJsZpMZH8oyrqvT4C3H294+A1aMw0UsjQCMxqt/vsxaWZw7e4h5eZBFFBgzs
	 FKtNpgOt24R9Aa3357hCXWZ/VDkwjx0kd3Ms1nBk=
Date: Tue, 28 Jul 2026 09:35:49 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Patryk =?utf-8?Q?Gawro=C5=84ski?= <gawronski1.6@gmail.com>
Cc: Nikolay Kulikov <nikolayof23@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Michael Straube <straube.linux@gmail.com>,
	William Hansen-Baird <william.hansen.baird@gmail.com>,
	Gianmaria Biselli <gianmariabiselli@gmail.com>,
	Eugene Mavick <mavick4022@gmail.com>,
	Artur Stupa <arthur.stupa@gmail.com>, Yan Pan <maxwell2119@163.com>,
	Diksha Kumari <dikshakdevgan@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: Use pointer type in vzalloc()
Message-ID: <2026072814-juggling-savage-cb0d@gregkh>
References: <20260722131827.46975-1-gawronski1.6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260722131827.46975-1-gawronski1.6@gmail.com>

On Wed, Jul 22, 2026 at 03:18:25PM +0200, Patryk Gawroński wrote:
> Update the memory allocation in _rtw_init_sta_priv() to use
> sizeof(*pstapriv->pallocated_stainfo_buf) instead of explicitly
> passing sizeof(struct sta_info).
> 
> This resolves the following checkpatch warning:
> "Prefer vzalloc(sizeof(*pstapriv->pallocated_stainfo_buf)...) over
> vzalloc(sizeof(struct sta_info)...)"
> 
> Using the pointer type is preferred in the kernel as it ensures the
> allocated size remains correct even if the pointer's underlying type
> changes in the future. The allocation was also split across multiple
> lines to comply with column length limits.
> 
> Signed-off-by: Patryk Gawroński <gawronski1.6@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_sta_mgt.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
> index aea660f27959..0758d0540f4b 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
> @@ -54,7 +54,8 @@ u32 _rtw_init_sta_priv(struct	sta_priv *pstapriv)
>  	struct sta_info *psta;
>  	s32 i;
>  
> -	pstapriv->pallocated_stainfo_buf = vzalloc(sizeof(struct sta_info) * NUM_STA + 4);
> +	pstapriv->pallocated_stainfo_buf =
> +		vzalloc(sizeof(*pstapriv->pallocated_stainfo_buf) * NUM_STA + 4);

You just broke the driver as the math here is now not the same.

Hint, look at what pallocated_stainfo_buf really is.  It's not a pointer
to a struct at all, right?

thanks,

greg k-h
