Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509A37FC
	for <linux-staging@lists.linux.dev>; Sat, 24 Jun 2023 06:03:31 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-988a4a7be58so31125466b.0
        for <linux-staging@lists.linux.dev>; Fri, 23 Jun 2023 23:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687586609; x=1690178609;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mL9869uxyI9VJka/GpEbEqxA2gTl4XYgCP6XmikgbWg=;
        b=KrT3nlmFrRckgej3EWQdrMhhwVwBjzrvCeKbYSm4GryxSBGSfZJqopI8ggLhHATxlF
         X3KeiJSxAxHcRIn0Q/B78O+W+ycO7BW5/oCyM1ttUUFo+CEIUqCbufzVFvNIX9F/I2S8
         Sttbp+affykocKqcCf1PYXgtR8K/3j9uN3xx/KrPt8PYWlkTtAiDa3IZWhPIR8PqUma7
         XGi1Inc36tP9z8ig+3GGyzTCrsxPVXQ5pELQtSzpzUPMOF6CUUx1BeMN0Kki8ZC7vYos
         389zdgxNvOPW/TOInfp+0ZG2q4daTAy+BJLvOdCw3jjpvHvbE8ajA7ZFNcqJd6esXV9A
         R9WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687586609; x=1690178609;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mL9869uxyI9VJka/GpEbEqxA2gTl4XYgCP6XmikgbWg=;
        b=aCk/zyW6gg9K+nnVb4wlUj4EDf9d3/qiKVzNm3HNDP7r+vGTwpOnABiBcUHrl9TkUO
         W0TBzRMrdJG/I4Zk2N1AaWmf08gstVzJCIIdkqs9CDxk/7mM2idtyerH518EPwC3nNF8
         NqEQkA6N+Qpj41+JHRu4+rcGLbj5sxb0cZBCJoeK9FN8/iSwyJn09NvgfLf8BXb6HMYN
         bLO8T+/z2Pd3vtJ7NmAQ6dGe25apWpH79zJ8LLOw9K6MN/ixZ74Bwon5kFuhXv1qNVVB
         qxit14m4RpuiFzbcLyZwTLrHk1YLR/GzKYvxeIGzV4yY5Lz+3gHVwRAtk/cUePLMIfYL
         hktg==
X-Gm-Message-State: AC+VfDyWm+MKV0bpxtCj7zGRFYSOTR99c/KHTrLQmIGkJaE02lLggu4L
	dK5SW8VclI70zDYuravl/ro=
X-Google-Smtp-Source: ACHHUZ71JsXJxmduI4bxXw8okqNOiCMMO3kl0Ul5sr3juEPBHKJD0o+3qiywaXc2weRWWgA5B/lPAA==
X-Received: by 2002:a17:906:64d5:b0:988:8e7a:d953 with SMTP id p21-20020a17090664d500b009888e7ad953mr12886879ejn.1.1687586609039;
        Fri, 23 Jun 2023 23:03:29 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2e0b.dip0.t-ipconnect.de. [87.186.46.11])
        by smtp.gmail.com with ESMTPSA id k19-20020a1709061c1300b0098dd3981be9sm491456ejg.224.2023.06.23.23.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 23:03:26 -0700 (PDT)
Date: Sat, 24 Jun 2023 08:03:22 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 00/11] staging: rtl8192e: Remove timer function TsSetupTimeOut
Message-ID: <cover.1687583718.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove unchanged or unused variables and code.

Tested with rtl8192e (WLL6130-D99) in Modes b, g, n (12.5 MB/s)
Transferred this patch over wlan connection of rtl8192e.

Philipp Hortmann (11):
  staging: rtl8192e: Remove unused timer SetupTimer
  staging: rtl8192e: Remove equation of local variable InactTime of
    AdmitTS
  staging: rtl8192e: Remove unused timer InactTimer
  staging: rtl8192e: Remove empty function AdmitTS
  staging: rtl8192e: Remove variable modulation as it is constant
  staging: rtl8192e: Remove variable host_encrypt as it is constant
  staging: rtl8192e: Remove variable host_decrypt as it is constant
  staging: rtl8192e: Remove variable card_type
  staging: rtl8192e: Remove variable bdisable_nic
  staging: rtl8192e: Remove variable priv->reg_chnl_plan
  staging: rtl8192e: Remove variable ieee->short_slot

 .../staging/rtl8192e/rtl8192e/r8192E_dev.c    |   5 +-
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c  |  20 ---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h  |   8 -
 drivers/staging/rtl8192e/rtl819x_TS.h         |   2 -
 drivers/staging/rtl8192e/rtl819x_TSProc.c     |  35 -----
 drivers/staging/rtl8192e/rtllib.h             |   6 -
 drivers/staging/rtl8192e/rtllib_module.c      |   3 -
 drivers/staging/rtl8192e/rtllib_rx.c          |  44 +++---
 drivers/staging/rtl8192e/rtllib_softmac.c     | 143 +++++++-----------
 drivers/staging/rtl8192e/rtllib_softmac_wx.c  |   4 +-
 drivers/staging/rtl8192e/rtllib_tx.c          |   3 +-
 11 files changed, 80 insertions(+), 193 deletions(-)

-- 
2.41.0

