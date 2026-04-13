Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43EF3603D2
	for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 10:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776075321; cv=none; b=up2p7lXmzV4MfHX6axgQWjnkX13M7gqDr2HVxtFhmXedHp6QgZ7vyCRsSLBo26i4kmb621nLekvDqDhYGwdonf5vaXP1Qtu59uwWmRxDKSttOXwnXvUR9ODeQ5HJJoWqc1lAWZuN1sC4awaHi0H4qweT+Ywm62HI5UhIwT2G92c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776075321; c=relaxed/simple;
	bh=U0GxfxhTVDaj7ocHMx8UpmvOnpCBCsbgOTRHncnBmfA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bXXxbgXAVzD5ZjNn9ZLmLbCHgzpwhHfBulZ/waLs8t4uqas79S61U/oLH3drAlWRe2DN9+himxXfeAqnVuySwDS64ik+6DlOzYcsgPDo305K6XCjtRg/WGEmeF5uhZr2OZLr5IvkLnRj0jMDduSApE/RYuxr/hKYClZ1CdkRPMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=hFHvkNEl; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="hFHvkNEl"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776075317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Oxfrcv7JQPZ0ZwuGNt+YW0GApuwJyS77RGU1hhdB4z0=;
	b=hFHvkNElPhWOBmUk459pOZ0kRmOcuJUGnvrRkEK1Pchh23BoWS2xqGIC8v5L8Z+d4CYtqB
	koW8FLxR7nGoNggVxiLmwNzGI85W3KRfAsxf9GKOfPcP9YfqovUOOQsmB2LWOLrTj2YlKf
	9Ky6U9MSOnUelxud+nzRTUyoNs39Kwk=
From: luka.gejak@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <error27@gmail.com>
Subject: [PATCH 00/11] staging: rtl8723bs: coding style cleanups
Date: Mon, 13 Apr 2026 12:14:21 +0200
Message-ID: <20260413101432.158925-1-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Luka Gejak <luka.gejak@linux.dev>

This patch series resolves multiple coding style issues in the 
rtl8723bs driver to adhere to the Linux kernel coding style. The 
changes address various warnings reported by checkpatch.pl across the 
core, hal, and os_dep directories. No functional change intended.

Luka Gejak (11):
  staging: rtl8723bs: core: fix spacing around operators and casts
  staging: rtl8723bs: hal: fix spacing around operators and casts
  staging: rtl8723bs: os_dep: fix spacing around operators
  staging: rtl8723bs: core: align parameters with open parenthesis
  staging: rtl8723bs: hal: align parameters with open parenthesis
  staging: rtl8723bs: os_dep: align parameters with open parenthesis
  staging: rtl8723bs: core: remove blank lines before closing brace
  staging: rtl8723bs: hal: remove blank lines before closing brace
  staging: rtl8723bs: os_dep: remove unnecessary braces
  staging: rtl8723bs: os_dep: remove blank lines before closing braces
  staging: rtl8723bs: hal: remove unnecessary braces

 .../staging/rtl8723bs/core/rtw_ieee80211.c    |   9 +-
 .../staging/rtl8723bs/core/rtw_ioctl_set.c    |  13 +-
 drivers/staging/rtl8723bs/core/rtw_mlme.c     |  20 +-
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 302 +++++++-----------
 drivers/staging/rtl8723bs/core/rtw_recv.c     |  68 +---
 drivers/staging/rtl8723bs/core/rtw_security.c |   7 +-
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c  |   2 +-
 .../staging/rtl8723bs/core/rtw_wlan_util.c    |   2 +-
 drivers/staging/rtl8723bs/core/rtw_xmit.c     |  20 +-
 .../staging/rtl8723bs/hal/HalBtc8723b1Ant.c   |  10 +-
 .../staging/rtl8723bs/hal/HalBtc8723b2Ant.c   | 141 ++++----
 .../staging/rtl8723bs/hal/HalHWImg8723B_RF.c  |  24 +-
 drivers/staging/rtl8723bs/hal/HalPhyRf.c      |  15 +-
 .../staging/rtl8723bs/hal/HalPhyRf_8723B.c    | 194 +++++------
 drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.c  |   6 +-
 drivers/staging/rtl8723bs/hal/hal_btcoex.c    |   9 +-
 drivers/staging/rtl8723bs/hal/hal_com.c       |  25 +-
 .../staging/rtl8723bs/hal/hal_com_phycfg.c    |  38 +--
 drivers/staging/rtl8723bs/hal/hal_intf.c      |   6 +-
 drivers/staging/rtl8723bs/hal/hal_pwr_seq.c   |  32 +-
 drivers/staging/rtl8723bs/hal/hal_sdio.c      |   2 +-
 drivers/staging/rtl8723bs/hal/odm.c           |  32 +-
 .../staging/rtl8723bs/hal/odm_CfoTracking.c   |   4 +-
 drivers/staging/rtl8723bs/hal/odm_DIG.c       |  55 ++--
 .../rtl8723bs/hal/odm_DynamicBBPowerSaving.c  |   9 +-
 drivers/staging/rtl8723bs/hal/odm_HWConfig.c  |  57 ++--
 .../rtl8723bs/hal/odm_RegConfig8723B.c        |   6 +-
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c  |  93 +++---
 drivers/staging/rtl8723bs/hal/rtl8723b_dm.c   |   7 +-
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 260 +++++++--------
 .../staging/rtl8723bs/hal/rtl8723b_phycfg.c   |  54 ++--
 .../staging/rtl8723bs/hal/rtl8723b_rf6052.c   |   3 -
 .../staging/rtl8723bs/hal/rtl8723bs_recv.c    |   8 +-
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    |  15 +-
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  |   8 +-
 drivers/staging/rtl8723bs/hal/sdio_ops.c      |   1 -
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c |  12 +-
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c  |   5 +-
 drivers/staging/rtl8723bs/os_dep/wifi_regd.c  |   2 +-
 39 files changed, 661 insertions(+), 915 deletions(-)

-- 
2.53.0

