Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5087486
	for <linux-staging@lists.linux.dev>; Fri,  2 Dec 2022 21:07:20 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id o13so14292851ejm.1
        for <linux-staging@lists.linux.dev>; Fri, 02 Dec 2022 13:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hEh4M8JHePZNHK/0YUY232n5+7zr7GGL4e0QmQT5TpA=;
        b=kf5Ar+cTkU3HPMXa8IylNRTsy0ocxNGSu2AEO/1awYW8lrnSTFQqOsvbRD6DKCKUkR
         aNzlfrnr+V3OECOCi7BmEwHKEPW+d3NIkkrR2TgXDq+d0oNeL9KGk1jP6mBs01kzIf68
         V90sNjb1HL+5RnEC1LReHGTX5xtdoSCgQQAxvc+V01vihGRKiu4c0ssOKvsSPEgQkt6X
         txAyJIH4+gUtyS5Z0XTNd8Fbv5YDl25FOcN9QP6DDq6bXG2PAGVcSSTQPt2a7zdh7U+b
         AxP59YBUmuEeyssqXWxGyFnvayZps6mdHxhmjEl2D0OKpKLTZOScN4qt4Qto/GPvfWpa
         em0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hEh4M8JHePZNHK/0YUY232n5+7zr7GGL4e0QmQT5TpA=;
        b=QZi6q/3PMU8EanhnSesQTup0x6GMo81078hsiZPzi8p4LzmDd9PgNIIWFJrr7hLb1T
         Zku68aCWxaSLwp0MOHN3qvDn9JAW61pjVvfGN2ONNoCrN8KiRutUvs2Gbll8E8G7fQzb
         apa4v739TLfJjMvEItD3gUB1kOgk3SDk6LFUjl3VHii2VpnO7sRubQRaI8kUC7a3kvX0
         SjEOZ8bOOQD8uHCDWUevW+vg/TUmYzIhjgjv2NDmqGRQUxXjnfMnyyq0rAcftOvuTx/V
         +5pVylzv++Rt3isZ01yS8VxD6dTLcCfmrDJyMK+7wxVANGZ9n6549th9HqRMqi+SX0Gr
         77ag==
X-Gm-Message-State: ANoB5plHD0lGWT+vZOqtGn1FVdag+8Y1WmxmJ30UvvAFEqSqvWy6T41X
	lNEE6e3rVY5GIcvTB1lsEfY=
X-Google-Smtp-Source: AA0mqf4n6Nm+faLQOpzCo048LVTN3CKUERvfKJ8kn3FfCsPE3ayIIA5C7x/ZDD6nRFzYxttvg/aoCA==
X-Received: by 2002:a17:907:cf92:b0:7bf:7a65:b242 with SMTP id ux18-20020a170907cf9200b007bf7a65b242mr22207251ejc.356.1670015238405;
        Fri, 02 Dec 2022 13:07:18 -0800 (PST)
Received: from [192.168.1.101] (p54a07888.dip0.t-ipconnect.de. [84.160.120.136])
        by smtp.gmail.com with ESMTPSA id u10-20020a170906c40a00b007c0cd272a06sm749375ejz.225.2022.12.02.13.07.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 13:07:17 -0800 (PST)
Message-ID: <c702b54a-51e9-9e95-8858-a5b957ded8da@gmail.com>
Date: Fri, 2 Dec 2022 22:07:14 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 0/2] staging: r8188eu: use ieee80211 helpers for subtype
Content-Language: en-US
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Michael Straube <straube.linux@gmail.com>,
 Pavel Skripkin <paskripkin@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20221202093159.404111-1-martin@kaiser.cx>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20221202093159.404111-1-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/2/22 10:31, Martin Kaiser wrote:
> Use the ieee80211 helper functions in some places where the frame subtype
> is checked.
> 
> Martin Kaiser (2):
>    staging: r8188eu: use subtype helpers in collect_bss_info
>    staging: r8188eu: use subtype helper in rtw_check_bcn_info
> 
>   drivers/staging/r8188eu/core/rtw_mlme_ext.c  | 26 +++++++++-----------
>   drivers/staging/r8188eu/core/rtw_wlan_util.c |  7 +++---
>   2 files changed, 14 insertions(+), 19 deletions(-)
> 
Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
