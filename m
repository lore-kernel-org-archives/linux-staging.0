Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E392C9C
	for <linux-staging@lists.linux.dev>; Sat, 18 Dec 2021 12:04:52 +0000 (UTC)
Received: from dslb-178-004-169-039.178.004.pools.vodafone-ip.de ([178.4.169.39] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1myYSH-0008I6-8Q; Sat, 18 Dec 2021 13:04:49 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 8/9] staging: r8188: ODM_BB_DIG is always set
Date: Sat, 18 Dec 2021 13:04:22 +0100
Message-Id: <20211218120423.29906-9-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211218120423.29906-1-martin@kaiser.cx>
References: <20211218120423.29906-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the ODM_BB_DIG capability. It is always set for this driver.

(ODM_BB_DIG was set in Update_ODM_ComInfo_88E and checked in odm_DIG,
which was always called after the capability was set.)

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/odm.c         | 2 +-
 drivers/staging/r8188eu/hal/rtl8188e_dm.c | 3 +--
 drivers/staging/r8188eu/include/odm.h     | 2 --
 3 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index 8d126a3a287b..70c83465a0a6 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -349,7 +349,7 @@ void odm_DIG(struct odm_dm_struct *pDM_Odm)
 	u8 dm_dig_max, dm_dig_min;
 	u8 CurrentIGI = pDM_DigTable->CurIGValue;
 
-	if ((!(pDM_Odm->SupportAbility & ODM_BB_DIG)) || (!(pDM_Odm->SupportAbility & ODM_BB_FA_CNT)))
+	if (!(pDM_Odm->SupportAbility & ODM_BB_FA_CNT))
 		return;
 
 	if (*pDM_Odm->pbScanInProcess)
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_dm.c b/drivers/staging/r8188eu/hal/rtl8188e_dm.c
index 6a5a80bfe7e4..865e520a246d 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_dm.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_dm.c
@@ -53,8 +53,7 @@ static void Update_ODM_ComInfo_88E(struct adapter *Adapter)
 	struct dm_priv	*pdmpriv = &hal_data->dmpriv;
 	int i;
 
-	pdmpriv->InitODMFlag =	ODM_BB_DIG |
-				ODM_BB_RA_MASK |
+	pdmpriv->InitODMFlag = ODM_BB_RA_MASK |
 				ODM_BB_FA_CNT |
 				ODM_BB_RSSI_MONITOR |
 				ODM_BB_CCK_PD |
diff --git a/drivers/staging/r8188eu/include/odm.h b/drivers/staging/r8188eu/include/odm.h
index 8ab173f7c6c6..6199190e5426 100644
--- a/drivers/staging/r8188eu/include/odm.h
+++ b/drivers/staging/r8188eu/include/odm.h
@@ -240,8 +240,6 @@ enum odm_common_info_def {
 
 enum odm_ability_def {
 	/*  BB ODM section BIT 0-15 */
-	ODM_BB_DIG			= BIT(0),
-
 	ODM_BB_RA_MASK			= BIT(1),
 	ODM_BB_FA_CNT			= BIT(3),
 	ODM_BB_RSSI_MONITOR		= BIT(4),
-- 
2.20.1

