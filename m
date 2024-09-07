Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309FF3BBCC
	for <linux-staging@lists.linux.dev>; Sat,  7 Sep 2024 05:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725687252; cv=none; b=JgUeyJSh7WTCd+p+4ahQEmAG5qbaYkABVfQ/IdEfR7KzZsZlw0FbDitdAKq0XTuwblf91GMwtfzlnT8yUM/XaqaZsolAWj6B+TdEyySvqYhscoexiKCMxCQ5bBhtwJTkFxesSVqC1lFVRGIRi+8XuoQKRJZD+R9DzMW8ozmceYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725687252; c=relaxed/simple;
	bh=5XyzXAL91oQWCEuilHowuUynFqW63PgqG/uzFnyZeFY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hul7zXGn7EB0PjqK622LUUjCmpYQ1+oinQXQQ/VMIHMF4I9PT/eE/AR2s71S8rDp114Z8sNt46Be71zdYchENh7+EsYmbTSQuJbPLZsb/78VQYt+5zuerpqQCxNm/cuHqiR6/1QduSX/OEDAeTbaAYDiOuW5WoNjfVj3h6vGOEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YJZ5J/jG; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YJZ5J/jG"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53653682246so3121912e87.1
        for <linux-staging@lists.linux.dev>; Fri, 06 Sep 2024 22:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725687249; x=1726292049; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gvBY4LoX3N4dasraPrjziJHHMR0N8my9Ke+wGInAkl4=;
        b=YJZ5J/jGOBFo7C2S3PhV5Zg+CLFUtL6LblXSXCgyUrKdnIR5goSLOl0v53FKHW4tBC
         YB8PQV93MYB097GaQKFjC+g2+sf8tn4wFUCWkyOXoiPYsRf8mpZmOxkf4HraqdBy+EDD
         48Z6GKOKW/ndIa4+MHYqo3V6jPldu8TZXQ/a1FfjoHk+zwqwlBHApeKF3/MqGdLt0p20
         sF8zGICl7rhBIMYogoDFuGsRGr0waSnpqfNcDeLgJACEnDcDlGHFrL6Et7FcaUee+Zhm
         mIHREZ0cnDh6cKG+K/kWPfNJVAnya1D4D/81QmNJgjhmejlnbkv7Qa3flG4Qq+cGCVOQ
         tHxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725687249; x=1726292049;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gvBY4LoX3N4dasraPrjziJHHMR0N8my9Ke+wGInAkl4=;
        b=CAlDS8/bTY0Y4o5AxOYMEiRxjrWJ47YdYAdsIDwdlQp8VYBVRC5Qvx2LNh4p91abw5
         YTLBrFOzj8cx6utCwx5VyATiqTFPrctqCzn4e9jlIdJsEXYWNifj7Ewf/BK3s0aA6n7U
         3B3Q+NAFS1FZp4PaGDMHn4iFtj6PYFTXQLAnZXD+M2CqzmE7tWln8yvvE5sLEIK9dIvg
         QyV445JFNbjRbphHVTd4hGmiHHHxbcfuOHTD4s/0+QxpmEjsqCS7UI2Tyr6kOvNoxoqa
         GWKsCx2LDdwBVjk/LPojAQKGAiZ58z4mIxe6BhNo21vAE1XZAa1U+t78T9fYWZ3oRr4G
         5N8A==
X-Gm-Message-State: AOJu0YzP7tFiqDGKUgkgp1U3eJZzo3yqs/OexTNCuFKZoGeIjIQysRA9
	6wLokN4qrEgfUKTwQeqvRZ9kIXwctonKu9tDlDyp8iKsbXB0jeyS
X-Google-Smtp-Source: AGHT+IEvrJiGoTMnZxJ6cW5it3SdV4gboRdovc6g7VqrZBdxngTy08Xy6zRi0F7EOiPUJF7kEZHvKg==
X-Received: by 2002:a05:6512:3d1b:b0:52e:999b:7c01 with SMTP id 2adb3069b0e04-536587fcf4dmr3121011e87.48.1725687249078;
        Fri, 06 Sep 2024 22:34:09 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f2a:8554:83ef:b48b:9bd4:f165? (p200300c78f2a855483efb48b9bd4f165.dip0.t-ipconnect.de. [2003:c7:8f2a:8554:83ef:b48b:9bd4:f165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d2595122asm30431966b.65.2024.09.06.22.34.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Sep 2024 22:34:08 -0700 (PDT)
Message-ID: <272d72a3-85f7-47cd-bebc-cf0f0160a84f@gmail.com>
Date: Sat, 7 Sep 2024 07:34:08 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: rtl8723bs: core: Fix spelling mistake in
 rtw_xmit.c
To: Roshan Khatri <topofeverest8848@gmail.com>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240906141157.10167-1-topofeverest8848@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240906141157.10167-1-topofeverest8848@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/6/24 16:11, Roshan Khatri wrote:
> This patch fixes spelling mistake to increase code readability
> and searching.
> 
> Signed-off-by: Roshan Khatri <topofeverest8848@gmail.com>
> ---
>   drivers/staging/rtl8723bs/core/rtw_xmit.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
> index b1965ec0181f..755c1bc86a74 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
> @@ -45,7 +45,7 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
>   	init_completion(&pxmitpriv->terminate_xmitthread_comp);
>   
>   	/*
> -	 * Please insert all the queue initializaiton using _rtw_init_queue below
> +	 * Please insert all the queue initialization using _rtw_init_queue below
>   	 */
>   
>   	pxmitpriv->adapter = padapter;

Hi Roshan,

please make a patch series out of this 4 emails. This makes handling 
easier for the maintainer and the reviewers.

If you send in a second version of this patch please use a change 
history. Description from Dan under:
https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

Thanks for your support.

Bye Philipp
