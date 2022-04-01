Received: from gateway20.websitewelcome.com (gateway20.websitewelcome.com [192.185.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447A37C
	for <linux-staging@lists.linux.dev>; Fri,  1 Apr 2022 19:47:35 +0000 (UTC)
Received: from cm11.websitewelcome.com (cm11.websitewelcome.com [100.42.49.5])
	by gateway20.websitewelcome.com (Postfix) with ESMTP id ED476400C65EE
	for <linux-staging@lists.linux.dev>; Fri,  1 Apr 2022 14:25:53 -0500 (CDT)
Received: from 162-215-252-75.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with SMTP
	id aMu9nYpz8dx86aMu9n4Uox; Fri, 01 Apr 2022 14:25:53 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gRxeeaDwhvGBhrPafblbmd3XWXuP8IayVtlpg1IL5eU=; b=LwJc1tLL0hGCz49/ZelQdnZBTu
	/tlUi+k1vfYhMZGElRwBh675jRNUmi5Lp4CLI9mahf6Bt5/nASzkGi/24Y2PaR6Lp9NCLUW59hGpn
	hVbGk7ilF59KDzuoC9XzT7Obgz0kEhyExhlZRHUky0XB7h9J1Yo7pDJ0QE1RWeef6mhNmmq0SUeYc
	4GoyXHUm4rOUC2y2hBauOgbOxkKGeutLjhHOAXar7mYunKDPR3h//gRx7FJEBwKgW+ncKVYIKV4mF
	oy3KEXkZaV47F5xAyAsqR/zym2UKGG2nYtSgQg79nFL2CtXWoUknFvxZ3iPn7SB4pVXkrG6vpOlHX
	w6VcYZEA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:54662)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@roeck-us.net>)
	id 1naMu9-0020Md-I7; Fri, 01 Apr 2022 19:25:53 +0000
Message-ID: <dcba377b-1fce-92e6-680a-77c5567cd06c@roeck-us.net>
Date: Fri, 1 Apr 2022 12:25:52 -0700
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] staging: r8188eu: Fix PPPoE tag insertion on big endian
 systems
Content-Language: en-US
To: Larry Finger <Larry.Finger@lwfinger.net>
Cc: Phillip Potter <phil@philpotter.co.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20220401151257.3414576-1-linux@roeck-us.net>
 <782f0115-e45f-1aff-a152-5d403c990b31@lwfinger.net>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <782f0115-e45f-1aff-a152-5d403c990b31@lwfinger.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1naMu9-0020Md-I7
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:54662
X-Source-Auth: linux@roeck-us.net
X-Email-Count: 2
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes

On 4/1/22 11:40, Larry Finger wrote:
> On 4/1/22 10:12, Guenter Roeck wrote:
>> In __nat25_add_pppoe_tag(), the tag length is read from the tag data
>> structure. The value is kept in network format, but read as raw value.
>> With -Warray-bounds, this results in the following gcc error/warning
>> when building the driver on a big endian system such as alpha.
>>
>> In function '__nat25_add_pppoe_tag',
>>      inlined from 'nat25_db_handle' at
>>     drivers/staging/r8188eu/core/rtw_br_ext.c:479:11:
>> arch/alpha/include/asm/string.h:22:16: error:
>>     '__builtin_memcpy' forming offset [40, 2051] is out of the bounds
>>     [0, 40] of object 'tag_buf' with type 'unsigned char[40]'
>>
>> Add the missing ntohs().
>>
>> Fixes: 15865124feed ("staging: r8188eu: introduce new core dir for RTL8188eu driver")
>> Cc: Phillip Potter <phil@philpotter.co.uk>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>>   drivers/staging/r8188eu/core/rtw_br_ext.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
>> index d68611ef22f8..31bcd495ec04 100644
>> --- a/drivers/staging/r8188eu/core/rtw_br_ext.c
>> +++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
>> @@ -70,7 +70,7 @@ static int __nat25_add_pppoe_tag(struct sk_buff *skb, struct pppoe_tag *tag)
>>       struct pppoe_hdr *ph = (struct pppoe_hdr *)(skb->data + ETH_HLEN);
>>       int data_len;
>> -    data_len = tag->tag_len + TAG_HDR_LEN;
>> +    data_len = htons(tag->tag_len) + TAG_HDR_LEN;

Wonder where my brain was. That should have been ntohs().

>>       if (skb_tailroom(skb) < data_len)
>>           return -1;
> 
> Strange that a BE compiler would generate a warning for what is actually an execution error on LE platforms.
> 
> I prefer be16_to_cpu() to htons() as the former makes it clearer what is happening, but I suppose that is a matter of choice.
> 
The rest of the code uses htons/ntohs, so I prefer to follow that lead.

> Reviewed_by: Larry Finger <Larry.Finger@lwfinger.net>
> 
> Incidentally, Sparse shows 3 more __be16 problems in this routine. I leave their fixing to you.
> 

I'll need to resend anyway, so I'll track those down and fix them as well.

Thanks,
Guenter
