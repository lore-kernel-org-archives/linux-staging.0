Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE051B4224
	for <linux-staging@lists.linux.dev>; Mon,  6 Oct 2025 07:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759735769; cv=none; b=LMP4VvuaxELaJVgUM+GV6yMkqPGY6YwNsmR+n+5M2Py9uoqOOISXRMMFUIWmC/2Xren8vz2Zor4WpDt0bVlJbtKk+rWfLg84tLObErWvdcOypmXdl/oIceYbdhNn7A76Lw/6BFfR1fWClHnKlRnilYnfw+zI1FK+YRGCJ4LQwwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759735769; c=relaxed/simple;
	bh=pcBAm+wm8c6AgGBg52xkIT6OpiZn0ht/Z5hua5dnd4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uEh3DhbDDp/rNG2VOIHXC7bWIGyJXffIAGxSV2UbOJvMzrE+4aV4EhOyDMyJ7y3RARu8HBhfVL/2CRIrUD4j5MMgFX6R6akUaWf26BlsP5ht56G+EmbwKRUtZsJv9PhkNVXZVCQPeC0EWwvaDZ+FdW4Djy6TZur34qGWRdndykE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aLKOvIUt; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aLKOvIUt"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-46e5980471eso22023185e9.2
        for <linux-staging@lists.linux.dev>; Mon, 06 Oct 2025 00:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759735765; x=1760340565; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9sghbtbNFIONQugpyNGOw93WuDTAMae0oqKLTraeLW4=;
        b=aLKOvIUtLeVstM9dWUX/3wykG2b78h9iO6V4WQ7WdhESeYj+0sq/zieqzayvYljbRt
         5G694YjemSD2acgDvVIxaDCcJFTfBy4LHKqRDbk9Ilj2e8mNssjTjXYscTH18ymh4o/m
         WWLHBTm3DFQQMVCCm0+sOnI04tJ7wL0W0cPAzBrPAEOW/PTGkYT0BZRm9z8Y84SkiavX
         JaZcsLbpoZWNYRdlH6WVMJGhJ1CZPz9k+o/rrn6JtrgAwIfhw3A8loMef8ujZkQlBSmg
         fTKS6j5gWYnPVr7euga5wAGIdTuI7N+SE279zNw+B4Fx7EguEMOrjqDIvg4q5LRXezDQ
         ohPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759735765; x=1760340565;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9sghbtbNFIONQugpyNGOw93WuDTAMae0oqKLTraeLW4=;
        b=BqjLWuE2/PUQvZBdGMQave9C0T/lN6Ch3mYyYFVXn0WhBt/gKTkS4bngwgRwGlOTWX
         zydQvDfPJKhXes+rEigmnrDxCkEh+bP1psXdgs9A/JRTSGUyQh0G8lKY+HuY9b1Tgc/G
         7S5t3vc3ipH8gtJSTF8XS573SKuG0FOHC5dFBkZ+JaMZ9dLLMvlUdEudnCVZ8IDgWtMM
         pEXbzF9blSxe7Gz6jiZijnuIrjDMlp77s2DjwbukPqeW15ZcRTTAc0JH6sbHCVJXG2Wi
         fOCARG7mEozppl0+Lia/YxhkxDDnKAiw5nVgSPVHi6t9NaE0PUJ3aU2fOf9qqbxw0BCh
         Wd1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUyq7OHjLlC3FS+Ybr+L16CmxU2+jDoq1uTl5x3bHgiB73uoEfEXOjsPdmgdd7dTN6OmEBlNvddS9UOdrng@lists.linux.dev
X-Gm-Message-State: AOJu0YwPU4WbSwWQIqzlso2Azs3tGgzLCkaSk59bLW3GLujgCoi4WKeK
	aSMKWM+4u5wSVotnOMrg5HwUv9X8zvqAZ5bKj/aXm6+Pr3TD+qz2AQqDmOLe+dmpy4o=
X-Gm-Gg: ASbGncsyRnNUu4djSpmzwl9Lfj62A5sgnIwmBlkyPV/E0Lf+81RmKP2LnPO/38oR8+G
	s0R8RS5G0pQ6+c+CJHaBopGZe2DxL1Fdsd/LxH8NMJ1vSoXbIUdCMSwzO3Fzyy2r7+kL40SCRO5
	nHBuLuTvLH4rJ3PbhlPZetYkQClN44waJ7oWk6St5NRjbtycNZDwJlMEBQUgbN/OsmdvNDcRZhJ
	Delgbr4udGRMQ7+Fi/LkqK1komchlsl6IcToTaJeBDT7RZnlQXkK1woVAaGngr8xsIiJgE42FAM
	ajOg3pVTo9eFQ/2AV6nmGtvngxDd2pAoFJGAQ4UbucfyLnCfuN2ixI005gtjqDBCTUtD8HbIasb
	eNLDetbQc0XG6NP9LL8EgzLe8wYcXytGrQWZZOhsCNijQuHARKDUBLlKhhJ5ylwn4feo=
