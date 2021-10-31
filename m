Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C1968
	for <linux-staging@lists.linux.dev>; Sun, 31 Oct 2021 18:58:09 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id n23so4581503pgh.8
        for <linux-staging@lists.linux.dev>; Sun, 31 Oct 2021 11:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=OwqCv2tOwFOSxBfcgnYlFpnN8ZNJu3pDOrEmFOrLeB8=;
        b=W3yRH4ZvXBqulzltQyZ3NdOUJbLxK1R58RuW5mU6v3tTzIiharpYuauFfOPqliARVP
         WczkS/+dkkJXZmA/sldBL9u2xTXtcPeIfgMRYwhawKAtqKXS2hYbFD4/PO9HivT3je8b
         rxwI3ZTJpIUdTZPDfK1nDah9ZJCwHF6zvWFi30UXSutbXfb7Qcc4v3R02AZI8X8TE8To
         GN8qr4n/JgCrOFBbfHukpBEtIZsaW8LuZefkDxXtbpe6Scqg7McxxwlmSdpi94Y4/boo
         4YzsqTV8tvDJhy6Ur+YVhbB5H3HqB5MvxrJNRjLwRksrRkaN+Ww6BZ0VPOERVvIJBQw5
         vDYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=OwqCv2tOwFOSxBfcgnYlFpnN8ZNJu3pDOrEmFOrLeB8=;
        b=icc7WksFJKNfISCk67AyOht4GRW3eyc/iEzOO68HExegn7YLhpImahujpdptSref38
         XqqY1LPZ2j1nHYiaHht646qAMWBjiW+NqGwlqJ9AV3OD9i8IfYIjjMNCeeKTFWOOECLb
         SftlMAQm0gdX2/2kG7YohotiCdaqBWqfW2REL5caiz682m9Af8z8FZ+6T9F5XEv6USuL
         rYBQRqb879EKRqP0/+uSIhffVJBPUfZ4m5mLwrSKdqE9sdjVrqXAR7VVqX/J5yQp5Qa5
         HzJ7BUO7v4LkwCBLoTfuNzd7ohn1FmO6nS9EvK8D+xu5pLPat4VkjmG5JT5B4S80qyLa
         OJlA==
X-Gm-Message-State: AOAM533y/i6TlTmdtPpXIsrSRAartPoidqroDOAAX/F4OEpL0mKkAN2B
	WTJHzCm+t9em149WFMewERA=
X-Google-Smtp-Source: ABdhPJzDVUSAbnMoVzR5t5zNxbxaGHOOj2HnUTX60D0voOWd2scb3xWqVvSo7e/VcH7SF3c797LDmQ==
X-Received: by 2002:a63:e24b:: with SMTP id y11mr18096090pgj.452.1635706688888;
        Sun, 31 Oct 2021 11:58:08 -0700 (PDT)
Received: from [192.168.1.2] ([59.95.88.136])
        by smtp.gmail.com with ESMTPSA id c4sm13697578pfl.53.2021.10.31.11.58.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 Oct 2021 11:58:08 -0700 (PDT)
Message-ID: <9a10f72e-b5d6-7c9a-50d4-cc750454ff2b@gmail.com>
Date: Mon, 1 Nov 2021 00:28:02 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Subject: Re: [PATCH] staging: rtl8192e: remove condition with no effect
Content-Language: en-GB
To: Greg KH <gregkh@linuxfoundation.org>
Cc: dan.carpenter@oracle.com, will+git@drnd.me, mitaliborkar810@gmail.com,
 eduard.vintila47@gmail.com, zhaoxiao@uniontech.com,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 saurav.girepunje@hotmail.com, Pavel Skripkin <paskripkin@gmail.com>
References: <YXmap8VIxfOpqeEY@Sauravs-MacBook-Air.local>
 <YX0NMIuPUoX3GZB2@kroah.com>
