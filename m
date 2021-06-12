Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AAFE6D0D
	for <linux-staging@lists.linux.dev>; Sat, 12 Jun 2021 18:01:14 +0000 (UTC)
Received: from dslb-188-097-213-151.188.097.pools.vodafone-ip.de ([188.97.213.151] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1ls7wW-0003B8-HB; Sat, 12 Jun 2021 20:01:12 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 4/6] staging: rtl8188eu: remove a write-only power-index members
Date: Sat, 12 Jun 2021 20:00:17 +0200
Message-Id: <20210612180019.20387-4-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210612180019.20387-1-martin@kaiser.cx>
References: <20210612180019.20387-1-martin@kaiser.cx>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove power index members of struct hal_data_8188e that are written to
but never read.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/rtl8188eu/hal/phy.c              | 15 ---------------
 drivers/staging/rtl8188eu/include/rtl8188e_hal.h |  6 ------
 2 files changed, 21 deletions(-)

diff --git a/drivers/staging/rtl8188eu/hal/phy.c b/drivers/staging/rtl8188eu/hal/phy.c
index 5d9ad09ced70..256f87b9d630 100644
--- a/drivers/staging/rtl8188eu/hal/phy.c
+++ b/drivers/staging/rtl8188eu/hal/phy.c
@@ -162,18 +162,6 @@ static void get_tx_power_index(struct adapter *adapt, u8 channel, u8 *cck_pwr,
 	}
 }
 
-static void phy_power_index_check(struct adapter *adapt, u8 channel,
-				  u8 *cck_pwr, u8 *ofdm_pwr, u8 *bw20_pwr,
-				  u8 *bw40_pwr)
-{
-	struct hal_data_8188e *hal_data = adapt->HalData;
-
-	hal_data->CurrentCckTxPwrIdx = cck_pwr[0];
-	hal_data->CurrentOfdm24GTxPwrIdx = ofdm_pwr[0];
-	hal_data->CurrentBW2024GTxPwrIdx = bw20_pwr[0];
-	hal_data->CurrentBW4024GTxPwrIdx = bw40_pwr[0];
-}
-
 void phy_set_tx_power_level(struct adapter *adapt, u8 channel)
 {
 	u8 cck_pwr[MAX_TX_COUNT] = {0};
@@ -184,9 +172,6 @@ void phy_set_tx_power_level(struct adapter *adapt, u8 channel)
 	get_tx_power_index(adapt, channel, &cck_pwr[0], &ofdm_pwr[0],
 			   &bw20_pwr[0], &bw40_pwr[0]);
 
-	phy_power_index_check(adapt, channel, &cck_pwr[0], &ofdm_pwr[0],
-			      &bw20_pwr[0], &bw40_pwr[0]);
-
 	rtl88eu_phy_rf6052_set_cck_txpower(adapt, &cck_pwr[0]);
 	rtl88eu_phy_rf6052_set_ofdm_txpower(adapt, &ofdm_pwr[0], &bw20_pwr[0],
 					    &bw40_pwr[0], channel);
diff --git a/drivers/staging/rtl8188eu/include/rtl8188e_hal.h b/drivers/staging/rtl8188eu/include/rtl8188e_hal.h
index 7b8ca0ea3008..20049bdf39f5 100644
--- a/drivers/staging/rtl8188eu/include/rtl8188e_hal.h
+++ b/drivers/staging/rtl8188eu/include/rtl8188e_hal.h
@@ -233,12 +233,6 @@ struct hal_data_8188e {
 	u8	PwrGroupHT20[RF_PATH_MAX][CHANNEL_MAX_NUMBER];
 	u8	PwrGroupHT40[RF_PATH_MAX][CHANNEL_MAX_NUMBER];
 
-	/*  The current Tx Power Level */
-	u8	CurrentCckTxPwrIdx;
-	u8	CurrentOfdm24GTxPwrIdx;
-	u8	CurrentBW2024GTxPwrIdx;
-	u8	CurrentBW4024GTxPwrIdx;
-
 	/*  Read/write are allow for following hardware information variables */
 	u8	framesync;
 	u8	pwrGroupCnt;
-- 
2.20.1

