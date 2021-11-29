Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39EB668
	for <linux-staging@lists.linux.dev>; Mon, 29 Nov 2021 22:14:49 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id u17so13307626plg.9
        for <linux-staging@lists.linux.dev>; Mon, 29 Nov 2021 14:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h0rKDnr3HA7cDoLv06yMW4nxDm9zJoG/YcBzOXbNpVs=;
        b=LCke5qOcLhSuGGEWgEBFvEbBsjbSIJnOWICVxR6DxvkbQUGbpt75LdCWutQ1uGOs0v
         HRXHdX1OQLypVQHCP8F9ulUSukjD+kI4rH4Y4zjflmZLLwf3DXOQHWZf/hA+h3p0+8ZH
         DqcslgLvsQNyn3OWVz6lTp5hziJoVxJI4Nepcw+YatmwtqsFvFT2SZi1pEaP/Os+3svU
         9aKUqiiriMpANHRx0PmswS43t281PKUVV6jIfmpJ4VpaJll50oJFb/x+QqXbHI8Sw5FN
         sQiTEtRAdyhMuicl/ElZ1m+8u0egNe/kHS68iT9rKLNDhVJaPzBnuzgdfAVk3wfRcuHv
         K7wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h0rKDnr3HA7cDoLv06yMW4nxDm9zJoG/YcBzOXbNpVs=;
        b=gq1UQX6A1VjZ0XUBxVibZ/6ORx3QGqNVcsVVMEj3MLnxkCOcUNvUaTcaquxQhg9qT0
         jM7mn0JAZ9eWqJOo/njYWoGA7qOz8JW7NCMIv4GPRsB6EtP/bzpoZ29Xc4FIfABZvDNO
         y2rep/u+2co3Nlet6ot3IAAQEBsRoAp42XQ4DQZghJ3aPrVIjluA5X7yxwwYNv6GFq6j
         L6euVfPGOcO7DbqxaXi48hpyZoqli81EK6FslPsYs1lOwkFZ5fDw6zti1p0CSOozr+cI
         b5xW9sxG/B833sTmb1C4Lr9SIWlBeVzsORod+ZLBQudhjfGpTm2b03TvutL7uxBz1863
         sggQ==
X-Gm-Message-State: AOAM533oNZpo32F9JL77hAv9WKeWmAIIKas5uilFhEXLbrQiQ95Y9ZKD
	rd0S6Mu2RobU6jTKC7OTqfs=
X-Google-Smtp-Source: ABdhPJxOF5Gb96QP7i2fxwNIGOtjrUWeRJ6/yn5SWWJtR/GegW+1J1oXqucKpPoOupGm3FQURJAVqg==
X-Received: by 2002:a17:902:e2c3:b0:143:9b60:d16d with SMTP id l3-20020a170902e2c300b001439b60d16dmr62355324plc.42.1638224088687;
        Mon, 29 Nov 2021 14:14:48 -0800 (PST)
Received: from makvihas.makvihas.com ([103.161.98.32])
        by smtp.gmail.com with ESMTPSA id hg4sm308347pjb.1.2021.11.29.14.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 14:14:48 -0800 (PST)
From: Vihas Mak <makvihas@gmail.com>
To: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk
Cc: gregkh@linuxfoundation.org,
	martin@kaiser.cx,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vihas Mak <makvihas@gmail.com>
Subject: [PATCH] staging: r8188eu: use ARRAY_SIZE() macro and fix camelcase issues
Date: Tue, 30 Nov 2021 03:43:47 +0530
Message-Id: <20211129221346.365883-1-makvihas@gmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix camelcase warnings from checkpatch.pl and use ARRAY_SIZE()
to make the code cleaner and avoid following cocci warnings:

	drivers/staging/r8188eu/hal/HalHWImg8188E_RF.c:142:51-52: WARNING: Use ARRAY_SIZE
	drivers/staging/r8188eu/hal/HalHWImg8188E_BB.c:174:52-53: WARNING: Use ARRAY_SIZE
	drivers/staging/r8188eu/hal/HalHWImg8188E_BB.c:450:52-53: WARNING: Use ARRAY_SIZE
	drivers/staging/r8188eu/hal/HalHWImg8188E_BB.c:655:49-50: WARNING: Use ARRAY_SIZE
	drivers/staging/r8188eu/hal/HalHWImg8188E_MAC.c:136:50-51: WARNING: Use ARRAY_SIZE

