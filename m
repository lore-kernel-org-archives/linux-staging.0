Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46C9450901
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 12:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119734; cv=none; b=vGHhbCphXj6iY3+HhAX8SGNPGI55wQMIurlYewHjLGmo8F1dLcdSeu6V92fbV/WxHP0wvRNKUsdtm4/bStVa50iwNMwEa6+GecEa5Pq2NHpJbgBx71tGj06XNHjd9VgM7UfXBbbNEpgEDHCqYZ7kbfbWq3Qk6T/ABJZlTa2qZR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119734; c=relaxed/simple;
	bh=xAfE0t34SVWDsL7hGuPbs9xmmrlbp7q/RDv8MdS+eAM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SXbB28v7o8Wz0lBx71In7UO7mPcYn9gIQHebFzS+52mUCQHFWhsaHCp2stsJ2V766HMjSiWhep+JphjYCV+wZ2M9dIDRlHjyIkYDv/cALvKiGdAYF+xGMEIfu0iVHNOzzajUeHfv9fmd1g66o7vdUsjy06n+fEFj7n4/WG6Z++g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tC2ZaIR0; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tC2ZaIR0"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b0117dda13so1896436e87.0
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 05:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784119727; x=1784724527; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a3Jc4F1tFGePPieocwH6bTbvUVSOSZppxLTrm/3vICw=;
        b=tC2ZaIR03HFMAU5e4fsmPEWS1IAad0TxHX+t0f0AghaoipxpVn/HHtBt+kKhWpVNco
         3L/wqilKF69UGuu3jTMwVTHJkR8Dq1qJ25UjVuJPJtw3m5IqQ20JAEM3/Z5n22L0fMHM
         YfX0zkPlo7i3SKcpAlUuamiEYrjJwuP12kgAv+bsZdZw+uD5T2sqvpupIPkr3HUohlfE
         yCirZ7iRyieoKlnZERvhwHF8rWbs0lbvjHWEQrmfKcgp2VqI1JOXySVm/axpRBCKEM6f
         BiEyoru1S2DFYnusJoMIkKeB6Gspp1Cpk4Svh3FksYYQyq7Oj2f+FjzvKzAUNItzFDCb
         E4Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119727; x=1784724527;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a3Jc4F1tFGePPieocwH6bTbvUVSOSZppxLTrm/3vICw=;
        b=Vn0bT6ckrT7y7pkRm5qmwhEwy3G4t0uIWnssz7wYLORrx1vDQjCQYuLne7mmHHGDSV
         kMfcqGJ7ms5F2PqoIVUcVeLE74Qg2aq17hLjVRbqxztMt0mg7M9uRzfoQdOheH1tl7N4
         JXkPO5D2xKZx0+YaQcSOxfhlyIxr0fUUVsH2evHlEm3+DkdYng+4NSvRilLw6sO/34pq
         1wPyxtVkrrBeUrYEc+7DoJbwDZWyLolI4GTT88MJY4/9W+8fuYgsd8VwuincF3jcftsp
         w4KuRiUA+GuRtuwDrgSxQm5aY7+NQMOJsyAalGcQAJcu5KN8uZ1mqonVUPol83ZUwmOM
         pYaA==
X-Gm-Message-State: AOJu0YxaqyPqTB2IiPCXW+QnYuSOLn9XtvjY8Y++QHChn/S23HyylLj4
	Y58q17CWhOOLt2io5AB6FcXIzDJfacuUNjxX1C3KXKo7e1aJGCeb3MB6
X-Gm-Gg: AfdE7cmLoW2KrQv03CB6uQ2GQHdju38S6y9A920+8ecdXGrNw9Ci2Gsctbp7gCeklXR
	RnsI+e6l011vZT1+8aaTOzZrBJZ3ZPZ033U7+D7ql/XIjMvm6irfN/h2yzsjzYst77fiIINuxza
	w7tYiqOt8EbVBnmCNRLZ6MqucoXrRAx0zIrBexncWD1H6loVakQ0MYlWCmoa6lWlCyzHT5Xoqnb
	sPDj9XwZSIRFcFPP5YSHyNPMvjrLgZd/fc8+5GSK99hoRPpSTJC4hTvNsFFBqaML9HohhKHTnkk
	tE0jXBmnSDDD2A4RT4t8QIOxofkftcJdFg7Ai2Ib4QOYWScXrjfok9FKzO8wncfaMDzCfPPVzWB
	6jqjbkVAkQllLvYEorDlsx075IBaty26ljzdu/jjsaPXJ++zvm/37HPvy8mCum6AgR3dRMKYg5T
	DDYnrBSMg1gyJ+rNzJlPrVTejxBMuWdEBI9emJqB6QKbx2MYYAVHVphgpx68LdNoZBja5yovUBM
	oFLRylwoaMkog==
