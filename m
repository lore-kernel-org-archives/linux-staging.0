Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC87970
	for <linux-staging@lists.linux.dev>; Wed,  4 Aug 2021 13:45:11 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id o44-20020a17090a0a2fb0290176ca3e5a2fso3661320pjo.1
        for <linux-staging@lists.linux.dev>; Wed, 04 Aug 2021 06:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cTzYEZ1ifUfSJIRMeEuRI6Bh508zFVAMOXiQ+FVtrxc=;
        b=TNBShf0p3hMVW3kQkFtbtxvDdQmD05LrFa3qy/X9Pah321jDe5iBPFPGgKos2fgn8S
         uT0AK78PF5HSyHqDyKCs+9dxikqydDrEbkqpXzZySdHcXrEO0AuNf2sn9Q0tY5ExkqIm
         /uhEL5ZGk91SOS51AOS1JnM9VMI2xvhMh5ZesELyR/HS3EHpoH3hkaMARgT8lkTjMqw2
         IahqJHsybLuWyd2sWWNgaLLKSMiiZv3iTmBBynEfItMy/hdkyumqCQxdQgotdMBMcTEq
         U/QxC3ntztbgZG3JMUfezAkSlQmA8z7QBtsTyU05FtlghaWp78TTrzskITz9td2MZbVm
         j03g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cTzYEZ1ifUfSJIRMeEuRI6Bh508zFVAMOXiQ+FVtrxc=;
        b=HQP9Opitxmg4taq7yqjuIzMhBL15MgzBv48rFPchSWVUkDrdcmB06TzGpVxvMyslSY
         DGB9Eavwy0q3lBz/T9JLILUYADY//sLFVq3Rc+kTcRM5UWp12wEEWX8OdQYF62gwHzFQ
         odFJ5JA6SWOLo8wD9Z0IT8Nk3QXVs/HVkyG8ZSspDunMhCOB/1r54rXje5UYPeYKGKEf
         HKDe9Vi6MbRa5WvuPSHVQKH25eCvhdyyl4KijqvIVNvw9wheQutuy0e7Ruf1e1pSe5e3
         fegyd2moPLQWNY4w43AnXKDwmPdaBhh11QG2AcEGFRB8MYPDwPRBbr9Jr9raZDDa29VH
         zZcQ==
X-Gm-Message-State: AOAM530NFq/9doev4NETfEZWMXBHbR5nt24/ccbpmxewqVkAbFlCcoA+
	Db1H9xMepWlZSILtAEYTWIQ=
X-Google-Smtp-Source: ABdhPJxRHdi5e+UMW+6WkWSKWhqNuDp/6QrqXAcr388BCWiKBWlh+TF9dUNhGbo0q2H1TdNyFrSwcQ==
X-Received: by 2002:a17:90b:e10:: with SMTP id ge16mr25294122pjb.150.1628084711190;
        Wed, 04 Aug 2021 06:45:11 -0700 (PDT)
Received: from user ([106.212.234.168])
        by smtp.gmail.com with ESMTPSA id y2sm2859693pjl.6.2021.08.04.06.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 06:45:10 -0700 (PDT)
Date: Wed, 4 Aug 2021 19:15:05 +0530
From: SAURAV GIREPUNJE <saurav.girepunje@gmail.com>
To: gregkh@linuxfoundation.org, fabioaiuto83@gmail.com,
	saurav.girepunje@gmail.com, marcocesati@gmail.com,
	ross.schm.dev@gmail.com, insafonov@gmail.com,
	linux-staging@lists.linux.dev
Cc: saurav.girepunje@hotmail.com;, moun.girepunje@gmail.com
Subject: Re: Post to linux-staging@lists.linux.dev denied: [PATCH] staging:
 rtl8723bs: os_dep: remove unused variable
Message-ID: <YQqZ4TlTzZGIaixJ@user>
References: <1628081824-28535-mlmmj-16bf2009@lists.linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1628081824-28535-mlmmj-16bf2009@lists.linux.dev>

On Wed, Aug 04, 2021 at 12:57:04PM +0000, linux-staging+owner@lists.linux.dev wrote:
> Greetings!
>
> This is the mlmmj program managing the <linux-staging@lists.linux.dev>
> mailing list.
>
> The message from <saurav.girepunje@gmail.com> with subject "[PATCH]
> staging: rtl8723bs: os_dep: remove unused variable" was unable to be
> delivered to the list because the list address was not found in either the
> To: or CC: header.
>
> (The denied message is below.)

> Date: Wed, 4 Aug 2021 18:26:57 +0530
> From: Saurav Girepunje <saurav.girepunje@gmail.com>
> To: gregkh@linuxfoundation.org;, fabioaiuto83@gmail.com;,
>  saurav.girepunje@gmail.com;, marcocesati@gmail.com;,
>  ross.schm.dev@gmail.com;, insafonov@gmail.com;,
>  linux-staging@lists.linux.dev;, linux-kernel@vger.kernel.org;
> Cc: saurav.girepunje@hotmail.com
> Subject: [PATCH] staging: rtl8723bs: os_dep: remove unused variable
>
> Remove below unused static variable from os_intfs.c
> rtw_enusbss
> rtw_hwpdn_mode
> rtw_hwpwrp_detect
>
> Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
> ---
>  drivers/staging/rtl8723bs/os_dep/os_intfs.c | 8 --------
>  1 file changed, 8 deletions(-)
>
> diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> index 724909078d80..71c9e7eec206 100644
> --- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> +++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> @@ -109,11 +109,6 @@ static int rtw_antdiv_cfg = 1; /*  0:OFF , 1:ON, 2:decide by Efuse config */
>  static int rtw_antdiv_type; /* 0:decide by efuse  1: for 88EE, 1Tx and 1RxCG are diversity.(2 Ant with SPDT), 2:  for 88EE, 1Tx and 2Rx are diversity.(2 Ant, Tx and RxCG are both on aux port, RxCS is on main port), 3: for 88EE, 1Tx and 1RxCG are fixed.(1Ant, Tx and RxCG are both on aux port) */
>
>
> -static int rtw_enusbss;/* 0:disable, 1:enable */
> -
> -static int rtw_hwpdn_mode = 2;/* 0:disable, 1:enable, 2: by EFUSE config */
> -
> -static int rtw_hwpwrp_detect; /* HW power  ping detect 0:disable , 1:enable */
>
>  static int rtw_hw_wps_pbc;
>
> @@ -159,9 +154,6 @@ module_param(rtw_wifi_spec, int, 0644);
>  module_param(rtw_antdiv_cfg, int, 0644);
>  module_param(rtw_antdiv_type, int, 0644);
>
> -module_param(rtw_enusbss, int, 0644);
> -module_param(rtw_hwpdn_mode, int, 0644);
> -module_param(rtw_hwpwrp_detect, int, 0644);
>
>  module_param(rtw_hw_wps_pbc, int, 0644);
>
> --
> 2.30.2
Hi,

My mails are not getting deliverd due to below reason
"unable to be delivered to  the list because the list address was not
found in either the To: or CC: header."
However linux-staging@lists.linux.dev is in my To header.

Is anyone highlight what I am doing wrong.

saurav
