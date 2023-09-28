Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C387E2
	for <linux-staging@lists.linux.dev>; Thu, 28 Sep 2023 04:40:46 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-9ae3d7eb7e0so326748666b.0
        for <linux-staging@lists.linux.dev>; Wed, 27 Sep 2023 21:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695876045; x=1696480845; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HhNjgJLO3psdT40vxaz4v6qba6rjpNNWRaCJEnQpK0s=;
        b=bNBGpQcHt+J6Htn6pKabJq0elFYdeLnl1LK+Aof9N/QcQU9IfOSzL5HxO3NsYc960O
         nWzjNqbvJAZnU7a+oXshtvpBbbNCs3yqudh+VU641O0T1uUqebm5qRFUec2BfJmaiG3J
         Brh17FBl/sJB8kDS9YOXZ7QnCnRn3sy0RocoxnC27YX0BMYYGfTJQfTYdQzh8aJjtffe
         m7wD2J463NU9e8lJW+djMd0F2TjeT1PbP35OMj0XWr3TT/Xs5nOIH72DAx6g7QcTLm6F
         mkKQ2wvpJH+56D0ds/6wE3HX687tzPrhu698z3C/pS14lPXXiIUjw+cX4h8c1Y6qu93I
         fJng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695876045; x=1696480845;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HhNjgJLO3psdT40vxaz4v6qba6rjpNNWRaCJEnQpK0s=;
        b=M3lNAjm42qxr5By1fpRS2+P02GQkI2YQVjRy+cB5JwmAqefoEZ9V9lxVeTnXjv2EWT
         pBpLFrL+csiGGnrNro3nTJD51r1D307CPrXMqBiXVRHT35V+NOoUzPrrrbbwcCWVu7Yz
         fyMahT1Y0aU4+KNM/MqvKtN/3J9qpllzmxotzKMxrkSK/cnCUyok0UUIxkw1TDAqRIpK
         pZKtmXv6G+dHJxPamj963+c2sKP0pxGPy2Tlxc3aBch0keyp7uCHZp3dPmgvw1Ofl89V
         f808hoebdhHgP9DIhAqgKau7VhFYyGnIHZh3ZXshAjGqNXQouSu/EIFt8QgzHDioagrU
         mRQQ==
X-Gm-Message-State: AOJu0YyLG49x1l59uRdHV1zcekH/Qqq02UmwF9UWBH3J6dn79uyAjKw9
	6+G8uDfgDp2BkCjcvV6DJJs=
X-Google-Smtp-Source: AGHT+IGaU7XMelu4ZAxTB8eQWtfgME7OwgcWlUF/J14/jA882F+DTdCRRsf1txJAy547LRwzvpKGEQ==
X-Received: by 2002:a17:906:74d4:b0:9b2:b149:b816 with SMTP id z20-20020a17090674d400b009b2b149b816mr125767ejl.7.1695876044617;
        Wed, 27 Sep 2023 21:40:44 -0700 (PDT)
Received: from [192.168.0.104] (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id mc1-20020a170906eb4100b009a5f1d1564dsm10085395ejb.126.2023.09.27.21.40.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Sep 2023 21:40:44 -0700 (PDT)
Message-ID: <d9a089f9-c439-97bd-5abc-18390c3ec0cb@gmail.com>
Date: Thu, 28 Sep 2023 06:40:43 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4] staging: rtl8192e: renamed (3) variables
To: Gary Rookard <garyrookard@fastmail.org>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20230928000225.27912-1-garyrookard@fastmail.org>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20230928000225.27912-1-garyrookard@fastmail.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/28/23 02:02, Gary Rookard wrote:
> This patch renames the vaiable in staging/rtl8192e
> HTUpdateDefaultSetting -> ht_update_default_setting
> in (3) files of rtl8192e:
> 1) rtl819x_HTProc.c
> 2) rtllib.h
> 3) rtllib_module.c >
> Linux Kernel Coding Style "cleanup", no change in runtime,
> staging/rtl8192e builds before and after.
> 
> Signed-off-by: Gary Rookard <garyrookard@fastmail.org>

Hi Gary,

your subject is to general and also wrong as you change just one 
variable. Please find good examples in the in the kernel log.
Or here:
https://lore.kernel.org/linux-staging/20230921032515.96152-2-tdavies@darkphysics.net/T/#u

Omit the file names in the description as this is redundant.

You need a version history for all four versions of your patch.
See example:
https://lore.kernel.org/linux-staging/ZQGiqA2GoDp%2FWiPK@ubuntu.myguest.virtualbox.org/T/#u

Bye Philipp


> ---
>   drivers/staging/rtl8192e/rtl819x_HTProc.c | 2 +-
>   drivers/staging/rtl8192e/rtllib.h         | 2 +-
>   drivers/staging/rtl8192e/rtllib_module.c  | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
> index a7e356e90d0e..832f595d36c2 100644
> --- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
> +++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
> @@ -67,7 +67,7 @@ static u8 CISCO_BROADCOM[3] = {0x00, 0x17, 0x94};
>   
>   static u8 LINKSYS_MARVELL_4400N[3] = {0x00, 0x14, 0xa4};
>   
> -void HTUpdateDefaultSetting(struct rtllib_device *ieee)
> +void ht_update_default_setting(struct rtllib_device *ieee)
>   {
>   	struct rt_hi_throughput *ht_info = ieee->ht_info;
>   
> diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
> index bdbd27e382b9..ec1eef7486a2 100644
> --- a/drivers/staging/rtl8192e/rtllib.h
> +++ b/drivers/staging/rtl8192e/rtllib.h
> @@ -1785,7 +1785,7 @@ int rtllib_wx_get_rts(struct rtllib_device *ieee, struct iw_request_info *info,
>   void HTSetConnectBwMode(struct rtllib_device *ieee,
>   			enum ht_channel_width bandwidth,
>   			enum ht_extchnl_offset Offset);
> -void HTUpdateDefaultSetting(struct rtllib_device *ieee);
> +void ht_update_default_setting(struct rtllib_device *ieee);
>   void HTConstructCapabilityElement(struct rtllib_device *ieee,
>   				  u8 *posHTCap, u8 *len,
>   				  u8 isEncrypt, bool bAssoc);
> diff --git a/drivers/staging/rtl8192e/rtllib_module.c b/drivers/staging/rtl8192e/rtllib_module.c
> index abd6bfd4dfa3..859241af617c 100644
> --- a/drivers/staging/rtl8192e/rtllib_module.c
> +++ b/drivers/staging/rtl8192e/rtllib_module.c
> @@ -126,7 +126,7 @@ struct net_device *alloc_rtllib(int sizeof_priv)
>   	if (!ieee->ht_info)
>   		goto free_softmac;
>   
> -	HTUpdateDefaultSetting(ieee);
> +	ht_update_default_setting(ieee);
>   	HTInitializeHTInfo(ieee);
>   	rtllib_ts_init(ieee);
>   	for (i = 0; i < IEEE_IBSS_MAC_HASH_SIZE; i++)

