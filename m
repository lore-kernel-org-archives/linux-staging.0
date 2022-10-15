Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C622FAE
	for <linux-staging@lists.linux.dev>; Sat, 15 Oct 2022 20:22:33 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id o20-20020a05600c4fd400b003b4a516c479so6554517wmq.1
        for <linux-staging@lists.linux.dev>; Sat, 15 Oct 2022 13:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AxtZfyRz4DqFhQRD0xbcThZRBAwEjGb4U9UgrEyeyDo=;
        b=JhzprXKxm9NR7qpiY5jVshzjeyasBR3mZQc3J+H8WDFgReGoxuRUY1PYBEAg9c/8rY
         gO+zt48P3ljzoJ1vvNdPjQ4KBC+wkVYcb1lnOou8qQQu32V8qvRmbVqRKMtXmkL/BbqM
         T1d6tcQ7nlBd0d//wYEUUr/ohC7HwjPhN9+pTa/iVllwZs/qoHIoAkXdZKTczlp7arE+
         D3ChtG8UKBbhwYOMaC9xJuauIBguba+EuCBRCqXyK2qtBeyl/W0Eo6rrtQWI+63LjIp1
         QY5BJoRdoMyReBRQ4gaJ23DLNbi4OQC6AR6oIe1U8HBhiNXBV1YIg+hMnX2za+Jcqxbg
         XPLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AxtZfyRz4DqFhQRD0xbcThZRBAwEjGb4U9UgrEyeyDo=;
        b=7Y6N0DQx1Zh4VM66p2Inb/bsKKicOhrlYYQhMkL2Xgv9oHaha8hiLSawYZs/h8Int5
         nkyGYBDTiyRnR+7XgIPCiQo6bpRYX1arLcqD2HpUC3/ubGXQVmC6uMX82wLn3tUv/zbq
         KOiH5hMgjCLic29PPVIbJ0W5lN40Z/1M3eyuHdaypixcZgyxjBvXSoPqGpnlf0aFQ2Pd
         aennoGxg8UV+qsMrc7uqeD4tJiO7SHfgb1bQEgMmBtBaZQ0vQw/c5Cfo4sJkXpOm4xPS
         7+XNuIVe6mEEeAH2fU+vaPdDYjY4QwOCByJ0rkw2AP6418GVoc4QgwjbEtcdmiAFz48d
         MIDg==
X-Gm-Message-State: ACrzQf3rv5wTeoGLcv1ShGs0oOkw0uLvBduMSWAPoNYbMa+fFM7uE5Vu
	sACsWl+UxrKLRWCHUe/mN6k=
X-Google-Smtp-Source: AMsMyM5ksp5Sj9loeHlnugslgVWid4F2uKM9G0+zTcQcUQkrN539glSsecZGra0gGk8c9w7IL2s4Cw==
X-Received: by 2002:a05:600c:548c:b0:3c6:d8dd:2a72 with SMTP id iv12-20020a05600c548c00b003c6d8dd2a72mr12069638wmb.179.1665865352272;
        Sat, 15 Oct 2022 13:22:32 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f3e:6a25:7a44:7fe7:2435:1530? (p200300c78f3e6a257a447fe724351530.dip0.t-ipconnect.de. [2003:c7:8f3e:6a25:7a44:7fe7:2435:1530])
        by smtp.gmail.com with ESMTPSA id e38-20020a5d5966000000b002252884cc91sm4833806wri.43.2022.10.15.13.22.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Oct 2022 13:22:31 -0700 (PDT)
Message-ID: <41f4482a-a213-8e71-be43-2e8539b646eb@gmail.com>
Date: Sat, 15 Oct 2022 22:22:30 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 10/10] staging: r8188eu: summarize tx/rx and scan blinking
Content-Language: en-US
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Michael Straube <straube.linux@gmail.com>,
 Pavel Skripkin <paskripkin@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20221015151115.232095-1-martin@kaiser.cx>
 <20221015151115.232095-11-martin@kaiser.cx>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20221015151115.232095-11-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/15/22 17:11, Martin Kaiser wrote:
> Summarize the code for tx/rx blinking and for scan blinking in blink_work.
> The only difference is the delay for scheduling the next worker.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>   drivers/staging/r8188eu/core/rtw_led.c | 19 +++----------------
>   1 file changed, 3 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_led.c b/drivers/staging/r8188eu/core/rtw_led.c
> index f8bd183fba1e..ce8de2eb7845 100644
> --- a/drivers/staging/r8188eu/core/rtw_led.c
> +++ b/drivers/staging/r8188eu/core/rtw_led.c
> @@ -81,21 +81,6 @@ static void blink_work(struct work_struct *work)
>   		schedule_delayed_work(&pLed->blink_work, LED_BLINK_LINK_INTVL);
>   		break;
>   	case LED_BLINK_SCAN:
> -		pLed->BlinkTimes--;
> -		if (pLed->BlinkTimes == 0) {
> -			if (check_fwstate(pmlmepriv, _FW_LINKED)) {
> -				pLed->CurrLedState = LED_BLINK_NORMAL;
> -				schedule_delayed_work(&pLed->blink_work, LED_BLINK_LINK_INTVL);
> -			} else {
> -				pLed->CurrLedState = LED_BLINK_SLOWLY;
> -				schedule_delayed_work(&pLed->blink_work, LED_BLINK_NO_LINK_INTVL);
> -			}
> -			pLed->bLedBlinkInProgress = false;
> -			pLed->bLedScanBlinkInProgress = false;
> -		} else {
> -			schedule_delayed_work(&pLed->blink_work, LED_BLINK_SCAN_INTVL);
> -		}
> -		break;
>   	case LED_BLINK_TXRX:
>   		pLed->BlinkTimes--;
>   		if (pLed->BlinkTimes == 0) {
> @@ -109,7 +94,9 @@ static void blink_work(struct work_struct *work)
>   			pLed->bLedBlinkInProgress = false;
>   			pLed->bLedScanBlinkInProgress = false;
>   		} else {
> -			schedule_delayed_work(&pLed->blink_work, LED_BLINK_FASTER_INTVL);
> +			schedule_delayed_work(&pLed->blink_work,
> +					      pLed->CurrLedState == LED_BLINK_SCAN ?
> +					      LED_BLINK_SCAN_INTVL : LED_BLINK_FASTER_INTVL);
>   		}
>   		break;
>   	case LED_BLINK_WPS:


I cannot apply this patch.

Applying: staging: r8188eu: summarize tx/rx and scan blinking
error: patch failed: drivers/staging/r8188eu/core/rtw_led.c:81
error: drivers/staging/r8188eu/core/rtw_led.c: patch does not apply
Patch failed at 0001 staging: r8188eu: summarize tx/rx and scan blinking