X-Received: by 2002:a05:6512:2511:b0:5ae:c239:6a2c with SMTP id 2adb3069b0e04-5b0236b9d96mr5108624e87.53.1784119727217;
        Wed, 15 Jul 2026 05:48:47 -0700 (PDT)
Received: from archlinux ([94.180.44.28])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b022fac999sm3404042e87.55.2026.07.15.05.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:48:46 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ulijg308@gmail.com
Subject: [PATCH 00/61] staging: rtl8723bs: monolithic HAL cleanup and tx power limit fix
Date: Wed, 15 Jul 2026 19:47:28 +0700
Message-ID: <20260715124829.90290-1-ulijg308@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This patch series performs a massive, systematic cleanup of the legacy 
vendor HAL layer and redundant abstraction wrappers in the rtl8723bs 
driver, concluding with a functional fix for the TX power limit lookup.

The primary goal of this refactoring is to drastically improve the 
readability and maintainability of the codebase, transforming the 
highly tangled, Windows-legacy Realtek abstractions into a cleaner, 
more idiomatic Linux driver structure.

KEY CHANGES IN THIS SERIES:

1. Dead Code & Stub Removal: Eliminated several unimplemented functions, 
   empty stubs (like OnAtim, DoReserved), duplicate prototypes, and 
   completely unused helpers (NULL_hdl, set_csa_hdl, tdls_hdl).
2. Wrapper Collapse & Inlining: Removed multiple layers of superficial 
   wrappers around core operations (e.g., rtw_ap_set_group_key, 
   issue_deauth, issue_probereq, rtw_free_mlme_priv, etc.). High-frequency 
   or single-use HAL entry points (like SetHwReg8723BS, GetHwReg8723BS, 
   and xmit helpers) have been carefully inlined directly into their 
   respective dispatchers to enhance readability.
3. Scope & Warning Fixes: Restructured local functions (like 
   lps_ctrl_wk_hdl) by marking them static and aligning headers, which 
   resolves missing-prototypes compiler warnings.
4. Logical Fixes: In the final patch, a critical copy-paste bug in 
   phy_get_tx_pwr_lmt() was resolved. The computed channel index from 
   phy_GetChannelIndexOfTxPowerLimit() was mistakenly assigned back to 
   the 'channel' parameter and discarded, leaving 'idx_channel' at -1. 
   This caused the function to always fail validation and return 
   MAX_POWER_INDEX. Correcting this restores the intended hardware tx 
   power limit logic and resolves a compiler warning.
5. Refined Abstractions: In places where removing a wrapper would 
   decrease overall elegance or require awkward type workarounds, the 
   cleanest architectural approach was intentionally preserved.

TESTING & VERIFICATION:

- Hardware: I do not possess the physical rtl8723bs hardware, so 
  real-world runtime wireless testing was not performed.
- Compilation: The entire series compiles flawlessly against the 
  latest tree.
- Code Style: All 61 patches have been fully validated with 
  `scripts/checkpatch.pl` and return 0 errors / 0 warnings per patch. 
  (Note: A few pre-existing vendor style warnings remain in the modified 
  files, but no new ones were introduced).

This cleanup significantly reduces the boilerplate footprint, making 
future maintenance and eventual mac80211 migration tasks much more 
approachable.

Please review.

Thanks,
Arsenii

