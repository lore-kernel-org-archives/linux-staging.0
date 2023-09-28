Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB767D522
	for <linux-staging@lists.linux.dev>; Thu, 28 Sep 2023 05:00:40 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-9ae65c0e46fso315061866b.0
        for <linux-staging@lists.linux.dev>; Wed, 27 Sep 2023 22:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695877239; x=1696482039; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xm1G3DvjTPNMs8CaRtbq59OpemJU/fBRS7beruUP0HQ=;
        b=C12X8kFfE4nnMk1WMVcnkUFVvbmF0q3WkD75yjBCOXxPJGnZ6tmRVp2dppGWG1M+uJ
         MxqddAFMAoSiE1DaOWNU+Ww7g4PrR2zzUohBNkkCJXcROM8Z54mnkrZs6gAP/Qd4dvgn
         aoP6o5LZVR+j/kNnN4BputBkuUZPXuxjgPL62BiJYllJ2nKpryKoB3SnxG2F5E8gElBP
         Yw6E0eSlg3v3c9SNEculZWg3Sr9oh2zzsZ3fMO+UrUk3Nl0JtqM1bTlqi5zltsgcYv7g
         /FfFd0tYh5TD8Pne1jAxzdMX509XE0T5OCWTADzCFpYoIOVsXurmbA9AUg0vL0iE3A/J
         wCSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695877239; x=1696482039;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xm1G3DvjTPNMs8CaRtbq59OpemJU/fBRS7beruUP0HQ=;
        b=W5cYh6Hh+iheEejuklduDhuKeYXWH5cY9dWT5A718rB5XiUVEMEF9oVr+d5fTSohP4
         yWYtG1kED7OnCvvUHagBnyq8j9SISJHCSWIv4qhtMjeD9LF9LGO2GHKqAaH/F24THHyj
         rJLE6lpwM9Fx2b286wx8hM6fpW4H0cQ+DgarnWWeQmJW8sE4Or9on/hnPvkz51FdJH2w
         DNg7VsydF6JzCqtaVPtgi0AbnNX+1oCZd9UHmVX3YuJN+LroUnMxCEDK8JJi7hw1J8z9
         Rq0tpC/QczfiDX9nG+su3e7/kpZ1cHCxLkZZ2XO8Q3rbvXWAcbArWwBPp4Q7niQrkz+b
         F/SA==
X-Gm-Message-State: AOJu0YzCkjOEX4HNbNkOJwsSH7MeAzkfHr/0ic45WS24N/G5UbPUZ041
	iRUSMSbHr3j/C4+qD9tJwWI=
X-Google-Smtp-Source: AGHT+IHdYT/Fl1fz6xwU3ypHWI9rdN7yXdYZZ199/9bgje8Iy6Nr0bhkyyvy82y+xy/OcHD+04fS0A==
X-Received: by 2002:a17:906:530b:b0:9ae:4492:df34 with SMTP id h11-20020a170906530b00b009ae4492df34mr143814ejo.6.1695877238888;
        Wed, 27 Sep 2023 22:00:38 -0700 (PDT)
Received: from [192.168.0.104] (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id e8-20020a170906374800b0099cf840527csm10233713ejc.153.2023.09.27.22.00.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Sep 2023 22:00:38 -0700 (PDT)
Message-ID: <2cfa5c9b-f053-5832-4249-950250660339@gmail.com>
Date: Thu, 28 Sep 2023 07:00:37 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4] staging: rtl8192e: renamed (3) variables
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Gary Rookard <garyrookard@fastmail.org>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20230928000225.27912-1-garyrookard@fastmail.org>
 <d9a089f9-c439-97bd-5abc-18390c3ec0cb@gmail.com>
