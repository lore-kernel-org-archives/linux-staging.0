Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C203FB074
	for <linux-staging@lists.linux.dev>; Thu,  7 May 2026 13:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778161230; cv=none; b=W0WhWJSz/62iTr2wEkr4BM8qy2aJ+56oX9nr/CtjB5Udt9xNaV69S4kvsjKIRYUcXNL6gg+7eeq03iHYnz0uvvHpCpjnW6HPkR16SWVu+OU7IjcOzrpPAfm95bnzJ+WSlSvbvCLfkbnB0miwC3a4tQCJMgUllQWFKA9BB3DLWkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778161230; c=relaxed/simple;
	bh=+5Y/fGdCgomxhu/5J4RBAqx4J6pEF+x+uObVxTIeefQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WlofWaswaIDReGjMeTtbFOgLSrh5X3YErs7C8gGafxTGZagkRESYFSLWyET4+u9LLQsjFNyknWq9iTt0oUoIE+a91SvuZem8Co5OzY1bx17jYfkS2acP9a5qpGtoSAapDppRRjb8k9FOttyzye96ajAymm6NnddXo8gJAiHPDkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EzmUpuOR; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EzmUpuOR"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a858881ad2so867061e87.3
        for <linux-staging@lists.linux.dev>; Thu, 07 May 2026 06:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778161227; x=1778766027; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZYWpxniz0+OvEuP0nr4/rQG/zCJ5t00/Xi1x/KmCsIw=;
        b=EzmUpuOR6cp574hJsplSZ3O3akg3BTo2h/7aa/RAHi98dDf4QVZ1xnWraarLbuys+q
         H84qXUbL52mMzvORZEqyLOSQILumZiNZ290U/GcVBqWJYCmlFJJcSUaoL3UDSXv2Rh8x
         ZxBlqqpozkJ9X9SJqWb29Ub2sd5BDnqmX/y5uItAhz7+M6ECtt3CBWbterVoVm55Fq2v
         Loh9KgBoaWDGMkVAMbDTrMwNppIT6y6z0/17h8wI6eH34woaNARN/2YwD3fup/RLO/C5
         kRURVdLbnp1YWiflGwRVxpTVD/3tNjgAfSOW5YIYXSMP6nlxA/JN9d5yOnwbK5xLOVPf
         qfLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778161227; x=1778766027;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZYWpxniz0+OvEuP0nr4/rQG/zCJ5t00/Xi1x/KmCsIw=;
        b=ApP7jKt5/UZArcVg5K/+falAQbXhb6JC1BmyTBHlejZShhZIEI6TFlTUf3tbxeupYq
         buaQRUOigto5KC4vwP4YB6Ez4bGd8kxgw2Mjl1H+7rUIRY9XY4OM/Ztj+aa8PvflMi4+
         FRFx9t60ApMoUl1gp9IbK8nDSxgSuOOQzPqUMRIJwNk8leUNfSm/f1p+kI1ILf2Fruyl
         lzMOG+J+A9G0atDfLk6AZhw3Vk60RudoaSa1W79PUzxc27i7aKf6lHcl+TPLdTt7091u
         lvxriWsmSntzb3R56HU2zxDtg8yK7iHWJxubJXpC/WFej2tuukNeKED0zs/HZC1lGTmP
         0CZw==
X-Forwarded-Encrypted: i=1; AFNElJ/cGXJvTitvR8kKoHhGDIYIZ+Ug85j5wFgFv4RFQpiyInlE4G45NAf98KA3t8DsS7afp1RCOA+zjMZjedFE@lists.linux.dev
X-Gm-Message-State: AOJu0YyMFEPuRDbcP5cXuuDaC6qsZjFdPI8xrXLy7vWsVDUy/NAakxmj
	QkM4HcknNtusUlFy7MCzs2iffbV8KY+hDGaYoRl1Ruj4Yd1sNY2E9OBa
X-Gm-Gg: AeBDievD1BkFG8qrCWKcnT9/GAOljyqBb+7dwLJfh5SmL2q/xU9WN5jVVBnzFx3k+GY
	a4MLG+z8DCBnDvtmjMz6/YlP5lg8qxKz5I+PyoXfN0wamJ7uUeMhB3de0hTalshQu2SotpHk5zE
	Ia53CrmH6J73+rRtn+9WpZJmQ8Ocsewz8SeeRRRyAF7OAFJe3hUyrliuH9dXOx7u5HE59iT5AZt
	EdEEoJ4d3hN68CmAwP17LLkNskZOrOlIePRkhZZ9y/S1IxPbF6EisxWIbPfU16eM1bKGddpml2C
	itQBdYA96rvrgrDaQ8tiX8szDtDxoaqEHOavQ+LvI3FjOEqpiGg2Srn/ChYd/YVhpTRJSnLk2MI
	ReB20sKPnk00eyW6WoHNGK99Pszpi/tJSzr102krqcSJCJFkKqinoRuWzpafzFw/8jI21qnbnna
	8G4rahZN102TkOji8vrwAGkAAvieHQQxjEwgs=
