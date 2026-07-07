Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7AB81AA8;
	Tue,  7 Jul 2026 11:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783422982; cv=none; b=dw9Z2Xo31gfzBc532zvecA4MTpKswstxOIypFwVhYOWkW2rildoYmTHiAxHuLF1Ay7kqrXgBbVU9lYzMXUTuIvtmETOJ1iYMnuTxvjg6wswWY1vaK6j4fRRJlaZES7nakrRjGUqzm+zd1Bi/IJpA8EfQv6UDiYQO4+rJ/+vNyFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783422982; c=relaxed/simple;
	bh=MOLAevC8PA0LxA6HNJoDnwr8J+1ogIG9tBKSSDLA3kw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IZVZwlPjbkivzDfnAi0EEdg3BhTsk67BwFm1tSWpw+OI35J7DgmRzm7P3p97Wpjh2OKR9C8Cxv23s2lSNKQoX/6Y0CgstqQ4svAJzxyTd2b/4kMMnGBkkNfag/UNYq9AmBgniad1mlnFmt7SC7q8ToGu25uiOxK9ih4TPxKEtqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=D1+QxCJr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="D1+QxCJr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B6F61F000E9;
	Tue,  7 Jul 2026 11:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783422981;
	bh=aF+FhFAAhtKKzcFBlmCtSSLn+STovTtA1qBrxTt/hF4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D1+QxCJrHUUHiCyfBNDf8b2fS+ZPAne8ds/G8eE4RBabaW7a/iuj0fcsBh1gG5B1P
	 5NPjnmTD0rJvRKKtNkaNKvbYGng5l21apNT2kGly+52cMlR9FL/UVFDc/a7deuC+w7
	 jXe2URGaOmXlCfYc8+JNGL2K71sGijJptyUkU1so=
Date: Tue, 7 Jul 2026 13:16:19 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jeeva Anandh <anandhjeeva215@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: simplify NULL pointer checks in
 rtw_recv.h
Message-ID: <2026070713-falcon-drier-1ef3@gregkh>
References: <20260603091411.21482-1-anandhjeeva215@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603091411.21482-1-anandhjeeva215@gmail.com>

On Wed, Jun 03, 2026 at 09:14:11AM +0000, Jeeva Anandh wrote:
> Replace explicit NULL pointer comparisons with idiomatic
> pointer checks to improve readability and follow kernel style.
> 
> Signed-off-by: Jeeva Anandh <anandhjeeva215@gmail.com>
> ---
>  drivers/staging/rtl8723bs/include/rtw_recv.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/include/rtw_recv.h b/drivers/staging/rtl8723bs/include/rtw_recv.h
> index 8e45871f07f0..9c32d480a20a 100644
> --- a/drivers/staging/rtl8723bs/include/rtw_recv.h
> +++ b/drivers/staging/rtl8723bs/include/rtw_recv.h
> @@ -349,7 +349,7 @@ s32  rtw_recv_entry(union recv_frame *precv_frame);
>  static inline u8 *get_rxmem(union recv_frame *precvframe)
>  {
>  	/* always return rx_head... */
> -	if (precvframe == NULL)
> +	if (!precvframe)
>  		return NULL;
>  
>  	return precvframe->u.hdr.rx_head;
> @@ -362,7 +362,7 @@ static inline u8 *recvframe_pull(union recv_frame *precvframe, signed int sz)
>  	/* used for extract sz bytes from rx_data, update rx_data and return the updated rx_data to the caller */
>  
>  
> -	if (precvframe == NULL)
> +	if (!precvframe)
>  		return NULL;
>  
>  
> @@ -387,7 +387,7 @@ static inline u8 *recvframe_put(union recv_frame *precvframe, signed int sz)
>  	/* after putting, rx_tail must be still larger than rx_end. */
>  	unsigned char *prev_rx_tail;
>  
> -	if (precvframe == NULL)
> +	if (!precvframe)
>  		return NULL;
>  
>  	prev_rx_tail = precvframe->u.hdr.rx_tail;
> @@ -414,7 +414,7 @@ static inline u8 *recvframe_pull_tail(union recv_frame *precvframe, signed int s
>  	/* used for extract sz bytes from rx_end, update rx_end and return the updated rx_end to the caller */
>  	/* after pulling, rx_end must be still larger than rx_data. */
>  
> -	if (precvframe == NULL)
> +	if (!precvframe)
>  		return NULL;
>  
>  	precvframe->u.hdr.rx_tail -= sz;
> -- 
> 2.43.0
> 
> 

Does not apply to the tree :(
