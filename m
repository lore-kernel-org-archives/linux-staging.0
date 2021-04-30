Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23B42F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 14:57:13 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id u3so27004515eja.12
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NRDjGF5wjUwRiaPQw2H+cRKReTA8UwpiAU5+UbMDALU=;
        b=WPKIwQ61f0kZLkUwTNTh1mG+bzhCUMbI49ZYW5nL2oL8cqgDN+4pwxX0eKT7fiM3jw
         oEcUFvUBMUAixBGZSePCFIXSnSM3G7I1IcPfWueaz+bg1VnYNXqzjw5Jy7V30gHzt5Ph
         2Co3j6sS2NFHkRxgDHR9ZvocXx5DzUhCdfCcQNcx+wMHqqJmb8y1FbloIVmZ/XJwf/5w
         dG/l3VTwykkppwQoEQVZeQweAUjgqVaKSEjwKj2OPl77lrpwbBqtzoN8IlQxElzGUTHo
         iMrdqf60tXMM5/M+jUvsf+fMBIWC63Zt+cRGBCSFIHAHHbl19F2itmkBoHUMoo5I/4IG
         VZUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NRDjGF5wjUwRiaPQw2H+cRKReTA8UwpiAU5+UbMDALU=;
        b=JsCJtblSOXk3WAJVTre1uY8TAW3f0WUdZZ9pevJ9vTq2ivUFJvgKvwof1iR4KSSAKA
         KnRFlcEZW5YJh/dW95BswFsTcdJ0uldftWnlfS+pnjOml9oMz9tD6AIulqVwc83Bhc6q
         iQ6x7uFXIphWVuY5QM1T85XA6JsoG5b7TV7mSLSu1zvvUyX77ufoavS9tDVtu9WQ+koa
         pNn0jcT90tfwcqzwfvmGugDJfCccYbb0NhZgfaRQBo0UQelRX+utlaH0cHqFm0uRbhQq
         R1hzX2MXquesdoUn7EDKn0ZE8KPHXMb4hQasuL82VFbo9orrqxOq3ThJI9LZzuc9SIPW
         xKWA==
X-Gm-Message-State: AOAM533l7r3ZP+W44q23RY36yKpQX4Fck2WbRLiqpe98sLNHYjLp+jx5
	A94tsirEesZuy9X8ESIojPU=
X-Google-Smtp-Source: ABdhPJz4zzfzQrlizqOTD82+njchkqQERkahLJMgGux7yfwQhFMVXVepAoDJErkbRK6JdnwJifb2cA==
X-Received: by 2002:a17:907:a044:: with SMTP id gz4mr4872340ejc.55.1619794632420;
        Fri, 30 Apr 2021 07:57:12 -0700 (PDT)
Received: from agape ([109.52.244.36])
        by smtp.gmail.com with ESMTPSA id v4sm2275920ejj.84.2021.04.30.07.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:57:12 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 03/43] staging: rtl8723bs: remove empty functions
Date: Fri, 30 Apr 2021 16:56:25 +0200
Message-Id: <2a0606394fec2cbb32df6ec0bf4b5974416195f6.1619794331.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619794331.git.fabioaiuto83@gmail.com>
References: <cover.1619794331.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove functions left empty after ODM_RT_TRACE deletion.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm.c         | 4 ----
 drivers/staging/rtl8723bs/hal/odm_PathDiv.c | 7 -------
 2 files changed, 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm.c b/drivers/staging/rtl8723bs/hal/odm.c
index a9f8d6a4a62c..73068a1681a9 100644
--- a/drivers/staging/rtl8723bs/hal/odm.c
+++ b/drivers/staging/rtl8723bs/hal/odm.c
@@ -807,9 +807,6 @@ void ODM_DMInit(struct dm_odm_t *pDM_Odm)
 
 	ODM_ClearTxPowerTrackingState(pDM_Odm);
 
-	if (*(pDM_Odm->mp_mode) != 1)
-		odm_PathDiversityInit(pDM_Odm);
-
 	odm_DynamicBBPowerSavingInit(pDM_Odm);
 	odm_DynamicTxPowerInit(pDM_Odm);
 
@@ -857,7 +854,6 @@ void ODM_DMWatchdog(struct dm_odm_t *pDM_Odm)
 
 	odm_RefreshRateAdaptiveMask(pDM_Odm);
 	odm_EdcaTurboCheck(pDM_Odm);
-	odm_PathDiversity(pDM_Odm);
 	ODM_CfoTracking(pDM_Odm);
 
 	ODM_TXPowerTrackingCheck(pDM_Odm);
diff --git a/drivers/staging/rtl8723bs/hal/odm_PathDiv.c b/drivers/staging/rtl8723bs/hal/odm_PathDiv.c
index bedce2c10b22..1a2e367bb306 100644
--- a/drivers/staging/rtl8723bs/hal/odm_PathDiv.c
+++ b/drivers/staging/rtl8723bs/hal/odm_PathDiv.c
@@ -7,10 +7,3 @@
 
 #include "odm_precomp.h"
 
-void odm_PathDiversityInit(void *pDM_VOID)
-{
-}
-
-void odm_PathDiversity(void *pDM_VOID)
-{
-}
-- 
2.20.1

