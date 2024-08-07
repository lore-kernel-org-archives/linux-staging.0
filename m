Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F790191495
	for <linux-staging@lists.linux.dev>; Wed,  7 Aug 2024 04:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723006208; cv=none; b=O7yXeMYhKLmXk9s50JtYbB66l6dBD8EjBqsJ1mafxEa07qV+S+TiCpcX3sqEV3fwf3s5ee1qMILM6nwKFsJJnL6apHukkjSMhpj/NrhLW9f/air9b/L1oZDzpe/Jq8CZAX71jFj9i4fyJWyLdbH40MxLPWB2KJOyDJFVr7emwXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723006208; c=relaxed/simple;
	bh=KPAUxZqJrhsS4KCtmCVx+w7hmq3WMoxRxbv6d9nxS6c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oBwA1dAPnYErtsXJGAS+BbWmtgNsf3frDyENtnBI4xG7jVOYHkSURg5rHsPKnE17O4iFQ1nezc21bTKfFOsl1oj96GyIzJNMKmc155KYixVsQC+e31i024hRO5bIOBmgD3T0gEOxmZsm9sGh1lsRIUHEo1JXMJcwCq8QVY1GNY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S9L7c82l; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S9L7c82l"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52f015ea784so199133e87.1
        for <linux-staging@lists.linux.dev>; Tue, 06 Aug 2024 21:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723006205; x=1723611005; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IxW/EOKuv2Ggq7C49WbAgTm8GRc4ALxx4EED6SiYzio=;
        b=S9L7c82laiBeD6K4sYi/Dv/FqHOipNOumi8SZT97zbqBldnbzeSHLb1RE2xgWRDM22
         0CLLj+ZSb/IJDKvbtKVflTO3R1xbVcIINso8ujVgBwmySGfN+hj55Wjf+u/KrF4HF3mj
         3MMdetrt47yFp4T7vJdNivDRPSjJtTbxrX6ipfumWZYhEiXkQWrMv9rdPerQMI3OgRZi
         1TiFKufz4XMJL7KF209vvmEaDTbCO1zrRHWjv1JDWOK/NbOuSxMeZK1nv27wUJo/YKUX
         5qloqRkjS8r4jpSBA1eOkCQ2nfDSYjfAeJgq3PCfVld45WaS+k+0lnTbLHr0Ab0ePX2o
         T3ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723006205; x=1723611005;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IxW/EOKuv2Ggq7C49WbAgTm8GRc4ALxx4EED6SiYzio=;
        b=o+/25Ktp5HcN0v+EwhOWdib0CnC7a6iqhmFsmr8QnvrG+ufddiSXmxBU0lYd2b864X
         IWxgLLE61WLZR0THGghTP5Ra9gdGvX70mt1hfRxsmcNGmZeTzkQtUkjN9rWwJHqHNAF3
         wMDPzVbfEZRMVHGkgO590RCadWdq7jGvk4ZCjlTCNNv/dL87cqYDrLY0bbyXBaijgigQ
         uMxorZi35B+NyRqAyH0mzAsrSpjkMsVyjpnZvYJ51jiav30SXm+h7SzL41vx4xxnITjX
         uuxsrzyH7ZOglPrr0U+LmFTev/K3ts1wuVsW8tt/eJkV3+nijCVv6Eii1oAo3fQ7LOZj
         0U5Q==
X-Gm-Message-State: AOJu0YyscGvi31hmQWT5jSbX+f+XFYpnKDEZ0XpiGLg2BKLtkWjvyBj+
	uFnoriRTH9jKeVvOFCZ3LR/qq9Sj3POaFEm4xIxLpKPIE1/AYCYe
X-Google-Smtp-Source: AGHT+IE2FO8Po63soVEnx0OCYSC5d1Kb5hMUN7fMjnVorI03GJcKhRF+ANqXWTBm6AY6e++1NJMc+Q==
X-Received: by 2002:a2e:9b88:0:b0:2ef:27fa:1fbe with SMTP id 38308e7fff4ca-2f15aa7f67emr62938041fa.2.1723006204617;
        Tue, 06 Aug 2024 21:50:04 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f2a:8533:9f5e:f4:8922:a04c? (p200300c78f2a85339f5e00f48922a04c.dip0.t-ipconnect.de. [2003:c7:8f2a:8533:9f5e:f4:8922:a04c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5b83a552984sm6597089a12.58.2024.08.06.21.50.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Aug 2024 21:50:04 -0700 (PDT)
Message-ID: <c1212c50-f571-4193-84e5-9c2c909f876e@gmail.com>
Date: Wed, 7 Aug 2024 06:50:03 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] staging: rtl8723bs: Delete unnecessary braces for
 single statement blocks in xmit_linux.c
To: Jiwon Kim <jiwonaid0@gmail.com>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240805135623.2069-1-jiwonaid0@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240805135623.2069-1-jiwonaid0@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/5/24 15:56, Jiwon Kim wrote:
> Delete braces {} for single statement blocks to shorten code.
> 
> Signed-off-by: Jiwon Kim <jiwonaid0@gmail.com>
> ---
> v3: Fix subject
> v2: Fix subject and description
> ---
>   drivers/staging/rtl8723bs/os_dep/xmit_linux.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
> index 1eeabfffd6d2..e0736707a211 100644
> --- a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
> +++ b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
> @@ -144,9 +144,8 @@ static int rtw_mlcst2unicst(struct adapter *padapter, struct sk_buff *skb)
>   		psta = list_entry(plist, struct sta_info, asoc_list);
>   
>   		stainfo_offset = rtw_stainfo_offset(pstapriv, psta);
> -		if (stainfo_offset_valid(stainfo_offset)) {
> +		if (stainfo_offset_valid(stainfo_offset))
>   			chk_alive_list[chk_alive_num++] = stainfo_offset;
> -		}
>   	}
>   	spin_unlock_bh(&pstapriv->asoc_list_lock);
>   

Reviewed-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
