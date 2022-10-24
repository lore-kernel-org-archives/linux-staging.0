Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23897ED;
	Mon, 24 Oct 2022 09:29:32 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id 4so2069951pli.0;
        Mon, 24 Oct 2022 02:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yd+fxQKSE026OpZCfef536OFjJNo72Gu5e08Gc6kKHs=;
        b=iIvkvtlGpeDGszoMl3nRMlQ6N3mHCjIPx4UmJus9Z2sHCWiZWQmNAaORPdX9Dl4stS
         ZSexmfE6i/lOLfg/uvfl3CbhLSamiv4wgHMrU2a/UMdZ7eQKP5yL9HgYOhW7flDtKFu1
         ToPqqJy1aGENjH56jzo8d/9V6X7NfW5ACBfn5VkPRBpqANjnpZWNMEtuFCqAEMBU1LlJ
         xGDxIjBoSE4weWYR0PvWL/at3+EKA6iWXPeYww/ODaZKuheb03a4BHOo/TCWgcYxdtil
         Y8Bix4WsWICuRyMKwvU5qA2ImVTO89jh48n1pyJhXVM+QbnXup5UU79LbrgAlKjfhbmt
         T64w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yd+fxQKSE026OpZCfef536OFjJNo72Gu5e08Gc6kKHs=;
        b=w4ZC3LCp2vyWOnUa12I3QS3gqBqkpVVs0dSxysOj9OzjbTSMnlQlRTIBdhMZginyv4
         icGhPJXTDm4qd5/J1U70XVc8dsVkSGDrtzduwEv3mmjXzQSYMh7IOwrzdqH0KQdUlWHD
         fe6nkB7vLkChPDPjYPvcwciUvCcJnspl81RUoYiKm/HPEZU+VfWCwLssJvQ2rp6+udo8
         VVJDlB/ro1/IoH/L8MHt49WJvrBTC93kpVbwryGqeS0kyOjYWiMo/gxABecXcXU/yJ4M
         yJXx1vLrEEeC+sLrMVuys8+jdh47kpZJnXvofnj1O+Coz3cmkyifvtNDQX1mApnvCvM5
         T+EA==
X-Gm-Message-State: ACrzQf3qkWR/ITjkxbm97nkL5bIpBkoRHu7XiAphBIzJSEoGRaMgaMdw
	bh91FyIGDIDKnTJAz08dD+g=
X-Google-Smtp-Source: AMsMyM6zJqhF6xDUC1q2Ge13+fjfRRKEzGnErz5sBFySzImcI8S5J6i/bwBfZ415pSVcgKEe7C11pg==
X-Received: by 2002:a17:90b:3a90:b0:20d:a54c:e5cd with SMTP id om16-20020a17090b3a9000b0020da54ce5cdmr64819255pjb.183.1666603772445;
        Mon, 24 Oct 2022 02:29:32 -0700 (PDT)
Received: from [192.168.43.80] (subs32-116-206-28-6.three.co.id. [116.206.28.6])
        by smtp.gmail.com with ESMTPSA id l64-20020a622543000000b0056b1ecef957sm5123696pfl.37.2022.10.24.02.29.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 02:29:32 -0700 (PDT)
Message-ID: <85af6032-020b-e406-672f-c4e13ab7f1ad@gmail.com>
Date: Mon, 24 Oct 2022 16:29:29 +0700
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
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Deepak R Varma <drv@mailo.com>, outreachy@lists.linux.dev,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <Y1L0FiKvrM9jjZG9@debian-BULLSEYE-live-builder-AMD64>
 <Y1VDM2kWIi1I5dqI@debian.me> <Y1VL/wITM64U6qLi@kroah.com>
 <4863c6d7-ffdd-1304-981b-9b0644a87f4e@gmail.com> <Y1YPypVbN5v18uni@kroah.com>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <Y1YPypVbN5v18uni@kroah.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/24/22 11:08, Greg KH wrote:
>>>> Shouldn't these printks be guarded under CONFIG_DEBUG_KERNEL instead?
>>>
>>> No, they should just be removed as was done here.
>>>
>>
>> What if in case of debugging without these printks?
> 
> I can not parse this line, sorry.

OK.

Ah, I mean I have to see Documentation/dev-tools/kgdb.rst and
Documentation/dev-tools/gdb-kernel-debugging.rst.

-- 
An old man doll... just what I always wanted! - Clara

