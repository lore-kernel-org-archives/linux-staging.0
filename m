Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0526B2CA4
	for <linux-staging@lists.linux.dev>; Mon, 10 Jan 2022 12:46:56 +0000 (UTC)
Received: from pd956d63d.dip0.t-ipconnect.de ([217.86.214.61] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1n6u4b-0007Td-IB; Mon, 10 Jan 2022 13:46:53 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 7/9] staging: r8188eu: merge ODM_ConfigMACWithHeaderFile into PHY_MACConfig8188E
Date: Mon, 10 Jan 2022 13:46:36 +0100
Message-Id: <20220110124638.6909-8-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220110124638.6909-1-martin@kaiser.cx>
References: <20220110124638.6909-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ODM_ConfigMACWithHeaderFile function is only one line. Merge it into
PHY_MACConfig8188E, which is its only caller.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/odm_HWConfig.c     | 5 -----
 drivers/staging/r8188eu/hal/rtl8188e_phycfg.c  | 2 +-
 drivers/staging/r8188eu/include/odm_HWConfig.h | 3 ---
 3 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm_HWConfig.c b/drivers/staging/r8188eu/hal/odm_HWConfig.c
index 5ec9a04be26b..1c3074fc6be4 100644
--- a/drivers/staging/r8188eu/hal/odm_HWConfig.c
+++ b/drivers/staging/r8188eu/hal/odm_HWConfig.c
@@ -377,8 +377,3 @@ enum HAL_STATUS ODM_ConfigBBWithHeaderFile(struct odm_dm_struct *dm_odm,
 
 	return HAL_STATUS_FAILURE;
 }
-
-enum HAL_STATUS ODM_ConfigMACWithHeaderFile(struct odm_dm_struct *dm_odm)
-{
-	return ODM_ReadAndConfig_MAC_REG_8188E(dm_odm);
-}
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c b/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
index c1639df8b1e7..15370b674e53 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
@@ -342,7 +342,7 @@ s32 PHY_MACConfig8188E(struct adapter *Adapter)
 	/*  */
 	/*  Config MAC */
 	/*  */
-	if (HAL_STATUS_FAILURE == ODM_ConfigMACWithHeaderFile(&pHalData->odmpriv))
+	if (HAL_STATUS_FAILURE == ODM_ReadAndConfig_MAC_REG_8188E(&pHalData->odmpriv))
 		rtStatus = _FAIL;
 
 	/*  2010.07.13 AMPDU aggregation number B */
diff --git a/drivers/staging/r8188eu/include/odm_HWConfig.h b/drivers/staging/r8188eu/include/odm_HWConfig.h
index aa468ce34b7e..3a8c041dbb66 100644
--- a/drivers/staging/r8188eu/include/odm_HWConfig.h
+++ b/drivers/staging/r8188eu/include/odm_HWConfig.h
@@ -99,7 +99,4 @@ enum HAL_STATUS ODM_ConfigRFWithHeaderFile(struct odm_dm_struct *pDM_Odm);
 
 enum HAL_STATUS ODM_ConfigBBWithHeaderFile(struct odm_dm_struct *pDM_Odm,
 					   enum odm_bb_config_type ConfigType);
-
-enum HAL_STATUS ODM_ConfigMACWithHeaderFile(struct odm_dm_struct *pDM_Odm);
-
 #endif
-- 
2.30.2

