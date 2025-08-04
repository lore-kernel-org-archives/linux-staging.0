Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD1D236457
	for <linux-staging@lists.linux.dev>; Mon,  4 Aug 2025 07:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754292285; cv=none; b=rwLzwtBcNmnFMz0n2XkDsag9aVlYFdZa3XhVMWJvV7D5d8954fDLXsS5heyYMC9MObFNTDvXTk2i43Lq9I+MjoIUPiPflt0WSaQUlgcuCMav7auIXOekUsRdjRlxeIl/j4yY6Q2afOIQW88N/sgDpPvVDIAXvV7IWlve1NLAP/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754292285; c=relaxed/simple;
	bh=XWtjRhyFGtSMgU75Qo8HzINVTcRu83OsFZ7jn2WU01Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gWK5osmtzDT3YtFRpuxjFmvleHhwLgSycr/UG44hPRmAxvP+84mmxH/HkNcMThJrO/1HEoPdkuCZg3HpZZ0PdrbB2/oQ7SzWdhOXcAxYYXmp8WuBngOQSpXgRyJgWCqDOgqpZBY1T1J4H7QpyOjnPh/yfCsd/XV+s0FjKbGcJZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q9Xr7YzL; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q9Xr7YzL"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3b78d729bb8so2536710f8f.0
        for <linux-staging@lists.linux.dev>; Mon, 04 Aug 2025 00:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754292282; x=1754897082; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Lvi8rCzqObVJLZvvXNQBcel/tdq7v0CEvvqSiXWylFA=;
        b=q9Xr7YzLK6avyD9NS37ZGaCUBYzCJ5eMI4wWLrr5pnWPtgBCD+kUv9yk+zIfDYBzI6
         tWpekifp5puqa4wY9jJR7kEfIVR+5CCH4M62D/xqTz0GFBhFz7ULOYqB2XSjiqUqqbUD
         Y+qGj8XdpKMJuIpC+DCiGeQDUSG9bn6Qn3SIg3J8NZlVcOJcDYfNZXhcZZikYwDPl8jB
         YUP2dMllTgnV2Pml+LRuZiysx9I3esgKnB8z9z34Qu95n/KQhENYGoWE0KIwMWSGL9uJ
         ETFkA3/W7xyGXqGwO7s938/ve862XINTu8Rmo3tZdcHYgZzFtScZog3LlGsRRL9Bp1WE
         J9zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754292282; x=1754897082;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lvi8rCzqObVJLZvvXNQBcel/tdq7v0CEvvqSiXWylFA=;
        b=HeWUPU2fCH3mcmfUVfr6dDuZcF4HUqJNviZx5/CUim5OvFNLMTkGL5Mig0VgQOe0OS
         ut0Z0VbVorGh89Z0updUkQyoak/WPQw4Uxr8ooW4jzDUG8uQzgkF3rQFQziPK+u6wHGZ
         cB+LoW9mOmwG8QsHkXnOj2gEpZafRp8+J7zyYR0dbF8EcyBYz7j2ItLCExg7FGdx546n
         xx1b/NAu1mAXaNrzCvG126M5oRO2ffeTOSwImD0kBY7aE8o5ElkjiXBDJl+xkZpn5OG9
         YA59f3oe/FVU4ioVZPq3aEDq/3zAhYCG04FvxgpliCFtYh3BH0AoSPpEEsWb0Sj9Y2v5
         +sKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVesWrgZLXn0jBZn71ijW88tV7UTmmCf5m8zoQXsEhS7IaNa6/lPjJ0AfDzVsIPaTbcOwvkSUFN9ctHxV/u@lists.linux.dev
X-Gm-Message-State: AOJu0Yymw9tUofpKGu2e9BycceXiiXwoI6fkkMVCbUIzGrODQASot8EA
	Tfwbm7oZ7dwPvH7wzsbk7aHZd4hngj7lCT13HADexdxd4ixW1VLhoPG/VB2bqaKmTlk=
