Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC4784D34
	for <linux-staging@lists.linux.dev>; Tue, 27 Aug 2024 18:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724783852; cv=none; b=cdErYztNxLsc+h6cmJ2L2xtfux7kk7/ZiWIBfaxyzeI2hq+fF1pGxsGU7Mhh+6m1+Gc4+zvWMepZETt8RBxw1X5/YcNboUzmBQPvgE+tkIei+wBwb/SuwQm12yDrHaqpHHTneQBCvlVTIfHvKi9QI2WW0CwHm8lJo/lOzTEVc9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724783852; c=relaxed/simple;
	bh=H8JC4zGBxm+uxM52UrU4l8SHxhWiPw69WAVC5vNwhWU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=rZuReD65+iQlTZEGYdbICi4NSRffRxyoPy5oVHAjaeRSlsq/oqXwlS8WyqDrNRRXqZSW6lTD27L7Kk9TIfVdfX/Yg/BnrZLgrGUXxNMxXHcmPVpq47o/iyGgnIrsKbT2F1pfBk+huBEX0ILjF2ozkyoMQi2wvwkWpjENQONpnFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EWOhOq+Z; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EWOhOq+Z"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53349d3071eso7155856e87.2
        for <linux-staging@lists.linux.dev>; Tue, 27 Aug 2024 11:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724783848; x=1725388648; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+wei2YqmI+C13JiYiOFBXj7v+/g9gbGsLnKaP0aiRLc=;
        b=EWOhOq+ZdCNYwiMChhq5rE3ZsyQCovcO0VqDjk25ly1qtNzF8OSiL5XEaMsEygFnHw
         GeXINuYdb1IuY4nxtx3pfsHQE4pQmQmQN+PT/3p4Er8VTuV58MWTxJPR5YZu9XzjiyFp
         xS1nlT+GAuNuX946h6S9m0qaBfoTD4AbH6hnA4yZvaQ1DZL4o0Djb8XEM2+5tpUzPxcT
         Sr4iYw2YfDvg6LC0RLmCOYDYsOuzRtzmFYY3+ScmovPmQQL7O19HlWIXeSHXqY+zGbDa
         Nf/WCQHa6Ce7ygHBFGyQYeoXuGkg+MwKan3yjieB+r8eMd/iVGtvNYWnm4JWKdlLucSE
         NEag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724783848; x=1725388648;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+wei2YqmI+C13JiYiOFBXj7v+/g9gbGsLnKaP0aiRLc=;
        b=I6Liz2sH9oIoOjVrpOc2VHBZUMQnK3nfZSqi4Re9zS2KryQ0dpRgBwZEoh9oxcCSFb
         l0nyE5sE3p6yQL+JOX2DFIOudBGIG7KVCUtINtkWQSzkfDmrs1u8CcI3ThQ8ZzUVwT/G
         aCyn9k8xJMWyBQZq0PpK8+mPt1pet5gfTWrO0615c1Q6N3jQklPXWNcOmGHu3upMmO/q
         hdKHM5i57ytuWKMO/Q+oggZvj642YiLce6wWUL4rpaQVCF8JVy8s/HvpWtlr2Mcoru43
         KW6uU9WOgg5xVG/OEJ0IzErexI8cVIS2xrctP6Oel6faQSigvWTWmAUAHbsDCg0Navco
         SHtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBvjmoxxPSIwm6/eOFdcjiGPJnd4WOblSctSNC0juIb41/hJ34zQfEa2kZkcKSNdwPYDa0bkcwPQXyFVUz@lists.linux.dev
X-Gm-Message-State: AOJu0YzIdCy5E9s2a2/UobWRuopNM5lUM9WppeNuhiaKtG/Lqbtt2kk7
	wmkdRazaphQAlVBL1XG+BNaYUIrFZEuRLPvzxpFfFRR2W164+TrC
X-Google-Smtp-Source: AGHT+IGjTs1qBRmJssjl7qNqtqxO0v6xB7rTHw2xEE6XsBHUuOo7xKcZmnVQ4t+E0w8lWtlykvdd8g==
X-Received: by 2002:a05:6512:401d:b0:52c:a7c8:ec43 with SMTP id 2adb3069b0e04-5343870bbf8mr10454113e87.0.1724783847885;
        Tue, 27 Aug 2024 11:37:27 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f2a:8589:9a84:3869:ee20:88fd? (p200300c78f2a85899a843869ee2088fd.dip0.t-ipconnect.de. [2003:c7:8f2a:8589:9a84:3869:ee20:88fd])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e54851fesm142103066b.43.2024.08.27.11.37.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Aug 2024 11:37:27 -0700 (PDT)
Message-ID: <e1ab1e44-e5ed-4a6a-821f-859bf54816fb@gmail.com>
Date: Tue, 27 Aug 2024 20:37:26 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] staging: rtl8192e: Fix alignment parenthesis
To: Nilo Alexandre <n1lux.comp@gmail.com>, gregkh@linuxfoundation.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 ~lkcamp/patches@lists.sr.ht
References: <20240827162910.15459-1-n1lux.comp@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240827162910.15459-1-n1lux.comp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/27/24 18:29, Nilo Alexandre wrote:
> Fix alignment parenthesis in _rtl92e_read_eeprom_info
> 
> CHECK: Alignment should match open parenthesis
> 
> ---
> Changes in v2:
>      - Using tabs instead of spaces
> 
> Signed-off-by: Nilo Alexandre <n1lux.comp@gmail.com>
> ---
>   drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
> index b767dc00100aa..2d17d8e8898e7 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
> +++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
> @@ -322,7 +322,7 @@ static void _rtl92e_read_eeprom_info(struct net_device *dev)
>   		if (priv->epromtype == EEPROM_93C46) {
>   			if (!priv->autoload_fail_flag) {
>   				usValue = rtl92e_eeprom_read(dev,
> -					                     EEPROM_TxPwDiff_CrystalCap >> 1);
> +								EEPROM_TxPwDiff_CrystalCap >> 1);
>   				priv->eeprom_ant_pwr_diff = usValue & 0x0fff;
>   				priv->eeprom_crystal_cap = (usValue & 0xf000)
>   							 >> 12;

Hi Nilo,

please make your "Subject" line more unique. Consider that we may end up 
with having dozen of commits like yours, all of them referring to 
different removals and all without the necessary information to tell 
what they differ in (except the driver/subsystem). So it would help if 
you add the changed file or function to make it more unique.

Please answer the why in the description and not so much what you did. 
Why do we need an empty line? Please use a dot to end the sentences.
I propose:
Align parenthesis to improve readability.

You can mention the tool which gave you the hint but you do not have to.

Thanks for your support.

Bye Philipp

