Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA9E2F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:44:04 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id gx5so11745793ejb.11
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 00:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LVubrsY2JZC5Vs7OTrJ5CTDcb8Ckyj/Ri95jZiKVPiI=;
        b=GYzq8BCFMMbX2PRdEkOp8fnW9BPieaHNg0p+ihboIXi2qykzA7/DXnia4d0Rvbi+Cl
         nOeKdD6N8SFTslmfeApTjveOOscrhMT7RcXurw2Kd9qXVy4k2BJAiwPk7oUZXVM+b5RV
         HKfOW3ZUkSvU3nCcAZzbogrtZ0DindeQFM0BStvTkwgRj/o6cZ76tvjFe+0MbENmYsP4
         Pc28yMJAQZ5IsXCUqETqDl76Oly1PmLFKtXPGbTVaiW0qUUsxSuzemnYQl9ZzcWGc17X
         s+Byeoi0226lIcPQrFeip4gPKDyJQHG6iME0RUVCmXqfoRFYnQbp80yYx+R+9G+KeA3m
         pO3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LVubrsY2JZC5Vs7OTrJ5CTDcb8Ckyj/Ri95jZiKVPiI=;
        b=IU6QRnzYRGOh7FOadnMXaB57MdueFGKoZPMq2VbV2zA7SsAfCFnxdAVVgYHKNs2aM4
         b0BRdAiRCBv94alOK7+y6VFYGPpPWA+Sn1Yr6XPCxvFADFP6SfP32RhAYin9BG2K6ucZ
         3X8XnTLqR33IHLFhz50G52Di3JpSdEvLKOIXOpJHWv5ofZ20TO0Tr+siYoNwyrdXH3UA
         Ay1O4yaI5vBFwjnqGJlEeyyVoVdMqqfqd8wMnGnKQoBnpj82hM4DjmUkO7cOu/w8rL4e
         pAdY9WumKF5WbHC/YAwDzm31Fp9ZE4q+CE9pj9g5990GggHmn0hfNYDmVtI0An2LGszq
         s3GA==
X-Gm-Message-State: AOAM531EvjRYviJ7o4yfN+g0t9i7sJsEiDdVtr8Vu38pTduPgAJ1UltS
	qSoWTqnxG0GQlqSSMEL0zGA=
X-Google-Smtp-Source: ABdhPJwNTuCEhkyp+D8n9Y9GQoJFdf7fsNtdgI/ZNFO6gIRscAoBTqJHzTEbyIA56ehYKDnHjGshJA==
X-Received: by 2002:a17:906:858:: with SMTP id f24mr2852697ejd.347.1619768643432;
        Fri, 30 Apr 2021 00:44:03 -0700 (PDT)
Received: from agape ([5.171.81.86])
        by smtp.gmail.com with ESMTPSA id c25sm651944edt.43.2021.04.30.00.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 00:44:02 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 00/43] staging: rtl8723bs: clean up driver from private debug facilities
Date: Fri, 30 Apr 2021 09:43:18 +0200
Message-Id: <cover.1619768150.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset remove all private debug facilities.
It removes unused macros and _do nothing_ ones (i.e. macros
whose behaviour is activated by manual code update).
Replace tracing macros wrapping raw printk calls by
netdev_dbg() calls which is best suited for a network
driver.

Remove all unused macros and function definition tied to
the whole private tracing facility.

