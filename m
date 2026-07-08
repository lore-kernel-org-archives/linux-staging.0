Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425FF2DFF04;
	Wed,  8 Jul 2026 14:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783520945; cv=none; b=rQ499XPSOBrZZvMgGyj2pPD5a60r59mP+doOD50fO1nouFsWVcNpVz9SGNRAM0AbTsr34r0qkIs0+Yf/pqq5fxe0CH6Cl4GYFKurxqUHDxwrtp7oKHyUDC4sUYyEkVWGHD4gBHLlW+f8OxvzMDb6Z8rwrWaKVF9EPCQriGGf6GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783520945; c=relaxed/simple;
	bh=Ba7fGx37y+41FUpG/+M0dC2BQ1VHDaBopLGd9t0KW2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WbXQ4JtliO7OuFwDV10buvgnXLOvGvKmpuRI+b3KV18NqtGCe7XfsaPeBPSOudN7881/3Wen+BGijB+scAfUkXOCKD2x+dcJ6BXCmmvjBqGKP1yOMoCPxXHYEf6ZboAlci7GOlgqMK8vqOd3gX4HRQAVnjZul9M/fH5mFYVZs1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ju2RljVz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ju2RljVz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A1021F000E9;
	Wed,  8 Jul 2026 14:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783520943;
	bh=Dfue3hPam5eaqT8ARzmKieExxAMoWNas1J2nSrvvyKU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ju2RljVzl3XFWCa35Dw3BmAmp+lCTWKLF/tA97+GEQWtCYdF9KMlpC+Ws36NH9fTf
	 U6q/Wvvq8wSGu4n1UVCNwGp2Ij8zdCtlq9Y8DFxvlS7dpMIjOKmXz6ul6RTmqHJ1E2
	 k5t/q9f4TqSm+r88WIg4hDAkjESCr0oyoH4i90Sw=
Date: Wed, 8 Jul 2026 16:27:46 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alon Shamay <pastraman1@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: rtl8723bs: rename bLinkInfoDump to snake_case
Message-ID: <2026070801-marital-ladies-d07b@gregkh>
References: <2026070531-doozy-sash-c547@gregkh>
 <20260708141024.5814-1-pastraman1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708141024.5814-1-pastraman1@gmail.com>

On Wed, Jul 08, 2026 at 05:10:24PM +0300, Alon Shamay wrote:
> Rename bLinkInfoDump to link_info_dump to follow the kernel coding
> style, which discourages CamelCase and Hungarian notation. Issue
> reported by checkpatch.pl.
> 
> Signed-off-by: Alon Shamay <pastraman1@gmail.com>
> ---
> v3: use real name in From/Signed-off-by
> v2: drop unintended whitespace/reformatting introduced by editor; rename only
> 
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 2 +-
>  drivers/staging/rtl8723bs/include/drv_types.h | 2 +-
>  drivers/staging/rtl8723bs/os_dep/os_intfs.c   | 4 ++--
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> index a86d6f97cf02..607771a0af21 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> @@ -4780,7 +4780,7 @@ void _linked_info_dump(struct adapter *padapter)
>  	int UndecoratedSmoothedPWDB;
>  	struct dvobj_priv *pdvobj = adapter_to_dvobj(padapter);
>  
> -	if (padapter->bLinkInfoDump) {
> +	if (padapter->link_info_dump) {
>  		if ((pmlmeinfo->state&0x03) == WIFI_FW_STATION_STATE)
>  			rtw_hal_get_def_var(padapter,
>  					    HAL_DEF_UNDERCORATEDSMOOTHEDPWDB,
> diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
> index 552d0c5fa47f..7b61be9dfea0 100644
> --- a/drivers/staging/rtl8723bs/include/drv_types.h
> +++ b/drivers/staging/rtl8723bs/include/drv_types.h
> @@ -344,7 +344,7 @@ struct adapter {
>  
>  	u8 bFWReady;
>  	u8 bBTFWReady;
> -	u8 bLinkInfoDump;
> +	u8 link_info_dump;

as you are only ever setting this to 0, why is it needed at all?  It
will never change value so the logic can be removed, right?  If not, ok,
but then it should be a 'bool', right?

thanks,

greg k-h
