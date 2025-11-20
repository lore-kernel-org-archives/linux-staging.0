Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D943E2F9DAF
	for <linux-staging@lists.linux.dev>; Thu, 20 Nov 2025 10:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763635248; cv=none; b=azTHN0BU0yy8lNEGDtUs1HnlsUWCUiQWmbArZqcXycT9wTN4Mu6vFmI9SWChSjodRvx//1yHHLj1EZ+3DJsrmuRt1OHn9nko/+hWrIuZk51Qg/jrmbpRZeIiMizoWOvySm1GXe3lxsUDn0Rqh6iaSuAy/nxiRN4QBuhN0+WsadE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763635248; c=relaxed/simple;
	bh=GMGaMl35cl3gruJ8HZbaPkx02fFLqNZps5aRxMSFSqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W2RZV3v7BcpHXcGCmRxYfOujbZWGmti5PHKnaP4Imi0xGIcCpWBeYK8Lzi8aNFuwcqLw7/euXjBFJcvlTr5gtOqKzuXYJyh7z/6tMIJJiORpbrFn05nppsoji2G0J10UV3JYfqL6dVj32PydCjrpOHciCgnRfBVEcLIgsttf2mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fVLFHxDo; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fVLFHxDo"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so5332635e9.2
        for <linux-staging@lists.linux.dev>; Thu, 20 Nov 2025 02:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763635245; x=1764240045; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v3BqOZoEimTRi3GpSzrBhmLEUccNnU0BKieAJ20s1/s=;
        b=fVLFHxDooez+Zxe1HNouKPWFoBB4InVw/u0jETw+lAcorSpbRluJ9EtxH3BnzTvjb8
         sY978myrNteQ18cRKnuC/pRzOOg+JzxtDgF/CR1F7/nMgt+JPfCf+9mk49S3xRCIs91v
         FRPoMYNOGzG7y6de3m2AEd48uF8q+Ae7RyZtGPhjRIUo60hygGQLr9HDRMD74CGl+7Ug
         2dXvpny8k6l1ZxVxCyJUjy5Prm7LtMgq9iEBn6G2JS8z3L7GwzhKun4+k0gwnvDoiJi6
         EGxdwSnlKA06PpFvrh4nZiwsvI6E27IQdn3MLqCECvS3Wk3WTOXXszyPAe0A2+aXULkw
         h0cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763635245; x=1764240045;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v3BqOZoEimTRi3GpSzrBhmLEUccNnU0BKieAJ20s1/s=;
        b=v7HkkJkZF+1o+Ip6th30+0JtMZEt0Jy9KQBcH3TDHXvkQf9YxL2bdAiOyibS86xLI5
         JY4YUl4+fFrS9eEKPca6Ka2Pjwx0bktE2yOFzg1P7QRSEFLPHwVvb+DZxAJTbnmX/tck
         kSEPY3hfXz8SKU7ND5z42SD6BNBDzpX/uTSUy/Sne5alI3SZ+PpF8ESh/0LoXyeHOOK0
         qtYnTTDjzrHTHuWa6Krsr92bRtqzwPD3YEKW9aaRc06OErXNibiZvIFDIgM3HEDcY0VG
         Ad7UEFjJ2T7cYgbMPk0GLaoM69uCu0HGJqM9VET3yIcRhpbn6VcpV7RgpcPGYAcEhKX+
         lehg==
X-Forwarded-Encrypted: i=1; AJvYcCWwb1NBNHuVsAdx9sdt/VzZtz7r7EmV12fAGPFF29CJDuOtWrKqBFekZLxKYji63Pwlp04pE8250yvK/5b/@lists.linux.dev
X-Gm-Message-State: AOJu0Yw39QYpTCKi5eNukAoidJdiF5XF417+pbhHK5ZDI0ktuoYsYZ+u
	fMt3GvsSV5CjePOo/bA/Hbjv1htNMqIy8Z8hzRuT5MP45Z/xknAywjfR6fkyWlC01Y4=
