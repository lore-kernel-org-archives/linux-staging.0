Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CA7349CC9;
	Fri, 10 Jul 2026 14:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783694875; cv=none; b=shwghIYp+SidModXaq05ovGQC35dzC9u//8UpoSpn7MAKzVpZwNxwUL+WwfnPGS54iZQH7dyB8zQjoddGg1rdH/q6NqqU5wYvRD9OwMDozNqvcJYGogyxzvLW8vQiFlewufse2eTHIIteAtpoq4IZk8/IOqwAcMlbvZiv6MfIco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783694875; c=relaxed/simple;
	bh=4BX/pTXozOWxyyhL0QQDtjshQexIHtHp8O/fyh4zHYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JD67XLbeQzMzNpdiNNfcyurCRKqz7gVdc8C0yiBRAjY2QVkv+OzhVSkU7nXOCb8NX6eQj0I3uE8co416A5gdr0CHC7V3u1TLU69PBSsrCDk+cuRZXv3g7UhUGFPaAzemDJeDxiphFc30cjhoro6d9wDZhZtbNGVyfjdKAzidUvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=HT539ra/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HT539ra/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C79C81F000E9;
	Fri, 10 Jul 2026 14:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783694874;
	bh=b1HMx3lObOQs0pozRbmpAN06eAw6RUzJZXjdgzV2uaQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HT539ra/YgRnM4qFYLlPRgCmS7/qNnwt4haSZwkHaq3c+f6UKo9VxqN4UogU9TOFq
	 c0EQlPED54LwZwG7Fw+5J9itwQsreEbp+e/uwUGUVMGp7Gr2ivbHiJMwFKGF02eXrO
	 prmY9usQyuo26Gexs8BtXFIfaD8PugFluhCQCZm4=
Date: Fri, 10 Jul 2026 16:47:50 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jad Keskes <inasj268@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove unused rtl8192c function
 declarations
Message-ID: <2026071039-jolliness-serve-d179@gregkh>
References: <20260708142227.1774949-1-inasj268@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708142227.1774949-1-inasj268@gmail.com>

On Wed, Jul 08, 2026 at 03:22:27PM +0100, Jad Keskes wrote:
> Remove two function declarations from rtl8192c_recv.h that have no
> implementation and are never called in the rtl8723bs driver:
> 
>   - rtl8192c_translate_rx_signal_stuff()
>   - rtl8192c_query_rx_desc_status()
> 
> These are leftovers from the original Realtek multi-chip codebase
> and relate to the RTL8192C family, not the RTL8723B.
> 
> Signed-off-by: Jad Keskes <inasj268@gmail.com>
> ---
> v2: Added changelog below the --- line
> 
>  drivers/staging/rtl8723bs/include/rtl8192c_recv.h | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/include/rtl8192c_recv.h b/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
> index 1f86654f0403..b63625ab4e45 100644
> --- a/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
> +++ b/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
> @@ -30,7 +30,4 @@ struct phy_stat {
>  /*  Rx smooth factor */
>  #define	Rx_Smooth_Factor (20)
>  
> -void rtl8192c_translate_rx_signal_stuff(union recv_frame *precvframe, struct phy_stat *pphy_status);
> -void rtl8192c_query_rx_desc_status(union recv_frame *precvframe, struct recv_stat *pdesc);
> -
>  #endif
> -- 
> 2.55.0
> 
> 

Someone already sent this before you did, sorry.

greg k-h
