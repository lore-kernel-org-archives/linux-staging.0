Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F417E0
	for <linux-staging@lists.linux.dev>; Tue, 23 Aug 2022 18:50:00 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id u9so246409ejy.5
        for <linux-staging@lists.linux.dev>; Tue, 23 Aug 2022 11:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=HDcgc6OUnOjUxJicIucPyi00x/uE2rgP4ZhCVYRaya4=;
        b=M0bosexAr3X3AiHofQY+LmL8o8KKKyNRORbRR8NilxIGrpdmbAuxD2Hcn7YayVkhx/
         QertnlrES63fY0UiaEbLZ7m0m0AeMvSKsZkIL4trc82xFRdGTPhfCJnBxyXVEwmxosEl
         J8HwQNWi5dkfzQpSt+/jb7iRHkN5P1TR1ObjOZGOIIxG+17Y2iYKj46oOjDyCIcPGGXx
         ILrJNXYEmcym1uQe6bo2QY0LCAl2A12J4I4Z5Od7Q0lvhZNNSaIj1tK8E7q8ZAzwVqhl
         UGZVl9MaALuO6jpWAHf5vQjS277ysNU77epuiu/BRvt15CO9FhsD225GmNb6h7OWaeIY
         InHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=HDcgc6OUnOjUxJicIucPyi00x/uE2rgP4ZhCVYRaya4=;
        b=SBfL3TQHlx+Ess+XPLIp5rYncrtJEkQAV6yzEf5Ch/QeP5J4kKaw+S3bZKDdCQyIIz
         96/na6OCj9XvM3MWl9r43hWcBqcvLPq5tgIDyTGEutyJwrRzzZD2MvQ4HPGFJf1AYDyq
         B/029SbYykev3iFzMxLg9P/Wc0r8mLG7XvShb/fCEfOezvhclTSTrbcG8ksbiYbqygwj
         hbbWM7nIbm4ixrpDR6eLP92XIhrnvBAtxx3JzRnpaordosWTzzQzJBqGndOoXnXw4giD
         YYlgz/i0GT+YecrxgmYLcB5euW4bbSeiGFsJN+t6irg2bGHWrlR5i2/SwaWsXRAVikwC
         5Nig==
X-Gm-Message-State: ACgBeo0bVrBauMsGEcBPte96H37twWQlhmGumyz5RDp8rUaYvcVLq1oG
	p9j69t0r3EmJ//cyHKEF1uc=
X-Google-Smtp-Source: AA6agR4HaGfkUpd1Cc36ZFyz+klvn03thzdj46FVcP5CY8SKUIFENtJMFrG1bShE3q+ZnskLjkQZVQ==
X-Received: by 2002:a17:906:3bd2:b0:731:3f03:1697 with SMTP id v18-20020a1709063bd200b007313f031697mr607759ejf.289.1661280598764;
        Tue, 23 Aug 2022 11:49:58 -0700 (PDT)
Received: from [192.168.1.100] (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id s15-20020aa7c54f000000b0044733adf4e9sm802097edr.12.2022.08.23.11.49.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Aug 2022 11:49:58 -0700 (PDT)
Message-ID: <91772e44-856d-cdee-e685-ff2ba4523c2e@gmail.com>
Date: Tue, 23 Aug 2022 20:49:56 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/3] staging: r8188eu: start cleaning up led blinking
Content-Language: en-US
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Michael Straube <straube.linux@gmail.com>,
 Pavel Skripkin <paskripkin@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20220822201329.95559-1-martin@kaiser.cx>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20220822201329.95559-1-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/22/22 22:13, Martin Kaiser wrote:
> The code for led blinking contains too many states and state variables.
> This series is a first tiny step towards cleaning things up.
> 
> Martin Kaiser (3):
>    staging: r8188eu: don't restart "no link" blinking unnecessarily
>    staging: r8188eu: always cancel blink_work
>    staging: r8188eu: always update the status variables
> 
>   drivers/staging/r8188eu/core/rtw_led.c | 36 ++++++++++++--------------
>   1 file changed, 17 insertions(+), 19 deletions(-)
> 

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
