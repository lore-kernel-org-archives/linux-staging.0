Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38AE2C9D
	for <linux-staging@lists.linux.dev>; Sun,  2 Jan 2022 18:00:22 +0000 (UTC)
Received: from dslb-188-104-058-096.188.104.pools.vodafone-ip.de ([188.104.58.96] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1n459X-0005Ye-Pu; Sun, 02 Jan 2022 19:00:20 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 5/5] staging: r8188eu: turbo scan is always off for r8188eu
Date: Sun,  2 Jan 2022 18:59:32 +0100
Message-Id: <20220102175932.89127-6-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220102175932.89127-1-martin@kaiser.cx>
References: <20220102175932.89127-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Turbo scan is always disabled. Remove the TurboScanOff variable and
related checks.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/rtl8188e_rf6052.c | 21 +++++++------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c b/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c
index 0b982cc7c86f..6e0231099986 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c
@@ -87,28 +87,21 @@ rtl8188e_PHY_RF6052SetCckTxPower(
 	struct hal_data_8188e *pHalData = &Adapter->haldata;
 	struct mlme_ext_priv *pmlmeext = &Adapter->mlmeextpriv;
 	u32 TxAGC[2] = {0, 0}, tmpval = 0, pwrtrac_value;
-	bool TurboScanOff = false;
 	u8 idx1, idx2;
 	u8 *ptr;
 	u8 direction;
-	/* FOR CE ,must disable turbo scan */
-	TurboScanOff = true;
 
 	if (pmlmeext->sitesurvey_res.state == SCAN_PROCESS) {
 		TxAGC[RF_PATH_A] = 0x3f3f3f3f;
 		TxAGC[RF_PATH_B] = 0x3f3f3f3f;
 
-		TurboScanOff = true;/* disable turbo scan */
-
-		if (TurboScanOff) {
-			for (idx1 = RF_PATH_A; idx1 <= RF_PATH_B; idx1++) {
-				TxAGC[idx1] =
-					pPowerlevel[idx1] | (pPowerlevel[idx1] << 8) |
-					(pPowerlevel[idx1] << 16) | (pPowerlevel[idx1] << 24);
-				/*  2010/10/18 MH For external PA module. We need to limit power index to be less than 0x20. */
-				if (TxAGC[idx1] > 0x20 && pHalData->ExternalPA)
-					TxAGC[idx1] = 0x20;
-			}
+		for (idx1 = RF_PATH_A; idx1 <= RF_PATH_B; idx1++) {
+			TxAGC[idx1] =
+				pPowerlevel[idx1] | (pPowerlevel[idx1] << 8) |
+				(pPowerlevel[idx1] << 16) | (pPowerlevel[idx1] << 24);
+			/*  2010/10/18 MH For external PA module. We need to limit power index to be less than 0x20. */
+			if (TxAGC[idx1] > 0x20 && pHalData->ExternalPA)
+				TxAGC[idx1] = 0x20;
 		}
 	} else {
 		for (idx1 = RF_PATH_A; idx1 <= RF_PATH_B; idx1++) {
-- 
2.30.2

