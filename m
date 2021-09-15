Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6523FC5
	for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 15:49:43 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id x6so4581644wrv.13
        for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 08:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=gxvIk/3dplKod5R6MerJbNpMQbcwiJJARjdwQMpnT/w=;
        b=hRZA9gFOO6PpVTFsKSMyJe/x/ov5s+egnBGCmw4dR5IvYHu3MRtEKWc4ItAprWcP68
         U+sRGHAPP0ydaD+4HfmOkxooRx8jc7tb5/jVKzSGcPIAd5crr7dksUMrvUgP+HRrSbOL
         rQQXiJ6g+En1AJWphzMKkmbObVrMXm4BSLkyxbGyccqq+2Ga4PEChA/H+lMgUf1+NX7s
         TwPUdNmW+Gh/pQoTC1G1ZZF15XDIteajUWsM4pGfXzEeLVymGzcXYPigFJ6g72xS9neh
         4pryab3M/rzOepHAajzPDFzEVs8/CB403UChETzfLUbEMtPh/pOU2uCM+T6fnZwUEkmh
         rdHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=gxvIk/3dplKod5R6MerJbNpMQbcwiJJARjdwQMpnT/w=;
        b=ZmUaKjj4XDRGoNuqvcBTthaV49p7dy83W0T6dJ8MfusE8K/zPjTgEijXpdBaJ6oBsE
         0aPjKM1gzws2Padn3v3mUFKDJo43ofw4QZ7ll5OkYDahD2cUhZdGCVyRyYORti+jETMx
         2HaQy1af2ojU9oN7b1sMq9Ov5HT9+2MFRC5R7VA7RACF62wJouenYT2W6JaTGzfa85Y4
         LbKrlQM43jO1ygoRSy0FLQrw/ZBpSuAwAm5it1+6oa/2N00psQ9SoCyWDVKd/EtOzl5u
         /X+hAN+NK1IPeqC4gNIAQKKvgiJOuorcECr2GtsEXd9HcXje8DqcCpjFWWAtnzgTYolC
         KTcw==
X-Gm-Message-State: AOAM530lxwtF2KEnhbYpFdbavJrJc3HPMmcDbbHoiGN6mKS9o2Ow8jNz
	miKryqtPUkAdt9PkJg92Kak=
X-Google-Smtp-Source: ABdhPJzksEhuqES2o1uIFL2bXdOHeDbnnWn+XtNMfBOge294ryKCmV27h7pIeWsf5WgoXSyZAbD5qg==
X-Received: by 2002:a5d:43d2:: with SMTP id v18mr773098wrr.98.1631720981849;
        Wed, 15 Sep 2021 08:49:41 -0700 (PDT)
Received: from ?IPV6:2a02:8108:96c0:3b88::ae40? ([2a02:8108:96c0:3b88::ae40])
        by smtp.gmail.com with ESMTPSA id i5sm325288wrc.86.2021.09.15.08.49.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Sep 2021 08:49:41 -0700 (PDT)
Message-ID: <f0fcfced-3d32-f302-10f2-a1eeca57039e@gmail.com>
Date: Wed, 15 Sep 2021 17:49:38 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.3
Subject: Re: [PATCH v2 0/4] staging: r8188eu: remove unused fields from struct
 hal_data_8188e
Content-Language: en-US
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk, martin@kaiser.cx,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20210915090156.4169-1-straube.linux@gmail.com>
 <2416232.Kz4EfdPaPr@localhost.localdomain>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <2416232.Kz4EfdPaPr@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/15/21 15:34, Fabio M. De Francesco wrote:
> On Wednesday, September 15, 2021 11:01:52 AM CEST Michael Straube wrote:
>> This series removes some unused fields from struct hal_data_8188eu.
>>
>> Tested on x86_64 with Inter-Tech DMG-02.
>>
>> v1 -> v2
>> Fixed a typo in the subject line of patch 3/4.
>>
>> Michael Straube (4):
>>    staging: r8188eu: remove unused macros from rtl8188e_hal.h
>>    staging: r8188eu: remove write-only fields from struct hal_data_8188e
>>    staging: r8188eu: remove unused enums from rtl8188e_hal.h
>>    staging: r8188eu: remove unused field from struct hal_data_8188e
>>
>>   .../staging/r8188eu/hal/rtl8188e_hal_init.c   |  5 -----
>>   .../staging/r8188eu/include/rtl8188e_hal.h    | 22 -------------------
>>   2 files changed, 27 deletions(-)
>>
>> -- 
>> 2.33.0
> 
> Hi Michael,
> 
> Due to your removals, this driver is now about a third lighter. After fixing
> that little issue that Philip noticed, this series looks as good as any of
> yours. So...
> 
> Acked-by:  Fabio M. De Francesco <fmdefrancesco@gmail.com>

Thank you Fabio.

Well others have contributed to rip out unused code too. ;)
It's nice to see so many people care about this driver. Seems there is a
little chance to get it out of staging some day... though there is still
a lot of work/cleanup to do.

Regards,
Michael
