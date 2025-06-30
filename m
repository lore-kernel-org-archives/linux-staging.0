Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8777B236431
	for <linux-staging@lists.linux.dev>; Mon, 30 Jun 2025 23:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751325420; cv=none; b=RzIHXFjBW5c+itM63lD1LitbD4aKwi1ZtACx0dbiTtw46SOaUEeYfgx94Av5mCp0J3cZFaWkFkmwD4MsTDTMehUh8xfL6d0P0uLfxGBTGQ7DQdOBN4CnBtqOULoW8NDxc46D/+wOUgFwTYtjdHuqk+aOoK32MEgS9wwPnmM7u94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751325420; c=relaxed/simple;
	bh=n8QfZ0rnJ0oU6x9/bVIPheJOm21x+iAfPDADw8dIoag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g8+UoZb4XUWMBJwkLogK2aoh5o+3ovsN0WLEwdk65QMN1owVRlGNKne0RUDutHSzImqby5GyJV8YNGNgJBeBRxFn7pjywvXdUnb56h40uBB2xJh2aHNmWxnOkIkQdsiBjOEtIJaRLsOPIKtZFdiw3fKA8wcrlU8Bu3tWhMl9zuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mNopf7ru; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mNopf7ru"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7387f21daadso3168179a34.0
        for <linux-staging@lists.linux.dev>; Mon, 30 Jun 2025 16:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751325417; x=1751930217; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dPsglbeSfBYikFMRlZLM+myXUf3rDQJ1e/HuWqhv0Kg=;
        b=mNopf7ruxma8MctYaTklY8hFUI8mXgjq+YtnPtSAbguUsd/iprhQ2/Ep/LCzudGzbo
         IzBSmJRPiZYy7InGEKFZXPRC/1U8uZTdJQMmm76dEs00afPxNoU0cVVd53g2k5A3bGsj
         p8hwZRhALUglGlz3GHtGSMyWiAIBwNGmGBcZWeOuOkmEs+8tWNxYXXwoUi6Fypqjz18k
         XDdFVf1ddMnPx+K9pMfa3qklefbNVFpy+lI1ywBDnxsRVWuvha6kQxsJC85WXWm3dvpB
         w3EHIcfgAMaOMTVasrCoxg3+MAs1+bSXNcrXPJeINWvn39CXM6vmCZ4E3V0EdJG8vyek
         BRjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751325417; x=1751930217;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dPsglbeSfBYikFMRlZLM+myXUf3rDQJ1e/HuWqhv0Kg=;
        b=F0HsGkyl1EE1u7JhTz2g9Y1/WlVVth/BOI9gC/0UP3s2Yhj1nbcOqcPAGllFHZQJz5
         gJ/5Fvqy1qMH2p9OFpLMy5ixj0OLvadxNhtItIvVqtgjamGILwrhNNfkRJAaSdRqJ8a+
         vmDgeVICJT86jUIZCssN1vaEPSUFXFpQCPtPqxlHhecad0Bnh33VsU//h1pOkNjTFBip
         gIYC2YoG9pNjmM+QC8DRJfmUlVFoGJFPe40po2D3q8c21oNUoVBCOjkxsGnSh50V9ET7
         xEoZhy1y7+f8HPa1LnQvcb4BcTMHq87+eleqiFze81D7GOG7s2tuIYmgoTsvNg7N2JYK
         qD8A==
X-Forwarded-Encrypted: i=1; AJvYcCVIxSPaqjKJIHn1Qc1M+uTnmzSFKtvSksvcHfnD1ovD65oP/B/CdWH/hWd1B5+cuHnBbHTcmcngyYnQkjut@lists.linux.dev
X-Gm-Message-State: AOJu0YygENvCNsyteuIWB7+HdFQVtrTX6XQEEr87N8Rs2zLEG8R73rTn
	4K5XMopBth3WZYK6yK50LS3qHpVeVMZKdbCtkTNoHomsas/R1RMJq+jJUkr5ljUxlpA=
