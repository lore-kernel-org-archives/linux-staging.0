Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F28770
	for <linux-staging@lists.linux.dev>; Mon, 19 Jul 2021 23:46:19 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id j1-20020a0568302701b02904d1f8b9db81so333965otu.12
        for <linux-staging@lists.linux.dev>; Mon, 19 Jul 2021 16:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Y3WoLunfemK0MVFAhNEeHFTfRPr4eHaGu5gyWlmTQp4=;
        b=NEclMDLMiUQgd+sRJA0v/L/+pQVjK70ZiEnXgTo+T88e9NhKcKFqlfR5xgGN/Y5Fw5
         pcKyCOiEQCBpbhZVia2XOpdLzMD2f+PAp0J/UNr6tib6vK+PrmnFUmcIaThFrWowCX+z
         iRu7Ut+JfUEcIkvlyugw4hQnbVTyHRmGBNdcBPippmqR36AeDC0d7ksm39zgw/Ur803h
         3NRf2HeMoIdVn4MOJpU1XCX7C7j5E7cr58a6pVT93g0izEQ01idFt9roP35NsM2vB5Gn
         x4107Jv5z3i0lrrhoYOt4v6PIgHr36boeLJlYZs5Z8fEDrr/qXw+wh0eMW7wnB3qa8iv
         dN1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Y3WoLunfemK0MVFAhNEeHFTfRPr4eHaGu5gyWlmTQp4=;
        b=r+RnOjWWlCSQzN/IlrKyn5oQbFe0RTD8/8dtIl4XFQWksrCnGmObasrtv0yT+AcaRQ
         aFCumcu9H5md+KEkU1/xoai+8ewGfu1t60y9kkLxS2nvVQ6fSUrl5hlL4pLo1e7+AGOE
         PvzhY1hase5Fdc/I7VqdqAAUVjjIy7Cj/j03Z67tiBC+I5JKW3Ud0tWlxCuvo3hfzTLW
         hDXahAYf9Xz15EebbGksnMyB4iMZB5WzrawEhJ9jNx8LAY1BeJaNAeAmrFFrSfu0Egtm
         bU2kZ0QD4sdB+iboXBb4betbgv6myv+Dml3GFF74E+6yMT0o7yghtWB5t0iiaKmwL8Si
         hpGQ==
X-Gm-Message-State: AOAM532BFnobAyKQ7fUWAMpdWhF/+/SczwGgHL3zPY9URtaMZKOJz0jZ
	A8CWdFnNhDgQTQGr3MzMsndSZH1QhVc=
X-Google-Smtp-Source: ABdhPJwCw+z0KHQ05f4eSojY1A3d95SWXGmcOO4IyYWLWJ1GGfxWUKW7/dEt6xfhNV5TZLulT7u3+A==
X-Received: by 2002:a05:6830:1305:: with SMTP id p5mr20739190otq.353.1626738378131;
        Mon, 19 Jul 2021 16:46:18 -0700 (PDT)
Received: from 2603-8090-2005-39b3-0000-0000-0000-1006.res6.spectrum.com (2603-8090-2005-39b3-0000-0000-0000-1006.res6.spectrum.com. [2603:8090:2005:39b3::1006])
        by smtp.gmail.com with ESMTPSA id c18sm977950ots.81.2021.07.19.16.46.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jul 2021 16:46:17 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Subject: Re: [PATCH resend] staging: rtl8188eu: move all source files from
 core subdirectory
