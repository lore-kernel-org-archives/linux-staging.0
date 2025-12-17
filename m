Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916CB34F48A;
	Wed, 17 Dec 2025 13:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765976813; cv=none; b=enZyW0tcrpjLBz6WfyyFvdBqogm3YAdCsAbmfkYR3AqNPO2IXGeM+Yb32xAsvc3FOUiu23DANv945y6mYdTJZobD4QHj6VhasvQsRjN9GfJvfDVjgn6mSQdSQi3WInZHEOCeEEs1jocl1tYVZjjZ9ipBzj8aB9OGDqPjNkRqGSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765976813; c=relaxed/simple;
	bh=ht2J59IGzgWJO1LaCXQCQogzoVBqHN7wpt/AnyYdKAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M6NugSYklaMdSorsmSc3ZlDcJkdiETso8mzh9egsdha82AuPu+iOGCkVRE+ZppRa4wFD4flQ8GQkiP4dZVW42IFwh/HmCEJfHbUZHASmFXgNFdgtCzIRamHbJOvV+0ag00lekvYj61xoXNUgbNBykECTKc1b68OadK3t6f6L8jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=E/upv7Jn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="E/upv7Jn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD106C4CEF5;
	Wed, 17 Dec 2025 13:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1765976813;
	bh=ht2J59IGzgWJO1LaCXQCQogzoVBqHN7wpt/AnyYdKAU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E/upv7JnzTSInm575w2LOkkPY79HysloUskTHUtXXK1VXUO8DBWqQgiJHn8tc59MS
	 TDHeP3ql8TfNEZCf/vzCjzExU7G6fThjetYFh/Xkhx6DT+veGPw/bZDMXe0xTFxTKg
	 mkCP5Ep14RstcO9oyFkaFRJBMrY5uICkk4lmc+Go=
Date: Wed, 17 Dec 2025 14:06:50 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Adrish Bora <adrishbora@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	straube.linux@gmail.com
Subject: Re: [PATCH] staging: rtl8723bs: fix block comment coding style
Message-ID: <2025121724-unshaved-irritable-4c34@gregkh>
References: <20251214142608.5516-1-adrishbora@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251214142608.5516-1-adrishbora@gmail.com>

On Sun, Dec 14, 2025 at 02:26:08PM +0000, Adrish Bora wrote:
> Fix the block comment style in os_intfs.c to match the kernel coding style.
> The comment was previously lacking the required asterisks on subsequent lines.
> 
> Signed-off-by: Adrish Bora <adrishbora@gmail.com>
> ---
>  drivers/staging/rtl8723bs/os_dep/os_intfs.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> index 6ca6dc548805..ca841cc61076 100644
> --- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> +++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> @@ -934,14 +934,16 @@ static int netdev_close(struct net_device *pnetdev)
>  	padapter->net_closed = true;
>  	padapter->netif_up = false;
>  
> -/*if (!padapter->hw_init_completed)
> -	{
> -
> -		padapter->bDriverStopped = true;
> -
> -		rtw_dev_unload(padapter);
> -	}
> -	else*/
> +/*
> + * if (!padapter->hw_init_completed)
> + *	{
> + *
> + *		padapter->bDriverStopped = true;
> + *
> + *		rtw_dev_unload(padapter);
> + *	}
> + *	else
> + */

If this code has been commented out for a long time, please just delete
it, no need to make it "pretty" with a different style of comment block.

thanks,

greg k-h