Arsenii Pashchenko (61):
  staging: rtl8723bs: remove redundant rtw_ap_set_group_key wrapper
  staging: rtl8723bs: replace is_same_ess with rtw_ssid_differ
  staging: rtl8723bs: remove redundant rtw_to_roam wrapper
  staging: rtl8723bs: remove redundant rtw_dec_to_roam helper
  staging: rtl8723bs: remove unused OnAtim stub function
  staging: rtl8723bs: remove DoReserved stub and clean up OnAction_tbl
  staging: rtl8723bs: remove redundant issue_deauth wrapper
  staging: rtl8723bs: remove unused NULL_hdl function
  staging: rtl8723bs: remove unused set_csa_hdl function
  staging: rtl8723bs: remove unused tdls_hdl function
  staging: rtl8723bs: inline rtw_ps_deny_get() and remove dead code
  staging: rtl8723bs: replace custom CMAC with kernel Crypto API helper
  staging: rtl8723bs: remove redundant rtw_get_oper_ch() wrapper
  staging: rtl8723bs: remove ODM_CheckPowerStatus and dead branches
  staging: rtl8723bs: remove unimplemented halbtcoutsrc_GetBtReg helper
  staging: rtl8723bs: remove rtw_free_evt_priv wrapper and rename helper
  staging: rtl8723bs: remove rtw_free_cmd_priv wrapper and rename helper
  staging: rtl8723bs: replace rtw_dm_in_lps_hdl with direct hal call
  staging: rtl8723bs: make lps_ctrl_wk_hdl() static
  staging: rtl8723bs: sanitize and align efuse read function headers
  staging: rtl8723bs: replace rtw_reset_continual_io_error with
    atomic_set
  staging: rtl8723bs: inline single-use init_mlme_default_rate_set
  staging: rtl8723bs: remove issue_probereq wrapper and rename helper
  staging: rtl8723bs: remove register_task_alive inline helper
  staging: rtl8723bs: remove unregister_task_alive inline helper
  staging: rtl8723bs: clean up Michael MIC pseudo header logic
  staging: rtl8723bs: replace rtw_set_oper_bw with direct assignment
  staging: rtl8723bs: inline single-use _clear_cam_entry helper
  staging: rtl8723bs: collapse set_sta_rate and Update_RA_Entry wrappers
  staging: rtl8723bs: replace correct_TSF with direct HAL call
  staging: rtl8723bs: replace rtw_sctx_done with direct status call
  staging: rtl8723bs: remove rtw_free_mlme_priv wrapper and rename
    helper
  staging: rtl8723bs: remove duplicate prototype of
    rtw_free_network_nolock
  staging: rtl8723bs: replace rtw_get_beacon_interval_from_ie with
    define
  staging: rtl8723bs: inline _rtw_free_network_nolock into wrapper
  staging: rtl8723bs: remove rtw_wmm_event_callback and update handler
  staging: rtl8723bs: replace halbtc8723b1ant_SwMechanism with direct
    call
  staging: rtl8723bs: remove redundant ternary operators from bool
    returns
  staging: rtl8723bs: remove redundant DM wrapper
  staging: rtl8723bs: remove EXhalbtc8723b2ant_InitHwConfig
  staging: rtl8723bs: remove EXhalbtc8723b1ant_InitHwConfig
  staging: rtl8723bs: remove ConfigureTxpowerTrack wrapper
  staging: rtl8723bs: remove hal_init_macaddr wrapper
  staging: rtl8723bs: remove rtw_init_hal_com_default_value
  staging: rtl8723bs: remove c2h_evt_clear wrapper
  staging: rtl8723bs: remove rtw_get_mgntframe_raid helper
  staging: rtl8723bs: clean up phy power conversion function
  staging: rtl8723bs: remove PHY_TxPowerByRateConfiguration wrapper
  staging: rtl8723bs: remove phy_GetChannelIndexOfTxPowerLimit helper
  staging: rtl8723bs: inline SetHwReg8723BS into rtw_hal_set_hwreg
  staging: rtl8723bs: inline GetHwReg8723BS into rtw_hal_get_hwreg
  staging: rtl8723bs: inline SetHwRegWithBuf8723B into helper
  staging: rtl8723bs: inline GetHalDefVar8723BSDIO into helper
  staging: rtl8723bs: inline SetHalODMVar into rtw_hal_set_odm_var
  staging: rtl8723bs: inline CheckIPSStatus logic with defines
  staging: rtl8723bs: inline rtl8723bs_hal_xmitframe_enqueue helper
  staging: rtl8723bs: inline rtl8723bs_hal_xmit into rtw_hal_xmit
  staging: rtl8723bs: extend rtw_hal_mgnt_xmit functionality
  staging: rtl8723bs: inline rtl8723bs_init_xmit_priv helper
  staging: rtl8723bs: inline recv private data freeing helper
  staging: rtl8723bs: fix tx power limit lookup by using correct channel
    index

 drivers/staging/rtl8723bs/core/rtw_ap.c       |  19 +-
 drivers/staging/rtl8723bs/core/rtw_cmd.c      |  43 +--
 drivers/staging/rtl8723bs/core/rtw_efuse.c    |  30 +-
 drivers/staging/rtl8723bs/core/rtw_io.c       |   6 -
 .../staging/rtl8723bs/core/rtw_ioctl_set.c    |   4 +-
 drivers/staging/rtl8723bs/core/rtw_mlme.c     |  99 ++----
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 144 +++-----
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  |  34 +-
 drivers/staging/rtl8723bs/core/rtw_recv.c     |  47 ++-
 drivers/staging/rtl8723bs/core/rtw_security.c | 142 +-------
 .../staging/rtl8723bs/core/rtw_wlan_util.c    |  56 +--
 drivers/staging/rtl8723bs/core/rtw_xmit.c     |   7 +-
 .../staging/rtl8723bs/hal/HalBtc8723b1Ant.c   |  25 +-
 .../staging/rtl8723bs/hal/HalBtc8723b1Ant.h   |   5 +-
 .../staging/rtl8723bs/hal/HalBtc8723b2Ant.c   |  18 +-
 .../staging/rtl8723bs/hal/HalBtc8723b2Ant.h   |   5 +-
 drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h  |  11 +-
 drivers/staging/rtl8723bs/hal/HalPhyRf.c      |   7 +-
 drivers/staging/rtl8723bs/hal/HalPhyRf.h      |   1 -
 .../staging/rtl8723bs/hal/HalPhyRf_8723B.c    |   8 -
 drivers/staging/rtl8723bs/hal/hal_btcoex.c    |  13 +-
 drivers/staging/rtl8723bs/hal/hal_com.c       |  66 +---
 .../staging/rtl8723bs/hal/hal_com_phycfg.c    |  40 +--
 drivers/staging/rtl8723bs/hal/hal_intf.c      | 334 +++++++++++++++++-
 drivers/staging/rtl8723bs/hal/odm_HWConfig.c  |   2 +-
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c  |  32 +-
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c |   4 +-
 .../staging/rtl8723bs/hal/rtl8723b_phycfg.c   |   7 +-
 .../staging/rtl8723bs/hal/rtl8723bs_recv.c    | 123 +------
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    | 115 ------
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  | 110 +-----
 drivers/staging/rtl8723bs/hal/sdio_ops.c      |  16 -
 drivers/staging/rtl8723bs/include/cmd_osdep.h |   2 -
 drivers/staging/rtl8723bs/include/hal_com.h   |  10 +-
 .../rtl8723bs/include/hal_com_phycfg.h        |   1 -
 drivers/staging/rtl8723bs/include/hal_intf.h  |   4 -
 drivers/staging/rtl8723bs/include/ieee80211.h |   6 +-
 .../staging/rtl8723bs/include/rtl8723b_cmd.h  |   1 -
 .../staging/rtl8723bs/include/rtl8723b_hal.h  |   6 +
 .../staging/rtl8723bs/include/rtl8723b_recv.h |   3 +-
 .../staging/rtl8723bs/include/rtl8723b_xmit.h |   5 +-
 drivers/staging/rtl8723bs/include/rtw_ap.h    |   2 +-
 drivers/staging/rtl8723bs/include/rtw_io.h    |   2 +-
 drivers/staging/rtl8723bs/include/rtw_mlme.h  |  11 +-
 .../staging/rtl8723bs/include/rtw_mlme_ext.h  |  23 +-
 .../staging/rtl8723bs/include/rtw_pwrctrl.h   |   3 +-
 .../staging/rtl8723bs/include/rtw_security.h  |  10 +-
 drivers/staging/rtl8723bs/include/rtw_xmit.h  |   2 +-
 drivers/staging/rtl8723bs/include/sdio_ops.h  |   4 +-
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c |  16 +-
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   |   7 +-
 .../staging/rtl8723bs/os_dep/osdep_service.c  |   4 +-
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c  |   2 +-
 .../staging/rtl8723bs/os_dep/sdio_ops_linux.c |   4 +-
 54 files changed, 626 insertions(+), 1075 deletions(-)

-- 
2.55.0

