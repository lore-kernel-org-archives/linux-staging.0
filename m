Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0AF48E0CB
	for <linux-staging@lists.linux.dev>; Thu, 10 Sep 2026 14:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789051186; cv=none; b=DsGXzXoJrKjRNdevvGShR/98rzPkyitCoWVVmeswUgiFBZw77Vo3x1IDAoK+ewbmb6qP9M6fV9m9NKGOtpDcFEvH7sts4FWhB1TAuLkrpISVI1Jzm8sjXood9rOkskm6wMtFeCRY1Ua3X2RhLN89GipblSPG9nJtrEJgiRSPq3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789051186; c=relaxed/simple;
	bh=JI4iQGLwydwRjXYc5J1zV7jakad8rFEkuA4tqflhpiU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R4KFLw+O2/uf3BmmY6Rio1YnfRFGam7CMnpoHNDzRNYSkp9b4F1AFW06oQZUFd1pRwiHdE30pnc3oSHgN2J8TrOo8nWTphEpPnhx5M+oT2eZ/5SJFLe7k0iUNM75dRwGWS3jbbkoXTHfcvkWsb+qPTN4nlb4199w2uS9O+VKmes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nfsmWVMn; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nfsmWVMn"
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-97c441e66f0so4235582241.1
        for <linux-staging@lists.linux.dev>; Thu, 10 Sep 2026 07:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789051184; x=1789655984; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y+nHzA7DgJpjRsVKOfOdWebTfWI81vQ4lVsJ7aDwxXU=;
        b=nfsmWVMn+d5LvWDgERDgKFTMiH2dr3KFTCiS9htYFhVfvCTS5WXrY1OnHvGHf/4pCF
         7Hwn6prlAyIc3zlBUMOlgCKobFAZ7/FOrGtvWWtsGpbYAsJz/qZSqxCjGH7WD+voM0By
         UOiHAecTlQB9J8JQe7G9Kyg7ufxkRefnLHEufM0ebd5vyyOKgCeIUU4KwmKEQMXy0Dup
         n3iayhzykK2vrKWoWHkPjoKQr1sCMTeo68XLgbSg7gMHWnkI0liLoEJ/wHdfGknwaIZE
         7/8HD24Ana1WehB1a/rjQldaWIqK0ZcgHCDKuyLzOg4Ua3yKpE+VBHpVwkAdohe0Yxgm
         YqMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789051184; x=1789655984;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y+nHzA7DgJpjRsVKOfOdWebTfWI81vQ4lVsJ7aDwxXU=;
        b=je+O3Zq5G7Qj42nf39jO8d1TNiMYRAdMt6MPeqsQeNj19vFVK61H8RJXmZyEbJhJy9
         BhczHqTFZNNFxdUVBmdgmZE3hgYHg3tpSm4NOscRdFjIT5zyxvSlxDNGLEIzLwUI1hVr
         +GzGKHQ5ArXczACVMOMnmIz98X9junVeLFuIGsJnjKP7ARUgcuDj5toHHP0MByhi8o3p
         yEpE0josUhpPmno4nhfAual+2+qPiwgBUxZ1b5Zhiz/MKlQShufla06aLydjqS3plW78
         EiPp4xNwJiUX1UmVIbejwwHtP2xzLBWgi+yexLg0cFYVo+4xm5f2u8a/mPpZPfZSe4Bi
         sj9w==
X-Forwarded-Encrypted: i=1; AKwUvBwKX5o+IloCl/k657RHbkq6EOLJKdYA9KG1pj3let9sLvu00MMCdD/048Vad7cKwq3XdkYJImESJs5rgfV2@lists.linux.dev
X-Gm-Message-State: AFuF++lqhjTeT/n2fBXj9SBhsZLTmgWSeJLpqH6uDgKpKHvuTrOJ3r5a
	hHbwqPK5eobfY0J8SWvv37FTQqiWVxSi1KmJYUvBY0Ssd8VKz67kzTv2
