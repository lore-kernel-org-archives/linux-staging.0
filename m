Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B831820E0
	for <linux-staging@lists.linux.dev>; Sat, 15 Oct 2022 15:56:11 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id by36so9292843ljb.4
        for <linux-staging@lists.linux.dev>; Sat, 15 Oct 2022 08:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=noQRZN2ZP8lry0vAqiwCpeRdos+Kq8TILTVK4c4gvCM=;
        b=Dn2I5KA/tXhbk6IPGYja0JueYiCVPHmc9XJF8sv2B4ZOR2uI56gdYEcP7oMUBA689i
         R12OGsTjS42kVQkRRn60Lg4LuSNCOcer3lCRPLSnHCrK7vA3AuiE9zsL36EeVdVjhkoR
         xKgIgHrsEFflpvX5fL2RTAmzKdgzeBL4cDwkTxdqSfnicaSaX40DHmV5+KQTha1K9xi7
         Wqcu1csoVWPvq6Tj8bqGhYiApkX5VODi24Icvo+fLQhvQrUPRBqGB8C2xphRaint993U
         0ieUV41M1pPo8loP68hlu4egW3NNUsYAOi0OZel7X/m5U8WUJ3W0l7vUJTXBH36yhQuC
         VoZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=noQRZN2ZP8lry0vAqiwCpeRdos+Kq8TILTVK4c4gvCM=;
        b=QgxznpAD07rbick5D3P3ifzYedkAoNqpabG82CKnw+Fc2xA+q+wQatPShT+djeF6wF
         FDHrnTtjhl/kjFhTUq/kDGHFnkKcujPeExmN0Z2u9sDz3THjTde6+Py4dN5SXdbMq/Th
         ISIMLWQDYYTJRCYNTWyglgWz32prqZYUYiwhqeFOV7jup+OM/iYRzbergtynnkZB7kOr
         Hdvz4IugCEieoM4cvrAWepo+bJ4LKgUV33YjK56jgRCENnUDbFR1qgNKyAZt38+g8JOF
         c9gKDPmg1Bt13Qp8l4eyWsWMeEOKxTbDkgEQpwFSgKp2aeuJCIxh9JakZiZwL/8o9FFY
         DvwQ==
X-Gm-Message-State: ACrzQf0Bftk+MiorjxejT0JQ0Q2RP1kihfXVh3GJ1+pWNJrqACDg6p8x
	IPFrdQbk6BwMcUACK5/GFsWD5XfdvsJGOw==
X-Google-Smtp-Source: AMsMyM406ccu+N2C8OduWfAYER8yoPabSe/u4U/PZNrjPtvci8S6XoseM3boGZEbsnrOFKhL3BqSyw==
X-Received: by 2002:a05:651c:1542:b0:26d:bf29:8cd5 with SMTP id y2-20020a05651c154200b0026dbf298cd5mr1127663ljp.304.1665849369613;
        Sat, 15 Oct 2022 08:56:09 -0700 (PDT)
Received: from [192.168.1.11] ([94.103.224.165])
        by smtp.gmail.com with ESMTPSA id i11-20020ac2522b000000b00499bf7605afsm779667lfl.143.2022.10.15.08.56.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Oct 2022 08:56:09 -0700 (PDT)
Message-ID: <a1aec6a3-a8d1-41c2-b127-0799e10e5f13@gmail.com>
Date: Sat, 15 Oct 2022 18:56:08 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 0/9] staging: r8188eu: clean up the OnDeAuth function
Content-Language: en-US
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Michael Straube <straube.linux@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20221015152440.232281-1-martin@kaiser.cx>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20221015152440.232281-1-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Martin,

Martin Kaiser <martin@kaiser.cx> says:
> This series cleans up the OnDeAuth function and tries to replace
> driver-specific parsing code with helpers from ieee80211.h.
> 
> Martin Kaiser (9):
>    staging: r8188eu: replace one GetAddr3Ptr call
>    staging: r8188eu: get reason code from mgmt struct
>    staging: r8188eu: clarify the bBusyTraffic assignment
>    staging: r8188eu: use sa instead of Addr2
>    staging: r8188eu: get bssid from mgmt struct
>    staging: r8188eu: exit for deauth from unknown station
>    staging: r8188eu: remove unnecessary return
>    staging: r8188eu: summarize two flags checks
>    staging: r8188eu: ignore_received_deauth is a boolean
> 
>   drivers/staging/r8188eu/core/rtw_mlme_ext.c | 45 ++++++++++-----------
>   1 file changed, 21 insertions(+), 24 deletions(-)
> 

works for me, thanks

Acked-by: Pavel Skripkin <paskripkin@gmail.com>




With regards,
Pavel Skripkin
