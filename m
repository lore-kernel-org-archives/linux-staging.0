Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBD42D6612
	for <linux-staging@lists.linux.dev>; Wed, 19 Nov 2025 11:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763552216; cv=none; b=VXlg7t/eWZo/aX2EaBKqts+JLOWxp+g0oXZ3Zedp4GaBHppHfWaKizIDrRmcRSk39nlkKrfWrohNKZpjH4N6CKPfifh4It8xCHQnJo4EccO7FdC6wAzV6vklcelTybymT27GTlLEqSXGYeZ17pwmfubVCA+6Kv/qdqbah+sohR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763552216; c=relaxed/simple;
	bh=HEe8AlKbyrbex+A6CsUcwqdLVOWP1x9iesEZBUZLz4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WKbWcfOPfsrC62wDEOmXYvCkkNxjMtxuEANgPpU7AlWIfo9qsZCKUlkSvbWcibEKMApaf7sYEV4YhZdY19QVwpTZThgLzlPImEKUhAkbNZhuaFdAKLS00Rrpgl4WQgJi+u/sYHS9hb/4ugYpDmE9uhrSSrzbq5JFIeHrIpQY+9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N8kxBvQU; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N8kxBvQU"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so66195435e9.1
        for <linux-staging@lists.linux.dev>; Wed, 19 Nov 2025 03:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763552213; x=1764157013; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RaL6Q6a1Oa4RMEkF3Mz+hsRQDK/y2Ul63G+BJ3IdFOc=;
        b=N8kxBvQUhO9rcC41PS0my6PGt+hPuAh7B04dgNnBrQCMek+7X6ASjDQt1rvkuTia+u
         9zEOTsKvX8e6ub/dBbLy4syqL4o0FjlgPWoXE2wPmhaJMgyZcCgMwC5wfSAT0yrufkjj
         ILbttHxf783SKmtOlqCikX3KE0XvwW7OQiBBDheyFQywRndWYzrlLyyN7K/nOigvC0dV
         8E2LDCf7h60FvZibLjiwE7afWrndDfnYwIsVlu4HTjKg1u1Og1dXBuRQQKlX6iTMMs+t
         Zez2qgaEQOnGcOWkVBq2RrQPP6iVv5p2XW68Q+dl5a1AFQRRzywr4yMXOlaPpAeoqyV0
         x5Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763552213; x=1764157013;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RaL6Q6a1Oa4RMEkF3Mz+hsRQDK/y2Ul63G+BJ3IdFOc=;
        b=YqZoRexM7BpjHOAwJyoe8m+ejETKRnmGBfn2ntmElcbJPiMTs6DnSgyhguSGFJ8PWz
         +RG5JYEE1xhNBMxjJDT89rFj86Y1l1BFGdkyxFPQHRss+5ik9+ANhBwdkzA+xiOsGTBu
         nJIc+oXYV/aCB7C+y65/ueSjqkQ6aBoALQKeBl9xpxbpcr4nDOmP+3arsMsyzRWCB281
         ET8K6PCJAj4IAK7mhNB+IOHpfcHDbM5/vpLF8qHh3VMEIwqvbI3lwihAPgI9XYsfMQ7J
         0jZdZO8hTDzFJfbLM1jh6XZmv+fY5hmogScII9RAXWWwg5oZqlKDq623KEYwVGYQ61H6
         G+Zw==
X-Forwarded-Encrypted: i=1; AJvYcCUg9EoFS+x9JOix2ky6Eeyk3874IFv308O0mdziX4KlYgutcwyp0vwFBueXFTK7xYHoroTB8R+KyLyaoeQq@lists.linux.dev
X-Gm-Message-State: AOJu0Yyv7Btc1pqQKJmSCsKJZfBu5lY6x5DfqHAG2O4RAn/v2vM7wYYz
	QCCoRo9130IWng5glzoRYKKFnWtJhbj9iHwkGugDc2+HXusgGkgLi5t1vIyPvz3MY9Vh9KBluQa
	J67M3
X-Gm-Gg: ASbGncufDXN6UJQzEx8jUYW8OAkvzgA8IXWPpd8DXg1gHMRrBwco6lfoz4uUmC5aEAf
	jFrZy1auZuoKIyCdYnod8fuq8kclGdsXxvRyytqG1c5VyyGALObPd4AsWG9gt7BY+N9iqb9QTye
	l9adeKX+YS967EglCjbCAngBGGp64vjk8IqGwxqzUSRivo17zm0vIEygU+02cAcTvScBPv++aWv
	EhZfHNzvOzjF9jFry6OLDxaLrzM/gK4RP+PTJYLUajd3jvtf4foFMlMBQ/NqqktsJrc7vWjAACP
	k2yisMPv4OOD9TaIwR1IEPXCAgvRkg81sghUWvxw/JxoDnLDqk5bgsgOjGUXpY+8+5pqjw3eXcM
	Xaz0/Kb+/gPk1xfexeIpZX4FJL62U00UnGh+TxY/tu+1KGqvRsk5FeCF3HhXqoJYBBZE+0ts3LQ
	IWktKtbB8SDMzQnWXQjNMt/3LPVxBu/qB26IwqIw==
X-Google-Smtp-Source: AGHT+IGKzxpIxTQ09/24XQQfgBbswtyCPN9yb0OnwrHcCKGoBYyE+rS4RFO+foxKQf6JrZbxPtEmyw==
X-Received: by 2002:a05:600c:630d:b0:477:89d5:fdac with SMTP id 5b1f17b1804b1-4778fea1becmr219679975e9.31.1763552212408;
        Wed, 19 Nov 2025 03:36:52 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-477a9df8db3sm37495865e9.11.2025.11.19.03.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 03:36:51 -0800 (PST)
Date: Wed, 19 Nov 2025 14:36:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Artur Stupa <arthur.stupa@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: core: fix block comment style issues
Message-ID: <aR2r0A_fBj_w9JgZ@stanley.mountain>
References: <20251119062701.38279-1-arthur.stupa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119062701.38279-1-arthur.stupa@gmail.com>

On Tue, Nov 18, 2025 at 10:26:40PM -0800, Artur Stupa wrote:
> diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
> index 027b2dd0a4b9..a5234fdbf984 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
> @@ -133,8 +133,8 @@ u8 *rtw_set_ie(u8 *pbuf,
>  }
>  
>  /*----------------------------------------------------------------------------
> -index: the information element id index, limit is the limit for search
> ------------------------------------------------------------------------------*/
> + * index: the information element id index, limit is the limit for search
> + *--------------------------------------------------------------------------*/

We generally don't like these "****************" or "-----------------" lines.

[ snip ]

> @@ -1691,12 +1691,11 @@ void adaptive_early_32k(struct mlme_ext_priv *pmlmeext, u8 *pframe, uint len)
>  		/* pmlmeext->bcn_delay_ratio[delay_ms] = (pmlmeext->bcn_delay_cnt[delay_ms] * 100) /pmlmeext->bcn_cnt; */
>  
>  /*
> -
> -	for (i = 0; i<9; i++)
> -	{
> -			pmlmeext->bcn_delay_cnt[i] , i, pmlmeext->bcn_delay_ratio[i]);
> -	}
> -*/
> + * for (i = 0; i<9; i++)
> + * {
> + *	pmlmeext->bcn_delay_cnt[i] , i, pmlmeext->bcn_delay_ratio[i]);
> + * }
> + */

Delete dead code.  Don't reformat it.

regards,
dan carpenter

