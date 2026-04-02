Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0CA83EF651
	for <linux-staging@lists.linux.dev>; Thu,  2 Apr 2026 15:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775142295; cv=none; b=a+lM7CffjQ2BChR/IZphf1wODNkCFZJglrmGBcPUpxDbVJJPN0eXRCIvDrZDrw58PhyMo9UEH+xkuf1r6kyglGxL725ykWznGaAqmhouRzUzCxVfr/BGAiYG5KpN+xImX8i5Bdfk2lFsqk17mevQGLqcNnco1KBCNweX7CBGoLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775142295; c=relaxed/simple;
	bh=kgNGiuzLQOpWtEBhVz3R+QHX0Ty2Q6cdFSkEmDMLfl4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M0oA5CbEcAGgQ9WW0/1VKhcJR2phQnG/Q1DWRQCq0vIKEcdSYI/qx+de/hgNqF6esKAs9GGVG63x487Ts99bjv0f19yjWQmbWjwqM/K64YYwoGx5+lPTfLvNR/8g5DCvKAspbqcEEc4DB/K+uLSIfr0Pn2ZQlA9G1emiqJ7XVh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=R+uqZSkw; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="R+uqZSkw"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4fmlWb5rrrz9tZF;
	Thu,  2 Apr 2026 17:04:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1775142284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=W6FmKdwT2QGqKPBzZ53d7qjoUD8i2Z7RIDIwjYrOfdg=;
	b=R+uqZSkwUxxnOPxEDsMU30YEWPqu/jhBHkT3qB328UcugZgkEb3Z9duAS7DkDRbj2RKQHc
	Si2mVJj/9UybvBNfvgBYRsEDAgMDI8qIhrd/+QFOhG4wDAqKsMmwnJiUQmZnP0I17+UhoM
	Pt+YtR8atbkiQ56Iq4cuEVh4WkgM5CqG/LIPkxW4cpqKoqTroLDf5DIwkSBRC0CgDLcbM1
	EP6kFR4DsNWfCBGRBk6PJOGcT2M+uaIJ5xQCBnfDhkqxx/I2A8hD1jPHwDsIbQWqeFDLln
	zUAykFsi8t16uF+UkYO90F/LmGjcGHAOSpKRKaQZ6GXsxSILNDGlC/29FPIqZA==
From: Andrei Khomenkov <khomenkov@mailbox.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	linux-staging@lists.linux.dev
Subject: [PATCH v3 0/6] staging: rtl8723bs: cleanup code and style
Date: Thu,  2 Apr 2026 18:04:23 +0300
Message-ID: <20260402150429.14761-1-khomenkov@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 9250ecf6f1b7ccc2867
X-MBO-RS-META: xfszo4ztdp14z8nuzfszxxyxkgq6cw5d

This series of patches cleans up the rtl8723bs driver code to improve
readability and better aligns with the Linux kernel coding style.
The first three patches simplify boolean comparisons, and the next
three perform general code cleanup.

I figured I needed to split the changes into directories, so I did
that. I also think each commit should do only one thing, so in the
last three commits, I fixed the style that wasn't related to the
logical changes with ' == true' and ' == false' that were in the first
three commits. However, if both the logic and the style need to be
fixed in the same commit, let me know, and I'll make v4.

Link: https://lore.kernel.org/linux-staging/20260330184640.17795-1-khomenkov@mailbox.org/

v3:
 - Split the commits into even more commits, each commit
   affecting one driver directory.

v2:
 - Split the single patch into a two-patch series to separate 
   logical changes, as suggested by Luka Gejak.
 - Cleaned up additional boolean comparisons found using 'git grep'.

Andrei Khomenkov (6):
  staging: rtl8723bs: core: simplify boolean comparisons
  staging: rtl8723bs: hal: simplify boolean comparisons
  staging: rtl8723bs: os_dep: simplify boolean comparisons
  staging: rtl8723bs: core: style cleanup
  staging: rtl8723bs: hal: style cleanup
  staging: rtl8723bs: os_dep: style cleanup

 drivers/staging/rtl8723bs/core/rtw_ap.c       |  2 +-
 drivers/staging/rtl8723bs/core/rtw_btcoex.c   |  4 +-
 drivers/staging/rtl8723bs/core/rtw_cmd.c      |  2 +-
 .../staging/rtl8723bs/core/rtw_ieee80211.c    |  2 +-
 .../staging/rtl8723bs/core/rtw_ioctl_set.c    | 54 ++++++------
 drivers/staging/rtl8723bs/core/rtw_mlme.c     | 17 ++--
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 16 ++--
 drivers/staging/rtl8723bs/core/rtw_recv.c     | 83 +++++++++----------
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c  |  2 +-
 .../staging/rtl8723bs/core/rtw_wlan_util.c    | 18 ++--
 drivers/staging/rtl8723bs/core/rtw_xmit.c     | 37 +++++----
 drivers/staging/rtl8723bs/hal/hal_btcoex.c    | 10 +--
 drivers/staging/rtl8723bs/hal/hal_com.c       |  4 +-
 .../staging/rtl8723bs/hal/hal_com_phycfg.c    |  4 +-
 drivers/staging/rtl8723bs/hal/hal_intf.c      |  4 +-
 drivers/staging/rtl8723bs/hal/odm.c           | 13 ++-
 .../staging/rtl8723bs/hal/odm_CfoTracking.c   |  2 +-
 drivers/staging/rtl8723bs/hal/odm_DIG.c       | 32 ++++---
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c  |  2 +-
 drivers/staging/rtl8723bs/hal/rtl8723b_dm.c   | 14 ++--
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 13 +--
 .../staging/rtl8723bs/hal/rtl8723bs_recv.c    |  2 +-
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    |  8 +-
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  |  6 +-
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 54 ++++++------
 .../staging/rtl8723bs/os_dep/sdio_ops_linux.c |  4 +-
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c |  2 +-
 27 files changed, 200 insertions(+), 211 deletions(-)

-- 
2.53.0

