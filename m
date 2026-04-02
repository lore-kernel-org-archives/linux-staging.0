Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252C3372EED
	for <linux-staging@lists.linux.dev>; Thu,  2 Apr 2026 05:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775108552; cv=none; b=WWEtUCgS8TrUr61eLVIhK3ULWkmFajpS9Bwqipx7g1Dth7EwWd7A+CFqdswSrYZZxmzx+R+ucNchMhTxefIw2ySajNIkcv1xKcMvmECp+Ot87IdKujTsorKIlNT3z7XZ5DTMFiTrLyAhnq8xjENDhBNZuotUHMnu9ZwT5O6DBhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775108552; c=relaxed/simple;
	bh=A6tP9lTv3ItuA0QtZ0YXMbE1cZzTqVH54Ac+P2Dp49E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jAeZ6AjxT1Jrk+NnGh380VYujo3iJSBYB1R2DeZqs8ttWgK5rY+675C+LwifiBi6sWk8iiqAzFAazIXpezHdYRSi15s4/FeIGkPNG5aNLr9Zwr7Ea/Hlm5SkIb9CEnz1L/RLIenenUvpU8TopMJfBpOgVMr82wOUvxMEU2W5pj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mWJ+eME5; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mWJ+eME5"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a12cd0bd79so620090e87.2
        for <linux-staging@lists.linux.dev>; Wed, 01 Apr 2026 22:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775108549; x=1775713349; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nKh1rT3Zcth5m7glxLzGiNCudaFGlwBgJCWMZ0pZt7s=;
        b=mWJ+eME5BNPv5N6OVCs3SZy+chI4q4vuPz0f8hAQIO2RWoCz8SzQtNekoR2wc4dLBf
         145xhey4LQwpyPueuGmi0WY5vkrtejOO6Q9auhFMTtIMggGAGZnkusb+EPrs22kjLA/S
         PoOihF5WakgMV6gz/R5dAQDPV3O+8cGsXC9/sVbYxFh9utiSOIcNBuf/K70LIig4dlG3
         z20xTSVd8ieUxuz/RNWFhic5Wq5ob8K15pL6f7YTMhXQO9QJ7Mo3Gozs8Uy5Adyi3VWK
         HOKCYiDqjb6HDo98wiOBPm2qHmfMJbPPu9m+oPUz5RrR2HR8tkiW0sHDpuKDa09/3Y2L
         /qqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775108549; x=1775713349;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nKh1rT3Zcth5m7glxLzGiNCudaFGlwBgJCWMZ0pZt7s=;
        b=PBhkFVa/6MvRPEI2hRRoyx6pggBNtW8NubNzZ11mYWJ0Hnqdt5+EQznOQfpnCqDXbs
         6ONr6SSojjGQqyM7OXJQITcBMBfyFw8ox5DfrqgMcT9qoRTeGFiSqaDnkHMU/+qz+pxA
         o2LyMdp2i24TtYfUTKNnEcgB5nZUmwPHe/YFZrYkslSIB1cEmyS5wqXgWRuFBP1yETCj
         A2LgRNm1SRiLjIeAFNHuqAhGqQBabvBMJlig2ASmQAEJnIO6cStmJuP7UpWtCe9lxIKv
         zsyUN2EU3GvrksHDeY8LAUEiuROU9udyponsrZm8bOA4PI/TVjsvOwaWFOCxWzFdSBFy
         fuJw==
X-Gm-Message-State: AOJu0Yxu42RKG7vjj1nkFTsA7mArOQdKmtnHcfRjN05a8yXmgIvh+z/F
	kf1RZkg9Q9IN4UucxFmKphMakDMjXB+6KhVOLcXmahFav5Lk+ewpZ5fx/Za61kTV
X-Gm-Gg: ATEYQzwUQy7docKK52hVF8B2xdR2DC4PBnGOH/o6Zg1w6jsHmDOEcNjSJ8PnfmQ+ZJK
	Tgm04c47njHB6q30cYncwMPrI43ckg2ZB+4mdbo6BZXMZLTB7VNr38XrtE/tBm1a6yRcdWX0MC3
	9PHXhrKDBSYMFq/uwONl7CGbhODosd/ZDRiVas1GSrtFCV/X8GqbQywDPLrtNWOW2LzfdbVm8Py
	KK/UXsRSL2rsYfcJv0B4mNOlY1eCTBF7uFWRF9Zx2CkrCW3Za8O1meFHyjd69RqT34ChJTMMBBi
	8HdgdNswQCCpvS+YquWU1fLBxvtZEXQcwWsPwUIQvarCi9OOA23eCpbFfKafI2fZ0+ocxBt2RM1
	QW2zl3cg6ABNnq/eGAUcmocdbDorNB9S5xqBxuUGJ3GAxHUsiRe7yUahnHLHPGZiWp9kDb92fub
	Y0VJYiirA186jfi0UcI09rjQPUptuf
X-Received: by 2002:a05:6512:3190:b0:5a2:a5f6:dfce with SMTP id 2adb3069b0e04-5a2c1eec643mr2329505e87.11.1775108549049;
        Wed, 01 Apr 2026 22:42:29 -0700 (PDT)
Received: from localhost ([2a02:aa1:115f:85c8:99af:b9fd:7f92:d8b4])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cd15f8sm432956e87.69.2026.04.01.22.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 22:42:28 -0700 (PDT)
From: Linus Probert <linus.probert@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Probert <linus.probert@gmail.com>
Subject: [PATCH v5 0/7] staging: rtl8723bs: rename/remove functions
Date: Thu,  2 Apr 2026 07:42:08 +0200
Message-ID: <20260402054215.271981-1-linus.probert@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Renames global functions in rtw_efuse.h (1-5)
Removes a space before tab in efuse.h (6)
Removes two unsued functions in efuse.h (7)

Changes in v5:
	- Reworded subjects in 4 and 6
Changes in v4:
	- Distinct subjects on renaming patches
Changes in v3:
	- Furher split renaming patch into separate patches
Changes in v2:
	- Split patch into series

Linus Probert (7):
  staging: rtl8723bs: rename global function Efuse_CalculateWordCnts
  staging: rtl8723bs: efuse_OneByteRead() -> rtw_efuse_one_byte_read()
  staging: rtl8723bs: rename EFUSE_Read1Byte() to rtw_efuse_read_1_byte()
  staging: rtl8723bs: EFUSE_ShadowMapUpdate -> rtw_efuse_shadow_map_update
  staging: rtl8723bs: rename EFUSE_ShadowRead() to rtw_efuse_shadow_read()
  staging: rtl8723bs: remove two unused function prototypes
  staging: rtl8723bs: remove space before tab

 drivers/staging/rtl8723bs/core/rtw_efuse.c    | 22 ++++++-------
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 33 +++++++++++--------
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  |  2 +-
 drivers/staging/rtl8723bs/include/rtw_efuse.h | 14 ++++----
 4 files changed, 37 insertions(+), 34 deletions(-)

-- 
2.53.0

