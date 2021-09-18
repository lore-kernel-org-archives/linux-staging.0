Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C243FCC
	for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 09:25:12 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id l18-20020a05600c4f1200b002f8cf606262so11727805wmq.1
        for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 02:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HgLgc9yM59ExKmqslgazl+TqXbR0Gqq2UFS62UlS1Jk=;
        b=N1b1uO2vD0KXMhrTTq0mVRySSqyWwUi58Tyi93v1L8d2x+azLPZRvC86UOB16p50Ge
         buRZHWC0IG5WK1bYPyAaOPiVvq5G4J6NI18jEIQHhhcd5uwjfcEDt6bxmAOuaQ2Agtsb
         HYpCbzYFvsAOYMEclCIKVUl2EVs1wyprchLJMndx8kOJiqcqecQiQwmVpl9fii5w6bCq
         5Lt7pjnhOdq5lAhACdusOQZ29uthUUQJR14e6PVC/OAIR4s11cpjfGmFeTILZspDfcYj
         8XVFX5dxTS9gMBnIkiRkUOnjaNwUMl57S9ZLjMR6BeJnphfg5YpNHgEirG4WpiVcu6CJ
         z0xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HgLgc9yM59ExKmqslgazl+TqXbR0Gqq2UFS62UlS1Jk=;
        b=pTx+vipntD5EErzqehOfSdaCK6eWOzwXtZmkbo/41l8Cf/ge45jaTw6L8mieNlf8Ah
         WiOpUPoGEUKiHZQgKqZMef8KnfnQTYo4OF15QLl4WgEOzGD76xe08IYeEnRFViSpPKHo
         JO28NLzum+qMmXY9NcYvLOy3kod3Eonn435r6VSSwS7Tb9XfONqtgZ/pxDMQoXmtb9Cz
         873PKKEWmvlQT+5EdNs3nh7YPJ/z301/Yq8rHYRJmAzIjdbo+6YhZ305hHeEHsLXyMmJ
         BcLPOfBI6uDSk8auYRWIGwMe1D4dbnlzROcMjfz60qLFBOtLJaaAWCVKslnQAzYrg6wC
         bulQ==
X-Gm-Message-State: AOAM532iKE9GUOHmiv1jtBHZdaNKMXxsfmJ1lsbxH+hrqZCDIT+lCgIe
	uKWBdbRyBClP8GhArUAKoIc=
X-Google-Smtp-Source: ABdhPJzjH+qUW5r4KVi2JWZnD/kEwHd7oQKPn8a+6Crd44UpFQerl7qx3luCYoc7sFCMNgfokV/nEQ==
X-Received: by 2002:a1c:7304:: with SMTP id d4mr9177832wmb.125.1631957111036;
        Sat, 18 Sep 2021 02:25:11 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ae40])
        by smtp.gmail.com with ESMTPSA id 5sm4233742wmb.37.2021.09.18.02.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 02:25:10 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 08/12] staging: r8188eu: remove macro ODM_BIT
Date: Sat, 18 Sep 2021 11:24:39 +0200
Message-Id: <20210918092443.8724-9-straube.linux@gmail.com>
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

Replace and remove the macro ODM_BIT to make the code cleaner.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm.c               | 4 ++--
 drivers/staging/r8188eu/include/odm_interface.h | 6 ------
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index 1e2deb6cdb58..cb27edf657d9 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -465,7 +465,7 @@ void ODM_Write_DIG(struct odm_dm_struct *pDM_Odm, u8 CurrentIGI)
 	struct rtw_dig *pDM_DigTable = &pDM_Odm->DM_DigTable;
 
 	if (pDM_DigTable->CurIGValue != CurrentIGI) {
-		ODM_SetBBReg(pDM_Odm, ODM_REG_IGI_A_11N, ODM_BIT(IGI, pDM_Odm), CurrentIGI);
+		ODM_SetBBReg(pDM_Odm, ODM_REG_IGI_A_11N, ODM_BIT_IGI_11N, CurrentIGI);
 		pDM_DigTable->CurIGValue = CurrentIGI;
 	}
 }
@@ -521,7 +521,7 @@ void odm_DIGInit(struct odm_dm_struct *pDM_Odm)
 {
 	struct rtw_dig *pDM_DigTable = &pDM_Odm->DM_DigTable;
 
-	pDM_DigTable->CurIGValue = (u8)ODM_GetBBReg(pDM_Odm, ODM_REG_IGI_A_11N, ODM_BIT(IGI, pDM_Odm));
+	pDM_DigTable->CurIGValue = (u8)ODM_GetBBReg(pDM_Odm, ODM_REG_IGI_A_11N, ODM_BIT_IGI_11N);
 	pDM_DigTable->RssiLowThresh	= DM_DIG_THRESH_LOW;
 	pDM_DigTable->RssiHighThresh	= DM_DIG_THRESH_HIGH;
 	pDM_DigTable->FALowThresh	= DM_false_ALARM_THRESH_LOW;
diff --git a/drivers/staging/r8188eu/include/odm_interface.h b/drivers/staging/r8188eu/include/odm_interface.h
index a5a7b72815f3..3af58e853828 100644
--- a/drivers/staging/r8188eu/include/odm_interface.h
+++ b/drivers/staging/r8188eu/include/odm_interface.h
@@ -4,12 +4,6 @@
 #ifndef	__ODM_INTERFACE_H__
 #define __ODM_INTERFACE_H__
 
-#define _bit_11N(_name)			ODM_BIT_##_name##_11N
-
-#define _cat(_name, _func)	(_func##_11N(_name))
-
-#define ODM_BIT(_name, _pDM_Odm) _cat(_name, _bit)
-
 enum odm_h2c_cmd {
 	ODM_H2C_RSSI_REPORT = 0,
 	ODM_H2C_PSD_RESULT= 1,
-- 
2.33.0

