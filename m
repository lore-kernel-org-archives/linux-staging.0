Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271BD1FC6
	for <linux-staging@lists.linux.dev>; Sun,  3 Apr 2022 08:44:50 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id u28so1318955eda.12
        for <linux-staging@lists.linux.dev>; Sun, 03 Apr 2022 01:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=xfVP9oZn0/BE7WrrGSxvCysoPKHtw6VApFuE82wzSUY=;
        b=fuyvg/Rki7ORmk6z35agkDIa3JB+Kcq0XudQdz+cdYkCdy6eMJpqcjCm0M4h6Yu3qk
         0lWRGUxd5stxr52H+cb2cs1PLw/z5UBU0V2kvESeBRaffBXsi3MCTkp1Txl8n9wdHggi
         YtGiTGcvKvNDeTe/xKmfozTqZK/y6rFXHhl9RC7WB7NRkTD822NsfDLNTg5glmnkBFX5
         MnmyMQzTsv808Aywg0tcE9QOquqimyB/sKIMqTGqcrL2CyLUctTkKDn5/9uRnQ2AvYr6
         pWe6MmfPe0FK8fD3IL3+UfTJyl8/VejC/OHhhK3tMYy3FlzKT+iNgyyVSq4immMGJzU5
         ++1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=xfVP9oZn0/BE7WrrGSxvCysoPKHtw6VApFuE82wzSUY=;
        b=0Jr5OJ14wtLzQ62EGKymTTah+LVMsc1FkM1NMHjKTcBVwGv75ArR8f2Mlsj+MeTkui
         3c82OFJdBXP0t7XdDwYmZJmBCt2xeNnQ5WKrWxK9SuYR+qXO5YgTEiUyZpV9X+XhKiMT
         T1u3Um3nI4d61WvHfrW/QYyKsS/ScGENZGChefqwyw0qe9k014ymuASlcPq2i2OtG1Em
         hcCNiog1iHwPKVRdorKff+/Y7pEEoTpSUldgXFzOa1ZelfoiYDON/fnJDS574YXSZZ79
         xzrjxG9Qm3OKqfxom/IID8Dr8m4zTDyVD9TKJA+elZvUKFSIbNCMEpjHHYFtznOx0c9v
         h+7g==
X-Gm-Message-State: AOAM530EWA1Man/tZHHupu1iNk5qYLMkxDzx2OiTLQsWdQNZGXcE6Ysv
	6aFDqviD4zN+c54JeqwfdCs=
X-Google-Smtp-Source: ABdhPJzjC+z6DqdTw+gOo/2sJOoWVqhf1eSPznjPBrvXeqqUPef50/kVxo8PaF7nhyKgtQmCLwGWaA==
X-Received: by 2002:a50:954b:0:b0:41a:c9cb:8778 with SMTP id v11-20020a50954b000000b0041ac9cb8778mr28075200eda.165.1648975488355;
        Sun, 03 Apr 2022 01:44:48 -0700 (PDT)
Received: from [192.168.0.253] (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id h14-20020a056402280e00b0041957289726sm3775622ede.79.2022.04.03.01.44.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Apr 2022 01:44:47 -0700 (PDT)
Message-ID: <6a1d7485-d405-d9a6-fefd-5a10d038d493@gmail.com>
Date: Sun, 3 Apr 2022 10:44:46 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: staging: r8188eu: how to handle nested mutex under spinlock
Content-Language: en-US
To: Larry Finger <Larry.Finger@lwfinger.net>,
 Greg KH <gregkh@linuxfoundation.org>
Cc: Phillip Potter <phil@philpotter.co.uk>,
 "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <356c24cf-625b-eea2-2c04-ce132d881cac@gmail.com>
 <d9c7a2ba-288a-d81a-cd59-5b002489d821@lwfinger.net>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <d9c7a2ba-288a-d81a-cd59-5b002489d821@lwfinger.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/2/22 23:32, Larry Finger wrote:
> In drivers/net/wireless/realtek/rtlwifi, we had a similar problem. There 
> it was handled by putting the lps_enter() and lps_leave() operations in 
> a separate workqueue. In this case, the routines were rtl_lps_enter() 
> and rtl_lps_leave(). Each of them sets a variable to indicate whether 
> enter_ps is true or false, and schedules the workqueue. In the 
> workqueue's callback routine, the routines to start/stop ps mode are 
> called. The code is in drivers/net/wireless/realtek/rtlwifi/ps.c.
> 
> This solution is only one of many, and there may be a better one.
> 
> Larry
> 

Thank you for the explanation Larry.

Michael
