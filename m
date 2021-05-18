Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0341429CA
	for <linux-staging@lists.linux.dev>; Tue, 18 May 2021 04:00:31 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id g18so4778661pfr.2
        for <linux-staging@lists.linux.dev>; Mon, 17 May 2021 21:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=i3POdstfkt+dZTR4OIcnuNy8s2PWHNkzuJgiQuuTgAQ=;
        b=KS1e8JpG2CnFawuDNSvvKKQUfQMW1Q6fDV4/tOM2M+VNKTUmdwpVHCtL94rRPUxT5x
         BwFmCm+m4kgbn+glU8S7n/JOr9RPbau2vSLv8bNFyvJevoFQ6J5bif/nM5qu6dRjzaFj
         FtsjMMnbvwnGImjh3KMrGgT0Vg8FFC90sBZowIDDdka/Wib0HAMZEkG1LPc06v8JVonx
         xO7cJ082vJF5WL1LuAFQirgogZoFi6mH8L3uc9Hjx+6+Zbdhpsp3p6m6C65fEYYKuakA
         djQcgJE+0xrpeVjtfPnLILdlc8Etf+Ho0bswHVY6Q+H/3AULtyH9JGBE9FYuApnb1n1L
         48lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=i3POdstfkt+dZTR4OIcnuNy8s2PWHNkzuJgiQuuTgAQ=;
        b=LaC7vj0teXs5l7Tz2zf0jwdcyqyO8+h4Q2NREbOAKGOb6SplBJA/EEKT7MvZbnq/wh
         u/etkOL4G3Rl3SO64cm1R+b9MgI0XOtymXJvNIviH3BuYl2EHegxuFg/xK55Vhhic3rt
         NiX4sRlKYhQ7zUjWrB+vstOKD31XNBeitg2429vz+2rltD47EwT+J93unspUGsDPuI/S
         GufD2EpwTXEnjRVOlMhWEoZoOsVGjFsyYV/Rx+ZXapO065V8whnlR3kYrCqf+cGqODEC
         +EJx9oAJ8RkQNCmxwwMDopiXj3bBvGL1xYP2z18nUWqTtwv9O+aIS8WL5l0byW3nFRXQ
         SmKg==
X-Gm-Message-State: AOAM531HIzqt5UwXu1cnbiALYdT/wahRZmR1ggqG9MwXi55x9MpscEIm
	ywPyqiSGpmsZZEhIw/AWWZk=
X-Google-Smtp-Source: ABdhPJwQWx4oTSaAqUlBwAQjgE4KgZqzb3+auhP7v9j+gC5Dm7V3K4AxQGfbZAClrVmLrLJ+ss6pDQ==
X-Received: by 2002:aa7:8d5a:0:b029:227:7b07:7d8b with SMTP id s26-20020aa78d5a0000b02902277b077d8bmr3130429pfe.26.1621310431545;
        Mon, 17 May 2021 21:00:31 -0700 (PDT)
Received: from [10.71.15.213] ([203.126.139.254])
        by smtp.gmail.com with ESMTPSA id f6sm10795529pfe.74.2021.05.17.21.00.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 May 2021 21:00:30 -0700 (PDT)
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: gregkh@linuxfoundation.org, marcocesati@gmail.com,
 fabioaiuto83@gmail.com, fmdefrancesco@gmail.com, eantoranz@gmail.com,
 hdegoede@redhat.com, Larry.Finger@lwfinger.net, skhan@linuxfoundation.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20210516122927.1132356-1-desmondcheongzx@gmail.com>
 <20210516122927.1132356-8-desmondcheongzx@gmail.com>
 <20210517101302.GF1955@kadam>
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Subject: Re: [PATCH 7/7] Staging: rtl8723bs: fix block comment in
 HalBtc8723b1Ant.c
Message-ID: <197c91ac-5db2-f439-0f88-0f3da04842f6@gmail.com>
Date: Tue, 18 May 2021 00:00:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210517101302.GF1955@kadam>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 17/5/21 6:13 am, Dan Carpenter wrote:
> On Sun, May 16, 2021 at 08:29:27AM -0400, Desmond Cheong Zhi Xi wrote:
>> This commit fixes the following checkpatch.pl warning:
>>
>> WARNING: Block comments use * on subsequent lines
>> +		/*
>> +		CL_SPRINTF(cliBuf, BT_TMP_BUF_SIZE, "\r\n %-35s = 0x%x ", "Latest error condition(should be 0)", \
>>
>> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
>> ---
>>   drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
>> index cc7f558903ac..87156b2cd1f0 100644
>> --- a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
>> +++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
>> @@ -2511,10 +2511,10 @@ void EXhalbtc8723b1ant_DisplayCoexInfo(struct btc_coexist *pBtCoexist)
>>   		CL_PRINTF(cliBuf);
>>   
>>   		/*
>> -		CL_SPRINTF(cliBuf, BT_TMP_BUF_SIZE, "\r\n %-35s = 0x%x ", "Latest error condition(should be 0)", \
>> -			pCoexDm->errorCondition);
>> -		CL_PRINTF(cliBuf);
>> -		*/
>> +		 *CL_SPRINTF(cliBuf, BT_TMP_BUF_SIZE, "\r\n %-35s = 0x%x ", "Latest error condition(should be 0)",
>> +		 *	pCoexDm->errorCondition);
>> +		 *CL_PRINTF(cliBuf);
>> +		 */
>>   	}
> 
> Always just delete dead code.  Otherwise the patchset seems good.
> 
> regards,
> dan carpenter
> 

Thanks for the feedback, Dan. I'll remove the dead code in a v2 patchset.

Best wishes,
Desmond
