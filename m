Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A69429B8CE
	for <linux-staging@lists.linux.dev>; Mon, 16 Jun 2025 10:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750071139; cv=none; b=V7EWBa+u63eJGoS5OxcIqQLa8F7lvLKR2hDYmoCT/eQWB0AO3PSDT9tJm433KigbBUjN8fGl+8NK94BKGem3FL/fmoti3uNEMtKQWX71u8sr8NJZ1m/XsyrYKGGPkqQOr2sq7WEHR7Jp2fQFa3oV5uptBkjojTIBRGJu+M1l3cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750071139; c=relaxed/simple;
	bh=pRtjn2ajpJjDDgnbUTZy/EBQ+X/hcS8YWC9E3N75B2k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OoTaT/GHd+wsZQ3snelqiAJeeSfjRpwuQ+fx7ZYCQjpRJ/1JbyuRqCHw23kOtup6aExi0MpJiZbtmAAmjF8XPM6L/A/xl6hLbHEhilr0D3M1MEYoT2IWNzgcsu9CO3w4mHXp1Q38Lyenuu26ijmIj9P7m3UYo0Gn1qc70fmCjcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=InLWoMdU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="InLWoMdU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750071137;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hk9Uc/UNTVqG7C07kBMIdRJ3hUm2mx5PXQsfSHyh+9o=;
	b=InLWoMdUtqlU7zBBq/snUS4WJLbJX9t74nrIF7NeyIn1MftTfIohFawhvaZ7OKxs3hgywE
	PbBd+UE+42aktYif0bv4Ue8Wfa5L9Q3SwrgrZX0MOZjkmjh11C5IAhePXsuAYC7jnyrBB9
	GSwwiIjnirtLJIl/ZoqipGygx70a+6Y=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-351-peAIi1LEP0S48gCgp2VD5A-1; Mon, 16 Jun 2025 06:52:15 -0400
X-MC-Unique: peAIi1LEP0S48gCgp2VD5A-1
X-Mimecast-MFC-AGG-ID: peAIi1LEP0S48gCgp2VD5A_1750071134
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ad9a8a5ecc6so341978966b.2
        for <linux-staging@lists.linux.dev>; Mon, 16 Jun 2025 03:52:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750071134; x=1750675934;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hk9Uc/UNTVqG7C07kBMIdRJ3hUm2mx5PXQsfSHyh+9o=;
        b=VrH1LjdIaq+eAsw11JBhvwMZdBBWuWVGWn+CWgErcQ3KZv5w5v2XZ8lPWmlwK00gCn
         Yd/GTe66mQ+C6e2vxUvE1fuBVwO9QVY78F0zRrGd6dHiOhYNCWyFQOZfjrvV5gM6FJi4
         XGBRx/SDZd83jg0X9W+LfJ63IgQ9SAZcTqYyd1RF2ygcbmWI57tMlVc/7vLQQH4e4QL2
         8orjsNp5SswxkzSyx0afXmp/2HQBxPxk6oQvj19PrL9eHMVXaD1Q6XkPpSGXvbH6K1ri
         aCy3xcohpS5UetD1ljMIOfCuV3doUhQH4XQsNtVfJILyJ9XY172tSk3gXlWV1qKY2ovR
         19bQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnyrAiuDKTxDULvrxR3xhiQ6gZCtsvM6vToHFtjmZ5oAdZzGrcK9baQaINmUn/7YRAdSjknW5zqDLeJ/99@lists.linux.dev
X-Gm-Message-State: AOJu0Yw55AhqO8OFSWBOb5NkmDc6D1Fvexq9YLDiXXFkY9uIReeYdsUP
	b8/rbw3iF4QkoN3Kb98wfr4ckmnXXdBhFZuid2Q+Jhg2T5NDip1w0ZyTORBvHOhM8AnycvxyK0o
	jETaZYuCnWQixsgR6uOyYxVWGoRF34vpG18vLsQXasf9rTBspkZePDdnzXymcBX4dTLwzTmmioB
	U=
X-Gm-Gg: ASbGncucrVQUUiHC2DShHNS4GogChKtvwzOnid30gBkxkB5DT2K6PFF93juYqmKkRPc
	CiBEnXK/RSn8V5PwZwNPYAKXmd5rTndEFlQS0E7QnwlIyfgx9MEtdkTDVdZcT/tw4gIDlSw+nZM
	V0WM6TgtjmLKrOX0lxkF9ScxF1TlZj6UNEBUd8fSuiR3wMd3tM/SYsV7AT/gOcxMYGagWEXh/0Y
	cAqr7vgl1XYLTZdoYml0eBHYpBy8hBl+iYnfMQhhBDeIjhb8nBRTDhdnZCWMfKE+DdgR4hp7A0s
	kpX5Og5FsQvSpLwZhCtb/d0i4w==
X-Received: by 2002:a17:906:7954:b0:ad5:3743:3fa1 with SMTP id a640c23a62f3a-adfad59fe96mr807303766b.50.1750071134037;
        Mon, 16 Jun 2025 03:52:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDfE8XtZp/JlVmaxbngNN01gtbKw114f41ls9b8Zl+6xI4HTLykb1zxM1beH9uYfGTjokCZg==
