Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC7B2F21
	for <linux-staging@lists.linux.dev>; Mon,  4 Apr 2022 14:15:14 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id l26so3917023ejx.1
        for <linux-staging@lists.linux.dev>; Mon, 04 Apr 2022 07:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=enyn11va52J9YxQxLmqhfvPGfWKhAIsk5cKTiEymAy8=;
        b=DYgwwlBRxHL11XWuLBjeldXaJ17wCvLDMeD+znq7eRfTRHLj1uU+klXgm4fbtlPIp9
         aynoOVc2w0F/r0ZVkpjk5GVq1uOhIMyoLUSl576QC+GOz4CIssm2ehzVx2fIioxLoU16
         UEMww73nSnux78NcL5HqujFuN9hbW25wwxVPN+CKctdQ0udFOiFDEqqychsRMl7uGstM
         Y05oO0hiHok3yp8v/gVaNWzrBoVcKiyemVg2fUspexCn6C1cTCbQQB4+ZwoJGngYbbCq
         L0baz3djCGDN/VIHHCJh5x3kmz+6qn1sUsV6OJhphL9nAwBYjQFNqRZwXYPIIQ0Z6k5L
         uwxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=enyn11va52J9YxQxLmqhfvPGfWKhAIsk5cKTiEymAy8=;
        b=n8I5d5tW/9GwKanbfnDP7GlCwvkHrlrHRSvGT9QLPyByn4ibFgq81MmKCT8mCUMfeu
         toEwCYBfnBpDyDWI1Wl23miqwfHw8zGkXUVuQByLsmlSE5Shtwt3T9i/+OQ8oUzmm6qy
         BBP3T9rWLZY2M0zKUXZEr0oD5yH5RVsMcVc/8NbQL99LDLr6wv+QcWv98n7BD6Gooet5
         dwc7/j3NoVzod3Ua+ztDQfyhD+OrFYkAbkXpy+T46KsNE1kbs2c6RiXLene2T5Zl0/h7
         w2+Sf2jJX2kGhFLVsNoglsSQqa2l29NbxqZdPo5Bf41Yi9leDex1NY+hpTBCEFMoA6pA
         DHjA==
X-Gm-Message-State: AOAM533Lf+sQ/rCSEj6DFcyoRUrI+gPOSABUhyii0/Xs/Uu9SU3Mb3/3
	PZ895V8/xBGBlhWHYqXQndY=
X-Google-Smtp-Source: ABdhPJyqXfzSLxl8wjDqi4xLBZx1uRh2S2sl5ltqUKrbYSm4o59TfjmyHaflD9f40+BsygBGXNdU/g==
X-Received: by 2002:a17:907:3e03:b0:6da:8c5a:6d4a with SMTP id hp3-20020a1709073e0300b006da8c5a6d4amr200538ejc.585.1649081712524;
        Mon, 04 Apr 2022 07:15:12 -0700 (PDT)
Received: from [192.168.0.253] (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id r29-20020a50c01d000000b00415fb0dc793sm5441200edb.47.2022.04.04.07.15.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Apr 2022 07:15:11 -0700 (PDT)
Message-ID: <00574358-05fd-d80f-e052-ba9549a120ed@gmail.com>
Date: Mon, 4 Apr 2022 16:15:11 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] staging: r8188eu: remove unncessary ternary operator
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net,
 phil@philpotter.co.uk, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20220402173835.7560-1-straube.linux@gmail.com>
 <20220404130854.GB3293@kadam>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <20220404130854.GB3293@kadam>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/4/22 15:08, Dan Carpenter wrote:
> On Sat, Apr 02, 2022 at 07:38:35PM +0200, Michael Straube wrote:
>> diff --git a/drivers/staging/r8188eu/hal/rtl8188e_cmd.c b/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
>> index 45b788212628..18650cd96f09 100644
>> --- a/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
>> +++ b/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
>> @@ -137,7 +137,7 @@ void rtl8188e_Add_RateATid(struct adapter *pAdapter, u32 bitmap, u8 arg, u8 rssi
>>   
>>   	bitmap |= ((raid << 28) & 0xf0000000);
>>   
>> -	short_gi_rate = (arg & BIT(5)) ? true : false;
>> +	short_gi_rate = arg & BIT(5);
>>   
> 
> This is a bug.  Valid values of short_gi_rate are 0 and 1 but this sets
> it to BIT(5) so it will break odm_RateUp_8188E() which tests for:
> 
> 	else if ((pRaInfo->SGIEnable) != 1)
> 

Oh I see, I should have been more careful with this type of removals.

>>   	raid = (bitmap >> 28) & 0x0f;
>>   
>> diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
>> index 6811be95da9a..ffc82d17ddbe 100644
>> --- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
>> +++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
>> @@ -747,7 +747,7 @@ void Hal_ReadPowerSavingMode88E(struct adapter *padapter, u8 *hwinfo, bool AutoL
>>   
>>   		/*  decide hw if support remote wakeup function */
>>   		/*  if hw supported, 8051 (SIE) will generate WeakUP signal(D+/D- toggle) when autoresume */
>> -		padapter->pwrctrlpriv.bSupportRemoteWakeup = (hwinfo[EEPROM_USB_OPTIONAL_FUNCTION0] & BIT(1)) ? true : false;
>> +		padapter->pwrctrlpriv.bSupportRemoteWakeup = hwinfo[EEPROM_USB_OPTIONAL_FUNCTION0] & BIT(1);
> 
> I have not looked at this one to see if has a similar issue...  I don't
> necessarily want to audit all of these.  I guess I will, but could you
> do it first and then I will check?
> 

Sure I'll do.

Thanks,
Michael

>> diff --git a/drivers/staging/r8188eu/include/ieee80211.h b/drivers/staging/r8188eu/include/ieee80211.h
>> index 8c20363cdd31..03d63257797a 100644
>> --- a/drivers/staging/r8188eu/include/ieee80211.h
>> +++ b/drivers/staging/r8188eu/include/ieee80211.h
>> @@ -127,7 +127,7 @@ enum NETWORK_TYPE {
>>   	 (WIRELESS_11B | WIRELESS_11G | WIRELESS_11_24N)
>>   
>>   #define IsSupported24G(NetType)					\
>> -	((NetType) & SUPPORTED_24G_NETTYPE_MSK ? true : false)
>> +	((NetType) & SUPPORTED_24G_NETTYPE_MSK)
> 
> This too.
> 
>>   
>>   #define IsEnableHWCCK(NetType)					\
>>   	IsSupported24G(NetType)
>> @@ -135,11 +135,11 @@ enum NETWORK_TYPE {
>>   #define IsSupportedRxCCK(NetType) IsEnableHWCCK(NetType)
>>   
>>   #define IsSupportedTxCCK(NetType)				\
>> -	((NetType) & (WIRELESS_11B) ? true : false)
>> +	((NetType) & WIRELESS_11B)
>>   #define IsSupportedTxOFDM(NetType)				\
>> -	((NetType) & (WIRELESS_11G) ? true : false)
>> +	((NetType) & WIRELESS_11G)
>>   #define IsSupportedTxMCS(NetType)				\
>> -	((NetType) & (WIRELESS_11_24N) ? true : false)
>> +	((NetType) & WIRELESS_11_24N)
>>   
> 
> And this.
> 
> regards,
> dan carpenter
> 
