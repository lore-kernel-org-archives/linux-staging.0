Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D48D35D604
	for <linux-staging@lists.linux.dev>; Fri, 27 Mar 2026 03:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774581103; cv=none; b=fdFobcyID1XwKrozAecXJIfMrUotJlsYezI6xchMRt3Frsm6XfWLGmfe3N2vQMrdM4zq3/TLymn0eOtIj/DCQpjCbHLU6TwjrFbfm/oWTGDToVx8MXgojsh9a+G5IJKVMzCH0tTD51YMSt7NAI3Sa5HNhdQ9EvulpFuNeq93lpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774581103; c=relaxed/simple;
	bh=QkjwDNLU1ABX0Ft705q7KqAb5BCgK3MbUdDxV0HZ7+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MVxyyvy5O8hOcic6O9CQjfqt+ud3oeHbWXLkNql1dy0nG+ZT+NP2PxJJmoLYHU+6xYiTDuBBiTa5HmiHI6xjrbCbIiR9us9rN9/6oMTHrGj+IBY/sIvtY/oYlRZT9L38EeBdG01QsuoiYO1bdPXgcg9/Sms31SRf4DRPY+vw0bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HoFg0ane; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HoFg0ane"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-35b88a4f123so936055a91.1
        for <linux-staging@lists.linux.dev>; Thu, 26 Mar 2026 20:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774581101; x=1775185901; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Gn8u2bV5RkBbQyfrHGQqH64e/HJb6NIZaM30XiYhXM0=;
        b=HoFg0aneVMah0Y9HMyUhKEeyb14zP7CVT6/7RuF0bKtQx2hKU+AQ9u1odY/uZBlBwW
         LhtIzIilbiuXq7/672H3ciOZ7DfISmgvKqwFlv7KaVfdjZIJ4MYlL4VX9tOEHHa6ijdS
         DXp7FOaiUycTt6rxD1tLaUEe4iWRzQanyZLLIWlBiT1mj52vIieKOYGarbnl7e5q2o4m
         h/Vt0apgpenKABkPIu02aGIsmDTSit84qbYlSgyR7Qg1nGpLaUNfufaZYPfqkjoMFMII
         ui7EBnIH/E7tcfxdsH3hTFubx75ePHi52l8ugDezg0gEVIs3K2H7gRvddfRggHpaxd5p
         lgag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774581101; x=1775185901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gn8u2bV5RkBbQyfrHGQqH64e/HJb6NIZaM30XiYhXM0=;
        b=RzoEEQE8bCax3a5TD/Y4RX5IgISssfLFDkfBRatJ8bU8U95mKJvLNbvPipdz9mo2jV
         kWpSr3HiFMweFcj1pAQ2ynblesh2o6fdBk/zPQDiY+ypn4dw1VCWWbdsCIlcZzW+w2+Z
         Iz5dDcCJgi3SAElRtv8uDH9s6b758dxTLgZNEAEUKSOnom701+b+QhmFyFziK573Dxtj
         BXDx011ZaKUbBjpX8q5eMqDeTQb0vycNiEgSCGy7xQaMcx2GlK6Lxb0A2+8TzkiExHa0
         nwXwoPCg5OkpDPAjviFvLg6j+n0HmAKPA86nbU0R11G0O0rn+6x0fuYUZA+glyANpxHK
         +J3w==
X-Forwarded-Encrypted: i=1; AJvYcCUxGAtlZO2KpaCZH1Opl9eIylX9wsVN1NkBuNJ4Mj1OAE9WCiwSANo7iI5k2+HDns3+O7IViFwrtaJ+hHJW@lists.linux.dev
X-Gm-Message-State: AOJu0YyEbCtf4RDipPPxz1FclSt4RG+0NNN8PLjafh4g+pYMiq/Cd1KJ
	8o/XVTu7sLkOC9NbwL/Dr8bHMGqDIKMO4XPvnHvRi63lGo3xEdiQDEKx
X-Gm-Gg: ATEYQzz7RbfqGOQnQK8pDN+jDi4GlxmpKTkwy5twRy2XoVfIhVQxld6TfVlWuBVqRwp
	yYgiXw7SMXLPlP8SDihtLhK2WVC6h6qd1Rwg+0ps8QVTtF4wf3fWo8ZvegnQNxDWvOJu4+tkgFC
	QVcF0DDcR78wj8RSatMP/ioQ6TfugcdyCYXQI8uh1yiOhmGFzzeuTmu/xXn995Ov5WgC5tAXT0R
	mRNMUFp2k0gRRlzBigioVy37JqeL/nXOrxxIMW1PexqHKzeWa5KyKMUEm+W5SjQ59H29SxI7wU4
	UecjnMBJuX50ogJOOBvDtdtj6IgRCexLNqyu/J35ZtVazLa/JCmnxA61js25xNK6lydvZY41jZ6
	654aqCD3QAsLXck1DI9TFSFwz/rMNFvyUdE+Z2sJsjNYjzuZf6Apuw9BVO3RBtRUd3M9SZ9vcDA
	s1soPqrKD1kdqavkxC4KKPP0I=
