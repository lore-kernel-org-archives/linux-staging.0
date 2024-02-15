Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0ED2182D4
	for <linux-staging@lists.linux.dev>; Thu, 15 Feb 2024 09:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707989567; cv=none; b=XBScOeow53KeReMEtuMNglr7sQkXhtqK3m868UxPjVT2PvGQB4DpInlS94fPL6oO5e7PBx5/EQVR879dcBEVcJASb4/v+n7Ts8u87sCjTNuS9C663rWjLByhD3h/pt/Xcp+LCPu48PRgM2ak9ZE0wlj6ZkHZ5HMbN0Hpek9IjI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707989567; c=relaxed/simple;
	bh=Omg4acYujtdeRawCGb0RTHxJLjrGqaPKUU7KovSJhpc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l/JYCjjzjpp+XRrxaDZ4CX4JCz9JZHctAe3wa48+dVuKdUSz++zZd0Ah8k0n//2hZkSluYgEOk+9/B1CwNZtJ6iDPUFg+1aQTIH3OZkbnc6gLQy7HL0WMDXuyGrfBQ3PY0fLawYMz+R0HxjhH4D5pIRLolZ+DLoZLMBOFr0wnWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ls3JsdwF; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ls3JsdwF"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-563a782fa78so57649a12.0
        for <linux-staging@lists.linux.dev>; Thu, 15 Feb 2024 01:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707989564; x=1708594364; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kg/5u3u8BHpzXrjgfyC49Sj4UVynox8lvULasQKi+Xs=;
        b=Ls3JsdwFrsgh/mOxhrvCPBrg8p/vbDnvWu0LWzQAm6OeU86DP30lGNo1BABUagx7ki
         wbxHklRcfDdMY0JGuFSjf8W59/fC7VU5Ve0047esbM8+NCa9nvHHoAqySYfP7NNxmvXc
         Q1naVegTLpRKm+WFoU9kVBh3OHS5Exrq+QUznLGEFUbPjzJZ+O6GhyDiDXTKJjzI9Abj
         0lBdMKeVKiXBWh9KcVQwtCMx4Orr7QrpHXWQcQg74v3GbaniPUBjRF2H/US9m/GZB29H
         dP9skPgy8YjIjfsnHH6D5SS6yxkO2YHcgk4NTDwcdIJ7VZeC0a79WIdBBtorCo+rP1Vo
         qSgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707989564; x=1708594364;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kg/5u3u8BHpzXrjgfyC49Sj4UVynox8lvULasQKi+Xs=;
        b=ag94A/fOn7rrQldpwq5dAV8hqz+pS6PXAdqDXeKYZWszoEVKMfgfKlLOz6taktK14z
         AcwxzWOCtuzNchKY/CgkB4dM7w6gNNMBI5L2q+PkklUtoQFSuQiwN5w/GytHAZ5cvbte
         xGYdaXzR9m4NjXcsIioof8SneE2ynMy1mTdYW+mzawU1ekF72RGifPUZMq4ZnwYPCn9g
         82KCIIHaViClmpzSg23ra/uTcbqosc86AgGUGh92poaDNOBUoQv7SkLQp8mjeUUukzFw
         tUDl33aZTaodLOrHdscOvyWNrHZTuqGur8CSJdfAkm65YfaujSHGo6LV3mHPYLiSClI5
         dYUA==
X-Forwarded-Encrypted: i=1; AJvYcCV9jsr7qpEfn89CECQgTKs4XTA33Y53n4C8/txAr1iiswMX/uLNHhocm9yrX6N9/YPvi6xAlsu16dasZT2eIRC0mnQnbANIqmZkg2Zn4w==
X-Gm-Message-State: AOJu0Yy+WG9adHRbvlODU2nDYjXkkLHiVFSTWKeQfouDgt+wi+YgiCl/
	4hp6mKZY+QQjh1MmhoDPP5pdaRqzu0VReKCNFtusWhe9ptTfVZV7
X-Google-Smtp-Source: AGHT+IEcIgt2Iqxx2tsbVKbYneFYaBxEmNZ14WV6xTenuRe50DQjP6SUkT4XxX/DOObJtd/XCGhboA==
X-Received: by 2002:a50:8d11:0:b0:560:1f51:80f6 with SMTP id s17-20020a508d11000000b005601f5180f6mr808912eds.4.1707989563363;
        Thu, 15 Feb 2024 01:32:43 -0800 (PST)
Received: from [192.168.8.103] (dynamic-176-005-144-062.176.5.pool.telefonica.de. [176.5.144.62])
        by smtp.gmail.com with ESMTPSA id z10-20020aa7cf8a000000b0056399fa69absm364316edx.26.2024.02.15.01.32.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Feb 2024 01:32:42 -0800 (PST)
Message-ID: <817953da-12ee-4720-aef1-725d07c2704e@gmail.com>
Date: Thu, 15 Feb 2024 10:32:41 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Staging: rtl8192e: rtl819x_HTProc: Removed braces from
 single statement block
To: Aaron Parfitt <aaronparfitt123@gmail.com>, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
References: <20240213074649.18158-1-aaronparfitt123@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240213074649.18158-1-aaronparfitt123@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Aaron,

looks OK but can we make the subject more unique. Maybe like this:

[PATCH] Staging: rtl8192e: Removed braces from single statement block in 
ht_on_assoc_rsp

Or is this getting to long?

I propose the description to be like:

Remove braces from single statement blocks to clear checkpatch warning.

If you change this you need to make a v2 with changelog.

Bye Philipp

On 13.02.24 08:46, Aaron Parfitt wrote:
> Fixed code style issue
>
> Signed-off-by: Aaron Parfitt <aaronparfitt123@gmail.com>
> ---
>   drivers/staging/rtl8192e/rtl819x_HTProc.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
> index 6d0912f90198..49b882c363bf 100644
> --- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
> +++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
> @@ -480,9 +480,9 @@ void ht_on_assoc_rsp(struct rtllib_device *ieee)
>   	}
>   
>   	ht_info->current_mpdu_density = pPeerHTCap->MPDUDensity;
> -	if (ht_info->iot_action & HT_IOT_ACT_TX_USE_AMSDU_8K) {
> +	if (ht_info->iot_action & HT_IOT_ACT_TX_USE_AMSDU_8K)
>   		ht_info->current_ampdu_enable = false;
> -	}
> +
>   	ht_info->cur_rx_reorder_enable = 1;
>   
>   	if (pPeerHTCap->MCS[0] == 0)
