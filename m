Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DF45CA6
	for <linux-staging@lists.linux.dev>; Thu,  8 Sep 2022 19:22:10 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id fy31so40385329ejc.6
        for <linux-staging@lists.linux.dev>; Thu, 08 Sep 2022 12:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=csB+4bxfd65MG9rVygfCuCeV3YPdEmWpSaHxTvn8rK4=;
        b=qOZlmN2JWbIqycsKtAxYfAB4RtPq8zF1e/m97X3xkie3WC0m6RNJFxGRcAz26hp9Vv
         ASpbKPym5vJfBkvijzsqnHH/lO9S8zVwMOZNIewc0ZUmzGN9m+ZeS/cV+PBEPY99zaTF
         pEakQ9wpOxM1xfXkifj0UtHc31Skba9QcB+kucUVbKGd4gUq01R3GoAh+OFQnfEIry3f
         u/UqTUHd6nOE27fl22QOx89W+I7fDMTNyP20SbUi/A39cv/PYipseBcbS20xQCAD4i37
         9OxEymnD0+/aAvPKB80TzvqCHyX0O/Nnq83VjZy7KQdTx8lyhXf3TlvipG/vJaOnbZQE
         8HuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=csB+4bxfd65MG9rVygfCuCeV3YPdEmWpSaHxTvn8rK4=;
        b=eUDpZFEybsB62cWBmzRbkHXeLReGqae+BC+uCZ6EVaAI3DGBci7aFOr4Wlzh+Gu9JH
         0p+rCRlkFpAGR2fX4ZV6oa/kaNbNad50u9UIRO8UucLbKOi+taO0nKH4sgva75J7xrr0
         1w3qUJpoS0puaQEI7MmQyS35f12S8oZL955ITQLqnXtQ8of7yDlt39fb3qDT+Emy9wEA
         SIimRlxXtrUD+xpsOlBfnOSnSHoS3cHhsQnNKWQx6SutkS7zOQpqGFiigBU4xi/vlmfB
         DCSwuuSKaXEwcovTLyM21FswkjzvkGHrayH89sbiRpMEPmSwjUcaq6YqnDYFfDW/xlWx
         ImcA==
X-Gm-Message-State: ACgBeo159NN22tyV9vj3MWxDMMJuEJLu9NCEki/j7MdURCk3kvvhTFS4
	E/r9zJpwKZzLmzhNmcPbO2k=
X-Google-Smtp-Source: AA6agR4lYy/BGMH7vKTJVUUjOrb2KeJRaaYzRqBceCnHrLMchzJO4yMg23SnuN2QVSZWOfbzoikhsA==
X-Received: by 2002:a17:907:628f:b0:72f:58fc:3815 with SMTP id nd15-20020a170907628f00b0072f58fc3815mr7168667ejc.719.1662664929349;
        Thu, 08 Sep 2022 12:22:09 -0700 (PDT)
Received: from [192.168.1.100] (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id u24-20020a056402111800b0044ebe6f364csm6397472edv.45.2022.09.08.12.22.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 12:22:08 -0700 (PDT)
Message-ID: <88f8c741-525d-fe3e-5fbd-3d7b16ca3254@gmail.com>
Date: Thu, 8 Sep 2022 21:22:06 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4] staging: r8188eu: Fix return type for implementation
 of ndo_start_xmit
Content-Language: en-US
To: GUO Zihua <guozihua@huawei.com>, Larry.Finger@lwfinger.net,
 phil@philpotter.co.uk, gregkh@linuxfoundation.org, dan.carpenter@oracle.com
Cc: linux-staging@lists.linux.dev
References: <20220908011323.22186-1-guozihua@huawei.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20220908011323.22186-1-guozihua@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/8/22 03:13, GUO Zihua wrote:
> CFI (Control Flow Integrity) is a safety feature allowing the system to
> detect and react should a potential control flow hijacking occurs. In
> particular, the Forward-Edge CFI protects indirect function calls by
> ensuring the prototype of function that is actually called matches the
> definition of the function hook.
> 
> Since Linux now supports CFI, it will be a good idea to fix mismatched
> return type for implementation of hooks. Otherwise this would get
> cought out by CFI and cause a panic.
> 
> Use enums from netdev_tx_t as return value instead, then change return
> type to netdev_tx_t.
> 
> Fixes: cf68fffb66d6 ("add support for Clang CFI")
> Signed-off-by: GUO Zihua <guozihua@huawei.com>
> ---
> 
> v4:
>    Added Fixes tag.
> 
> v3:
>    Provide detail on CFI.
> 
> v2:
>    Fix truncated subject.
> 
> ---
>   drivers/staging/r8188eu/include/xmit_osdep.h | 2 +-
>   drivers/staging/r8188eu/os_dep/xmit_linux.c  | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/include/xmit_osdep.h b/drivers/staging/r8188eu/include/xmit_osdep.h
> index 00658681fef9..947242486144 100644
> --- a/drivers/staging/r8188eu/include/xmit_osdep.h
> +++ b/drivers/staging/r8188eu/include/xmit_osdep.h
> @@ -28,7 +28,7 @@ struct sta_xmit_priv;
>   struct xmit_frame;
>   struct xmit_buf;
>   
> -int rtw_xmit_entry(struct sk_buff *pkt, struct  net_device *pnetdev);
> +netdev_tx_t rtw_xmit_entry(struct sk_buff *pkt, struct  net_device *pnetdev);
>   
>   void rtw_os_xmit_schedule(struct adapter *padapter);
>   
> diff --git a/drivers/staging/r8188eu/os_dep/xmit_linux.c b/drivers/staging/r8188eu/os_dep/xmit_linux.c
> index 91a1e4e3219a..0b04010d6d82 100644
> --- a/drivers/staging/r8188eu/os_dep/xmit_linux.c
> +++ b/drivers/staging/r8188eu/os_dep/xmit_linux.c
> @@ -198,7 +198,7 @@ static int rtw_mlcst2unicst(struct adapter *padapter, struct sk_buff *skb)
>   	return true;
>   }
>   
> -int rtw_xmit_entry(struct sk_buff *pkt, struct  net_device *pnetdev)
> +netdev_tx_t rtw_xmit_entry(struct sk_buff *pkt, struct  net_device *pnetdev)
>   {
>   	struct adapter *padapter = (struct adapter *)rtw_netdev_priv(pnetdev);
>   	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
> @@ -233,5 +233,5 @@ int rtw_xmit_entry(struct sk_buff *pkt, struct  net_device *pnetdev)
>   
>   exit:
>   
> -	return 0;
> +	return NETDEV_TX_OK;
>   }

Hi,

I cannot apply your patch:

Applying: staging: r8188eu: Fix return type for implementation of 
ndo_start_xmit
error: drivers/staging/r8188eu/include/xmit_osdep.h: does not exist in index
error: drivers/staging/r8188eu/os_dep/xmit_linux.c: does not exist in index
Patch failed at 0001 staging: r8188eu: Fix return type for 
implementation of ndo_start_xmit


Fetch URL: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git

branch staging-testing

Do you know why?

Bye Philipp
