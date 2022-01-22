Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A866A2C9C
	for <linux-staging@lists.linux.dev>; Sat, 22 Jan 2022 17:06:06 +0000 (UTC)
Received: from dslb-188-097-041-028.188.097.pools.vodafone-ip.de ([188.97.41.28] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nBJpt-0002IN-Gc; Sat, 22 Jan 2022 18:05:57 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 2/4] staging: r8188eu: ODM_RF_TX_PWR_TRACK is always set
Date: Sat, 22 Jan 2022 18:05:45 +0100
Message-Id: <20220122170547.68378-3-martin@kaiser.cx>
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

The ODM_RF_TX_PWR_TRACK flag is set in Init_ODM_ComInfo_88E directly
after the driver is probed and it's never cleared.

Remove the flag and the one place where it's checked.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/odm.c         | 3 ---
 drivers/staging/r8188eu/hal/rtl8188e_dm.c | 7 ++-----
 drivers/staging/r8188eu/include/odm.h     | 1 -
 3 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index 7de0f458d788..9b4b75c225a7 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -898,9 +898,6 @@ void ODM_TXPowerTrackingCheck(struct odm_dm_struct *pDM_Odm)
 {
 	struct adapter *Adapter = pDM_Odm->Adapter;
 
-	if (!(pDM_Odm->SupportAbility & ODM_RF_TX_PWR_TRACK))
-		return;
-
 	if (!pDM_Odm->RFCalibrateInfo.TM_Trigger) {		/* at least delay 1 sec */
 		rtl8188e_PHY_SetRFReg(Adapter, RF_PATH_A, RF_T_METER_88E, BIT(17) | BIT(16), 0x03);
 
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_dm.c b/drivers/staging/r8188eu/hal/rtl8188e_dm.c
index adf87c1721ee..2f7294f0486d 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_dm.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_dm.c
@@ -37,8 +37,7 @@ static void Init_ODM_ComInfo_88E(struct adapter *Adapter)
 
 	ODM_CmnInfoInit(dm_odm, ODM_CMNINFO_RF_ANTENNA_TYPE, hal_data->TRxAntDivType);
 
-	pdmpriv->InitODMFlag =	ODM_RF_CALIBRATION |
-				ODM_RF_TX_PWR_TRACK;
+	pdmpriv->InitODMFlag =	ODM_RF_CALIBRATION;
 
 	ODM_CmnInfoUpdate(dm_odm, ODM_CMNINFO_ABILITY, pdmpriv->InitODMFlag);
 }
@@ -53,9 +52,7 @@ static void Update_ODM_ComInfo_88E(struct adapter *Adapter)
 	struct dm_priv	*pdmpriv = &hal_data->dmpriv;
 	int i;
 
-	pdmpriv->InitODMFlag = ODM_BB_RSSI_MONITOR |
-				ODM_RF_CALIBRATION |
-				ODM_RF_TX_PWR_TRACK;
+	pdmpriv->InitODMFlag = ODM_BB_RSSI_MONITOR | ODM_RF_CALIBRATION;
 	if (hal_data->AntDivCfg)
 		pdmpriv->InitODMFlag |= ODM_BB_ANT_DIV;
 
diff --git a/drivers/staging/r8188eu/include/odm.h b/drivers/staging/r8188eu/include/odm.h
index 50960e7daf1d..ed6f724841d3 100644
--- a/drivers/staging/r8188eu/include/odm.h
+++ b/drivers/staging/r8188eu/include/odm.h
@@ -153,7 +153,6 @@ enum odm_ability_def {
 	ODM_BB_PWR_TRA			= BIT(8),
 
 	/*  RF ODM section BIT 24-31 */
-	ODM_RF_TX_PWR_TRACK		= BIT(24),
 	ODM_RF_CALIBRATION		= BIT(26),
 };
 
-- 
2.30.2

