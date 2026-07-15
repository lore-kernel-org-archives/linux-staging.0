Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132F62E88A4;
	Wed, 15 Jul 2026 13:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784121349; cv=none; b=Yb/efGOgmwjhkl7NBZ3L5SuHYMTVWSB70T9nq6P5WYHusamJduzNM/ae8PnGikc5hLTD0SkRf75tgWxIBwHu20DnHPHKoOWveHytXCx/xaAcTy7KLWjlnQWBoBjPumUjUutawAvChaotA9lNT/N0S+Vn4LA4IeiuBfHOaVtNiGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784121349; c=relaxed/simple;
	bh=2nMWutwoUH3Hi3uUKtRrY5mASmz1Frh26CTcOLhnEmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=icC8sroRHXS4xjitNG/eFjKpyVnwi2CJwWxcEDFRG5tWIrGYheXgNTRWDcKBErg0qAfy0kT2HjCFJqQmxpQDQhTvjMMjneh21MmfjKGe0ePmHSRsJ0VGyouh60uqzw8/tPylFAZKgyKbdinAFT3fYhnodZGQZpqJ7UNLQ74tiO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZNRjio4R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZNRjio4R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30A0D1F00A3A;
	Wed, 15 Jul 2026 13:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784121347;
	bh=zJC1nWXc8OMa51JDqRv7BniphI26S9USk8gGkxdvyt8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZNRjio4RzHsvllzD+DvRd8YMpmw5R3simVi+7KVZSjtyaJVeneaWFIOq8qWR8U8fk
	 BTLcXS+MSY3QBNf4SJzj4/rmqOG9+pBbpFPZV6nG+Q2fB/zAI40wgtXdGuP38nOpu2
	 sU8yNLwtRMwbFfsmdmCtSkLBnURjx6d8RGnNPwuE=
Date: Wed, 15 Jul 2026 15:15:41 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Arsenii Pashchenko <ulijg308@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/61] staging: rtl8723bs: remove redundant
 rtw_ap_set_group_key wrapper
Message-ID: <2026071547-tightness-grueling-4dd0@gregkh>
References: <20260715124829.90290-1-ulijg308@gmail.com>
 <20260715124829.90290-2-ulijg308@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715124829.90290-2-ulijg308@gmail.com>

On Wed, Jul 15, 2026 at 07:47:29PM +0700, Arsenii Pashchenko wrote:
> Eliminate the redundant rtw_ap_set_group_key() wrapper function by
> calling rtw_ap_set_key() directly with the set_tx parameter set to 1.
> This reduces boilerplate code and cleans up the driver interface.
> 
> Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_ap.c           | 7 +------
>  drivers/staging/rtl8723bs/include/rtw_ap.h        | 2 +-
>  drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 8 ++++++--
>  3 files changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
> index 065850a9e..a6640cd7a 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_ap.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
> @@ -1195,7 +1195,7 @@ u8 rtw_ap_set_pairwise_key(struct adapter *padapter, struct sta_info *psta)
>  	return res;
>  }
>  
> -static int rtw_ap_set_key(struct adapter *padapter,
> +int rtw_ap_set_key(struct adapter *padapter,
>  			  u8 *key,
>  			  u8 alg,
>  			  int keyid,
> @@ -1258,11 +1258,6 @@ static int rtw_ap_set_key(struct adapter *padapter,
>  	return res;
>  }
>  
> -int rtw_ap_set_group_key(struct adapter *padapter, u8 *key, u8 alg, int keyid)
> -{
> -	return rtw_ap_set_key(padapter, key, alg, keyid, 1);
> -}
> -
>  int rtw_ap_set_wep_key(struct adapter *padapter,
>  		       u8 *key,
>  		       u8 keylen,
> diff --git a/drivers/staging/rtl8723bs/include/rtw_ap.h b/drivers/staging/rtl8723bs/include/rtw_ap.h
> index 83e835eb6..cdd9f291f 100644
> --- a/drivers/staging/rtl8723bs/include/rtw_ap.h
> +++ b/drivers/staging/rtl8723bs/include/rtw_ap.h
> @@ -22,7 +22,7 @@ int rtw_acl_add_sta(struct adapter *padapter, u8 *addr);
>  void rtw_acl_remove_sta(struct adapter *padapter, u8 *addr);
>  
>  u8 rtw_ap_set_pairwise_key(struct adapter *padapter, struct sta_info *psta);
> -int rtw_ap_set_group_key(struct adapter *padapter, u8 *key, u8 alg, int keyid);
> +int rtw_ap_set_key(struct adapter *padapter, u8 *key, u8 alg, int keyid, u8 set_tx);
>  int rtw_ap_set_wep_key(struct adapter *padapter, u8 *key, u8 keylen, int keyid, u8 set_tx);
>  
>  void associated_clients_update(struct adapter *padapter, u8 updated);
> diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> index 1484336d7..ce76a8586 100644
> --- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> +++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> @@ -604,7 +604,9 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
>  
>  			psecuritypriv->dot11PrivacyAlgrthm = psecuritypriv->dot118021XGrpPrivacy;/*  */
>  
> -			rtw_ap_set_group_key(padapter, param->u.crypt.key, psecuritypriv->dot118021XGrpPrivacy, param->u.crypt.idx);
> +			rtw_ap_set_key(padapter, param->u.crypt.key,
> +						   psecuritypriv->dot118021XGrpPrivacy,
> +						   param->u.crypt.idx, 1);

Ok, first patch of the series, this isn't correct.

I'm all for cleanups, but remember, drivers/staging/ is here to get
experience with kernel development.  Sending a 60+ series as your first
contribution to the kernel isn't the best way to start out.

Take your time, don't use a LLM, and fix issues one at a time and then
batch up patches, maybe 5 at a time and send them out, get reviews, fix
them up, wait for them to be accepted, and learn the process.

As-is, with the very first patch in this series being incorrect, I can't
do anything with these at all as-is.

thanks,

greg k-h
