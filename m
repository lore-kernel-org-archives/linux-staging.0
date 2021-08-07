Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A933370
	for <linux-staging@lists.linux.dev>; Sat,  7 Aug 2021 09:48:16 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id o11so980417wms.0
        for <linux-staging@lists.linux.dev>; Sat, 07 Aug 2021 02:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Mx7YnVaArPpQTcFJhBXfOWZF016uAcPsvF11YBATDfc=;
        b=XaS/bP7Q8cng9fdcuKhDyR8xHUq6foYAQ7Ste/AEMqxnJ053D8d0upWKMsYhiW0joB
         GmfMHgTLwap8ICBUbzvvu+BvGZWeU4ivgz0qEwTCHPbuW714GxZ3Pzha2r6uL9b5RlcY
         TgvMIUcl7rMdTLj7pDl27wZbEoGozVXDeZwjnc+4edewHDs1oPvT8HkXks3lvDG8xuvw
         ZyVUvREx9fCdv/W+zF2nJavZI8KqBv2zUqvyEOIVLsLTtxrikPTziwp37XpCW0GvvPcG
         djt1Uch98PO9aUGLaIz9Hn7kEdBiCCT+x0Cd9hg7H+76pfYUcRvYTYKgcQxmkiTUBZPU
         GCbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Mx7YnVaArPpQTcFJhBXfOWZF016uAcPsvF11YBATDfc=;
        b=ZPzd4LsB1zD1MhUW+1dx2w/ug5NrzPZ6OlDAuNFtrO/vwf5ZhiOCKBxkKtvCG+nAlB
         k2uL8l0kkmWLFb7bZa2QFqo7el5JPEU17C7GBZvHNln3WMwWI53n0NIdnsi1WxJ2YheH
         dfUCfIszg87AzDUMnJP2ukhCMj3pmXKVjSz/mLrlSsPJOZfJZEniA9wdNYsr6jVNMvqm
         XzAvfTg0pjskgAoGx1POOt5nfRjLLGNM1pf50Be7r0BLjMUN3dMFZ8Z+3P7fLM0lr2cU
         zQANiS7tBX/HwClk6dZn9J3050gIFfTZCGDKXjAXjhmIlS30FBADm+fNCRHZgAx18wgX
         1bdA==
X-Gm-Message-State: AOAM532ROukdbUS8aJDblaF/fjdwTkikxsEt3ZPjJITaNS2yavO8b1/L
	fLnXVvN+eyzSkW0+CXe8MM4=
X-Google-Smtp-Source: ABdhPJxZ5htXNHP+Hk19fnsycwzqB8xWP2sppLxfJiQEJ71x4/zPCJKe9YdARTa7X0PNMkbdTkJgHg==
X-Received: by 2002:a1c:452:: with SMTP id 79mr23956127wme.125.1628329695070;
        Sat, 07 Aug 2021 02:48:15 -0700 (PDT)
Received: from agape ([5.171.80.112])
        by smtp.gmail.com with ESMTPSA id r15sm570825wmq.15.2021.08.07.02.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Aug 2021 02:48:14 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 00/21] staging: rtl8723b: remove some code related to other chips
Date: Sat,  7 Aug 2021 11:47:52 +0200
Message-Id: <cover.1628329348.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset remove some code related to other chips.
Code related to MCS index values bigger than 7 and
smaller than 32, unsupported multiple spatial streams,
rf paths, rf types.

Some code cleaning in removal sites is done as well.

Tested-on: Lenovo ideapad MiiX 300-10IBY

