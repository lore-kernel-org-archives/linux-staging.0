Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2487B2DA74C
	for <linux-staging@lists.linux.dev>; Mon, 11 Aug 2025 07:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754897420; cv=none; b=uTuYTdxoIenKycrqFgymYVWj3QrBdaVBZ1TcTXtj7ZJCyqiTLRSyH2g37vWaKUpEoNRS2B4W5nRsM/oz4jg/tMaI7mFC4QXYxyM79Wj/Xr6zlCTPlAz7morQVsNxgDm98IAh0oQwF1Tg/RJ91deeKjjo0JvKAot8yonPk/rHYq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754897420; c=relaxed/simple;
	bh=O5bVzxxklGV2wx9J0P6ne1RrDA/KRssltJb+lkhoM08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K2EEzkZsL173FCCFMamG54NJ6g//pXoBId3c525IKLdsfGYhil35EX7Rlz4vslk8pdnnKEjEO1EzNu/x9nQANkumpw2rsY/moqXqAT+YbGVqUAXgHGTFiXFnv1wZlWbJzjwMHRp+8T3NUeRC9r51jK6nxvFWFHRdU2w+qcX0Q0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kjr3e+4Z; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kjr3e+4Z"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-459d44d286eso20873015e9.0
        for <linux-staging@lists.linux.dev>; Mon, 11 Aug 2025 00:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754897416; x=1755502216; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A9EiUhQxYzz/KcbXsPpOFxaqjoUFAlADSRrsbCh5BCc=;
        b=kjr3e+4ZK2Mr/N+rFgYIeyimOF/KjMD4zaHPTnxLDQhRBZq/cW5htxrKyxq4oDlerO
         JlgJAKQfMJNTuudYVty5gboE3+YHJbdn+2blKqk8BAT7JhAFatGc2X9NWe0lKcU29UG0
         zs4Rhbm+L5bbW+zZOgQraL+Fmo/mZcy/2pdCKjB48RGemKoHv/9CKbei/kMRORKBckPc
         eIqPkr3zLHqtRaWa2bLI7A/WcT3fna8jWT5Q+5dW748xUut7mavDo13Gf7FjqDLsHHaI
         LB3hKRXE8SM3GNmx6ad6TMudJqMMU3JgFYn6WXNIWgRd3a/foErntaHKGWVn2y/7RuZW
         qhnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754897416; x=1755502216;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A9EiUhQxYzz/KcbXsPpOFxaqjoUFAlADSRrsbCh5BCc=;
        b=J+rEWiSfKs9bKa3hyNBVWOc50N8jnXhfdurErnPaCh6gHlG69usVyZGb4QoE4tG9ud
         qkYooPlDNHRUuXzWtKUo427A8H66jm0F9rakCzpXTKAAhpgw+gccbquF/ERoOLJ6sCFh
         c7EPy20WStw7voszjX3HZuuS6iUUb7Um6UsfQ/JuDLBASwX8gdXybJaEQrdTe+oYwdrN
         p6gsLTSdsSh9tQxPfNCKQmgDKtm6mtVTL78MsWGKrzSuAF1pWgliZ4uPiViiXzSzLEEW
         fuRREZqIZST9N8m9y5xoprXtGhj6Gsle8YInuBV2qlb4A2MqiwIhS0pR7y4X1uEBfQlg
         +1jw==
X-Forwarded-Encrypted: i=1; AJvYcCXGslJQTt/rLQwi2u9pMWAfZ1SH2M+hm/Y744xrUROgK0wQ9sJlJrc1m3JvD3N0bca7FmtyXMbrYNEC/6+p@lists.linux.dev
X-Gm-Message-State: AOJu0YzH/TGjQbcxeWAhQdLMNFWowgfcky4wFa87F2BQ7kl1knTgfV8E
	hIFt562KjQq/BM0RhZbvDF68e2uEIjtCCldPpKXX5XAVitksiIvaWwTJs5xvXQQ/7WM=
