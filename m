Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82ECC3FC8
	for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 18:19:26 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id n10so42275858eda.10
        for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 11:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QgBNqKitN7XluKj+zUsL9+WAz3JD/lKOrQccDBQ8JQI=;
        b=FiY2hI8fj3XBfbJxhU32CjAAvAWk7dqluucrM3ExnrwdoVRIsn4TVAJblxrd9pLF4n
         /b7xcevhny/gNZ9xOnDXzhhS5aSx7KqaNbArjbwKDnJZeDutXnRG1uXnfsFNiVBmkiHO
         OLED89b59bG8bQAJdF2AUMEb8tKEl9YuV34vNWKfSeYlguQADIjloD+1eGqYOHqx35vh
         nb8oV5qmquRe3eMHjRCa54idcStF4UQtJisXhyfO23EYzq9Pc+3kC3M478PHEEE07s7b
         3t6ri6f1014OfAZ7NJwY69bhX+RrnpGvGz/TOs43idfIN7Ag1yoX5SrFUDnllHvkMucq
         L6PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QgBNqKitN7XluKj+zUsL9+WAz3JD/lKOrQccDBQ8JQI=;
        b=Qyzmy4KMlt4tyNh/QAT3n4wRq60iRUFIarL2S2EbZS3Zn9zkK4QgbS5oPiK6R6pKC1
         Nlg6n5LLnK1Z/pYd4vQNxQDV+A3MV8RFl/l8yllAf5JfbivuBzv2/jbFt+gdtRO+W13o
         wD5eFOOIBfew//G3eDklCxFx3TXW9Zq6RQG8h1FcgDVbhi/SM5lsO7zGKMH1Iu93Z3++
         bA5b3foiGGqDfPrTleu+690ZzXAP+Dz+ML0QVF+MhnxSE5d/0MWiOVwIhqXd5MNaj4RU
         DkzBg/wz6gdCuThdLB/5wf0lc+Z57csz2GD4lSh6jA6KafngkKJ5bQH+cfN2CnpDHs/4
         ToHA==
X-Gm-Message-State: AOAM532tTucdGl6ABxXUbWtL/C9t6liUGgaWx7b09mExTnblpL+1R0Q9
	u90NDV2EOkb4DqpA/vh3Ek0=
X-Google-Smtp-Source: ABdhPJyilrkJpFWhjhoYBgPmX0pLns4stdHI9+hic5iT49+79idGh4/BsUhhO74d1y0wUZaqyDHw3g==
X-Received: by 2002:a17:906:8608:: with SMTP id o8mr19325097ejx.470.1631989164942;
        Sat, 18 Sep 2021 11:19:24 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cde])
        by smtp.gmail.com with ESMTPSA id t19sm3903673ejb.115.2021.09.18.11.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 11:19:24 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v3 07/14] staging: r8188eu: remove macro ODM_REG
Date: Sat, 18 Sep 2021 20:18:57 +0200
Message-Id: <20210918181904.12000-8-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210918181904.12000-1-straube.linux@gmail.com>
References: <20210918181904.12000-1-straube.linux@gmail.com>
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

