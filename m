Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CDAD377ECC
	for <linux-staging@lists.linux.dev>; Sun, 19 Apr 2026 07:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776583271; cv=none; b=Db7n1R6poVM/ds8d9cbwcCAd6zmfROepbUxYeI1Ml4aeNTry7sPtj4b6GFnY1kX/DaMy7rJMeMwOwz9ubvWh+mAkzPw0Jgcv0Ma9v7e+T7FigJaDm1JgiEJkYHb1ybUqWFx3CdkAS0MyXgooza85CLeyfKJo7mwwzIsrvT/1esU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776583271; c=relaxed/simple;
	bh=qXmqvVAokr4PkTJi+d+d6KaTZrPLWgBRKEWQQGVupC4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j0SCTZLQ76z+rCqaseKoz5MpT1h4gnR82WZ4h/cNAZHbalKPIr/1bdMHslHlatNK5i7LrSFVasFqzRvwtIlWgDX0IDP14x5zPBjK6rd1GD8DFwMO2TZ346SjHuK29AK173UkdjOmcZTnbLx5UlPyGppN9jy1k2KcXKHDIXeV9g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BlbfYOpl; arc=none smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BlbfYOpl"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-651c7ddf514so1897552d50.1
        for <linux-staging@lists.linux.dev>; Sun, 19 Apr 2026 00:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776583268; x=1777188068; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H9hHW+ydJzlY1mVAZRQiuItU/2n4lD18W5qFEwl4sZA=;
        b=BlbfYOpleXPGg5Z50y8uAWTqCxJqIU8ZfePfaVkAy7xLA+NHH/hjQ685ir+F1p9OTk
         svqzIW9bbyTwPLAeDWtQMCxEZ6m4Ap35zX8VtjV792N0VdTRewilu+On4yhsJml8bqAk
         V4AFqG4M6Xv2wDAR03P9vwwiQs0LQ9CfSHoQQwnnzF15itvaXxkxkcKR9IccX8ycVh2s
         0xdlxVEsZJTuOSjfF9qf+cWXh+2fN2l/t11HU9n2upsQtRZwlOQq0yAi9Jk1oDeNviWX
         UnrPzvIBcj/8kLFEawupBudm6PqQIXUb8XZglD0X+FSJqPK5cpWV+angMurz7gJ/i+Mz
         Y24g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776583268; x=1777188068;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H9hHW+ydJzlY1mVAZRQiuItU/2n4lD18W5qFEwl4sZA=;
        b=JupSRmR5qZJmWYnxgmg13unwah/+XGugGv2JJO/L+oTVTPKIL/pJpPUgi8ye6qyv9b
         teib+yyvNa460tiV/ZV9opkdC9il+TUle0mjM7hK5GTotK5yUVblcomYDi7sG5OLPJQR
         fYGy5KWIPWn5vku5oH8Gk+zMPPsGpUZlf2PNaB/230H5poBUd4qWDuZdxm+KgqODgg43
         h4HPktH8aOlXSPXGpJk2jK6hVK4eFQL7vW6ja6hg3U6L3N/K//hwgg7jnAiOmUMT4YDc
         pYEGMXCD5huIhHyWWlduuGNsLCKTMb9dC2xK39AwEPxU+fdjdgdPVLSxBY6NXa/f0Ebm
         EJ4A==
X-Gm-Message-State: AOJu0YxSoDV/LceC8Uwd5ZFwHBZO1A/syYLYBi5cp1rWoNXEcT1ECZzu
	nCVIpqC86TtZLLEORPiCF7Dun5vL539nIwNTW+Ux6732glrCXZ9vc/aN
X-Gm-Gg: AeBDiesZZ7Zi+g+9cmHuoD6lYaI5Xfum77Ngk6enbBdey/8WLctu+06LVjkjxI38A4K
	RR0GmAVo/j+qbgKAehEEH0Omooj4vEwWcofzKKZkN2xuiTrZSYopIYdBuYUz7szkN4YG7Xkb2ol
	DIkSXSNXssW1lDQyYzJ4YL1dIrOlIiLphEqxWzLQU08lyIIYGIpPDKxta/mUKenV74DNa2fxaZS
	lx3FXoxBvqlpVvb2iF9dYRJnEPz1oFUhlZdNnl18l3IesZ5IFQLzi2K/FuldFVhxQGIggdb0oRA
	Dp9W71kuLW0ed+Q5WRTkhLCQaV4FxDTS3XMDXC+txdFDhl74o0hS2yNy1lrUvJLukPV/EeryQ7r
	2zsOCIkgxuoPSuF7diZPb03wQv60FmuqfC5vVJu+fiYcQHHVx2kri979tW1zmPPe30UWkmQkeOP
	iG3UTozXRqXgIdGQK2mf+t1bqKxTittf+20y8=
X-Received: by 2002:a05:690e:e8b:b0:654:1261:8ba3 with SMTP id 956f58d0204a3-654126193e2mr4424940d50.17.1776583268264;
        Sun, 19 Apr 2026 00:21:08 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65314ed1150sm3341152d50.18.2026.04.19.00.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 00:21:07 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 00/11] staging: rtl8723bs: cleanup hal/hal_intf.c
Date: Sun, 19 Apr 2026 10:19:26 +0300
Message-ID: <20260419072034.19824-1-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes some wrapper functions from hal/hal_intf.c and
replaces them with direct calls to the wrapped functions. This will
simplify the code and remove an unnecessary abstraction layer above the
hardware.
Also renames several affected functions to snake_case to fix
checkpatch.pl warnings.

Nikolay Kulikov (11):
  staging: rtl8723bs: remove wrapper rtw_hal_chip_configure()
  staging: rtl8723bs: remove wrapper rtw_hal_read_chip_info()
  staging: rtl8723bs: remove wrapper rtw_hal_read_chip_version()
  staging: rtl8723bs: remove wrapper rtw_hal_def_value_init()
  staging: rtl8723bs: remove wrapper rtw_hal_free_data()
  staging: rtl8723bs: remove wrapper rtw_hal_dm_init()
  staging: rtl8723bs: remove wrapper rtw_hal_enable_interrupt()
  staging: rtl8723bs: remove wrapper rtw_hal_disable_interrupt()
  staging: rtl8723bs: rename ReadAdapterInfo8723BS() to snake_case
  staging: rtl8723bs: rename EnableInterrupt8723BSdio() to snake_case
  staging: rtl8723bs: rename DisableInterrupt8723BSdio() to snake_case

 drivers/staging/rtl8723bs/hal/hal_intf.c      | 41 -------------------
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  |  5 +--
 drivers/staging/rtl8723bs/hal/sdio_ops.c      | 36 +++++++---------
 drivers/staging/rtl8723bs/include/hal_intf.h  | 13 ------
 .../staging/rtl8723bs/include/rtl8723b_recv.h |  2 +-
 drivers/staging/rtl8723bs/include/sdio_ops.h  |  4 +-
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   | 10 ++---
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c  | 15 ++++---
 8 files changed, 31 insertions(+), 95 deletions(-)

-- 
2.53.0