X-Received: by 2002:a17:906:7954:b0:ad5:3743:3fa1 with SMTP id a640c23a62f3a-adfad59fe96mr807301666b.50.1750071133531;
        Mon, 16 Jun 2025 03:52:13 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec899c757sm634292566b.183.2025.06.16.03.52.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 03:52:13 -0700 (PDT)
Message-ID: <98a85abb-5e77-4e66-a192-8db9245e7ef7@redhat.com>
Date: Mon, 16 Jun 2025 12:52:12 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: rtl8723bs: remove some 5 GHz code
To: Michael Straube <straube.linux@gmail.com>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250615123859.41922-1-straube.linux@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250615123859.41922-1-straube.linux@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BrSQMNmRW9IuJDdH5uSUKyZVJbkPOaXkcURa4C9r4tY_1750071134
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 15-Jun-25 14:38, Michael Straube wrote:
> Chips that use this driver are 2.4 GHz only. Remove some code that is
> executed only for 5 GHz (channel > 14) . This addresses the following
> TODO item:
> 
> - find and remove any code for other chips that is left over
> 
> Signed-off-by: Michael Straube <straube.linux@gmail.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hansg@kernel.org>

Regards,

Hans




> ---
> Compile tested only, due to lack of hardware.
> 
>  drivers/staging/rtl8723bs/core/rtw_ap.c        |  9 ++-------
>  drivers/staging/rtl8723bs/core/rtw_mlme.c      | 18 ++++--------------
>  drivers/staging/rtl8723bs/core/rtw_wlan_util.c |  9 ++-------
>  3 files changed, 8 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
> index 383a6f7c06f4..b2e7e7267aa4 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_ap.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
> @@ -741,13 +741,8 @@ void start_bss_network(struct adapter *padapter)
>  	if (p && ie_len) {
>  		pht_info = (struct HT_info_element *)(p + 2);
>  
> -		if (cur_channel > 14) {
> -			if ((pregpriv->bw_mode & 0xf0) > 0)
> -				cbw40_enable = 1;
> -		} else {
> -			if ((pregpriv->bw_mode & 0x0f) > 0)
> -				cbw40_enable = 1;
> -		}
> +		if ((pregpriv->bw_mode & 0x0f) > 0)
> +			cbw40_enable = 1;
>  
>  		if ((cbw40_enable) &&	 (pht_info->infos[0] & BIT(2))) {
>  			/* switch to the 40M Hz mode */
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> index 1d23ea7d6f59..0b0ee023a239 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> @@ -2252,13 +2252,8 @@ unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_
>  	}
>  
>  	/* to disable 40M Hz support while gd_bw_40MHz_en = 0 */
> -	if (channel > 14) {
> -		if ((pregistrypriv->bw_mode & 0xf0) > 0)
> -			cbw40_enable = 1;
> -	} else {
> -		if ((pregistrypriv->bw_mode & 0x0f) > 0)
> -			cbw40_enable = 1;
> -	}
> +	if ((pregistrypriv->bw_mode & 0x0f) > 0)
> +		cbw40_enable = 1;
>  
>  	if ((cbw40_enable == 1) && (operation_bw == CHANNEL_WIDTH_40)) {
>  		ht_capie.cap_info |= cpu_to_le16(IEEE80211_HT_CAP_SUP_WIDTH);
> @@ -2366,13 +2361,8 @@ void rtw_update_ht_cap(struct adapter *padapter, u8 *pie, uint ie_len, u8 channe
>  		/* todo: */
>  	}
>  
> -	if (channel > 14) {
> -		if ((pregistrypriv->bw_mode & 0xf0) > 0)
> -			cbw40_enable = 1;
> -	} else {
> -		if ((pregistrypriv->bw_mode & 0x0f) > 0)
> -			cbw40_enable = 1;
> -	}
> +	if ((pregistrypriv->bw_mode & 0x0f) > 0)
> +		cbw40_enable = 1;
>  
>  	/* update cur_bwmode & cur_ch_offset */
>  	if ((cbw40_enable) &&
> diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> index 73c70b016f00..0c6072d08661 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> @@ -854,13 +854,8 @@ static void bwmode_update_check(struct adapter *padapter, struct ndis_80211_var_
>  
>  	pHT_info = (struct HT_info_element *)pIE->data;
>  
> -	if (pmlmeext->cur_channel > 14) {
> -		if ((pregistrypriv->bw_mode & 0xf0) > 0)
> -			cbw40_enable = 1;
> -	} else {
> -		if ((pregistrypriv->bw_mode & 0x0f) > 0)
> -			cbw40_enable = 1;
> -	}
> +	if ((pregistrypriv->bw_mode & 0x0f) > 0)
> +		cbw40_enable = 1;
>  
>  	if ((pHT_info->infos[0] & BIT(2)) && cbw40_enable) {
>  		new_bwmode = CHANNEL_WIDTH_40;

