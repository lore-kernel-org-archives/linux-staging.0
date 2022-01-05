Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2F52C9D
	for <linux-staging@lists.linux.dev>; Wed,  5 Jan 2022 08:34:51 +0000 (UTC)
Received: from dslb-188-097-046-135.188.097.pools.vodafone-ip.de ([188.97.46.135] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1n51ku-0005mc-Ie; Wed, 05 Jan 2022 09:34:48 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 5/7] staging: r8188eu: BW40_24G_Diff is set but not used
Date: Wed,  5 Jan 2022 09:34:24 +0100
Message-Id: <20220105083426.177128-6-martin@kaiser.cx>
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

The BW40_24G_Diff array is set but not used. Remove it.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 2 --
 drivers/staging/r8188eu/include/rtl8188e_hal.h  | 1 -
 2 files changed, 3 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index 63467b1d0224..8f78682640f0 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -1142,11 +1142,9 @@ void Hal_ReadTxPowerInfo88E(struct adapter *padapter, u8 *PROMContent, bool Auto
 	for (TxCount = 0; TxCount < MAX_TX_COUNT; TxCount++) {
 		pHalData->OFDM_24G_Diff[0][TxCount] = pwrInfo24G.OFDM_Diff[0][TxCount];
 		pHalData->BW20_24G_Diff[0][TxCount] = pwrInfo24G.BW20_Diff[0][TxCount];
-		pHalData->BW40_24G_Diff[0][TxCount] = pwrInfo24G.BW40_Diff[0][TxCount];
 		DBG_88E("======= TxCount %d =======\n", TxCount);
 		DBG_88E("OFDM_24G_Diff[0][%d] = %d\n", TxCount, pHalData->OFDM_24G_Diff[0][TxCount]);
 		DBG_88E("BW20_24G_Diff[0][%d] = %d\n", TxCount, pHalData->BW20_24G_Diff[0][TxCount]);
-		DBG_88E("BW40_24G_Diff[0][%d] = %d\n", TxCount, pHalData->BW40_24G_Diff[0][TxCount]);
 	}
 
 	/*  2010/10/19 MH Add Regulator recognize for CU. */
diff --git a/drivers/staging/r8188eu/include/rtl8188e_hal.h b/drivers/staging/r8188eu/include/rtl8188e_hal.h
index 3f818e97bde0..0f743c3a2ac5 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_hal.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_hal.h
@@ -183,7 +183,6 @@ struct hal_data_8188e {
 	/* If only one tx, only BW20 and OFDM are used. */
 	s8	OFDM_24G_Diff[RF_PATH_MAX][MAX_TX_COUNT];
 	s8	BW20_24G_Diff[RF_PATH_MAX][MAX_TX_COUNT];
-	s8	BW40_24G_Diff[RF_PATH_MAX][MAX_TX_COUNT];
 
 	/*  HT 20<->40 Pwr diff */
 	u8	TxPwrHt20Diff[RF_PATH_MAX][CHANNEL_MAX_NUMBER];
-- 
2.30.2

