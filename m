Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0D734CFAB;
	Tue,  7 Jul 2026 10:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783419427; cv=none; b=tVC5EdsTG/nz/Am0gSjqr+5GcevBaZF5HE5jxQWwDaQBRIRMvRRo3iNq5092aqsdsTObUCYzFj1wdGig7JnJZljAApgNXr3PYF4Ky30npuazeYAlGvZlSGV5E2MYO+aXzTVDE5cKUhzx2NKEKUvo7mgtxb3K8fBARodp7uAH1fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783419427; c=relaxed/simple;
	bh=SWJOGM26TpO603Zx+AJo9V9dcXitndk75vYLAFL9s1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qUuO3+mZzI467aoMBtJmG5kdBnUlOr8jW7jAPeXC4B+dEL6WhS3Yyf0GEtzLfiISp7A1AHrLKuQoMX8jZTYWjrzNvr7tpHmY81xhRSgn6zn/YCflW3KvswNzknES/YEXGdq2aQSnww1L+Xf3Q1/CHXcbEfmy+OJHE/Ogc3x/0dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=RJ+aW3JJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="RJ+aW3JJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FB7D1F00A3A;
	Tue,  7 Jul 2026 10:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783419425;
	bh=chyfgkP+OZSwoNH4t8e7C7o//zbh7iTXdo9CvhGsdLY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RJ+aW3JJIQQvI44ndrKez95KW6GB/6oJUbG9nv1EWoUIk+62ZEW+keD/K2EzLDSzL
	 +N92/tl7yEe0tu5ox2iLJTh5zgGdRNbCVyzYp+Io2N3HHLnWUDNEG+tBypVMsALZDS
	 hm5VfmMiqHYW5ZcYwD6RPTZy18lEt8aR1Zq/meh0=
Date: Tue, 7 Jul 2026 12:17:03 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Anirban Bose <boses156@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: rename camelcase variable bDumpRxPkt
Message-ID: <2026070747-goldfish-xerox-fb37@gregkh>
References: <20260525065935.130736-1-boses156@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525065935.130736-1-boses156@gmail.com>

On Mon, May 25, 2026 at 12:29:35PM +0530, Anirban Bose wrote:
> Rename the local variable 'bDumpRxPkt' to 'dump_rx_pkt' in
> validate_recv_frame() to resolve a checkpatch.pl CamelCase warning.
> 
> Signed-off-by: Anirban Bose <boses156@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_recv.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
> index 86c5e2c4e7dd..808f67b61f77 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_recv.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
> @@ -1447,7 +1447,7 @@ static signed int validate_recv_frame(struct adapter *adapter, union recv_frame
>  	u8 type;
>  	u8 subtype;
>  	signed int retval = _SUCCESS;
> -	u8 bDumpRxPkt;
> +	u8 dump_rx_pkt;
>  
>  	struct rx_pkt_attrib *pattrib = &precv_frame->u.hdr.attrib;
>  
> @@ -1473,7 +1473,7 @@ static signed int validate_recv_frame(struct adapter *adapter, union recv_frame
>  	pattrib->mdata = GetMData(ptr);
>  	pattrib->privacy = GetPrivacy(ptr);
>  	pattrib->order = GetOrder(ptr);
> -	rtw_hal_get_def_var(adapter, HAL_DEF_DBG_DUMP_RXPKT, &(bDumpRxPkt));
> +	rtw_hal_get_def_var(adapter, HAL_DEF_DBG_DUMP_RXPKT, &(dump_rx_pkt));

If this is never used, why is it set at all?

thanks,

greg k-h
