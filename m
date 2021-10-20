Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D1872
	for <linux-staging@lists.linux.dev>; Wed, 20 Oct 2021 19:54:34 +0000 (UTC)
Received: from dslb-188-096-142-022.188.096.pools.vodafone-ip.de ([188.96.142.22] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mdHfR-0007Cd-Vs; Wed, 20 Oct 2021 21:54:30 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 1/5] staging: r8188eu: remove unused dm_priv components
Date: Wed, 20 Oct 2021 21:53:57 +0200
Message-Id: <20211020195401.12931-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused components from struct dm_priv.

DMFlag is only written to, but never read.
InitDMFlag is assigned to DMFlag and not used elsewhere.
DM_Type is also write-only.
UndecoratedSmoothedPWDB and UndecoratedSmoothedCCK are not used at all.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/rtl8188e_dm.c     | 3 ---
 drivers/staging/r8188eu/hal/usb_halinit.c     | 1 -
 drivers/staging/r8188eu/include/rtl8188e_dm.h | 5 -----
 3 files changed, 9 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_dm.c b/drivers/staging/r8188eu/hal/rtl8188e_dm.c
index 4ce2c3749665..5d76f6ea91c4 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_dm.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_dm.c
@@ -87,12 +87,9 @@ static void Update_ODM_ComInfo_88E(struct adapter *Adapter)
 void rtl8188e_InitHalDm(struct adapter *Adapter)
 {
 	struct hal_data_8188e *hal_data = GET_HAL_DATA(Adapter);
-	struct dm_priv	*pdmpriv = &hal_data->dmpriv;
 	struct odm_dm_struct *dm_odm = &hal_data->odmpriv;
 
 	dm_InitGPIOSetting(Adapter);
-	pdmpriv->DM_Type = DM_Type_ByDriver;
-	pdmpriv->DMFlag = DYNAMIC_FUNC_DISABLE;
 	Update_ODM_ComInfo_88E(Adapter);
 	ODM_DMInit(dm_odm);
 	Adapter->fix_rate = 0xFF;
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index cdc602fa9af8..ef1ae95d7db0 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -1469,7 +1469,6 @@ void SetHwReg8188EU(struct adapter *Adapter, u8 variable, u8 *val)
 		break;
 	case HW_VAR_DM_FUNC_SET:
 		if (*((u32 *)val) == DYNAMIC_ALL_FUNC_ENABLE) {
-			pdmpriv->DMFlag = pdmpriv->InitDMFlag;
 			podmpriv->SupportAbility =	pdmpriv->InitODMFlag;
 		} else {
 			podmpriv->SupportAbility |= *((u32 *)val);
diff --git a/drivers/staging/r8188eu/include/rtl8188e_dm.h b/drivers/staging/r8188eu/include/rtl8188e_dm.h
index 4a0608313f7a..208bea050f6f 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_dm.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_dm.h
@@ -15,14 +15,9 @@ enum{
 #define HP_THERMAL_NUM		8
 /*  duplicate code,will move to ODM ######### */
 struct	dm_priv {
-	u8	DM_Type;
-	u8	DMFlag;
-	u8	InitDMFlag;
 	u32	InitODMFlag;
 
 	/*  Upper and Lower Signal threshold for Rate Adaptive*/
-	int	UndecoratedSmoothedPWDB;
-	int	UndecoratedSmoothedCCK;
 	int	EntryMinUndecoratedSmoothedPWDB;
 	int	EntryMaxUndecoratedSmoothedPWDB;
 	int	MinUndecoratedPWDBForDM;
-- 
2.20.1

