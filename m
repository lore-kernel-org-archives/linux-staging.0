Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC68623C39A
	for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 19:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778440735; cv=none; b=RsYnXBds4N0hE7SlALcBY0CHezsDtx4LNn/m+IJ2+fw/pX+c/rPFUr4SZ35QylvTG9YgGmGchKBGAHo5nohebXafDl9C5DNfN5zbesrtb6lQS2wLPXQxUdJYrcFlx/kpcFIlt3oTHuldhBo2NTAZD6CJpc5N1+ERFBd45scL9sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778440735; c=relaxed/simple;
	bh=/V7kc5wHSUMp0v2Iw6tM5oibUq4snG5Y8HavSdrFjBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p5RCFKlAkdZSRRT99vORg/JulyrgOdR1UZviXJIaWbCG/4w4kvIiFvm17/YsBgPLw6G93Y7H2oqWCEssy/OK3KX0An1fbWtyt/1RVy84RP+vn4KgNeCS5CuwHrpHzB4IpjXwC4Vg3bv6JZ98YjYMZAjcnWX56+GhkqGFPvsl3h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HealNTFE; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HealNTFE"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-38e7d983f79so31661651fa.0
        for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 12:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778440732; x=1779045532; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FvQ17bgNjYw248Mcj1k6ZXGrauGctP8ioNLDozKkpc4=;
        b=HealNTFEc65K5aTwR8x+AGugWcV1DxffabdVu9hfCfn0/TEOGtUMOtFi09EkCGbjQr
         QhI4lxwFlwUnHjdmN4iCIKoSyqoS0b8JehIpjxg+wbt09FSjQ7rVCPro4fLmq4v/r+e/
         9x/Jg3uMFrCVMFfAsBcqX4+cErtorcZG9639ataNzU/GzddCVL/8kPeLoiAIkLumI5Td
         rP2EoNA3K4a3XXo8DdPCfJyxku50fEDNCwxX4cWRs/4REfcbKPFV7byUPtCF17kPRihV
         x1Bp3VoMAoIZgG5pYi5nZkPkgRJunPWRNQOpSd4U+rTSgo0KqQq+GN+/FVAhVRBafXXb
         s6Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778440732; x=1779045532;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FvQ17bgNjYw248Mcj1k6ZXGrauGctP8ioNLDozKkpc4=;
        b=C/XJzTLDRiR+vSrhSyy2I/EylWk8WoYTI/XMRIddPPFKYyubsWkBCJhnmcVczs2Piz
         OynRJ+Ry7GN+bpazVETGP2tBojtG0qAiWCR/tSCG6maqdjBiIzqlvefDEd6VC1TBofJL
         Qx6rk/KQiy7IbqWIgfOA/vv3vlsucQIngA1fQ/QBgh4MpxT4/cU+mSbrhgAwlnVtrfBr
         hhMz7E4wsDQp7wEr5M9UEKPmSShB0+aJH8uFneJdEt86LM2kUsJb/zeZiSlWCTdo4qH4
         M9Th3PjLt/y4fMrxubmDiSMZJ8/Mg8YT1KNc2qIFOFQm87V1W+OazPyswh2/Ttu8fzHa
         +MoA==
X-Forwarded-Encrypted: i=1; AFNElJ+n8Z+myIObH27sRoywjnQ1+eHpXgdSopQo6KW8u6vVJXKneX1ARLsMGsVF6Jf6NJAZ3Jp0cgq9QwIO+nkG@lists.linux.dev
X-Gm-Message-State: AOJu0YwWGoUr3w4jBOTmlf9fl6iTjlYZq9pSmrj/++SE35KkcQCN0mG3
	jCtVeEI22fjuFKkf0lplXIIo3pcoiDxszfUbi8rRifuiCS7JdBILf0cp
X-Gm-Gg: Acq92OGGtqJIycfEUpQNo5D4ykRu0uY/1ZEEybZ/A4ue39OpYSfG9wyT/9QWAX6gQid
	g4V0VVCQmYoildcBTKQ22AlYh1JjtqLUGuw0g50r4Z4Ks59+sSaXIS2MJjk75U6MddJxmtm1QFo
	XPMPdKEfooP6Q2j6frRHZE7aLv2aojT+JakscAfYphDHHxcpz7QMW3Jt7FPmOD9Ni2rSnXuIxY0
	bPfk28Qm27Rzzml6Hfk0VaI6eHmCBm7LhFealBG5T+UWyN8tPJyRPSBPlwTgyxnfKqAT1AepAXD
	VDj7GZGlsdLVUKy0VTwpm1Idz+hUYui3KWzshfrm+NIiPDMjj0TqH+y+4V0ewL27VW2sDrJINBR
	pm5ADgqHGT5ju6lgtAfeHEafJFQfHrfjnNf6wCLancc31by3OwiVj2qI3OtY1vlg7y/5j0ps+ot
	LhM2EzuUCE8LBr+9G486BfpFzf
