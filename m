Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BB95F
	for <linux-staging@lists.linux.dev>; Mon,  5 Apr 2021 16:50:11 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id t5-20020a1c77050000b029010e62cea9deso5921783wmi.0
        for <linux-staging@lists.linux.dev>; Mon, 05 Apr 2021 09:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gPfTaF4f61niwOGxXWsD+hVfFZNowGCSAbAq2kTY6aM=;
        b=Wqe3zo9iBWtoAOeNGdjAM+RAT4M8svsQoneMnXc7wv7EkKstiyMLs2ylnQaANp4XOR
         hZo//KKRRzwSJKeP3LB4Cw2gyqIdowXt8HgrTrBEs0ORRCNwiDLH0B5Veqe9gyScLFg9
         nYNsHHbue/5OHq2/Puzjja7ni0JHg/zI+3uou+YcrLfVSJX0ZAafbaolME0PnMyLRL5Z
         RPPK6y+zHzSsmQfTM2I2ZzQZfPgO+SmWAzrvL1acAtSDnHHsNWEq+5eNojn4Yr0uS5v0
         NfJ3ShZY1TCC6F3ZitGtmbUyL42bEBGnB+JbsfG24c4799Xg/qV9WP5+BtcuNYriIVso
         zmFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gPfTaF4f61niwOGxXWsD+hVfFZNowGCSAbAq2kTY6aM=;
        b=isG85O/lfm0ZMWFCortbNXCllW1E06C9h8eV4hoXXRStPUnjrgICpVctqmLHNVfUtt
         306WOOnbHxtzXSwJJs9rds/BMSaliHqGXR6dJS83DQV5ICuoUzLqpC5rEKUuj//xjZ1E
         dTpsE20hFt1CpbUQiHjQ7BVilqXtl3VE6yHGWAJoeMjnqot7bzyhvg8GdxTdOkAMH26m
         wa68eyXL+hGlLyvIoHDonymLHXCXcDoA4IKoZ74461dnsancHeYEqP73y33+Fjj3gJrs
         OqIWLGlR3vsLDoiN0/VZhgeo8/ofR+G2o2qMzjxPSU6DBObhoMdci2Dq+inRzaLbhPDC
         p3oA==
X-Gm-Message-State: AOAM533gVuYaid89b6tC128OTrsdN0NxDdp1PHb6QRJ/o9Z69QIUTPdt
	H7xr94SgHUZCCgR0JgDnNFs=
X-Google-Smtp-Source: ABdhPJx/V1BFwD23If6cf9JbGSYqTBNZsLBzujn0wMhcwfZW2n9WEbB0phfQ7dxx1xMswoisYA/BKg==
X-Received: by 2002:a05:600c:4103:: with SMTP id j3mr21010wmi.175.1617641410079;
        Mon, 05 Apr 2021 09:50:10 -0700 (PDT)
Received: from agape ([5.171.72.58])
        by smtp.gmail.com with ESMTPSA id 187sm1369311wma.0.2021.04.05.09.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 09:50:09 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 00/10] staging: rtl8723bs: completely remove RT_TRACE logs
Date: Mon,  5 Apr 2021 18:49:47 +0200
Message-Id: <cover.1617640221.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset removes all RT_TRACE usages left and definitions

The whole private tracing system is not tied to a configuration
symbol and the default behaviour is _trace nothing_. It's verbose
and relies on a private log level tracing doomed to be
removed.

The patchset consist on a first patch applying the following
semantic patch on rtl8723bs directory:

$ cat RT_TRACE.cocci
@@
expression a, b, c;
@@

-       RT_TRACE(a, b, (c));

Then follows a patch removing commented out RT_TRACE calls.
Third patch removes RT_TRACE definitions.

All other patches, do some code cleaning on sites left blank
by RT_TRACE removal.

This scheme was suggested by Joe Perches.

https://lore.kernel.org/linux-staging/1cd79d781cdcccf621ce8e104a9cdf1e90e7f803.camel@perches.com/

Fabio Aiuto (10):
  staging: rtl8723bs: remove all RT_TRACE logs in hal/ and os_dep/
  staging: rtl8723bs: remove commented out RT_TRACE logs in hal/ and
    os_dep/
  staging: rtl8723bs: remove RT_TRACE log definitions
  staging: rtl8723bs: remove empty if, else blocks after RT_TRACE
    deletion
  staging: rtl8723bs: remove empty #ifdef blocks after RT_TRACE deletion
  staging: rtl8723bs: remove unnecessary bracks after RT_TRACE deletion
  staging: rtl8723bs: place constant on the right side of the test
  staging: rtl8723bs: rewrite comparisons to null
  staging: rtl8723bs: remove empty for cycles
  staging: rtl8723bs: remove commented code block

 .../staging/rtl8723bs/hal/HalPhyRf_8723B.c    |   3 -
 drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.c  |  46 ------
 .../staging/rtl8723bs/hal/hal_com_phycfg.c    |  20 ---
 drivers/staging/rtl8723bs/hal/hal_intf.c      |   2 -
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 131 +-----------------
 .../staging/rtl8723bs/hal/rtl8723b_phycfg.c   |  33 -----
 .../staging/rtl8723bs/hal/rtl8723b_rf6052.c   |   2 -
 .../staging/rtl8723bs/hal/rtl8723bs_recv.c    |   5 +-
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    |  41 +-----
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  |  49 +------
 drivers/staging/rtl8723bs/hal/sdio_ops.c      |  35 +----
 drivers/staging/rtl8723bs/include/rtw_debug.h |  18 ---
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c |   6 -
 .../staging/rtl8723bs/os_dep/ioctl_linux.c    |  69 +--------
 drivers/staging/rtl8723bs/os_dep/mlme_linux.c |   4 -
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   |  52 +------
 .../staging/rtl8723bs/os_dep/osdep_service.c  |   4 +-
 drivers/staging/rtl8723bs/os_dep/recv_linux.c |  12 +-
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c  |  28 +---
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c |   5 -
 20 files changed, 24 insertions(+), 541 deletions(-)

-- 
2.20.1