X-Gm-Gg: AYBFou2efnfK2nezWuZPsfBxWfz5SZdpCZti7nnTmcSU+SHl2SXe+booLG0GvhKd2aY
	n2ueWee23NaGsUN/ROPXzwT2oroYXNfJQD+vv81B2/zzK/odY6X/NJF2HXRZ/2ZHBzoIeCVmTGp
	mz2s5MDiphCLEG+PXEieoRd9HPu46xudbIvcXpJ3e7RByYI6Xz7ByOqbYoESZ1n6G82hpWN3DWa
	Qxu/UrwxLpU2pYiq04qykIJNCJuuOW7driTUuldb2ztORqQS6H1VxsvIWXK85nCMvhpz0DjB9Ah
	ICg2fMj0yfzgsIjZKk6/s6NbSbqOW5fAzCi1c18ywH/AX0ea3DuabFpEyu2IIvMMZueBOYTy0Li
	C0IAa3HZ8fti+wC/OHUrCVpRydowdofmA4G8iN23L+FzPaksuOMjRoHIq8xUELbjOWro3WT2qQ7
	If1TPIpW69L1+dFOkXl5oiNhXXAlf+u3QKnjNaG7qW52maka1+vqjiFfjUoGOpiyhz
X-Received: by 2002:a05:6102:560c:b0:786:aae:aefc with SMTP id ada2fe7eead31-78a4aa9d9dcmr22415887137.13.1789051183372;
        Thu, 10 Sep 2026 07:39:43 -0700 (PDT)
Received: from frese.. ([200.20.225.238])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a47ae301fsm13568251137.7.2026.09.10.07.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 07:39:42 -0700 (PDT)
From: Enzo Frese <freseenzo@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Enzo Frese <freseenzo@gmail.com>,
	Jennifer Guo <guojy.bj@gmail.com>,
	Andrei Khomenkov <khomenkov@mailbox.org>,
	Dan Carpenter <error27@gmail.com>,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>,
	Michael Straube <straube.linux@gmail.com>,
	=?UTF-8?q?Michael=20Steinm=C3=B6tzger?= <m.steinmoetzger@gmail.com>,
	Navaneeth K <knavaneeth786@gmail.com>,
	Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>,
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] staging: rtl8723bs: avoid CamelCase in odm_DynamicBBPowerSaving.c
Date: Thu, 10 Sep 2026 11:38:47 -0300
Message-ID: <20260910143857.154320-1-freseenzo@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename odm_DynamicBBPowerSavingInit to odm_dynamic_bb_power_saving_init,
and rename local variables and struct ps_t fields (PreCCAState,
CurCCAState, PreRFState, CurRFState, Rssi_val_min, Reg874, RegC70,
Reg85C, RegA74, bForceInNormal, Rssi_Up_bound, Rssi_Low_bound) to
avoid CamelCase, which is not accepted by checkpatch.pl.

Signed-off-by: Enzo Frese <freseenzo@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm.c           |  2 +-
 .../rtl8723bs/hal/odm_DynamicBBPowerSaving.c  | 72 +++++++++----------
 .../rtl8723bs/hal/odm_DynamicBBPowerSaving.h  | 16 ++---
 3 files changed, 45 insertions(+), 45 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm.c b/drivers/staging/rtl8723bs/hal/odm.c
index d18df407e365..e61200a5d6d0 100644
--- a/drivers/staging/rtl8723bs/hal/odm.c
+++ b/drivers/staging/rtl8723bs/hal/odm.c
@@ -580,7 +580,7 @@ void ODM_DMInit(struct dm_odm_t *pDM_Odm)
 
 	ODM_ClearTxPowerTrackingState(pDM_Odm);
 
-	odm_DynamicBBPowerSavingInit(pDM_Odm);
+	odm_dynamic_bb_power_saving_init(pDM_Odm);
 	odm_DynamicTxPowerInit(pDM_Odm);
 
 	odm_SwAntDetectInit(pDM_Odm);
diff --git a/drivers/staging/rtl8723bs/hal/odm_DynamicBBPowerSaving.c b/drivers/staging/rtl8723bs/hal/odm_DynamicBBPowerSaving.c
index ed743f6678dc..e5011d1043ee 100644
--- a/drivers/staging/rtl8723bs/hal/odm_DynamicBBPowerSaving.c
+++ b/drivers/staging/rtl8723bs/hal/odm_DynamicBBPowerSaving.c
@@ -7,69 +7,69 @@
 
 #include "odm_precomp.h"
 
-void odm_DynamicBBPowerSavingInit(void *pDM_VOID)
+void odm_dynamic_bb_power_saving_init(void *pDM_VOID)
 {
 	struct dm_odm_t *pDM_Odm = (struct dm_odm_t *)pDM_VOID;
 	struct ps_t *pDM_PSTable = &pDM_Odm->DM_PSTable;
 
-	pDM_PSTable->PreCCAState = CCA_MAX;
-	pDM_PSTable->CurCCAState = CCA_MAX;
-	pDM_PSTable->PreRFState = RF_MAX;
-	pDM_PSTable->CurRFState = RF_MAX;
-	pDM_PSTable->Rssi_val_min = 0;
+	pDM_PSTable->pre_cca_state = CCA_MAX;
+	pDM_PSTable->cur_cca_state = CCA_MAX;
+	pDM_PSTable->pre_rf_state = RF_MAX;
+	pDM_PSTable->cur_rf_state = RF_MAX;
+	pDM_PSTable->rssi_val_min = 0;
 	pDM_PSTable->initialize = 0;
 }
 