Fabio Aiuto (43):
  staging: rtl8723bs: remove ODM_RT_TRACE logs
  staging: rlt8723bs: remove if-else blocks left empty by ODM_RT_TRACE
    deletion
  staging: rtl8723bs: remove empty functions
  staging: rtl8723bs: remove empty .c source file
  staging: rtl8723bs: remove undefined function prototypes
  staging: rtl8723bs: remove empty header file
  staging: rtl8723bs: remove ODM_RT_TRACE* unused macro defs
  staging: rtl8723bs: remove all commented out ODM_RT_TRACE logs
  staging: rtl8723bs: replace ODM_RT_ASSERT with netdev_dbg()
  staging: rtl8723bs: remove unused ODM_RT_ASSERT macro
  staging: rtl8723bs: remove unused ODM_PRINT_ADDR macro
  staging: rtl8723bs: remove unused ODM_dbg_trace macro
  staging: rtl8723bs: remove unused ODM_dbg_enter
  staging: rtl8723bs: remove unused ODM_dbg_exit macro
  staging: rtl8723bs: remove empty ifdef block
  staging: rtl8723bs: remove unused ASSERT macro
  staging: rtl8723bs: remove empty #ifndef block
  staging: rtl8723bs: remove commented out RT_ASSERT occurrences
  staging: rtl8723bs: remove unused RT_PRINTK macro
  staging: rtl8723bs: remove BTC_PRINT logs
  staging: rtl8723bs: remove empty if-else blocks after BTC_PRINT
    removal
  staging: rtl8723bs: remove braces around single statement in if block
  staging: rtl8723bs: remove commented out BTC_PRINT logs
  staging: rtl8723bs: remove BTC_PRINT macro definitions
  staging: rtl8723bs: remove BTC_PRINT_ADDR macro definitions
  staging: rtl8723bs: remove BTC_PRINT_DATA definitions
  staging: rtl8723bs: remove BTC_PRINT_F macro definition
  staging: rtl8723bs: remove empty #ifdef block
  staging: rtl8723bs: remove unsed hal_btcoex_SetDBG() function
  staging: rtl8723bs: remove hal_btcoex_GetDBG() function
  staging: rtl8723bs: remove unnecessary halbtcoutsrc_DbgInit() function
  staging: rtl8723bs: remove obsolete GLBtcDbgType array declarations
  staging: rtl8723bs: remove unused enum
  staging: rtl8723bs: remove obsolete debug macros
  staging: rtl8723bs: remove commented out DbgPrint logs
  staging: rtl8723bs: remove unused DbgPrint macro
  staging: rtl8723bs: remove commented out *RT_DISP logs
  staging: rtl8723bs: remove RT_DISP macro definition
  staging: rtl8723bs: remove ODM_InitDebugSetting() function
  staging: rtl8723bs: remove empty file
  staging: rtl8723bs: remove member in dm_odm_t struct
  staging: rtl8723bs: remove DebugLevel member in dm_odm_t struct
  staging: rtl8723bs: remove odm_debug.h header file

 drivers/staging/rtl8723bs/core/rtw_efuse.c    |   1 -
 drivers/staging/rtl8723bs/core/rtw_recv.c     |  22 -
 .../staging/rtl8723bs/hal/HalBtc8723b1Ant.c   | 604 +-----------------
 .../staging/rtl8723bs/hal/HalBtc8723b2Ant.c   | 502 +--------------
 drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h  |  67 --
 .../staging/rtl8723bs/hal/HalHWImg8723B_BB.c  |  62 --
 .../staging/rtl8723bs/hal/HalHWImg8723B_MAC.c |  49 --
 .../staging/rtl8723bs/hal/HalHWImg8723B_RF.c  |  63 --
 drivers/staging/rtl8723bs/hal/HalPhyRf.c      | 332 ----------
 .../staging/rtl8723bs/hal/HalPhyRf_8723B.c    | 177 +----
 drivers/staging/rtl8723bs/hal/hal_btcoex.c    | 171 -----
 drivers/staging/rtl8723bs/hal/hal_com.c       |  14 -
 drivers/staging/rtl8723bs/hal/odm.c           |  53 +-
 drivers/staging/rtl8723bs/hal/odm.h           |   4 -
 .../staging/rtl8723bs/hal/odm_CfoTracking.c   | 107 ----
 drivers/staging/rtl8723bs/hal/odm_DIG.c       | 320 ----------
 .../rtl8723bs/hal/odm_EdcaTurboCheck.c        |  18 -
 drivers/staging/rtl8723bs/hal/odm_HWConfig.c  |  38 --
 .../staging/rtl8723bs/hal/odm_NoiseMonitor.c  |  27 -
 drivers/staging/rtl8723bs/hal/odm_PathDiv.c   |  34 -
 drivers/staging/rtl8723bs/hal/odm_PathDiv.h   |  21 -
 drivers/staging/rtl8723bs/hal/odm_RTL8723B.c  |   1 -
 .../rtl8723bs/hal/odm_RegConfig8723B.c        |  66 --
 drivers/staging/rtl8723bs/hal/odm_debug.c     |  44 --
 drivers/staging/rtl8723bs/hal/odm_debug.h     | 165 -----
 drivers/staging/rtl8723bs/hal/odm_precomp.h   |   2 -
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c |   3 -
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  |   7 -
 .../staging/rtl8723bs/include/hal_btcoex.h    |   2 -
 29 files changed, 6 insertions(+), 2970 deletions(-)
 delete mode 100644 drivers/staging/rtl8723bs/hal/odm_PathDiv.c
 delete mode 100644 drivers/staging/rtl8723bs/hal/odm_PathDiv.h
 delete mode 100644 drivers/staging/rtl8723bs/hal/odm_debug.c
 delete mode 100644 drivers/staging/rtl8723bs/hal/odm_debug.h

-- 
2.20.1

