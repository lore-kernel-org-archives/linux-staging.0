Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1068D3FC7
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 18:54:04 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id n27so15090208eja.5
        for <linux-staging@lists.linux.dev>; Mon, 06 Sep 2021 11:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Yk5iTFNaloAXMSb8ZHzRcfuP8bkhzFyauDwjq9HvArE=;
        b=dFqcJrmgQgtmfqq8f1pCrIZSADQTzsRp7SMww1kOczVoHn/DrpukDF3B1cPVR8q95+
         qxHvnAROfqH3ZiXJlcRwn8DlCR7mBzwSHhJhNFDtpD/oJboeOw6z1z7LLxGvvxzTO9oW
         D5fwyjn3C4Acs0xD1dUm8Nie6q3Q5CMF14SkIAfVy/2/EDZ1V0hYq0d5DTaYx09OtNJ3
         CviAEZDbAez/NfEnbv/jo9ALnI23Ihyhq9oAwIgN9G1lRE0Ibbq/jxEtjx3eGWmsoTTt
         3+bPc6VnzwUnN/1ZsY6xotLVlzM9uV2Qdfc8+rCBBOYTTvKdbEJXiefyiv8yvBy54Vwo
         1ReQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Yk5iTFNaloAXMSb8ZHzRcfuP8bkhzFyauDwjq9HvArE=;
        b=F/OI4lTuUtrpeiHq7Q9Y/PeIys3R6VlcZiHlzP1azukl/nmWy9tfcFRMicX5kAEHwr
         lGkI4fthIqk29CN7J8ROumekBpSZ9SbW2YpPSVR+menlXTBhxuuRS0asOrz0GU9yMA6c
         fWKLwyYxxA0bkqqQE0YK/NQM9WBXUprOe8R+yarCQVTRs2iRYfETmTn0kLPaTuQjSgcH
         sm889I47VfvmYkdKfUbrKDx+2V/bj7ccXA1gf2Ik+eU6og2/KngMqUBQTjRLvaxQrKTL
         lGmAShyw6YJCHV5+PYOqMc7SSJBI8UcyOuCUjuyx5Ahy+iNErtklcDCBlPde4pR0Op/N
         SOhg==
X-Gm-Message-State: AOAM531oe7tSTzeVQnWjn+XFIK/yU5ceF9glOS5yW+GX4si1i+PAlElg
	eFo6yCF2/sf3T6n/gEMxvgZBPx0R8rqmFw==
X-Google-Smtp-Source: ABdhPJy4lQILln9tbBO9TckpOQs7byNNIoOGesZ0e00/iarM9pzFPIjvYtRexdPUf+IweQC0QPmbCQ==
X-Received: by 2002:a17:907:6297:: with SMTP id nd23mr15084015ejc.62.1630954442443;
        Mon, 06 Sep 2021 11:54:02 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id kk2sm4329128ejc.114.2021.09.06.11.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 11:54:02 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 00/40] staging: r8188eu: remove function pointers from struct hal_ops
Date: Mon,  6 Sep 2021 20:52:47 +0200
Message-Id: <20210906185327.10326-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to get rid of the HAL layer this series removes the next
bunch of function pointers from struct hal_ops.

Also it removes some empty functions and cleans up some minor style
issues I stumbled upon.

Tested on x86_64 with Inter-Tech DMG-02.

