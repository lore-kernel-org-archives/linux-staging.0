Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53231E51F
	for <linux-staging@lists.linux.dev>; Thu, 10 Aug 2023 10:08:19 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-99cbfee358eso106289766b.3
        for <linux-staging@lists.linux.dev>; Thu, 10 Aug 2023 03:08:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691662098; x=1692266898;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DCqpkpv99z9fdqK9wNCpZa0APsArJ81t0bxSIKWwtvY=;
        b=W3Mcu8BvR90/MRuS1RohG06gf8RdnyCRcJUM5rTn8FKGiYtUCSYWwuYqMV8pUdpdlK
         5qEyFON6kRa3Q+mQBGDBAw7HlHrp7EFWuPi+Ovq58m/tgNul79g3bWV3682EH0CCQSRH
         QPUNISJrS/zys2a7L3UcAp88e71pE55GSylQa9n5lRmzHbNj7fx2rFeTvimOqTzrpblV
         adlkKCS8HkxiUL1uWFmyDiTPDAdMXb1kGkXIWztO+9COZOD9fBKxFdSKGx7BLLk8J/EX
         EKcQL5USCgE39JhS5zxMLrIbfghRbXSC+tLLIR12ssoJUWAvU+FwIlwSFNg1i5Q+IMlo
         D+Qw==
X-Gm-Message-State: AOJu0YzH66nuVTdUK7xbhJwsw3RHs0icROiawCfha03dMHL8WJv7vKJo
	Czw9FcxUilSOLh/DjCXNesA=
X-Google-Smtp-Source: AGHT+IFUsVRsTvVXCeOz9Q93PhdXP6MFeYTXkIqaczsm2jx6GCzRGgzs5VCSStlY/FPITjS2dH6jNA==
X-Received: by 2002:a17:906:1daa:b0:99b:4ed4:5527 with SMTP id u10-20020a1709061daa00b0099b4ed45527mr1682894ejh.25.1691662097578;
        Thu, 10 Aug 2023 03:08:17 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::aaaa:59? ([2a0b:e7c0:0:107::aaaa:59])
        by smtp.gmail.com with ESMTPSA id gu11-20020a170906f28b00b0099bd86f9248sm717719ejb.63.2023.08.10.03.08.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Aug 2023 03:08:16 -0700 (PDT)
Message-ID: <f6964a5e-ab1b-6bf3-ef65-5b826e36a8f9@kernel.org>
Date: Thu, 10 Aug 2023 12:08:16 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 34/36] tty: gdm724x: convert counts to size_t
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: gregkh@linuxfoundation.org, linux-serial@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230810091510.13006-1-jirislaby@kernel.org>
 <20230810091510.13006-35-jirislaby@kernel.org>
 <ba8becf4-786a-4923-92f7-b4ec3038295f@kadam.mountain>
Content-Language: en-US
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <ba8becf4-786a-4923-92f7-b4ec3038295f@kadam.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10. 08. 23, 11:42, Dan Carpenter wrote:
> On Thu, Aug 10, 2023 at 11:15:08AM +0200, Jiri Slaby (SUSE) wrote:
>> Unify the type of tty_operations::write() counters with the 'count'
>> parameter. I.e. use size_t for them.
>>
>> This includes changing constants to UL to keep min() and avoid min_t().
>>
>> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
>> Cc: linux-staging@lists.linux.dev
>> ---
>>   drivers/staging/gdm724x/gdm_tty.c | 11 +++++------
>>   1 file changed, 5 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/staging/gdm724x/gdm_tty.c b/drivers/staging/gdm724x/gdm_tty.c
>> index b31f2afb0286..cbaaa8fa7474 100644
>> --- a/drivers/staging/gdm724x/gdm_tty.c
>> +++ b/drivers/staging/gdm724x/gdm_tty.c
>> @@ -17,9 +17,9 @@
>>   #define GDM_TTY_MAJOR 0
>>   #define GDM_TTY_MINOR 32
>>   
>> -#define WRITE_SIZE 2048
>> +#define WRITE_SIZE 2048UL
>>   
>> -#define MUX_TX_MAX_SIZE 2048
>> +#define MUX_TX_MAX_SIZE 2048UL
>>   
>>   static inline bool gdm_tty_ready(struct gdm *gdm)
>>   {
>> @@ -152,9 +152,8 @@ static void gdm_tty_send_complete(void *arg)
>>   static ssize_t gdm_tty_write(struct tty_struct *tty, const u8 *buf, size_t len)
>>   {
>>   	struct gdm *gdm = tty->driver_data;
>> -	int remain = len;
>> -	int sent_len = 0;
>> -	int sending_len = 0;
>> +	size_t remain = len;
> 
> We later check if remain <= 0.  It still works because remain could
> never be negative, but now it's even less necessary to check for
> negatives, I guess.

You're right. The whole loop should be now:

while (remain) {
   ...
}

Even without the preceding 'if'.

thanks,
-- 
js
suse labs

