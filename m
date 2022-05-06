Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7A97E8
	for <linux-staging@lists.linux.dev>; Fri,  6 May 2022 07:41:22 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id p10so11173422lfa.12
        for <linux-staging@lists.linux.dev>; Fri, 06 May 2022 00:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=/nebMqVfT+54zsFtvKohJbYf+QR1kkUWhZbfriasr58=;
        b=OroYPBv6tDt222Zrkqx2eB3zMfsQ3LD8gGdxVqOuIp7Klct/n0Q9UDLe9rDcUaTRvA
         y5srW3JLT1UVXGlrrDt9uEWSl6x0AhPjgXzCARhQ8iRM6u85SC7td3+aiPd2cIdh3+OD
         MHGkA37r+Wo5NxNMmXo8uTYnMICTylbSvEFBQdbHiiO1ctrp5ygMnfpp6Ym92F9YFVbh
         LSksaGVz8sQDxh3M3qR8h6qLpe/9tm1w+NktYZXbHEQrUUwcaeXlffaPQKoIwsEEFQDa
         LK461sWoOujgfAvtowg/IXrpRJQtXjYJg94/aKWHp/ywIrpSQ3D3yv/GdTnhA8MCBQ0b
         LjEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=/nebMqVfT+54zsFtvKohJbYf+QR1kkUWhZbfriasr58=;
        b=Yp6wARfpi3KdRoxJ2oFmEQv7/93tHWdL80K27XgpBDN0XnzHCLYHBSjlEYCLcwfzto
         RAztYPDT3+G9AzorgFT6QGP7TiGhSNt2Gt58gt7bqTlze6K2YtXRnzRuyVEFi0FstL3g
         ypIMlymqDm3zHaOXR6O1lVrwOsl+s11JrZuoujMm9FOez38Tv2pOnjdJXNdvjnyPnXpd
         EQPABzpSxCOW//FPz1sJP/AVZDEotShmDp793Xy35TDhlauJ7OC2ad4zzT5mkJm4Ykyy
         YTccoHUJZzcYBQUJoDOSX9g+w5cu3tk+BVbrGuVFAYEzq2odROY5AlZWv6M3ax+Z3iQE
         SvEg==
X-Gm-Message-State: AOAM533eVp4K5THbevghaXHsTLua0Jj4cG1vghxRkXC2FB8vTwfQLkuM
	k6ie2wtHzGYrN1+ZcfzKjQc=
X-Google-Smtp-Source: ABdhPJz8zlQiMb55eBpfZxzaMpDiMUi7EpuQODK+4Q6oV9xgysymwHt2dbOXi4olkQzPMsEemBYvwg==
X-Received: by 2002:ac2:4e14:0:b0:473:bdfa:e48e with SMTP id e20-20020ac24e14000000b00473bdfae48emr1567859lfr.230.1651822880808;
        Fri, 06 May 2022 00:41:20 -0700 (PDT)
Received: from [192.168.1.11] ([217.117.246.114])
        by smtp.gmail.com with ESMTPSA id p21-20020a05651212d500b0047255d211dbsm567937lfg.266.2022.05.06.00.41.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 May 2022 00:41:20 -0700 (PDT)
Message-ID: <46b89616-5ec7-fb04-f561-2647efd968c4@gmail.com>
Date: Fri, 6 May 2022 10:41:19 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/2] staging: rtl8712: fix uninit-value in
 r871xu_drv_init()
Content-Language: en-US
To: Wang Cheng <wanngchenng@gmail.com>, dan.carpenter@oracle.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <cover.1651760402.git.wanngchenng@gmail.com>
 <14c3886173dfa4597f0704547c414cfdbcd11d16.1651760402.git.wanngchenng@gmail.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <14c3886173dfa4597f0704547c414cfdbcd11d16.1651760402.git.wanngchenng@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Wang,

On 5/6/22 06:16, Wang Cheng wrote:

[snip]

> 
> Reported-and-tested-by: syzbot+6f5ecd144854c0d8580b@syzkaller.appspotmail.com
> Signed-off-by: Wang Cheng <wanngchenng@gmail.com>
> ---
>   drivers/staging/rtl8712/usb_intf.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8712/usb_intf.c b/drivers/staging/rtl8712/usb_intf.c
> index ee4c61f85a07..50dcd3ecb685 100644
> --- a/drivers/staging/rtl8712/usb_intf.c
> +++ b/drivers/staging/rtl8712/usb_intf.c
> @@ -538,13 +538,13 @@ static int r871xu_drv_init(struct usb_interface *pusb_intf,
>   		} else {
>   			AutoloadFail = false;
>   		}
> -		if (((mac[0] == 0xff) && (mac[1] == 0xff) &&
> +		if ((!AutoloadFail) ||
> +		    ((mac[0] == 0xff) && (mac[1] == 0xff) &&
>   		     (mac[2] == 0xff) && (mac[3] == 0xff) &&
>   		     (mac[4] == 0xff) && (mac[5] == 0xff)) ||
>   		    ((mac[0] == 0x00) && (mac[1] == 0x00) &&
>   		     (mac[2] == 0x00) && (mac[3] == 0x00) &&
> -		     (mac[4] == 0x00) && (mac[5] == 0x00)) ||
> -		     (!AutoloadFail)) {
> +		     (mac[4] == 0x00) && (mac[5] == 0x00))) {


That looks ugly. I mean mac checks. Can we, please, use sane kernel API 
like is_valid_ether_addr()?


>   			mac[0] = 0x00;
>   			mac[1] = 0xe0;
>   			mac[2] = 0x4c;




With regards,
Pavel Skripkin