Michael Straube (40):
  staging: r8188eu: remove InitSwLeds from hal_ops
  staging: r8188eu: remove DeInitSwLeds from hal_ops
  staging: r8188eu: remove dm_init from hal_ops
  staging: r8188eu: remove dm_deinit from hal_ops
  staging: r8188eu: remove SetHalODMVarHandler from hal_ops
  staging: r8188eu: remove empty functions
  staging: r8188eu: remove unused function rtw_interface_ps_func()
  staging: r8188eu: remove interface_ps_func from hal_ops
  staging: r8188eu: remove hal_dm_watchdog from hal_ops
  staging: r8188eu: remove set_bwmode_handler from hal_ops
  staging: r8188eu: remove set_channel_handler from hal_ops
  staging: r8188eu: remove unused enum hal_intf_ps_func
  staging: r8188eu: remove Add_RateATid from hal_ops
  staging: r8188eu: remove hal_power_on from hal_ops
  staging: r8188eu: remove sreset_init_value from hal_ops
  staging: r8188eu: remove sreset_reset_value from hal_ops
  staging: r8188eu: remove silentreset from hal_ops
  staging: r8188eu: remove sreset_xmit_status_check from hal_ops
  staging: r8188eu: remove sreset_linked_status_check from hal_ops
  staging: r8188eu: remove sreset_get_wifi_status from hal_ops
  staging: r8188eu: remove EfusePowerSwitch from hal_ops
  staging: r8188eu: rename hal_EfusePowerSwitch_RTL8188E()
  staging: r8188eu: remove wrapper Efuse_PowerSwitch()
  staging: r8188eu: remove ReadEFuse from hal_ops
  staging: r8188eu: remove EFUSEGetEfuseDefinition from hal_ops
  staging: r8188eu: remove EfuseGetCurrentSize from hal_ops
  staging: r8188eu: remove empty comments
  staging: r8188eu: remove Efuse_PgPacketRead from hal_ops
  staging: r8188eu: remove Efuse_PgPacketWrite from hal_ops
  staging: r8188eu: remove Efuse_WordEnableDataWrite from hal_ops
  staging: r8188eu: remove useless assignment
  staging: r8188eu: remove AntDivBeforeLinkHandler from hal_ops
  staging: r8188eu: remove AntDivCompareHandler from hal_ops
  staging: r8188eu: remove empty function rtl8188e_start_thread()
  staging: r8188eu: remove empty function rtl8188e_stop_thread()
  staging: r8188eu: remove hal_notch_filter from hal_ops
  staging: r8188eu: remove free_hal_data from hal_ops
  staging: r8188eu: remove unused function rtl8188e_clone_haldata()
  staging: r8188eu: remove SetBeaconRelatedRegistersHandler from hal_ops
  staging: r8188eu: remove UpdateHalRAMask8188EUsb from hal_ops

 drivers/staging/r8188eu/core/rtw_ap.c         |   9 +-
 drivers/staging/r8188eu/core/rtw_cmd.c        |   6 +-
 drivers/staging/r8188eu/core/rtw_efuse.c      | 182 ++++--------------
 drivers/staging/r8188eu/core/rtw_mlme.c       |   7 +-
 drivers/staging/r8188eu/core/rtw_mlme_ext.c   |   5 +-
 drivers/staging/r8188eu/core/rtw_mp_ioctl.c   |  18 +-
 drivers/staging/r8188eu/core/rtw_p2p.c        |   4 +-
 drivers/staging/r8188eu/core/rtw_pwrctrl.c    |   8 -
 drivers/staging/r8188eu/core/rtw_sta_mgt.c    |   2 +-
 drivers/staging/r8188eu/core/rtw_wlan_util.c  |   8 +-
 drivers/staging/r8188eu/hal/hal_intf.c        | 170 +---------------
 .../staging/r8188eu/hal/rtl8188e_hal_init.c   | 123 +++---------
 drivers/staging/r8188eu/hal/usb_halinit.c     |  36 +---
 drivers/staging/r8188eu/include/hal_intf.h    | 123 ++----------
 .../staging/r8188eu/include/rtl8188e_hal.h    |   5 -
 drivers/staging/r8188eu/include/rtw_efuse.h   |   9 -
 drivers/staging/r8188eu/include/rtw_pwrctrl.h |   2 -
 drivers/staging/r8188eu/os_dep/ioctl_linux.c  |  31 +--
 drivers/staging/r8188eu/os_dep/os_intfs.c     |  21 +-
 19 files changed, 142 insertions(+), 627 deletions(-)

-- 
2.33.0

