Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F18470
	for <linux-staging@lists.linux.dev>; Fri, 30 Jul 2021 09:24:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B23D361019;
	Fri, 30 Jul 2021 09:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1627637069;
	bh=FA2JvxfO66XIy5Q70nlUO173Ng5X260T5R7eC2ufk4Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LwGPyrdVtmMy7PRnUnhBQXgtV0wf2E5w9D918XsQHMqoKR92JVjYCxs5HkabRw4Dy
	 Xs3YKijzY6vmTZ/tFyta1b3vjeEQM/0lCrZWInMEJcWq8avOAVO/80X6n28zxPhJ9a
	 VbA5HOo3wvNxtswJOMIfv8EHD/MoIILn48Zw4jPI=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-staging@lists.linux.dev
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 03/12] staging: r8188eu: move ODM_GetRightChnlPlaceforIQK()
Date: Fri, 30 Jul 2021 11:24:08 +0200
Message-Id: <20210730092417.1014392-3-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210730092417.1014392-1-gregkh@linuxfoundation.org>
References: <20210730092417.1014392-1-gregkh@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4551; h=from:subject; bh=FA2JvxfO66XIy5Q70nlUO173Ng5X260T5R7eC2ufk4Q=; b=owGbwMvMwCRo6H6F97bub03G02pJDInMR+1lV/KybhGSFLzF/M9L1miLcqfL4ebfCm5ezbZsVY+E nxzuiGVhEGRikBVTZPmyjefo/opDil6Gtqdh5rAygQxh4OIUgIkkn2CYp//nN0fRg+rkE58uHfl7f4 9JltbsuwwLjjOpW6Xs37L54eU1c7zrnMRcPhhfAQA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

ODM_GetRightChnlPlaceforIQK() is only called in one place, so move the
call to the single location and make the file static.

This lets us remove the hal/HalPhyRf.c and include/HalPhyRf.h files as
they are now empty.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/staging/r8188eu/Makefile              |  1 -
 drivers/staging/r8188eu/hal/HalPhyRf.c        | 30 -------------------
 drivers/staging/r8188eu/hal/HalPhyRf_8188e.c  | 21 +++++++++++++
 drivers/staging/r8188eu/include/HalPhyRf.h    |  9 ------
 drivers/staging/r8188eu/include/odm_precomp.h |  1 -
 5 files changed, 21 insertions(+), 41 deletions(-)
 delete mode 100644 drivers/staging/r8188eu/hal/HalPhyRf.c
 delete mode 100644 drivers/staging/r8188eu/include/HalPhyRf.h

diff --git a/drivers/staging/r8188eu/Makefile b/drivers/staging/r8188eu/Makefile
index 6db1376e9768..ea455b0939bf 100644
--- a/drivers/staging/r8188eu/Makefile
+++ b/drivers/staging/r8188eu/Makefile
@@ -28,7 +28,6 @@ OUTSRC_FILES :=				\
 		hal/HalHWImg8188E_MAC.o	\
 		hal/HalHWImg8188E_BB.o	\
 		hal/HalHWImg8188E_RF.o	\
-		hal/HalPhyRf.o		\
 		hal/HalPhyRf_8188e.o	\
 		hal/HalPwrSeqCmd.o	\
 		hal/Hal8188EPwrSeq.o	\
diff --git a/drivers/staging/r8188eu/hal/HalPhyRf.c b/drivers/staging/r8188eu/hal/HalPhyRf.c
deleted file mode 100644
index e5a58ee156b7..000000000000
--- a/drivers/staging/r8188eu/hal/HalPhyRf.c
+++ /dev/null
@@ -1,30 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/* Copyright(c) 2007 - 2011 Realtek Corporation. */
-
- #include "odm_precomp.h"
-
-/* 3============================================================ */
-/* 3 IQ Calibration */
-/* 3============================================================ */
-
-#define ODM_TARGET_CHNL_NUM_2G_5G	59
-
-u8 ODM_GetRightChnlPlaceforIQK(u8 chnl)
-{
-	u8	channel_all[ODM_TARGET_CHNL_NUM_2G_5G] = {
-		1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14,
-		36, 38, 40, 42, 44, 46, 48, 50, 52, 54, 56, 58, 60, 62, 64,
-		100, 102, 104, 106, 108, 110, 112, 114, 116, 118, 120, 122,
-		124, 126, 128, 130, 132, 134, 136, 138, 140, 149, 151, 153,
-		155, 157, 159, 161, 163, 165
-	};
-	u8	place = chnl;
-
-	if (chnl > 14) {
-		for (place = 14; place < sizeof(channel_all); place++) {
-			if (channel_all[place] == chnl)
-				return place-13;
-		}
-	}
-	return 0;
-}
diff --git a/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c b/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
index df9bd4cdf575..8b34842b4a30 100644
--- a/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
+++ b/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
@@ -1199,6 +1199,27 @@ static void phy_IQCalibrate_8188E(struct adapter *adapt, s32 result[][8], u8 t,
 	ODM_RT_TRACE(dm_odm, ODM_COMP_CALIBRATION, ODM_DBG_LOUD, ("phy_IQCalibrate_8188E() <==\n"));
 }
 
+#define ODM_TARGET_CHNL_NUM_2G_5G	59
+static u8 ODM_GetRightChnlPlaceforIQK(u8 chnl)
+{
+	u8	channel_all[ODM_TARGET_CHNL_NUM_2G_5G] = {
+		1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14,
+		36, 38, 40, 42, 44, 46, 48, 50, 52, 54, 56, 58, 60, 62, 64,
+		100, 102, 104, 106, 108, 110, 112, 114, 116, 118, 120, 122,
+		124, 126, 128, 130, 132, 134, 136, 138, 140, 149, 151, 153,
+		155, 157, 159, 161, 163, 165
+	};
+	u8	place = chnl;
+
+	if (chnl > 14) {
+		for (place = 14; place < sizeof(channel_all); place++) {
+			if (channel_all[place] == chnl)
+				return place-13;
+		}
+	}
+	return 0;
+}
+
 static void phy_LCCalibrate_8188E(struct adapter *adapt, bool is2t)
 {
 	u8 tmpreg;
diff --git a/drivers/staging/r8188eu/include/HalPhyRf.h b/drivers/staging/r8188eu/include/HalPhyRf.h
deleted file mode 100644
index ba877eb7e801..000000000000
--- a/drivers/staging/r8188eu/include/HalPhyRf.h
+++ /dev/null
@@ -1,9 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
-/* Copyright(c) 2007 - 2011 Realtek Corporation. */
-
-#ifndef __HAL_PHY_RF_H__
-#define __HAL_PHY_RF_H__
-
-u8 ODM_GetRightChnlPlaceforIQK(u8 chnl);
-
-#endif	/*  #ifndef __HAL_PHY_RF_H__ */
diff --git a/drivers/staging/r8188eu/include/odm_precomp.h b/drivers/staging/r8188eu/include/odm_precomp.h
index cec1035e4fe0..7e5db893c1ea 100644
--- a/drivers/staging/r8188eu/include/odm_precomp.h
+++ b/drivers/staging/r8188eu/include/odm_precomp.h
@@ -22,7 +22,6 @@
 #include "odm_RegDefine11AC.h"
 #include "odm_RegDefine11N.h"
 
-#include "HalPhyRf.h"
 #include "HalPhyRf_8188e.h"/* for IQK,LCK,Power-tracking */
 #include "Hal8188ERateAdaptive.h"/* for  RA,Power training */
 #include "rtl8188e_hal.h"
-- 
2.32.0