X-Gm-Gg: ASbGnctWNLs5aD2kmpkEmw3WYQLGz3lq4Jiuudd9YlTJLInhJenyaueYt60HKQLLoDM
	tDcIUWado2ZN+x9IpofkK5arrWmjtRpMMQ+sdtXI/wdkBhWP9pzEqKFFkW1hNFKil/Gvjhsi5Ev
	5hqpklnFZFWNH//Gkm3pM26lNhDKIdTsC2HnZPpDhY4QUHgWaGtaBuDJpwvSbi7K+w4oKxrY9lz
	NzNw/63Jm6+2XRXnVl9ZvymMP5SfrzAWV17xU7/jhfGW0abij3RStoYQV45mXNoPwd6/Ddhn2cw
	QtsCq8N97rUjzF89loiyLoY/EqXWi2m222s6T7ATLWgjlbgsjNGxtR7MoZvT91llqMnx
X-Google-Smtp-Source: AGHT+IEO4423qNPUoHeSs9Ticg1iFqBds4SMvKWENz/3Z7lV5vqhHiAViodxGv2Yd3U+TjK0V9jRiA==
X-Received: by 2002:a05:6830:1d8a:b0:735:a6b9:3b48 with SMTP id 46e09a7af769-73b3b7d7bdbmr1021171a34.10.1751325417416;
        Mon, 30 Jun 2025 16:16:57 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:fb67:363d:328:e253])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-611b857b8dcsm1264293eaf.26.2025.06.30.16.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 16:16:56 -0700 (PDT)
Date: Tue, 1 Jul 2025 02:16:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Marcos Garcia <magazo2005@gmail.com>
Cc: gregkh@linuxfoundation.org, philipp.g.hortmann@gmail.com,
	karanja99erick@gmail.com, rodrigo.gobbi.7@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH staging] staging: rtl8723bs: Replace magic numbers in
 beacon initialization
Message-ID: <327e77c3-b754-4b99-ad57-ce87ac2e92bd@suswa.mountain>
References: <38411a98-d907-4173-a528-8d50b337de0c@suswa.mountain>
 <20250630210211.3922530-1-magazo2005@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630210211.3922530-1-magazo2005@gmail.com>

On Mon, Jun 30, 2025 at 11:02:11PM +0200, Marcos Garcia wrote:
> Replace hardcoded register values in rtl8723b_InitBeaconParameters()
> with descriptive defines to improve code readability and maintainability:
> - TBTT_PROHIBIT_DEFAULT (0x6404): Sets TBTT prohibit time to 100ms
>   (bits [15:8]) with a 2ms margin (bits [7:0]).
> - BCNTCFG_DEFAULT (0x660F): Configures maximum AIFS for beacon
>   transmission to ensure high priority, as recommended by the designer.

This commit message references TBTT_PROHIBIT_DEFAULT and BCNTCFG_DEFAULT
which don't exist.  At this point I'm kind of assuming that you're
using ChatGPT to write your patches.

> 
> Preserve original comments where they provide useful context, such as
> firmware control in power-saving mode and designer notes about beacon
> contention. Fix typo "contension" to "contention" in the comment.
> 
> Signed-off-by: Marcos Garcia <magazo2005@gmail.com>
> ---
>  .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 50 +++++++++++++++----
>  kernel/sched/ext.c                            |  8 ++-
>  2 files changed, 46 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> index cc7886d75a0b..a3438280e1ab 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> +++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> @@ -1183,9 +1183,25 @@ void rtl8723b_read_chip_version(struct adapter *padapter)
>  	ReadChipVersion8723B(padapter);
>  }
>  
> -/* Beacon Configuration */
> -#define TBTT_PROHIBIT_DEFAULT_MS	0x6404  /* 100ms interval + 4ms margin */
> -#define BCNTCFG_AIFS_LARGEST		0x660F  /* Max AIFS for beacon priority */

You've written this patch on top of a different patch which we're not
going to apply.

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

> +/*
> + * Beacon Configuration
> + *
> + * REG_TBTT_PROHIBIT: 16-bit register where:
> + *   - Bits [15:8] = TBTT prohibit time in units of 1ms
> + *   - Bits [7:0] = TBTT prohibit margin time in units of 0.5ms
> + * Default value of 0x6404 means:
> + *   - 0x64 (100) ms prohibit time
> + *   - 0x04 (4 * 0.5 = 2) ms margin time
> + */
> +#define TBTT_PROHIBIT_100MS_2MS_MARGIN 0x6404

Are you getting this from a spec somewhere?  Where is the link?  So the
original comment was wrong with regards to 4 ms margin vs 2 ms margin?
This kind of information needs to be in the v2 notes.

