Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70A346BC
	for <linux-staging@lists.linux.dev>; Tue,  6 Sep 2022 13:13:56 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id y3so23219499ejc.1
        for <linux-staging@lists.linux.dev>; Tue, 06 Sep 2022 06:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=jrvWfBsi80xl3fi7CChz3RymCRuWomD19UUNJ4pyqyk=;
        b=mtxOpioeHaKN9D7OtPjto93HBgDJFU0Z1Ntc5myMNA9MU97o8fIdhjsKnHV+shngBS
         uoOFpxViSbOVaCX32M9DJPTdlnaROyMCBIURemMcF97CN8G1ZVLIk/0/qIWiNkr3hop/
         liTXx4FVObzC6jkjKDVnldgjJs4ocuzOTrK/D3DIUapSRSvlSQmBRTrbJzVcrI3+H7m7
         2NvaHjmjaICEVmAnbnGQljPV/iXJHjKpDX/9K3txchcqf276a5xFP6pZqE0eb1js2aOb
         4U8MTgiF6/LNfsSkZbZbA4XITdYyO8lVw1+j6gbQ3Glc4Xjc4IUVf4iwRdoCPSgjNZD4
         6xHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=jrvWfBsi80xl3fi7CChz3RymCRuWomD19UUNJ4pyqyk=;
        b=6r6ws9/xO2CMwF2yyCP1zWFf8X4Sf+qEtIpO5Kr5PhiVHmFV6NwIYxXRvx0MefdK+i
         TuKnxO6Ip89dvGktQCbolrZUE3WnvdBeIwMLsVfO/pNaLGkdzEGPMqglBwQkE67cBbAY
         52tsyt8eIK1Hlt/FEVp5gUHhxOILcFkArKLhmqFqBhkMh3jS1xNmAaVDSmbhCSiddmoL
         5wiisWoQY4YcvkwNgueFKLlhyBfQgduPoI648YTmSLODn3QyaTSKNaPuwqF6aVXrs9gE
         rGMp/OssvL93vZ2we2bUE2hzOoDmqsDQBtKIfq/AdF1/NWFKq01/okyFrCIQbY5XHVq/
         XZOA==
X-Gm-Message-State: ACgBeo0/Kukk4GU6VMW2Njufjdex0Y13+SavbQmFc02PdKnS/cEBAcOr
	nNkNotgDMmg7dJXB4BLLArE=
X-Google-Smtp-Source: AA6agR6HvJGRAyGYGt9UbbAqsJv7U3Qc1sCBQSTnox5v96fXfiNJOKI/kB4HBNwfOx9WPHdaCziQBQ==
X-Received: by 2002:a17:907:7d8c:b0:731:65f6:1f28 with SMTP id oz12-20020a1709077d8c00b0073165f61f28mr37400431ejc.91.1662470034930;
        Tue, 06 Sep 2022 06:13:54 -0700 (PDT)
Received: from [192.168.0.151] (ip5f5abb8f.dynamic.kabel-deutschland.de. [95.90.187.143])
        by smtp.gmail.com with ESMTPSA id j2-20020a17090623e200b0073dbc35a0desm6665081ejg.100.2022.09.06.06.13.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Sep 2022 06:13:54 -0700 (PDT)
Message-ID: <010c2294-ded0-fff0-5b19-e3e89c66d84d@gmail.com>
Date: Tue, 6 Sep 2022 15:13:53 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 0/7] staging: r8188eu: continue rtw_led_control cleanup
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>, Pavel Skripkin
 <paskripkin@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20220905200146.82259-1-martin@kaiser.cx>
Content-Language: en-US
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <20220905200146.82259-1-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/5/22 22:01, Martin Kaiser wrote:
> Here's some more small patches to make rtw_led_control simpler.
> 
> Martin Kaiser (7):
>    staging: r8188eu: simplify the LED_CTL_POWER_OFF case
>    staging: r8188eu: don't restart WPS blinking unnecessarily
>    staging: r8188eu: always cancel blink_work before WPS blinking
>    staging: r8188eu: always update status before WPS blinking
>    staging: r8188eu: always cancel blink_work when WPS failed
>    staging: r8188eu: reset blink state when WPS fails
>    staging: r8188eu: do not "scan blink" if we have a link
> 
>   drivers/staging/r8188eu/core/rtw_led.c | 80 +++++++++-----------------
>   1 file changed, 28 insertions(+), 52 deletions(-)
> 

For all patches:

Tested-by: Michael Straube <straube.linux@gmail.com>
