Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8EE72
	for <linux-staging@lists.linux.dev>; Fri, 27 Aug 2021 09:41:57 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id m25-20020a7bcb99000000b002e751bcb5dbso3897591wmi.5
        for <linux-staging@lists.linux.dev>; Fri, 27 Aug 2021 02:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f12Hn60JdHwjTyKJk0H367v8of78nOQuO/KvQJNA+J0=;
        b=Cse1IlwDVJ2WkoZnxD1i7i+T5vs0wFP2IJ8pa8iEPDK607uCsOUlosNZwJRBCPTt4S
         ncvh/CEqAK72qrWvL5ljaPWiaspyX9JuxBFWOgg7XJF8OlVkiWYoRAU6XIEbsD4w/hyw
         LgNgwNweSlXwV4jTWMZP+pPI9mGw6wWIJjRh984Nus1b5MJDW6jE8Pb3/YphTsZZF53D
         +ZNkik6s3VDKuUiMgoieTvIdIxwPMUWZ1C6LVnhRmS7PBTBRsbFA7EhafSJMjXqQkmnW
         C0tkupzzbaVbKUB1utku3VwBbgxdnFZUWTWPTKiwxngfYNGs7+Knxu9Cn4tRsM6K0CjF
         4gxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f12Hn60JdHwjTyKJk0H367v8of78nOQuO/KvQJNA+J0=;
        b=EckjUv17f2YZWRABhHOOjacG0TzrjSmUmPO5P2XGxA2JZM6UmYNu/a7oVrJNO6N/f2
         2q5IS+Tm2auODf18rCTj7Awzr+qRQMtfAIcreA4HQuQpuEe+kg+4ciBbWx09ScObmLzp
         fhvzL35z7lKc6xQlStuR6CazScT/YicSzhdAmAB/+GnfIdXlsz8UJ/QloAKBz8KicnLP
         9EaIhmXjb9rXeQZeEJH/XdjKm4g4OuzU6gyyS1gYkLEnOQ3oAETUEROSmOsrs8UYOmzg
         K8TvYta+brk9ippRrBYTDt/NV9i6xtMOhjugQWlqMbizBW/RjQtiq9ud5W8spwfm+W04
         qDEg==
X-Gm-Message-State: AOAM531Kr9Kzz+TEFkP+DXJbS8kNhtpKLJ/z7fzhlO2QdnIrAPrbhECN
	dMWMaONi36b7m5AOC0o/5YY=
X-Google-Smtp-Source: ABdhPJyZgRNI4z9Q61Wr/CAafa3C3gbRp2tOloT2kVdbJG+9i/fwZ0OAym+YGrnf2Dc3SMCgQ5vW1w==
X-Received: by 2002:a7b:c927:: with SMTP id h7mr7921759wml.154.1630057315723;
        Fri, 27 Aug 2021 02:41:55 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::884b])
        by smtp.gmail.com with ESMTPSA id b15sm6500034wru.1.2021.08.27.02.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 02:41:55 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 4/4] staging: r8188eu: rename fields of struct rtl_ps
Date: Fri, 27 Aug 2021 11:41:44 +0200
Message-Id: <20210827094144.13290-5-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210827094144.13290-1-straube.linux@gmail.com>
References: <20210827094144.13290-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename fields of struct rtl_ps to avoid camel case.

PreCCAState -> pre_cca_state
CurCCAState -> cur_cca_state

PreRFState -> pre_rf_state
CurRFState -> cur_rf_state

Rssi_val_min -> rssi_val_min

