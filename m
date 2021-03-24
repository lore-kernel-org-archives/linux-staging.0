Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D2A6F
	for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 12:44:48 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id 14so1077153wrz.12
        for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 05:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=neWq66NWHjyuU5tgxcMMb5A77lrDLK6YWOKIkqjgTGc=;
        b=EL/3sGwnb09eS8FlLesXijMEhHMwOxjTgSZm+pm/YvcxH94EEp9NybCx9XumTcMHWS
         shBIhV0uJvvbo8yylMwi/GvbOf+M+lSsT3xKOFWmradr5J1B+3Y7MMcSFKeqCYnP3/Li
         2AbalMXKPoi0sheeYsNPKOnphWn/ciwQeXwrCOe2y7qs5lMZBJCAbh9Z60AFdvh07sc8
         8751uyxMtU7USCDBAeAdev2L0fk5Sshmrbp8liMNW7AyHnjHnmMW6SHJPyhiLbEGwdP3
         SPCfoySlEo4LfNonXbJHWB6t9ARn1WS36fwtBUH63H56TVaNY2+kb7H7vhCfhFV2yQ4H
         ZKXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=neWq66NWHjyuU5tgxcMMb5A77lrDLK6YWOKIkqjgTGc=;
        b=XExQp7bdzXRXA4XBjgmabBbv1txlMbCxy8f8hIFHTU97Nx8fvLd+Ihp7TQ35eK/26Z
         U7iyOOEhFxhSzE7ehIKmD2dwtZ4cZ6223zG+KiUGxfMrKNMLdo8HPGlTtCL56GWZ3F7+
         /yQr8EM7OqudbGvlYO1B3kWnw8evfyyTyRpVAf+t81/v+1z6q5OURrB6kyMgvUaVAkrV
         o/8T7VDP/mkmW2ne6eU/D4ocY8LfUosjh0ir4jUadY9dGfG/jDVDpp3t0Ulpm/+nWEpO
         co7t55Xw5CbR+A+H4wWeo06FNf89LCMTUobn5MhblwXcvdYRLg0thz0WBqvRNSIL07ns
         tQew==
X-Gm-Message-State: AOAM5309B8I6zeDKra9KZ0o5IQCNumzoFhBuHMdf9tTSfEs5T3fFow2l
	RHoerPk+oMEq6of1Rut/akU=
X-Google-Smtp-Source: ABdhPJyFs//6noSbZHXg4DKAu9EJdWS12wP7b4J9qBLa4NManZINIE2IB2JQpU4JqzGmrxSUiHTyLQ==
X-Received: by 2002:a5d:4dd2:: with SMTP id f18mr3323697wru.366.1616589887452;
        Wed, 24 Mar 2021 05:44:47 -0700 (PDT)
