Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380981851
	for <linux-staging@lists.linux.dev>; Sat,  9 Sep 2023 18:19:26 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-3fe4f3b5f25so8896335e9.0
        for <linux-staging@lists.linux.dev>; Sat, 09 Sep 2023 11:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694283565; x=1694888365; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nmrZVxHXaLRpMM6rOmTmq9YaL32Ts5BcYnXcNL+bdlw=;
        b=o0TJ9wbkUAu+1yxW7TnuSwMPusMzrYv9n779sAHX6d5g6rRFu62VRnefTHxOBAJwd/
         Aenchp4/k7pbTw+YU619T460r4HIbmdyb0xZrUKLbARR1zo7uv+kNYF+LY/Qira8929m
         4CqsZaxVD1wveV7ZLft3NCyeMK7Kht+wRu7QqxCWDqGyIqaSrOaI49AMoMtZAb++Kbv4
         PhsHu9G9yLlxrCluSNWROef2lH0Rs06EAMZQGBV566XdULhBQSkBdsyEQk6xtssrbfNj
         +ntPXCyCMSPlMA3yBqmzwy3/4D7wgMMAKWrZzsl8in/+UukEvdmLe8VN1Zq54+qqBSkk
         Sx5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694283565; x=1694888365;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nmrZVxHXaLRpMM6rOmTmq9YaL32Ts5BcYnXcNL+bdlw=;
        b=DXhmVlRv4R22JDrISaTExYZcINMvp7DI1f8pJyIhraCv4oYNNxX8BpSGlASz4VZD/e
         DcpHA3kpQG/cBVuzCnOVvAorJ9DZXi58RVXwWav6uU1DXjtV9INfqku9LP7sOkz0CD5P
         PsINoZEfxFQHmpX8WXMqv5RAVPuiJobiZdBfaxqifb07+NDFB5jXNSpXoQKsAmOXO91S
         TOd9zSredumu3jQuLdIbjkJ0BP3ulQXq1Anr4NrSVkBEplkuFzvdEcgPUv9ywDIf/PQS
         CRkfs+XACPTXAoTpFjFYxnXQ2fWRjAGfyfqLcfsnNK4cqqqzmqnzQZx+FH5L627wJKVY
         Sarw==
X-Gm-Message-State: AOJu0YzYIewE1JNZHREb++xeJOh1sEp6DfwxP3MxgELblqOB8JZBewvN
	IeJUPtzbNhsGiD3mRnGSpAQ=
X-Google-Smtp-Source: AGHT+IEMPxyBRvmMm4R+LH9p4X8d910dR48P0wuk8KscvWNtiGlushElfB2n7Jpi9n0RLEG9ZrUW5g==
X-Received: by 2002:a05:600c:1d0a:b0:401:c6a2:3cd5 with SMTP id l10-20020a05600c1d0a00b00401c6a23cd5mr4915477wms.2.1694283564957;
        Sat, 09 Sep 2023 11:19:24 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id r14-20020adfdc8e000000b003196b1bb528sm5397229wrj.64.2023.09.09.11.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Sep 2023 11:19:24 -0700 (PDT)
Date: Sat, 9 Sep 2023 20:19:23 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 0/8] staging: rtl8192e: Use standard functions like
 ieee80211_is_beacon()
Message-ID: <cover.1694282907.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove useless equation in debug output.
Use standard functions like ieee80211_is_beacon().
Optimize code for improved readability.

Tested with rtl8192e (WLL6130-D99) in Mode n (12.5 MB/s)
Transferred this patch over wlan connection of rtl8192e.

Philipp Hortmann (8):
  staging: rtl8192e: Remove useless equation in debug output
  staging: rtl8192e: Use standard ieee80211 function in rtllib_rx_mgt()
  staging: rtl8192e: Use standard function in
    rtllib_process_probe_response()
  staging: rtl8192e: Use standard function in
    rtllib_rx_check_duplicate()
  staging: rtl8192e: Use standard function in softmac_mgmt_xmit()
  staging: rtl8192e: Replace rtl92e_disable_irq with rtl92e_irq_disable
  staging: rtl8192e: Replace rtl92e_enable_irq with rtl92e_irq_enable
  staging: rtl8192e: Remove rtllib_get_payload()

 .../staging/rtl8192e/rtl8192e/r8192E_dev.c    |  6 +--
 .../staging/rtl8192e/rtl8192e/r8192E_dev.h    |  2 -
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c  | 18 -------
 drivers/staging/rtl8192e/rtllib.h             | 24 ---------
 drivers/staging/rtl8192e/rtllib_rx.c          | 54 ++++++-------------
 drivers/staging/rtl8192e/rtllib_softmac.c     | 11 +---
 6 files changed, 22 insertions(+), 93 deletions(-)

-- 
2.41.0

