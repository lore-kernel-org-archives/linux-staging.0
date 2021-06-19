Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E9870
	for <linux-staging@lists.linux.dev>; Sat, 19 Jun 2021 10:47:25 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id o3so13725609wri.8
        for <linux-staging@lists.linux.dev>; Sat, 19 Jun 2021 03:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oTTOT3jlAQs1Ket6ExqtX8Xo9CN/PGcE3P1XnNQVpfA=;
        b=vIcjZ0V6pSm84Nw8yyUSKbD0Eaiw0mCaCWJsVYxBhRk8reX2oXs4JbFqHhEqGVKbK+
         oKDEnbtyl5LPGLK+jQZPx+4ENfy+boan5a0imfaiCJ5AmV3IwQ3bWYD3vLJtZeSJxzu2
         N9vh+0PvHZqvAYCuxYewT5ikADnqo1FREIAOYhL9nNZOu3JCnABD4ULghDCOg2XYMyV0
         EhHeutoPZK/W7klkN4H7EHA+1ky6e8WVMU3Dm878nvTySHKeOLkF20gfynVC9WO5vDRg
         P2zlyAbXD18btcQbxdHtTXIa+f7JBCX1PPZGXtAL1fFfpXdivqcqjq2ThN+sGTX1I9gJ
         4i4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oTTOT3jlAQs1Ket6ExqtX8Xo9CN/PGcE3P1XnNQVpfA=;
        b=gFBdWLLKsMzGyrkjinZs0LCqkZMI2FzfytLtHI+BOk9vT2adLfxh8azhNF4zwTyeaR
         k7L59d5SQoInhd0DCeD1GNjOkM2zn4x2qRwKTqk6o/DXBIElq8mxWw5s6pFIhzoEFNo0
         mg/JkPgPozGjdZY7QH7Q3Q7e2N9fv0NNqCb93EPcdi8uxB0u/JgWEm0D+HGWO+iYzJCY
         s1qTZqzXrr5r5R+risTB+FEaCQJJ6eRRXWEq+uhAVsoH01q5TkqEYVX0p6V9wHT27A2x
         g1JqGdqJv3LeMcKkPLuGH/hhl0r0JHFg0eWN37X8Nrd3a28K/eZ2CtZPB7RSwIuCFlU2
         uchg==
X-Gm-Message-State: AOAM531d1XeQnXSqiDCIEFCogb88LU2rrx3ilCKCanmZzVaoL47sUGaF
	O+Cwkj+7YhJvqq8NJuKTXPc=
X-Google-Smtp-Source: ABdhPJwRBVM12i+kxhutQpyShnmHdf9hliaXkg/8+c5eJWKEO92k79DDIPVoLIlxO3y/AFSnO0Lw1w==
X-Received: by 2002:a5d:6945:: with SMTP id r5mr17403350wrw.249.1624099643565;
        Sat, 19 Jun 2021 03:47:23 -0700 (PDT)
Received: from agape ([5.171.81.81])
        by smtp.gmail.com with ESMTPSA id y16sm7901354wrp.51.2021.06.19.03.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jun 2021 03:47:23 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Auto <fabioaiuto83@gmail.com>
Subject: [PATCH 00/18] staging: rtl8723bs: remove 5Ghz code
Date: Sat, 19 Jun 2021 12:47:03 +0200
Message-Id: <cover.1624099125.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series removes all occurences of 5Ghz code over the
driver as required from driver's TODO list:

	- find and remove remaining code valid only for 5 GHz.
	  most of the obvious one have been removed, but things
	  like channel > 14 still exist.

rtl8723bs work on 2.4Ghz band and supports 802.11bgn standards.
So all code related to 802.11a/ac standard is removed, as well
as code related to channel numbers above 14.

VHT code is deleted as well, for it's related to 802.11ac.

Comments are fixed accordingly and many unused variables are
deleted.

Every single patch of this series has been tested on a
Lenovo Ideapad MIIX 300-10IBY except for the last one,
for obvious reason (it deletes just the TODO item).

So:

Tested-by: Fabio Auto <fabioaiuto83@gmail.com>

