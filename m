Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2ECC70
	for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 14:20:41 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id w23so9782059edx.7
        for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 07:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VnVAs9S/fAMLk5Dt98uPXMFZSkDV368cEFeZ4fHEM3U=;
        b=mfLlFm5nlRvh5A7RB4B/XPr5PEQ1v6SLW2lXm6UvMdBgPtXEMdCysF85acOGNlO7PC
         gEGt/MhbBlmQD7jDsbeLP4uRVi84eHThpMmGbRAHIA9lJsTaBBlyYoJOgmLOp+wrznWF
         Qql2NEtI97AEnwk0cjowHBFQ0BEclzcn5s3kyExBVTbFRmX69BjvxJ9x7uQYsQJ52KOQ
         AoXjTA96kTtnUV+0He22kP4HElq64xbxzMQmyXK3dk670oA95a3HjMl0MOv2TFszYCHx
         TyOyeQFNLLeXy5O/tVFJXqNLcxXt5Cgi0xftBWOsC7Phxi0Txi2ewR/e1jcFAHhii2kd
         1jEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VnVAs9S/fAMLk5Dt98uPXMFZSkDV368cEFeZ4fHEM3U=;
        b=JJsdKSOuFT/FopZf+S/Z50VMzRhRTaWqRmF36TBpDaOUGNVoyHyADrAYIytbfhwyxg
         3sJ56wg02kpub45U377jcyW6akX1Zfmw09nnVup52+cZnh9EL+wThinPa1P2NiALP67p
         y26PsjXbKgQKUykuUr+a7JmwsUOiVzAnY8HsOqXXylnXwoWDmQV7j8aQULh2GttK2m5Q
         EjLCpKAB9UTzsNbygOWagl6OjpTmVwMBpPitUsf3Sb6nSb7ef946JQKsbXzEQ9KQ4WIp
         VdZbTql1Vd1hybk9bAcQfj9deyCqf1fdkMinZTk5849MBMPuN+cI++1UxEekvOtDhb0F
         rEhw==
X-Gm-Message-State: AOAM533oTJQaG1PAFtsA4DPFL97IG5wfeozjlVQnJ0eWHoU95rQSkDcC
	A3DZwSFKy/KiVdIp1kF4No1svitUBC/LIA==
X-Google-Smtp-Source: ABdhPJyV8eNOc9Rt2W+POJcV98aeRx5aZaIngmY8S9UnYdU98Lj6bEEVXJJXWiQwR3ptzyGE1vOAbQ==
X-Received: by 2002:a05:6402:5205:: with SMTP id s5mr19022336edd.65.1618064440313;
        Sat, 10 Apr 2021 07:20:40 -0700 (PDT)
Received: from agape ([5.171.81.28])
        by smtp.gmail.com with ESMTPSA id b21sm2740100ejz.123.2021.04.10.07.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 07:20:40 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 00/25] staging: rtl8723bs: remove DBG_8192C tracing macro
Date: Sat, 10 Apr 2021 16:20:13 +0200
Message-Id: <cover.1618064274.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset remove from rtl8723bs driver the tracing macro
DBG_8192C.

This macro belongs to a verbose private tracing family,
which by default is set to _do nothing_. The only way
to activate the tracing is to manually define a symbol
in code.

First patch applies the following semantic patch:

@@
expression a, b, c, d, e, f, g, h, i, j, k;
constant B, C, D, E;
@@

(
-	DBG_8192C(a);
|
-	DBG_8192C(a, b);
|
-	DBG_8192C(a, B);
|
-	DBG_8192C(a, b, c);
|
-	DBG_8192C(a, B, c);
|
-	DBG_8192C(a, b, C);
|
-	DBG_8192C(a, B, C);
|
-	DBG_8192C(a, b, c, d);
|
-	DBG_8192C(a, B, c, d);
|
-	DBG_8192C(a, b, C, d);
|
-	DBG_8192C(a, b, c, D);
|
-	DBG_8192C(a, B, C, d);
|
-	DBG_8192C(a, B, c, D);
|
-	DBG_8192C(a, b, C, D);
|
-	DBG_8192C(a, B, C, D);
|
-	DBG_8192C(a, b, c, d, e);
|
-	DBG_8192C(a, B, c, d, e);
|
-	DBG_8192C(a, b, C, d, e);
|
-	DBG_8192C(a, b, c, D, e);
|
-	DBG_8192C(a, b, c, d, E);
|
-	DBG_8192C(a, B, C, d, e);
|
-	DBG_8192C(a, B, c, D, e);
|
-	DBG_8192C(a, B, c, d, E);
|
-	DBG_8192C(a, b, C, D, e);
|
-	DBG_8192C(a, b, C, d, E);
|
-	DBG_8192C(a, b, c, D, E);
|
-	DBG_8192C(a, B, C, D, e);
|
-	DBG_8192C(a, B, C, d, E);
|
-	DBG_8192C(a, B, c, D, E);
|
-	DBG_8192C(a, b, C, D, E);
|
-	DBG_8192C(a, B, C, D, E);
|
-	DBG_8192C(a, b, c, d, e, f);
|
-	DBG_8192C(a, b, c, d, e, f, g);
|
-	DBG_8192C(a, b, c, d, e, f, g, h);
|
-	DBG_8192C(a, b, c, d, e, f, g, h, i);
|
-	DBG_8192C(a, b, c, d, e, f, g, h, i, j);
|
-	DBG_8192C(a, b, c, d, e, f, g, h, i, j, k);
)

