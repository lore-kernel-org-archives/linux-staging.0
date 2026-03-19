Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8BB329361;
	Thu, 19 Mar 2026 07:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773906870; cv=none; b=fCeuoEWu9UjsxhBilj0M/755TCzrMIQTv2BYdrN60cGhAIL5hxAmoLpANFTQu9Y1pevUTt71iIF/FH17SoLBm94H6yzei3TFnmTxiFCnqpTaQUbcJ0eRmfdLet54P+0G/vBlObeT2wKaFZVApRTll4KhSkkFZV6+PbNlB3lxmR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773906870; c=relaxed/simple;
	bh=q4I15P09mxIudkEmPE8gl7o8j/al+Yhc5VKcuRj/ru0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tDcMFgkn2FUECyWHWjCiK5qVrrQuFucGt5PsQKu5CExqGbjRhh9JuKC0j1tu2emclEUyqhjK4438TB7ABp/0aC/8Y8BI1JdCJQZoR+iDWwOoS/FvMFeqvT8prg7mUr6lnx1oiUiF5O2d4qiKQvXr/1buGnmGdUCzaCSGPS2jNPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fyT4FDaR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fyT4FDaR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C873FC19424;
	Thu, 19 Mar 2026 07:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773906870;
	bh=q4I15P09mxIudkEmPE8gl7o8j/al+Yhc5VKcuRj/ru0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fyT4FDaR639HuFXn1orKNhrVrUWYgc/JiFxbhfVhItKn5ByK5upZtHCe/3ShRAgXF
	 12WpRfvFkuJhDasAPy7tr6Fw6Q8jYvAN9+Q2PNOb4ccd9n1cfcr7QH8Lb8pJINb9/c
	 OXGa+h0g/qMTGzdcMT0Y7ugIYmqAwtNCfVgzwWJU=
Date: Thu, 19 Mar 2026 08:54:09 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Zile Xiong <xiongzile99@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	karanja99erick@gmail.com
Subject: Re: [PATCH] staging: rtl8723bs: simplify condition in
 rtw_btcoex_MediaStatusNotify
Message-ID: <2026031929-surface-sash-a8b2@gregkh>
References: <20260319074007.63137-1-xiongzile99@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319074007.63137-1-xiongzile99@gmail.com>

On Thu, Mar 19, 2026 at 03:40:07PM +0800, Zile Xiong wrote:
> Remove redundant parentheses and unnecessary comparison to true
> in the conditional expression to improve readability.
> 
> No functional change.
> 
> Signed-off-by: Zile Xiong <xiongzile99@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_btcoex.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_btcoex.c b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
> index f4b19ef7b341..b19eab0afba3 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_btcoex.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
> @@ -10,10 +10,8 @@
>  
>  void rtw_btcoex_MediaStatusNotify(struct adapter *padapter, u8 media_status)
>  {
> -	if ((media_status == RT_MEDIA_CONNECT)
> -		&& (check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE) == true)) {
> +	if (media_status == RT_MEDIA_CONNECT && check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE))

Please no, now you need to remember that == takes precidence over &&.

>  		rtw_hal_set_hwreg(padapter, HW_VAR_DL_RSVD_PAGE, NULL);
> -	}

You also did two different things here in the same change, which isn't
alowed for staging patches.

thanks,

greg k-h
