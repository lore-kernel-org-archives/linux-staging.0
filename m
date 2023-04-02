Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093EF53A2
	for <linux-staging@lists.linux.dev>; Sun,  2 Apr 2023 18:22:38 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id j18-20020a05600c1c1200b003ee5157346cso18446294wms.1
        for <linux-staging@lists.linux.dev>; Sun, 02 Apr 2023 11:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680459757;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qQ7cV2QrQ0t06/mixdh3yXEE4i1+hMwYh5eUdnobqIY=;
        b=SnqroAysuuy6fCAhOqM/pte7g0pC57vqLd9iMHOo+QmBJPZP+vSIO8n/7zpnrpkiHd
         Xx5EOZpzD4o2kYL+pIIT5o6KqSjrqpjI0cOMy+8mvnnU3/CgdwPGOdcmlD5tfrROu73U
         V9y/A7xxeWl+uB35So+Sbnqc93imltGIIhhZ1/tyWDsXyT96fBVVcw+xsA/lmA8K9kG0
         l8Y4K0sgbF/AyAc/+1DmdxLVWLjw8PeBOB+6rTdWr3z9EiWv9Vs7jdnksFXVhya71sPJ
         htPabrudLs0S4DJDFgLK3DD/0yAred5HK+QbbszXlGlrqOyNDtDASOpnrvxSO2Vm/3DB
         gDOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680459757;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qQ7cV2QrQ0t06/mixdh3yXEE4i1+hMwYh5eUdnobqIY=;
        b=neCQd92OAKbgL7ga3vd6N8q7N2l3s+M75uuzxatT4XQfs2tJnG/xLcGbIh7DXBYzHk
         JGDPRbrEd8pUCq4VvacjzntFPy95UJ6UeVwzHOsJwcKOnJzPzS/I/HTTtmejO6IZ1wT9
         mBxM+YnnL92bgg6t0MAWCoKDKn3cjdqde5J453GIuZh5wP6qXUaTDJwdUOYezIpm+jZR
         tI7YTBnEaMc/6URg0ey6SJKLy9w5efhL3yc7P0JGtaJIhO52UGwcTWS0tXwIN3QhhD9b
         P2Fi8LsW9Su8ZIaa2iK4OVegYRe+3R7WDA4QIxGI0DFVhfx8l3a/hYuKflfJNlyHTTGu
         ctlQ==
X-Gm-Message-State: AO0yUKWW6q8eTaLPmJWr69hSq0Q1bvPnboycZWFD632FisMy+pZ9Ycj4
	g9QcirQ/fIwqORsz2tqcXIs=
X-Google-Smtp-Source: AK7set+XRX11PiiYSdo892GnW8rwV0ktJWvZ8PvO8hWxBuyWKFXwQRLG7CCMvUCZBO4lOuifVNtIVA==
X-Received: by 2002:a05:600c:2157:b0:3ed:cf2a:3fe8 with SMTP id v23-20020a05600c215700b003edcf2a3fe8mr26406192wml.8.1680459756820;
        Sun, 02 Apr 2023 11:22:36 -0700 (PDT)
Received: from ?IPV6:2a0c:5a82:e704:7800:4aa3:3ca0:c843:43e3? ([2a0c:5a82:e704:7800:4aa3:3ca0:c843:43e3])
        by smtp.gmail.com with ESMTPSA id m9-20020a7bcb89000000b003ed4f6c6234sm9743571wmi.23.2023.04.02.11.22.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Apr 2023 11:22:36 -0700 (PDT)
Message-ID: <0af15115-9641-a1c8-f398-c4e8e77379a3@gmail.com>
Date: Sun, 2 Apr 2023 20:22:35 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] staging: greybus: loopback: fix up checkpath macro do
 while error.
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bryan O'Donoghue <pure.logic@nexus-software.ie>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20230402122550.70682-1-angelalbertoc.r@gmail.com>
 <2023040252-racoon-daintily-3589@gregkh>
From: =?UTF-8?Q?=c3=81ngel_Alberto_Carretero?= <angelalbertoc.r@gmail.com>
In-Reply-To: <2023040252-racoon-daintily-3589@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 02/04/2023 15:16, Greg Kroah-Hartman wrote:
> On Sun, Apr 02, 2023 at 02:25:51PM +0200, Angel Alberto Carretero wrote:
>> Wrap macro in a do-while statement.
>>
>> Signed-off-by: Angel Alberto Carretero <angelalbertoc.r@gmail.com>
>> ---
>>   drivers/staging/greybus/loopback.c | 8 +++++---
>>   1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
>> index d7b39f3bb652..371809770ed0 100644
>> --- a/drivers/staging/greybus/loopback.c
>> +++ b/drivers/staging/greybus/loopback.c
>> @@ -162,9 +162,11 @@ static ssize_t name##_avg_show(struct device *dev,		\
>>   static DEVICE_ATTR_RO(name##_avg)
>>   
>>   #define gb_loopback_stats_attrs(field)				\
>> -	gb_loopback_ro_stats_attr(field, min, u);		\
>> -	gb_loopback_ro_stats_attr(field, max, u);		\
>> -	gb_loopback_ro_avg_attr(field)
>> +	do {		\
>> +		gb_loopback_ro_stats_attr(field, min, u);		\
>> +		gb_loopback_ro_stats_attr(field, max, u);		\
>> +		gb_loopback_ro_avg_attr(field);		\
>> +	} while (0)
>>   
>>   #define gb_loopback_attr(field, type)					\
>>   static ssize_t field##_show(struct device *dev,				\
>> -- 
>> 2.40.0
>>
>>
> 
> Any specific reason why you did not test build your change before
> submitting it?
> 
> thanks,
> 
> greg k-h

Apologies, we can drop the patch. I was trying to find an error as part
of the eudyptula challenge and thought I was compiling the driver
correctly. Upon further examination, the macro cannot be written with a
do-while because it is defining functions.
