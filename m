Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EF43FC3
	for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 13:23:58 +0000 (UTC)
Received: from dslb-084-059-243-091.084.059.pools.vodafone-ip.de ([84.59.243.91] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mP2z2-000604-SL; Sat, 11 Sep 2021 15:23:52 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH] staging: r8188eu: remove write-only variable bLCKInProgress
Date: Sat, 11 Sep 2021 15:23:38 +0200
Message-Id: <20210911132338.1415-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bLCKInProgress in struct odm_rf_cal is never read. Remove it.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/HalPhyRf_8188e.c | 4 ----
 drivers/staging/r8188eu/include/odm.h        | 1 -
 2 files changed, 5 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c b/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
index 6e0abaf58791..d9693c8014ce 100644
--- a/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
+++ b/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
@@ -1212,16 +1212,12 @@ void PHY_LCCalibrate_8188E(struct adapter *adapt)
 		timecount += 50;
 	}
 
-	dm_odm->RFCalibrateInfo.bLCKInProgress = true;
-
 	if (dm_odm->RFType == ODM_2T2R) {
 		phy_LCCalibrate_8188E(adapt, true);
 	} else {
 		/*  For 88C 1T1R */
 		phy_LCCalibrate_8188E(adapt, false);
 	}
-
-	dm_odm->RFCalibrateInfo.bLCKInProgress = false;
 }
 
 static void phy_setrfpathswitch_8188e(struct adapter *adapt, bool main, bool is2t)
diff --git a/drivers/staging/r8188eu/include/odm.h b/drivers/staging/r8188eu/include/odm.h
index 7c8f082930dd..cda8b3ffe0be 100644
--- a/drivers/staging/r8188eu/include/odm.h
+++ b/drivers/staging/r8188eu/include/odm.h
@@ -679,7 +679,6 @@ struct odm_rf_cal {
 	u32	Reg864;
 
 	bool	bIQKInitialized;
-	bool	bLCKInProgress;
 	bool	bAntennaDetected;
 	u32	ADDA_backup[IQK_ADDA_REG_NUM];
 	u32	IQK_MAC_backup[IQK_MAC_REG_NUM];
-- 
2.20.1

