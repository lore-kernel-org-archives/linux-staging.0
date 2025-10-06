Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BF618872A
	for <linux-staging@lists.linux.dev>; Mon,  6 Oct 2025 07:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759735818; cv=none; b=CS7OAve2Ad99o1qR6lMVROLh8Pf98Qsavzj1r5qXxQWBfQHWuznE0wyQgsRPDX8g1OPxy/7vO0bQLEKLUuS0VgBpfGr0ZhvL/74Oxc1lohFX46lCTm4ZTZVijEdMzOAHpnquJTIt1v1ZPPPoEHKiI6kaYu566xl6M5KsTOogtFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759735818; c=relaxed/simple;
	bh=ZQRchX5XNIjfkgA4fLsxerAd7QtYqk1aoXp2CVgu4dI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MU8L22QRIOrbnOspsaGJTlGKUh/YaLkdYKV4kQ8fVh2H+HTB2Rbdr5QBGYiua43Re+jY8PuamqvlzSJwDr3EwtTDrHibBjgpAHC/7z7GDqvwS/3QfddBt1FvOYsa9MKE3/cSxS1TCHZ9pZZBskl+1FUTr2evSbT5AcBnUHXrGDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JY35la19; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JY35la19"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-46e6a6a5e42so22597515e9.0
        for <linux-staging@lists.linux.dev>; Mon, 06 Oct 2025 00:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759735815; x=1760340615; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Uf4L8RA/IZXS6HOIL8R8teBc6YGCc1dTgFC5yo9YzMI=;
        b=JY35la19hIwfUqsl1RZzzh2ZcydDj+7P7D7BGSLLHcJG77t56jkfmsTzWBYrCA6KUF
         BzqEyyNNUE67SiUgk+aIiKUW5qdX567XGUj/cjuUdulTgdjSZW0E/ybgjYY23JJdzE7a
         gTiE8iDCtZtvveUDep00SIhTkXOCygKNNQUM98PFy/LA6BfnOAjYQ1yb37b/krm4CcJq
         XGv4xtgHu+I4y0iuXsycEMx7wAfwAKctfniB76wGCqMSSyeTGJ9NiMC6llDL+4/8c9qq
         7F6oY/HYH8inqCoXNh6QHY3fen1oPOKTrUa8AxXy+u5dc74JAAk2Ko5kq/rFsj5FRLdw
         JT0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759735815; x=1760340615;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uf4L8RA/IZXS6HOIL8R8teBc6YGCc1dTgFC5yo9YzMI=;
        b=nlLZPrsmWyy1uvl7eGnLXj11rY+3mxctbW9rr1FZOQEGzP/8LQmz0SnZJJdPuqOiRe
         ElkoHjQzL6Txn9p53ZoZYWuzt1XhwB7d1BgerC4uYI0dvtKfoNI0cqT2IrWfou4cgHMB
         Zoe5fLe1KabWh8QXAA3C9jAQ+4TNqIkPPC+vN7h5Gfb9UyZ8/gqQKMKvnaoCvA2PlnaI
         ZYg7rHUW1D/3LpnPIn1cpwAhDMfBKCiSff6t660eP/NJJT9jbtx3mowCfzyyhiyRZ6Ve
         VZPJVwpRIlEtKCbvn6l6lKwZw2lsBghuaLWXRdDB18cMMoMd1+5o1lYBqPF0PMM7DkG+
         ZC3g==
X-Forwarded-Encrypted: i=1; AJvYcCWsiclBsju76vX/ur5ONnRayxe+nO/FiwaA7HJngItIqeUR+1hrCqxXXKg97K3Eqyc0sRzyOV7ZT/T110Q8@lists.linux.dev
X-Gm-Message-State: AOJu0YxF9AwniTNpJgenI9Bz2SGGeKYXG/7td/QQ55UhYJ6AxnKbOlP6
	nCXrvvfwmoFQlWgOkLPNkylcrrGVC/Fy6DyQUMlKjbmRuKJHNo3ZYkkH6bZcOEjJTTA=
X-Gm-Gg: ASbGnctQdJtJeei/sJDWaxa0TVQOuFj83UYew2bIBRPiEEN15WAfbmNuJ9JfLYhG+wi
	sY//GHc6UtA/dZlBMgJZQFJE9OSvKR5kcpfVEoNMvR1S5WMLXbfb11odf8idRbbUg4JYVQYm3Gy
	8cUeSAhs3YgwdJzfJCsUkd43SZOm7mSS/TadbS9UIJx1KD3VR21MI3tV+oSA3sqgeJflPg0ezuM
	iPsNHQKKvx57wtIa7vzOgUZZUiL++y715o0jv/PHBo4ctEoMgOv4E/BQpZXMTU4keaLphffHNG7
	SUAdt7XAqbU0Vauxb0+jn8/mEk1nhay90UhKkKF6Wf+AFU12KwwspYYvSBfF2AchI97wxHqnCKS
	VrefBW52roPcQ2CHh/EeBzMh6JE/ZPD1d7lG7HrGuNaqx9KeUEaVgL0yA
X-Google-Smtp-Source: AGHT+IHiuM1xHkBMQnAT7uqFLgh/CgZeXvWiOZCyevwvHia0yK8WCmbmVIHa/xjRLr6XfhSV7yHHmg==
X-Received: by 2002:a05:600c:8b42:b0:46d:3a07:73cd with SMTP id 5b1f17b1804b1-46e7113f6f4mr71668335e9.23.1759735814631;
        Mon, 06 Oct 2025 00:30:14 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46e72374ac5sm161139725e9.18.2025.10.06.00.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 00:30:13 -0700 (PDT)
Date: Mon, 6 Oct 2025 10:30:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rohan Tripathi <trohan2000@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] staging: rtl8723bs: split long comments in rtw_ap.c
Message-ID: <aONwAXk2EcV9Bgrv@stanley.mountain>
References: <20251005155920.381334-1-trohan2000@gmail.com>
 <20251005155920.381334-3-trohan2000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251005155920.381334-3-trohan2000@gmail.com>

On Sun, Oct 05, 2025 at 11:59:18AM -0400, Rohan Tripathi wrote:
> This patch splits overly long comments that exceeded 100 characters
> into multiple shorter lines, following kernel coding style guidelines.
> 
> This is a coding style cleanup only. No functional changes.
> 
> Signed-off-by: Rohan Tripathi <trohan2000@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_ap.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
> index 93ab0015ca89..2c906c1137bf 100644
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
>  
>  		/* prepare for add_RATid */
>  		supportRateNum = rtw_get_rateset_len((u8 *)&pcur_network->supported_rates);
> @@ -655,7 +657,10 @@ void start_bss_network(struct adapter *padapter)
>  	cur_ch_offset = HAL_PRIME_CHNL_OFFSET_DONT_CARE;
>  
>  	/* check if there is wps ie, */
> -	/* if there is wpsie in beacon, the hostapd will update beacon twice when stating hostapd, */
> +	/* if there is wpsie in beacon,
> +	 *the hostapd will update beacon
> +	 *twice when stating hostapd,

Missing space after the asterisk.

regards,
dan carpenter