To: Phillip Potter <phil@philpotter.co.uk>, gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20210719224601.255364-1-phil@philpotter.co.uk>
From: Larry Finger <Larry.Finger@lwfinger.net>
Message-ID: <7bc43fb0-2dab-190b-c480-9e77cff863d4@lwfinger.net>
Date: Mon, 19 Jul 2021 18:46:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210719224601.255364-1-phil@philpotter.co.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 7/19/21 5:46 PM, Phillip Potter wrote:
> Move all C source files from the core subdirectory to the root
> folder of the driver, and adjust Makefile accordingly. The ultmate
> goal is to remove hal layer and fold its functionalty into the main
> sources. At this point, the distinction between hal and core will be
> meaningless, so this is the first step towards simplifying the file
> layout.
> 
> Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
> ---
>   drivers/staging/rtl8188eu/Makefile            | 34 +++++++++----------
>   drivers/staging/rtl8188eu/{core => }/rtw_ap.c |  0
>   .../staging/rtl8188eu/{core => }/rtw_cmd.c    |  0
>   .../staging/rtl8188eu/{core => }/rtw_efuse.c  |  0
>   .../rtl8188eu/{core => }/rtw_ieee80211.c      |  0
>   .../rtl8188eu/{core => }/rtw_ioctl_set.c      |  0
>   .../staging/rtl8188eu/{core => }/rtw_iol.c    |  0
>   .../staging/rtl8188eu/{core => }/rtw_led.c    |  0
>   .../staging/rtl8188eu/{core => }/rtw_mlme.c   |  0
>   .../rtl8188eu/{core => }/rtw_mlme_ext.c       |  0
>   .../rtl8188eu/{core => }/rtw_pwrctrl.c        |  0
>   .../staging/rtl8188eu/{core => }/rtw_recv.c   |  0
>   drivers/staging/rtl8188eu/{core => }/rtw_rf.c |  0
>   .../rtl8188eu/{core => }/rtw_security.c       |  0
>   .../staging/rtl8188eu/{core => }/rtw_sreset.c |  0
>   .../rtl8188eu/{core => }/rtw_sta_mgt.c        |  0
>   .../rtl8188eu/{core => }/rtw_wlan_util.c      |  0
>   .../staging/rtl8188eu/{core => }/rtw_xmit.c   |  0
>   18 files changed, 17 insertions(+), 17 deletions(-)
>   rename drivers/staging/rtl8188eu/{core => }/rtw_ap.c (100%)
>   rename drivers/staging/rtl8188eu/{core => }/rtw_cmd.c (100%)
>   rename drivers/staging/rtl8188eu/{core => }/rtw_efuse.c (100%)
>   rename drivers/staging/rtl8188eu/{core => }/rtw_ieee80211.c (100%)
>   rename drivers/staging/rtl8188eu/{core => }/rtw_ioctl_set.c (100%)
>   rename drivers/staging/rtl8188eu/{core => }/rtw_iol.c (100%)
>   rename drivers/staging/rtl8188eu/{core => }/rtw_led.c (100%)
>   rename drivers/staging/rtl8188eu/{core => }/rtw_mlme.c (100%)
>   rename drivers/staging/rtl8188eu/{core => }/rtw_mlme_ext.c (100%)
>   rename drivers/staging/rtl8188eu/{core => }/rtw_pwrctrl.c (100%)
>   rename drivers/staging/rtl8188eu/{core => }/rtw_recv.c (100%)
>   rename drivers/staging/rtl8188eu/{core => }/rtw_rf.c (100%)
>   rename drivers/staging/rtl8188eu/{core => }/rtw_security.c (100%)
>   rename drivers/staging/rtl8188eu/{core => }/rtw_sreset.c (100%)
>   rename drivers/staging/rtl8188eu/{core => }/rtw_sta_mgt.c (100%)
>   rename drivers/staging/rtl8188eu/{core => }/rtw_wlan_util.c (100%)
>   rename drivers/staging/rtl8188eu/{core => }/rtw_xmit.c (100%)
> 
> diff --git a/drivers/staging/rtl8188eu/Makefile b/drivers/staging/rtl8188eu/Makefile
> index 28b936e8be0a..2dad13bdbdeb 100644
> --- a/drivers/staging/rtl8188eu/Makefile
> +++ b/drivers/staging/rtl8188eu/Makefile
> @@ -1,22 +1,22 @@
>   # SPDX-License-Identifier: GPL-2.0
>   r8188eu-y :=				\
> -		core/rtw_ap.o		\
> -		core/rtw_cmd.o		\
> -		core/rtw_efuse.o	\
> -		core/rtw_ieee80211.o	\
> -		core/rtw_ioctl_set.o	\
> -		core/rtw_iol.o		\
> -		core/rtw_led.o		\
> -		core/rtw_mlme.o		\
> -		core/rtw_mlme_ext.o	\
> -		core/rtw_pwrctrl.o	\
> -		core/rtw_recv.o		\
> -		core/rtw_rf.o		\
> -		core/rtw_security.o	\
> -		core/rtw_sreset.o	\
> -		core/rtw_sta_mgt.o	\
> -		core/rtw_wlan_util.o	\
> -		core/rtw_xmit.o		\
> +		rtw_ap.o		\
> +		rtw_cmd.o		\
> +		rtw_efuse.o		\
> +		rtw_ieee80211.o		\
> +		rtw_ioctl_set.o		\
> +		rtw_iol.o		\
> +		rtw_led.o		\
> +		rtw_mlme.o		\
> +		rtw_mlme_ext.o		\
> +		rtw_pwrctrl.o		\
> +		rtw_recv.o		\
> +		rtw_rf.o		\
> +		rtw_security.o		\
> +		rtw_sreset.o		\
> +		rtw_sta_mgt.o		\
> +		rtw_wlan_util.o		\
> +		rtw_xmit.o		\
>   		hal/fw.o	\
>   		hal/mac_cfg.o \
>   		hal/bb_cfg.o \
> diff --git a/drivers/staging/rtl8188eu/core/rtw_ap.c b/drivers/staging/rtl8188eu/rtw_ap.c
> similarity index 100%
> rename from drivers/staging/rtl8188eu/core/rtw_ap.c
> rename to drivers/staging/rtl8188eu/rtw_ap.c
> diff --git a/drivers/staging/rtl8188eu/core/rtw_cmd.c b/drivers/staging/rtl8188eu/rtw_cmd.c
> similarity index 100%
> rename from drivers/staging/rtl8188eu/core/rtw_cmd.c
> rename to drivers/staging/rtl8188eu/rtw_cmd.c
> diff --git a/drivers/staging/rtl8188eu/core/rtw_efuse.c b/drivers/staging/rtl8188eu/rtw_efuse.c
> similarity index 100%
> rename from drivers/staging/rtl8188eu/core/rtw_efuse.c
> rename to drivers/staging/rtl8188eu/rtw_efuse.c
> diff --git a/drivers/staging/rtl8188eu/core/rtw_ieee80211.c b/drivers/staging/rtl8188eu/rtw_ieee80211.c
> similarity index 100%
> rename from drivers/staging/rtl8188eu/core/rtw_ieee80211.c
> rename to drivers/staging/rtl8188eu/rtw_ieee80211.c
> diff --git a/drivers/staging/rtl8188eu/core/rtw_ioctl_set.c b/drivers/staging/rtl8188eu/rtw_ioctl_set.c
> similarity index 100%
> rename from drivers/staging/rtl8188eu/core/rtw_ioctl_set.c
> rename to drivers/staging/rtl8188eu/rtw_ioctl_set.c
> diff --git a/drivers/staging/rtl8188eu/core/rtw_iol.c b/drivers/staging/rtl8188eu/rtw_iol.c
> similarity index 100%
> rename from drivers/staging/rtl8188eu/core/rtw_iol.c
> rename to drivers/staging/rtl8188eu/rtw_iol.c
> diff --git a/drivers/staging/rtl8188eu/core/rtw_led.c b/drivers/staging/rtl8188eu/rtw_led.c
> similarity index 100%
> rename from drivers/staging/rtl8188eu/core/rtw_led.c
> rename to drivers/staging/rtl8188eu/rtw_led.c
> diff --git a/drivers/staging/rtl8188eu/core/rtw_mlme.c b/drivers/staging/rtl8188eu/rtw_mlme.c
> similarity index 100%
> rename from drivers/staging/rtl8188eu/core/rtw_mlme.c
> rename to drivers/staging/rtl8188eu/rtw_mlme.c
> diff --git a/drivers/staging/rtl8188eu/core/rtw_mlme_ext.c b/drivers/staging/rtl8188eu/rtw_mlme_ext.c
> similarity index 100%
> rename from drivers/staging/rtl8188eu/core/rtw_mlme_ext.c
> rename to drivers/staging/rtl8188eu/rtw_mlme_ext.c
> diff --git a/drivers/staging/rtl8188eu/core/rtw_pwrctrl.c b/drivers/staging/rtl8188eu/rtw_pwrctrl.c
> similarity index 100%
> rename from drivers/staging/rtl8188eu/core/rtw_pwrctrl.c
> rename to drivers/staging/rtl8188eu/rtw_pwrctrl.c
> diff --git a/drivers/staging/rtl8188eu/core/rtw_recv.c b/drivers/staging/rtl8188eu/rtw_recv.c
> similarity index 100%
> rename from drivers/staging/rtl8188eu/core/rtw_recv.c
> rename to drivers/staging/rtl8188eu/rtw_recv.c
> diff --git a/drivers/staging/rtl8188eu/core/rtw_rf.c b/drivers/staging/rtl8188eu/rtw_rf.c
> similarity index 100%
> rename from drivers/staging/rtl8188eu/core/rtw_rf.c
> rename to drivers/staging/rtl8188eu/rtw_rf.c
> diff --git a/drivers/staging/rtl8188eu/core/rtw_security.c b/drivers/staging/rtl8188eu/rtw_security.c
> similarity index 100%
> rename from drivers/staging/rtl8188eu/core/rtw_security.c
> rename to drivers/staging/rtl8188eu/rtw_security.c
> diff --git a/drivers/staging/rtl8188eu/core/rtw_sreset.c b/drivers/staging/rtl8188eu/rtw_sreset.c
> similarity index 100%
> rename from drivers/staging/rtl8188eu/core/rtw_sreset.c
> rename to drivers/staging/rtl8188eu/rtw_sreset.c
> diff --git a/drivers/staging/rtl8188eu/core/rtw_sta_mgt.c b/drivers/staging/rtl8188eu/rtw_sta_mgt.c
> similarity index 100%
> rename from drivers/staging/rtl8188eu/core/rtw_sta_mgt.c
> rename to drivers/staging/rtl8188eu/rtw_sta_mgt.c
> diff --git a/drivers/staging/rtl8188eu/core/rtw_wlan_util.c b/drivers/staging/rtl8188eu/rtw_wlan_util.c
> similarity index 100%
> rename from drivers/staging/rtl8188eu/core/rtw_wlan_util.c
> rename to drivers/staging/rtl8188eu/rtw_wlan_util.c
> diff --git a/drivers/staging/rtl8188eu/core/rtw_xmit.c b/drivers/staging/rtl8188eu/rtw_xmit.c
> similarity index 100%
> rename from drivers/staging/rtl8188eu/core/rtw_xmit.c
> rename to drivers/staging/rtl8188eu/rtw_xmit.c
> 

I think this is just source churning. The current setup with include. core. hal 
and os_dep subdirectories are not opressive.

Larry

