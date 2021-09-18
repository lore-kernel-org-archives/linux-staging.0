Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D0C3FC0
	for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 09:25:11 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id 196-20020a1c04cd000000b002fa489ffe1fso11720840wme.4
        for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 02:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QgBNqKitN7XluKj+zUsL9+WAz3JD/lKOrQccDBQ8JQI=;
        b=k4oFhRGBOGsi+RZc+KlST7xQg9k78Sn94z5QLlQjgdWwTZVTm/lomia0kCva8a7D/e
         2SSm2q8udCVNCeF9UAVm2dWn6gPKg+D6caxAkJ9mW9JhmnZLvRi1BA7erkY9fBsvzmRg
         EpJHlze7JCa7D0ICT7i84JptffwYs8jIxToD6ZFAxZPtoiSom4skU2UC7yUAJ46tMC3T
         IL1rcj/+dHZDd96OzVUHY2mwNiVvvzPVaxNFZysqvI2FGZKHvcn33mqsZnNZnNuAk/aA
         QheG3N88JJomcdU/3BsZ3lAjgZVjxkFBCweIUr2r3ObaRt1fW3SKPb89Kd4mPSRN/zPu
         xgZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QgBNqKitN7XluKj+zUsL9+WAz3JD/lKOrQccDBQ8JQI=;
        b=H+sbEH06m6mdO+Ka9S8X5q0rA4A7mmGumfjHCm20Q5LdfZRBK3hyzxrJ29VsKU346v
         iqD52pkQ/zTtUiTjFm1eAWhQhJMk9bqwsBQ+iohw8Xsnh4D1lwMwDfFcSo+PsIdrfdGJ
         umUpFUsTvHqU/kovsmozm7RnubUv+eeduMuywCAEiUhJGbDgzgCNdxXD0rfB9jKiIetT
         cRG70yKgJx/HVRywwg8jocaMrIDLhpnc/tWtuLubPLe4YZBlUDvJNj+6BtQca6lS2/VZ
         UVQR30Pg360abCqaBO/nEosTa6PDDr/6KUYlsGrgVQs96NgKwR+QbV1Tp4StbnChAu2W
         GSyA==
X-Gm-Message-State: AOAM532X29KLUB+LbpxO2IaUuD2LyOUjuF1pjM9lctb92qGywFCt655F
	5iTXjroEfq5NyG95NUvpPRU=
X-Google-Smtp-Source: ABdhPJwSgp7ZxDORVnToZFFFW7CJg2/IcXMITZRs3APYAUNXqgBFrJ8vuF+WM+4RrUEufZEJlJVLYQ==
X-Received: by 2002:a7b:cc0b:: with SMTP id f11mr18095370wmh.2.1631957110215;
        Sat, 18 Sep 2021 02:25:10 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ae40])
        by smtp.gmail.com with ESMTPSA id 5sm4233742wmb.37.2021.09.18.02.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 02:25:09 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 07/12] staging: r8188eu: remove macro ODM_REG
Date: Sat, 18 Sep 2021 11:24:38 +0200
Message-Id: <20210918092443.8724-8-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210918092443.8724-1-straube.linux@gmail.com>
References: <20210918092443.8724-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace and remove the macro ODM_REG to make the code cleaner.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm.c               | 6 +++---
 drivers/staging/r8188eu/include/odm_interface.h | 2 --
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index 48c10b78f4a5..1e2deb6cdb58 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -465,7 +465,7 @@ void ODM_Write_DIG(struct odm_dm_struct *pDM_Odm, u8 CurrentIGI)
 	struct rtw_dig *pDM_DigTable = &pDM_Odm->DM_DigTable;
 
 	if (pDM_DigTable->CurIGValue != CurrentIGI) {
-		ODM_SetBBReg(pDM_Odm, ODM_REG(IGI_A, pDM_Odm), ODM_BIT(IGI, pDM_Odm), CurrentIGI);
+		ODM_SetBBReg(pDM_Odm, ODM_REG_IGI_A_11N, ODM_BIT(IGI, pDM_Odm), CurrentIGI);
 		pDM_DigTable->CurIGValue = CurrentIGI;
 	}
 }
@@ -521,7 +521,7 @@ void odm_DIGInit(struct odm_dm_struct *pDM_Odm)
 {
 	struct rtw_dig *pDM_DigTable = &pDM_Odm->DM_DigTable;
 
-	pDM_DigTable->CurIGValue = (u8)ODM_GetBBReg(pDM_Odm, ODM_REG(IGI_A, pDM_Odm), ODM_BIT(IGI, pDM_Odm));
+	pDM_DigTable->CurIGValue = (u8)ODM_GetBBReg(pDM_Odm, ODM_REG_IGI_A_11N, ODM_BIT(IGI, pDM_Odm));
 	pDM_DigTable->RssiLowThresh	= DM_DIG_THRESH_LOW;
 	pDM_DigTable->RssiHighThresh	= DM_DIG_THRESH_HIGH;
 	pDM_DigTable->FALowThresh	= DM_false_ALARM_THRESH_LOW;
@@ -865,7 +865,7 @@ void ODM_Write_CCK_CCA_Thres(struct odm_dm_struct *pDM_Odm, u8 CurCCK_CCAThres)
 	struct rtw_dig *pDM_DigTable = &pDM_Odm->DM_DigTable;
 
 	if (pDM_DigTable->CurCCK_CCAThres != CurCCK_CCAThres)		/* modify by Guo.Mingzhi 2012-01-03 */
-		ODM_Write1Byte(pDM_Odm, ODM_REG(CCK_CCA, pDM_Odm), CurCCK_CCAThres);
+		ODM_Write1Byte(pDM_Odm, ODM_REG_CCK_CCA_11N, CurCCK_CCAThres);
 	pDM_DigTable->PreCCK_CCAThres = pDM_DigTable->CurCCK_CCAThres;
 	pDM_DigTable->CurCCK_CCAThres = CurCCK_CCAThres;
 }
diff --git a/drivers/staging/r8188eu/include/odm_interface.h b/drivers/staging/r8188eu/include/odm_interface.h
index 4f35dcd0bf49..a5a7b72815f3 100644
--- a/drivers/staging/r8188eu/include/odm_interface.h
+++ b/drivers/staging/r8188eu/include/odm_interface.h
@@ -4,12 +4,10 @@
 #ifndef	__ODM_INTERFACE_H__
 #define __ODM_INTERFACE_H__
 
-#define _reg_11N(_name)			ODM_REG_##_name##_11N
 #define _bit_11N(_name)			ODM_BIT_##_name##_11N
 
 #define _cat(_name, _func)	(_func##_11N(_name))
 
-#define ODM_REG(_name, _pDM_Odm) _cat(_name, _reg)
 #define ODM_BIT(_name, _pDM_Odm) _cat(_name, _bit)
 
 enum odm_h2c_cmd {
-- 
2.33.0

