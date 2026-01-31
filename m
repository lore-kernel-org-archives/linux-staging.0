Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD92226861
	for <linux-staging@lists.linux.dev>; Sat, 31 Jan 2026 13:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769864543; cv=none; b=XjqGQw2cgsnaV3w4oXQaxl+UdBNILPydWNUkZOZNDISxCgR8mvRg5lnU5g2AmbFwfqT3IJgjfG6l6oJ8a6ptsSjpBStkHqcRTxMKSK16DUl33QHKUjlARsA1pxWvCoRo4YVQQ08tDz4bnEMmikviOTbepQZtCyJmryczWr2Dt9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769864543; c=relaxed/simple;
	bh=47b1/UOunzsnxKnL4m34GNguaUCleoCY1kmbBLnqQ2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b9SO8Rg25XR4OGMRUSAUsGhTWKXxL95h5DYCCDCSN9Gw3KjEYD8e5izIOiFtzd7ZCZ3pbI/DVfLpp6Ma9TSvu2Eg0fJ7pHVyrWY0paCBgCso5D6HBtD7z22swn1TnAYth7TD5ST8nks9y+bG69IXKrIgPElLTSozV2/eDAFwiNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Hl7fFzqW; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hl7fFzqW"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47d6a1f08bbso13611995e9.2
        for <linux-staging@lists.linux.dev>; Sat, 31 Jan 2026 05:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769864540; x=1770469340; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DRs3JCfIy0F/5RT0pfot+HnvlFMKfhT+1lFiNSfeV1A=;
        b=Hl7fFzqWC9gleNjTzCn7l8GWrbULjEfzWad59H1PUBq6r6q3HUyJx+yk6J/+tG2Uz6
         rvwjsZCfdc+bifW6pc1SmfWui5ivAU65GPZtAfHOvqQ6R4eX4WQ+Lyu+Gnz/D3qammX/
         58JiuxWEnIC/7Y+tpzuiOJLTvr1WDc+JRE4iGrgnIZmjX5gUu0hY+MqaaUPdS3D3rWpq
         sH3trclcdz1SjjSHZzDiDE5cC2h0BgfscDpyOgal26Koi+AeBm8faJm4MuLMIaVF8uGG
         ot35Cak399Ur9c+nX0Zde70ToN3X0tdHQCAYH44umGjJKCHmI7EwpMiyyOdBKHGXFBJZ
         IT/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769864540; x=1770469340;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DRs3JCfIy0F/5RT0pfot+HnvlFMKfhT+1lFiNSfeV1A=;
        b=bJa7lC1+Y5fJUpGRlEhbevuVJieJBfZ/+2EyLjWa9hxCzk4vx0flug/Tu4fl4pXd1s
         +X5PTqjW2sYLPKIKR0+aJcQPiA3/Y9IN7XMZoQv9+95pzClpxrbNaHtjg0zxrhD14l7f
         g8QBgMSxg7Seggm/8HwvFdlQfrMvKiR0qdfraH1PigdUigx0CsJD3rD9b9oUYCfPa38P
         PnH34PwcnGZnJ1vCPDTE0dXgfck//T/2hmM91E3TGS/AKTsuQOm4crAF/8JYvd37/u59
         upHuURkfRTv4NgL8cX3WXSQNZwyANsESgEywOekp1/8QPygD8xFhobGq7eC0lyVKbe9t
         Ap5w==
X-Forwarded-Encrypted: i=1; AJvYcCX3XzIYjXSwPkeIGG+zPJG/ADH7xfBXC+wLXoUc6ME6NRTq8U4Yo0/2K/6Xq+cUNFHfpGtp7zURjteI514w@lists.linux.dev
X-Gm-Message-State: AOJu0YyM/fKXmE2C5Udg2v91H8f1E8ormvnHEBNC1D4g1AJAVpPsreAf
	LBzPGYMf2OFm/I3BUzRZqHZM+W0U706CUe+J56PrbdPoWGF2bjnOJLrVqXO4bzyS7lU=
