Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8642C9C
	for <linux-staging@lists.linux.dev>; Sat,  5 Feb 2022 11:38:00 +0000 (UTC)
Received: from dslb-188-104-059-100.188.104.pools.vodafone-ip.de ([188.104.59.100] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nGJO3-0005c9-Op; Sat, 05 Feb 2022 12:37:51 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 5/8] staging: r8188eu: remove constant rf variable
Date: Sat,  5 Feb 2022 12:37:38 +0100
Message-Id: <20220205113741.379070-6-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220205113741.379070-1-martin@kaiser.cx>
References: <20220205113741.379070-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The rf variable in odm_TXPowerTrackingCallback_ThermalMeter_8188E
is always 1. The for loops that use rf will be executed only once.

We can remove the variable and the loops.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/HalPhyRf_8188e.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c b/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
index c26c87e5cb78..5df8371a44fb 100644
--- a/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
+++ b/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
@@ -107,7 +107,7 @@ odm_TXPowerTrackingCallback_ThermalMeter_8188E(
 	s8 OFDM_index_old[2] = {0, 0}, CCK_index_old = 0;
 	u32 i = 0, j = 0;
 
-	u8 OFDM_min_index = 6, rf; /* OFDM BB Swing should be less than +3.0dB, which is required by Arthur */
+	u8 OFDM_min_index = 6; /* OFDM BB Swing should be less than +3.0dB, which is required by Arthur */
 	s8 OFDM_index_mapping[2][index_mapping_NUM_88E] = {
 		{0, 0, 2, 3, 4, 4, 		/* 2.4G, decrease power */
 		5, 6, 7, 7, 8, 9,
@@ -134,8 +134,6 @@ odm_TXPowerTrackingCallback_ThermalMeter_8188E(
 
 	ThermalValue = (u8)rtl8188e_PHY_QueryRFReg(Adapter, RF_PATH_A, RF_T_METER_88E, 0xfc00); /* 0x42: RF Reg[15:10] 88E */
 
-	rf = 1;
-
 	if (ThermalValue) {
 		/* Query OFDM path A default setting */
 		ele_D = rtl8188e_PHY_QueryBBReg(Adapter, rOFDM0_XATxIQImbalance, bMaskDWord) & bMaskOFDM_D;
@@ -171,8 +169,7 @@ odm_TXPowerTrackingCallback_ThermalMeter_8188E(
 			dm_odm->RFCalibrateInfo.ThermalValue_LCK = ThermalValue;
 			dm_odm->RFCalibrateInfo.ThermalValue_IQK = ThermalValue;
 
-			for (i = 0; i < rf; i++)
-				dm_odm->RFCalibrateInfo.OFDM_index[i] = OFDM_index_old[i];
+			dm_odm->RFCalibrateInfo.OFDM_index[0] = OFDM_index_old[0];
 			dm_odm->RFCalibrateInfo.CCK_index = CCK_index_old;
 		}
 
@@ -237,16 +234,13 @@ odm_TXPowerTrackingCallback_ThermalMeter_8188E(
 			}
 			if (offset >= index_mapping_NUM_88E)
 				offset = index_mapping_NUM_88E - 1;
-			for (i = 0; i < rf; i++)
-				OFDM_index[i] = dm_odm->RFCalibrateInfo.OFDM_index[i] + OFDM_index_mapping[j][offset];
+			OFDM_index[0] = dm_odm->RFCalibrateInfo.OFDM_index[0] + OFDM_index_mapping[j][offset];
 			CCK_index = dm_odm->RFCalibrateInfo.CCK_index + OFDM_index_mapping[j][offset];
 
-			for (i = 0; i < rf; i++) {
-				if (OFDM_index[i] > OFDM_TABLE_SIZE_92D - 1)
-					OFDM_index[i] = OFDM_TABLE_SIZE_92D - 1;
-				else if (OFDM_index[i] < OFDM_min_index)
-					OFDM_index[i] = OFDM_min_index;
-			}
+			if (OFDM_index[0] > OFDM_TABLE_SIZE_92D - 1)
+				OFDM_index[0] = OFDM_TABLE_SIZE_92D - 1;
+			else if (OFDM_index[0] < OFDM_min_index)
+				OFDM_index[0] = OFDM_min_index;
 
 			if (CCK_index > CCK_TABLE_SIZE - 1)
 				CCK_index = CCK_TABLE_SIZE - 1;
-- 
2.30.2

