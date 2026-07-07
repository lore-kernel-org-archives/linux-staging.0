Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476163EFFD0;
	Tue,  7 Jul 2026 11:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783422029; cv=none; b=pXY6qQSeljFUnCB65aRnsobDhKuvyurdr40QcT5QAoW0vSH/ILWtgrq04/ntdQNpnFICtM9j7TXiIPZT7ysomyY8HgXv55ZmftwfstVNrHscIsWhdMvM9VEBrNOOP9XSldGKcqUn/kiIK1P1fzsmQEC2Carecl2LdPO4KblLXPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783422029; c=relaxed/simple;
	bh=OZoMzFnIT9FJBxV0TOjoiRWNcbZzc1qi3Sat7RKmaKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CbVUU14csrDkCUT7TDUUfS2RHpleUc7pUgDijc2EaOx4A8JcO+MC/JlIVQY0xekzWvAyek3B4kV1JV0PejdYP0I9GGwhDaIjtlLRSOm0Aa2pSq5xVq/LL2zol15fMiPy8c52JunDLDXcCDtgGd/QP+fvtxvQ45mSdukv1JF8I3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=CXOWyxSy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="CXOWyxSy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F3A21F000E9;
	Tue,  7 Jul 2026 11:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783422027;
	bh=a7y7eDP06+gMpepPjSOcI4nUA3d4/kwvHDRkD8X+PB8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CXOWyxSyFfd+30xd8Svud1D57zblZGj0t/KaBe6XHIYQbqZIntlaHYbCyS3Vgo/W3
	 ZFsbTrJZVFUHZI7xGlQaATs6S3uH+8ioCnQy1DJXzUZHulTlMhPO2+8+pHYhxojjuf
	 t9NXxaB4e1YMNIdpsPnAmIfHsJV5RGyYOAydCrfw=
Date: Tue, 7 Jul 2026 13:00:25 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Eugene Mavick <mavick4022@gmail.com>
Cc: hansg@kernel.org, straube.linux@gmail.com, nikolayof23@gmail.com,
	khomenkov@mailbox.org, william.hansen.baird@gmail.com,
	maxwell2119@163.com, dikshakdevgan@gmail.com,
	arthur.stupa@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: rtl8723bs: fix line length warning
Message-ID: <2026070709-janitor-shuffling-c263@gregkh>
References: <20260601093757.612130-1-mavick4022@gmail.com>
 <20260601093757.612130-2-mavick4022@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601093757.612130-2-mavick4022@gmail.com>

On Mon, Jun 01, 2026 at 05:37:56PM +0800, Eugene Mavick wrote:
> Split comment exceeding 100 columns to improve readability and clear
> checkpatch warning
> 
> Signed-off-by: Eugene Mavick <mavick4022@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_sta_mgt.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
> index a1b7fe843979..02f8564d32a7 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
> @@ -222,7 +222,8 @@ struct	sta_info *rtw_alloc_stainfo(struct	sta_priv *pstapriv, u8 *hwaddr)
>  
>  	/*  Commented by Albert 2009/08/13 */
>  	/*  For the SMC router, the sequence number of first packet of WPS handshake will be 0. */
> -	/*  In this case, this packet will be dropped by recv_decache function if we use the 0x00 as the default value for tid_rxseq variable. */
> +	/*  This packet will be dropped by recv_decache function */
> +	/*  if we use the 0x00 as the default value for tid_rxseq variable. */
>  	/*  So, we initialize the tid_rxseq variable as the 0xffff. */

Why not just turn this into a proper multi-line comment block?

thanks,

greg k-h
