Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54972CAE
	for <linux-staging@lists.linux.dev>; Sat,  8 Jan 2022 12:50:23 +0000 (UTC)
Received: from dslb-188-097-214-229.188.097.pools.vodafone-ip.de ([188.97.214.229] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1n6BAj-0005EJ-E8; Sat, 08 Jan 2022 13:50:13 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 02/12] staging: r8188eu: ODM_BB_FA_CNT is always set
Date: Sat,  8 Jan 2022 13:49:49 +0100
Message-Id: <20220108124959.313215-3-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220108124959.313215-1-martin@kaiser.cx>
References: <20220108124959.313215-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ODM_BB_FA_CNT flag is always set.

Remove the flag and the code to check if ODM_BB_FA_CNT is not set.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/odm.c         | 8 +-------
 drivers/staging/r8188eu/hal/rtl8188e_dm.c | 3 +--
 drivers/staging/r8188eu/include/odm.h     | 1 -
 3 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index 77ece1950b63..7cc9ab4b1a59 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -169,9 +169,6 @@ static void odm_DIG(struct odm_dm_struct *pDM_Odm)
 	u8 dm_dig_max, dm_dig_min;
 	u8 CurrentIGI = pDM_DigTable->CurIGValue;
 
-	if (!(pDM_Odm->SupportAbility & ODM_BB_FA_CNT))
-		return;
-
 	if (*pDM_Odm->pbScanInProcess)
 		return;
 
@@ -367,9 +364,6 @@ static void odm_FalseAlarmCounterStatistics(struct odm_dm_struct *pDM_Odm)
 	struct false_alarm_stats *FalseAlmCnt = &pDM_Odm->FalseAlmCnt;
 	struct adapter *adapter = pDM_Odm->Adapter;
 
-	if (!(pDM_Odm->SupportAbility & ODM_BB_FA_CNT))
-		return;
-
 	/* hold ofdm counter */
 	rtl8188e_PHY_SetBBReg(adapter, ODM_REG_OFDM_FA_HOLDC_11N, BIT(31), 1); /* hold page C counter */
 	rtl8188e_PHY_SetBBReg(adapter, ODM_REG_OFDM_FA_RSTD_11N, BIT(31), 1); /* hold page D counter */
@@ -422,7 +416,7 @@ static void odm_CCKPacketDetectionThresh(struct odm_dm_struct *pDM_Odm)
 	u8 CurCCK_CCAThres;
 	struct false_alarm_stats *FalseAlmCnt = &pDM_Odm->FalseAlmCnt;
 
-	if (!(pDM_Odm->SupportAbility & (ODM_BB_CCK_PD | ODM_BB_FA_CNT)))
+	if (!(pDM_Odm->SupportAbility & ODM_BB_CCK_PD))
 		return;
 	if (pDM_Odm->bLinked) {
 		if (pDM_Odm->RSSI_Min > 25) {
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_dm.c b/drivers/staging/r8188eu/hal/rtl8188e_dm.c
index 5118d0e3045b..2ff9c7d84dbf 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_dm.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_dm.c
@@ -53,8 +53,7 @@ static void Update_ODM_ComInfo_88E(struct adapter *Adapter)
 	struct dm_priv	*pdmpriv = &hal_data->dmpriv;
 	int i;
 
-	pdmpriv->InitODMFlag = ODM_BB_FA_CNT |
-				ODM_BB_RSSI_MONITOR |
+	pdmpriv->InitODMFlag = ODM_BB_RSSI_MONITOR |
 				ODM_BB_CCK_PD |
 				ODM_RF_CALIBRATION |
 				ODM_RF_TX_PWR_TRACK;
diff --git a/drivers/staging/r8188eu/include/odm.h b/drivers/staging/r8188eu/include/odm.h
index 616a862180b2..664e75c3a7c2 100644
--- a/drivers/staging/r8188eu/include/odm.h
+++ b/drivers/staging/r8188eu/include/odm.h
@@ -148,7 +148,6 @@ enum odm_common_info_def {
 
 enum odm_ability_def {
 	/*  BB ODM section BIT 0-15 */
-	ODM_BB_FA_CNT			= BIT(3),
 	ODM_BB_RSSI_MONITOR		= BIT(4),
 	ODM_BB_CCK_PD			= BIT(5),
 	ODM_BB_ANT_DIV			= BIT(6),
-- 
2.30.2

