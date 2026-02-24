Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1A331690A
	for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 13:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771939695; cv=none; b=ZMT7Yr1UvrUn17PJah8ysY+/6lkKzRyBu+fOdF/Wl+dLPoVG0/ChVhYfALCIT1ixM1c71FPPM+HH93waYi/Xr/d5jwKakiW6jMHadVRpVStx36bIFTBb1UeQAPS/Gl5YQmvwRQlf+gRSZOlI/83Suo0u2qhZU1U5I3jqvnAFFxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771939695; c=relaxed/simple;
	bh=X3YU3xatle1nigF6Pf8UiwYr6s2xdcOWxGzpg8raUUs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BstdDKDSiXa7hJ9sjb2s7p0UKtOXyBss9ZP53648JhpnLz7GogHb5gcznpFbf/bxW28vvJHLf6WAlVBrsy6fTvIyIseXeAphyQJyx3hNE4KZ3gAfkjYZoxT+wPFOdMKgPBhnpXhKteNe7J2j9x16rJ7CbBs8B721re5aMN7/8bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=OLpBqJZQ; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="OLpBqJZQ"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1771939691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hGnpmSuP72iP3Mpd3tbmixxAtPLExRtbVvVRmKvjISE=;
	b=OLpBqJZQF7/XaWL6KzzU18H9phPNdI2U+e8WZoewHy7nXt+GiCEWEiIAmCYp4vh49VXz5j
	5pJc+v65bDbrPsZVxc6A8SJe+5pZxAcTdNhJYmqRVZwbtxm5IF69pcKcO5BHlqMTHF0bP5
	W/UBhj62/qPob45dEmiLQ0RFvR/VHa0=
From: luka.gejak@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <luka.gejak@linux.dev>
Subject: [PATCH 00/21] staging: rtl8723bs: various cleanups
Date: Tue, 24 Feb 2026 14:27:27 +0100
Message-ID: <20260224132748.12336-1-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Luka Gejak <luka.gejak@linux.dev>

Separated OOB bug fix and cleanups to 2 series per Greg's request. No 
logical changes.

Luka Gejak (21):
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
 drivers/staging/rtl8723bs/core/rtw_mlme.c     | 101 ++--
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
 40 files changed, 1351 insertions(+), 669 deletions(-)

-- 
2.53.0

