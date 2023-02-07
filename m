Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918DC747F
	for <linux-staging@lists.linux.dev>; Tue,  7 Feb 2023 19:46:59 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id az4-20020a05600c600400b003dff767a1f1so7061688wmb.2
        for <linux-staging@lists.linux.dev>; Tue, 07 Feb 2023 11:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X85FLE7pmZ9tZI+IRZVcJyG92P4ZPEve4qyAz2xzuEU=;
        b=LV9k2J32pjTgnD7OARrWx0GdIw536nzZKVPf2G4twWSVB9dO+KfaapEONbeOyX7Ym7
         3Q7JskbFVbk3QBhLlfXlThLMidcuMaDb4+V6xbrYTQTHDpww+5T34EIPGnslFb/xXa/R
         KINyihx5Q9bsfu+7tDyvmuCfhPpty+txZQiT/dNLH5cUlx2dDdzlPq3qnCpTfn9xmQNB
         68SMRUnRPS/r3CnpiTwtemzZhytC0OCBo2B9j8cPgAZQ7rpT8GtOB1esUmD1ceGCSNTM
         87QFnJbonhtE4dRaXyrgeKhYqDK3V1iMsD9i+ToEpwQXmRuowfdgSJttWG+XbS2K8NDD
         Q3tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X85FLE7pmZ9tZI+IRZVcJyG92P4ZPEve4qyAz2xzuEU=;
        b=S/L0L2fTus7DPWpH3BAWZPNtQEpt1uuLsLHEcQgkPln117/D5QeMKn7QnvU9R86HXB
         8B9SVPXTN8816wfb8deLCc68ovTR3RO5UFC98fDm9TTPU2n+shwg1IgWThnCzp1O92GW
         EovsPsimyNrIBWUjiUEPUlXinaW53GaVtVIFLaJKEg2w7j4TKraoxvSlZaKKz37IeR9F
         D6vrr7V/0RRA70WjBEpB+SHCUfCmD/u3PaoyXvYyGcS4+4Ls93MZsD0Hi8Lvp7oZjC6P
         KhIwQscYuNE4eYraSnwFwGqyCjkWp0ieftEl/99UXpImvCOdz8an5iYj/TlVCZyPAIWO
         c5Wg==
X-Gm-Message-State: AO0yUKUeHuVpzK9jpIJfGS9yINmUj73ru1cpBPUj70dQyVjnvx5InVtO
	iLdPqym1fcLFQs6ruXmfAWw=
X-Google-Smtp-Source: AK7set+4w1NOZGoZdmIMBbPybmojD7YYBSohTrUFbAJMPIoFJMgTU7RMQkIE1LezTAe4cRY4Ukrqog==
X-Received: by 2002:a05:600c:5127:b0:3dc:5b88:e706 with SMTP id o39-20020a05600c512700b003dc5b88e706mr5089335wms.1.1675799217789;
        Tue, 07 Feb 2023 11:46:57 -0800 (PST)
Received: from [192.168.1.105] (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id t6-20020a05600c450600b003dc433bb5e1sm15908675wmo.9.2023.02.07.11.46.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Feb 2023 11:46:57 -0800 (PST)
Message-ID: <775daae4-eb5b-cb2f-33ab-96bf1ef76f85@gmail.com>
Date: Tue, 7 Feb 2023 20:46:55 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 0/7] staging: r8188eu: another round of xmit cleanups
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Michael Straube <straube.linux@gmail.com>,
 Pavel Skripkin <paskripkin@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20230207192319.294203-1-martin@kaiser.cx>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20230207192319.294203-1-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/7/23 20:23, Martin Kaiser wrote:
> This series contains some more cleanups for the xmit code.
> 
> Amongst other things, we can reduce the data for the completion function
> of the usb bulk urbs that we send out.
> 
> Martin Kaiser (7):
>    staging: r8188eu: merge do_queue_select into its only caller
>    staging: r8188eu: simplify rtw_alloc_xmitframe
>    staging: r8188eu: remove unused frametag defines
>    staging: r8188eu: xmit_buf's ff_hwaddr is not used
>    staging: r8188eu: simplify xmit_buf flags
>    staging: r8188eu: simplify rtw_get_ff_hwaddr
>    staging: r8188eu: bagg_pkt parameter is not used
> 
>   drivers/staging/r8188eu/core/rtw_xmit.c       | 85 +++++--------------
>   drivers/staging/r8188eu/hal/rtl8188eu_xmit.c  |  8 +-
>   drivers/staging/r8188eu/include/rtw_xmit.h    | 17 +---
>   .../staging/r8188eu/os_dep/usb_ops_linux.c    | 25 +-----
>   4 files changed, 27 insertions(+), 108 deletions(-)
> 
Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
