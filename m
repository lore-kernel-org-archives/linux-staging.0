Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65D6636;
	Mon, 24 Oct 2022 03:10:28 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id z5-20020a17090a8b8500b00210a3a2364fso8229645pjn.0;
        Sun, 23 Oct 2022 20:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xFOqFhoWJpS93ZCZ48P1kJuHexoFYaiqPnMocVGwfOQ=;
        b=AG5I+OSVaYk4VTCeoBVkbhGMd2NP8Vvd2z/Rhm+qB8/C31/l/ih4g7DBY0izT+bblh
         G0CZkpfhP3FAohgmHickoqmGcSSI1GeZWlVlJYn5rK6u514g9hVqlPOD0mAEyJBE/vBC
         2pPAlJMOAp8cvwc0hMOXK85K6K8O4MIqP3viAJbCj+YSoa9t6iJJkzLa2FQcr7u3fhIe
         ARYvlql7KXWHA7rhT1Sbn4/KtV2GI0uZc2CSTGTREqEG9pEDpxSU7sUj8jr8HulqyAVq
         InrZg2g2YMa9yKdR6iLlmJsgTV1PP6iMlAi670C6j7lnBh81CU0zkevdK48BYNQPOQHW
         g8ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xFOqFhoWJpS93ZCZ48P1kJuHexoFYaiqPnMocVGwfOQ=;
        b=K8pLGCz1DTr0l/5GpbjICO2RQixqyQ5ZjxlwLUhSmbrOZSoCucOadas/oUZYyQYbOj
         TzluYGnX1CeAiY80ejb8dE/VyoL0zBrsOA56F0eSLczuz7GpXonJy2U/NtaqAEu+Ga7l
         UH3u6jgmIC5p+A3XgXJORxi+crVT/M4Gz9nUkgUgsssy5RvwV3w07Nju5tPQVWx/Eqnk
         ZzwuTQfxiwWNbl1FoVJyn+Kkn3b0UZ00pozwo96T3cVZcu3k4XoezKvd7+f4YuMDx30O
         zBIwNLn+p5EgBd7ijxlSdgNFJnnuFZjBKIIO2IjXXJZ49u64o6mxSqqFRetsyI/mtUB0
         jKWw==
X-Gm-Message-State: ACrzQf3ms5fsU/XU58Pr8V5IvbVT3enmAeaj77/WnxYX0AAVXXURDH2W
	gXtZ/AGsAi3vkoevUX9D064=
X-Google-Smtp-Source: AMsMyM7jNjuZYxY6eLkUM0zJNq69ZpUCr+R8c42Zto8XuziIMzH4R2/yg30+JQhvjSz6f5KDvKaGJg==
X-Received: by 2002:a17:90b:3808:b0:212:ca53:b509 with SMTP id mq8-20020a17090b380800b00212ca53b509mr19546397pjb.44.1666581028066;
        Sun, 23 Oct 2022 20:10:28 -0700 (PDT)
Received: from [192.168.43.80] (subs02-180-214-232-9.three.co.id. [180.214.232.9])
        by smtp.gmail.com with ESMTPSA id ge12-20020a17090b0e0c00b0020aa1bd91e4sm5138033pjb.4.2022.10.23.20.10.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Oct 2022 20:10:27 -0700 (PDT)
Message-ID: <9a979e2a-5f6c-fa3c-ea39-bbac0d0ad8c6@gmail.com>
Date: Mon, 24 Oct 2022 10:10:23 +0700
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2] staging: wlan-ng: remove commented debug printk
 messages
To: Deepak R Varma <drv@mailo.com>
Cc: outreachy@lists.linux.dev, gregkh@linuxfoundation.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <Y1L0FiKvrM9jjZG9@debian-BULLSEYE-live-builder-AMD64>
 <Y1VDM2kWIi1I5dqI@debian.me>
 <Y1Mf7IVccbst10iP@debian-BULLSEYE-live-builder-AMD64>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <Y1Mf7IVccbst10iP@debian-BULLSEYE-live-builder-AMD64>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/22/22 05:40, Deepak R Varma wrote:
> On Sun, Oct 23, 2022 at 08:35:47PM +0700, Bagas Sanjaya wrote:
>> On Sat, Oct 22, 2022 at 01:03:42AM +0530, Deepak R Varma wrote:
>>> diff --git a/drivers/staging/wlan-ng/p80211netdev.c b/drivers/staging/wlan-ng/p80211netdev.c
>>> index e04fc666d218..6bef419e8ad0 100644
>>> --- a/drivers/staging/wlan-ng/p80211netdev.c
>>> +++ b/drivers/staging/wlan-ng/p80211netdev.c
>>> @@ -881,55 +881,42 @@ static int p80211_rx_typedrop(struct wlandevice *wlandev, u16 fc)
>>>  		wlandev->rx.mgmt++;
>>>  		switch (fstype) {
>>>  		case WLAN_FSTYPE_ASSOCREQ:
>>> -			/* printk("assocreq"); */
>>>  			wlandev->rx.assocreq++;
>>>  			break;
>>>  			wlandev->rx.ctl_unknown++;
>>>  			break;
>>>  		}
>>> -		/* printk("\n"); */
>>>  		drop = 2;
>>>  		break;
>>>
>>> @@ -1007,7 +986,6 @@ static int p80211_rx_typedrop(struct wlandevice *wlandev, u16 fc)
>>>  			wlandev->rx.cfack_cfpoll++;
>>>  			break;
>>>  		default:
>>> -			/* printk("unknown"); */
>>>  			wlandev->rx.data_unknown++;
>>>  			break;
>>>  		}
>>
>> Shouldn't these printks be guarded under CONFIG_DEBUG_KERNEL instead?
> 
> Hi Sanjaya,
> Sure they can, but I think they are very basic tracing message and do not appear
> to carry much of information useful the event of debugging. Do you have a
> suggestion on what additional information may be added to make them more useful?
> 
> If you still think we should have then in the CONFIG_DEBUG_KERNEL guard, let me
> know and I will attempt to improve these.
> 
> Thank you,
> ./drv
> 

Greg said we should just deleting these printks [1].

[1]: https://lore.kernel.org/lkml/Y1VL%2FwITM64U6qLi@kroah.com/

Thanks anyway.

-- 
An old man doll... just what I always wanted! - Clara