X-Gm-Gg: ASbGncuE4mZum30eUi2ma50dJpXzmTdn4j42Meh3qn8+aSnbRGsFJHYLmAad9I8p84Q
	Sp8MiqrsiV/qZ23h+yplCJ7WjZeXidiga5qlXLCziateg8pKuh/ARxAYqowYyxODykC3byWNHrs
	4V+k9Oq6LJ518HF55JydHdx1+6fo4xiXkhek484JA0sRFq88FVzC/f6AmmJAgLMq8eMlb0eUFjR
	sxwu3WmWERpyD5rldvErSHKgo+V/ay4A3d2OJXtuSpXznepInnTkvt9gl6meXw+Ab348FBsStfR
	SBBcCVysRa8HMxWLLCfa+1gC6OTo8hCPa4El7v/9L4OEHbTQyQY6SsNC7+tIEoxSZc6GK9XmNPc
	gLSgUdpKQ+L2fL9ngTZAczjF9DWBDzga0UDqRcBJxQXLJHkQb8pkKu97QJOGXCgAfJUnRzOiQjo
	m8CiHl2Y1IRBz0sqF+YLl3kfF1VsA=
X-Google-Smtp-Source: AGHT+IHty/HuzjLu9/WiPra12LT7uQxImJV4/vZ/HDU+/SS0ZeHyPK3dtYV4plPez1Cm946YXnrlfQ==
X-Received: by 2002:a05:600c:1d20:b0:477:7b30:a6fc with SMTP id 5b1f17b1804b1-477b8aa06f6mr34821545e9.30.1763635244976;
        Thu, 20 Nov 2025 02:40:44 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-477b8314279sm41631245e9.11.2025.11.20.02.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 02:40:44 -0800 (PST)
Date: Thu, 20 Nov 2025 10:22:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Artur Stupa <arthur.stupa@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: core: fix block comment style
 issues
Message-ID: <aR7Bu4ared9jg1ag@stanley.mountain>
References: <20251119062701.38279-1-arthur.stupa@gmail.com>
 <20251120002948.23153-1-arthur.stupa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251120002948.23153-1-arthur.stupa@gmail.com>

On Wed, Nov 19, 2025 at 04:29:21PM -0800, Artur Stupa wrote:
> +/*
> + **********************************************************************

I was going to ignore this ************** line, but

> + * Routine: Phase 1 -- generate P1K, given TA, TK, IV32
> + *
> + * Inputs:
> + *     tk[]      = temporal key                         [128 bits]
> + *     ta[]      = transmitter's MAC address            [ 48 bits]
> + *     iv32      = upper 32 bits of IV                  [ 32 bits]
> + * Output:
> + *     p1k[]     = Phase 1 key                          [ 80 bits]
> + *
> + * Note:
> + *     This function only needs to be called every 2**16 packets,
> + *     although in theory it could be called every packet.
> + *
> + **********************************************************************
> + */
>  static void phase1(u16 *p1k, const u8 *tk, const u8 *ta, u32 iv32)
>  {
>  	signed int  i;

[ snip ]

> diff --git a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
> index d1f6030799cb..2014998245db 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
> @@ -385,10 +385,10 @@ u32 rtw_free_stainfo(struct adapter *padapter, struct sta_info *psta)
>  	rtw_release_macid(pstapriv->padapter, psta);
>  
>  /*
> -	spin_lock_bh(&pstapriv->asoc_list_lock);
> -	list_del_init(&psta->asoc_list);
> -	spin_unlock_bh(&pstapriv->asoc_list_lock);
> -*/
> + * spin_lock_bh(&pstapriv->asoc_list_lock);
> + * list_del_init(&psta->asoc_list);
> + * spin_unlock_bh(&pstapriv->asoc_list_lock);
> + */

I had to complain about this.  Please, delete commented out code.

To be honest, it would be better to break this up into two patches, one
which deletes dead code and the other which changes the comment formats.
I wouldn't have said anything about that if it hadn't been for this
dead code.

regards,
dan carpenter

