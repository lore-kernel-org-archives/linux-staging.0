Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC4984D0F
	for <linux-staging@lists.linux.dev>; Wed,  7 Aug 2024 15:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723045980; cv=none; b=b8s61wN9TmqXydN1OXXpB3k8xNh6vaAAhfbgh1l+QwqGksCoBrBg5F7ulLDaSYPUY8O7IbPBNItvubp0UJrS0RXBafAIuSk9Nlgl8DK3RV2BVhYUMpJWR5nCOs6QDtBll/VJHtciSAG/3NwzrBX3hzYekGNWB4XrCmIvEcrxrdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723045980; c=relaxed/simple;
	bh=wXPWh6k6pBHGMN6va5P/75EbKPnOuDRurzYoTKaEwVc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ur9iRAT2SLZ5gn5G5hga7pZQiDEJMEh6HsoQ8z9UBh8pJoYTPo2YPoe1MSLKw94X+sypGNElqZfHl0xXvxHKMqQlgDDy1ngnXBGlpI24T/Zk7zjMdZDkXsqR2ibTYuhJBpA/7rOzR50op7v3d30XBNBJre3UsoVOd2XkKQI0irs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y/88VkCp; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y/88VkCp"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a7abaea2afeso17639666b.3
        for <linux-staging@lists.linux.dev>; Wed, 07 Aug 2024 08:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723045977; x=1723650777; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qUiUvKTQQVHMdxw66WRr+aSl8RyfjXAJRd+5JETrf0E=;
        b=Y/88VkCpcxpk5d1aYl9fbKu01xDrYBVHQ0bryzD0dVRmuqEFsTC006srrCybiiSO6y
         yT78D2IKX9ddR8LRBxLbPRajMuBwIwl/W++nVEO6/YyQxyZDKVeKFJF2At70S6uYVTqw
         G6HWODRgd1Ancutgo4mv/sBM10hfCiz43p2MlOIU5TrUQ9Ln7PGnl/cD+JI1AZHZH1z1
         G9FQonrowqk+x+ZCdYtGxhigqNlQMo/EzMEnktLW0u5iUfjToB8bJEj7leZbveT5lEUt
         Abc7rOEvr3ES3Ik+6mYrjIICCBLmbhoUmCz7/wSi3+gyQspQAPD3enRm/0/mOgRJhdzK
         OwaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723045977; x=1723650777;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qUiUvKTQQVHMdxw66WRr+aSl8RyfjXAJRd+5JETrf0E=;
        b=sO71s1N6xBPZyKJKPBmuCInup+pyBIie7efy+y9Ir9Aav/YoSapCnI0xxyF7IfV9j5
         RBh7gGG3fZ26kJ96yBUNUC39LpesY7135ZFRu5wXXOzau3LxxhIfTPC5ny/S+lOlO8gk
         wTUG+iwtPG7FGmMvmxswhm0hSXfBDux8Ha6ofdzJKM2jLxETalQs+4LF12PBtei/xFC5
         TtWJSZQQg34A86XKCxCJa/AFjkLp8PrblXxMcIMTRF2jf0ZqagQtDdn/niEZ/wS/H/kI
         nW6u0AjDvIOEALPavfZH/35Gw6/BBpMLux1jANpHSYxfxTMZgg+v9GO0SREk059U/NRt
         +lcw==
X-Forwarded-Encrypted: i=1; AJvYcCXaeuYScimp2qdGGx4E9gx6GVn44EVMhXJqvISBUsYMV+jRHl/Q+Byho1RQNmCfijOdwd/542/939WtCx5g@lists.linux.dev
X-Gm-Message-State: AOJu0Yya5HpWaOAHmMGh1ia66g8CZNSteVbfKpzLJtXBjp3GTNInVhxT
	2ww0UwAm3wdNx+pbmKjbrQuvvmb8AS4v3lD4/2+fa9tprgK376J3
X-Google-Smtp-Source: AGHT+IGFO3IapnBF3tCg1oFuCGSR2iozMJtvYIm+8ITSbjakxWwa/3Sic7jLMArrMzztkADGamL5nA==
X-Received: by 2002:a17:907:6d06:b0:a7a:b895:6571 with SMTP id a640c23a62f3a-a7dc51b4cf1mr864700466b.9.1723045976910;
        Wed, 07 Aug 2024 08:52:56 -0700 (PDT)
