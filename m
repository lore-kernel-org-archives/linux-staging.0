Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002001A6803
	for <linux-staging@lists.linux.dev>; Sat, 11 Apr 2026 03:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775879772; cv=none; b=lt+kA1Rif7xxs/UtwBhgNydgot4ti7syAa0vvhfK7AiENWhNCtanjIU0vpQQP6bu4/jP1wqTviOztx8diz4PQi+CSOxFZvnHvHYMMOeMisn1gihxMeZKA0cHES7oxYDTQ2IE19DMDxcYwE5kwbl0GuDYE86XOhFZjYlFAFIBZLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775879772; c=relaxed/simple;
	bh=MgVDj4ULt1T5DQnzLKMZkbmPNPvcBGTbNqBWfhZYSDY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OBCIyM6/w5BUHTAPuY9dsIhzyE/7r3JdRot4haI9m1JzXKSPVP81EIR7sfz66gDH+QG1v8v5HXcLy97ohLMpYW3iHtJG1PuaYvyDlZ3SChz2okxjw6tWWWB9Zdy+rLomSkKerQA55ccrEjMd9TRf1/SFqT6m507/wqdgjZGadn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SbKKiD2c; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SbKKiD2c"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-82a7539851fso1338637b3a.1
        for <linux-staging@lists.linux.dev>; Fri, 10 Apr 2026 20:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775879770; x=1776484570; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G1n7KOoJZGpaYTzvG/RopSszhXnS++RqFTKLkwGKtJk=;
        b=SbKKiD2c0MJaeGUv+uBMVbOWkXnH7MzwRbkIGWydEvwnl7v/PDvUwRnll3LEE6G0yY
         U9ivDcXKPtIZcPXOxTKRJ24h36X7J46g0FBuxp45JmrUiD0MIKU1Ko8Xv7jkpYTtAO7K
         tyzIYGQZ9Hw1iH35nSaBcMUVYFo3eQo40jMiTxC8JXL65txlPs5uqNPpV2iYYkCAfdfN
         ywfhADVgPJifi0oBJAAhW+hvR0bR/9kDM7TO+vFWscv5vSfGQsxNEVQ4HQzZKqpOoUru
         GrCPM8RY6/Y1vhlYF/RnxfwbNo8DUREdvjNQibBNrMFON6P/f626FT2uOSMXeFY0tGki
         Z8QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775879770; x=1776484570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G1n7KOoJZGpaYTzvG/RopSszhXnS++RqFTKLkwGKtJk=;
        b=RJujuADr1g5J5OK+beJqcjZaXZLk+ggGCK4vSaaA/3RyI7xkHlVkd0LsivncpNd/HT
         WpLCsWpCOf5pU90fCaj5XLnGtQM3//Z3t0LCWNOrtt2p26PFyqJBn3nYXU0HUOHsyuex
         t+iM4vfDg7vLxvx61VbKqhVPHqvCyc1ywdkaUsf+nwg/acIlZxRCi6cfMc31QuSvrmwR
         zSHLHyJlwVU5M6l7A8MR5HqKmY2qvSS4k62ZtVgNSvsjPuKFRmA1hFkWnFtC6Iyc0KQA
         NHC3r15Ra87GnUrsYAKcfzniyIhXMTDEaXNN6cu0wGu/e0SyQSu/51GU5cRhl0cWBV3/
         iFKg==
X-Gm-Message-State: AOJu0YyZ1SYd5ysszLDXaKEiIyVPPxciSZbWIMU66IZAjKiKdW2Dde6s
	tmoBrxFGcSedTDCwE70SAFWEOQPQ6eBj7x1gn744X7R+5QJ+J/N1/4jz
X-Gm-Gg: AeBDievK/pW3/8D3DhgHddV2dRU/4mVSgLBWihyRx1VPda7sG8b68J6liYuady4HIW8
	43kfQBiUM1xvH4yyHcGnEbqUn9AhNMLC4104kIw3G/acG/UYBklRw482sB3wQzinuppvRuZlO57
	fv8zZAYzg9hLThyNN2349CDx4HgTndPn3dxz5v9stjybLPn4vg00cIO/N6qt6wv8xLISzX50bS6
	E0g0WFD3xFxx7R+KseLUSplM2a6smySeCHFoFeqKG+VaY1Ke+uVI8xzjYy08VKWG1CbHG9QxLsF
	fXtOHo24jKGyyV+oYert9KFr0Ead/K5Xnwom9MBzjliSFJOmBi3+cEpum096qvqaSBOPVsVEK1s
	4gCMlt/4I8kx6f7T+RLT5QKOEFEWFI4/qR3ERFUQ8jkmMpvN84ONKDR0Hpk3rqcVMepsXB4gDsP
	01epLlFJurZYfcaPbgne2xGK5wJv3vIna+hOY0OrSCSw==
X-Received: by 2002:a05:6a00:ab85:b0:82a:650c:1630 with SMTP id d2e1a72fcca58-82f0c35e620mr5478593b3a.52.1775879770317;
        Fri, 10 Apr 2026 20:56:10 -0700 (PDT)
Received: from localhost.localdomain ([222.254.206.81])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c30e7besm4267840b3a.5.2026.04.10.20.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 20:56:09 -0700 (PDT)
From: Nguyen Duc Thinh <ducthinh100812@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ducthinh100812@gmail.com
Subject: [PATCH 0/1] staging: rtl8723bs: verify boolean and logics and rename dot11AuthAlgrthm
Date: Sat, 11 Apr 2026 10:53:02 +0700
Message-ID: <20260411035303.859-1-ducthinh100812@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series cleans up the rtl8723bs driver by renaming the CamelCase variable dot11AuthAlgrthm to dot11_auth_algrthm and refactoring boolean comparisons to follow Linux coding standards. Both changes were verified by building individual object files and running checkpatch.pl.

Nguyen Duc Thinh (1):
  staging: rtl8723bs: verify boolean and logics and rename
    dot11AuthAlgrthm

 drivers/staging/rtl8723bs/core/rtw_ap.c       | 28 ++++----
 drivers/staging/rtl8723bs/core/rtw_btcoex.c   |  2 +-
 .../staging/rtl8723bs/core/rtw_ieee80211.c    |  2 +-
 .../staging/rtl8723bs/core/rtw_ioctl_set.c    | 40 +++++------
 drivers/staging/rtl8723bs/core/rtw_mlme.c     | 16 ++---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 22 +++---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  |  2 +-
 drivers/staging/rtl8723bs/core/rtw_recv.c     | 70 +++++++++----------
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c  |  2 +-
 .../staging/rtl8723bs/core/rtw_wlan_util.c    |  8 +--
 drivers/staging/rtl8723bs/core/rtw_xmit.c     | 36 +++++-----
 drivers/staging/rtl8723bs/hal/hal_com.c       |  2 +-
 drivers/staging/rtl8723bs/include/rtw_mlme.h  | 12 ++--
 .../staging/rtl8723bs/include/rtw_security.h  | 14 ++--
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 32 ++++-----
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   |  2 +-
 16 files changed, 145 insertions(+), 145 deletions(-)

-- 
2.47.3

