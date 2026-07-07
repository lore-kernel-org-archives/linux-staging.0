Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD0A3F1AD7;
	Tue,  7 Jul 2026 11:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783423197; cv=none; b=iNXESncpio7vQ4q+Zdg9KTA60covIDFbRHbvbs03WQSJg7kD/EaVLMuTmMOFR9mv68sFAtIvJugAepy6dxiz46KjMjkXq5HVmfUHNBCJBbeJLlE+MycqxzngjvlQFEhpWbdO9lWvCwer+k3i16AyIhjn8XHQacY4h1Xv0nqXSrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783423197; c=relaxed/simple;
	bh=gFRd/BVcfDMpPLjGer56q8LsuprxKYXWmkQBKgNbM7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HSMyaMG0KnvAVXHdK7Sjgia3kwn622TEuGg5fy93qZ6mtdXRKxAwA/oL5PH4CZbF5iEAKH0PVzbMrNBbgXPghMrmBXJJgKF9VtXHmO9jJ1k4828YR8nTC+6WM+EZFMJmrIhqjeXmlIsM0muRxGmbfOYSlNfFL7vjgQF0GCqn2PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Tum4KKbV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Tum4KKbV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 478391F00A3A;
	Tue,  7 Jul 2026 11:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783423195;
	bh=eobIkxVPBRDg0OEhqgcBqY7I9JDA4WWKtQ4KE5Nesi8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Tum4KKbVPoWGXhbUSt0j+LbE2zltCTxSLWqF3rXYuXDTyVtl8qdyZ5Fu4XHZKGGIE
	 lF3FGDD7/zlnjjaHUseWXQ1FT90zw7o/p5U/aFDPwE0eyg41XStqqLyuW5Crwi1Xp0
	 yCSnHZYrJVOVveMAzzGwfhxAcqrbVsZ9wlQUhXjM=
Date: Tue, 7 Jul 2026 13:19:53 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Brock Haftner <brockhaftner@gmail.com>
Cc: outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix spelling mistake in rtw_recv.c
Message-ID: <2026070743-clapped-agility-7ec6@gregkh>
References: <20260613155807.18623-1-brockhaftner@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260613155807.18623-1-brockhaftner@gmail.com>

On Sat, Jun 13, 2026 at 08:58:07AM -0700, Brock Haftner wrote:
> Correct the spelling of the word "temporily" to "temporarily"
> in the comments within rtw_recv.c to improve code readability.
> 
> Signed-off-by: Brock Haftner <brockhaftner@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_recv.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
> index 86c5e2c4e7dd..0ffa69c38bca 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_recv.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
> @@ -815,7 +815,7 @@ static signed int ap2sta_data_frame(struct adapter *adapter, union recv_frame *p
>  		}
>  
>  		if (GetFrameSubType(ptr) & BIT(6)) {
> -			/* No data, will not indicate to upper layer, temporily count it here */
> +			/* No data, will not indicate to upper layer, temporarily count it here */
>  			count_rx_stats(adapter, precv_frame, *psta);
>  			ret = RTW_RX_HANDLED;
>  			goto exit;
> @@ -895,7 +895,7 @@ static signed int sta2ap_data_frame(struct adapter *adapter, union recv_frame *p
>  			process_wmmps_data(adapter, precv_frame);
>  
>  		if (GetFrameSubType(ptr) & BIT(6)) {
> -			/* No data, will not indicate to upper layer, temporily count it here */
> +			/* No data, will not indicate to upper layer, temporarily count it here */
>  			count_rx_stats(adapter, precv_frame, *psta);
>  			ret = RTW_RX_HANDLED;
>  			goto exit;
> -- 
> 2.54.0
> 
> 

Soeone already sent this patch before you did, sorry.

thanks,

greg k-h
