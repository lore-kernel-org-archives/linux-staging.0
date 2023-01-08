Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4761228F9
	for <linux-staging@lists.linux.dev>; Sun,  8 Jan 2023 19:57:42 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id g13so9946600lfv.7
        for <linux-staging@lists.linux.dev>; Sun, 08 Jan 2023 11:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jwMbo3jZwfzrxPAlrx2iocMxlsap6lAjNhHYy958phg=;
        b=B9LBMt+FOLmA/fahhqUqnasBWh4kgAk/a985k6HdSmC38eRp4yhdBaTl7sJjj6W5vG
         25nAMGL7754E7ONiiB3KKGIXPKrT4S+1qpAiXrGCwSf8wSH8yUHyPIY1MNGqTV+eA2jy
         pdKbZbbiS4ASIgfErAFDpRyCb1MnmIlPEyaQbvywTntiZ6R/nbygbxM1VvwHbUxxz+C/
         70v8wPuju2kg373UmaTxY3b5uIUOCk8PbNR/oYFRh1ImjOzU+s3zs02BNa0IXdCjSYvT
         +Zevjp/aFfw0Iz3U5sXMsM3KFzGtpX44dEwGIaOCYjPSOvMznerptwZYEyWp6w7e3Lq5
         9Gaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jwMbo3jZwfzrxPAlrx2iocMxlsap6lAjNhHYy958phg=;
        b=fpmspl6iXqgqPkis4L1b3JYQA9heU4rKpH2qgbGJP4fos0PQGUpBxveyRUg+nCHuvn
         sjDe7nISfcFAaLGx7AIbRraGquyg+ixpn/2Hj1RcAoN7Js2omX2nokt4fixcDAewPsqO
         ybj94mBrkl71zMu2dY6oUvLfJWDt10YaWn9UG+qcHbhIsznEhN6uEbCMtRwxGdaM+JkR
         +8KaaED+SW2WRfa4nmeLpocMi78HO6NYhx9nRqGbe5LnZA1wXuluNGXUi0BA/1lxT7W/
         fBr11zMqRR7YLY4ZGtQwsU0p93J0RYm6lYVHksA6d5Nf1161x+fSC2a9s1lA0inpr6Hs
         bdLQ==
X-Gm-Message-State: AFqh2ko8C7T8QYS/UfIpFv/JZrLFp0SeoxPSuEUYfmQOU5kKMEhu9n8K
	lN8CcQ8lkIqwaTTloT0DzYA=
X-Google-Smtp-Source: AMrXdXtqEIhK0FSbCGD0wd7TGiB+ySlFDihf2JNIwpAR3lEvvd28P1CZTgWFVgWB5vLgRs8ArWN05w==
X-Received: by 2002:ac2:50d9:0:b0:4cb:2c19:ec21 with SMTP id h25-20020ac250d9000000b004cb2c19ec21mr8188083lfm.0.1673207860199;
        Sun, 08 Jan 2023 11:57:40 -0800 (PST)
Received: from ?IPV6:2a00:1370:8180:6b00:a1a8:4887:1af4:637a? ([2a00:1370:8180:6b00:a1a8:4887:1af4:637a])
        by smtp.gmail.com with ESMTPSA id d7-20020ac25447000000b004b40c1f1c70sm1205176lfn.212.2023.01.08.11.57.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Jan 2023 11:57:39 -0800 (PST)
Message-ID: <ab4727b9-69c1-ba8d-38d8-6a3c721ba2aa@gmail.com>
Date: Sun, 8 Jan 2023 22:57:39 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 06/13] staging: r8188eu: make rtl8188eu_inirp_init a void
 function
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Michael Straube <straube.linux@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20230108185738.597105-1-martin@kaiser.cx>
 <20230108185738.597105-7-martin@kaiser.cx>
Content-Language: en-US
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20230108185738.597105-7-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Martin,

Martin Kaiser <martin@kaiser.cx> says:
> rtl8188eu_inirp_init's return value is not checked by its caller. Make
> rtl8188eu_inirp_init a void function.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>   drivers/staging/r8188eu/hal/usb_halinit.c  | 14 +++-----------
>   drivers/staging/r8188eu/include/hal_intf.h |  2 +-
>   2 files changed, 4 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
> index d28b4dc2a767..afa24a59fbb3 100644
> --- a/drivers/staging/r8188eu/hal/usb_halinit.c
> +++ b/drivers/staging/r8188eu/hal/usb_halinit.c
> @@ -851,29 +851,21 @@ u32 rtl8188eu_hal_deinit(struct adapter *Adapter)
>   	return _SUCCESS;
>    }
>   
> -unsigned int rtl8188eu_inirp_init(struct adapter *Adapter)
> +void rtl8188eu_inirp_init(struct adapter *Adapter)

Hm, shouldn't we actually check return value on caller side?

This thing is called from netdev_open and issues urbs to read data from 
the device. So let's imagine that we fail on 1st iteration (for some 
reason): netdev_open() says all is OK, but driver does not communicate 
with the device.


Maybe these urbs are not that important, tho..


With regards,
Pavel Skripkin