In-Reply-To: <d9a089f9-c439-97bd-5abc-18390c3ec0cb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/28/23 06:40, Philipp Hortmann wrote:
> On 9/28/23 02:02, Gary Rookard wrote:
>> This patch renames the vaiable in staging/rtl8192e
>> HTUpdateDefaultSetting -> ht_update_default_setting
>> in (3) files of rtl8192e:
>> 1) rtl819x_HTProc.c
>> 2) rtllib.h
>> 3) rtllib_module.c >
>> Linux Kernel Coding Style "cleanup", no change in runtime,
>> staging/rtl8192e builds before and after.
>>
>> Signed-off-by: Gary Rookard <garyrookard@fastmail.org>
> 
> Hi Gary,
> 
> your subject is to general and also wrong as you change just one 
> variable. Please find good examples in the in the kernel log.
> Or here:
> https://lore.kernel.org/linux-staging/20230921032515.96152-2-tdavies@darkphysics.net/T/#u
> 
> Omit the file names in the description as this is redundant.
> 
> You need a version history for all four versions of your patch.
> See example:
> https://lore.kernel.org/linux-staging/ZQGiqA2GoDp%2FWiPK@ubuntu.myguest.virtualbox.org/T/#u
> 
> Bye Philipp
> 

Hi Gary,

this is not a variable. It is a function name. To keep the namespace 
clean it is required to add a rtllib_ in front of the function name.

Bye Philipp

> 
>> ---
>>   drivers/staging/rtl8192e/rtl819x_HTProc.c | 2 +-
>>   drivers/staging/rtl8192e/rtllib.h         | 2 +-
>>   drivers/staging/rtl8192e/rtllib_module.c  | 2 +-
>>   3 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c 
>> b/drivers/staging/rtl8192e/rtl819x_HTProc.c
>> index a7e356e90d0e..832f595d36c2 100644
>> --- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
>> +++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
>> @@ -67,7 +67,7 @@ static u8 CISCO_BROADCOM[3] = {0x00, 0x17, 0x94};
>>   static u8 LINKSYS_MARVELL_4400N[3] = {0x00, 0x14, 0xa4};
>> -void HTUpdateDefaultSetting(struct rtllib_device *ieee)
>> +void ht_update_default_setting(struct rtllib_device *ieee)
>>   {
>>       struct rt_hi_throughput *ht_info = ieee->ht_info;
>> diff --git a/drivers/staging/rtl8192e/rtllib.h 
>> b/drivers/staging/rtl8192e/rtllib.h
>> index bdbd27e382b9..ec1eef7486a2 100644
>> --- a/drivers/staging/rtl8192e/rtllib.h
>> +++ b/drivers/staging/rtl8192e/rtllib.h
>> @@ -1785,7 +1785,7 @@ int rtllib_wx_get_rts(struct rtllib_device 
>> *ieee, struct iw_request_info *info,
>>   void HTSetConnectBwMode(struct rtllib_device *ieee,
>>               enum ht_channel_width bandwidth,
>>               enum ht_extchnl_offset Offset);
>> -void HTUpdateDefaultSetting(struct rtllib_device *ieee);
>> +void ht_update_default_setting(struct rtllib_device *ieee);
>>   void HTConstructCapabilityElement(struct rtllib_device *ieee,
>>                     u8 *posHTCap, u8 *len,
>>                     u8 isEncrypt, bool bAssoc);
>> diff --git a/drivers/staging/rtl8192e/rtllib_module.c 
>> b/drivers/staging/rtl8192e/rtllib_module.c
>> index abd6bfd4dfa3..859241af617c 100644
>> --- a/drivers/staging/rtl8192e/rtllib_module.c
>> +++ b/drivers/staging/rtl8192e/rtllib_module.c
>> @@ -126,7 +126,7 @@ struct net_device *alloc_rtllib(int sizeof_priv)
>>       if (!ieee->ht_info)
>>           goto free_softmac;
>> -    HTUpdateDefaultSetting(ieee);
>> +    ht_update_default_setting(ieee);
>>       HTInitializeHTInfo(ieee);
>>       rtllib_ts_init(ieee);
>>       for (i = 0; i < IEEE_IBSS_MAC_HASH_SIZE; i++)
> 

