Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B057A2CA1
	for <linux-staging@lists.linux.dev>; Fri,  4 Feb 2022 09:10:02 +0000 (UTC)
Received: from dslb-188-096-149-005.188.096.pools.vodafone-ip.de ([188.96.149.5] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nFubP-0002IT-JW; Fri, 04 Feb 2022 10:09:59 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH v2 3/4] staging: r8188eu: remove constant parameter of odm_ConfigRFReg_8188E
Date: Fri,  4 Feb 2022 10:09:40 +0100
Message-Id: <20220204090941.309900-4-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220204090941.309900-1-martin@kaiser.cx>
References: <20220203203217.252156-1-martin@kaiser.cx>
 <20220204090941.309900-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The only caller of odm_ConfigRFReg_8188E sets RF_PATH to RF_PATH_A.
Remove this parameter and use RF_PATH_A inside the function.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
v2: no changes

 drivers/staging/r8188eu/hal/odm_RegConfig8188E.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm_RegConfig8188E.c b/drivers/staging/r8188eu/hal/odm_RegConfig8188E.c
index 5fb5a88314ed..9059f2533b0b 100644
--- a/drivers/staging/r8188eu/hal/odm_RegConfig8188E.c
+++ b/drivers/staging/r8188eu/hal/odm_RegConfig8188E.c
@@ -4,8 +4,7 @@
 #include "../include/drv_types.h"
 
 static void odm_ConfigRFReg_8188E(struct odm_dm_struct *pDM_Odm, u32 Addr,
-				  u32 Data, enum rf_radio_path RF_PATH,
-				  u32 RegAddr)
+				  u32 Data, u32 RegAddr)
 {
 	if (Addr == 0xffe) {
 		msleep(50);
@@ -20,7 +19,7 @@ static void odm_ConfigRFReg_8188E(struct odm_dm_struct *pDM_Odm, u32 Addr,
 	} else if (Addr == 0xf9) {
 		udelay(1);
 	} else {
-		rtl8188e_PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH, RegAddr, bRFRegOffsetMask, Data);
+		rtl8188e_PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RegAddr, bRFRegOffsetMask, Data);
 		/*  Add 1us delay between BB/RF register setting. */
 		udelay(1);
 	}
@@ -31,7 +30,7 @@ void odm_ConfigRF_RadioA_8188E(struct odm_dm_struct *pDM_Odm, u32 Addr, u32 Data
 	u32  content = 0x1000; /*  RF_Content: radioa_txt */
 	u32 maskforPhySet = (u32)(content & 0xE000);
 
-	odm_ConfigRFReg_8188E(pDM_Odm, Addr, Data, RF_PATH_A, Addr | maskforPhySet);
+	odm_ConfigRFReg_8188E(pDM_Odm, Addr, Data, Addr | maskforPhySet);
 }
 
 void odm_ConfigMAC_8188E(struct odm_dm_struct *pDM_Odm, u32 Addr, u8 Data)
-- 
2.30.2

