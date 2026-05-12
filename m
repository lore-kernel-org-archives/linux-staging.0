Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B614349CD3
	for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 11:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778586914; cv=none; b=Vm2cg5jrmWtfpdIwApZg73mPWvLuCIRQDLzIGOSyFYBvX51g8Ml1/V/b5jrx4RW+XWdu/ZzIrmC6sq3xb4vQgwUtfL0M/IKFw29KazsgZ9TfLEtZOec3+anDd2aLQ8eMLxsRbRGCmagCHPtWGvp0U8VlpnsdkGHrXz5qqk2iNo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778586914; c=relaxed/simple;
	bh=3pSQsQHYVTW7+KRXHIcIg2Do+tnAq9phi2FcXevjWYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LJQ4uMtCeE+9zNNqGiQrNdlA7t8ekBDaUlBWoVsRKD77LUZ44ZPlDWWcbRI1POf/AYTRHsmi8+c4ylw70Pi8LF2hB9d3ddXu8MlXPRF63QqSw6g5rngwHuvJuw72U1q11zpTceg1PaEPzQW+Ttr+fg7g1m5yeGq4+3dYsxCLnrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oAH4Up65; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oAH4Up65"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso59381135e9.3
        for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 04:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778586911; x=1779191711; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eU4FV96CerSlsET7AI/qVZr6xvTD9nNAKpYXzn6pQkU=;
        b=oAH4Up65lxm64HiD2A7/tmCrqInR8XE5GXsftYmS+pTlvw8L57ippaTNcTxsoQ7bSr
         Cd8DrdXq3H9+iVD05WcbirgQcpjZDiK4hyMKWe7MCTCyX9rvkpv1JEIJrYciOaLcOmD2
         JjlXcqoxylyhc+SOH6kotpRnyyIIbXO7AmrOS6WNegV/7AuvoRouH+jzKIusuu0zbkLj
         XXx06ZfvyDsSHrLUKNpURrU4XJbpNlum0iRfGM99XX/ol7fenny7Ai8guNDhLApG5Hln
         SZTYCev/PZ7R8WU1xa5ytgc9tNQLpme7abvHvCnYNYk5bZfDiy1hBONhqqfQ/t9ILEm/
         M97Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778586911; x=1779191711;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eU4FV96CerSlsET7AI/qVZr6xvTD9nNAKpYXzn6pQkU=;
        b=agr/+4JbZcAJwTqHAQzaKKS8tEZUUoOEqbsTGqHF4rif+CkwJGLwG9Z7R7Z+94bxE9
         grbpfObUQjIJpnZnL1Zn1smw42PGovP6RSpEgnsJyRJNBddcdXvlE59NJM3jT8+O/54f
         2wZ2dwbeXUum24NYTaouNMYdps9pdP8KH2jKTOVmlwvSKG+a3HJ6mpYrAFAhfnfzNBuE
         n/ijDHD3EJkkeSNVl0scZcnnT7lGEXAlpbU5p2X5pji9Lcl8BQ2KHOgIFnCYQn2FJ+iA
         3dbDR4RVMUUYlMenSWufTpAx3nf+j3Qegmpd6qgEd28heZrHqvsVV7WmNT/taXP5IU8b
         iy9Q==
X-Forwarded-Encrypted: i=1; AFNElJ+VgsN2qRosUha2aDmF0D66JFzZhLkF20HtCpHj3bUJu/MLBjnSUPHMwJCKXrQZvmk4hSRcH+JLSxtZQ+qg@lists.linux.dev
X-Gm-Message-State: AOJu0YzFUTZHQmP0PI4gg5cytHnhTTFGKW/o7FvWV/QyDOv/qkCwzI0K
	cANyCv3Uhy/fGV9AZnMHvKOUAWmvUJbl23lHJjAmy+eM840IPYn1GtB7