X-Gm-Gg: AZuq6aJYOJXjZYC4l+qQuBwpyCCwV99cHL0DUCZmACNR3VZhnyZNtutWEWp/eiXawSy
	ArtgXwKkINY98MRTeMaLG7j7O2KjyONJTvAGckJASna+XxttOVATqGHympvNdZb/Ad+4Th4VKIu
	3OMlYZHopCtPFXlNC01MFtYoDbto56uEPr4ruKHtQ8h5OeTHxaG4yZX7httTo1QnutYAiXRWkKr
	vbxe4IrMtiq0nNaACp8R7Kb8n48neJQrXTnn00X5s55WGGp3+Hpy2uazIgiPSu/x0QvyPZJLBJV
	+wYF6BMQzKbUyWOiCjNPYjb1oOnm6YNhmF+msfDxqJ3x51h0O2/NOeXK1TujXwFWRFZ7AIvhiuz
	gQdkww4QAIjQW6bm1u6I9ASQTrs1eqEfrXStqnMBswqkRFOfn/dqNrOMvFdAzJNH1AX7Z06pVZ/
	aD2zNnq/yUY0hn+/yM
X-Received: by 2002:a05:600c:8b26:b0:480:426e:9d38 with SMTP id 5b1f17b1804b1-482db4e5cb1mr71155645e9.27.1769864539968;
        Sat, 31 Jan 2026 05:02:19 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066c37420sm349296505e9.9.2026.01.31.05.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 05:02:19 -0800 (PST)
Date: Sat, 31 Jan 2026 16:02:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] staging: rtl8723bs: remove unused private debug
 counters
Message-ID: <aX39WL7lOb09D_Qk@stanley.mountain>
References: <20260130204051.4237-1-ethantidmore06@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260130204051.4237-1-ethantidmore06@gmail.com>

On Fri, Jan 30, 2026 at 02:40:51PM -0600, Ethan Tidmore wrote:
> -void rtw_hal_check_rxfifo_full(struct adapter *adapter)
> -{
> -	struct dvobj_priv *psdpriv = adapter->dvobj;
> -	struct debug_priv *pdbgpriv = &psdpriv->drv_dbg;
> -	int save_cnt = false;
> -
> -	/* switch counter to RX fifo */
> -	rtw_write8(adapter, REG_RXERR_RPT+3, rtw_read8(adapter, REG_RXERR_RPT+3)|0xf0);
        ^^^^^^^^^^
You can't delete this.

> -	save_cnt = true;
> -	/* todo: other chips */
> -
> -	if (save_cnt) {
> -		/* rtw_write8(adapter, REG_RXERR_RPT+3, rtw_read8(adapter, REG_RXERR_RPT+3)|0xa0); */
> -		pdbgpriv->dbg_rx_fifo_last_overflow = pdbgpriv->dbg_rx_fifo_curr_overflow;
> -		pdbgpriv->dbg_rx_fifo_curr_overflow = rtw_read16(adapter, REG_RXERR_RPT);
> -		pdbgpriv->dbg_rx_fifo_diff_overflow = pdbgpriv->dbg_rx_fifo_curr_overflow-pdbgpriv->dbg_rx_fifo_last_overflow;
> -	}
> -}
> -
>  static u32 Array_kfreemap[] = {
>  	0xf8, 0xe,
>  	0xf6, 0xc,
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c b/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
> index 928226679ab4..e4d1b54607c8 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
> +++ b/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
> @@ -124,7 +124,6 @@ void rtl8723b_InitHalDm(struct adapter *Adapter)
>  
>  void rtl8723b_HalDmWatchDog(struct adapter *Adapter)
>  {
> -	bool fw_current_in_ps_mode = false;
>  	bool bFwPSAwake = true;
>  	u8 hw_init_completed = false;
>  	struct hal_com_data *pHalData = GET_HAL_DATA(Adapter);
> @@ -134,16 +133,8 @@ void rtl8723b_HalDmWatchDog(struct adapter *Adapter)
>  	if (hw_init_completed == false)
>  		goto skip_dm;
>  
> -	fw_current_in_ps_mode = adapter_to_pwrctl(Adapter)->fw_current_in_ps_mode;

Which means don't delete this either.

regards,
dan carpenter

>  	rtw_hal_get_hwreg(Adapter, HW_VAR_FWLPS_RF_ON, (u8 *)(&bFwPSAwake));
>  
> -	if (
> -		(hw_init_completed == true) &&
> -		((!fw_current_in_ps_mode) && bFwPSAwake)
> -	) {
> -		rtw_hal_check_rxfifo_full(Adapter);
> -	}
> -
>  	/* ODM */
>  	if (hw_init_completed == true) {
>  		u8 bLinked = false;