X-Gm-Gg: ASbGncuwVgnd5mBMxKl9YzBOG40MYdi0tA2iDWptC9u1npk7YtCUwQ64EhiMAlFYwv7
	o5q2ql733OSJz5ctdNQz4PfnSU/atwcBoVGPqA2GTdLCU3OUe3JBHlIVIMmgXmP16Y8rI9bhSHT
	mZbMzRhvdtwBZYHpBMfFfqE4Y5nFq8JzAakituxzGBvUKJ9CO3HA/+CXyrHPSZhqR12w0p7hWsn
	7N3kAxLjXQ8ieQ5RvM22B/WU6yBq9+5C5ZMXolPWxUOyRC96r4KDKevGdxY1N19ucy/ANJ+Rcl3
	MPJwyq0Ktn2bFODFU2vJFWv76IDvsUqugnG0XGeokPBg29B7kAq0Cx81o6Yp88faExzoVbYXgqV
	KA4vhec2lwLImPy47jNydpmwWntA=
X-Google-Smtp-Source: AGHT+IFnZcurUjSB0/hSFNgOLLFovKhhBQzF571ByqSxJzK51BtjHE2aT99IpvR/yipJ190BOOAJ0Q==
X-Received: by 2002:a05:6000:210d:b0:3b9:6:8970 with SMTP id ffacd0b85a97d-3b9000689f8mr8078708f8f.23.1754897416339;
        Mon, 11 Aug 2025 00:30:16 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b910180aebsm77506f8f.59.2025.08.11.00.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 00:30:15 -0700 (PDT)
Date: Mon, 11 Aug 2025 10:30:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Yao-Wen Chang <changyaowen19980629@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/11] staging: rtl8723bs: Reformat code to respect
 100-column line limit
Message-ID: <aJmcA7SlCjXXPsOl@stanley.mountain>
References: <20250811062132.102525-1-changyaowen19980629@gmail.com>
 <20250811062132.102525-2-changyaowen19980629@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811062132.102525-2-changyaowen19980629@gmail.com>

On Mon, Aug 11, 2025 at 02:21:25PM +0800, Yao-Wen Chang wrote:
> This commit breaks several long lines of code to ensure they do not exceed
> the 100-character limit.
> 
> Signed-off-by: Yao-Wen Chang <changyaowen19980629@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_ap.c  |  12 ++-
>  drivers/staging/rtl8723bs/core/rtw_cmd.c | 106 ++++++++++++++++-------
>  2 files changed, 83 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
> index 47c63177b2a6..2e59a26e6318 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_ap.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
> @@ -391,7 +391,9 @@ void update_bmc_sta(struct adapter *padapter)
>  
>  		memset((void *)&psta->sta_stats, 0, sizeof(struct stainfo_stats));
>  
> -		/* psta->dot118021XPrivacy = _NO_PRIVACY_;//!!! remove it, because it has been set before this. */
> +		/* psta->dot118021XPrivacy = _NO_PRIVACY_;
> +		 * //!!! remove it, because it has been set before this.
> +		 */

Delete commented out code.  Also what the heck is up with "* //!!! remove it, ".

>  
>  		/* prepare for add_RATid */
>  		supportRateNum = rtw_get_rateset_len((u8 *)&pcur_network->supported_rates);
> @@ -841,7 +843,9 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
>  	memcpy(pbss_network->mac_address, myid(&padapter->eeprompriv), ETH_ALEN);
>  
>  	/* beacon interval */
> -	p = rtw_get_beacon_interval_from_ie(ie);/* ie + 8;	8: TimeStamp, 2: Beacon Interval 2:Capability */
> +	p = rtw_get_beacon_interval_from_ie(ie); /* ie + 8; 8:
> +						  *TimeStamp, 2: Beacon Interval 2:Capability
> +						  */

This is whack.  Just go through the rest of the patchset and really
think about things a little bit more carefully.  We could obviously
have fixed all the checkpatch patches automatically and there is a
checkpatch option to do that, but we want people to do it manually
and really review things in context.

regards,
dan carpenter

