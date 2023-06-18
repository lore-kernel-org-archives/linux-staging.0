Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EAF9184C
	for <linux-staging@lists.linux.dev>; Sun, 18 Jun 2023 13:03:10 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6686c74183cso879643b3a.1
        for <linux-staging@lists.linux.dev>; Sun, 18 Jun 2023 06:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687093390; x=1689685390;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z+3L0ggJSfWU7Zuqsbvu6xk0bd4fTGwDV0IPuzKiTyQ=;
        b=Azw0dRnsLrFwP4gVr4y9n+Yg7DuW/gctTRllmlendUKySevHv2a/ZO0ik9ygWV+AdE
         2Fjtsbb7RvxCB0XZI+LgW9p6Oi5X54ClLosqQaRIxO4eHoz+nCDtL4WSVV1xaRkj/Tqe
         0oysrWpvd5/69PqrMbL0JAxcH/xW1S/O3pZSQqPXNjjxHZjGxaBun671IVaSShlxw+0s
         IWz16xDcTMvcRr3T/bcQfbtncS08I3A1xqviCFHX3+n7WUbG/I7WejP+UtZ/2vMQCtBD
         PaUESH4cwO8eqkaFih2Pfc7eNW6+kCxj+XTMVPzfbhefyXqYTPz0Jl1LHR3MPEIICFrl
         taXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687093390; x=1689685390;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z+3L0ggJSfWU7Zuqsbvu6xk0bd4fTGwDV0IPuzKiTyQ=;
        b=Kxmt3LAS+lbojfztvb37A4zmiU0qMbMwAS12pEv9e6LeE9x2v5Tjn8bIGX+YOwvgIU
         JH1S8wghwR/DBn8l5nF3dPOt9vhREwnRJ6kbyR9AJGFBIQskwG07RMGP7Mzgmwa194PE
         dKEC2/I7LFz8qLONhDJ/cWRLrm8lEV6M8iOxWJ1yB3z+nfO9FC2qpaHX+ZpxT2pxGDKP
         C620cVhpNnIaunN/K/r4VkNVMGWQp8klyZuDbXsm3kk05LzM6KgbQTw13sTal0B5yZtj
         2gh1lQusfH6iAslr22Nh/2oUvm0o3x/tajFXpooAy4KswKv8PBddudL9W0EpOws4cjVC
         5jhg==
X-Gm-Message-State: AC+VfDy+q/35kOyygwUuYrp01WYmaJkzepIQFHeEiRxytieetivcZhs3
	N3FmLa/DFtkc4g5xKVkQMCc=
X-Google-Smtp-Source: ACHHUZ5PjksCNEFS21LbW7ZuJxv1PpDu7JK/ObVYUqOBKaf4J8GApVfQj7aqK3IM4tdHcguY+XlVAg==
X-Received: by 2002:a05:6a00:1891:b0:666:b0fb:fa8c with SMTP id x17-20020a056a00189100b00666b0fbfa8cmr11485609pfh.3.1687093390292;
        Sun, 18 Jun 2023 06:03:10 -0700 (PDT)
Received: from zephyrusG14 ([103.251.210.211])
        by smtp.gmail.com with ESMTPSA id r3-20020a635d03000000b005533dcb7586sm3241005pgb.20.2023.06.18.06.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jun 2023 06:03:09 -0700 (PDT)
Date: Sun, 18 Jun 2023 18:33:04 +0530
From: Yogesh Hegde <yogi.kernel@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: dan.carpenter@linaro.org, philipp.g.hortmann@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org, ivan.orlov0322@gmail.com
Subject: [PATCH v3 0/4] Trivial code cleanup patches
Message-ID: <cover.1687092111.git.yogi.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Rename variables in struct rtllib_device to avoid CamelCase which is not
accepted by checkpatch.

---
v3: The driver is split into 2 modules, calling the functions directly which 
    the v2 of the patchset does breaks compile. So reverting back to v1 of 
    the patch as suggested by Greg Kroah-Hartman <gregkh@linuxfoundation.org>.

v2: Removed the variable and called the function directly instead of
    just renaming the variable as suggested by Greg Kroah-Hartman
    <gregkh@linuxfoundation.org>.



Yogesh Hegde (4):
  staging: rtl8192e: Rename variable SetWirelessMode
  staging: rtl8192e: Rename variable SetBWModeHandler
  staging: rtl8192e: Rename variable LeisurePSLeave
  staging: rtl8192e: Rename variable InitialGainHandler

 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c |  4 ++--
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c   |  8 ++++----
 drivers/staging/rtl8192e/rtl819x_HTProc.c      |  4 ++--
 drivers/staging/rtl8192e/rtllib.h              | 12 ++++++------
 drivers/staging/rtl8192e/rtllib_rx.c           |  2 +-
 drivers/staging/rtl8192e/rtllib_softmac.c      | 12 ++++++------
 drivers/staging/rtl8192e/rtllib_softmac_wx.c   |  6 +++---
 7 files changed, 24 insertions(+), 24 deletions(-)

-- 
2.34.1

