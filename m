Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF2823A9
	for <linux-staging@lists.linux.dev>; Sat,  4 Feb 2023 14:10:27 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id q8so5759888wmo.5
        for <linux-staging@lists.linux.dev>; Sat, 04 Feb 2023 06:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9s6NAgqAsAyHqRtokq9Jv8AryOH+kxl/jYELgXGXAzY=;
        b=T/SRexPCns1O7QUBs/9ErL2CeaAIrG4f04lu/Rtibpf7cwRjIElH79gWb72Z2bY0jf
         ZwKyxeD/nyhFDQ+vxUsgz3ZaiTS5ohEflzRvYdVdYIpuP0YOvbnZDL/AmM7wGaf/05gy
         rWdK0urERezP99X0z0oL/GOyP+MZA+mA8MyYYNe6PNhiouZHrzywN1MIrdVwkAp6d05J
         MXGntrNcDgOHhnKE2vMJ/2cEG+RbmDUJm+T0p5g2E/7mg5lBer5uotaX7jKmi2eyydQK
         E7oZjmUEL/k4E2pR+m+S5+dtHHhd/XACcp8qgb3PoVJhErkcLRxGjEf0F8yrWaeYt+mT
         vrwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9s6NAgqAsAyHqRtokq9Jv8AryOH+kxl/jYELgXGXAzY=;
        b=1fFvN+rYrzznNhSvUUl2aFXG9QGlwymRdJ75XpkCa+iFbshSFAwCdI8F1PpQDWsVCD
         UMkwGGHVf0ZLL2askefnm3WJ2Cm1ecnEgxwiipRX7TOoY0F44CKOKeARVbFabml0wFuP
         n11xHwwqraamSqGW9Ir5iNc7Ap7d4Qc6J5xgb3+g9FpW5CGSnIzhz5sPawbivBio0D5k
         7WjIvgBf17JP+/V0qkEsoCdgrH2oFFPswXpcDG7Z7fUKao2ip5Bb3zdX3JtJ4Gvd7ZcU
         Isbl1NfRNHde0Tb6Pk5bZ9H0vXBziM8Jixt4UtrZELxhglp2XrLneAgejVIl44o2dAYd
         BlwA==
X-Gm-Message-State: AO0yUKVu+hylHTp8f0xm2SojbbBymos+SlTmcF1BAEpPuSRHSgvi473S
	UqCIgCnMMxh//hEd9uO/dYs=
X-Google-Smtp-Source: AK7set+N5x+cDjKx1IEGv1oZD6a5qD4dqZc7/THmEw2/IWEVZY1DxHpqNbMhkJR2rqL7qtrupPiA0w==
X-Received: by 2002:a05:600c:4e0a:b0:3dc:3398:cf6e with SMTP id b10-20020a05600c4e0a00b003dc3398cf6emr12591146wmq.2.1675519825850;
        Sat, 04 Feb 2023 06:10:25 -0800 (PST)
Received: from [192.168.1.102] (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id y13-20020a1c4b0d000000b003dc4aae4739sm10587795wma.27.2023.02.04.06.10.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Feb 2023 06:10:25 -0800 (PST)
Message-ID: <86e96ed1-365a-7cf7-9e7a-140db15b35e4@gmail.com>
Date: Sat, 4 Feb 2023 15:10:23 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 0/2] staging: r8188eu: correct error logic of two
 functions
To: Michael Straube <straube.linux@gmail.com>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20230204101654.10232-1-straube.linux@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20230204101654.10232-1-straube.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/4/23 11:16, Michael Straube wrote:
> This series converts two functions away from returning _SUCCESS and
> _FAIL. Another tiny step to get rid of _FAIL / _SUCCESS someday.
> 
> Tested on x86_64 with Inter-Tech DMG 02.
> 
> Michael Straube (2):
>    staging: r8188eu: correct error logic of rtl8188eu_init_recv_priv()
>    staging: r8188eu: correct error logic of _rtw_init_recv_priv()
> 
>   drivers/staging/r8188eu/core/rtw_recv.c   | 30 +++++++++--------------
>   drivers/staging/r8188eu/os_dep/os_intfs.c |  2 +-
>   2 files changed, 12 insertions(+), 20 deletions(-)
> 
Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
