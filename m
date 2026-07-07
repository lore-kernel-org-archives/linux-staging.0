Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1473F871A;
	Tue,  7 Jul 2026 11:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783423993; cv=none; b=a1PRK9kQMO8nKNIxV06erd+5B5TdQBXpLL9QmpSRyJx9m7ZGOSjl3+KKJboRMyPS4YNWdAFzRT5wsEEajEydJm97WYbcaouJfw4RQdjlH49sah1i1WHxha1yHjRldKeqCnKB/PUSi7VNpxgLWy65/rV5CfABftVDWJevpx0yEao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783423993; c=relaxed/simple;
	bh=1wJ1d6sCfuhE99/Ky5MyfHqUNC2J7ExCyqmicDyZ3i0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m8EIytpdgF6axI/ywOiynevQewSZeJQWv58IS/Mh5j03dm1NsartGqY9K4qh6Ooivx1f9U2yixwIqkz2TkLSSFCaI9mufJps7hETTw+qkk5fGLG2De0UEOgxlpopcYG75sEljsynPIbRAAapglxEgO4gu8WTu/5AliP6IEeZF4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=OxXxkNMX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OxXxkNMX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ECAF1F00A3A;
	Tue,  7 Jul 2026 11:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783423992;
	bh=SPvTVAQtH6bSS1/Ecgakr69fI0fXT2ZQbY1s+CnKv2A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OxXxkNMXLvmw/nxzXs4Bd+hTDjGns8y7JKpsucrPtumpyXQe2ETECX95xmiITYxgx
	 prYVNCY1/sz4VZGLDDf8r75vub276GFnW9bjCt8m1d/u44ngwCizVc2egkhAhGuMmX
	 dmui7bF+f8oVRptmF4xf+45NyDfGG6b2GbSxOmqE=
Date: Tue, 7 Jul 2026 13:33:09 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Aditya Tipre <tipreaditya@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove unnecessary braces
Message-ID: <2026070700-undiluted-childlike-8234@gregkh>
References: <20260701145722.122847-1-tipreaditya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701145722.122847-1-tipreaditya@gmail.com>

On Wed, Jul 01, 2026 at 10:57:22AM -0400, Aditya Tipre wrote:
> Remove unnecessary braces around a single statement
> if block to address a checkpatch warning.
> 
> Signed-off-by: Aditya Tipre <tipreaditya@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> index 1d37c2d5b10d..cc05decd4c76 100644
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
