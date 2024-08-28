Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8550A1AB512
	for <linux-staging@lists.linux.dev>; Wed, 28 Aug 2024 21:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724880881; cv=none; b=hqt9xp96Kvmo/x5wtcTe/MeexT5V3lc0SWAV2JrjGRPy2rXKLgbciA2Dze5N8ZfGoWmW5m0EMlgBFzl2VObdZ6wOTmVR9UMf3Cfuyj8nOEVSC3/WD8psidJb8x84gQthdh6/QBcaM5gg12S5Dr9n78zQP+FQS2uB1wmPx0AIAQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724880881; c=relaxed/simple;
	bh=fcerxRoXwxW0shvchrteonn+/iKMsN7xAwIsxhNPucc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Y1BTXqfmD3ZEhNFG+EkWGoXGVRSYAUSaMYIaDps4BLQzEhuT74202WZDtu413fp5yqI6zqDhEjTeh9ujC6bSAI3xv7vOytVughAw3Sq6JVw84naS4uchP5OTb4M+1Tneixd5cKXIxkXAIdLabDPhQI/ebEkzoyNaOITHF3uK2Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BtQXMgEz; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BtQXMgEz"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-7cdf2ac6130so2121077a12.2
        for <linux-staging@lists.linux.dev>; Wed, 28 Aug 2024 14:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724880880; x=1725485680; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WoCoJVTVwu650QBIibLpLCVpAhZfTglhrS1nWqnmQi0=;
        b=BtQXMgEzSMNJvXrvWID0Ah2SUqY3j7w93oklRj2GmsE8Een5cLjSPDj/YSX5w88dXb
         L0ViOLIlI7sF1n//rCb2yAuufQ648JoYmG/SYRoRnN0E8G38Uz5gsCmvYo128TdVqcnr
         wjPw8wYxdAzA4n1dbDbV19MiE0C/7avvIquBE+5FknxbBfvLoHzK038FGz6KO0it8b9N
         CDsBgWVkT5gK5+QM6jymdKRbVOuvnJhW3la6L8s16LEMvJDr5cgGa6fO/dYRCX3RCtOK
         PM5XZS8VsWFfoIKnMtsX7U4gOJQvb6o0fZawamFYkiKSmPbqFObt//m+WiNzYvbGQDRY
         Qo/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724880880; x=1725485680;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WoCoJVTVwu650QBIibLpLCVpAhZfTglhrS1nWqnmQi0=;
        b=ZngdWve8ruiM593bk6SRwIU84HFNS4CHN2gXC0e+rbQs7t/vlU7w7RkutFxb+RUDo9
         luRx9+YyPeWENpq735MRnBiE8uzwzolC2O5ZePS5MYq/gxCjKKCrcP5ybZSwS0+9jCbc
         Lfp9Ceqq57+G6tknQkI0usrtk6suQeGFbrCszjj2w84kwfp57cVPU6S2RCjte7LuW9E1
         8pAwCLJ4GAEtoUkXYzuqgpsYIg1m7K8OUQELH/ggO1IGkDeQxSoz0YOAYsaNxykfpaEc
         lbzaQU8cMHkArH5dIZGOtH2a3AYBQZOt7LXCNQMspFYoR+MpfrtFfZZuu6W24bfwKPY9
         oaxw==
X-Forwarded-Encrypted: i=1; AJvYcCXDM1kbGEplEgBT7EaVF8+SdOL4JZwqNWULTniuwF6foJ6IVdqMiLaiQoeCKbNGVt5Xzc/Q9VwflZADFof3@lists.linux.dev
X-Gm-Message-State: AOJu0YyXsH4nyleIdAri2910OFZYnXz3EHU+j/hco9uirOsyDlQ7Qj9k
	ulAe6ESacOWvNTPaHCYKEoRtwIpiw+WEUTablF/G6WN79A/+ee5t
X-Google-Smtp-Source: AGHT+IFp0jxYN1jb/qPGb4pEaRO+zB8kKpCSNIKKQyEmk5tTtyhQmK8O+RWoOsLngC08rXL2dW7/1w==
X-Received: by 2002:a17:90b:364b:b0:2ca:7636:2217 with SMTP id 98e67ed59e1d1-2d85617e3e4mr621991a91.2.1724880879732;
        Wed, 28 Aug 2024 14:34:39 -0700 (PDT)
Received: from [192.168.79.27] ([49.207.54.176])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d8445f8dabsm2457513a91.13.2024.08.28.14.34.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Aug 2024 14:34:39 -0700 (PDT)
Message-ID: <7423460a-ff73-44c1-864e-2dafe31b1c7c@gmail.com>
Date: Thu, 29 Aug 2024 03:04:36 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] staging: rtl8712: Fix style issues in rtl871x_io.c
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>,
 florian.c.schilhabel@googlemail.com, gregkh@linuxfoundation.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240828204552.26790-2-masingh.linux@gmail.com>
 <607b86cd-d89a-4072-af36-ce2ce5c1f7fe@gmail.com>
Content-Language: en-US
From: Manisha Singh <masingh.linux@gmail.com>
In-Reply-To: <607b86cd-d89a-4072-af36-ce2ce5c1f7fe@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 8/29/24 02:38, Philipp Hortmann wrote:
> On 8/28/24 22:45, Manisha Singh wrote:
>> Remove multiple assignments from a line
>>
>> CHECK: multiple assignments should be avoided
>> +    pintf_priv = pintf_hdl->pintfpriv = kmalloc(sizeof(struct 
>> intf_priv),
>>
>
> Hi Manisha,
> please remove the 4 upper lines of the description. They are not 
> required.
Sure.
>> Refactor the _init_intf_hdl() function to avoid multiple
>> assignments in a single statement. This change improves code readability
>> and adheres to kernel coding style guidelines.
>>
>> Signed-off-by: Manisha Singh <masingh.linux@gmail.com>
>> ---
>> Changes Since V1:
>>     Broke the patch into 2 different fixes
>>
>>   drivers/staging/rtl8712/rtl871x_io.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/staging/rtl8712/rtl871x_io.c 
>> b/drivers/staging/rtl8712/rtl871x_io.c
>> index 6789a4c98564..6311ac15c581 100644
>> --- a/drivers/staging/rtl8712/rtl871x_io.c
>> +++ b/drivers/staging/rtl8712/rtl871x_io.c
>> @@ -48,10 +48,10 @@ static uint _init_intf_hdl(struct _adapter 
>> *padapter,
>>       set_intf_funs = &(r8712_usb_set_intf_funs);
>>       set_intf_ops = &r8712_usb_set_intf_ops;
>>       init_intf_priv = &r8712_usb_init_intf_priv;
>> -    pintf_priv = pintf_hdl->pintfpriv = kmalloc(sizeof(struct 
>> intf_priv),
>> -                            GFP_ATOMIC);
>> +    pintf_priv = kmalloc(sizeof(struct intf_priv), GFP_ATOMIC);
>>       if (!pintf_priv)
>>           goto _init_intf_hdl_fail;
>
> By pushing the below statement after the "if (!pintf_priv)" you change 
> the logic. Is this really wanted? Why do you think it is better? I 
> would avoid this and it would be a separate patch anyhow.
>
>> +    pintf_hdl->pintfpriv = pintf_priv;
>
> Thanks for your support.
>
> Bye Philipp

Yeah, I shouldn't have changed the logic. I don't have hardware to test 
it, Let's move the assignment before the condition.

Thanks,
Manisha


>
>>       pintf_hdl->adapter = (u8 *)padapter;
>>       set_intf_option(&pintf_hdl->intf_option);
>>       set_intf_funs(pintf_hdl);
>
