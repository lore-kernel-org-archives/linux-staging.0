Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80A62C83
	for <linux-staging@lists.linux.dev>; Thu,  7 Oct 2021 10:40:56 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id m22so17744046wrb.0
        for <linux-staging@lists.linux.dev>; Thu, 07 Oct 2021 03:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=swRrSAK0PQsOEveEBZP+/Xsr4OeoC6PtEACIPO7t2WI=;
        b=bEeSOcUIf9vpSuc4DmpmAGfh0mNND7iuVDLScnS+EqoFv2F4RW64znvNVePg6jAsCK
         25thxUvi//MDvhqXT/DFrE+iToIccvokdoUKyWHvFmcua7/VtCCVzHCm07KtBH0JX/am
         BaYNSgJS026W1rfVih7y+66i/70+GGk8Yz74nLDjEltDA/rP2TGnh/Ta5LdkdmQ6umae
         zNiR5DZyfa4JghYnME8dKWlL8PyPNVgd/Ka4+yBH07h2hZ7h/CmTNesqxpEzHBNGH/go
         AUQyadxNF5ip8TxRpFulRmY60hGLQDsSxXPqFULn6DYHNYGcJ2STMZ8rpkJYsup8ZwpX
         uByA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=swRrSAK0PQsOEveEBZP+/Xsr4OeoC6PtEACIPO7t2WI=;
        b=d/VCXVZSdIVaJA7Z2cWJ7yzEcAUSdDaqwvtbUKA1C73Ohurg+Y/EawX6mBlZ98ZWHH
         9BVQXphwj9YzLydFglWNzkQr7s+kfs6KFpAfhmHAmHlXJLNU1t6c28QqTsCOUESDin1+
         NKFGRe3bMW85UHJjmEJ0t9SNRRyiAkJ5aqDUbT0N8QQAgN5PlBuXWESft0EE/sbzmpiW
         Z4EkG1qyqIC5IjcCFbgf2wmzgsFDdBN0hRpCSY9IU9RTjfKtFKq0zz2HT8nWPd3T4ZJZ
         yUIkq/NIZOHEn/QjlMLX3tDcSUqZUP02MLSisG79dZmuW0a3kdWfNzXccUwbQAXILvtZ
         PZaw==
X-Gm-Message-State: AOAM5300pLHQDdZmwmPnTnB1pfCDkTeSgM4UTd9NcLuOPcgURDwe+8le
	FI6JJSGvmZ3nwA2Rpukzaeo=
X-Google-Smtp-Source: ABdhPJwOCeEJ6i+yiZck82i2ASYs934rM1crZp3Lcl0/vlPqbMGOKovrS+yIepZ9g+yS+HfUnlUWsA==
X-Received: by 2002:adf:fe0b:: with SMTP id n11mr4420534wrr.371.1633603255249;
        Thu, 07 Oct 2021 03:40:55 -0700 (PDT)
Received: from ?IPV6:2a02:8108:96c0:3b88::5d0b? ([2a02:8108:96c0:3b88::5d0b])
        by smtp.gmail.com with ESMTPSA id o12sm4626650wrw.73.2021.10.07.03.40.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Oct 2021 03:40:54 -0700 (PDT)
Message-ID: <8c94a5c0-6ce0-f6d3-5297-45d578095e32@gmail.com>
Date: Thu, 7 Oct 2021 12:40:52 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH 1/2] staging: r8188eu: remove SetHwRegHandler from hal_ops
Content-Language: en-US
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20211006203510.9083-1-straube.linux@gmail.com>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <20211006203510.9083-1-straube.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/6/21 22:35, Michael Straube wrote:
> Remove SetHwRegHandler from struct hal_ops and remove the wrapper
> rtw_hal_set_hwreg(). Call SetHwReg8188EU() directly instead.
> 
> Signed-off-by: Michael Straube <straube.linux@gmail.com>
> ---
>   drivers/staging/r8188eu/core/rtw_cmd.c        |  8 +--
>   drivers/staging/r8188eu/core/rtw_mlme.c       | 11 ++-
>   drivers/staging/r8188eu/core/rtw_mlme_ext.c   | 69 ++++++++-----------
>   drivers/staging/r8188eu/core/rtw_p2p.c        | 16 ++---
>   drivers/staging/r8188eu/core/rtw_pwrctrl.c    |  4 +-
>   drivers/staging/r8188eu/core/rtw_wlan_util.c  | 42 +++++------
>   drivers/staging/r8188eu/hal/hal_com.c         |  3 +-
>   drivers/staging/r8188eu/hal/hal_intf.c        |  6 --
>   drivers/staging/r8188eu/hal/rtl8188e_cmd.c    |  4 +-
>   .../staging/r8188eu/hal/rtl8188e_hal_init.c   |  4 +-
>   drivers/staging/r8188eu/hal/usb_halinit.c     |  3 +-
>   drivers/staging/r8188eu/include/hal_intf.h    |  5 +-
>   drivers/staging/r8188eu/os_dep/ioctl_linux.c  |  2 +-
>   drivers/staging/r8188eu/os_dep/os_intfs.c     |  2 +-
>   14 files changed, 78 insertions(+), 101 deletions(-)
> 

This patch is outdated and can be dropped.

Thanks,
Michael
