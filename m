Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683CA2CA9
	for <linux-staging@lists.linux.dev>; Sat, 22 Jan 2022 17:06:07 +0000 (UTC)
Received: from dslb-188-097-041-028.188.097.pools.vodafone-ip.de ([188.97.41.28] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nBJpu-0002IN-90; Sat, 22 Jan 2022 18:05:58 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 3/4] staging: r8188eu: ODM_RF_CALIBRATION is always set
Date: Sat, 22 Jan 2022 18:05:46 +0100
Message-Id: <20220122170547.68378-4-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220122170547.68378-1-martin@kaiser.cx>
References: <20220122170547.68378-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ODM_RF_CALIBRATION flag is set in Init_ODM_ComInfo_88E directly
after the driver is probed and it's never cleared.

Remove the flag and the code where it's set or checked.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/HalPhyRf_8188e.c | 5 -----
 drivers/staging/r8188eu/hal/rtl8188e_dm.c    | 7 +------
 drivers/staging/r8188eu/include/odm.h        | 3 ---
 3 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c b/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
index 21ecc90a558c..5f7a2668cabb 100644
--- a/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
+++ b/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
@@ -893,9 +893,6 @@ void PHY_IQCalibrate_8188E(struct adapter *adapt, bool recovery)
 		rOFDM0_XCTxAFE, rOFDM0_XDTxAFE,
 		rOFDM0_RxIQExtAnta};
 
-	if (!(dm_odm->SupportAbility & ODM_RF_CALIBRATION))
-		return;
-
 	/*  20120213<Kordan> Turn on when continuous Tx to pass lab testing. (required by Edlu) */
 	if (singletone || carrier_sup)
 		return;
@@ -993,8 +990,6 @@ void PHY_LCCalibrate_8188E(struct adapter *adapt)
 	struct hal_data_8188e *pHalData = &adapt->haldata;
 	struct odm_dm_struct *dm_odm = &pHalData->odmpriv;
 
-	if (!(dm_odm->SupportAbility & ODM_RF_CALIBRATION))
-		return;
 	/*  20120213<Kordan> Turn on when continuous Tx to pass lab testing. (required by Edlu) */
 	if (singletone || carrier_sup)
 		return;
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_dm.c b/drivers/staging/r8188eu/hal/rtl8188e_dm.c
index 2f7294f0486d..558aa85f1a9f 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_dm.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_dm.c
@@ -25,7 +25,6 @@ static void dm_InitGPIOSetting(struct adapter *Adapter)
 static void Init_ODM_ComInfo_88E(struct adapter *Adapter)
 {
 	struct hal_data_8188e *hal_data = &Adapter->haldata;
-	struct dm_priv	*pdmpriv = &hal_data->dmpriv;
 	struct odm_dm_struct *dm_odm = &hal_data->odmpriv;
 
 	/*  Init Value */
@@ -36,10 +35,6 @@ static void Init_ODM_ComInfo_88E(struct adapter *Adapter)
 	ODM_CmnInfoInit(dm_odm, ODM_CMNINFO_MP_TEST_CHIP, IS_NORMAL_CHIP(hal_data->VersionID));
 
 	ODM_CmnInfoInit(dm_odm, ODM_CMNINFO_RF_ANTENNA_TYPE, hal_data->TRxAntDivType);
-
-	pdmpriv->InitODMFlag =	ODM_RF_CALIBRATION;
-
-	ODM_CmnInfoUpdate(dm_odm, ODM_CMNINFO_ABILITY, pdmpriv->InitODMFlag);
 }
 
 static void Update_ODM_ComInfo_88E(struct adapter *Adapter)
@@ -52,7 +47,7 @@ static void Update_ODM_ComInfo_88E(struct adapter *Adapter)
 	struct dm_priv	*pdmpriv = &hal_data->dmpriv;
 	int i;
 
-	pdmpriv->InitODMFlag = ODM_BB_RSSI_MONITOR | ODM_RF_CALIBRATION;
+	pdmpriv->InitODMFlag = ODM_BB_RSSI_MONITOR;
 	if (hal_data->AntDivCfg)
 		pdmpriv->InitODMFlag |= ODM_BB_ANT_DIV;
 
diff --git a/drivers/staging/r8188eu/include/odm.h b/drivers/staging/r8188eu/include/odm.h
index ed6f724841d3..63e0b6725bee 100644
--- a/drivers/staging/r8188eu/include/odm.h
+++ b/drivers/staging/r8188eu/include/odm.h
@@ -151,9 +151,6 @@ enum odm_ability_def {
 	ODM_BB_RSSI_MONITOR		= BIT(4),
 	ODM_BB_ANT_DIV			= BIT(6),
 	ODM_BB_PWR_TRA			= BIT(8),
-
-	/*  RF ODM section BIT 24-31 */
-	ODM_RF_CALIBRATION		= BIT(26),
 };
 
 # define ODM_ITRF_USB 0x2
-- 
2.30.2

