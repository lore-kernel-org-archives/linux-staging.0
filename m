Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CAC62CAB
	for <linux-staging@lists.linux.dev>; Sat, 22 Jan 2022 17:06:07 +0000 (UTC)
Received: from dslb-188-097-041-028.188.097.pools.vodafone-ip.de ([188.97.41.28] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nBJpv-0002IN-34; Sat, 22 Jan 2022 18:05:59 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 4/4] staging: r8188eu: merge Init_ODM_ComInfo_88E and rtl8188e_init_dm_priv
Date: Sat, 22 Jan 2022 18:05:47 +0100
Message-Id: <20220122170547.68378-5-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220122170547.68378-1-martin@kaiser.cx>
References: <20220122170547.68378-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rtl8188e_init_dm_priv is the only caller of Init_ODM_ComInfo_88E.
Merge the two functions.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/rtl8188e_dm.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_dm.c b/drivers/staging/r8188eu/hal/rtl8188e_dm.c
index 558aa85f1a9f..a05d8687c18d 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_dm.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_dm.c
@@ -22,21 +22,6 @@ static void dm_InitGPIOSetting(struct adapter *Adapter)
 /*  */
 /*  functions */
 /*  */
-static void Init_ODM_ComInfo_88E(struct adapter *Adapter)
-{
-	struct hal_data_8188e *hal_data = &Adapter->haldata;
-	struct odm_dm_struct *dm_odm = &hal_data->odmpriv;
-
-	/*  Init Value */
-	memset(dm_odm, 0, sizeof(*dm_odm));
-
-	dm_odm->Adapter = Adapter;
-
-	ODM_CmnInfoInit(dm_odm, ODM_CMNINFO_MP_TEST_CHIP, IS_NORMAL_CHIP(hal_data->VersionID));
-
-	ODM_CmnInfoInit(dm_odm, ODM_CMNINFO_RF_ANTENNA_TYPE, hal_data->TRxAntDivType);
-}
-
 static void Update_ODM_ComInfo_88E(struct adapter *Adapter)
 {
 	struct mlme_ext_priv	*pmlmeext = &Adapter->mlmeextpriv;
@@ -102,9 +87,14 @@ void rtl8188e_init_dm_priv(struct adapter *Adapter)
 {
 	struct hal_data_8188e *hal_data = &Adapter->haldata;
 	struct dm_priv	*pdmpriv = &hal_data->dmpriv;
+	struct odm_dm_struct *dm_odm = &hal_data->odmpriv;
 
 	memset(pdmpriv, 0, sizeof(struct dm_priv));
-	Init_ODM_ComInfo_88E(Adapter);
+	memset(dm_odm, 0, sizeof(*dm_odm));
+
+	dm_odm->Adapter = Adapter;
+	ODM_CmnInfoInit(dm_odm, ODM_CMNINFO_MP_TEST_CHIP, IS_NORMAL_CHIP(hal_data->VersionID));
+	ODM_CmnInfoInit(dm_odm, ODM_CMNINFO_RF_ANTENNA_TYPE, hal_data->TRxAntDivType);
 }
 
 /*  Add new function to reset the state of antenna diversity before link. */
-- 
2.30.2

