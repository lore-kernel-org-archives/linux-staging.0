Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9417259E
	for <linux-staging@lists.linux.dev>; Sun,  4 Apr 2021 09:54:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 53D03611BE;
	Sun,  4 Apr 2021 09:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1617530084;
	bh=//DIgneInJY35u2umDp/dDQQ9PbPLq+sNE7oCK8eUWs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KJFegLmvZW9os1Zmz2DtBDTyPsInFnLrLV/CMnWNaSYRvyKcUfAZhE4Kb4re+He8V
	 2EjXz9cj2TajZKw8ekNJerrhbB5wcZnhLKv8BzmELqKxvTwtcoNUcIIXNbEACTuonv
	 dCIl4o6a6qBwEn1PCGYQ6Mu88uf2WDy0FgjlpZto=
Date: Sun, 4 Apr 2021 11:54:40 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Deborah Brouwer <deborahbrouwer3563@gmail.com>
Cc: Larry.Finger@lwfinger.net, straube.linux@gmail.com,
	unixbhaskar@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: Re: [PATCH] staging: rtl8188eu: replace goto with direct return
Message-ID: <YGmM4FTVZ/FIQ7lj@kroah.com>
References: <20210404054008.23525-1-deborahbrouwer3563@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210404054008.23525-1-deborahbrouwer3563@gmail.com>

On Sat, Apr 03, 2021 at 10:40:08PM -0700, Deborah Brouwer wrote:
> To conform with Linux kernel coding style, replace goto statement that
> does no cleanup with a direct return.  To preserve meaning, copy comments
> from the original goto statement to the return statement.  Identified by
> the checkpatch warning: WARNING: void function return statements are not
> generally useful.
> 
> Signed-off-by: Deborah Brouwer <deborahbrouwer3563@gmail.com>
> ---
>  drivers/staging/rtl8188eu/hal/rtl8188e_dm.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8188eu/hal/rtl8188e_dm.c b/drivers/staging/rtl8188eu/hal/rtl8188e_dm.c
> index 391c59490718..d21f21857c20 100644
> --- a/drivers/staging/rtl8188eu/hal/rtl8188e_dm.c
> +++ b/drivers/staging/rtl8188eu/hal/rtl8188e_dm.c
> @@ -139,7 +139,9 @@ void rtw_hal_dm_watchdog(struct adapter *Adapter)
>  	hw_init_completed = Adapter->hw_init_completed;
>  
>  	if (!hw_init_completed)
> -		goto skip_dm;
> +		/*  Check GPIO to determine current RF on/off and Pbc status. */
> +		/*  Check Hardware Radio ON/OFF or not */
> +		return;

It does not make sense to have the comments in two places here.  The
original code is just fine, there's nothing wrong with the goto
statement here.

thanks,

greg k-h