Second patch removes all commented out call of macro.

Third patch removes macro definitions.

All subsequent patches do some code cleaning in all places
left empty by deleted macro, such as empty #ifdef blocks,
conditional code blocks guarded by never defined symbols
if-else blocks, for cycles, commented debug symbol definitions,
unnecessary parentheses and some other checkpatch issues.

Fabio Aiuto (25):
  staging: rtl8723bs: remove all DBG_8192C logs
  staging: rtl8723bs: remove all commented out DBG_8192C logs
  staging: rtl8723bs: remove DBG_8192C macro definitions
  staging: rtl8723bs: remove all if-blocks left empty by
    DBG_8192C-remove coccinelle script
  staging: rtl8723bs: put spaces around operators
  staging: rtl8723bs: remove unused code blocks guarded by DEBUG_RTL871X
  staging: rtl8723bs: remove commented out DEBUG_RTL871X definition
  staging: rtl8723bs: remove code blocks guarded by DEBUG symbol
  staging: rtl8723bs: remove empty code block guarded by DBG_CCX
  staging: rtl8723bs: remove code block guarded by undefined
    SDIO_DEBUG_IO
  staging: rtl8723bs: remove commented out SDIO_DEBUG_IO symbol
    definition
  staging: rtl8723bs: remove empty ifdef blocks conditioned to
    DEBUG_CFG80211 definition
  staging: rtl8723bs: remove commented out DEBUG_CFG80211 symbol
    definition
  staging: rtl8723bs: remove unnecessary bracks
  staging: rtl8723bs: fix comparison to null
  staging: rtl8723bs: put spaces around operators
  staging: rtl8723bs: split long line
  staging: rtl8723bs: put constant on the right side of the test
  staging: rtl8723bs: remove empty if and else blocks
  staging: rtl8723bs: put constant on the right side of a test in
    os_dep/ioctl_cfg80211.c
  staging: rtl8723bs: remove unnecessary parentheses in
    os_dep/ioctl_cfg80211.c
  staging: rtl8723bs: remove empty else block in os_dep/ioctl_cfg80211.c
  staging: rtl8723bs: fix comparison to true issue
  staging: rtl8723bs: remove more unnecessary parentheses
  staging: rtl8723bs: remove more empty if blocks after DBG_8192C
    deletion

 drivers/staging/rtl8723bs/core/rtw_debug.c    |  35 ---
 .../staging/rtl8723bs/core/rtw_ieee80211.c    |   1 -
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  21 --
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  |   7 -
 .../staging/rtl8723bs/core/rtw_wlan_util.c    |   3 -
 drivers/staging/rtl8723bs/core/rtw_xmit.c     |   7 +-
 drivers/staging/rtl8723bs/hal/hal_com.c       |  10 +-
 drivers/staging/rtl8723bs/hal/odm.c           |   1 -
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c  |  48 +---
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 263 +++---------------
 .../staging/rtl8723bs/hal/rtl8723b_phycfg.c   |   2 -
 .../staging/rtl8723bs/hal/rtl8723b_rxdesc.c   |   3 -
 .../staging/rtl8723bs/hal/rtl8723bs_recv.c    |  15 +-
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  |  19 +-
 drivers/staging/rtl8723bs/hal/sdio_ops.c      |  39 +--
 drivers/staging/rtl8723bs/include/autoconf.h  |   7 -
 drivers/staging/rtl8723bs/include/rtw_debug.h |  10 -
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 216 +-------------
 .../staging/rtl8723bs/os_dep/ioctl_linux.c    |   6 -
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c  |  35 +--
 20 files changed, 69 insertions(+), 679 deletions(-)

-- 
2.20.1