X-Received: by 2002:ac2:4c48:0:b0:5a8:6e82:6840 with SMTP id 2adb3069b0e04-5a887cde953mr3927186e87.20.1778161226832;
        Thu, 07 May 2026 06:40:26 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a864c6f16esm4890146e87.15.2026.05.07.06.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 06:40:26 -0700 (PDT)
Date: Thu, 7 May 2026 16:40:23 +0300
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Mohammed Sohail <mohd.sohail.biz@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: simplify NULL pointer checks
Message-ID: <afyWR6t36zIH7q3j@archlinux>
References: <afcUjiVlxZIj3Ma0@archlinux>
 <20260506190201.75571-1-mohd.sohail.biz@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260506190201.75571-1-mohd.sohail.biz@gmail.com>

On Thu, May 07, 2026 at 12:32:01AM +0530, Mohammed Sohail wrote:
> Replace ptr == NULL with !ptr in rtw_recv.h and ioctl_cfg80211.c.
> 
> Improves readability and follows kernel coding style.
> No functional changes.
> 
> Signed-off-by: Mohammed Sohail <mohd.sohail.biz@gmail.com>
> ---
> v2:
> - Use real name in Signed-off-by as requested by reviewer
> ---
>  drivers/staging/rtl8723bs/include/rtw_recv.h      | 8 ++++----
>  drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/include/rtw_recv.h b/drivers/staging/rtl8723bs/include/rtw_recv.h
> index 8e45871f07f0..9c32d480a20a 100644
> --- a/drivers/staging/rtl8723bs/include/rtw_recv.h
> +++ b/drivers/staging/rtl8723bs/include/rtw_recv.h
> @@ -349,7 +349,7 @@ s32  rtw_recv_entry(union recv_frame *precv_frame);
>  static inline u8 *get_rxmem(union recv_frame *precvframe)
>  {
>  	/* always return rx_head... */
> -	if (precvframe == NULL)
> +	if (!precvframe)
>  		return NULL;
>  
>  	return precvframe->u.hdr.rx_head;
> @@ -362,7 +362,7 @@ static inline u8 *recvframe_pull(union recv_frame *precvframe, signed int sz)
>  	/* used for extract sz bytes from rx_data, update rx_data and return the updated rx_data to the caller */
>  
>  
> -	if (precvframe == NULL)
> +	if (!precvframe)
>  		return NULL;
>  
>  
> @@ -387,7 +387,7 @@ static inline u8 *recvframe_put(union recv_frame *precvframe, signed int sz)
>  	/* after putting, rx_tail must be still larger than rx_end. */
>  	unsigned char *prev_rx_tail;
>  
> -	if (precvframe == NULL)
> +	if (!precvframe)
>  		return NULL;
>  
>  	prev_rx_tail = precvframe->u.hdr.rx_tail;
> @@ -414,7 +414,7 @@ static inline u8 *recvframe_pull_tail(union recv_frame *precvframe, signed int s
>  	/* used for extract sz bytes from rx_end, update rx_end and return the updated rx_end to the caller */
>  	/* after pulling, rx_end must be still larger than rx_data. */
>  
> -	if (precvframe == NULL)
> +	if (!precvframe)
>  		return NULL;
>  
>  	precvframe->u.hdr.rx_tail -= sz;
> diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> index fd3bae31b0ed..8ae3adecafd9 100644
> --- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> +++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> @@ -2429,7 +2429,7 @@ static int	cfg80211_rtw_dump_station(struct wiphy *wiphy,
>  	spin_lock_bh(&pstapriv->asoc_list_lock);
>  	psta = rtw_sta_info_get_by_idx(idx, pstapriv);
>  	spin_unlock_bh(&pstapriv->asoc_list_lock);
> -	if (psta == NULL) {
> +	if (!psta) {
>  		ret = -ENOENT;
>  		goto exit;
>  	}

This does not apply to staging-next.


Thanks,
Nikolay
