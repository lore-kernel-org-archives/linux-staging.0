Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B7E29A2;
	Wed, 30 Mar 2022 17:38:51 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id v64-20020a1cac43000000b0038cfd1b3a6dso316133wme.5;
        Wed, 30 Mar 2022 10:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=s/RKowGNcyAz+6eEh3xMpapodgsQb/fvti1gfWp+kgI=;
        b=bfekdHmoCCQXGlBqaIiNShhbEFM4MG7+AL1kJo/g/hTQVQ+tbiHFYQBiPnESIw7d31
         G+vB65B3LLh8kZvYqpVYn/OilmBjH9ty7SN+u8oPviwrEwNPwY1HBQS8nmvafzVesjeJ
         1YqQIm9fw9PxTEFsHmoU7bJnlKGZUrYkQVxkc8SGnycoHruyEpxRSfZcjSi6ffVrgvNp
         kQ2vuRWxPwKriVp2OtkIA1DV0S1L3si3zSYOPwgM64U4wQzlRNFVNmNf99pIgNra89ON
         mt3BTi4j+44h5wThdRKqLiaCANq6h69VV4Fgo/y/HbjEIiel4Eca/wY3QoWD3rqL4d3y
         O7sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=s/RKowGNcyAz+6eEh3xMpapodgsQb/fvti1gfWp+kgI=;
        b=1AWkQQwMOaijK6PiS/v8lrBKNoQ21fkpviEUKk8AZjOSl7ymuefrS9jrs4mqGneAze
         m8QIE7TDkWkgs/LHiYSX6isB2BR6fBemVT7ktFBVVYsqc0eEP49AnETBOkEexVgkYmiH
         Y2Qdg6qIVh1mX7sd14bbe858MJ8uZMm6SdNGRhmGEwbdO7P+jqHSg8fPOFB/NRiB8dOv
         0RSrrt4vljz+P9zKFjjG1RFGUOoiOYfqbsHDMB59jFd3CpMBEQia01LE/L2Uq/UArPJZ
         QnYsJUY9L6pEcWuYRutYr0I3BmEYQ26OFAegjNT8ZW9xnCCrC/qFKoAQGn7TsSutfK64
         B+5Q==
X-Gm-Message-State: AOAM531p30simBI4YkVDgqVHAKn1R27Q/tzwPt/ON2/YKNNhYPPNLgJ1
	vYj5todVv1jgin4NZvjNICY=
X-Google-Smtp-Source: ABdhPJwDLV/c3Iis8GSNyw5iaY23HbEdflpzpvf8zyL4cC+QnDBB/JQGzc1AmObtxhsUHzPS30yyPQ==
X-Received: by 2002:a1c:f30b:0:b0:380:e444:86b9 with SMTP id q11-20020a1cf30b000000b00380e44486b9mr513171wmq.81.1648661930105;
        Wed, 30 Mar 2022 10:38:50 -0700 (PDT)
Received: from [192.168.1.14] ([41.37.132.115])
        by smtp.gmail.com with ESMTPSA id p14-20020a5d59ae000000b00203dcc87d39sm28183523wrr.54.2022.03.30.10.38.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Mar 2022 10:38:49 -0700 (PDT)
Message-ID: <9e6abf4a-cf5c-05c9-b179-b863ef53f35f@gmail.com>
Date: Wed, 30 Mar 2022 19:38:47 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] staging:rtl8723bs:rtw_cmd.c remove suspect indent
Content-Language: en-US
To: Alison Schofield <alison.schofield@intel.com>
Cc: outreachy@lists.linux.dev, gregkh@linuxfoundation.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20220330153100.5813-1-eng.alaamohamedsoliman.am@gmail.com>
 <20220330170936.GA1176693@alison-desk>
From: Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>
In-Reply-To: <20220330170936.GA1176693@alison-desk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On ٣٠‏/٣‏/٢٠٢٢ ١٩:٠٩, Alison Schofield wrote:
> On Wed, Mar 30, 2022 at 05:31:00PM +0200, Alaa Mohamed wrote:
>> Fix "WARNING: suspect code indent for conditional
>> statements (16, 32)" for line 1240
>> founded by checkpatch.pl
>>
>> Signed-off-by: Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>
> Hi Alaa,
>
> https://kernelnewbies.org/PatchPhilosophy
> Please take a look at the section on "Patch subject formatting"
> and the follow on sections about checkpatch descriptions.

I will check , Thank you

>
> Thanks,
> Alison
>
>
>> ---
>>   drivers/staging/rtl8723bs/core/rtw_cmd.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
>> index 14d37b369273..46e18a90529f 100644
>> --- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
>> +++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
>> @@ -1238,7 +1238,7 @@ u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
>>   		/*&& !MgntInitAdapterInProgress(pMgntInfo)*/) {
>>   		/*  if we raise bBusyTraffic in last watchdog, using lower threshold. */
>>   		if (pmlmepriv->LinkDetectInfo.bBusyTraffic)
>> -				BusyThreshold = BusyThresholdLow;
>> +			BusyThreshold = BusyThresholdLow;
>>   
>>   		if (pmlmepriv->LinkDetectInfo.NumRxOkInPeriod > BusyThreshold ||
>>   			pmlmepriv->LinkDetectInfo.NumTxOkInPeriod > BusyThreshold) {
>> -- 
>> 2.35.1
>>
>>
