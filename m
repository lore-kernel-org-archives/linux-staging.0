Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F513A6B6E
	for <linux-staging@lists.linux.dev>; Thu, 26 Mar 2026 20:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774556720; cv=none; b=PkGX5235mPtPN8xrzKY/uVPkHN8hCXviVRkliUgaEwTLZxm3Ebrgx3LmGLEMBk5LI+TzIoj5wMicrU45a7NRXZvl0wUtiabz8AvuCHqG3kCSBl4o2wEzVxV1S0jUQOnmrq+573FOiWBR/0cd/OBBHLeH5YCqtp4V+bWnukRBJi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774556720; c=relaxed/simple;
	bh=5PrBuacSLe1TGRDPnbMUHkXXk8NHA62Oq4jpc052teM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rMk2yGeEYF+iv0t/yjkF8k6ExjcJwv/UtbRpD7bOMemDbHVaeO9pA80lDplAPoR3w47noP/quRas6vNcdrz6sfZbWO5MY8psRsynRtqMdrK2/M3n7Ihsyd7NT/4tzdkO3GUEJ2SE1VtLJgJwVNnmlTUMYRgZZ7eSW0TCgMPKk3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ezH6FsX2; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ezH6FsX2"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3585ec417f6so1118963a91.1
        for <linux-staging@lists.linux.dev>; Thu, 26 Mar 2026 13:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774556718; x=1775161518; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mgKuX7YJ5s4Ru23LmT9a3/9M7caALYJ68gAwJJqCNAA=;
        b=ezH6FsX2UuSvpWEJYOdip0QnYKk2gvXz5eqUxQglrxGYImxA7DyiUTeqaE/qDlZ5Ym
         Zw4stHBMoVr7R5JXnGoPbw1oYA6ZY/NrdwGqXxxcm+g8xNjKrKqiKqQlytI6ZFFhKaYq
         57BP99+GONGiWoLIdPM7jQse30GlWcHJwjNa/P+plPXDQt4KCjs6dclbzvsXn/p/jh4c
         Byo9grtuUjcTBOotArIdNStb2aa14foiipXI6PzwIkaD9U1nImrrAleBWhGPyniOodS/
         44Wjtqk4rjJH6QN3935OZstCd3yPyww+opjW85BuVv3YostTTUosPFeeJTIrPxXDKgR7
         3H0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774556718; x=1775161518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mgKuX7YJ5s4Ru23LmT9a3/9M7caALYJ68gAwJJqCNAA=;
        b=qTztX7IiEakbdWHlIa77ydSvezCt9t0Cd256gSJfc37/mzcMG0u4RD6H0Nc5/1HvGi
         9lkjE+/px4SHNC27j95h7XRJjYV0acCiPLG99VWcYcmZi5dbFsWETaT3UagFJvF+kW+W
         bhIvFsMNNM3vCSi4CkI9y9d8jVhGcpInTgU9EMcHHhF9nrohio+zWfow9vYRS3RcL9yt
         axqUONsbYvWxeuumGnMyoqHRjokGxO/jgOoxmbaT9TE3Ar8FZCxUcETWk0bQexVyCN37
         dzlU6MBd6SriFIoAPaqshERRCsBahtK1uj52y+zArcmidCbSkII/aZ/4KdqKGKtjzwjj
         QK0g==
X-Forwarded-Encrypted: i=1; AJvYcCWWBMbuZuujaKeoM9AlRiqft1940Gj5aWh4UQqFoPoM2V9A9zmiuH4nV877Jo36mf9I4/VNoRxpTEp0SODB@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1DMng2HeCxC8mG1MaiFsWF/vbsopcUT22CBTCcchT04Nud0eu
	/uJYuKp9K/ctmdDuCKgdtSMmJFKgJDBkXVT6W6cH+dSuwQwENeDhHI9x
X-Gm-Gg: ATEYQzzYRhZgaIGqguY6cGMWZhGdj5Oo51Tyu0vJJd9Ole0WIGCrvr0IS5qFpj3TCpJ
	sPcVIAYz+sjwvZXUwBip901SvlUgRfO5+nd9cacvokpdCKCWTRBTncYKOyT+S7wCXRcfxeqTM4M
	ByuHDLngGMKdbTxTE3vtTfAKMYbUm2LSEoheoLkH2BY17yfbhYyAUfNKBBdA7LUogkA+y+vWLDA
	pJP/UMNKuCwa2Ux0HkFQqnH9AvzyZ6Fm1Zm7asqp8S5h32U0FWBSMAifreuGTLMysHeuDwIRsv3
	fii4zurchgCwGFmEFJ5f/W4VVg4zJmKAXenAnEmijoVOg+pManVYz2pkzojvBcCRiAoVNELKOAL
	Y02kNy+JPur+3GVlMTFvIcdSonkt6KX2pOgIywkL4TGLK+3JRsoq1PoXmBBebQMG4kdJiLZaZYV
	RuUNYQSYPqJRjX9T38HP+YFcU=
X-Received: by 2002:a17:903:2405:b0:2b0:62cf:3537 with SMTP id d9443c01a7336-2b0c48328admr27399305ad.6.1774556718061;
        Thu, 26 Mar 2026 13:25:18 -0700 (PDT)
Received: from localhost ([223.233.85.60])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc9176acsm39062045ad.82.2026.03.26.13.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 13:25:17 -0700 (PDT)
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
Subject: [PATCH v5] staging: media: atomisp: pci Move GP_TIMER_BASE to where it is used
Date: Fri, 27 Mar 2026 01:54:58 +0530
Message-ID: <20260326202458.110368-1-anushkabadhe@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GP_TIMER_BASE is only used in gp_timer.c, so there is no need to
define it in system_local.c and declare it as extern in system_local.h.

Move the definition directly into gp_timer.c and remove the extern
declaration from system_local.h, along with its mention in gp_timer.h.

Signed-off-by: Anushka Badhe <anushkabadhe@gmail.com>
---
Thank you so much for your guidance.

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
index d04c179a5ecd..c250a74e7e84 100644
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
+const hrt_address GP_TIMER_BASE = (hrt_address)0x0000000000000600ULL;
 
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