From: Saurav Girepunje <saurav.girepunje@gmail.com>
In-Reply-To: <YX0NMIuPUoX3GZB2@kroah.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 30/10/21 2:45 pm, Greg KH wrote:
> On Thu, Oct 28, 2021 at 12:04:43AM +0530, Saurav Girepunje wrote:
>> Remove the if and else code section for variable pHTInfo->bRegBW40MHz.
>> Just before the if condition variable is assign with value 1.
>> So if condition check for pHTInfo->bRegBW40MHz is always true.
>>
>> Similarly for the variable pHTInfo->SelfMimoPs value '3' is assign.
>> So if condition check with value '2' will never be true. Remove the
>> if condition check for pHTInfo->SelfMimoPs.
>>
>> Remove the extra blank lines from HTUpdateDefaultSetting function.
>>
>> Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
>> ---
>>  drivers/staging/rtl8192e/rtl819x_HTProc.c | 16 +---------------
>>  1 file changed, 1 insertion(+), 15 deletions(-)
>>
>> diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
>> index 3b8efaf9b88c..6925654dbc03 100644
>> --- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
>> +++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
>> @@ -72,34 +72,20 @@ void HTUpdateDefaultSetting(struct rtllib_device *ieee)
>>  	struct rt_hi_throughput *pHTInfo = ieee->pHTInfo;
>>
>>  	pHTInfo->bAcceptAddbaReq = 1;
>> -
>>  	pHTInfo->bRegShortGI20MHz = 1;
>>  	pHTInfo->bRegShortGI40MHz = 1;
>> -
>>  	pHTInfo->bRegBW40MHz = 1;
>> -
>> -	if (pHTInfo->bRegBW40MHz)
>> -		pHTInfo->bRegSuppCCK = 1;
>> -	else
>> -		pHTInfo->bRegSuppCCK = true;
>> -
>> +	pHTInfo->bRegSuppCCK = 1;
>>  	pHTInfo->nAMSDU_MaxSize = 7935UL;
>>  	pHTInfo->bAMSDU_Support = 0;
>> -
>>  	pHTInfo->bAMPDUEnable = 1;
>>  	pHTInfo->AMPDU_Factor = 2;
>>  	pHTInfo->MPDU_Density = 0;
>> -
>>  	pHTInfo->SelfMimoPs = 3;
>> -	if (pHTInfo->SelfMimoPs == 2)
>> -		pHTInfo->SelfMimoPs = 3;
>>  	ieee->bTxDisableRateFallBack = 0;
>>  	ieee->bTxUseDriverAssingedRate = 0;
>> -
>>  	ieee->bTxEnableFwCalcDur = 1;
>> -
>>  	pHTInfo->bRegRT2RTAggregation = 1;
>> -
>>  	pHTInfo->bRegRxReorderEnable = 1;
>>  	pHTInfo->RxReorderWinSize = 64;
>>  	pHTInfo->RxReorderPendingTime = 30;
>> --
>> 2.33.0
>>
>>
> 
> Hi,
> 
> This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
> a patch that has triggered this response.  He used to manually respond
> to these common problems, but in order to save his sanity (he kept
> writing the same thing over and over, yet to different people), I was
> created.  Hopefully you will not take offence and will fix the problem
> in your patch and resubmit it so that it can be accepted into the Linux
> kernel tree.
> 
> You are receiving this message because of the following common error(s)
> as indicated below:
> 
> - Your patch did many different things all at once, making it difficult
>   to review.  All Linux kernel patches need to only do one thing at a
>   time.  If you need to do multiple things (such as clean up all coding
>   style issues in a file/driver), do it in a sequence of patches, each
>   one doing only one thing.  This will make it easier to review the
>   patches to ensure that they are correct, and to help alleviate any
>   merge issues that larger patches can cause.

> If you wish to discuss this problem further, or you have questions about
> how to resolve this issue, please feel free to respond to this email and
> Greg will reply once he has dug out from the pending patches received
> from other developers.
> 
> thanks,
> 
> greg k-h's patch email bot
> 

I will break this in multiple patch , One thing at a time.

Regards,
Saurav 
