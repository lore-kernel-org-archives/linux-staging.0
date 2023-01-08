Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43B51859
	for <linux-staging@lists.linux.dev>; Sun,  8 Jan 2023 20:44:42 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id u19so15444107ejm.8
        for <linux-staging@lists.linux.dev>; Sun, 08 Jan 2023 12:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hHU34fbQrjB1Qqz5z5awRpIvUJ++jyxNnJsf9y8SvPo=;
        b=fxDHseu/N/B28EDLadap2GVakUP7NDgCuUPIoHeR3xsP1p2G2ojrn1V52crgUKnLw1
         wq8UXhddqtt36EtIUu/Dihvq68/kWAYWv0v574XCkvkoWOyzwfoFYxbrGne6kwq/Rv/b
         Em2QqTMe8qgwp086FtQufxHQEfmaM8njaTlvwuoTkwtCA+FVc1BW+eUT70zRLImjCAQR
         ckH7M6MpWZ+0WJJDau/fFuvH3Wv6huTWuViBb5gB5/XWKNNIJehn3s3YJ5OG6d8Z/okV
         hnjhR4HwKWBTPN5O0FRyWAsvs048SY8VIM1UXZLRE0BLC5t15l90n11hjl6MP2FYthX4
         BviA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hHU34fbQrjB1Qqz5z5awRpIvUJ++jyxNnJsf9y8SvPo=;
        b=O3iQbHZx8IJ2TGKGfBIgsnCUJ90yWV4lZ4hwyHtZJNYjNtaT7BoK6oVWtrVU2ORwPG
         YV11sg2YHLXCzRZy07zhhyxf8BDua3j9CSKTuHXYvTybze5ak1jzpwYcx0xSIvCGLtZX
         ry9hdeRY+8qMkeXkWBeNqugrtZX7MnnW7ui/dv3obOFLEb1m5VCqajULQf0H2e/H2/XQ
         ZjKXOWPt0qsBkxNcJZ172HuREDvdFpz6f06xJXEsfyHBRrNsPGKf2NlQCbEIAe3fh1n2
         6iP6MJBeFMxgbFnXJ55IcTJpXfx9BxVGHDEQ0c8qg/POa7nUrDJgDcnhGTmPGMLSNMKo
         Xu0Q==
X-Gm-Message-State: AFqh2krIDJ/02mW0ui/wEAswhijmbcCydhVft6+ixz8SEd0zTjn6hViZ
	unZJ+5bZmGz4JqAAFYzn8VQ=
X-Google-Smtp-Source: AMrXdXusCFLDrSpf9WFllGE2rYwpAPpLwd/Z3OKX+HSxKkfxcX/yVcXKxDNInM+Ymgi/j6vjpk2HDQ==
X-Received: by 2002:a17:906:5494:b0:841:e453:af80 with SMTP id r20-20020a170906549400b00841e453af80mr14443921ejo.5.1673210680941;
        Sun, 08 Jan 2023 12:44:40 -0800 (PST)
Received: from [192.168.1.102] (p54a07888.dip0.t-ipconnect.de. [84.160.120.136])
        by smtp.gmail.com with ESMTPSA id bs3-20020a170906d1c300b008490dcae01asm2897283ejb.214.2023.01.08.12.44.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Jan 2023 12:44:40 -0800 (PST)
Message-ID: <83a4a92f-6123-964b-6ca7-f50e7e60005a@gmail.com>
Date: Sun, 8 Jan 2023 21:44:38 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 00/13] staging: r8188eu: some more xmit cleanups
Content-Language: en-US
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Michael Straube <straube.linux@gmail.com>,
 Pavel Skripkin <paskripkin@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20230108185738.597105-1-martin@kaiser.cx>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20230108185738.597105-1-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/8/23 19:57, Martin Kaiser wrote:
> Here's another set of xmit cleanups, based on my previous patches.
> 
> Martin Kaiser (13):
>    staging: r8188eu: beq_cnt is write-only
>    staging: r8188eu: bkq_cnt is write-only
>    staging: r8188eu: viq_cnt is write-only
>    staging: r8188eu: voq_cnt is write-only
>    staging: r8188eu: replace switch with if
>    staging: r8188eu: make rtl8188eu_inirp_init a void function
>    staging: r8188eu: dir_dev is unused
>    staging: r8188eu: remove unused hal_xmit_handler define
>    staging: r8188eu: txirp_cnt is write-only
>    staging: r8188eu: remove unused QSLT defines
>    staging: r8188eu: xmit_priv's vcs_type is not used
>    staging: r8188eu: xmit_priv's vcs is not used
>    staging: r8188eu: xmit_priv's vcs_setting is not used
> 
>   drivers/staging/r8188eu/core/rtw_mlme.c       |  5 ---
>   drivers/staging/r8188eu/core/rtw_xmit.c       | 42 -------------------
>   drivers/staging/r8188eu/hal/usb_halinit.c     | 14 ++-----
>   drivers/staging/r8188eu/include/drv_types.h   |  1 -
>   drivers/staging/r8188eu/include/hal_intf.h    |  2 +-
>   .../staging/r8188eu/include/rtl8188e_xmit.h   | 11 -----
>   drivers/staging/r8188eu/include/rtw_xmit.h    | 10 -----
>   drivers/staging/r8188eu/os_dep/os_intfs.c     |  3 --
>   .../staging/r8188eu/os_dep/usb_ops_linux.c    | 23 +---------
>   9 files changed, 5 insertions(+), 106 deletions(-)
> 

When applying first the 4 patche series and then the 20 patche series 
this series is working.

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
