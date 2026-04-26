Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09C539182D;
	Mon, 27 Apr 2026 03:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777261844; cv=none; b=oIKp0p6Fe3du8UYpblQyG61+iYzpO4b9DqkrmdrTa3KbLLfr7UY16iuj8HeFEgY86DBUk58Rac5wedDKZJkjONM04f9NFIBn1sZO1I8O7IN7vVHpxs0/gkggAiKlIDYwGEpZXvL3AIXVLiwVbQiJQUbbJthERBdS01rXS1eeZok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777261844; c=relaxed/simple;
	bh=hao5BWjgx52T9B9AP+/Gq0jWsKJNsPcJ0O/yYniJ6V0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MHXiCqR+gsY0/H+kTFl8VzvBUvGSDDNBzD5FhI3bTHGgUp7CAY6NEJvckXS9x3pRBiEM6qhdVJbAnWccKLfpuEP9M5eXGp+2zKhVRd88RctFIiP//ZNfbKv0z2uOO1K83ONl1ogc+dyd1lXj+YtkiLUg0fxLIaK1qyrAog6He48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=kaFINguX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kaFINguX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 883D9C19425;
	Mon, 27 Apr 2026 03:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777261844;
	bh=hao5BWjgx52T9B9AP+/Gq0jWsKJNsPcJ0O/yYniJ6V0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kaFINguXz3RrUsYYWk2mRei8r5dXZbEEv+1ehsLrVF1NhEfmrs6qTIB3x900ht94u
	 6IsD0bQ6oBtOGN5cIsnr91BCScPP8DTqpAt+Ch6gA4bcxpV8n6sAX9oJaw6+9tzfjN
	 so2oJ1yRD+i5zxdGIjB+5bUDzZCRZCBC5wOD8oDc=
Date: Sun, 26 Apr 2026 21:28:36 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Linus Probert <linus.probert@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: rtl8723bs: correct logical continuation
 check in rtw_btcoex.c
Message-ID: <2026042618-headfirst-frill-2d79@gregkh>
References: <20260403220310.1824969-1-linus.probert@gmail.com>
 <20260403220310.1824969-2-linus.probert@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403220310.1824969-2-linus.probert@gmail.com>

On Sat, Apr 04, 2026 at 12:03:09AM +0200, Linus Probert wrote:
> Corrects logical continuation placement in rtw_btcoex.c
> Discovered and verified with checkpatch.pl
> 
> Signed-off-by: Linus Probert <linus.probert@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_btcoex.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_btcoex.c b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
> index 0191a943f0a4..caa757b8dc0a 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_btcoex.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
> @@ -10,8 +10,8 @@
>  
>  void rtw_btcoex_MediaStatusNotify(struct adapter *padapter, u8 media_status)
>  {
> -	if ((media_status == RT_MEDIA_CONNECT)
> -		&& (check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE) == true)) {
> +	if (media_status == RT_MEDIA_CONNECT &&
> +	    check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE) == true) {
>  		rtw_hal_set_hwreg(padapter, HW_VAR_DL_RSVD_PAGE, NULL);
>  	}
>  
> -- 
> 2.53.0
> 

I hate this checkpatch "warning" as you now need to remember what the
order of operations is :(
