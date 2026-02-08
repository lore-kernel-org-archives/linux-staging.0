Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B053090EE
	for <linux-staging@lists.linux.dev>; Sun,  8 Feb 2026 11:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770548501; cv=none; b=Z7JzfhSX6t6bAx6XYAe8GCl0QZUfrXNyoRqjbopLwChNogqKtYHepPXbXiS6phQj7CaTQKg4H4A9cEUdakBv+BRypw1tLnTkhBbjxQfsdCRteqWQm6Qj5qoavxES0tyaYrvSI8g4vNfrmdx2CgsbPEnTEbcOYU7WNbAPh4AWQaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770548501; c=relaxed/simple;
	bh=RT8JDH34s5VdE/JNDJcRD3Ei6SU5lVzndUbhYJpBCGk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T65Hn41xu6ysp0XwifkPZ6D9mWULX2gtVt88boJhk4vpn82JLaT1BaXE20rGbnOf9n7nzSIrVu/Ob1+TejGK0lHt2RP0cViHIyVbiYeF0MOm4Rn9Pfe83Fov7YGO+5McsG4m2kqWtjXJIHLJVkDZSUKQwX8++/peGMUC4rB3j9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=LMEtKjuX; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="LMEtKjuX"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770548499;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=K1T2EvEN5HoqowIqCk3R2KtROYyS5kwhvvmBmxiIanI=;
	b=LMEtKjuX/gscBC5Ha4KoLv5+Kpgly7u6d7KEIdKIeVXhNZn4hKmn51YLXj5cvVKejxJzQH
	Nck0CKIICUosLu3mB6X0P3n5PRm7KFLc1hew1T92AHs2wdNlyyqfAZGIxuRTG9VWLe1+ez
	YGrEZyQeT1C/+b1xrqhQwK9ao2ETIvM=
From: luka.gejak@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <luka.gejak@linux.dev>
Subject: [PATCH v3 00/22] staging: rtl8723bs: fix out-of-bounds and various cleanups
Date: Sun,  8 Feb 2026 12:00:49 +0100
Message-ID: <20260208110111.46642-1-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Luka Gejak <luka.gejak@linux.dev>

Patches 2, 3, 4, and 5 from the v2 series have been accepted and 
applied to the staging-next branch, so they are excluded from this 
version. This series has been rebased on top of the latest staging-next.
Changes in v3:
 - Rebased on staging-next.
 - Dropped patches 2, 3, 4, and 5 (already applied upstream).
 - Fixed a formatting error in the subject line of Patch 1 (removed 
extra space after the prefix).
 - No logical changes to the remaining patches (6-26).

Luka Gejak (22):
  staging: rtl8723bs: fix potential out-of-bounds read in
    rtw_restruct_wmm_ie
  staging: rtl8723bs: remove unused rtl8192c function declarations
  staging: rtl8723bs: remove unused RECV_BLK defines
  staging: rtl8723bs: remove unused MAX_PATH_NUM defines
  staging: rtl8723bs: convert PSTA_INFO_T to struct sta_info *
  staging: rtl8723bs: remove NDIS type aliases
  staging: rtl8723bs: remove redundant MAC_ARG macro
  staging: rtl8723bs: core: fix line lengths in rtw_wlan_util.c
  staging: rtl8723bs: core: fix line lengths in rtw_recv.c
  staging: rtl8723bs: hal: fix line lengths in HalPhyRf_8723B.c
  staging: rtl8723bs: os_dep: fix line lengths in ioctl_cfg80211.c
  staging: rtl8723bs: hal: fix line lengths in rtl8723b_cmd.c
  staging: rtl8723bs: hal: fix line lengths in rtl8723b_hal_init.c
  staging: rtl8723bs: hal: fix line lengths in rtl8723b_phycfg.c
  staging: rtl8723bs: core: fix various line length overflows
  staging: rtl8723bs: hal: fix various line length overflows
  staging: rtl8723bs: os_dep: fix various line length overflows
  staging: rtl8723bs: core: fix line lengths in rtw_cmd.c
  staging: rtl8723bs: core: fix line lengths in rtw_mlme_ext.c
  staging: rtl8723bs: core: fix line lengths in rtw_mlme.c
  staging: rtl8723bs: core: fix line lengths in rtw_xmit.c
  staging: rtl8723bs: core: fix various line length overflows

 drivers/staging/rtl8723bs/core/rtw_cmd.c      | 147 +++---
 .../staging/rtl8723bs/core/rtw_ieee80211.c    |  36 +-
 drivers/staging/rtl8723bs/core/rtw_io.c       |   4 +-
 .../staging/rtl8723bs/core/rtw_ioctl_set.c    |  16 +-
 drivers/staging/rtl8723bs/core/rtw_mlme.c     | 106 ++--
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 471 ++++++++++++------
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  |   3 +-
 drivers/staging/rtl8723bs/core/rtw_recv.c     | 120 +++--
 drivers/staging/rtl8723bs/core/rtw_security.c |  11 +-
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c  |   2 +-
 .../staging/rtl8723bs/core/rtw_wlan_util.c    | 215 +++++---
 drivers/staging/rtl8723bs/core/rtw_xmit.c     |  44 +-
 .../staging/rtl8723bs/hal/HalBtc8723b1Ant.c   |  35 +-
 .../staging/rtl8723bs/hal/HalBtc8723b2Ant.c   |  29 +-
 drivers/staging/rtl8723bs/hal/HalPhyRf.c      |  36 +-
 .../staging/rtl8723bs/hal/HalPhyRf_8723B.c    | 176 +++++--
 .../staging/rtl8723bs/hal/hal_com_phycfg.c    |  22 +-
 drivers/staging/rtl8723bs/hal/hal_intf.c      |   4 +-
 drivers/staging/rtl8723bs/hal/hal_sdio.c      |   4 +-
 drivers/staging/rtl8723bs/hal/odm.c           |  28 +-
 drivers/staging/rtl8723bs/hal/odm.h           |  11 +-
 drivers/staging/rtl8723bs/hal/odm_DIG.c       |  38 +-
 drivers/staging/rtl8723bs/hal/odm_HWConfig.c  |  19 +-
 drivers/staging/rtl8723bs/hal/odm_types.h     |   3 -
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c  | 103 +++-
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c |  64 ++-
 .../staging/rtl8723bs/hal/rtl8723b_phycfg.c   |  54 +-
 .../staging/rtl8723bs/hal/rtl8723b_rf6052.c   |   6 +-
 .../staging/rtl8723bs/hal/rtl8723bs_recv.c    |   6 +-
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    |   5 +-
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  |  17 +-
 drivers/staging/rtl8723bs/include/ieee80211.h |   1 -
 .../staging/rtl8723bs/include/rtl8192c_recv.h |   8 -
 .../staging/rtl8723bs/include/rtw_ioctl_set.h |   3 -
 .../staging/rtl8723bs/include/rtw_mlme_ext.h  |   2 +-
 .../staging/rtl8723bs/include/wlan_bssdef.h   |  12 +-
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 136 +++--
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   |  17 +-
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c  |   3 +-
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c |   8 +-
 40 files changed, 1355 insertions(+), 670 deletions(-)

-- 
2.52.0

