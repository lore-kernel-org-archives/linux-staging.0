Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584302564
	for <linux-staging@lists.linux.dev>; Sat, 31 Dec 2022 10:08:54 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id qk9so56265739ejc.3
        for <linux-staging@lists.linux.dev>; Sat, 31 Dec 2022 02:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J1HYc6BialSacaveLTPV1yjJMIxmzPFwz0VYaQcNW2E=;
        b=RFf+40SHbhjGwbDYN7lMMm3xQ7zh2IB7U3D5THpTXjiLuvehp1sDGw0J4yi6OM1nQG
         HFRgjJ8gw2S+iSR2aK7+wctCAxp0/cQIi08oa6A5+fZ9NQC0n2mxkY6IfEHzQtG+VI6m
         hKUxPAJsoGh6JpASjTXfi+MPauB3GpnEFN5wYD7plcGg/pPBQY2YfAyyh5Lo3ic+s9AU
         cdD3vCteE545Td0GdXKhFEETvvAocaxGF7L3/geO1xyzM4W4cVRKRANE1+jZvt4qYk3n
         tUbyNzcr8O8HNoxAIW5tfMVRdxJfa1zWkzz/FOstr5DB3jabbEBOsUMcMj94No/od4xt
         C41w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J1HYc6BialSacaveLTPV1yjJMIxmzPFwz0VYaQcNW2E=;
        b=ko8l+MhZQzYeG5TIdPSm+/s/tKv8t1rKFVPXE8IwCEGkRZS3udfxuFu6+89A11Hd6B
         hH97Ccl70sGiyW7vmQAiZnzkEo8HE92+PoLQP5p1sUO+cje3ltbUiILrxerEIN8etsPi
         kHW8Ya/mBtlBHQm3VkV3wiDIjmF+188Edt2TwCmHBfMawJ5haywXupqJaLYxcpzM/TrB
         wvgCJ//24HJVwpPt2tcJLTtdzeoBv5umZAAbry4azX6ISEE/selpgEoZ/XrR4SCK02qP
         7nQQ1XEMFU3pV0aFgLdYTn6zzh1PZ9fKmqyQXFHZ4hE1OYclIw2J9SCQ5ifbvanUX7gG
         HraQ==
X-Gm-Message-State: AFqh2kola7M1twpMzZVRhjxi4FXdOpwmBAXfl8NAJXtTLbPccWRF46ki
	wXeYsothqsaXolIqWSKmMa8=
X-Google-Smtp-Source: AMrXdXvnSBeDaOINm7wcMXY3KGwaq7rtFQdi2kD3HW7ZhTpe9e3hjUF7IofQGk3ONtkxJ8WUZBvpDg==
X-Received: by 2002:a17:906:9f28:b0:7c1:6f1f:6f8f with SMTP id fy40-20020a1709069f2800b007c16f1f6f8fmr6214084ejc.6.1672481332625;
        Sat, 31 Dec 2022 02:08:52 -0800 (PST)
Received: from [192.168.1.102] (p54a07888.dip0.t-ipconnect.de. [84.160.120.136])
        by smtp.gmail.com with ESMTPSA id ky17-20020a170907779100b00849c1e5c00esm9773341ejc.72.2022.12.31.02.08.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Dec 2022 02:08:51 -0800 (PST)
Message-ID: <6a199e03-267d-9924-9926-22a4175596ff@gmail.com>
Date: Sat, 31 Dec 2022 11:08:50 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 00/20] staging: r8188eu: some xmit cleanups
Content-Language: en-US
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Michael Straube <straube.linux@gmail.com>,
 Pavel Skripkin <paskripkin@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20221230180646.91008-1-martin@kaiser.cx>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20221230180646.91008-1-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/30/22 19:06, Martin Kaiser wrote:
> Start cleaning up the code that transmits data frames to the dongle
> via USB.
> 
> This should be applied on top of the "merge public action functions"
> series.
> 
> Martin Kaiser (20):
>    staging: r8188eu: make xmitframe_swencrypt a void function
>    staging: r8188eu: remove some unused CAM defines
>    staging: r8188eu: cmd_seq is write-only
>    staging: r8188eu: return immediately if we're not meant to encrypt
>    staging: r8188eu: remove unused parameter
>    staging: r8188eu: simplify rtl8188eu_xmit_tasklet
>    staging: r8188eu: remove rtl8188eu_init_xmit_priv
>    staging: r8188eu: remove duplicate psta check
>    staging: r8188eu: simplify frame type check
>    staging: r8188eu: simplify rtw_make_wlanhdr's error handling
>    staging: r8188eu: clean up qos_option setting
>    staging: r8188eu: remove unused bpending array
>    staging: r8188eu: remove unused dma_transfer_addr
>    staging: r8188eu: bm_pending is not used
>    staging: r8188eu: terminate_xmitthread_sema is not used
>    staging: r8188eu: tx_retevt semaphore is not used
>    staging: r8188eu: remove unnecessary rtw_free_xmitframe call
>    staging: r8188eu: phwxmit parameter is unused
>    staging: r8188eu: rtw_init_hwxmits is not needed
>    staging: r8188eu: we use a constant number of hw_xmit entries
> 
>   drivers/staging/r8188eu/core/rtw_cmd.c        |   4 -
>   drivers/staging/r8188eu/core/rtw_xmit.c       | 239 ++++++++----------
>   drivers/staging/r8188eu/hal/rtl8188eu_xmit.c  |  27 +-
>   drivers/staging/r8188eu/hal/usb_ops_linux.c   |  14 +-
>   .../staging/r8188eu/include/rtl8188e_spec.h   |  21 --
>   .../staging/r8188eu/include/rtl8188e_xmit.h   |   4 +-
>   drivers/staging/r8188eu/include/rtw_cmd.h     |   1 -
>   drivers/staging/r8188eu/include/rtw_xmit.h    |   9 +-
>   8 files changed, 116 insertions(+), 203 deletions(-)
> 
Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