Reg874 -> reg_874
RegC70 -> reg_c70
Reg85C -> reg_85c
RegA74 -> reg_a74

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm.c     | 64 +++++++++++++--------------
 drivers/staging/r8188eu/include/odm.h | 15 ++++---
 2 files changed, 41 insertions(+), 38 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index c1449fab3a95..ed94f64d878d 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -921,11 +921,11 @@ void odm_DynamicBBPowerSavingInit(struct odm_dm_struct *pDM_Odm)
 {
 	struct rtl_ps *pDM_PSTable = &pDM_Odm->DM_PSTable;
 
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
 
@@ -954,23 +954,23 @@ void odm_1R_CCA(struct odm_dm_struct *pDM_Odm)
 	struct rtl_ps *pDM_PSTable = &pDM_Odm->DM_PSTable;
 
 	if (pDM_Odm->RSSI_Min != 0xFF) {
-		if (pDM_PSTable->PreCCAState == CCA_2R) {
+		if (pDM_PSTable->pre_cca_state == CCA_2R) {
 			if (pDM_Odm->RSSI_Min >= 35)
-				pDM_PSTable->CurCCAState = CCA_1R;
+				pDM_PSTable->cur_cca_state = CCA_1R;
 			else
-				pDM_PSTable->CurCCAState = CCA_2R;
+				pDM_PSTable->cur_cca_state = CCA_2R;
 		} else {
 			if (pDM_Odm->RSSI_Min <= 30)
-				pDM_PSTable->CurCCAState = CCA_2R;
+				pDM_PSTable->cur_cca_state = CCA_2R;
 			else
-				pDM_PSTable->CurCCAState = CCA_1R;
+				pDM_PSTable->cur_cca_state = CCA_1R;
 		}
 	} else {
-		pDM_PSTable->CurCCAState = CCA_MAX;
+		pDM_PSTable->cur_cca_state = CCA_MAX;
 	}
 
-	if (pDM_PSTable->PreCCAState != pDM_PSTable->CurCCAState) {
-		if (pDM_PSTable->CurCCAState == CCA_1R) {
+	if (pDM_PSTable->pre_cca_state != pDM_PSTable->cur_cca_state) {
+		if (pDM_PSTable->cur_cca_state == CCA_1R) {
 			if (pDM_Odm->RFType == ODM_2T2R)
 				ODM_SetBBReg(pDM_Odm, 0xc04, bMaskByte0, 0x13);
 			else
@@ -978,7 +978,7 @@ void odm_1R_CCA(struct odm_dm_struct *pDM_Odm)
 		} else {
 			ODM_SetBBReg(pDM_Odm, 0xc04, bMaskByte0, 0x33);
 		}
-		pDM_PSTable->PreCCAState = pDM_PSTable->CurCCAState;
+		pDM_PSTable->pre_cca_state = pDM_PSTable->cur_cca_state;
 	}
 }
 
@@ -993,35 +993,35 @@ void ODM_RF_Saving(struct odm_dm_struct *pDM_Odm, u8 bForceInNormal)
 		Rssi_Low_bound = 45;
 	}
 	if (pDM_PSTable->initialize == 0) {
-		pDM_PSTable->Reg874 = (ODM_GetBBReg(pDM_Odm, 0x874, bMaskDWord) & 0x1CC000) >> 14;
-		pDM_PSTable->RegC70 = (ODM_GetBBReg(pDM_Odm, 0xc70, bMaskDWord) & BIT(3)) >> 3;
-		pDM_PSTable->Reg85C = (ODM_GetBBReg(pDM_Odm, 0x85c, bMaskDWord) & 0xFF000000) >> 24;
-		pDM_PSTable->RegA74 = (ODM_GetBBReg(pDM_Odm, 0xa74, bMaskDWord) & 0xF000) >> 12;
+		pDM_PSTable->reg_874 = (ODM_GetBBReg(pDM_Odm, 0x874, bMaskDWord) & 0x1CC000) >> 14;
+		pDM_PSTable->reg_c70 = (ODM_GetBBReg(pDM_Odm, 0xc70, bMaskDWord) & BIT(3)) >> 3;
+		pDM_PSTable->reg_85c = (ODM_GetBBReg(pDM_Odm, 0x85c, bMaskDWord) & 0xFF000000) >> 24;
+		pDM_PSTable->reg_a74 = (ODM_GetBBReg(pDM_Odm, 0xa74, bMaskDWord) & 0xF000) >> 12;
 		pDM_PSTable->initialize = 1;
 	}
 
 	if (!bForceInNormal) {
 		if (pDM_Odm->RSSI_Min != 0xFF) {
-			if (pDM_PSTable->PreRFState == RF_Normal) {
+			if (pDM_PSTable->pre_rf_state == RF_Normal) {
 				if (pDM_Odm->RSSI_Min >= Rssi_Up_bound)
-					pDM_PSTable->CurRFState = RF_Save;
+					pDM_PSTable->cur_rf_state = RF_Save;
 				else
-					pDM_PSTable->CurRFState = RF_Normal;
+					pDM_PSTable->cur_rf_state = RF_Normal;
 			} else {
 				if (pDM_Odm->RSSI_Min <= Rssi_Low_bound)
-					pDM_PSTable->CurRFState = RF_Normal;
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
+	if (pDM_PSTable->pre_rf_state != pDM_PSTable->cur_rf_state) {
+		if (pDM_PSTable->cur_rf_state == RF_Save) {
 			/*  <tynli_note> 8723 RSSI report will be wrong. Set 0x874[5]=1 when enter BB power saving mode. */
 			/*  Suggested by SD3 Yu-Nan. 2011.01.20. */
 			if (pDM_Odm->SupportICType == ODM_RTL8723A)
@@ -1034,16 +1034,16 @@ void ODM_RF_Saving(struct odm_dm_struct *pDM_Odm, u8 bForceInNormal)
 			ODM_SetBBReg(pDM_Odm, 0x818, BIT(28), 0x0); /* Reg818[28]=1'b0 */
 			ODM_SetBBReg(pDM_Odm, 0x818, BIT(28), 0x1); /* Reg818[28]=1'b1 */
 		} else {
-			ODM_SetBBReg(pDM_Odm, 0x874, 0x1CC000, pDM_PSTable->Reg874);
-			ODM_SetBBReg(pDM_Odm, 0xc70, BIT(3), pDM_PSTable->RegC70);
-			ODM_SetBBReg(pDM_Odm, 0x85c, 0xFF000000, pDM_PSTable->Reg85C);
-			ODM_SetBBReg(pDM_Odm, 0xa74, 0xF000, pDM_PSTable->RegA74);
+			ODM_SetBBReg(pDM_Odm, 0x874, 0x1CC000, pDM_PSTable->reg_874);
+			ODM_SetBBReg(pDM_Odm, 0xc70, BIT(3), pDM_PSTable->reg_c70);
+			ODM_SetBBReg(pDM_Odm, 0x85c, 0xFF000000, pDM_PSTable->reg_85c);
+			ODM_SetBBReg(pDM_Odm, 0xa74, 0xF000, pDM_PSTable->reg_a74);
 			ODM_SetBBReg(pDM_Odm, 0x818, BIT(28), 0x0);
 
 			if (pDM_Odm->SupportICType == ODM_RTL8723A)
 				ODM_SetBBReg(pDM_Odm, 0x874, BIT(5), 0x0); /* Reg874[5]=1b'0 */
 		}
-		pDM_PSTable->PreRFState = pDM_PSTable->CurRFState;
+		pDM_PSTable->pre_rf_state = pDM_PSTable->cur_rf_state;
 	}
 }
 
diff --git a/drivers/staging/r8188eu/include/odm.h b/drivers/staging/r8188eu/include/odm.h
index ee051e053ac6..d9041ee576bb 100644
--- a/drivers/staging/r8188eu/include/odm.h
+++ b/drivers/staging/r8188eu/include/odm.h
@@ -123,16 +123,19 @@ struct rtw_dig {
 };
 
 struct rtl_ps {
-	u8		PreCCAState;
-	u8		CurCCAState;
+	u8		pre_cca_state;
+	u8		cur_cca_state;
 
-	u8		PreRFState;
-	u8		CurRFState;
+	u8		pre_rf_state;
+	u8		cur_rf_state;
 
-	int		    Rssi_val_min;
+	int		rssi_val_min;
 
 	u8		initialize;
-	u32		Reg874,RegC70,Reg85C,RegA74;
+	u32		reg_874;
+	u32		reg_c70;
+	u32		reg_85c;
+	u32		reg_a74;
 
 };
 
-- 
2.32.0

