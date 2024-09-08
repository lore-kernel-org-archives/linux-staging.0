Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8104175562
	for <linux-staging@lists.linux.dev>; Sun,  8 Sep 2024 20:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725827012; cv=none; b=bFEXd1dbaPtpM+PW3E98hCndNOnuAQ/7pK9O/cJoz6Rx3rPpjB39YbYt8uLkK6QQRTF8IPEIox3LHEbIEGQWupZyIW5TSyauncGD8e6F6OexR5hezsmWQnBcGcuvk3bpDDPsleIsRdOHTidJfoA5E7l7fH37S+TF6Y7ERvkOWg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725827012; c=relaxed/simple;
	bh=OHtWfwUaF50Ny0pvmLDQc/9y6kZO6VoQqfX9NhsF7+o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HD4u1PF6oFeWeJTajPMMogQT4CgUVWO+HsoHTWhzrWngdIYinWpZj2ub/SjIXaKgU9dJoj3HTrvaUn63OjUjdBI4GKkDINf1Q2doOEEglsYiMiK0qgp1wDeaGufcaE3F1hZov6MrVMyXOXnYdoRwL1lz+S/wvOFcInbuSK1cez0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W4++4gq9; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W4++4gq9"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-428e0d18666so32477195e9.3
        for <linux-staging@lists.linux.dev>; Sun, 08 Sep 2024 13:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725827008; x=1726431808; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8Gbw2QftCty789XpEBkAu/XA+jqNLKKmw4apI0xAyYw=;
        b=W4++4gq9uEt3oKoiFMGCsnXVFe9V6vnF9SNX45S1gQAW2jNpPv8YcsxQgIYk1K3uo5
         B4BuWnKOUbbGsgKq3e8i+RrCRDn/vrGhr3uR+d2Vv1E0uVWnbkk3rN2l2vgmK9BEQ5TX
         EyDg33tL1mJ5tIQDWZ7lOz0JEKahRoSntqympQhTk9fVF5RmxQ3dO4l1jZzD6xQN5Vhk
         OHOV4+XlDJBMgBNnDgkEbUnRltsYj9PVgZhgweOIlCbRP5OEg7IB1jbD2i0L97Np5id8
         ghDi9NovN747V6hMmr4cTwEHnj/+fMe4/zZ0EX8OlegoI7TT2bzJsETStQJS+2xFo1dr
         rqvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725827008; x=1726431808;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8Gbw2QftCty789XpEBkAu/XA+jqNLKKmw4apI0xAyYw=;
        b=ja4aGb6bkuwUrY82K3UjQsHcFewcBAQJsymUC/FPTQirC93cGVbye0yWEK07U9eXg5
         GlPQt1t1XNA7D7IDD3JxsG3GfBPAj7VrCL8wvZuJmLznpz2veupq9R0r9X+CKLh3BBcz
         kywsKHdqyx0ni7qYPTvlnACxPOdY7CoVst1QfXcNNQEtS14yfJMkHwH8AD2ZO63Qg5cW
         Zt/kRRCA0yeR+FjtVbuDMC7CIruCso+EmmGc6gtykk731HGn9Lk5fNF63CX+YNofrSVB
         JS7GXbX36OoYrhIDnCufuU56j38zmmneRYJPp6qg3fvHR27xg1fZmVjcFIJxlORoOExX
         j+KA==
X-Forwarded-Encrypted: i=1; AJvYcCVo1XwEeUViVGlwmOOa6+2AEkvpntqTaCdkhLqM2r2s/nBpWfmMObZhiiun5sYmxDzSykouNor9vPlnGsEk@lists.linux.dev
X-Gm-Message-State: AOJu0YzS5Ym24yu4h3chsLbwkfo2yyS7T0IuY1fNwMdctrcEbmF+6tbx
	KFJWHGFgvgpZ8lfFvb42hj8W1Yho9+ReP0rU++KgS2z15jClaSAf
X-Google-Smtp-Source: AGHT+IGiKY0np5iJu0VN+kmjERwrlW1fDWrBjIby/EH07L+o5BaSSXyXVWMc9DgB/LPc2CvOCorCYQ==
X-Received: by 2002:a05:600c:1e1e:b0:42c:b187:bdeb with SMTP id 5b1f17b1804b1-42cb187c004mr24814035e9.29.1725827007909;
        Sun, 08 Sep 2024 13:23:27 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f2a:8576:4416:5fef:fc17:c89e? (p200300c78f2a857644165feffc17c89e.dip0.t-ipconnect.de. [2003:c7:8f2a:8576:4416:5fef:fc17:c89e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42caeb45c81sm54816085e9.28.2024.09.08.13.23.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Sep 2024 13:23:27 -0700 (PDT)
Message-ID: <4176c4f5-7da4-4f0a-a632-d2a46b8d3035@gmail.com>
Date: Sun, 8 Sep 2024 22:23:26 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] staging: rtl8723bs: fix use of tab wherever possible
To: Sayyad Abid <sayyad.abid16@gmail.com>, linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org
References: <20240908101110.1028931-1-sayyad.abid16@gmail.com>
 <20240908101110.1028931-2-sayyad.abid16@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240908101110.1028931-2-sayyad.abid16@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/8/24 12:11, Sayyad Abid wrote:
> This patch fixes the coding style issue by fixing the use of space
> instead of tabs on line.
> 
> Signed-off-by: Sayyad Abid <sayyad.abid16@gmail.com>

Hi Sayyad,

please make your "Subject" line more unique. Consider that we may end up 
with having dozen of commits like yours, all of them referring to 
different removals and all without the necessary information to tell 
what they differ in (except the driver/subsystem). So it would help if 
you add the changed file or function to make it more unique.

Please also improve the Subject Lines of the other patches.

If you send in a second version of this patch please use a change 
history. Description from Dan under:
https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

Thanks for your support.

Bye Philipp

> 
> ---
>   drivers/staging/rtl8723bs/include/rtw_security.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/include/rtw_security.h b/drivers/staging/rtl8723bs/include/rtw_security.h
> index 98afbd3054a4..487d69460cec 100644
> --- a/drivers/staging/rtl8723bs/include/rtw_security.h
> +++ b/drivers/staging/rtl8723bs/include/rtw_security.h
> @@ -75,8 +75,8 @@ struct {
>   };
>   
>   union Keytype {
> -        u8   skey[16];
> -        u32    lkey[4];
> +	u8   skey[16];
> +	u32    lkey[4];
>   };
>   
>   

