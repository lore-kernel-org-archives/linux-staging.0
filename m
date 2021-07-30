Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83C870
	for <linux-staging@lists.linux.dev>; Fri, 30 Jul 2021 09:24:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1C2C961008;
	Fri, 30 Jul 2021 09:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1627637064;
	bh=TnrqG2mlHrWE3MelLlqCPRat2Q07IhWqbOtXzXiI2Rg=;
	h=From:To:Cc:Subject:Date:From;
	b=0rWlbQ8lMR1xAeoNmp3aDn6M2kZrP3PRIvicMaBjCpDz4YV3DJPY9F7VunT1DRDpA
	 OsNOyP1VIzmxO3E/Uz4Id7pzLD83rmlvWa0NhC2ohkYr8W0vNebfwB/9tyAg9EPIW3
	 4oThD2kxP3LKg9WBJT2c9fV8w4xRFSYu60rr0ipI=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-staging@lists.linux.dev
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 01/12] staging: r8188eu: remove empty ODM_ResetIQKResult() function
Date: Fri, 30 Jul 2021 11:24:06 +0200
Message-Id: <20210730092417.1014392-1-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2478; h=from:subject; bh=TnrqG2mlHrWE3MelLlqCPRat2Q07IhWqbOtXzXiI2Rg=; b=owGbwMvMwCRo6H6F97bub03G02pJDInMR23PC/B/inihaj+r2KjcU7Pw19mnyTcKXz2TzL9bIFvS Hc3aEcvCIMjEICumyPJlG8/R/RWHFL0MbU/DzGFlAhnCwMUpABPZLs8wm7W7dff/Ey+3fpFtfiF6jF +Se2f4O4b5rnmTtjyPOsq8YmXtjKBUl8v7vdlsAQ==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

ODM_ResetIQKResult() is empty and does nothing, so remove it.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/staging/r8188eu/hal/HalPhyRf.c       | 4 ----
 drivers/staging/r8188eu/hal/HalPhyRf_8188e.c | 2 --
 drivers/staging/r8188eu/include/HalPhyRf.h   | 2 --
 drivers/staging/r8188eu/include/odm.h        | 2 --
 4 files changed, 10 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/HalPhyRf.c b/drivers/staging/r8188eu/hal/HalPhyRf.c
index 257940202f13..1805fdfbad48 100644
--- a/drivers/staging/r8188eu/hal/HalPhyRf.c
+++ b/drivers/staging/r8188eu/hal/HalPhyRf.c
@@ -7,10 +7,6 @@
 /* 3 IQ Calibration */
 /* 3============================================================ */
 
-void ODM_ResetIQKResult(struct odm_dm_struct *pDM_Odm)
-{
-}
-
 u8 ODM_GetRightChnlPlaceforIQK(u8 chnl)
 {
 	u8	channel_all[ODM_TARGET_CHNL_NUM_2G_5G] = {
diff --git a/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c b/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
index af32210bf359..df9bd4cdf575 100644
--- a/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
+++ b/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
@@ -437,8 +437,6 @@ odm_TXPowerTrackingCallback_ThermalMeter_8188E(
 		}
 
 		if (delta_IQK >= 8) { /*  Delta temperature is equal to or larger than 20 centigrade. */
-			ODM_ResetIQKResult(dm_odm);
-
 			dm_odm->RFCalibrateInfo.ThermalValue_IQK = ThermalValue;
 			PHY_IQCalibrate_8188E(Adapter, false);
 		}
diff --git a/drivers/staging/r8188eu/include/HalPhyRf.h b/drivers/staging/r8188eu/include/HalPhyRf.h
index ba3b6133fc13..54af312509a0 100644
--- a/drivers/staging/r8188eu/include/HalPhyRf.h
+++ b/drivers/staging/r8188eu/include/HalPhyRf.h
@@ -6,8 +6,6 @@
 
 #define ODM_TARGET_CHNL_NUM_2G_5G	59
 
-void ODM_ResetIQKResult(struct odm_dm_struct *pDM_Odm);
-
 u8 ODM_GetRightChnlPlaceforIQK(u8 chnl);
 
 #endif	/*  #ifndef __HAL_PHY_RF_H__ */
diff --git a/drivers/staging/r8188eu/include/odm.h b/drivers/staging/r8188eu/include/odm.h
index 8c1d15eed259..15827b6a5729 100644
--- a/drivers/staging/r8188eu/include/odm.h
+++ b/drivers/staging/r8188eu/include/odm.h
@@ -1151,8 +1151,6 @@ void ODM_CancelAllTimers(struct odm_dm_struct *pDM_Odm);
 
 void ODM_ReleaseAllTimers(struct odm_dm_struct *pDM_Odm);
 
-void ODM_ResetIQKResult(struct odm_dm_struct *pDM_Odm);
-
 void ODM_AntselStatistics_88C(struct odm_dm_struct *pDM_Odm, u8 MacId,
 			      u32 PWDBAll, bool isCCKrate);
 
-- 
2.32.0

