Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA863C0A
	for <linux-staging@lists.linux.dev>; Mon, 18 Jul 2022 20:01:03 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id f24-20020a1cc918000000b003a30178c022so8541932wmb.3
        for <linux-staging@lists.linux.dev>; Mon, 18 Jul 2022 13:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=juywSF6kivPVUCDC/3oKIs3f7hUcTtSz7n8yKgroz60=;
        b=ZvIYtRO+ujX46pjEvyB7XnyOdQeKac4TxCgDWEn/vnwhJndWwMvo/lHoJiWYKHCaVe
         QIAqdcg/9E+mc3lXM2mfr+S1kIT9OxDuTe68b5ibo2AWP8EdCjByWcVPTheIUoO1Ds95
         l2GphB6de49/b0l18CM1srazpj+m6DpVKlGm4Y+6MBRjJg3ntjnZ7nsxobi4wlTiRZpo
         xgNEYwQF0vofUDHhSSkCZii8FNwJPJxcrp2WpduwD94EGdsyBU1JlJRQal56vDAjzL5L
         REwthKiBkyphAnJi2jo+6F0qLPS+dQT+7AFXoLbBc045anv+ng2tM1DBq9MHDEWkL7Kt
         1aMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=juywSF6kivPVUCDC/3oKIs3f7hUcTtSz7n8yKgroz60=;
        b=Nue1FTjn3SlBEqrX8+wvVG0teYnvE7a0vBnWNbK58bmRE5yYaq6/Lf35RNw88DRLDs
         vaEYAnFTIehDbfqEZzpe/KF44/Frsj0rOEVZDMcsFroS4IwTA5hYUgDk61HrQftkRkMJ
         hNIxYkqGXNDtC2S+5l+dqnP8W9FA5oL572EXeplaizRThs210IWdrq+doMUkmhYDsL+N
         Tl0kciuVBfXLBvvNY60IAeGtYAQoYKSv9rdauYulZonDVobevvkhwJRFrEoSidHXXjPJ
         0uMMLCsQPSKjrT3tTjKi55YFK1Np5Bx36Svu/znr6yvuR1nanrt9dwA1ZLHNAPbAH4Rj
         v43Q==
X-Gm-Message-State: AJIora+IOHSulZ+2INkn64qV07JXhkt+eSwjdqjSkb5eZE+0wchMjXt1
	FeoTeMTO+HQ/Ow8YPO8ao5Q=
X-Google-Smtp-Source: AGRyM1tUpgqlD9Quxxx+3N1IOfEiChOCwJTSHv8j3ZpMTvj1v3U1oxi0x66tQclQ08tbw3gJLwY7zQ==
X-Received: by 2002:a05:600c:2d09:b0:3a3:1062:ce61 with SMTP id x9-20020a05600c2d0900b003a31062ce61mr14389529wmf.138.1658174461318;
        Mon, 18 Jul 2022 13:01:01 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f2e:6999:b072:faf1:1e0f:8765? (p200300c78f2e6999b072faf11e0f8765.dip0.t-ipconnect.de. [2003:c7:8f2e:6999:b072:faf1:1e0f:8765])
        by smtp.gmail.com with ESMTPSA id n9-20020a05600c294900b003a320b6d5eesm1676674wmd.15.2022.07.18.13.01.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jul 2022 13:01:00 -0700 (PDT)
Message-ID: <71368760-0399-52f2-ca6e-ad8f4daf8003@gmail.com>
Date: Mon, 18 Jul 2022 22:00:59 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 5/7] staging: vt6655: Replace MACvReceive1 with function
 vt6655_mac_dma_ctl
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Forest Bond <forest@alittletooquiet.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <cover.1658094708.git.philipp.g.hortmann@gmail.com>
 <c433e54f0fae051fc8ba9050aa094d6f7141e8d4.1658094708.git.philipp.g.hortmann@gmail.com>
 <20220718124136.GE2338@kadam>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20220718124136.GE2338@kadam>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/18/22 14:41, Dan Carpenter wrote:
> On Mon, Jul 18, 2022 at 12:20:25AM +0200, Philipp Hortmann wrote:
>> checkpatch.pl does not accept multiline macros.
>>
> 
> What?  Really?
You are right. It does not really complain about multiline macros but 
you cannot have a clean checkpatch check when using more than one macro 
containing the same variable. Find more info below.
> 
> I tested this to see if was true and it just complained about potential
> side effects on iobase.
> 
> regads,
> dan carpenter
> 
>> diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
>> index 5747de436911..129a6602f6f0 100644
>> --- a/drivers/staging/vt6655/mac.h
>> +++ b/drivers/staging/vt6655/mac.h
>> @@ -537,16 +537,6 @@
>>   
>>   /*---------------------  Export Macros ------------------------------*/
>>   
>> -#define MACvReceive1(iobase)						\
>> -do {									\
>> -	unsigned long reg_value;					\
>> -	reg_value = ioread32(iobase + MAC_REG_RXDMACTL1);		\
>> -	if (reg_value & DMACTL_RUN)					\
>> -		iowrite32(DMACTL_WAKE, iobase + MAC_REG_RXDMACTL1);	\
>> -	else								\
>> -		iowrite32(DMACTL_RUN, iobase + MAC_REG_RXDMACTL1);	\
>> -} while (0)
>> -
>>   #define MACvTransmit0(iobase)						\
>>   do {									\
>>   	unsigned long reg_value;					\
> 

I was asking in kernelnewbies what to do with multi line macros as 
checkpatch.pl warnings cannot be totally avoided.

Greg replied to make functions out of them.

Please find the full email under:

https://www.mail-archive.com/kernelnewbies@kernelnewbies.org/msg22042.html

In this case I really like the static function solution much more than 
the macros.

Thanks for your support.