Signed-off-by: Vihas Mak <makvihas@gmail.com>
---
 .../staging/r8188eu/hal/HalHWImg8188E_BB.c    |  6 ++---
 .../staging/r8188eu/hal/HalHWImg8188E_MAC.c   |  2 +-
 .../staging/r8188eu/hal/HalHWImg8188E_RF.c    | 24 +++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/HalHWImg8188E_BB.c b/drivers/staging/r8188eu/hal/HalHWImg8188E_BB.c
index f6e4243e0..ce46b3651 100644
--- a/drivers/staging/r8188eu/hal/HalHWImg8188E_BB.c
+++ b/drivers/staging/r8188eu/hal/HalHWImg8188E_BB.c
@@ -171,7 +171,7 @@ enum HAL_STATUS ODM_ReadAndConfig_AGC_TAB_1T_8188E(struct odm_dm_struct *dm_odm)
 {
 	u32     hex         = 0;
 	u32     i           = 0;
-	u32     arraylen    = sizeof(array_agc_tab_1t_8188e) / sizeof(u32);
+	u32     arraylen    = ARRAY_SIZE(array_agc_tab_1t_8188e);
 	u32    *array       = array_agc_tab_1t_8188e;
 	bool		biol = false;
 	struct adapter *adapter =  dm_odm->Adapter;
@@ -447,7 +447,7 @@ enum HAL_STATUS ODM_ReadAndConfig_PHY_REG_1T_8188E(struct odm_dm_struct *dm_odm)
 {
 	u32     hex         = 0;
 	u32     i           = 0;
-	u32     arraylen    = sizeof(array_phy_reg_1t_8188e) / sizeof(u32);
+	u32     arraylen    = ARRAY_SIZE(array_phy_reg_1t_8188e);
 	u32    *array       = array_phy_reg_1t_8188e;
 	bool	biol = false;
 	struct adapter *adapter =  dm_odm->Adapter;
@@ -652,7 +652,7 @@ void ODM_ReadAndConfig_PHY_REG_PG_8188E(struct odm_dm_struct *dm_odm)
 {
 	u32  hex;
 	u32  i           = 0;
-	u32  arraylen    = sizeof(array_phy_reg_pg_8188e) / sizeof(u32);
+	u32  arraylen    = ARRAY_SIZE(array_phy_reg_pg_8188e);
 	u32 *array       = array_phy_reg_pg_8188e;
 
 	hex = ODM_ITRF_USB << 8;
diff --git a/drivers/staging/r8188eu/hal/HalHWImg8188E_MAC.c b/drivers/staging/r8188eu/hal/HalHWImg8188E_MAC.c
index b4c55863d..89061e1a3 100644
--- a/drivers/staging/r8188eu/hal/HalHWImg8188E_MAC.c
+++ b/drivers/staging/r8188eu/hal/HalHWImg8188E_MAC.c
@@ -133,7 +133,7 @@ enum HAL_STATUS ODM_ReadAndConfig_MAC_REG_8188E(struct odm_dm_struct *dm_odm)
 
 	u32     hex         = 0;
 	u32     i;
-	u32     array_len    = sizeof(array_MAC_REG_8188E) / sizeof(u32);
+	u32     array_len    = ARRAY_SIZE(array_MAC_REG_8188E);
 	u32    *array       = array_MAC_REG_8188E;
 	bool	biol = false;
 
diff --git a/drivers/staging/r8188eu/hal/HalHWImg8188E_RF.c b/drivers/staging/r8188eu/hal/HalHWImg8188E_RF.c
index 5e0a96200..f708d9d90 100644
--- a/drivers/staging/r8188eu/hal/HalHWImg8188E_RF.c
+++ b/drivers/staging/r8188eu/hal/HalHWImg8188E_RF.c
@@ -29,7 +29,7 @@ static bool CheckCondition(const u32  Condition, const u32  Hex)
 *                           RadioA_1T.TXT
 ******************************************************************************/
 
-static u32 Array_RadioA_1T_8188E[] = {
+static u32 array_RadioA_1T_8188E[] = {
 		0x000, 0x00030000,
 		0x008, 0x00084000,
 		0x018, 0x00000407,
@@ -134,13 +134,13 @@ static u32 Array_RadioA_1T_8188E[] = {
 enum HAL_STATUS ODM_ReadAndConfig_RadioA_1T_8188E(struct odm_dm_struct *pDM_Odm)
 {
 	#define READ_NEXT_PAIR(v1, v2, i) do	\
-		 { i += 2; v1 = Array[i];	\
-		 v2 = Array[i + 1]; } while (0)
+		 { i += 2; v1 = array[i];	\
+		 v2 = array[i + 1]; } while (0)
 
 	u32     hex         = 0;
 	u32     i           = 0;
-	u32     ArrayLen    = sizeof(Array_RadioA_1T_8188E) / sizeof(u32);
-	u32    *Array       = Array_RadioA_1T_8188E;
+	u32     array_len    = ARRAY_SIZE(array_RadioA_1T_8188E);
+	u32    *array       = array_RadioA_1T_8188E;
 	bool		biol = false;
 	struct adapter *Adapter =  pDM_Odm->Adapter;
 	struct xmit_frame *pxmit_frame = NULL;
@@ -160,9 +160,9 @@ enum HAL_STATUS ODM_ReadAndConfig_RadioA_1T_8188E(struct odm_dm_struct *pDM_Odm)
 		}
 	}
 
-	for (i = 0; i < ArrayLen; i += 2) {
-		u32 v1 = Array[i];
-		u32 v2 = Array[i + 1];
+	for (i = 0; i < array_len; i += 2) {
+		u32 v1 = array[i];
+		u32 v2 = array[i + 1];
 
 		/*  This (offset, data) pair meets the condition. */
 		if (v1 < 0xCDCDCDCD) {
@@ -189,19 +189,19 @@ enum HAL_STATUS ODM_ReadAndConfig_RadioA_1T_8188E(struct odm_dm_struct *pDM_Odm)
 			}
 			continue;
 		} else { /*  This line is the start line of branch. */
-			if (!CheckCondition(Array[i], hex)) {
+			if (!CheckCondition(array[i], hex)) {
 				/*  Discard the following (offset, data) pairs. */
 				READ_NEXT_PAIR(v1, v2, i);
 				while (v2 != 0xDEAD &&
 				       v2 != 0xCDEF &&
-				       v2 != 0xCDCD && i < ArrayLen - 2)
+				       v2 != 0xCDCD && i < array_len - 2)
 					READ_NEXT_PAIR(v1, v2, i);
 				i -= 2; /*  prevent from for-loop += 2 */
 			} else { /*  Configure matched pairs and skip to end of if-else. */
 			READ_NEXT_PAIR(v1, v2, i);
 				while (v2 != 0xDEAD &&
 				       v2 != 0xCDEF &&
-				       v2 != 0xCDCD && i < ArrayLen - 2) {
+				       v2 != 0xCDCD && i < array_len - 2) {
 					if (biol) {
 						if (rtw_IOL_cmd_boundary_handle(pxmit_frame))
 							bndy_cnt++;
@@ -226,7 +226,7 @@ enum HAL_STATUS ODM_ReadAndConfig_RadioA_1T_8188E(struct odm_dm_struct *pDM_Odm)
 					READ_NEXT_PAIR(v1, v2, i);
 				}
 
-				while (v2 != 0xDEAD && i < ArrayLen - 2)
+				while (v2 != 0xDEAD && i < array_len - 2)
 					READ_NEXT_PAIR(v1, v2, i);
 			}
 		}
-- 
2.30.2