X-Google-Smtp-Source: AGHT+IGO0iR1Dm38qNqAUxs3JVr09b3dfZJrEsZ7XuRj7eZYj72+1AemzTj/wV9N9lOXV9YTsf+chQ==
X-Received: by 2002:a05:600c:4ec6:b0:46e:1a14:a81b with SMTP id 5b1f17b1804b1-46e7115b667mr79587095e9.36.1759735764818;
        Mon, 06 Oct 2025 00:29:24 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46e723432c9sm144973015e9.1.2025.10.06.00.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 00:29:24 -0700 (PDT)
Date: Mon, 6 Oct 2025 10:29:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rohan Tripathi <trohan2000@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: clean up style in rtw_ap.c
Message-ID: <aONv0JIZNA2GPzKG@stanley.mountain>
References: <20251005155920.381334-1-trohan2000@gmail.com>
 <20251005155920.381334-2-trohan2000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251005155920.381334-2-trohan2000@gmail.com>

On Sun, Oct 05, 2025 at 11:59:17AM -0400, Rohan Tripathi wrote:
> This patch fixes several coding style issues reported by checkpatch.pl
> in rtw_ap.c. Changes include:
> - Removed cases where lines ended with an opening parenthesis
> - Broke long comments exceeding 100 characters
> - Fixed alignment in multi-line function calls
> 
> These are coding style cleanups only. No functional changes.
> 
> Signed-off-by: Rohan Tripathi <trohan2000@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_ap.c | 270 +++++++++++-------------
>  1 file changed, 123 insertions(+), 147 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
> index 0908f2234f67..9aa225bcf9d6 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_ap.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
> @@ -391,7 +391,9 @@ void update_bmc_sta(struct adapter *padapter)
>  
>  		memset((void *)&psta->sta_stats, 0, sizeof(struct stainfo_stats));
>  
> -		/* psta->dot118021XPrivacy = _NO_PRIVACY_;//!!! remove it, because it has been set before this. */
> +		/* psta->dot118021XPrivacy = _NO_PRIVACY_;
> +		 * remove it, because it has been set before this.
> +		 */

Just delete dead code.

>  
>  		/* prepare for add_RATid */
>  		supportRateNum = rtw_get_rateset_len((u8 *)&pcur_network->supported_rates);
> @@ -436,7 +438,6 @@ void update_bmc_sta(struct adapter *padapter)
>  		spin_lock_bh(&psta->lock);
>  		psta->state = _FW_LINKED;
>  		spin_unlock_bh(&psta->lock);
> -
>  	}

This is fine, but it's unrelated to the rest of the patch so it needs to
be done as a separate patch.

>  }
>  
> @@ -480,14 +481,13 @@ void update_sta_info_apmode(struct adapter *padapter, struct sta_info *psta)
>  		/* check if sta supports rx ampdu */
>  		phtpriv_sta->ampdu_enable = phtpriv_ap->ampdu_enable;
>  
> -		phtpriv_sta->rx_ampdu_min_spacing = (
> -			phtpriv_sta->ht_cap.ampdu_params_info & IEEE80211_HT_CAP_AMPDU_DENSITY
> +		phtpriv_sta->rx_ampdu_min_spacing = (phtpriv_sta->ht_cap.ampdu_params_info &
> +		IEEE80211_HT_CAP_AMPDU_DENSITY
>  		) >> 2;
>  
>  		/*  bwmode */
> -		if ((
> -			phtpriv_sta->ht_cap.cap_info & phtpriv_ap->ht_cap.cap_info
> -		) & cpu_to_le16(IEEE80211_HT_CAP_SUP_WIDTH))
> +		if ((phtpriv_sta->ht_cap.cap_info & phtpriv_ap->ht_cap.cap_info) &
> +			cpu_to_le16(IEEE80211_HT_CAP_SUP_WIDTH))

This isn't aligned correctly.  Use a combination of tabs and spaces to
make it exact.

Same for all the rest etc.

regards,
dan carpenter

