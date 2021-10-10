Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D611F2C80
	for <linux-staging@lists.linux.dev>; Sun, 10 Oct 2021 17:52:43 +0000 (UTC)
Received: from dslb-188-104-061-167.188.104.pools.vodafone-ip.de ([188.104.61.167] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mZd04-0001WC-KS; Sun, 10 Oct 2021 19:52:40 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 11/11] staging: r8188eu: remove odm ext lna info
Date: Sun, 10 Oct 2021 19:52:04 +0200
Message-Id: <20211010175204.24029-11-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211010175204.24029-1-martin@kaiser.cx>
References: <20211010175204.24029-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ext lna info is never set. Remove it and fix up the one place
where it's read.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/odm.c     | 7 +------
 drivers/staging/r8188eu/include/odm.h | 3 ---
 2 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index 7d31067d95a8..5bb5ce950438 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -237,9 +237,6 @@ void ODM_CmnInfoInit(struct odm_dm_struct *pDM_Odm, enum odm_common_info_def Cmn
 	case	ODM_CMNINFO_BOARD_TYPE:
 		pDM_Odm->BoardType = (u8)Value;
 		break;
-	case	ODM_CMNINFO_EXT_LNA:
-		pDM_Odm->ExtLNA = (u8)Value;
-		break;
 	/* To remove the compiler warning, must add an empty default statement to handle the other values. */
 	default:
 		/* do nothing */
@@ -494,7 +491,7 @@ void odm_DIG(struct odm_dm_struct *pDM_Odm)
 
 	/* 1 Boundary Decision */
 	if ((pDM_Odm->SupportICType & (ODM_RTL8192C | ODM_RTL8723A)) &&
-	    ((pDM_Odm->BoardType == ODM_BOARD_HIGHPWR) || pDM_Odm->ExtLNA)) {
+	    (pDM_Odm->BoardType == ODM_BOARD_HIGHPWR)) {
 		if (pDM_Odm->SupportPlatform & (ODM_AP | ODM_ADSL)) {
 			dm_dig_max = DM_DIG_MAX_AP_HP;
 			dm_dig_min = DM_DIG_MIN_AP_HP;
@@ -729,8 +726,6 @@ void odm_CCKPacketDetectionThresh(struct odm_dm_struct *pDM_Odm)
 
 	if (!(pDM_Odm->SupportAbility & (ODM_BB_CCK_PD | ODM_BB_FA_CNT)))
 		return;
-	if (pDM_Odm->ExtLNA)
-		return;
 	if (pDM_Odm->bLinked) {
 		if (pDM_Odm->RSSI_Min > 25) {
 			CurCCK_CCAThres = 0xcd;
diff --git a/drivers/staging/r8188eu/include/odm.h b/drivers/staging/r8188eu/include/odm.h
index 90539fa2ef2d..f4b427cfaeee 100644
--- a/drivers/staging/r8188eu/include/odm.h
+++ b/drivers/staging/r8188eu/include/odm.h
@@ -268,7 +268,6 @@ enum odm_common_info_def {
 	ODM_CMNINFO_IC_TYPE,		/* ODM_IC_TYPE_E */
 	ODM_CMNINFO_RF_TYPE,		/* RF_PATH_E or ODM_RF_TYPE_E? */
 	ODM_CMNINFO_BOARD_TYPE,		/* ODM_BOARD_TYPE_E */
-	ODM_CMNINFO_EXT_LNA,		/* true */
 	/* HOOK BEFORE REG INIT-----------  */
 
 	/*  Dynamic value: */
@@ -646,8 +645,6 @@ struct odm_dm_struct {
 	u8	RFType;
 	/*  Board Type Normal/HighPower/MiniCard/SLIM/Combo/. = 0/1/2/3/4/. */
 	u8	BoardType;
-	/*  with external LNA  NO/Yes = 0/1 */
-	u8	ExtLNA;
 
 	u32	BK_SupportAbility;
 	u8	AntDivType;
-- 
2.20.1

