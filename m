Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71EA2C80
	for <linux-staging@lists.linux.dev>; Sat,  8 Jan 2022 12:50:21 +0000 (UTC)
Received: from dslb-188-097-214-229.188.097.pools.vodafone-ip.de ([188.97.214.229] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1n6BAi-0005EJ-Ec; Sat, 08 Jan 2022 13:50:12 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 01/12] staging: r8188eu: ODM_MAC_EDCA_TURBO is always set
Date: Sat,  8 Jan 2022 13:49:48 +0100
Message-Id: <20220108124959.313215-2-martin@kaiser.cx>
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

The ODM_MAC_EDCA_TURBO flag is always set for chips that are supported by
this driver. Remove the flag and the one place where it's checked.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/odm.c         | 3 ---
 drivers/staging/r8188eu/hal/rtl8188e_dm.c | 1 -
 drivers/staging/r8188eu/include/odm.h     | 3 ---
 3 files changed, 7 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index d8fa587ff286..77ece1950b63 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -563,9 +563,6 @@ static void odm_EdcaTurboCheck(struct odm_dm_struct *pDM_Odm)
 	struct mlme_ext_priv	*pmlmeext = &Adapter->mlmeextpriv;
 	struct mlme_ext_info	*pmlmeinfo = &pmlmeext->mlmext_info;
 
-	if (!(pDM_Odm->SupportAbility & ODM_MAC_EDCA_TURBO))
-		return;
-
 	if (pregpriv->wifi_spec == 1)
 		goto dm_CheckEdcaTurbo_EXIT;
 
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_dm.c b/drivers/staging/r8188eu/hal/rtl8188e_dm.c
index bd6eb3878060..5118d0e3045b 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_dm.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_dm.c
@@ -56,7 +56,6 @@ static void Update_ODM_ComInfo_88E(struct adapter *Adapter)
 	pdmpriv->InitODMFlag = ODM_BB_FA_CNT |
 				ODM_BB_RSSI_MONITOR |
 				ODM_BB_CCK_PD |
-				ODM_MAC_EDCA_TURBO |
 				ODM_RF_CALIBRATION |
 				ODM_RF_TX_PWR_TRACK;
 	if (hal_data->AntDivCfg)
diff --git a/drivers/staging/r8188eu/include/odm.h b/drivers/staging/r8188eu/include/odm.h
index 23a151c558dc..616a862180b2 100644
--- a/drivers/staging/r8188eu/include/odm.h
+++ b/drivers/staging/r8188eu/include/odm.h
@@ -154,9 +154,6 @@ enum odm_ability_def {
 	ODM_BB_ANT_DIV			= BIT(6),
 	ODM_BB_PWR_TRA			= BIT(8),
 
-	/*  MAC DM section BIT 16-23 */
-	ODM_MAC_EDCA_TURBO		= BIT(16),
-
 	/*  RF ODM section BIT 24-31 */
 	ODM_RF_TX_PWR_TRACK		= BIT(24),
 	ODM_RF_CALIBRATION		= BIT(26),
-- 
2.30.2

