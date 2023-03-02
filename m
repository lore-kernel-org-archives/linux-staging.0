Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0898810FA
	for <linux-staging@lists.linux.dev>; Thu,  2 Mar 2023 19:15:01 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id s26so1080076edw.11
        for <linux-staging@lists.linux.dev>; Thu, 02 Mar 2023 11:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677784500;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4YofVDSHg39nKsEEw4I8NJ9sshTvgvGYTyuR7oI/AtQ=;
        b=MoN/izdYZ/m18s5sMhtfvE1gFU8FB8lhQyZqH8Mq0zsJGvdgQYLjjjUOmaM3LF70MC
         /McQoxYeGzdQFF8uamMR6lzCFPowuRfRbYgtdREHgzFv9syhjF6b5KJJey4A2gf3Q60J
         /CxegrI/e8tctswNCqS1JIoTrS18tauyLrEcAs0kMPrIOox6jdgHXmFgAlBz+TNAjOL9
         fA8DluK2YXL3vIY62VqLBV10+CTxLXCkAu+wzaX+HPi+mXwIR6EEciSVhfx/84h9HiFO
         WzdTHiAF0zQzoV3+YeVwWajqbdFYbUuWdDUVJHlAC8FqCmmGRCUiBQjAkkwplMRprDQq
         ukeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677784500;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4YofVDSHg39nKsEEw4I8NJ9sshTvgvGYTyuR7oI/AtQ=;
        b=fjm4UTNxA8X92D7Y7ZXBFSU2T1Po9WZn5Kq0QuNWK3zzB3lNc5LxDVGd/ILoCRT0XG
         6pPL4OqEAB6mPbSibsvxjH9NTNZCMm/2fhfktaJeTUuS23kmHCNiHgtDwb79dLtp87md
         qqAvpC8vhv6G9RUkJIY/SwrtHK4AEQbopRmOueSyW8nmSVrBuV08Ca9ECcFbkMx3ChnJ
         /1AaD7HNoTow0GxhdajDyfuUTwxz1ED/LqZKnMSaK1oMsGpPOrGtIIfQbeq+89IXY8T1
         8ZDIHso09X6Od8RO3iFOVJmxtXPt684yaSdldQXqtym5/zTGDkb9+QC7GEgbqna3yC/a
         iSSQ==
X-Gm-Message-State: AO0yUKWtz5l87msPIHSIOehrWKTwDCw4hYKVMOBCI2M7mxiwxMZWXC2X
	S2rSRoXY2PB0BFSeoA4P7Nc=
X-Google-Smtp-Source: AK7set+kEPeDeoCt7o2283sE86Jz+CpdYPGMtxKWrpeSiMFaldSqXJNzauM4RX2E957AjG8M954YCA==
X-Received: by 2002:a05:6402:524f:b0:4bc:235c:dcb8 with SMTP id t15-20020a056402524f00b004bc235cdcb8mr8179330edd.1.1677784500093;
        Thu, 02 Mar 2023 11:15:00 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id o26-20020a50c29a000000b004ac54d4da22sm227961edf.71.2023.03.02.11.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 11:14:59 -0800 (PST)
Date: Thu, 2 Mar 2023 20:14:57 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8192e: Change filename r8192E_hwimg.x to table.x
Message-ID: <20230302191457.GA17628@matrix-ESPRIMO-P710>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Change r8192E_hwimg.c to table.c and r8192E_hwimg.h to table.h to adapt
filenames from drivers/net/wireless/realtek/rtlwifi rtl8192ee and
rtl8192se. Task is from TODO file.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
Did check MAINTAINERS for update: Not required

Tested with rtl8192e
Transferred this patch over wlan connection of rtl8192e
---
 drivers/staging/rtl8192e/rtl8192e/Makefile                    | 2 +-
 drivers/staging/rtl8192e/rtl8192e/r8192E_firmware.c           | 2 +-
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c                | 2 +-
 drivers/staging/rtl8192e/rtl8192e/{r8192E_hwimg.c => table.c} | 2 +-
 drivers/staging/rtl8192e/rtl8192e/{r8192E_hwimg.h => table.h} | 0
 5 files changed, 4 insertions(+), 4 deletions(-)
 rename drivers/staging/rtl8192e/rtl8192e/{r8192E_hwimg.c => table.c} (99%)
 rename drivers/staging/rtl8192e/rtl8192e/{r8192E_hwimg.h => table.h} (100%)

diff --git a/drivers/staging/rtl8192e/rtl8192e/Makefile b/drivers/staging/rtl8192e/rtl8192e/Makefile
index 75e6ec510555..a442d79ea71e 100644
--- a/drivers/staging/rtl8192e/rtl8192e/Makefile
+++ b/drivers/staging/rtl8192e/rtl8192e/Makefile
@@ -4,7 +4,7 @@ r8192e_pci-objs :=		\
 	r8192E_phy.o		\
 	r8192E_firmware.o	\
 	r8192E_cmdpkt.o		\
-	r8192E_hwimg.o		\
+	table.o			\
 	r8190P_rtl8256.o	\
 	rtl_cam.o		\
 	rtl_core.o		\
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_firmware.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_firmware.c
index b011ec8c8a41..ddf998cf2041 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_firmware.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_firmware.c
@@ -6,7 +6,7 @@
  */
 #include "rtl_core.h"
 #include "r8192E_hw.h"
-#include "r8192E_hwimg.h"
+#include "table.h"
 #include "r8192E_firmware.h"
 #include "r8192E_cmdpkt.h"
 #include <linux/firmware.h>
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index c6cbdea6d5b2..6388f1220575 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -12,7 +12,7 @@
 #include "r8192E_phy.h"
 #include "rtl_dm.h"
 
-#include "r8192E_hwimg.h"
+#include "table.h"
 
 static u32 RF_CHANNEL_TABLE_ZEBRA[] = {
 	0,
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_hwimg.c b/drivers/staging/rtl8192e/rtl8192e/table.c
similarity index 99%
rename from drivers/staging/rtl8192e/rtl8192e/r8192E_hwimg.c
rename to drivers/staging/rtl8192e/rtl8192e/table.c
index e6fce749e65b..1f80dbeb17b5 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_hwimg.c
+++ b/drivers/staging/rtl8192e/rtl8192e/table.c
@@ -4,7 +4,7 @@
  *
  * Contact Information: wlanfae <wlanfae@realtek.com>
  */
-#include "r8192E_hwimg.h"
+#include "table.h"
 
 u32 Rtl8192PciEPHY_REGArray[PHY_REGArrayLengthPciE] = {0x0,};
 
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_hwimg.h b/drivers/staging/rtl8192e/rtl8192e/table.h
similarity index 100%
rename from drivers/staging/rtl8192e/rtl8192e/r8192E_hwimg.h
rename to drivers/staging/rtl8192e/rtl8192e/table.h
-- 
2.39.2