Received: from gimli.home (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id s20sm2324005wmj.36.2021.03.24.05.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 05:44:47 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev
Subject: [PATCH 00/33] Staging: rtl8723bs: remove unnecessary enum names and definitions
Date: Wed, 24 Mar 2021 13:44:23 +0100
Message-Id: <20210324124456.25221-1-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The staging/rtl8723bs driver includes 82 enum definitions whose
names are not referenced in the code. Furthermore, 57 enum definitions
are useless, because the enum elements do not appear in the code.
This patchset transforms 82 'named' enums in 'anonymous' enums and
removes 57 enum definitions.


[PATCH 01/33] Staging: rtl8723bs: remove named enums in rtw_mlme.h
[PATCH 02/33] Staging: rtl8723bs: remove named enums in rtw_cmd.h
[PATCH 03/33] Staging: rtl8723bs: remove named enums in rtw_eeprom.h
[PATCH 04/33] Staging: rtl8723bs: remove named enums in hal_com.h
[PATCH 05/33] Staging: rtl8723bs: remove named enums in rtw_recv.h
[PATCH 06/33] Staging: rtl8723bs: remove named enums in drv_types.h
[PATCH 07/33] Staging: rtl8723bs: remove named enums in rtw_ht.h
[PATCH 08/33] Staging: rtl8723bs: remove named enums in wlan_bssdef.h
[PATCH 09/33] Staging: rtl8723bs: remove named enums in rtw_mp.h
[PATCH 10/33] Staging: rtl8723bs: remove named enums in osdep_service.h
[PATCH 11/33] Staging: rtl8723bs: remove named enums in hal_intf.h
[PATCH 12/33] Staging: rtl8723bs: remove named enums in rtw_pwrctrl.h
[PATCH 13/33] Staging: rtl8723bs: remove named enums in rtl8723b_cmd.h
[PATCH 14/33] Staging: rtl8723bs: remove named enums in hal_com_h2c.h
[PATCH 15/33] Staging: rtl8723bs: remove named enums in rtw_wifi_regd.h
[PATCH 16/33] Staging: rtl8723bs: remove named enums in wifi.h
[PATCH 17/33] Staging: rtl8723bs: remove named enums in rtl8723b_hal.h
[PATCH 18/33] Staging: rtl8723bs: remove named enums in hal_phy.h
[PATCH 19/33] Staging: rtl8723bs: remove named enums in rtw_mlme_ext.h
[PATCH 20/33] Staging: rtl8723bs: remove named enums in rtw_xmit.h
[PATCH 21/33] Staging: rtl8723bs: remove named enums in rtw_rf.h
[PATCH 22/33] Staging: rtl8723bs: remove named enums in HalPwrSeqCmd.h
[PATCH 23/33] Staging: rtl8723bs: remove named enums in hal_com_phycfg.h
[PATCH 24/33] Staging: rtl8723bs: remove named enums in ieee80211.h
[PATCH 25/33] Staging: rtl8723bs: remove named enums in rtw_efuse.h
[PATCH 26/33] Staging: rtl8723bs: remove named enums in odm_interface.h
[PATCH 27/33] Staging: rtl8723bs: remove named enums in HalBtcOutSrc.h
[PATCH 28/33] Staging: rtl8723bs: remove named enums in HalBtc8723b1Ant.h
[PATCH 29/33] Staging: rtl8723bs: remove named enums in odm_types.h
[PATCH 30/33] Staging: rtl8723bs: remove named enums in odm_DIG.h
[PATCH 31/33] Staging: rtl8723bs: remove named enums in HalPhyRf.h
[PATCH 32/33] Staging: rtl8723bs: remove named enums in odm.h
[PATCH 33/33] Staging: rtl8723bs: remove named enums in HalBtc8723b2Ant.h

 .../staging/rtl8723bs/hal/HalBtc8723b1Ant.h   |   8 +-
 .../staging/rtl8723bs/hal/HalBtc8723b2Ant.h   |   6 +-
 drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h  |  70 +++-----
 drivers/staging/rtl8723bs/hal/HalPhyRf.h      |   5 -
 drivers/staging/rtl8723bs/hal/odm.h           | 150 ++----------------
 drivers/staging/rtl8723bs/hal/odm_DIG.h       |  16 --
 drivers/staging/rtl8723bs/hal/odm_interface.h |   9 --
 drivers/staging/rtl8723bs/hal/odm_types.h     |  41 -----
 .../staging/rtl8723bs/include/HalPwrSeqCmd.h  |   2 +-
 drivers/staging/rtl8723bs/include/drv_types.h |  19 +--
 drivers/staging/rtl8723bs/include/hal_com.h   |   4 -
 .../staging/rtl8723bs/include/hal_com_h2c.h   |  60 -------
 .../rtl8723bs/include/hal_com_phycfg.h        |   4 +-
 drivers/staging/rtl8723bs/include/hal_intf.h  |  26 +--
 drivers/staging/rtl8723bs/include/hal_phy.h   |  44 +----
 drivers/staging/rtl8723bs/include/ieee80211.h |  89 +----------
 .../staging/rtl8723bs/include/osdep_service.h |  25 ---
 .../staging/rtl8723bs/include/rtl8723b_cmd.h  |   2 +-
 .../staging/rtl8723bs/include/rtl8723b_hal.h  |   4 +-
 drivers/staging/rtl8723bs/include/rtw_cmd.h   |   8 +-
 .../staging/rtl8723bs/include/rtw_eeprom.h    |   2 +-
 drivers/staging/rtl8723bs/include/rtw_efuse.h |   2 +-
 drivers/staging/rtl8723bs/include/rtw_ht.h    |   6 +-
 drivers/staging/rtl8723bs/include/rtw_mlme.h  |  16 +-
 .../staging/rtl8723bs/include/rtw_mlme_ext.h  |  24 +--
 drivers/staging/rtl8723bs/include/rtw_mp.h    |  98 ------------
 .../staging/rtl8723bs/include/rtw_pwrctrl.h   |   5 +-
 drivers/staging/rtl8723bs/include/rtw_recv.h  |   2 +-
 drivers/staging/rtl8723bs/include/rtw_rf.h    |  32 +---
 .../staging/rtl8723bs/include/rtw_wifi_regd.h |   7 -
 drivers/staging/rtl8723bs/include/rtw_xmit.h  |   7 -
 drivers/staging/rtl8723bs/include/wifi.h      |  28 +---
 .../staging/rtl8723bs/include/wlan_bssdef.h   |  13 +-
 33 files changed, 82 insertions(+), 752 deletions(-)

-- 
2.30.2