X-Gm-Gg: ASbGncs+Fo7ptFJ8Wg0TUcNlsNiYG5OgNsKf9h9mBgynsIKBFt3sv+4x3I26NqWBUle
	6X9a45Xcbjmv9rSDuSbjK44Yk7p4k3vNZ4j+/BqqGI+oozyJiRFNAYKq7phoV/rYbqYfyNrUGy1
	KROOaf0HKhtSsizXZZoTBq3D40dCjsCkEsHfrS07FdkJnStr26sl4RHyUFCa6odE0So8BL+E3bG
	BaafU1N0HqoM1Uae4aPhVgIB/9aTKv/KsIWq+FEsHdpA5G9F4ezGqJEmLP3/l3ncZSjwFtnWWzk
	HpPruTfeRFGNsVsbhiEDBiYPfanQ4KGO+m5lE7MMoa2BL49M5Ry0va8vrAbEQ4R387e5/b74J30
	coP9r37Weiz6Z0bRrfs/AuUtTMiw=
X-Google-Smtp-Source: AGHT+IGaKiGYddlZGJxQ0gKkv54gzbG/vUiDv25L7era1kHjndhgvtyTFrFPdkjkibNNsUPkq8h8Rw==
X-Received: by 2002:a05:6000:2889:b0:3b7:994b:8438 with SMTP id ffacd0b85a97d-3b8d94c58b0mr6729079f8f.46.1754292281790;
        Mon, 04 Aug 2025 00:24:41 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459ded356b9sm3338485e9.12.2025.08.04.00.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 00:24:41 -0700 (PDT)
Date: Mon, 4 Aug 2025 10:24:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: 15620332615@163.com
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	philipp.g.hortmann@gmail.com, samuel.ogbuji@linux.dev,
	hansg@kernel.org, pkshih@realtek.com, rperis@google.com,
	andy@kernel.org, vivk.balachandran@gmail.com,
	=?utf-8?B?5p2O5Y2T54+p?= <lizhuoheng@kylinos.cn>
Subject: Re: [PATCH] staging: rtl8723bs: fix 'no space before tabs' coding
 style issues
Message-ID: <dbefdd16-782c-434f-aff8-b71848584d5d@suswa.mountain>
References: <20250804014013.12899-1-15620332615@163.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250804014013.12899-1-15620332615@163.com>

On Mon, Aug 04, 2025 at 09:40:13AM +0800, 15620332615@163.com wrote:
> From: 李卓珩 <lizhuoheng@kylinos.cn>
> 

You need a commit message.

> Signed-off-by: 李卓珩 <lizhuoheng@kylinos.cn>

[ snip ]

> @@ -2125,8 +2125,8 @@ void rtw_joinbss_reset(struct adapter *padapter)
>  
>  void rtw_ht_use_default_setting(struct adapter *padapter)
>  {
> -	struct mlme_priv 	*pmlmepriv = &padapter->mlmepriv;
> -	struct ht_priv 	*phtpriv = &pmlmepriv->htpriv;
> +	struct mlme_priv	*pmlmepriv = &padapter->mlmepriv;

Just delete this tab.

> +	struct ht_priv	*phtpriv = &pmlmepriv->htpriv;
>  	struct registry_priv *pregistrypriv = &padapter->registrypriv;
>  	bool		bHwLDPCSupport = false, bHwSTBCSupport = false;
>  	bool		bHwSupportBeamformer = false, bHwSupportBeamformee = false;
> @@ -2200,7 +2200,7 @@ unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_
>  	u8 cbw40_enable = 0, stbc_rx_enable = 0, operation_bw = 0;
>  	struct registry_priv *pregistrypriv = &padapter->registrypriv;
>  	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
> -	struct ht_priv 	*phtpriv = &pmlmepriv->htpriv;
> +	struct ht_priv	*phtpriv = &pmlmepriv->htpriv;

Same.  This tab doesn't add anything.

> @@ -1124,7 +1124,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
>  			pstat->flags |= WLAN_STA_WPS;
>  			/* wpabuf_free(sta->wps_ie); */
>  			/* sta->wps_ie = wpabuf_alloc_copy(elems.wps_ie + 4, */
> -			/* 				elems.wps_ie_len - 4); */
> +			/*				elems.wps_ie_len - 4); */

Delete this dead code.

Just go through all the patch and figure out the best way fix each of
them.  You'll probably need to break the patch up into a series of
patches:

1) Delete dead code
2) Delete tabs
3) Delete spaces before tabs

regards,
dan carpenter

