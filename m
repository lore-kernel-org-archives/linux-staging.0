Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E6223A9
	for <linux-staging@lists.linux.dev>; Sun,  6 Nov 2022 08:31:30 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id u6so8524460plq.12
        for <linux-staging@lists.linux.dev>; Sun, 06 Nov 2022 01:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OnBAG5nSkYnNoSht4YTz5XeCkVWk1xhgWCiV2ObcvEs=;
        b=NY/OeZJrY0dPGvAIRlIVITH4axqCzhsWL9AY8PGa+sTiGm+hmKKtA/8rE1VtfBf8pQ
         Yn1zgIrroe9yi1x6hlaq2GgV7G4yN7jdvDXla3IIJN6MekuGDJAWoRUdOVSuEoRVlVXs
         Z+0zll77sxTpq5BOrv0LtR4oXxygAre+Eau1V+l+bZ9WSWk492GnEukpeCqImkmupnQ6
         pP8wTtp9BDClO2PNfbvLY/vN+HbyzfcCwP4j089pa99StN40bAISPsufi1VgrX18cZ9z
         z+FJhBLIMR05J1l7xPKLPSxSF/EG2dMGQO1aIkGYAwd5/bZKM3noZKd3sivTwBHN22R8
         PQTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OnBAG5nSkYnNoSht4YTz5XeCkVWk1xhgWCiV2ObcvEs=;
        b=M+ieAqKpRXIhJJkhEvULvU4kPN5wjmA3bzzeiNFKs302rnaTlih6HMlYjcEhz66yPo
         JLVTSKpKQ/DOve4py9HUvx+ssJI5ZH2R/ZAMOG5FOal9Ol0Y6xLtwzX9zy5URczqByms
         sOtrVtOPS3PHlC9VjiWt3IjsfIvbiE/c6c4lAAFXNXAJKEqh02+9WLduSyQhlJ7I0tLO
         MTcOaDd8CcXoGYMc5SaclADMnKvVnoMO2hCs4lppOVJnvAGPWsNM0RwOFlRsz7z4MJX+
         9BcMWaTV/Mi7aljiloGucyQwOcLvnCm9TErZhJIEhreo6h9XdTf636w/x+mlLHnH1DYG
         ESRA==
X-Gm-Message-State: ACrzQf0o8ElY/Pupk5g8/zF3vCsx7o0el8x2U7AQQ0T8g5FEUW6bCKvQ
	92LY807hseDzEXUIJIXYnqk=
X-Google-Smtp-Source: AMsMyM5DnKs6AIk9o8e8CChur8uCEzr2rQEt6v430n+tY8wGMYst68JIO9Ogj+T4oGA0jQVKdBM70Q==
X-Received: by 2002:a17:90a:64c3:b0:212:d67d:a034 with SMTP id i3-20020a17090a64c300b00212d67da034mr63034129pjm.55.1667723490161;
        Sun, 06 Nov 2022 01:31:30 -0700 (PDT)
Received: from jacob-Ubuntu (126.224.215.218.sta.wbroadband.net.au. [218.215.224.126])
        by smtp.gmail.com with ESMTPSA id u14-20020a170903124e00b0018693643504sm2766839plh.40.2022.11.06.01.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 01:31:29 -0700 (PDT)
From: Jacob Bai <jacob.bai.au@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/3] staging: rtl8192e: rename r8192E_hwimg.c/h to table.c/h
Date: Sun,  6 Nov 2022 19:31:17 +1100
Message-Id: <9bb563727915e3f3edd863837608336b99564462.1667723306.git.jacob.bai.au@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1667723306.git.jacob.bai.au@gmail.com>
References: <cover.1667723306.git.jacob.bai.au@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Same as other rtlwifi drivers, use table.c/h.

Signed-off-by: Jacob Bai <jacob.bai.au@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/Makefile                    | 2 +-
 drivers/staging/rtl8192e/rtl8192e/r8192E_firmware.c           | 2 +-
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c                | 2 +-
 drivers/staging/rtl8192e/rtl8192e/{r8192E_hwimg.c => table.c} | 2 +-
 drivers/staging/rtl8192e/rtl8192e/{r8192E_hwimg.h => table.h} | 4 ++--
 5 files changed, 6 insertions(+), 6 deletions(-)
 rename drivers/staging/rtl8192e/rtl8192e/{r8192E_hwimg.c => table.c} (99%)
 rename drivers/staging/rtl8192e/rtl8192e/{r8192E_hwimg.h => table.h} (94%)

diff --git a/drivers/staging/rtl8192e/rtl8192e/Makefile b/drivers/staging/rtl8192e/rtl8192e/Makefile
index 75e6ec510555..334d92efd4ba 100644
--- a/drivers/staging/rtl8192e/rtl8192e/Makefile
+++ b/drivers/staging/rtl8192e/rtl8192e/Makefile
@@ -4,7 +4,7 @@ r8192e_pci-objs :=		\
 	r8192E_phy.o		\
 	r8192E_firmware.o	\
 	r8192E_cmdpkt.o		\
-	r8192E_hwimg.o		\
+	table.o		\
 	r8190P_rtl8256.o	\
 	rtl_cam.o		\
 	rtl_core.o		\
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_firmware.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_firmware.c
index 789d288d7503..45819f2f2a37 100644
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
index 58da2dab55bd..eabb4187d907 100644
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
index 8920283f340e..2e75f40db874 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_hwimg.c
+++ b/drivers/staging/rtl8192e/rtl8192e/table.c
@@ -4,7 +4,7 @@
  *
  * Contact Information: wlanfae <wlanfae@realtek.com>
  */
-#include "r8192E_hwimg.h"
+#include "table.h"
 
 u32 RTL8192E_PHY_REG_ARRAY[RTL8192E_PHY_REG_ARRAY_LEN] = {0x0,};
 
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_hwimg.h b/drivers/staging/rtl8192e/rtl8192e/table.h
similarity index 94%
rename from drivers/staging/rtl8192e/rtl8192e/r8192E_hwimg.h
rename to drivers/staging/rtl8192e/rtl8192e/table.h
index a436c089a779..a80176c47127 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_hwimg.h
+++ b/drivers/staging/rtl8192e/rtl8192e/table.h
@@ -4,8 +4,8 @@
  *
  * Contact Information: wlanfae <wlanfae@realtek.com>
  */
-#ifndef __INC_HAL8192PciE_FW_IMG_H
-#define __INC_HAL8192PciE_FW_IMG_H
+#ifndef __RTL8192E_TABLE__H_
+#define __RTL8192E_TABLE__H_
 
 /*Created on  2008/11/18,  3: 7*/
 
-- 
2.34.1

