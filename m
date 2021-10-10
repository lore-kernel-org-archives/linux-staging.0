Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A846C2C80
	for <linux-staging@lists.linux.dev>; Sun, 10 Oct 2021 17:52:39 +0000 (UTC)
Received: from dslb-188-104-061-167.188.104.pools.vodafone-ip.de ([188.104.61.167] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mZd00-0001WC-MI; Sun, 10 Oct 2021 19:52:36 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 07/11] staging: r8188eu: remove odm wifi test info
Date: Sun, 10 Oct 2021 19:52:00 +0200
Message-Id: <20211010175204.24029-7-martin@kaiser.cx>
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

The wifi test info is set but not used. Remove it.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/odm.c         | 3 ---
 drivers/staging/r8188eu/hal/rtl8188e_dm.c | 2 --
 drivers/staging/r8188eu/include/odm.h     | 2 --
 3 files changed, 7 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index 38151936eddb..f76bdf3d9a80 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -249,9 +249,6 @@ void ODM_CmnInfoInit(struct odm_dm_struct *pDM_Odm, enum odm_common_info_def Cmn
 	case	ODM_CMNINFO_BINHCT_TEST:
 		pDM_Odm->bInHctTest = (bool)Value;
 		break;
-	case	ODM_CMNINFO_BWIFI_TEST:
-		pDM_Odm->bWIFITest = (bool)Value;
-		break;
 	/* To remove the compiler warning, must add an empty default statement to handle the other values. */
 	default:
 		/* do nothing */
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_dm.c b/drivers/staging/r8188eu/hal/rtl8188e_dm.c
index 54cf0d6d726f..f99a8526fe18 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_dm.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_dm.c
@@ -45,8 +45,6 @@ static void Init_ODM_ComInfo_88E(struct adapter *Adapter)
 
 	ODM_CmnInfoInit(dm_odm, ODM_CMNINFO_MP_TEST_CHIP, IS_NORMAL_CHIP(hal_data->VersionID));
 
-	ODM_CmnInfoInit(dm_odm, ODM_CMNINFO_BWIFI_TEST, Adapter->registrypriv.wifi_spec);
-
 	if (hal_data->rf_type == RF_1T1R)
 		ODM_CmnInfoUpdate(dm_odm, ODM_CMNINFO_RF_TYPE, ODM_1T1R);
 	else if (hal_data->rf_type == RF_2T2R)
diff --git a/drivers/staging/r8188eu/include/odm.h b/drivers/staging/r8188eu/include/odm.h
index 22451d1a6970..a4e5d4f9f0b9 100644
--- a/drivers/staging/r8188eu/include/odm.h
+++ b/drivers/staging/r8188eu/include/odm.h
@@ -272,7 +272,6 @@ enum odm_common_info_def {
 	ODM_CMNINFO_EXT_PA,
 	ODM_CMNINFO_EXT_TRSW,
 	ODM_CMNINFO_BINHCT_TEST,
-	ODM_CMNINFO_BWIFI_TEST,
 	/* HOOK BEFORE REG INIT-----------  */
 
 	/*  Dynamic value: */
@@ -657,7 +656,6 @@ struct odm_dm_struct {
 	/*  with external TRSW  NO/Yes = 0/1 */
 	u8	ExtTRSW;
 	bool	bInHctTest;
-	bool	bWIFITest;
 
 	u32	BK_SupportAbility;
 	u8	AntDivType;
-- 
2.20.1