I think I need to see the spec before I can review further.

regards,
dan carpenter

> +
> +/*
> + * REG_BCNTCFG: Beacon configuration register
> + * 0x660F sets AIFS to maximum value (0xF) with other default parameters
> + * This ensures beacons get highest priority (no contention window),
> + * as suggested by the original designer for test chips.
> + */
> +#define BCNTCFG_MAX_AIFS 0x660F
>  
>  void rtl8723b_InitBeaconParameters(struct adapter *padapter)
>  {
> @@ -1193,19 +1209,31 @@ void rtl8723b_InitBeaconParameters(struct adapter *padapter)
>  	u16 val16;
>  	u8 val8 = DIS_TSF_UDT;
>  
> -	val16 = val8 | (val8 << 8); /* port0 and port1 */
> -	val16 |= EN_BCN_FUNCTION;   /* Enable prot0 beacon function */
> +	/* Configure beacon control for both port 0 and port 1 */
> +	val16 = val8 | (val8 << 8);
> +	val16 |= EN_BCN_FUNCTION; /* Enable beacon function for PSTDMA */
>  	rtw_write16(padapter, REG_BCN_CTRL, val16);
>  
> -	/* Fixed: Replaced magic numbers with defines */
> -	rtw_write16(padapter, REG_TBTT_PROHIBIT, TBTT_PROHIBIT_DEFAULT_MS);
> +	/* Configure TBTT prohibit timer with 100ms interval + 2ms margin */
> +	rtw_write16(padapter, REG_TBTT_PROHIBIT, TBTT_PROHIBIT_100MS_2MS_MARGIN);
> +
> +	/*
> +	 * Firmware controls early interrupt timing in power save mode,
> +	 * so only set REG_DRVERLYINT when not in station mode
> +	 */
> +	if (!check_fwstate(&padapter->mlmepriv, WIFI_STATION_STATE))
> +		rtw_write8(padapter, REG_DRVERLYINT, DRIVER_EARLY_INT_TIME_8723B); /* 5ms */
>  
> -	if (check_fwstate(&padapter->mlmepriv, WIFI_STATION_STATE) == false)
> -		rtw_write8(padapter, REG_DRVERLYINT, DRIVER_EARLY_INT_TIME_8723B);
> +	/* Set beacon DMA interrupt time to 2ms */
> +	rtw_write8(padapter, REG_BCNDMATIM, BCN_DMA_ATIME_INT_TIME_8723B); /* 2ms */
>  
> -	rtw_write8(padapter, REG_BCNDMATIM, BCN_DMA_ATIME_INT_TIME_8723B);
> -	rtw_write16(padapter, REG_BCNTCFG, BCNTCFG_AIFS_LARGEST);
> +	/*
> +	 * Suggested by designer timchen: Set AIFS to maximum to avoid contention
> +	 * before sending beacons on test chips. By tynli, 2009.11.03
> +	 */
> +	rtw_write16(padapter, REG_BCNTCFG, BCNTCFG_MAX_AIFS);
>  
> +	/* Save initial register values for reference */
>  	pHalData->RegBcnCtrlVal = rtw_read8(padapter, REG_BCN_CTRL);
>  	pHalData->RegTxPause = rtw_read8(padapter, REG_TXPAUSE);
>  	pHalData->RegFwHwTxQCtrl = rtw_read8(padapter, REG_FWHW_TXQ_CTRL+2);
> diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
> index b498d867ba21..7cecc0ca700d 100644
> --- a/kernel/sched/ext.c
> +++ b/kernel/sched/ext.c
> @@ -4258,7 +4258,13 @@ void scx_group_set_weight(struct task_group *tg, unsigned long weight)
>  
>  void scx_group_set_idle(struct task_group *tg, bool idle)
>  {
> -	/* TODO: Implement ops->cgroup_set_idle() */
> +	struct sched_ext_ops *ops;
> +
> +	rcu_read_lock();
> +	ops = rcu_dereference(ext_ops);
> +	if (ops && ops->cgroup_set_idle)
> +		ops->cgroup_set_idle(tg, idle);
> +	rcu_read_unlock();
>  }
>  
>  static void scx_cgroup_lock(void)
> -- 
> 2.50.0
> 
