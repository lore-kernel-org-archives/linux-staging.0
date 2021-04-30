Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA25D2F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:44:10 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id u21so103856785ejo.13
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 00:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NRDjGF5wjUwRiaPQw2H+cRKReTA8UwpiAU5+UbMDALU=;
        b=hZfi9rYGI+nQ2waZXjTb6RNKNbcx6EmpoMwJ6Gjgx2XHJ91AZGF3q1xQqhOT/ug3d5
         tOsQAWYkSlMpmfPf1Oe1yq6Z+vyxOVM+A5nQdxNvd+7esNSNIjBPc5Uak9eOSjyT9A5k
         Kwl50WtNJXjGHZhFcLV52sRg/heeGWrSkiv12Q05YkWET+mBTvKBhC1UsFGupyBM/16z
         t9G3yMpM1SUla8ll9suTOU495SoHn5GCz97jdHJwDby90QVczdkXrbz7OaUuGs++dyA6
         NFhonIriLLJCPl3fOolNAr/4lXvZVQMg4f/bk3bMrzXSdv7aSeS025TLz6Th5d0wymMS
         8moQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NRDjGF5wjUwRiaPQw2H+cRKReTA8UwpiAU5+UbMDALU=;
        b=U+2wOtTSosuiJJYQedbV3/rljyidcERY8+giOsRgVfPcQ7Exlq/0MrSjjsassSqB/s
         olmLsyQKOS47KRpCySsOeK15fPdkW8AlEyh1hBjg1RvZwTigSUTrwF3SMdjM/BzT0EnB
         CPtj/rVpWnEylwdCYf04fK5+g6fuPE5ZQbXSs58Tw9As9b19d9JvQ3GNUCS5E6kpsKkU
         y9xPawSe2krJHSZkkY1bOawllk1+fQlYQJyTIfiPIThidBA8NBkSx0H0YAE+Hay+Maco
         EROm1RWYtltGPJXVNrP5hRnK5ctHHZwDzxo7tqA23wVwOmHa35EjdrbK7b2pfMUJACOo
         QSMA==
X-Gm-Message-State: AOAM530OCAZ6gArZAKIwdvqGqFAUGM0Koq6sFKkImYYiJhTFAXNR1G+D
	iXZuiE8vnPjqzY5ajc/lcEM=
X-Google-Smtp-Source: ABdhPJxwFmzIXdn6RjRvhfXdp7xShW+L3S2IAFYoB9lT0mEdEyZIDSdRy25J5gf7eyDjdCnikP8Fkg==
X-Received: by 2002:a17:906:fa81:: with SMTP id lt1mr351308ejb.277.1619768649574;
        Fri, 30 Apr 2021 00:44:09 -0700 (PDT)
Received: from agape ([5.171.81.86])
        by smtp.gmail.com with ESMTPSA id z14sm628725edc.62.2021.04.30.00.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 00:44:09 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/43] staging: rtl8723bs: remove empty functions
Date: Fri, 30 Apr 2021 09:43:21 +0200
Message-Id: <1430232d3b907ee4d286cc495429230a0dd4dce2.1619768150.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619768150.git.fabioaiuto83@gmail.com>
References: <cover.1619768150.git.fabioaiuto83@gmail.com>
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

