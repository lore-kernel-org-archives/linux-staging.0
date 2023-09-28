Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24ACB749B
	for <linux-staging@lists.linux.dev>; Thu, 28 Sep 2023 04:57:06 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-9a1bcc540c0so322304566b.1
        for <linux-staging@lists.linux.dev>; Wed, 27 Sep 2023 21:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695877025; x=1696481825; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IjnVhTmViUFUS8jPDfsX5EBBj4w0ohMdGnL+g6iEKxk=;
        b=JVtAt4wcQMHlykGUkwL8SNDAQHCeKkCbgA3cxYSWoJG0bpBFKik9WRIZa9DbfBl5Nt
         fnsXI3/lW+Z9KBJwPMj20f9SSrsfl/xKcPA8wtD7wvomQoHA92A1+JYIFuAvJMZPcZZo
         TR2yHpEAoAfBSKhno42VSoMcCACslfDrncES4tcKWM4dGIWCAjv1cyXQD/tX8RomUFMG
         o+RDzXiLLL7RZ7h46+XubfGkKIKZ38rZ77+day1WAEvCeID4+sQeTZhEYVk7TdZyslaN
         OwnT14+KPuCTPx3QUi86BWid3bpvZp3Zron1sspagd0eu9+ZcE1oWGqMLyXVSH7kI4AA
         hNWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695877025; x=1696481825;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IjnVhTmViUFUS8jPDfsX5EBBj4w0ohMdGnL+g6iEKxk=;
        b=fEMLubNzrsglG8HoFclOF/CU1zDnGm7rajvwTGTVTa/80LGEzJGtkNZWuIdeaPQP3n
         nyQKnVKJYua0bAiSBrXtS5ZlSLk77rePpmJRbSLL6qvhFVq82W6qhG10k7J8lxL9MmEH
         qzliqR69OfLaaCmXR3viLj2vqLjTWYlA5pBxTwXs7Fa3bIsGFEEZ1k3+qwGUCoS2cpNI
         eokhJDUNUTS6wJoTiuLzFUZbWCbX+US6pe4GAcSea+A6M/+j/MniVFSeh4yZmFed6aYI
         +uWycYZD0f0OQD03HrHYTbDPpTvY0/CkMT/9FuTSq3R9lOYNwVamQIIWEYud9vQrS3rN
         8spA==
X-Gm-Message-State: AOJu0Yz0cyuZxz0GcPCsxnQYiua0KhVH92EUGStpa9NlMRb1+y7wMqk5
	P+1pxKtjtTqm7y6rT1wRX75daAgsbM4=
X-Google-Smtp-Source: AGHT+IFl8dxrPg/Ls8y0D5pASvHo2j7uZbw0BIxs5Owu8m9CsYgTEmSYxkVAb08p94lWyCyEKvdRYQ==
X-Received: by 2002:a17:906:74c1:b0:9ae:3ee2:6feb with SMTP id z1-20020a17090674c100b009ae3ee26febmr122922ejl.2.1695877025015;
        Wed, 27 Sep 2023 21:57:05 -0700 (PDT)
Received: from [192.168.0.104] (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id s12-20020a170906168c00b009737b8d47b6sm10161717ejd.203.2023.09.27.21.57.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Sep 2023 21:57:04 -0700 (PDT)
Message-ID: <b3317aa5-e26a-227b-e0f4-9c98d10aad4e@gmail.com>
Date: Thu, 28 Sep 2023 06:57:03 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2] staging: rtl8192u: ieee80211: renamed duplicate
 variable
