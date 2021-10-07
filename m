Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C562C2C83
	for <linux-staging@lists.linux.dev>; Thu,  7 Oct 2021 10:41:18 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id r7so17595978wrc.10
        for <linux-staging@lists.linux.dev>; Thu, 07 Oct 2021 03:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=21L/ntXDB6O/WZavBXYDV8nwPWCxwlOT56pjE95r/Ew=;
        b=Z7JGYSlpSaN58lUY8OlrR5Zqr6QcD/wNCS7BzNZe2YxfhcVeogEhQo9SjnxzqCI18C
         XBbvzSmOpRmA9UgLsJj7ZMcm4ksLyFBwOeyjUh45pkUotS3sJQRgCWfKHc7pHscVRLyf
         HdP0GvRBdwR1ybmK65hjcEO0ecg3ZycAJRvtknyJwdGVyrrE86HoNMkY74Y00yQhYgzH
         leGOpsg/i/+z0FRJSmpQp8rXFeugFuT9zLeUxBtaaMJKN28TnMEjVN751amObREpc/ur
         PXJQ7hD3JVRqt/MnOj6tzz/Yw4Q727YXxk7lyf71/EcbK0O4cQ2CQgJQqdFSyfbbwBYf
         lkiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=21L/ntXDB6O/WZavBXYDV8nwPWCxwlOT56pjE95r/Ew=;
        b=8IXuetkJ7HkHG2zj7qxGZr+t2zdK7Rs5noV1Xl5epv0IcnkwRVkah3RuXipvaGeotM
         ydkFh7fKh62/iietFTaw/GXzQPTyz4WnGLfjIzXB3YctQrgpSq+sqs97E9Gd94eY79WP
         yz5NvdoQKGZRm8UT20KMzxcfQJjeHW6m8O+l3Plx/WUYndXcfPIXIDh68mRYR6acY8rH
         nzbgpC84ylag0X94pECb0qBpPT6gPVOrPGorxnYTXUpokrwHg2sFRV9HyS4ugZmpNSOg
         Z1OLFBnJFkTiP6KJsXIWJRx4BQHREwX4Ap9xwHVb0ISVLWOWoyw/AzXu3RcK15J1CfsP
         7zCg==
X-Gm-Message-State: AOAM5334PuZaTJAarhDCvNhnAGAxgdCGE9Xk+gXJRz5B5kCs7BKqUabI
	f+Qcsv11qdXvpufzs52li0o=
X-Google-Smtp-Source: ABdhPJx10zvbHlwoDfIqbyaGT7g8BgydfaX6FWXITOunxGSmNO0T7KN7oNQg5GPWS0FX1jQ0Hkf14Q==
X-Received: by 2002:adf:f48d:: with SMTP id l13mr4316740wro.94.1633603277250;
        Thu, 07 Oct 2021 03:41:17 -0700 (PDT)
Received: from ?IPV6:2a02:8108:96c0:3b88::5d0b? ([2a02:8108:96c0:3b88::5d0b])
        by smtp.gmail.com with ESMTPSA id y6sm13085981wro.63.2021.10.07.03.41.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Oct 2021 03:41:16 -0700 (PDT)
Message-ID: <620e62d8-6662-004d-38b8-369ad53ce738@gmail.com>
Date: Thu, 7 Oct 2021 12:41:15 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH 2/2] staging: r8188eu: remove GetHwRegHandler from hal_ops
Content-Language: en-US
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20211006203510.9083-1-straube.linux@gmail.com>
 <20211006203510.9083-2-straube.linux@gmail.com>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <20211006203510.9083-2-straube.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/6/21 22:35, Michael Straube wrote:
> Remove GetHwRegHandler from struct hal_ops and remove the wrapper
> rtw_hal_get_hwreg(). Call GetHwReg8188EU() directly instead.
> 
> Signed-off-by: Michael Straube <straube.linux@gmail.com>
> ---
>   drivers/staging/r8188eu/core/rtw_ap.c           | 2 +-
>   drivers/staging/r8188eu/core/rtw_cmd.c          | 4 ++--
>   drivers/staging/r8188eu/core/rtw_ioctl_set.c    | 2 +-
>   drivers/staging/r8188eu/core/rtw_mlme.c         | 2 +-
>   drivers/staging/r8188eu/core/rtw_mlme_ext.c     | 4 ++--
>   drivers/staging/r8188eu/core/rtw_pwrctrl.c      | 2 +-
>   drivers/staging/r8188eu/core/rtw_wlan_util.c    | 2 +-
>   drivers/staging/r8188eu/hal/hal_intf.c          | 6 ------
>   drivers/staging/r8188eu/hal/rtl8188e_cmd.c      | 2 +-
>   drivers/staging/r8188eu/hal/rtl8188e_dm.c       | 2 +-
>   drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 4 ++--
>   drivers/staging/r8188eu/hal/usb_halinit.c       | 4 +---
>   drivers/staging/r8188eu/include/hal_intf.h      | 5 +----
>   drivers/staging/r8188eu/os_dep/ioctl_linux.c    | 4 ++--
>   14 files changed, 17 insertions(+), 28 deletions(-)
> 

This patch is outdated and can be dropped.

Thanks,
Michael