X-Received: by 2002:a17:90b:510f:b0:35b:a0f0:8327 with SMTP id 98e67ed59e1d1-35c30b82d44mr675549a91.2.1774581101418;
        Thu, 26 Mar 2026 20:11:41 -0700 (PDT)
Received: from localhost ([223.233.85.60])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c22a4c364sm4023189a91.3.2026.03.26.20.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 20:11:41 -0700 (PDT)
From: Anushka Badhe <anushkabadhe@gmail.com>
To: andriy.shevchenko@intel.com
Cc: andy@kernel.org,
	anushkabadhe@gmail.com,
	gregkh@linuxfoundation.org,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Subject: [PATCH v6] staging: media: atomisp: fix GP_TIMER_BASE scope in gp_timer.c
Date: Fri, 27 Mar 2026 08:41:06 +0530
Message-ID: <20260327031106.10386-1-anushkabadhe@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GP_TIMER_BASE is only used in gp_timer.c and it does not need to be
globally visible.

Move its declaration from system_local.c to gp_timer.c and make it file
local by marking it static. Remove external declaration from system_local.h
and its usage in gp_timer.h

This fixes a sparse warning about global visibility and cleans up
unnecessary global exposure.

Signed-off-by: Anushka Badhe <anushkabadhe@gmail.com>
---
Changes in v6:
- Mark scope of GP_TIMER_BASE static

 Changes in v5:
- Move GP_TIMER_BASE definition to gp_timer.c
- Remove extern from system_local.h
- Remove include of system_local.h from gp_timer.h

Changes in v4:
- Remove unrelated block comment style fixes

Changes in v3:
- Add commit description
- Fix subject prefix to staging: media: atomisp:

Changes in v2:
- Fix block comment style (move closing */ to its own line)
- Merge split GP_TIMER_BASE declaration onto a single line

Note:
* This patch is part of the GSoC2026 application process for device tree
binding
s conversions
* https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings

 .../media/atomisp/pci/hive_isp_css_common/host/gp_timer.c  | 7 ++++++-
 .../media/atomisp/pci/hive_isp_css_include/gp_timer.h      | 1 -
 drivers/staging/media/atomisp/pci/system_local.c           | 6 ------
 drivers/staging/media/atomisp/pci/system_local.h           | 5 -----
 4 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gp_timer.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gp_timer.c
index d04c179a5ecd..0c1b67988dd9 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gp_timer.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gp_timer.c
@@ -11,7 +11,12 @@
 #ifndef __INLINE_GP_TIMER__
 #include "gp_timer_private.h"  /*device_access.h*/
 #endif /* __INLINE_GP_TIMER__ */
-#include "system_local.h"
+
+/*GP TIMER , all timer registers are inter-twined,
+ * so, having multiple base addresses for
+ * different timers does not help
+ */
+static const hrt_address GP_TIMER_BASE = (hrt_address)0x0000000000000600ULL;
 
 /* FIXME: not sure if reg_load(), reg_store() should be API.
  */
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/gp_timer.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/gp_timer.h
index 94f81af70007..e651d9ef1114 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/gp_timer.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/gp_timer.h
@@ -21,7 +21,6 @@
  *	- local:   system and cell specific constants and identifiers
  */
 
-#include "system_local.h"    /*GP_TIMER_BASE address */
 #include "gp_timer_local.h"  /*GP_TIMER register offsets */
 
 #ifndef __INLINE_GP_TIMER__
diff --git a/drivers/staging/media/atomisp/pci/system_local.c b/drivers/staging/media/atomisp/pci/system_local.c
index a8a93760d5b1..8d4fd80f8984 100644
--- a/drivers/staging/media/atomisp/pci/system_local.c
+++ b/drivers/staging/media/atomisp/pci/system_local.c
@@ -83,12 +83,6 @@ const hrt_address GP_DEVICE_BASE[N_GP_DEVICE_ID] = {
 	0x0000000000000000ULL
 };
 
-/*GP TIMER , all timer registers are inter-twined,
- * so, having multiple base addresses for
- * different timers does not help*/
-const hrt_address GP_TIMER_BASE =
-    (hrt_address)0x0000000000000600ULL;
-
 /* GPIO */
 const hrt_address GPIO_BASE[N_GPIO_ID] = {
 	0x0000000000000400ULL
diff --git a/drivers/staging/media/atomisp/pci/system_local.h b/drivers/staging/media/atomisp/pci/system_local.h
index 970f4ef990ec..2bd46f5123fb 100644
--- a/drivers/staging/media/atomisp/pci/system_local.h
+++ b/drivers/staging/media/atomisp/pci/system_local.h
@@ -53,11 +53,6 @@ extern const hrt_address FIFO_MONITOR_BASE[N_FIFO_MONITOR_ID];
 /* GP_DEVICE (single base for all separate GP_REG instances) */
 extern const hrt_address GP_DEVICE_BASE[N_GP_DEVICE_ID];
 
-/*GP TIMER , all timer registers are inter-twined,
- * so, having multiple base addresses for
- * different timers does not help*/
-extern const hrt_address GP_TIMER_BASE;
-
 /* GPIO */
 extern const hrt_address GPIO_BASE[N_GPIO_ID];
 
-- 
2.43.0

