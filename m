Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E532F233924;
	Tue,  7 Jul 2026 11:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783423586; cv=none; b=CNOqwTJFRbiXP0pVW3dAbngfxChzStYW4NnmUf4Tx/fK30re9aPExzS7ByiSVW0A+DfwFHB1/Vi/OYlbo7iPQMDr4L6/sk/lgALzW8/oJHT1/vLTsAy9O35cyXQD58icnZ0oi1J0aA0P3gHJYpyiGz6+QUwBl7yjSJAzdAudOTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783423586; c=relaxed/simple;
	bh=ni8YX3dW7lN6PrKz6aOMMpn2IOfF6BPA60ZtFx6XDgw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=otaVzuy/zafq8d+nQXNYwGauI/sEZub/lOOsA7akyMe75Gl6pmuWdGbJF9zy5s/Szyuk034I8Tv/ycejJWU7tKE4DpYmgZLjA5yW6bXywvnE7GwkuAtAXy3SUcaDYWEHm7Ibu5bo21xXhpoSVctUIlRPkA7PDVNdVDsb0I8xCKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=xehoBkoJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xehoBkoJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 229A81F000E9;
	Tue,  7 Jul 2026 11:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783423584;
	bh=Y2oEYjwEQudIZ8XNevwJ+AGM1SrB+iPkMqwtzULQoDc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=xehoBkoJji0Y9wRBXrzcXRzIO4HGbHBFD7l19AOfT84yXqetaD+9GX6xHRKMoBINN
	 xrnqsFmTgIGdAinzr3k848oem+lvFc1tUO0DhdDGc3zzwOOME9Y3D1xLy63s4Jv/wJ
	 xGFTqjtZERUo5i1S0oh9PiUthxFBRiBYGogTD+eM=
Date: Tue, 7 Jul 2026 13:26:22 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Xiaofeng Yuan <xiaofengmian@163.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: hal: remove unnecessary braces
Message-ID: <2026070712-pastor-bath-0442@gregkh>
References: <20260622131719.4241-1-xiaofengmian@163.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622131719.4241-1-xiaofengmian@163.com>

On Mon, Jun 22, 2026 at 01:17:19PM +0000, Xiaofeng Yuan wrote:
> checkpatch reports two warnings about unnecessary braces in hal_intf.c:
> 
>  - WARNING: braces {} are not necessary for any arm of this
>    statement (rtw_hal_update_ra_mask)
>  - WARNING: braces {} are not necessary for single statement
>    blocks (rtw_hal_dm_watchdog_in_lps)
> 
> Both blocks contain only single statements, so the braces are
> redundant. Remove them to align with kernel coding style.
> 
> Compile tested with CONFIG_RTL8723BS=m.
> 
> Signed-off-by: Xiaofeng Yuan <xiaofengmian@163.com>
> ---
>  drivers/staging/rtl8723bs/hal/hal_intf.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
> index 27c0c0198..45634b5e5 100644
> --- a/drivers/staging/rtl8723bs/hal/hal_intf.c
> +++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
> @@ -208,9 +208,8 @@ void rtw_hal_update_ra_mask(struct sta_info *psta, u8 rssi_level)
>  
>  	if (check_fwstate(pmlmepriv, WIFI_AP_STATE) == true)
>  		add_ratid(padapter, psta, rssi_level);
> -	else {
> +	else
>  		UpdateHalRAMask8723B(padapter, psta->mac_id, rssi_level);
> -	}
>  }
>  
>  void rtw_hal_add_ra_tid(struct adapter *padapter, u32 bitmap, u8 *arg, u8 rssi_level)
> @@ -254,9 +253,8 @@ void rtw_hal_dm_watchdog(struct adapter *padapter)
>  
>  void rtw_hal_dm_watchdog_in_lps(struct adapter *padapter)
>  {
> -	if (adapter_to_pwrctl(padapter)->fw_current_in_ps_mode) {
> +	if (adapter_to_pwrctl(padapter)->fw_current_in_ps_mode)
>  		rtl8723b_HalDmWatchDog_in_LPS(padapter); /* this function caller is in interrupt context */
> -	}
>  }
>  
>  void beacon_timing_control(struct adapter *padapter)
> -- 
> 2.43.0
> 
> 

Does not apply to the latest tree :(
