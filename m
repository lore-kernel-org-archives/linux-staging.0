Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534E92798E3
	for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 07:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752651501; cv=none; b=ODg8166vr/THsDyerP9giGApY3+iTvOikrX83+E0EFX4vSBeWJrMjuQpYgWRPSv6g2oO2neL8JGb2LisCmaQHytH5QhwFKrlLAHloMW7sYshp5NQoBmcmBjeFgtYfu1VSrloIeq48Y5PpWd15sFsJl8dlTTHc9IcxjXThDN4/FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752651501; c=relaxed/simple;
	bh=eki9TQDHNq53ejZl9YypeTcc2mRTE5I8deLRtC0NhUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lhmKEDCBE15CXpwY0xFeNYXmRw8TiSeP7lK9vpXbOb22svhyGTKWDEc/5N/kQ7ROUmbsUuFiNBzrLQyWvJSOXfg550wnPOgEyilYr5cvVCv+W1t9dp5Dfs4RhTDI59Ky013VJJklGqoqiLn31Df3xxRbyne5BtpwonHUBLjmgsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=w+8iIlf3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="w+8iIlf3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95114C4CEF5;
	Wed, 16 Jul 2025 07:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1752651500;
	bh=eki9TQDHNq53ejZl9YypeTcc2mRTE5I8deLRtC0NhUI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=w+8iIlf3QQMyD8gBoNOpd/LpHkUu2icB30d0D8dodKp1feO7IQ7VHB6X6dinIyivN
	 kIXolHUFd8uXJaLLPSiwdr1bKGW1qy/PS6yordjviY1sLAzl8dMi8JPu/KndOS5hPj
	 H5y9XWKqd6b1lSssZysITXtlhfZwKH0GnHfslk80=
Date: Wed, 16 Jul 2025 09:38:18 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ignacio =?iso-8859-1?Q?Pe=F1a?= <ignacio.pena87@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH 3/3] staging: rtl8723bs: fix indentation in commented code
Message-ID: <2025071651-pulmonary-antirust-3abc@gregkh>
References: <20250716053604.64798-1-ignacio.pena87@gmail.com>
 <20250716053604.64798-3-ignacio.pena87@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250716053604.64798-3-ignacio.pena87@gmail.com>

On Wed, Jul 16, 2025 at 01:36:04AM -0400, Ignacio Peña wrote:
> From: Ignacio Pena <ignacio.pena87@gmail.com>
> 
> Fix checkpatch warning by correcting tab indentation in commented
> return statement.
> 
> Signed-off-by: Ignacio Pena <ignacio.pena87@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_cmd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> index 437934dd2..f02b3b485 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> @@ -1318,7 +1318,7 @@ u8 rtw_lps_ctrl_wk_cmd(struct adapter *padapter, u8 lps_ctrl_type, u8 enqueue)
>         u8 res = _SUCCESS;
> 
>         /* if (!pwrctrlpriv->bLeisurePs) */
> -       /*      return res; */
> +       /*      return res; */

I don't see any whitespace change here as the whole patch's whitespace
is broken :(

Also, why not just delete these two lines entirely?

thanks,

greg k-h
