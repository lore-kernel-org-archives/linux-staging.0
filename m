Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6515933D1
	for <linux-staging@lists.linux.dev>; Mon, 21 Mar 2022 12:06:08 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id t2so15201289pfj.10
        for <linux-staging@lists.linux.dev>; Mon, 21 Mar 2022 05:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=mQVeuWDN9J1yJyMFSCKrDaWCEtSDGr5BIpmWKndqjqU=;
        b=il07ih78+2jqROVK64V1q8dH8fuvuEUVpuFFYuoV9+FUaWECoUWPLX1EGjh2oTzcAA
         6Nc5ZhfANhok56d6bAs5Q3AvdhsQm5kKSNFlrVXf/M3Vl/CfUUeKpLo1YS917+HwP3Gt
         /VUOYUIlfE68hEnUoNmKmbzLUIIFQ7qwhDb8wj3UGZEVm7re7NSt6rEgMxm8FKX6Wnf+
         F1BmE/uiSfXCGOU0p0Q9mxEiy1RNvYw6cfHG3GBWsvNJzc4eWC/PsRrsCmF9jL4FfXA5
         OyhxkvWKwF0S6qH3JYiM0jl00ipXcNTD0u/C4IMIjo9tqcu3I/MgCb/k5iRgn2S7o/dO
         rlXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=mQVeuWDN9J1yJyMFSCKrDaWCEtSDGr5BIpmWKndqjqU=;
        b=BzFV2GmJ9v88qsGKEoCsQhp0CwJEfpyDFFSYrOWWZ6bGIPnIbzrgKUNFJyC86WIjgJ
         OHjVOvnHQESbqHGX8aw0CTUfL/d8G5h5xahvkD/V16aN0MM95FF1jmdSB22+tvh3gK0u
         aFppHglSysqvfTQOZU1bT43qoqaEs2+6E+AUgN24AJg2YKZDeyKSDfjJXoFuhok5QjLt
         lKYfqwAvboC73L9ukAG7CctnHQL/XompUcDJs26SELOaqFQhXwQk+iP4cgGJIfYhi14W
         g2bLym+33sNR9owNjB932i6AtZVaehdBIjs8IbymB5PCD5Gskvl46ansV0opjaLyjZ/a
         p0gQ==
X-Gm-Message-State: AOAM5315fseF8fqf8TnHPEsthCa+tFv6nttDeEBGOgh3BQlO/JM1Kyd0
	soTiwazQ9zHmgMaqOdlH07U=
X-Google-Smtp-Source: ABdhPJzTSnRZI8bxbc9u4mpE7+yAwc8MQ3ONG2T9QvJu6PpnBge+u3kcv+5gCP4PLj9EL9IMgX0ugg==
X-Received: by 2002:a63:9d48:0:b0:378:c359:fcbf with SMTP id i69-20020a639d48000000b00378c359fcbfmr17593387pgd.371.1647864367768;
        Mon, 21 Mar 2022 05:06:07 -0700 (PDT)
Received: from [192.168.225.67] ([157.49.192.24])
        by smtp.gmail.com with ESMTPSA id kb10-20020a17090ae7ca00b001bfad03c750sm21996931pjb.26.2022.03.21.05.06.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Mar 2022 05:06:07 -0700 (PDT)
Message-ID: <6f088754-49e7-143b-7735-d94b0199ee33@gmail.com>
Date: Mon, 21 Mar 2022 17:36:01 +0530
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
Yes. It should be boolean(dealing only with either 0 or 1). Will fix this.
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
Do you mean "do { msleep(); } while()" here?
> code.  I know it's not caused by your change here, but perhaps you might
> want to fix this up to work properly?
>
> thanks,
>
> greg k-h

Sure. Will fix this up to work properly.

Thanks,

Sathish