Fabio Aiuto (21):
  staging: rtl8723bs: remove code related to unsupported MCS index
    values
  staging: rtl8723bs: remove unneeded loop
  staging: rtl8723bs: do some code cleaning in modified function
  staging: rtl8723bs: move function to file hal/odm_HWConfig.c
  staging: rtl8723bs: remove empty files
  staging: rtl8723bs: remove wrapping static function
  staging: rtl8723bs: beautify function ODM_PhyStatusQuery()
  staging: rtl8723bs: fix right side of condition
  staging: rtl8723bs: clean driver from unused RF paths
  staging: rtl8723bs: remove unused macros
  staging: rtl8723bs: remove unused struct member
  staging: rtl8723bs: remove rf type branching (first patch)
  staging: rtl8723bs: remove rf type branching (second patch)
  staging: rtl8723bs: remove rf type branching (third patch)
  staging: rtl8723bs: remove rf type branching (fourth patch)
  staging: rtl8723bs: remove unused rtw_rf_config module param
  staging: rtl8723bs: remove unused macro in include/hal_data.h
  staging: rtl8723bs: remove RF_*TX enum
  staging: rtl8723bs: use MAX_RF_PATH_NUM as ceiling to rf path index
  staging: rtl8723bs: fix tx power tables size
  staging: rtl8723bs: remove unused RF_*T*R enum

 drivers/staging/rtl8723bs/Makefile            |   1 -
 drivers/staging/rtl8723bs/core/rtw_ap.c       |   8 +-
 drivers/staging/rtl8723bs/core/rtw_debug.c    |  18 +-
 .../staging/rtl8723bs/core/rtw_ieee80211.c    |  73 +--
 .../staging/rtl8723bs/core/rtw_ioctl_set.c    |   6 +-
 drivers/staging/rtl8723bs/core/rtw_mlme.c     |  36 +-
 .../staging/rtl8723bs/core/rtw_wlan_util.c    |  38 +-
 .../staging/rtl8723bs/hal/HalHWImg8723B_BB.c  |  17 +-
 .../staging/rtl8723bs/hal/HalHWImg8723B_RF.c  |  86 +---
 drivers/staging/rtl8723bs/hal/HalPhyRf.c      |  52 +-
 .../staging/rtl8723bs/hal/HalPhyRf_8723B.c    | 164 +++----
 drivers/staging/rtl8723bs/hal/hal_com.c       | 165 +------
 .../staging/rtl8723bs/hal/hal_com_phycfg.c    | 446 +++---------------
 drivers/staging/rtl8723bs/hal/odm.c           |  52 +-
 drivers/staging/rtl8723bs/hal/odm.h           |  25 -
 .../staging/rtl8723bs/hal/odm_CfoTracking.c   |  36 +-
 .../staging/rtl8723bs/hal/odm_CfoTracking.h   |   2 +-
 drivers/staging/rtl8723bs/hal/odm_DIG.c       |   3 +-
 drivers/staging/rtl8723bs/hal/odm_HWConfig.c  | 341 ++++++-------
 drivers/staging/rtl8723bs/hal/odm_HWConfig.h  |  29 +-
 .../staging/rtl8723bs/hal/odm_NoiseMonitor.c  |  23 +-
 drivers/staging/rtl8723bs/hal/odm_RTL8723B.c  |  36 --
 drivers/staging/rtl8723bs/hal/odm_RTL8723B.h  |  14 -
 .../rtl8723bs/hal/odm_RegConfig8723B.c        |   7 +-
 .../rtl8723bs/hal/odm_RegConfig8723B.h        |  11 +-
 .../staging/rtl8723bs/hal/odm_RegDefine11N.h  |   2 -
 drivers/staging/rtl8723bs/hal/odm_precomp.h   |   1 -
 drivers/staging/rtl8723bs/hal/odm_reg.h       |   4 -
 drivers/staging/rtl8723bs/hal/rtl8723b_dm.c   |  10 -
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c |  19 +-
 .../staging/rtl8723bs/hal/rtl8723b_phycfg.c   |  42 +-
 .../staging/rtl8723bs/hal/rtl8723b_rf6052.c   |  21 +-
 .../staging/rtl8723bs/hal/rtl8723bs_recv.c    |   2 +-
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  |   2 -
 .../rtl8723bs/include/Hal8192CPhyReg.h        |   4 -
 drivers/staging/rtl8723bs/include/HalVerDef.h |  18 -
 drivers/staging/rtl8723bs/include/drv_types.h |   1 -
 drivers/staging/rtl8723bs/include/hal_com.h   |  35 +-
 .../rtl8723bs/include/hal_com_phycfg.h        |  20 +-
 .../staging/rtl8723bs/include/hal_com_reg.h   |  19 -
 drivers/staging/rtl8723bs/include/hal_data.h  |  24 +-
 drivers/staging/rtl8723bs/include/hal_pg.h    |   8 +-
 drivers/staging/rtl8723bs/include/hal_phy.h   |   3 +-
 drivers/staging/rtl8723bs/include/ieee80211.h |  26 +-
 .../staging/rtl8723bs/include/rtl8723b_xmit.h |   8 -
 drivers/staging/rtl8723bs/include/rtw_rf.h    |  10 -
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c |  23 +-
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   |   4 -
 48 files changed, 501 insertions(+), 1494 deletions(-)
 delete mode 100644 drivers/staging/rtl8723bs/hal/odm_RTL8723B.c
 delete mode 100644 drivers/staging/rtl8723bs/hal/odm_RTL8723B.h

-- 
2.20.1

