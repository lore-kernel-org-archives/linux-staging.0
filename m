Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5BA68
	for <linux-staging@lists.linux.dev>; Wed,  1 Dec 2021 20:15:35 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id d11so50484607ljg.8
        for <linux-staging@lists.linux.dev>; Wed, 01 Dec 2021 12:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=7HZ7zAJPGoiKZJ+pW6ZHJ810CsUooxXY5UzUNBlsa4E=;
        b=XZUCS93n/jhVSXEfcb3l6csTpMfcdszQX7QiMrTMKASPY2j2LuynVYVqR2A//wA+ha
         w4nXWrAXuds4ihUMB8CPCEZPlPAxyXijG7xOmOUkVnuENpkNMLhFs/JSna6EHgHpEQWf
         lIY9adlmmyRYy5GCUP/zs5m0DWfGkw0/ixILNmUty0k1UCsb62SFHhKzUZF5C/d+8Q/k
         BhzFHUeHK0I4DR04MiM114mV/Kw0ViVQNsk4kxbSlW6UKcKBGtgQ9ZNSzcoJFM/Naj/T
         3TX1155Mbg1yQVHNlwTfBIFwJQvXdPNC3lWJUDEaHquZumnxhgV8BOQ/wIZu2l3rs0H3
         79oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=7HZ7zAJPGoiKZJ+pW6ZHJ810CsUooxXY5UzUNBlsa4E=;
        b=gaEK9hw5o0OhM/KAOYPpAjmb6skGGq31BN/OvYVTptg9Aq8MpvfIsolnNcvEqI6MrG
         nCEi/QDa+lMazvlDwyq5pHrF8PQ7XU90ggnbRaVQnbIesUujKuUpvL5MOfVe8CFCkv+z
         2kWr1yw+k7BgbIh2Xsok7pYLyjicogHvGEi/dkrwFtB+Me2Gs+7R8UNSbZT8hVTnKdlP
         TDtEJGmajbAtIwqj9LPF4sofpd20oXZVFnOl3jxjZ1dtGXfbiAMzjCEYmWwIwq2AJC2u
         3Yv2TPqSb/qkll3A9K7JC9VEJXusnIXbmUblxLjz05Di9evDLfviOsUKPfHGltfYPX2R
         MG4w==
X-Gm-Message-State: AOAM530K/4BmVQEEPhXn924wIVn5IGQoBFzWgwiFFbKVAtNKoeixgk3N
	JcxuC9m8cyu07Bqclljzq6Q=
X-Google-Smtp-Source: ABdhPJwLPZSUuY0LnnHMiQZ9NbtLx2r0aUATIKhEn6zS+9nwEmXSZFKUspQePBGaAbAU6uetfvqVEQ==
X-Received: by 2002:a2e:2410:: with SMTP id k16mr7781914ljk.441.1638389733896;
        Wed, 01 Dec 2021 12:15:33 -0800 (PST)
Received: from [192.168.1.11] ([94.103.229.236])
        by smtp.gmail.com with ESMTPSA id w10sm84454lfn.308.2021.12.01.12.15.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Dec 2021 12:15:33 -0800 (PST)
Message-ID: <c4855ae4-fb42-ae84-d4b9-3890ae03ef83@gmail.com>
Date: Wed, 1 Dec 2021 23:15:30 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH -next 0/3] some fix and cleanup for rtl8192e
Content-Language: en-US
To: Yang Yingliang <yangyingliang@huawei.com>, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org, dan.carpenter@oracle.com
References: <20211201095036.1763163-1-yangyingliang@huawei.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20211201095036.1763163-1-yangyingliang@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/1/21 12:50, Yang Yingliang wrote:
> patch #1, #2:
>    fix error handle case in alloc_rtllib()
> 
> patch #3:
>    remove unnecessary assignment
> 
> Yang Yingliang (3):
>    staging: rtl8192e: return error code from rtllib_softmac_init()
>    staging: rtl8192e: rtllib_module: fix error handle case in
>      alloc_rtllib()
>    staging: rtl8192e: rtllib_module: remove unnecessary assignment
> 
>   drivers/staging/rtl8192e/rtllib.h         |  2 +-
>   drivers/staging/rtl8192e/rtllib_module.c  | 17 ++++++++++++-----
>   drivers/staging/rtl8192e/rtllib_softmac.c |  6 ++++--
>   3 files changed, 17 insertions(+), 8 deletions(-)
> 

Agree with Dan, almost perfect one. Since you are going to send v4, 
please add following tag to 1/3 and 2/3 patches because they should be 
backported to stable kernels

Fixes: 94a799425eee ("From: wlanfae <wlanfae@realtek.com>")

( Im not kidding, it's real subject line of the patch :) )





With regards,
Pavel Skripkin
