Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3383FC7
	for <linux-staging@lists.linux.dev>; Tue, 12 Jul 2022 13:45:43 +0000 (UTC)
Received: by mail-oo1-f49.google.com with SMTP id t128-20020a4a5486000000b004287b14f5c6so1516339ooa.1
        for <linux-staging@lists.linux.dev>; Tue, 12 Jul 2022 06:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=dlui1MM85qPWou0rQy0Hs7CHorUMH/STDx1YOYBhbKk=;
        b=i3ZzFDMrgqoYrvc4Jwpi18P/Hww70sLUcodotac7+Wej5kO+JV5JsTEVvQF3jcO+Y+
         hD0Pi9dz5NYKpR2DQIdu2/BTVKr8wQhzu0fJNuULeIZddsD5dAtSvAO4DZvsNzh5pckt
         c4AWIQuw4M+kZ6UZZrMPxS2A177bp77ynPe5eRQXLQa6aj4FACXHxTk8RVLQhjf04dJL
         Mrs8PGxiPeK6TFua+OhtLTMfPnRJ7dJ9bB2Uq6GPq6HmngpQaUblYVI8T5kGsEvsuNji
         2yugGs+7JELJQEmOxoePXvjFE4sZ9fkFkOczQ9CSub7mAdZSDVYKdtRzhTXRXU8NSfUx
         R54g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=dlui1MM85qPWou0rQy0Hs7CHorUMH/STDx1YOYBhbKk=;
        b=tSm9VklGAdosqrr4VnpzltW2JANtmxOTPzt5BPoprRhZBVhNCdvJ3P5oEG600Oweol
         pfidgzZ9DiFIy9WVMSxAwNzokHEYG8n6hVw5FU7nldYLP3qc/7ccj/Qa59zAlZY9WDGL
         ugA9w1y2PbP669stX4P37zEbSNqJ8QCewLvzrfTRxro5dm/fy1ikNHNxtBxcZlVwB+az
         6FStV8TDm7WcnQGwZIsJjyuNfEpuItO14laWAc8NSPRZ6nqgFnefTiTMVfQiNA82M7EJ
         myF5nx6cYOIroVpbwH0MhK+xMRaf1NVUtlcuJ8XNF66cbGJ++0veRAPQjN5MQs4CYzM8
         dl8Q==
X-Gm-Message-State: AJIora/EJrQREqtmfZsJCBaZl4RNCd+u8AN43KQztSRHJSfeL8IebLo6
	wS6pUyFsMgp9M6UQuomQ0Sg=
X-Google-Smtp-Source: AGRyM1vkBg6CxYfgap5cCiBm1aQDmkILGJmL0vfocytDayk26xsoFmmFUOe72VnqpzDQlhai+8rXzQ==
X-Received: by 2002:a4a:e797:0:b0:435:5d08:f813 with SMTP id x23-20020a4ae797000000b004355d08f813mr174426oov.94.1657633542410;
        Tue, 12 Jul 2022 06:45:42 -0700 (PDT)
Received: from [192.168.1.108] ([216.130.59.33])
        by smtp.gmail.com with ESMTPSA id 7-20020a9d0687000000b0061c5233ae54sm1615398otx.60.2022.07.12.06.45.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jul 2022 06:45:41 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Message-ID: <28adfbda-4820-d6e4-cacd-8e1ef89a841d@lwfinger.net>
Date: Tue, 12 Jul 2022 08:45:40 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 05/14] staging: r8188eu: use a local buffer for efuse data
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>, Martin Kaiser <martin@kaiser.cx>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Phillip Potter <phil@philpotter.co.uk>,
 Michael Straube <straube.linux@gmail.com>,
 Pavel Skripkin <paskripkin@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20220709171000.180481-1-martin@kaiser.cx>
 <20220709171000.180481-6-martin@kaiser.cx> <20220712122507.GN2338@kadam>
From: Larry Finger <Larry.Finger@lwfinger.net>
In-Reply-To: <20220712122507.GN2338@kadam>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/12/22 07:25, Dan Carpenter wrote:
> On Sat, Jul 09, 2022 at 07:09:51PM +0200, Martin Kaiser wrote:
>> The efuse_eeprom_data array in struct eeprom_priv is used only by
>> ReadAdapterInfo8188EU. We can remove efuse_eeprom_data and use a local
>> buffer instead.
>>
>> Use EFUSE_MAP_LEN_88E as buffer size. Its value is the same as
>> HWSET_MAX_SIZE_512. The functions that access the buffer use
>> EFUSE_MAP_LEN_88E for its size.
>>
>> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
>> ---
>>   drivers/staging/r8188eu/hal/usb_halinit.c    | 23 ++++++++++----------
>>   drivers/staging/r8188eu/include/rtw_eeprom.h |  3 ---
>>   2 files changed, 12 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
>> index 18c2817bf1e3..807d8ce8cbfc 100644
>> --- a/drivers/staging/r8188eu/hal/usb_halinit.c
>> +++ b/drivers/staging/r8188eu/hal/usb_halinit.c
>> @@ -929,6 +929,7 @@ void ReadAdapterInfo8188EU(struct adapter *Adapter)
>>   {
>>   	struct eeprom_priv *eeprom = &Adapter->eeprompriv;
>>   	struct led_priv *ledpriv = &Adapter->ledpriv;
>> +	u8 efuse_buf[EFUSE_MAP_LEN_88E] __aligned(4);
> 
> This is 512 bytes.  We used to be slightly worried about declaring 512
> bytes on the stack, but I'm not sure the situation now.
> 

I think we should still avoid using an on-stack buffer of that size. It is 
better to use a local pointer, and kmalloc() the buffer and free it before exit.

Larry

