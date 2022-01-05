Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161742C9D
	for <linux-staging@lists.linux.dev>; Wed,  5 Jan 2022 08:34:53 +0000 (UTC)
Received: from dslb-188-097-046-135.188.097.pools.vodafone-ip.de ([188.97.46.135] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1n51kw-0005mc-0Z; Wed, 05 Jan 2022 09:34:50 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 6/7] staging: r8188eu: make OFDM_24G_Diff a 1-D array
Date: Wed,  5 Jan 2022 09:34:25 +0100
Message-Id: <20220105083426.177128-7-martin@kaiser.cx>
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

Make OFDM_24G_Diff one-dimensional array. This driver uses only
OFDM_24G_Diff[0].

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 4 ++--
 drivers/staging/r8188eu/hal/rtl8188e_phycfg.c   | 2 +-
 drivers/staging/r8188eu/include/rtl8188e_hal.h  | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index 8f78682640f0..d07b16ebe936 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -1140,10 +1140,10 @@ void Hal_ReadTxPowerInfo88E(struct adapter *padapter, u8 *PROMContent, bool Auto
 		DBG_88E("Index24G_BW40_Base[%d] = 0x%x\n", ch, pHalData->Index24G_BW40_Base[ch]);
 	}
 	for (TxCount = 0; TxCount < MAX_TX_COUNT; TxCount++) {
-		pHalData->OFDM_24G_Diff[0][TxCount] = pwrInfo24G.OFDM_Diff[0][TxCount];
+		pHalData->OFDM_24G_Diff[TxCount] = pwrInfo24G.OFDM_Diff[0][TxCount];
 		pHalData->BW20_24G_Diff[0][TxCount] = pwrInfo24G.BW20_Diff[0][TxCount];
 		DBG_88E("======= TxCount %d =======\n", TxCount);
-		DBG_88E("OFDM_24G_Diff[0][%d] = %d\n", TxCount, pHalData->OFDM_24G_Diff[0][TxCount]);
+		DBG_88E("OFDM_24G_Diff[%d] = %d\n", TxCount, pHalData->OFDM_24G_Diff[TxCount]);
 		DBG_88E("BW20_24G_Diff[0][%d] = %d\n", TxCount, pHalData->BW20_24G_Diff[0][TxCount]);
 	}
 
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c b/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
index 650de81b7ed3..3b5ddc00606e 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
@@ -592,7 +592,7 @@ static void getTxPowerIndex88E(struct adapter *Adapter, u8 channel, u8 *cckPower
 	cckPowerLevel[RF_PATH_A] = pHalData->Index24G_CCK_Base[index];
 	/* 2. OFDM */
 	ofdmPowerLevel[RF_PATH_A] = pHalData->Index24G_BW40_Base[index] +
-		pHalData->OFDM_24G_Diff[RF_PATH_A][RF_PATH_A];
+		pHalData->OFDM_24G_Diff[RF_PATH_A];
 	/*  1. BW20 */
 	BW20PowerLevel[RF_PATH_A] = pHalData->Index24G_BW40_Base[index] +
 		pHalData->BW20_24G_Diff[RF_PATH_A][RF_PATH_A];
diff --git a/drivers/staging/r8188eu/include/rtl8188e_hal.h b/drivers/staging/r8188eu/include/rtl8188e_hal.h
index 0f743c3a2ac5..e748bdcbd867 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_hal.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_hal.h
@@ -181,7 +181,7 @@ struct hal_data_8188e {
 	u8	Index24G_CCK_Base[CHANNEL_MAX_NUMBER];
 	u8	Index24G_BW40_Base[CHANNEL_MAX_NUMBER];
 	/* If only one tx, only BW20 and OFDM are used. */
-	s8	OFDM_24G_Diff[RF_PATH_MAX][MAX_TX_COUNT];
+	s8	OFDM_24G_Diff[MAX_TX_COUNT];
 	s8	BW20_24G_Diff[RF_PATH_MAX][MAX_TX_COUNT];
 
 	/*  HT 20<->40 Pwr diff */
-- 
2.30.2

