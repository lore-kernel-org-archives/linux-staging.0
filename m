Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677A870
	for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 09:09:42 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id z2so4889750wrl.5
        for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 02:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dPx/c0ydaxSoxh2qhVeeOV7T8MUpGTDXHROZKiangpM=;
        b=NcyP0hZT2CcXLbHgN46/9/O9NnHsBUFgdB3WnyR0KW+QQbULKaY8QYRUf7cqX6Gweu
         jN0/ck89iZ5/nnu7mZNwV17Imw5+V0SfhqXJmYIoPQ5LoH1w1+pIvQWZoFZMFYwJv4i2
         Jr3vkGhTagZG3Lnp/h4717aQvLgXE6e4rwYpHd+3GjMIJQF9sGow7T4R9AvUahPrp0Xm
         5VKPwuRB1fx8NJU0mRDCu/L72MhJyLw4d0LJrEDH0d/PbRwMMWKUp2Pj51j4hIR3YoHt
         ucVkJH4mj40wyD/z0FvLAWbyvSIo2+SILus6Yl4jXsVcnCG+zB5K6P2xORqjTODn9xDv
         oR5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dPx/c0ydaxSoxh2qhVeeOV7T8MUpGTDXHROZKiangpM=;
        b=YmlCWKoTv/Lgx8OT3Lutjm84eFxs8eJKunidikMZn6m+Rj3BtGYwbGukRETvd7IxNX
         3td8yIBNRZdz1ya0blUBY8wx8+Isv/lvi6UzKm0Y/r7w3u+PzUKdXlbFmBlHAAiLBV3f
         s3MeGY4N7nVwpvL8hkSho8MPQ404WVyiKVn45gw6FyHNd7El+9UmPbjciz733RwfEMHs
         WsYp8wJzQElx29m5aldqxgA5Mps4AT7Jl3WFAmTgLSE+v2JntlOynz7+3itGQOLQlz8T
         4oGlIEL48ano3o1rw9SAfGzYKxGDXChFNz/ao+TEZICs4biwT40FIZaTQL8+4xkCZ40Z
         Ka5w==
X-Gm-Message-State: AOAM53142DM7CirfBLd4RjCQCgQCXua0D2EUuXhX1HzmrM8gBcy7rwWs
	pG/8TBjU+3VxX/Lm+v8rfms=
X-Google-Smtp-Source: ABdhPJzIvJxaaxzuKRzqShsH/6a2v7DXRveguHHdvcI4AJwJZK4ZvlyYnV9ubHxhlmo1RG70UFIekg==
X-Received: by 2002:a5d:570c:: with SMTP id a12mr13438377wrv.209.1616749780949;
        Fri, 26 Mar 2021 02:09:40 -0700 (PDT)
Received: from agape ([5.171.81.75])
        by smtp.gmail.com with ESMTPSA id h62sm12238035wmf.37.2021.03.26.02.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 02:09:40 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 00/15] staging: rtl8723bs: fix checkpatch errors on macros
Date: Fri, 26 Mar 2021 10:09:07 +0100
Message-Id: <cover.1616748885.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix all checkpatch errors on macros but the following:

ERROR: Macros with complex values should be enclosed in parentheses
#41: FILE: drivers/staging/rtl8723bs/include/hal_pwr_seq.h:41:
+#define RTL8723B_TRANS_CARDEMU_TO_ACT														\
--
ERROR: Macros with complex values should be enclosed in parentheses
#67: FILE: drivers/staging/rtl8723bs/include/hal_pwr_seq.h:67:
+#define RTL8723B_TRANS_ACT_TO_CARDEMU													\
--
ERROR: Macros with complex values should be enclosed in parentheses
#80: FILE: drivers/staging/rtl8723bs/include/hal_pwr_seq.h:80:
+#define RTL8723B_TRANS_CARDEMU_TO_SUS													\
--
ERROR: Macros with complex values should be enclosed in parentheses
#91: FILE: drivers/staging/rtl8723bs/include/hal_pwr_seq.h:91:
+#define RTL8723B_TRANS_SUS_TO_CARDEMU													\
--
ERROR: Macros with complex values should be enclosed in parentheses
#100: FILE: drivers/staging/rtl8723bs/include/hal_pwr_seq.h:100:
+#define RTL8723B_TRANS_CARDEMU_TO_CARDDIS													\
--
ERROR: Macros with complex values should be enclosed in parentheses
#111: FILE: drivers/staging/rtl8723bs/include/hal_pwr_seq.h:111:
+#define RTL8723B_TRANS_CARDDIS_TO_CARDEMU													\
--
ERROR: Macros with complex values should be enclosed in parentheses
#123: FILE: drivers/staging/rtl8723bs/include/hal_pwr_seq.h:123:
+#define RTL8723B_TRANS_CARDEMU_TO_PDN												\
--
ERROR: Macros with complex values should be enclosed in parentheses
#136: FILE: drivers/staging/rtl8723bs/include/hal_pwr_seq.h:136:
+#define RTL8723B_TRANS_ACT_TO_LPS														\
--
ERROR: Macros with complex values should be enclosed in parentheses
#154: FILE: drivers/staging/rtl8723bs/include/hal_pwr_seq.h:154:
+#define RTL8723B_TRANS_LPS_TO_ACT															\
--
ERROR: Macros with complex values should be enclosed in parentheses
#170: FILE: drivers/staging/rtl8723bs/include/hal_pwr_seq.h:170:
+ #define RTL8723B_TRANS_ACT_TO_SWLPS														\
--
ERROR: Macros with complex values should be enclosed in parentheses
#197: FILE: drivers/staging/rtl8723bs/include/hal_pwr_seq.h:197:
+#define RTL8723B_TRANS_SWLPS_TO_ACT															\
--