X-Received: by 2002:a05:651c:984:b0:393:9bb7:bc5a with SMTP id 38308e7fff4ca-393c40bc1bdmr70843921fa.1.1778440731766;
        Sun, 10 May 2026 12:18:51 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f3a296sm22032601fa.12.2026.05.10.12.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 12:18:51 -0700 (PDT)
Date: Sun, 10 May 2026 22:18:48 +0300
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Noah Techoueyres <noahtechoueyres@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix line length checks in rtw_cmd.c
Message-ID: <agDaGJ5UKndFUNPY@archlinux>
References: <20260510032936.2852-1-noahtechoueyres@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260510032936.2852-1-noahtechoueyres@gmail.com>

On Sat, May 09, 2026 at 11:29:36PM -0400, Noah Techoueyres wrote:
> Fix both block comments and assignment statements that exceed the
> 100-column limit to follow Linux guidelines for readability.
> 
> Signed-off-by: Noah Techoueyres <noahtechoueyres@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_cmd.c | 23 +++++++++++++++++------
>  1 file changed, 17 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> index c1185c25ed36..a401c856c727 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> @@ -1117,13 +1117,17 @@ static void collect_traffic_statistics(struct adapter *padapter)
>  	pdvobjpriv->traffic_stat.rx_drop = padapter->recvpriv.rx_drop;
>  
>  	/*  Calculate throughput in last interval */
> -	pdvobjpriv->traffic_stat.cur_tx_bytes = pdvobjpriv->traffic_stat.tx_bytes - pdvobjpriv->traffic_stat.last_tx_bytes;
> -	pdvobjpriv->traffic_stat.cur_rx_bytes = pdvobjpriv->traffic_stat.rx_bytes - pdvobjpriv->traffic_stat.last_rx_bytes;
> +	pdvobjpriv->traffic_stat.cur_tx_bytes =
> +		pdvobjpriv->traffic_stat.tx_bytes - pdvobjpriv->traffic_stat.last_tx_bytes;
> +	pdvobjpriv->traffic_stat.cur_rx_bytes =
> +		pdvobjpriv->traffic_stat.rx_bytes - pdvobjpriv->traffic_stat.last_rx_bytes;
>  	pdvobjpriv->traffic_stat.last_tx_bytes = pdvobjpriv->traffic_stat.tx_bytes;
>  	pdvobjpriv->traffic_stat.last_rx_bytes = pdvobjpriv->traffic_stat.rx_bytes;
>  
> -	pdvobjpriv->traffic_stat.cur_tx_tp = (u32)(pdvobjpriv->traffic_stat.cur_tx_bytes * 8 / 2 / 1024 / 1024);
> -	pdvobjpriv->traffic_stat.cur_rx_tp = (u32)(pdvobjpriv->traffic_stat.cur_rx_bytes * 8 / 2 / 1024 / 1024);
> +	pdvobjpriv->traffic_stat.cur_tx_tp =
> +		(u32)(pdvobjpriv->traffic_stat.cur_tx_bytes * 8 / 2 / 1024 / 1024);
> +	pdvobjpriv->traffic_stat.cur_rx_tp =
> +		(u32)(pdvobjpriv->traffic_stat.cur_rx_bytes * 8 / 2 / 1024 / 1024);
>  }

What about adding an intermediate pointer to traffic_stat?
This will not only reduce the length of the lines, but will also make
the code easier to read.


Thanks,
Nikolay

>  
>  bool traffic_status_watchdog(struct adapter *padapter, bool from_timer)
> @@ -1743,7 +1747,11 @@ u8 rtw_drvextra_cmd_hdl(struct adapter *padapter, unsigned char *pbuf)
>  	pdrvextra_cmd = (struct drvextra_cmd_parm *)pbuf;
>  
>  	switch (pdrvextra_cmd->ec_id) {
> -	case DYNAMIC_CHK_WK_CID:/* only  primary padapter go to this cmd, but execute dynamic_chk_wk_hdl() for two interfaces */
> +	case DYNAMIC_CHK_WK_CID:
> +		/*
> +		 * only primary padapter go to this cmd, but execute
> +		 * dynamic_chk_wk_hdl() for two interfaces
> +		 */
>  		dynamic_chk_wk_hdl(padapter);
>  		break;
>  	case POWER_SAVING_CTRL_WK_CID:
> @@ -1881,7 +1889,10 @@ void rtw_createbss_cmd_callback(struct adapter *padapter, struct cmd_obj *pcmd)
>  		_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
>  
>  		spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
> -		/*  we will set _FW_LINKED when there is one more sat to join us (rtw_stassoc_event_callback) */
> +		/*
> +		 * we will set _FW_LINKED when there is one more sta
> +		 * to join us (rtw_stassoc_event_callback)
> +		 */
>  	}
>  
>  createbss_cmd_fail:
> -- 
> 2.53.0
> 
