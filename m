Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4CAA17BBE
	for <linux-staging@lists.linux.dev>; Sun, 15 Sep 2024 06:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726382452; cv=none; b=R4cs1gsZ8zEHVmD1QKCzcH8HMlv/PAbW3VOgDxf3MAE9lT8Qy1Z83tQQxKmXv6ygNPiDib3DhcZEdF/3WQeUWLpovPzrLmTVbrWjgpGbMDL6MHklWdSdPT5NgJcJkl7PnfAZGOsUN3IUj0WTzkNSYASpu3sgmOZN7xYzcQOxuPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726382452; c=relaxed/simple;
	bh=map9OqAqlhHdp3AyeG30zmc8rrWcD32kRYETJOholq0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kAjdqjbf/4kJrIqWohVNfJq4HM3oh1xblFVRZpJ070p3ux+PWsaEDPsSnS84tqbRqRamkGTHAlds7/fiFJ2DR8R29vwMoTzcx/1daGkXC8o6sVA3VUvvCe9/GejAja0PB0Wbbmzf5UFQL0wLufQ1xB88tLolBPbArzq1WGADE+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FWTpDbED; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FWTpDbED"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a8d56155f51so438082066b.2
        for <linux-staging@lists.linux.dev>; Sat, 14 Sep 2024 23:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726382449; x=1726987249; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lJWrJsnaH56i3Ai65QAPyR9wjb9ssl4jYtrKSQ32fSk=;
        b=FWTpDbEDE71w+zxG43TSmh7+GMkaOwxnvxWNj2fAF8Ok65TZ+8NueEOM154HKTyGPK
         QBxB40kHKWTwbIsUKMkcyOdgSDyNzAnoTpPi77W5JJzAQIVCdP97FRcfNu4zxTLbdS+C
         KQvSN9nV/9jPA7WOJQdUGoHXLWA6vvSiSsBvKyPS2gPgt7z8suDnVK6k/P5BnmJzPHEu
         oWZjGOQZr6/S0YE89rejDnbZO8cAp8Mym0jwst+7WG2RcFNpmXc38uVi0GQBiXVVaFYz
         dxPKHPnDQP+7Ctp48THOO9QXKRsOopaA5LZ/xNFQzvspwo6ilkG/pFnkEaIa6O+4/foB
         4tHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726382449; x=1726987249;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lJWrJsnaH56i3Ai65QAPyR9wjb9ssl4jYtrKSQ32fSk=;
        b=nLKZoQVXaj58WPr4iAaGtCmxYeaTYCnWZO+TMwC6oz4R4NxA/6UDcJmcmaC3B2RzXP
         bnRX4FRfwjVJBdDKH16AUjlfszV739gm2TKfDIfr4eaWr/Vnkp7XLHDi6pm7FfUfzSBf
         gjplv8DfQ+6J43BopPh+J3IhLaTNl0WvSSsa5D7BMUZX08/MzK1jbbRBoMhkd48Y7z00
         25XAa56AqvXst+mwZLgdpwK+NvDzacDOaCx1b9uC2yzLAesFLt83nQF1A6rWARc4fKqp
         A/M+4K5rirTKwLTBOGpMdVtJ54dkZtAl8dyLa06X84UDFVnOAGrartPT2tzIOIsu+2Ie
         AKmA==
X-Forwarded-Encrypted: i=1; AJvYcCURcHFCfNHHEnHk4fpstFJNAyLX+3zlg9ZwY1Vv2Sk3UnZPPDMZJmpz/OE7lp/FSJtrB2YTzY9yLFs9WlVQ@lists.linux.dev
X-Gm-Message-State: AOJu0YyjAXVCyBOWEEumOPS7KrAE4kihjWFgQ9WKnBbSCoie/RynpERN
	WzNSDdYfqkWvaLW04t0fMIb3y4jdzzxPc6+1sq+ZEqH/ewR2J1iq
X-Google-Smtp-Source: AGHT+IHkiIYQJMF61aW8pW6xiR50hEB5C33k3GbqB75AhLB2g8jrrvySSA5ogj8eQgPtcxjEyQSlNA==
X-Received: by 2002:a17:907:6d26:b0:a7a:9fe9:99e7 with SMTP id a640c23a62f3a-a90296174a7mr1163444066b.41.1726382448911;
        Sat, 14 Sep 2024 23:40:48 -0700 (PDT)
Received: from kernel-710.speedport.ip (p57ba2f9b.dip0.t-ipconnect.de. [87.186.47.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90610967bbsm160201066b.8.2024.09.14.23.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Sep 2024 23:40:48 -0700 (PDT)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 00/17] staging: rtl8723bs: Remove unused functions including read_cam
Date: Sun, 15 Sep 2024 08:38:14 +0200
Message-ID: <cover.1726339782.git.philipp.g.hortmann@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused functions, macros and one enum.

Tested with rtl8723bs in ODYS Trendbook Next 14

Philipp Hortmann (17):
  staging: rtl8723bs: Remove unused function dvobj_get_port0_adapter
  staging: rtl8723bs: Remove unused function rtw_search_max_mac_id
  staging: rtl8723bs: Remove unused function read_cam
  staging: rtl8723bs: Remove unused function rtw_get_oper_choffset
  staging: rtl8723bs: Remove unused function rtw_get_oper_bw
  staging: rtl8723bs: Remove unused function _ReadCAM
  staging: rtl8723bs: Remove unused entries from struct hal_ops
  staging: rtl8723bs: Remove unused function PHY_SetBWMode8723B
  staging: rtl8723bs: Remove unused function PHY_GetTxPowerLevel8723B
  staging: rtl8723bs: Remove unused function Hal_BT_EfusePowerSwitch
  staging: rtl8723bs: Remove unused function rtl8723b_GetHalODMVar
  staging: rtl8723bs: Remove unused function GetHalODMVar
  staging: rtl8723bs: Remove unused function rtl8723bs_inirp_init
  staging: rtl8723bs: Remove unused function rtl8723bs_inirp_deinit
  staging: rtl8723bs: Remove constant result macro is_primary_adapter
  staging: rtl8723bs: Remove constant result macro get_iface_type
  staging: rtl8723bs: Remove unused enum with first entry IFACE_PORT0

 drivers/staging/rtl8723bs/core/rtw_cmd.c      |  3 +-
 drivers/staging/rtl8723bs/core/rtw_mlme.c     |  6 +-
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  3 +-
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  |  7 --
 .../staging/rtl8723bs/core/rtw_wlan_util.c    | 64 -------------------
 drivers/staging/rtl8723bs/hal/hal_com.c       | 34 +++-------
 drivers/staging/rtl8723bs/hal/hal_intf.c      | 20 +++---
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 53 ---------------
 .../staging/rtl8723bs/hal/rtl8723b_phycfg.c   | 15 -----
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  | 13 ----
 drivers/staging/rtl8723bs/include/drv_types.h | 10 ---
 drivers/staging/rtl8723bs/include/hal_com.h   |  4 --
 drivers/staging/rtl8723bs/include/hal_intf.h  | 14 ----
 .../staging/rtl8723bs/include/hal_phy_cfg.h   |  5 --
 .../staging/rtl8723bs/include/rtw_mlme_ext.h  |  5 --
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   |  3 +-
 16 files changed, 22 insertions(+), 237 deletions(-)

-- 
2.43.0

