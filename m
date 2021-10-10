Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5082C86
	for <linux-staging@lists.linux.dev>; Sun, 10 Oct 2021 17:52:36 +0000 (UTC)
Received: from dslb-188-104-061-167.188.104.pools.vodafone-ip.de ([188.104.61.167] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mZczx-0001WC-J3; Sun, 10 Oct 2021 19:52:33 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 04/11] staging: r8188eu: remove odm fab version info
Date: Sun, 10 Oct 2021 19:51:57 +0200
Message-Id: <20211010175204.24029-4-martin@kaiser.cx>
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

The fab version info is set but not used. Remove it.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/odm.c         | 3 ---
 drivers/staging/r8188eu/hal/rtl8188e_dm.c | 4 +---
 drivers/staging/r8188eu/include/odm.h     | 9 ---------
 3 files changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index acab7ddb9e99..17427bec9832 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -231,9 +231,6 @@ void ODM_CmnInfoInit(struct odm_dm_struct *pDM_Odm, enum odm_common_info_def Cmn
 	case	ODM_CMNINFO_CUT_VER:
 		pDM_Odm->CutVersion = (u8)Value;
 		break;
-	case	ODM_CMNINFO_FAB_VER:
-		pDM_Odm->FabVersion = (u8)Value;
-		break;
 	case	ODM_CMNINFO_RF_TYPE:
 		pDM_Odm->RFType = (u8)Value;
 		break;
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_dm.c b/drivers/staging/r8188eu/hal/rtl8188e_dm.c
index f4b69e5a632c..c752c106980a 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_dm.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_dm.c
@@ -31,7 +31,7 @@ static void Init_ODM_ComInfo_88E(struct adapter *Adapter)
 	struct hal_data_8188e *hal_data = GET_HAL_DATA(Adapter);
 	struct dm_priv	*pdmpriv = &hal_data->dmpriv;
 	struct odm_dm_struct *dm_odm = &hal_data->odmpriv;
-	u8 cut_ver, fab_ver;
+	u8 cut_ver;
 
 	/*  Init Value */
 	memset(dm_odm, 0, sizeof(*dm_odm));
@@ -44,10 +44,8 @@ static void Init_ODM_ComInfo_88E(struct adapter *Adapter)
 
 	ODM_CmnInfoInit(dm_odm, ODM_CMNINFO_IC_TYPE, ODM_RTL8188E);
 
-	fab_ver = ODM_TSMC;
 	cut_ver = ODM_CUT_A;
 
-	ODM_CmnInfoInit(dm_odm, ODM_CMNINFO_FAB_VER, fab_ver);
 	ODM_CmnInfoInit(dm_odm, ODM_CMNINFO_CUT_VER, cut_ver);
 
 	ODM_CmnInfoInit(dm_odm, ODM_CMNINFO_MP_TEST_CHIP, IS_NORMAL_CHIP(hal_data->VersionID));
diff --git a/drivers/staging/r8188eu/include/odm.h b/drivers/staging/r8188eu/include/odm.h
index 398038d5252d..527898571a54 100644
--- a/drivers/staging/r8188eu/include/odm.h
+++ b/drivers/staging/r8188eu/include/odm.h
@@ -267,7 +267,6 @@ enum odm_common_info_def {
 	ODM_CMNINFO_MP_TEST_CHIP,
 	ODM_CMNINFO_IC_TYPE,		/* ODM_IC_TYPE_E */
 	ODM_CMNINFO_CUT_VER,		/* ODM_CUT_VERSION_E */
-	ODM_CMNINFO_FAB_VER,		/* ODM_FAB_E */
 	ODM_CMNINFO_RF_TYPE,		/* RF_PATH_E or ODM_RF_TYPE_E? */
 	ODM_CMNINFO_BOARD_TYPE,		/* ODM_BOARD_TYPE_E */
 	ODM_CMNINFO_EXT_LNA,		/* true */
@@ -384,12 +383,6 @@ enum odm_cut_version {
 	ODM_CUT_TEST	=	7,
 };
 
-/*  ODM_CMNINFO_FAB_VER */
-enum odm_fab_Version {
-	ODM_TSMC	=	0,
-	ODM_UMC		=	1,
-};
-
 /*  ODM_CMNINFO_RF_TYPE */
 /*  For example 1T2R (A+AB = BIT(0)|BIT(4)|BIT(5)) */
 enum odm_rf_path {
@@ -668,8 +661,6 @@ struct odm_dm_struct {
 	u32	SupportICType;
 	/*  Cut Version TestChip/A-cut/B-cut... = 0/1/2/3/... */
 	u8	CutVersion;
-	/*  Fab Version TSMC/UMC = 0/1 */
-	u8	FabVersion;
 	/*  RF Type 4T4R/3T3R/2T2R/1T2R/1T1R/... */
 	u8	RFType;
 	/*  Board Type Normal/HighPower/MiniCard/SLIM/Combo/. = 0/1/2/3/4/. */
-- 
2.20.1