I counld't put braces for they are meant to be expanded inside an 
array definition

ERROR: Macros with complex values should be enclosed in parentheses
#108: FILE: drivers/staging/rtl8723bs/include/osdep_service_linux.h:108:
+#define FUNC_NDEV_ARG(ndev) __func__, ndev->name
--
ERROR: Macros with complex values should be enclosed in parentheses
#110: FILE: drivers/staging/rtl8723bs/include/osdep_service_linux.h:110:
+#define FUNC_ADPT_ARG(adapter) __func__, adapter->pnetdev->nam

All those macros are not used to generate expressions but arguments of
a functions.

If someone knows how to silence those errors as well,
please tell me.

Fabio Aiuto (15):
  staging: rtl8723bs: inlcude macros in a do..while loop in
    core/rtw_security.c
  staging: rtl8723bs: put parentheses on macros with complex values in
    hal/HalBtcOutSrc.h
  staging: rtl8723bs: put parentheses on macros with complex values in
    hal/odm_debug.h
  staging: rtl8723bs: put parentheses on macros with complex values in
    include/basic_types.h
  staging: rtl8723bs: put parentheses on macros with complex values in
    include/drv_types.h
  staging: rtl8723bs: put parentheses on macros with complex values in
    include/hal_com.h
  staging: rtl8723bs: put parentheses on macros with complex values in
    include/hal_com_reg.h
  staging: rtl8723bs: put parentheses on macros with complex values in
    include/hal_data.h
  staging: rtl8723bs: put parentheses on macros with complex values in
    include/hal_phy.h
  staging: rtl8723bs: put parentheses on macros with complex values in
    include/ieee80211.h
  staging: rtl8723bs: put parentheses on macros with complex values in
    include/rtw_debug.h
  staging: rtl8723bs: put parentheses on macros with complex values in
    include/rtw_pwrctrl.h
  staging: rtl8723bs: add spaces around operator in
    include/rtw_pwrctrl.h
  staging: rtl8723bs:  put parentheses on macros with complex values in
    include/sta_info.h
  staging: rtl8723bs:  put parentheses on macros with complex values in
    include/wifi.h

 drivers/staging/rtl8723bs/core/rtw_security.c | 94 +++++++++++--------
 drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h  |  6 +-
 drivers/staging/rtl8723bs/hal/odm_debug.h     |  6 +-
 .../staging/rtl8723bs/include/basic_types.h   | 30 +++---
 drivers/staging/rtl8723bs/include/drv_types.h |  4 +-
 drivers/staging/rtl8723bs/include/hal_com.h   |  8 +-
 .../staging/rtl8723bs/include/hal_com_reg.h   | 14 +--
 drivers/staging/rtl8723bs/include/hal_data.h  |  6 +-
 drivers/staging/rtl8723bs/include/hal_phy.h   |  2 +-
 drivers/staging/rtl8723bs/include/ieee80211.h |  4 +-
 drivers/staging/rtl8723bs/include/rtw_debug.h | 28 +++---
 .../staging/rtl8723bs/include/rtw_pwrctrl.h   |  6 +-
 drivers/staging/rtl8723bs/include/sta_info.h  | 12 +--
 drivers/staging/rtl8723bs/include/wifi.h      | 38 ++++----
 14 files changed, 140 insertions(+), 118 deletions(-)

-- 
2.20.1