Content-Language: en-US
To: Gary Rookard <garyrookard@fastmail.org>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20230928033220.31783-1-garyrookard@fastmail.org>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20230928033220.31783-1-garyrookard@fastmail.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/28/23 05:32, Gary Rookard wrote:
> This patch renames a duplicate variable found in both rtl8192e and
> rtl8192u causing the preprocesser/compiler to compile without error
> when in fact it should throw an error/break the build.
> 
> Prototype in files:
> rtl8192e/rtllib.h      remaining as ht_update_default_setting
> rtl8192u/ieee80211/ieee80211.h   changed to __ht_update_default_setting
> 
> Function in files:
> rtl8192e/rtl819x_HTProc.c remaining as ht_update_default_setting
> rtl8192u/ieee80211/rtl819x_HTProc.c  changed to __ht_update_default_setting
> 
> Referenced in files:
> staging/rtl8192e/rtllib_module.c  remaining as ht_update_default_setting
> staging/rtl8192u/ieee80211_module.c changed to __ht_update_default_setting
> 
> Linux Kernel Coding Style "cleanup", no change in runtime,
> staging/rtl8192e and rtl8192u compile/build before and after.
> 
> Signed-off-by: Gary Rookard <garyrookard@fastmail.org>
> ---

Hi Gary,

this patch cannot be applied. I cannot find the variable 
ht_update_default_setting in this driver.

Bye Philipp

>   drivers/staging/rtl8192u/ieee80211/ieee80211.h        | 2 +-
>   drivers/staging/rtl8192u/ieee80211/ieee80211_module.c | 2 +-
>   drivers/staging/rtl8192u/ieee80211/rtl819x_HTProc.c   | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211.h b/drivers/staging/rtl8192u/ieee80211/ieee80211.h
> index 4e598c7f0d31..ae2fb249eaa1 100644
> --- a/drivers/staging/rtl8192u/ieee80211/ieee80211.h
> +++ b/drivers/staging/rtl8192u/ieee80211/ieee80211.h
> @@ -2293,7 +2293,7 @@ void HTDebugHTInfo(u8 *InfoIE, u8 *TitleString);
>   
>   void HTSetConnectBwMode(struct ieee80211_device *ieee,
>   			enum ht_channel_width Bandwidth, enum ht_extension_chan_offset Offset);
> -void ht_update_default_setting(struct ieee80211_device *ieee);
> +void __ht_update_default_setting(struct ieee80211_device *ieee);
>   void HTConstructCapabilityElement(struct ieee80211_device *ieee, u8 *posHTCap,
>   				  u8 *len, u8 isEncrypt);
>   void HTConstructInfoElement(struct ieee80211_device *ieee, u8 *posHTInfo,
> diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211_module.c b/drivers/staging/rtl8192u/ieee80211/ieee80211_module.c
> index 6f6813899e31..f35765167e1b 100644
> --- a/drivers/staging/rtl8192u/ieee80211/ieee80211_module.c
> +++ b/drivers/staging/rtl8192u/ieee80211/ieee80211_module.c
> @@ -146,7 +146,7 @@ struct net_device *alloc_ieee80211(int sizeof_priv)
>   		ieee80211_networks_free(ieee);
>   		goto failed;
>   	}
> -	ht_update_default_setting(ieee);
> +	__ht_update_default_setting(ieee);
>   	HTInitializeHTInfo(ieee); /* may move to other place. */
>   	TSInitialize(ieee);
>   
> diff --git a/drivers/staging/rtl8192u/ieee80211/rtl819x_HTProc.c b/drivers/staging/rtl8192u/ieee80211/rtl819x_HTProc.c
> index cf9400859700..d5354147e7ae 100644
> --- a/drivers/staging/rtl8192u/ieee80211/rtl819x_HTProc.c
> +++ b/drivers/staging/rtl8192u/ieee80211/rtl819x_HTProc.c
> @@ -56,7 +56,7 @@ static u8 CISCO_BROADCOM[3] = {0x00, 0x17, 0x94};
>    *  return:  none
>    *  notice:  These value need be modified if any changes.
>    */
> -void ht_update_default_setting(struct ieee80211_device *ieee)
> +void __ht_update_default_setting(struct ieee80211_device *ieee)
>   {
>   	PRT_HIGH_THROUGHPUT	pHTInfo = ieee->pHTInfo;
>   	//const typeof( ((struct ieee80211_device *)0)->pHTInfo ) *__mptr = &pHTInfo;