X-Gm-Gg: Acq92OG/NBnl/MCi7M5iGgkn8I4XTMLSXXpQIictLht7yJaIL6jJnIngrM8CvhYE2nq
	zsAEbvrNz1QFpvyhowB2sh/gVRa8DPazvfqglpfN1p2kWFwBuD9pJa2hiTX1IEjIW+c8/GMmCn8
	X4QeSnoeNweu2x6V7A8AxMjFcCObETHrcL4fHuTSCmYWpjBTLdENgNNhPxwSXVt9DOpZXI30w0D
	QQef+LqWaXLdPQJGsiWUI9BNM8AO9LE4YaCdcdQCeyAZgkq7FU0e0tCnhkHDp8iymOx38AW4DWn
	6PXJJoNoR4jMxHMshhUKFzmLYNL62L+E6J0G+rU9dh0FueITMt/YNBaYyqKDVz1oN27P8dKw5pt
	Oi81gLslAdkcLwvSobcbduAn/c5mKNP3izdZuVt4WbgMNumAuv0a3LB0Kru6KdBwtqAiqnmk8o/
	6HOxknhB+B3+SsMhkLWAaoHN5V/6Q6Ig==
X-Received: by 2002:a05:600c:8888:b0:48e:8dec:19ad with SMTP id 5b1f17b1804b1-48e8dec19bfmr42830975e9.12.1778586910379;
        Tue, 12 May 2026 04:55:10 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e9055ec3dsm38923785e9.0.2026.05.12.04.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 04:55:09 -0700 (PDT)
Date: Tue, 12 May 2026 14:55:06 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ashwin Gundarapu <linuxuser509@zohomail.in>
Cc: gregkh <gregkh@linuxfoundation.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-staging <linux-staging@lists.linux.dev>
Subject: Re: [PATCH v7] staging: rtl8723bs: remove unnecessary braces in
 rtw_mlme.c
Message-ID: <agMVGqScOsY-X_4f@stanley.mountain>
References: <19e1c077ee4.2272059b46402.3689085453526247548@zohomail.in>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19e1c077ee4.2272059b46402.3689085453526247548@zohomail.in>

On Tue, May 12, 2026 at 05:21:53PM +0530, Ashwin Gundarapu wrote:
> >From d60236e3784e4258a7fe5e173d603d2b05d2af21 Mon Sep 17 00:00:00 2001
> From: Ashwin Gundarapu <linuxuser509@zohomail.in>
> Date: Thu, 7 May 2026 21:29:11 +0530
> Subject: [PATCH] staging: rtl8723bs: remove unnecessary braces in rtw_mlme.c
> 
> Remove braces around single statement blocks.
> 
> Found by checkpatch.pl --strict
> 
> Signed-off-by: Ashwin Gundarapu <linuxuser509@zohomail.in>
> ---
> v7: Added version changelog below the --- line as requested by Greg KH.
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> index 9cf1c95dd924..c14b8dbd478b 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> @@ -483,13 +483,13 @@ void rtw_update_scanned_network(struct adapter *adapter, struct wlan_bssid_ex *t
>  			break;
>  		}
>  
> -		if (rtw_roam_flags(adapter)) {
> +		if (rtw_roam_flags(adapter))
>  			/* TODO: don't select network in the same ess as oldest if it's new enough*/
> -		}
> +

Nope.  Please be more careful.

>  
>  		if (!oldest || time_after(oldest->last_scanned, pnetwork->last_scanned))
>  			oldest = pnetwork;
> -	}
> +
>  

You're introducing two blank lines in a row.

>  	/*
>  	 * If we didn't find a match, then get a new network slot to initialize
> @@ -2410,9 +2410,8 @@ void rtw_update_ht_cap(struct adapter *padapter, u8 *pie, uint ie_len, u8 channe
>  
>  	len = 0;
>  	p = rtw_get_ie(pie + sizeof(struct ndis_802_11_fix_ie), WLAN_EID_HT_OPERATION, &len, ie_len - sizeof(struct ndis_802_11_fix_ie));
> -	if (p && len > 0) {
> +	if (p && len > 0)
>  		/* todo: */
> -	}
>  

Same.

regards,
dan carpenter

