Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC747F
	for <linux-staging@lists.linux.dev>; Sun, 11 Sep 2022 15:43:52 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id u9so14911637ejy.5
        for <linux-staging@lists.linux.dev>; Sun, 11 Sep 2022 08:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=Xc7E1lBgznckEXMi4QFl8det6GUa77V3zF2hPz5HuOI=;
        b=CcAT90Jbo/1/B5vl/9XzpIeRsjblN1u373zv/XAVswQ0eiKyknXbEnWTqr6EI9pYuR
         bkIA3srLZ1D7af+hiaRCl4GAtThr7pzgC1+qxN0XxllcL70H9DA2Bkg5oI0GnWm3kP+a
         Qm1Ryp7ruHA43zDV1RSJ9VRWIlXAAhdaTZAzjDp9ZPDBJ8tyRRhoSZdXty4qaN6GYpzs
         fSRO70arqIDSclMw4dJ4oU0ST2jH8j4hbINxNUZGtzBVQoq4zA8Pf8f1fQy77MHlxVFS
         8EDdscaC42cETeA/Ase6Cu2OOwn/Rlfbib/eS73Jp2QfhKVjXhO7JKAKtzwKi1JJrW/y
         euBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Xc7E1lBgznckEXMi4QFl8det6GUa77V3zF2hPz5HuOI=;
        b=XROgrLvINSK+cOYdhF6rBMDZEX2E975QV2YSFv4NVeKIHvlD9EOKQFVgwU7KsZCgiB
         VX4LCbC6Qsu5f2/osjff00M7qEfQuZ6Q/yeS1F1qzFwwfEg9HY6yWXzFnNG2geMyvDTI
         NJuQKOrBqZ1Z+QuPt1oClAv4aqJy7Cqt86V00VOegF3ie5K+o011kfWtGCTzltPFvAfw
         xl95fKrXjGFgVaPDDxnHAoOWfWfzdwyRddNTX7G36fG9e1syMKQwIVoRTGLBMI4AOwpy
         wlIdMjCwmpt4tITzB+6T3Uu9UHd47hW9XztFdjld+u4VyAv0pvLfbVA4zHbjNeDDdRN9
         Z6Uw==
X-Gm-Message-State: ACgBeo3MccjYNRk0VEpn/duKOxe8EZD2+p+S6eTjIQvcjydJGrIOYoda
	ioWvk1Ly2fKUARJwpT17LZ0=
X-Google-Smtp-Source: AA6agR4Nt9BKU8QfZIm0dYMC8MtUv3gjwpBoX1HTk35RxiqALbEFF0CHBS1bUgRKS88nvIBF7K9K3g==
X-Received: by 2002:a17:907:2d23:b0:77c:ed93:3dc3 with SMTP id gs35-20020a1709072d2300b0077ced933dc3mr1748863ejc.705.1662911030988;
        Sun, 11 Sep 2022 08:43:50 -0700 (PDT)
Received: from [192.168.1.100] (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id s1-20020a05640217c100b0044ec76521a1sm4144241edy.55.2022.09.11.08.43.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Sep 2022 08:43:50 -0700 (PDT)
Message-ID: <df265810-d580-c447-2fa0-907a773802ec@gmail.com>
Date: Sun, 11 Sep 2022 17:43:49 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/9] staging: r8188eu: more led cleanups
Content-Language: en-US
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Michael Straube <straube.linux@gmail.com>,
 Pavel Skripkin <paskripkin@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20220911145122.15444-1-martin@kaiser.cx>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20220911145122.15444-1-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/11/22 16:51, Martin Kaiser wrote:
> Clean up the init code for some of the blink commands.
> 
> Martin Kaiser (9):
>    staging: r8188eu: simplify the code to prevent scan blinking restart
>    staging: r8188eu: cancel blink_work before scan blinking
>    staging: r8188eu: update status before scan blinking
>    staging: r8188eu: simplify the code to prevent tx/rx blinking restart
>    staging: r8188eu: cancel blink_work before tx/rx blinking
>    staging: r8188eu: update status before scan blinking
>    staging: r8188eu: simplify the code to prevent link blinking restart
>    staging: r8188eu: cancel blink_work before link blinking
>    staging: r8188eu: update status before link blinking
> 
>   drivers/staging/r8188eu/core/rtw_led.c | 120 ++++++++++++-------------
>   1 file changed, 57 insertions(+), 63 deletions(-)
> 

Observed LED: OK

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
