Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597D83B47FB;
	Tue,  4 Aug 2026 12:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785845542; cv=none; b=IOXl15j2AmWLXYJLl1M41fDVCUitiX+7M/L4V9ZAnInt2hNthFti0KzEBTnPqy+D87t8vx8NsI4yLH6sHqF//LazFYnMBwUbtMItsbf9KDE2GE6OvWUNURurbiYp7YzzljBRWRAuo4Sek8YwYuGwU/vtDMvaruBCOGIN9byBeGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785845542; c=relaxed/simple;
	bh=DoWgHOvOMYy11xsBqSnNoj6Q9PlV7xPFR36376Ph1fI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qo19t7aCpYEIzIXZjV+l6jrG5uyiHUY7mzgc8yZ9nwegX4Ogvn3FxMO0RCLtEbSKgFjA0CVCQzxH0npxwZoMJZNnur/NYM5T5JTVslcItFjjsbNAAbV/yhgxsIcBRZCf/Xnjrcx95ymHb1QIp+JW29LDurOc3hVbuV2K0sPgQf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NnHMSt9U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NnHMSt9U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BDDB1F000E9;
	Tue,  4 Aug 2026 12:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785845540;
	bh=0eSn8Z7uDiyYbqI55o9lPDpkn1GD65aw80kC4aFQCW4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NnHMSt9UCCilO38pc1PjVpFygIGsfGRSbVFpr3/dKQjZHV7HFvc0Kp+Sw+ZnrkW88
	 KXjnzqnrqVpxourIQaXkyXAE4Q2pGhDKY/m6tPKEbaac9CCHz/9deNOz4dx30Gonlf
	 T3JFBeVOWy0EqBoeHuJrTyroRTRbM/FxKrmQtiUg=
Date: Tue, 4 Aug 2026 14:10:51 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ashmit Kumar <work.ashmitkumar@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: rtl8723bs: remove redundant ternary
 operators from return
Message-ID: <2026080428-passion-popsicle-9ffd@gregkh>
References: <20260804111443.21758-1-work.ashmitkumar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804111443.21758-1-work.ashmitkumar@gmail.com>

On Tue, Aug 04, 2026 at 11:14:43AM +0000, Ashmit Kumar wrote:
> The Linux kernel coding style specifies that boolean expressions
> do not need a redundant `? true : false` ternary operator.
> Additionally, return is not a function and therefore parentheses
> are not required.
> 
> Signed-off-by: Ashmit Kumar <work.ashmitkumar@gmail.com>
> ---
> Changes in v3:
> - Formatted as a standalone patch (removed 1/3 series numbering).
> 
>  drivers/staging/rtl8723bs/os_dep/osdep_service.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/osdep_service.c b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
> index 4cfdf7c6234..214c1fd9b3e 100644
> --- a/drivers/staging/rtl8723bs/os_dep/osdep_service.c
> +++ b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
> @@ -130,7 +130,7 @@ void rtw_buf_update(u8 **buf, u32 *buf_len, u8 *src, u32 src_len)
>   */
>  inline bool rtw_cbuf_full(struct rtw_cbuf *cbuf)
>  {
> -	return (cbuf->write == cbuf->read - 1) ? true : false;
> +	return cbuf->write == cbuf->read - 1;
>  }

This is only used in one place, right?  Why not convert it to use a
proper ring buffer instead?

>  /**
> @@ -141,7 +141,7 @@ inline bool rtw_cbuf_full(struct rtw_cbuf *cbuf)
>   */
>  inline bool rtw_cbuf_empty(struct rtw_cbuf *cbuf)
>  {
> -	return (cbuf->write == cbuf->read) ? true : false;
> +	return cbuf->write == cbuf->read;
>  }

Same here, only used once, why not use the proper data structure?

and same comments as on other one, slow down, full version info, etc.

thanks,

greg k-h
