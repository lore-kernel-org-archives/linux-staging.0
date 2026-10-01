Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D89143D510
	for <linux-staging@lists.linux.dev>; Thu,  1 Oct 2026 05:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790833281; cv=none; b=srApzUIL4K9N81n23e0pEpvgxVHLTbBX1J/dH/VFU+TDDBBXtHRjPZ+toeLATWFXYHlT2R97uY+VRINNKaUjlvbDN4R8XnlZdZ1WL5vcZnWzMn9bY1w6JAkhklceNiijWMTb8nPf7rVFGOmbP968urtFUk3rT7DGWSH0qKhp78U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790833281; c=relaxed/simple;
	bh=Lgjiqy2oZnMbKu8juk+qyVsLdRdxPsItyvu/avZalbs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jqD8OLn+llWX4TMyO7ATXNr47qj1/55JmmKbHlmZuV4DbibzJ7SQ742Cr7/R1/L/1gDgLqBit788mQo8GMdI2hFgt/5qXqkacwcYZQAAVKTuGjybT6PTafWAHdh6pDu+XHZQBNmRYOolDXkNQGHPjgkNWdFUEyyBNuLa19AkXMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FYKaaGMp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FYKaaGMp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 520341F000FF;
	Thu,  1 Oct 2026 05:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790833279;
	bh=qmPO0kTRGOmhtP6kXkn/xlIbyxmvBBua5WlYnkbNs8g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FYKaaGMpsKoOfor+9TKGvYYjlfgX3MM5kwoCpZiUWIXy6FAYPoLuFDbDCGo418wMu
	 bf5BGn2EvTDsEVB5Mn0u3t8tq86QJGhtZgPwmIMPB0QSXNjAdQast4uPdlyNRvmVAh
	 keaQLrxRtVn6+XjtGiP4tCSNR7kvEJeFPRuDIPk8=
Date: Thu, 1 Oct 2026 07:41:13 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Thomas Prud'homme <t+linux@prudhomme.li>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: fix lines over 100 characters in
 hal_intf.c
Message-ID: <2026100148-elixir-depose-a7df@gregkh>
References: <20260909174152.16934-1-t+linux@prudhomme.li>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909174152.16934-1-t+linux@prudhomme.li>

On Wed, Sep 09, 2026 at 07:41:52PM +0200, Thomas Prud'homme wrote:
> Wrap the parameter list of rtw_hal_set_odm_var() across two lines,
> and move the comment on the rtl8723b_HalDmWatchDog_in_LPS() call
> above the call instead of trailing it, so both lines fit within the
> checkpatch.pl line length limit. No functional change.
> 
> Signed-off-by: Thomas Prud'homme <t+linux@prudhomme.li>
> ---
>  drivers/staging/rtl8723bs/hal/hal_intf.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
> index 2caade1a8..1096f5441 100644
> --- a/drivers/staging/rtl8723bs/hal/hal_intf.c
> +++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
> @@ -89,7 +89,8 @@ u8 rtw_hal_get_def_var(struct adapter *padapter, enum hal_def_variable eVariable
>  	return GetHalDefVar8723BSDIO(padapter, eVariable, pValue);
>  }
>  
> -void rtw_hal_set_odm_var(struct adapter *padapter, enum hal_odm_variable eVariable, void *pValue1, bool bSet)
> +void rtw_hal_set_odm_var(struct adapter *padapter,
> +			 enum hal_odm_variable eVariable, void *pValue1, bool bSet)
>  {
>  	SetHalODMVar(padapter, eVariable, pValue1, bSet);
>  }
> @@ -216,7 +217,8 @@ void rtw_hal_dm_watchdog(struct adapter *padapter)
>  void rtw_hal_dm_watchdog_in_lps(struct adapter *padapter)
>  {
>  	if (adapter_to_pwrctl(padapter)->fw_current_in_ps_mode)
> -		rtl8723b_HalDmWatchDog_in_LPS(padapter); /* this function caller is in interrupt context */
> +		/* this function caller is in interrupt context */
> +		rtl8723b_HalDmWatchDog_in_LPS(padapter);

Doesn't this break a different checkpatch issue?

Be careful of multi-line statements like this...

thanks,

greg k-h