-void ODM_RF_Saving(void *pDM_VOID, u8 bForceInNormal)
+void ODM_RF_Saving(void *pDM_VOID, u8 force_in_normal)
 {
 	struct dm_odm_t *pDM_Odm = (struct dm_odm_t *)pDM_VOID;
 	struct ps_t *pDM_PSTable = &pDM_Odm->DM_PSTable;
-	u8 Rssi_Up_bound = 30;
-	u8 Rssi_Low_bound = 25;
+	u8 rssi_up_bound = 30;
+	u8 rssi_low_bound = 25;
 
 	if (pDM_Odm->PatchID == 40) { /* RT_CID_819x_FUNAI_TV */
-		Rssi_Up_bound = 50;
-		Rssi_Low_bound = 45;
+		rssi_up_bound = 50;
+		rssi_low_bound = 45;
 	}
 
 	if (pDM_PSTable->initialize == 0) {
-		pDM_PSTable->Reg874 = (PHY_QueryBBReg(pDM_Odm->Adapter, 0x874, bMaskDWord) & 0x1CC000) >> 14;
-		pDM_PSTable->RegC70 = (PHY_QueryBBReg(pDM_Odm->Adapter, 0xc70, bMaskDWord) & BIT(3)) >> 3;
-		pDM_PSTable->Reg85C = (PHY_QueryBBReg(pDM_Odm->Adapter, 0x85c, bMaskDWord) & 0xFF000000) >> 24;
-		pDM_PSTable->RegA74 = (PHY_QueryBBReg(pDM_Odm->Adapter, 0xa74, bMaskDWord) & 0xF000) >> 12;
+		pDM_PSTable->reg874 = (PHY_QueryBBReg(pDM_Odm->Adapter, 0x874, bMaskDWord) & 0x1CC000) >> 14;
+		pDM_PSTable->regc70 = (PHY_QueryBBReg(pDM_Odm->Adapter, 0xc70, bMaskDWord) & BIT(3)) >> 3;
+		pDM_PSTable->reg85c = (PHY_QueryBBReg(pDM_Odm->Adapter, 0x85c, bMaskDWord) & 0xFF000000) >> 24;
+		pDM_PSTable->rega74 = (PHY_QueryBBReg(pDM_Odm->Adapter, 0xa74, bMaskDWord) & 0xF000) >> 12;
 		/* Reg818 = PHY_QueryBBReg(padapter, 0x818, bMaskDWord); */
 		pDM_PSTable->initialize = 1;
 	}
 
-	if (!bForceInNormal) {
+	if (!force_in_normal) {
 		if (pDM_Odm->RSSI_Min != 0xFF) {
-			if (pDM_PSTable->PreRFState == RF_Normal) {
-				if (pDM_Odm->RSSI_Min >= Rssi_Up_bound)
-					pDM_PSTable->CurRFState = RF_Save;
+			if (pDM_PSTable->pre_rf_state == RF_Normal) {
+				if (pDM_Odm->RSSI_Min >= rssi_up_bound)
+					pDM_PSTable->cur_rf_state = RF_Save;
 				else
-					pDM_PSTable->CurRFState = RF_Normal;
+					pDM_PSTable->cur_rf_state = RF_Normal;
 			} else {
-				if (pDM_Odm->RSSI_Min <= Rssi_Low_bound)
-					pDM_PSTable->CurRFState = RF_Normal;
+				if (pDM_Odm->RSSI_Min <= rssi_low_bound)
+					pDM_PSTable->cur_rf_state = RF_Normal;
 				else
-					pDM_PSTable->CurRFState = RF_Save;
+					pDM_PSTable->cur_rf_state = RF_Save;
 			}
 		} else {
-			pDM_PSTable->CurRFState = RF_MAX;
+			pDM_PSTable->cur_rf_state = RF_MAX;
 		}
 	} else {
-		pDM_PSTable->CurRFState = RF_Normal;
+		pDM_PSTable->cur_rf_state = RF_Normal;
 	}
 
-	if (pDM_PSTable->PreRFState != pDM_PSTable->CurRFState) {
-		if (pDM_PSTable->CurRFState == RF_Save) {
-			/* Reg874[20:18]=3'b010 */
+	if (pDM_PSTable->pre_rf_state != pDM_PSTable->cur_rf_state) {
+		if (pDM_PSTable->cur_rf_state == RF_Save) {
+			/* reg874[20:18]=3'b010 */
 			PHY_SetBBReg(pDM_Odm->Adapter, 0x874, 0x1C0000, 0x2);
-			/* RegC70[3]= 1'b0 */
+			/* regc70[3]= 1'b0 */
 			PHY_SetBBReg(pDM_Odm->Adapter, 0xc70, BIT(3), 0);
-			/* Reg85C[31:24]= 0x63 */
+			/* reg85c[31:24]= 0x63 */
 			PHY_SetBBReg(pDM_Odm->Adapter, 0x85c, 0xFF000000, 0x63);
-			/* Reg874[15:14]=2'b10 */
+			/* reg874[15:14]=2'b10 */
 			PHY_SetBBReg(pDM_Odm->Adapter, 0x874, 0xC000, 0x2);
 			/* RegA75[7:4]= 0x3 */
 			PHY_SetBBReg(pDM_Odm->Adapter, 0xa74, 0xF000, 0x3);
@@ -78,12 +78,12 @@ void ODM_RF_Saving(void *pDM_VOID, u8 bForceInNormal)
 			/* Reg818[28]= 1'b1 */
 			PHY_SetBBReg(pDM_Odm->Adapter, 0x818, BIT(28), 0x1);
 		} else {
-			PHY_SetBBReg(pDM_Odm->Adapter, 0x874, 0x1CC000, pDM_PSTable->Reg874);
-			PHY_SetBBReg(pDM_Odm->Adapter, 0xc70, BIT(3), pDM_PSTable->RegC70);
-			PHY_SetBBReg(pDM_Odm->Adapter, 0x85c, 0xFF000000, pDM_PSTable->Reg85C);
-			PHY_SetBBReg(pDM_Odm->Adapter, 0xa74, 0xF000, pDM_PSTable->RegA74);
+			PHY_SetBBReg(pDM_Odm->Adapter, 0x874, 0x1CC000, pDM_PSTable->reg874);
+			PHY_SetBBReg(pDM_Odm->Adapter, 0xc70, BIT(3), pDM_PSTable->regc70);
+			PHY_SetBBReg(pDM_Odm->Adapter, 0x85c, 0xFF000000, pDM_PSTable->reg85c);
+			PHY_SetBBReg(pDM_Odm->Adapter, 0xa74, 0xF000, pDM_PSTable->rega74);
 			PHY_SetBBReg(pDM_Odm->Adapter, 0x818, BIT(28), 0x0);
 		}
-		pDM_PSTable->PreRFState = pDM_PSTable->CurRFState;
+		pDM_PSTable->pre_rf_state = pDM_PSTable->cur_rf_state;
 	}
 }
diff --git a/drivers/staging/rtl8723bs/hal/odm_DynamicBBPowerSaving.h b/drivers/staging/rtl8723bs/hal/odm_DynamicBBPowerSaving.h
index 3ebbbfd1dd1f..0b0765ff8e15 100644
--- a/drivers/staging/rtl8723bs/hal/odm_DynamicBBPowerSaving.h
+++ b/drivers/staging/rtl8723bs/hal/odm_DynamicBBPowerSaving.h
@@ -9,23 +9,23 @@
 #define    __ODMDYNAMICBBPOWERSAVING_H__
 
 struct ps_t { /* _Dynamic_Power_Saving_ */
-	u8 PreCCAState;
-	u8 CurCCAState;
+	u8 pre_cca_state;
+	u8 cur_cca_state;
 
-	u8 PreRFState;
-	u8 CurRFState;
+	u8 pre_rf_state;
+	u8 cur_rf_state;
 
-	int Rssi_val_min;
+	int rssi_val_min;
 
 	u8 initialize;
-	u32 Reg874, RegC70, Reg85C, RegA74;
+	u32 reg874, regc70, reg85c, rega74;
 
 };
 
 #define dm_RF_Saving ODM_RF_Saving
 
-void ODM_RF_Saving(void *pDM_VOID, u8 bForceInNormal);
+void ODM_RF_Saving(void *pDM_VOID, u8 force_in_normal);
 
-void odm_DynamicBBPowerSavingInit(void *pDM_VOID);
+void odm_dynamic_bb_power_saving_init(void *pDM_VOID);
 
 #endif
-- 
2.43.0