Fabio Aiuto (18):
  staging: rtl8723bs: remove all 5Ghz network types
  staging: rtl8723bs: remove code related to unsupported channel
    bandwidth
  staging: rtl8723bs: remove unused enum items related to channel
    bonding
  staging: rtl8723bs: rename enum items related to channel bonding
  staging: rtl8723bs: remove 5Ghz field in struct registry_priv
  staging: rtl8723bs: remove struct rt_channel_plan_5g
  staging: rtl8723bs: remove all branchings between 2.4Ghz and 5Ghz band
    types
  staging: rtl8723bs: beautify prototypes in include/hal_com_phycfg.h
  staging: rtl8723bs: remove 5Ghz code related to channel plan
    definition
  staging: rtl8723bs: remove some unused 5Ghz macro definitions
  staging: rtl8723bs: remove 5Ghz code related to RF power calibration
  staging: rtl8723bs: remove VHT dead code
  staging: rtl8723bs: remove unused ODM_CMNINFO_BOARD_TYPE enum item
  staging: rtl8723bs: fix macro value for 2.4Ghz only device
  staging: rtl8723bs: remove register initializations tied to 802.11ac
    standard
  staging: rtl8723bs: remove obsolete 5Ghz comments
  staging: rtl8723bs: fix check allowing 5Ghz settings
  staging: rtl8723bs: remove item from TODO list

 drivers/staging/rtl8723bs/TODO                |    2 -
 drivers/staging/rtl8723bs/core/rtw_ap.c       |   10 +-
 .../staging/rtl8723bs/core/rtw_ieee80211.c    |   22 +-
 drivers/staging/rtl8723bs/core/rtw_mlme.c     |   10 -
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  328 ++---
 .../staging/rtl8723bs/core/rtw_wlan_util.c    |   29 +-
 drivers/staging/rtl8723bs/core/rtw_xmit.c     |    5 +-
 .../staging/rtl8723bs/hal/HalBtc8723b1Ant.c   |    4 +-
 .../staging/rtl8723bs/hal/HalBtc8723b2Ant.c   |    5 +-
 drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h  |    1 -
 .../staging/rtl8723bs/hal/HalHWImg8723B_BB.c  |   17 +-
 .../staging/rtl8723bs/hal/HalHWImg8723B_RF.c  |  595 ++++-----
 .../staging/rtl8723bs/hal/HalPhyRf_8723B.c    |   19 +-
 drivers/staging/rtl8723bs/hal/hal_btcoex.c    |    4 -
 drivers/staging/rtl8723bs/hal/hal_com.c       |  241 ----
 .../staging/rtl8723bs/hal/hal_com_phycfg.c    | 1059 +++--------------
 drivers/staging/rtl8723bs/hal/odm.c           |   50 -
 drivers/staging/rtl8723bs/hal/odm.h           |   42 +-
 drivers/staging/rtl8723bs/hal/odm_DIG.c       |    2 -
 .../rtl8723bs/hal/odm_EdcaTurboCheck.c        |    4 +-
 .../rtl8723bs/hal/odm_RegConfig8723B.c        |    5 +-
 .../rtl8723bs/hal/odm_RegConfig8723B.h        |    2 -
 drivers/staging/rtl8723bs/hal/rtl8723b_dm.c   |    1 -
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c |   53 +-
 .../staging/rtl8723bs/hal/rtl8723b_phycfg.c   |   43 +-
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  |    5 -
 .../rtl8723bs/include/Hal8192CPhyReg.h        |    2 -
 drivers/staging/rtl8723bs/include/drv_types.h |   10 +-
 drivers/staging/rtl8723bs/include/hal_com.h   |   62 +-
 .../rtl8723bs/include/hal_com_phycfg.h        |  198 +--
 .../staging/rtl8723bs/include/hal_com_reg.h   |    1 -
 drivers/staging/rtl8723bs/include/hal_data.h  |   40 +-
 drivers/staging/rtl8723bs/include/hal_pg.h    |    2 -
 drivers/staging/rtl8723bs/include/hal_phy.h   |   10 -
 drivers/staging/rtl8723bs/include/ieee80211.h |   67 +-
 .../staging/rtl8723bs/include/rtl8723b_xmit.h |   21 -
 drivers/staging/rtl8723bs/include/rtw_ht.h    |    4 -
 .../staging/rtl8723bs/include/rtw_mlme_ext.h  |   52 +-
 drivers/staging/rtl8723bs/include/rtw_rf.h    |   33 +-
 drivers/staging/rtl8723bs/include/wifi.h      |    1 -
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c |    4 -
 .../staging/rtl8723bs/os_dep/ioctl_linux.c    |    8 +-
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   |   13 +-
 drivers/staging/rtl8723bs/os_dep/wifi_regd.c  |    4 -
 44 files changed, 640 insertions(+), 2450 deletions(-)

-- 
2.20.1

