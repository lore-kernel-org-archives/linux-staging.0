Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE613FC4
	for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 08:06:12 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id i23so2436291wrb.2
        for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 01:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZE0PeTRh9qfRZGJNwCzqtIG58jlteNMLdoVqfOwsJSc=;
        b=PiLZA/X9ua4zt13neVQpgP6jN+QDMTGTzbeUs/sHSbBf+dH/4iYMdnQ8XWtx7dF76q
         zhaWYh1exDJt+ed9kyDp6D75YhjZXgvgiwL5vpaRy2oa8TcvpfvfqKMOqXZSxdn2a9/L
         clmXSH4OwOJ0iL8ZZG2hBDHa7BgCsvXyG0/8uj8kMmUJIMf1XZ7Zruhg6ycOwm43vcTL
         rmn4fcAv2g4zu7yTHQsFbItaDImlg/1glSrU1y7WedAvExdsWcfJukJ0uAePMkfQafdL
         9CohDlXmn6ps2tvAuW7EJlbklXwIA8JCwXzvB6bh3Q97hrB+pTjo9zzjmTI7hwYbLLFp
         j09w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZE0PeTRh9qfRZGJNwCzqtIG58jlteNMLdoVqfOwsJSc=;
        b=AIh9D+yYZUb9m7LWQzYGw5xl1SPftyy79KFv3A1fhyXpshZr8DhaxbENXucfh0YRLs
         JNGvSXezYshkqxiePgE4NjP5kO68EGEkSytd+2y+YD1Zm1f8k3ImPiHuKPi92Q758Nng
         aCLO/S8y69zpnYaQsfTOJfQK19J3TYnkFqGEcukwpjq8lsXjeB//gDxMTgP1n1N4c5Xe
         C2GTkqiknPlpdqjp6rj7+JDFxhE5U4UrrQ2C0rW/YrNXRAoCg5SwZ4ajQ51VvKvfZ/Iv
         FVBPQClSceQWg9qzhUNS4pMBkQ3M+SKM+aZvnEp9TSU/e2Zi07PQSzrgzLbqYnQGGc8d
         ftJQ==
X-Gm-Message-State: AOAM5335rFrESV6WlycIj8kOGlAeuZuaQz4laxenkt1HOwGiQ7FaylrO
	obCUsfaa+8n/jjnKzlKUUW8IQQ==
X-Google-Smtp-Source: ABdhPJwJ2evMM3o2cbEHd2qfC2Zc9a0Zn5BEoBr1iOPEPLIAfRVXA2v74v/MCXQdflid0JKN7ihvHg==
X-Received: by 2002:a5d:4a46:: with SMTP id v6mr3451302wrs.262.1631693171268;
        Wed, 15 Sep 2021 01:06:11 -0700 (PDT)
Received: from ?IPv6:2a00:1098:3142:14:1538:6132:c93a:c98c? ([2a00:1098:3142:14:1538:6132:c93a:c98c])
        by smtp.gmail.com with ESMTPSA id j4sm13056800wrt.23.2021.09.15.01.06.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Sep 2021 01:06:10 -0700 (PDT)
Subject: Re: [PATCH 1/8] staging: vchiq_arm: replace sleep() with
 usleep_range()
To: Stefan Wahren <stefan.wahren@i2se.com>,
 Gaston Gonzalez <gascoar@gmail.com>, linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org, nsaenz@kernel.org, arnd@arndb.de,
 dan.carpenter@oracle.com, ojaswin98@gmail.com, amarjargal16@gmail.com,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org
References: <20210914213532.396654-1-gascoar@gmail.com>
 <260b38b8-6f3f-f6cc-0388-09a269ead507@i2se.com>
From: Phil Elwell <phil@raspberrypi.com>
Message-ID: <d09502f2-84d2-839f-1350-ae7f248e5981@raspberrypi.com>
Date: Wed, 15 Sep 2021 09:06:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <260b38b8-6f3f-f6cc-0388-09a269ead507@i2se.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefan,

On 15/09/2021 06:21, Stefan Wahren wrote:
> Hi,
> 
> Am 14.09.21 um 23:35 schrieb Gaston Gonzalez:
>> usleep_range() should be used instead of sleep() when sleepings range
>> from 10 us to 20 ms, [1].
>>
>> Reported by checkpatch.pl
>>
>> [1] Documentation/timers/timers-howto.txt
>> ---
>>   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>> index b25369a13452..0214ae37e01f 100644
>> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>> @@ -824,7 +824,7 @@ vchiq_bulk_transmit(unsigned int handle, const void *data, unsigned int size,
>>   		if (status != VCHIQ_RETRY)
>>   			break;
>>   
>> -		msleep(1);
>> +		usleep_range(1000, 1100);
> 
> from my understanding the usage of usleep_range() and hrtimers isn't
> necessary here. The intention is to sleep a little bit and not "exactly"
> 1 ms.
> 
> @Phil Elwell: what is your opinion?

Exactly - the aim is just to stop it spinning.

Phil
