Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395062C9D
	for <linux-staging@lists.linux.dev>; Wed,  5 Jan 2022 08:34:42 +0000 (UTC)
Received: from dslb-188-097-046-135.188.097.pools.vodafone-ip.de ([188.97.46.135] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1n51kl-0005mc-CQ; Wed, 05 Jan 2022 09:34:39 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 1/7] staging: r8188eu: rfPath is always 0
Date: Wed,  5 Jan 2022 09:34:20 +0100
Message-Id: <20220105083426.177128-2-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220105083426.177128-1-martin@kaiser.cx>
References: <20220105083426.177128-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The rfPath variable in Hal_ReadTxPowerInfo88E is always 0. Remove the
variable and use 0 directly.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 .../staging/r8188eu/hal/rtl8188e_hal_init.c   | 29 +++++++++----------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index cce291ca44b1..b07ccc27b96b 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -1121,7 +1121,6 @@ void Hal_ReadTxPowerInfo88E(struct adapter *padapter, u8 *PROMContent, bool Auto
 {
 	struct hal_data_8188e *pHalData = &padapter->haldata;
 	struct txpowerinfo24g pwrInfo24G;
-	u8 rfPath = 0;
 	u8 ch, group;
 	u8 TxCount;
 
@@ -1130,26 +1129,26 @@ void Hal_ReadTxPowerInfo88E(struct adapter *padapter, u8 *PROMContent, bool Auto
 	for (ch = 0; ch < CHANNEL_MAX_NUMBER; ch++) {
 		hal_get_chnl_group_88e(ch, &group);
 
-		pHalData->Index24G_CCK_Base[rfPath][ch] = pwrInfo24G.IndexCCK_Base[rfPath][group];
+		pHalData->Index24G_CCK_Base[0][ch] = pwrInfo24G.IndexCCK_Base[0][group];
 		if (ch == 14)
-			pHalData->Index24G_BW40_Base[rfPath][ch] = pwrInfo24G.IndexBW40_Base[rfPath][4];
+			pHalData->Index24G_BW40_Base[0][ch] = pwrInfo24G.IndexBW40_Base[0][4];
 		else
-			pHalData->Index24G_BW40_Base[rfPath][ch] = pwrInfo24G.IndexBW40_Base[rfPath][group];
+			pHalData->Index24G_BW40_Base[0][ch] = pwrInfo24G.IndexBW40_Base[0][group];
 
-		DBG_88E("======= Path %d, Channel %d =======\n", rfPath, ch);
-		DBG_88E("Index24G_CCK_Base[%d][%d] = 0x%x\n", rfPath, ch, pHalData->Index24G_CCK_Base[rfPath][ch]);
-		DBG_88E("Index24G_BW40_Base[%d][%d] = 0x%x\n", rfPath, ch, pHalData->Index24G_BW40_Base[rfPath][ch]);
+		DBG_88E("======= Path 0, Channel %d =======\n", ch);
+		DBG_88E("Index24G_CCK_Base[0][%d] = 0x%x\n", ch, pHalData->Index24G_CCK_Base[0][ch]);
+		DBG_88E("Index24G_BW40_Base[0][%d] = 0x%x\n", ch, pHalData->Index24G_BW40_Base[0][ch]);
 	}
 	for (TxCount = 0; TxCount < MAX_TX_COUNT; TxCount++) {
-		pHalData->CCK_24G_Diff[rfPath][TxCount] = pwrInfo24G.CCK_Diff[rfPath][TxCount];
-		pHalData->OFDM_24G_Diff[rfPath][TxCount] = pwrInfo24G.OFDM_Diff[rfPath][TxCount];
-		pHalData->BW20_24G_Diff[rfPath][TxCount] = pwrInfo24G.BW20_Diff[rfPath][TxCount];
-		pHalData->BW40_24G_Diff[rfPath][TxCount] = pwrInfo24G.BW40_Diff[rfPath][TxCount];
+		pHalData->CCK_24G_Diff[0][TxCount] = pwrInfo24G.CCK_Diff[0][TxCount];
+		pHalData->OFDM_24G_Diff[0][TxCount] = pwrInfo24G.OFDM_Diff[0][TxCount];
+		pHalData->BW20_24G_Diff[0][TxCount] = pwrInfo24G.BW20_Diff[0][TxCount];
+		pHalData->BW40_24G_Diff[0][TxCount] = pwrInfo24G.BW40_Diff[0][TxCount];
 		DBG_88E("======= TxCount %d =======\n", TxCount);
-		DBG_88E("CCK_24G_Diff[%d][%d] = %d\n", rfPath, TxCount, pHalData->CCK_24G_Diff[rfPath][TxCount]);
-		DBG_88E("OFDM_24G_Diff[%d][%d] = %d\n", rfPath, TxCount, pHalData->OFDM_24G_Diff[rfPath][TxCount]);
-		DBG_88E("BW20_24G_Diff[%d][%d] = %d\n", rfPath, TxCount, pHalData->BW20_24G_Diff[rfPath][TxCount]);
-		DBG_88E("BW40_24G_Diff[%d][%d] = %d\n", rfPath, TxCount, pHalData->BW40_24G_Diff[rfPath][TxCount]);
+		DBG_88E("CCK_24G_Diff[0][%d] = %d\n", TxCount, pHalData->CCK_24G_Diff[0][TxCount]);
+		DBG_88E("OFDM_24G_Diff[0][%d] = %d\n", TxCount, pHalData->OFDM_24G_Diff[0][TxCount]);
+		DBG_88E("BW20_24G_Diff[0][%d] = %d\n", TxCount, pHalData->BW20_24G_Diff[0][TxCount]);
+		DBG_88E("BW40_24G_Diff[0][%d] = %d\n", TxCount, pHalData->BW40_24G_Diff[0][TxCount]);
 	}
 
 	/*  2010/10/19 MH Add Regulator recognize for CU. */
-- 
2.30.2

