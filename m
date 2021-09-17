Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1043FC9
	for <linux-staging@lists.linux.dev>; Fri, 17 Sep 2021 23:31:11 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id z184-20020a1c7ec1000000b003065f0bc631so11148484wmc.0
        for <linux-staging@lists.linux.dev>; Fri, 17 Sep 2021 16:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QgBNqKitN7XluKj+zUsL9+WAz3JD/lKOrQccDBQ8JQI=;
        b=fSIcr3bZ47loYTmX80KGQ+0ksdfed3IAeCnqwg7gr5+RR04gv7r19+oKfkiocfn+pR
         cm17Ao9Ch2ZQpczzw8YMzvJK66tETvnywXbYlHaa/Ogzvg3nBb2Wz/Yzr3/c/gv4ril6
         1mWS0Vh7DIm768hM9SiYrGu8Jg6kcU+1S/EADcgslY2afOJVg15kYSC8dN/r5XvKbnXU
         IFEUQdWEMNwVWk6dhlXLJL9RWDbEl2d22WSqh28BOjiqKySxROhZ4kmXMOETXx8HcJGD
         GjsxGtzVwlbpGbVngnPnBTfA1XCkCUxmluwUKkZ0gKlWGJu3zDQKTOW6oXn63UXFZ0+y
         AgiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QgBNqKitN7XluKj+zUsL9+WAz3JD/lKOrQccDBQ8JQI=;
        b=pZZM/XCZTjU8RKNcrTee5cKoPt2D8rVvviYUYmnB4GIXMsHAbXXikuhJd9Tye8kN+6
         lHjX/KlH1idq91rCW58JFDQAGNYGByYR25bs8H6Yhs93qtnEDJmQGU4UFpUkSFQKJN3n
         69AND20bvNSa3x13YbdI6ig8g5PQq0OsTBh4W+Wm8JfGtVcQ/t4z6kngR7LPV7oti/CW
         R5GrF0NYWT2dKKt/I1wVKq7wIXgomo5GWMR1gViXoRF1oWsf4SyICKrJabVnx9BabzCn
         y0UfI1K7VwLCela6Q3wlRL/laXG+wD29A2MP8cVfgRxWyykp+WotoZG6NkEgCvI0yyub
         Hnvw==
X-Gm-Message-State: AOAM530tC2WNSRB32/E75ES+LxwbSkF4fMc3IhChTkZ/RPOOgIeMUvRT
	qYtFg958hN/usqhlvNL/Adg=
X-Google-Smtp-Source: ABdhPJyVncYuvkkH/dfYAq0+zy/tJYezPAmJDn8xpbP8E2vMBLA1OAfHAtnZuPMxdvuTpyY4rs09LA==
X-Received: by 2002:a05:600c:4105:: with SMTP id j5mr1047777wmi.138.1631921469717;
        Fri, 17 Sep 2021 16:31:09 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ae40])
        by smtp.gmail.com with ESMTPSA id w9sm7523148wmc.19.2021.09.17.16.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 16:31:09 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 07/12] staging: r8188eu: remove macro ODM_REG
Date: Sat, 18 Sep 2021 01:30:43 +0200
Message-Id: <20210917233048.31677-8-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210917233048.31677-1-straube.linux@gmail.com>
References: <20210917233048.31677-1-straube.linux@gmail.com>
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