Received: from [192.168.0.104] (p57ba2f9b.dip0.t-ipconnect.de. [87.186.47.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9d437dfsm654958766b.133.2024.08.07.08.52.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Aug 2024 08:52:56 -0700 (PDT)
Message-ID: <f24782cf-bace-491e-9cf9-28d515d4fc54@gmail.com>
Date: Wed, 7 Aug 2024 17:52:54 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] staging: rtl8192e: Constify struct
 lib80211_crypto_ops
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 stas.yakovlev@gmail.com, kvalo@kernel.org, gregkh@linuxfoundation.org,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, linux-staging@lists.linux.dev,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <cover.1722839425.git.christophe.jaillet@wanadoo.fr>
 <dfda6343781ae3d50cd2ec7bbdcf76a489b6922a.1722839425.git.christophe.jaillet@wanadoo.fr>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <dfda6343781ae3d50cd2ec7bbdcf76a489b6922a.1722839425.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/5/24 08:40, Christophe JAILLET wrote:
> Now that functions in lib80211 handle "const struct lib80211_crypto_ops",
> some structure can be constified as well.
> 
> Constifying these structures moves some data to a read-only section, so
> increase overall security.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested only.
> 
> Changes in v2:
>    - No changes
> 
> v1: https://lore.kernel.org/all/81be9eb42a2339eaa7466578773945a48904d3b5.1715443223.git.christophe.jaillet@wanadoo.fr/
> ---
>   drivers/staging/rtl8192e/rtllib_crypt_ccmp.c | 2 +-
>   drivers/staging/rtl8192e/rtllib_crypt_tkip.c | 2 +-
>   drivers/staging/rtl8192e/rtllib_crypt_wep.c  | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtllib_crypt_ccmp.c b/drivers/staging/rtl8192e/rtllib_crypt_ccmp.c
> index 639877069fad..138733cb00e2 100644
> --- a/drivers/staging/rtl8192e/rtllib_crypt_ccmp.c
> +++ b/drivers/staging/rtl8192e/rtllib_crypt_ccmp.c
> @@ -378,7 +378,7 @@ static void rtllib_ccmp_print_stats(struct seq_file *m, void *priv)
>   		   ccmp->dot11rsna_stats_ccmp_decrypt_errors);
>   }
>   
> -static struct lib80211_crypto_ops rtllib_crypt_ccmp = {
> +static const struct lib80211_crypto_ops rtllib_crypt_ccmp = {
>   	.name			= "R-CCMP",
>   	.init			= rtllib_ccmp_init,
>   	.deinit			= rtllib_ccmp_deinit,
> diff --git a/drivers/staging/rtl8192e/rtllib_crypt_tkip.c b/drivers/staging/rtl8192e/rtllib_crypt_tkip.c
> index dc0917b03511..74dc8326c886 100644
> --- a/drivers/staging/rtl8192e/rtllib_crypt_tkip.c
> +++ b/drivers/staging/rtl8192e/rtllib_crypt_tkip.c
> @@ -678,7 +678,7 @@ static void rtllib_tkip_print_stats(struct seq_file *m, void *priv)
>   		   tkip->dot11RSNAStatsTKIPLocalMICFailures);
>   }
>   
> -static struct lib80211_crypto_ops rtllib_crypt_tkip = {
> +static const struct lib80211_crypto_ops rtllib_crypt_tkip = {
>   	.name			= "R-TKIP",
>   	.init			= rtllib_tkip_init,
>   	.deinit			= rtllib_tkip_deinit,
> diff --git a/drivers/staging/rtl8192e/rtllib_crypt_wep.c b/drivers/staging/rtl8192e/rtllib_crypt_wep.c
> index 10092f6884ff..aa18c060d727 100644
> --- a/drivers/staging/rtl8192e/rtllib_crypt_wep.c
> +++ b/drivers/staging/rtl8192e/rtllib_crypt_wep.c
> @@ -209,7 +209,7 @@ static void prism2_wep_print_stats(struct seq_file *m, void *priv)
>   	seq_printf(m, "key[%d] alg=WEP len=%d\n", wep->key_idx, wep->key_len);
>   }
>   
> -static struct lib80211_crypto_ops rtllib_crypt_wep = {
> +static const struct lib80211_crypto_ops rtllib_crypt_wep = {
>   	.name			= "R-WEP",
>   	.init			= prism2_wep_init,
>   	.deinit			= prism2_wep_deinit,

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>

