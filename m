Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6168621
	for <linux-staging@lists.linux.dev>; Tue, 22 Mar 2022 04:30:34 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id u17so17171014pfk.11
        for <linux-staging@lists.linux.dev>; Mon, 21 Mar 2022 21:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=aHNQ24PWiPjii6F5lkM3fKzrkShIeqqIUDEofSLJIto=;
        b=eOPIZw6UeU1k5ngrdt8Ghoc3fF1MCx8GDFYmjZHl1yJJV/CqC9U56k5j1lYfZ4ugl9
         +c3+cfuxLKJDsYidpaWnwLHKP72/0yWOIwU7I+2lkvKltjP2O3zQodOU0XqFmCW/vGg3
         Uhg8VElhMz6JWo1Iib2B3Q5H4Cevqb+Df3leDeGpSgGQsj169if5vaJK1RHJRl+CRNzU
         9uHiPffOaUgl/BJlnTeosGZ9XPzk99F+wuX4W6hf8NA8Y8PK7aLK6iACMgIqPWcPcQq0
         ZSj/fI+8WnwjDKq1esfiBuaLKfH5ipuKupvaIw3ClQ8kv6Ddm9PdrVWrXOsdqMcizAL6
         D56g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=aHNQ24PWiPjii6F5lkM3fKzrkShIeqqIUDEofSLJIto=;
        b=36SczOip2m/U/Y31RzeNBLui4bO/iEcY/wRZ8rVtki29gjvaarkRiWfo9BQlw8XVSz
         v4HuL6wP77MQsx+Op3xpAKDolKRNQuFIiuB6Aa5HkcUnU39lbWXP3GZcvzZgnxBzqVmI
         /Cn4AXdO3sZcjm3ofcwMzKNVb7UFn6odXqEUzGi5PGfF/mjEzlffYrYwuAmqdwjM+HdN
         R6PNUE2zoLTaXKCiv54Isq9xi+JqsegLDwddWmOKQ17UE9O244HFVuC2PdmUy49GLgTz
         q6u9WoFG4m8Uc42bDh42L10CeD5xXwY+0QY1+NBwP4LOdQl5dPoJt5Ktt98ZCBr3WPqt
         eO0g==
X-Gm-Message-State: AOAM531UbIM4xQx+4Y0JPN+rDBKe8yan/Q/09Zpw7i5LI0vTJ14rV4lW
	BikwPIP8O8Ue3yissa/C420=
X-Google-Smtp-Source: ABdhPJynC+Dxfbf4XOsFfakoXjYdBPUwanv3IemaVPMlWaytEYdm9ih0AbVD33vrWon8J+ZhxuMlQQ==
X-Received: by 2002:a62:3896:0:b0:4f7:87dc:de5b with SMTP id f144-20020a623896000000b004f787dcde5bmr27534389pfa.49.1647923434419;
        Mon, 21 Mar 2022 21:30:34 -0700 (PDT)
Received: from [192.168.225.67] ([157.49.254.255])
        by smtp.gmail.com with ESMTPSA id h13-20020a056a00170d00b004f757a795fesm21071279pfc.219.2022.03.21.21.30.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Mar 2022 21:30:33 -0700 (PDT)
Message-ID: <3a85ae64-00c1-6483-f1d7-c12abdd3ff3a@gmail.com>
Date: Tue, 22 Mar 2022 10:00:29 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v2] staging: rtl8712: Fix CamelCase warnings
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20220318101440.13887-1-skumark1902@gmail.com>
 <YjRswrHu0JUm9331@kroah.com>
