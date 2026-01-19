Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2430332ED0;
	Mon, 19 Jan 2026 08:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768810852; cv=none; b=FnQJGvV7i4QBrVbzaQI6rldVmcXFe52LRGG5AveMUCPSlNLsgCQGzciefYkkvJHaiaYcScHKi4mUqOveEY0iLFXEfdcOWRZ9XofDmD9hBKtiuE+6iwkLTomcjRH7pbrwxyCGj9wyfCI9rQu9cIJ/LizHl+fMVecxmpsXz5hy3N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768810852; c=relaxed/simple;
	bh=5LtIA7SCuIq+sGOBV9+K8MB8k5GGHCsNSuT2vA4AYQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UTHIn26SzrHfDmfpXa8l5ci1SqGtixfzek58idPN5KLqYaoqFckk5v3dLUVFIGq8f6z04qcGOsuLOPUybiESpMPK/E6IWZVzrmOxX/zOhace/Il8HtgfJnS7HTng91RJikVQTGoM38kiu/3o1lIpxgRZaoo0lZ+tEjtqA5ttXTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZOixF/V2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZOixF/V2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E54C8C116C6;
	Mon, 19 Jan 2026 08:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768810852;
	bh=5LtIA7SCuIq+sGOBV9+K8MB8k5GGHCsNSuT2vA4AYQI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZOixF/V28n10M16PXy6cpxDnI7TzhI0ShOb6v+lkmy8L8V2bLbra3mIOtua7Ob5pM
	 Hw4CPQIMn7sLfbqd5TiTxz8qnZ0xaSqvlgX7mDEz3T8K2KC73hKgFxrAH4FLH29zuv
	 Xc9PhSNZlSM+fCCEELPjuP5Qm+0DWfDAJoV0kpdI=
Date: Mon, 19 Jan 2026 09:20:49 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: 2023060904@ycu.edu.cn
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	guagua210311@qq.com
Subject: Re: [PATCH] [rtl8723bs] Remove unnecessary atomic operations for
 continual_io_error
Message-ID: <2026011937-snugness-movie-9e32@gregkh>
References: <30BAC49CD5860042+20260119080606.189297-1-2023060904@ycu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30BAC49CD5860042+20260119080606.189297-1-2023060904@ycu.edu.cn>

On Mon, Jan 19, 2026 at 04:06:06PM +0800, 2023060904@ycu.edu.cn wrote:
> From: Changjun Zheng <guagua210311@qq.com>
> 
> continual_io_error is only accessed in SDIO IO single execution flow,
> no multi-thread race condition exists, so atomic operations are redundant.
> Change atomic_t to s32 and replace atomic_inc_return/atomic_set with normal ops.
> 
> Signed-off-by: Changjun Zheng <guagua210311@qq.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_io.c       | 16 ++++++++++++----
>  drivers/staging/rtl8723bs/include/drv_types.h |  2 +-
>  2 files changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_io.c b/drivers/staging/rtl8723bs/core/rtw_io.c
> index fe9f94001eed..95d42025807e 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_io.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_io.c
> @@ -135,11 +135,15 @@ int rtw_init_io_priv(struct adapter *padapter, void (*set_intf_ops)(struct adapt
>  /*
>   * Increase and check if the continual_io_error of this @param dvobjprive is larger than MAX_CONTINUAL_IO_ERR
>   * @return true:
> - * @return false:
> + * @return false:
> +
> + * Note: Original implementation used atomic_inc_return for atomic increment.
> + * Reason for change: continual_io_error is only accessed in SDIO IO single execution flow,
> + * no race condition, so normal increment is safe (remove redundant atomic operation).

This is not needed, the git history should show this.

>   */
>  int rtw_inc_and_chk_continual_io_error(struct dvobj_priv *dvobj)
>  {
> -	int error_count = atomic_inc_return(&dvobj->continual_io_error);
> +	s32 error_count = ++dvobj->continual_io_error;

No, please just put this in the caller, like was discussed already on
the list.  Please read the archives for details.

thanks,

greg k-h