From: Sathish Kumar <skumark1902@gmail.com>
In-Reply-To: <YjRswrHu0JUm9331@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/03/22 4:58 pm, Greg KH wrote:
> On Fri, Mar 18, 2022 at 03:44:40PM +0530, Sathish Kumar wrote:
>> This patch fixes the checkpatch.pl warnings like:
>> CHECK: Avoid CamelCase: <blnEnableRxFF0Filter>
>> +   u8 blnEnableRxFF0Filter;
>>
>> Signed-off-by: Sathish Kumar <skumark1902@gmail.com>
>> ---
>> Changes in v2:
>>      - Remove the "bln" prefix
>> ---
>>   drivers/staging/rtl8712/drv_types.h   | 2 +-
>>   drivers/staging/rtl8712/rtl871x_cmd.c | 2 +-
>>   drivers/staging/rtl8712/xmit_linux.c  | 4 ++--
>>   3 files changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/staging/rtl8712/drv_types.h b/drivers/staging/rtl8712/drv_types.h
>> index a44d04effc8b..4de3aad08242 100644
>> --- a/drivers/staging/rtl8712/drv_types.h
>> +++ b/drivers/staging/rtl8712/drv_types.h
>> @@ -157,7 +157,7 @@ struct _adapter {
>>   	struct iw_statistics iwstats;
>>   	int pid; /*process id from UI*/
>>   	struct work_struct wk_filter_rx_ff0;
>> -	u8 blnEnableRxFF0Filter;
>> +	u8 enable_rx_ff0_filter;
> Shouldn't this be a boolean?
>
>>   	spinlock_t lock_rx_ff0_filter;
>>   	const struct firmware *fw;
>>   	struct usb_interface *pusb_intf;
>> diff --git a/drivers/staging/rtl8712/rtl871x_cmd.c b/drivers/staging/rtl8712/rtl871x_cmd.c
>> index acda930722b2..69d3c55ee9e5 100644
>> --- a/drivers/staging/rtl8712/rtl871x_cmd.c
>> +++ b/drivers/staging/rtl8712/rtl871x_cmd.c
>> @@ -202,7 +202,7 @@ u8 r8712_sitesurvey_cmd(struct _adapter *padapter,
>>   	mod_timer(&pmlmepriv->scan_to_timer,
>>   		  jiffies + msecs_to_jiffies(SCANNING_TIMEOUT));
>>   	padapter->ledpriv.LedControlHandler(padapter, LED_CTL_SITE_SURVEY);
>> -	padapter->blnEnableRxFF0Filter = 0;
>> +	padapter->enable_rx_ff0_filter = 0;
>>   	return _SUCCESS;
>>   }
>>   
>> diff --git a/drivers/staging/rtl8712/xmit_linux.c b/drivers/staging/rtl8712/xmit_linux.c
>> index 90d34cf9d2ff..d58ae5b387d4 100644
>> --- a/drivers/staging/rtl8712/xmit_linux.c
>> +++ b/drivers/staging/rtl8712/xmit_linux.c
>> @@ -102,11 +102,11 @@ void r8712_SetFilter(struct work_struct *work)
>>   	r8712_write8(adapter, 0x117, newvalue);
>>   
>>   	spin_lock_irqsave(&adapter->lock_rx_ff0_filter, irqL);
>> -	adapter->blnEnableRxFF0Filter = 1;
>> +	adapter->enable_rx_ff0_filter = 1;
>>   	spin_unlock_irqrestore(&adapter->lock_rx_ff0_filter, irqL);
>>   	do {
>>   		msleep(100);
>> -	} while (adapter->blnEnableRxFF0Filter == 1);
>> +	} while (adapter->enable_rx_ff0_filter == 1);
> Ah, that's funny.  It's amazing it works at all and that the compiler
> doesn't optimize this away.  This isn't a good pattern to use in kernel
Do you mean the following code is not a good pattern in kernel?
do {
msleep();
} while(condition);
> code.  I know it's not caused by your change here, but perhaps you might
> want to fix this up to work properly?
>
> thanks,
>
> greg k-h

Do i need to replace the above code with some other mechanism?

If yes, please let me know which mechanism i should use? Or what should 
I do here?

Note : I am new to Linux kernel development and looking forward to learn 
and contribute.

Thanks,
Sathish
