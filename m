Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26442CA2
	for <linux-staging@lists.linux.dev>; Wed, 29 Dec 2021 20:51:41 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id g7-20020a7bc4c7000000b00345c4bb365aso12293044wmk.4
        for <linux-staging@lists.linux.dev>; Wed, 29 Dec 2021 12:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cVYrlpfJgC3IdZnqoKx33nCnJZO80bvNlUR0uFaOeys=;
        b=DduON4OO/1m2/LbPxu2Rkvdhjvx+xRhFiAAsKedQpumsC5G/Aq5AS0ap/Vh/tP1vmI
         AQYUiMwXb+ooz6EWE0BWtEkHJ1qYfu5jx3RTLhSb0WQfi2EG2MDFfJfR9b2GYJvNbCcW
         fdtg5FtfWF+qxBBh6TcPEi1P4Kl3RnIgTwRkOsdZhLrGvcYiWv/nzRl8aXfm+Unu/kZt
         Y1KFv2JG0QtshIwSKA3YZ0NMNKjhf4rIvD7K50Qh0kJCKh+I9mCYIlgMy04OuUqExH8X
         dSHLHCs9ts3ujLMML85738wka2b90g4soeu1PLHG6PtOC+h3/bH2hhvgiKg53d+jWUNy
         PAPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cVYrlpfJgC3IdZnqoKx33nCnJZO80bvNlUR0uFaOeys=;
        b=JnswAgcckNHCa2XUKQmgFQYHn4fMhPl8+Gemg1WU+wcYzubceh3ZxoCzP8sRe/0L39
         tZhpwQmTx43ECF/NzIuS8LiWi3vFUJJIOKerj2E6q63hk2FA1HUzEH2WKzO3wSVS0DZq
         UiFqKdkaTHoBi50OeiZS/FcireW3Ay1To/sb+9GzRifR4LjlqGNSER4mECj/0jvKbAW4
         73Un4M0zezbLdK+1A4oUi94nGnIHu/7JrWcSNCbzcgZ3sQq5Wd2cpPhrUJJTrr8Dc4AJ
         brMIRwK3JXgPOzQUvt7S6CPzMj9XhOuXpWy+SciBa2Gg11MUpA3Kk20Y9hkpOshVrfUb
         BwTQ==
X-Gm-Message-State: AOAM532WWQKYnPEsPXq+2FS6ZKIoMclCcbcmhTCRgT5s1xr1hBZFcltx
	N/6s2pIFBafE2EJ4j+EWbII=
X-Google-Smtp-Source: ABdhPJzkqiqxSo2V0MykxnlQ4tjs4fbP8X7+/jUlcz6FV1RfWEW0EZ4GV7iyHPEclBBuTd+utOYcpg==
X-Received: by 2002:a05:600c:2150:: with SMTP id v16mr22854750wml.10.1640811100180;
        Wed, 29 Dec 2021 12:51:40 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::6619])
        by smtp.gmail.com with ESMTPSA id l12sm27421989wmq.2.2021.12.29.12.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Dec 2021 12:51:39 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 19/32] staging: r8188eu: make odm_RateAdaptiveMaskInit() static
Date: Wed, 29 Dec 2021 21:50:55 +0100
Message-Id: <20211229205108.26373-20-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211229205108.26373-1-straube.linux@gmail.com>
References: <20211229205108.26373-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function odm_RateAdaptiveMaskInit() is only used in odm.c.
Make it static.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm.c             | 18 +++++++++---------
 drivers/staging/r8188eu/include/odm_precomp.h |  1 -
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index 94ad1e5b9804..7394dff4f7ff 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -337,6 +337,15 @@ static void odm_CommonInfoSelfUpdate(struct odm_dm_struct *pDM_Odm)
 		pDM_Odm->bOneEntryOnly = false;
 }
 
+static void odm_RateAdaptiveMaskInit(struct odm_dm_struct *pDM_Odm)
+{
+	struct odm_rate_adapt *pOdmRA = &pDM_Odm->RateAdaptive;
+
+	pOdmRA->RATRState = DM_RATR_STA_INIT;
+	pOdmRA->HighRSSIThresh = 50;
+	pOdmRA->LowRSSIThresh = 20;
+}
+
 /* 3 Export Interface */
 
 /*  2011/09/21 MH Add to describe different team necessary resource allocate?? */
@@ -646,15 +655,6 @@ void ODM_RF_Saving(struct odm_dm_struct *pDM_Odm, u8 bForceInNormal)
 /* 3 Rate Adaptive */
 /* 3============================================================ */
 
-void odm_RateAdaptiveMaskInit(struct odm_dm_struct *pDM_Odm)
-{
-	struct odm_rate_adapt *pOdmRA = &pDM_Odm->RateAdaptive;
-
-	pOdmRA->RATRState = DM_RATR_STA_INIT;
-	pOdmRA->HighRSSIThresh = 50;
-	pOdmRA->LowRSSIThresh = 20;
-}
-
 u32 ODM_Get_Rate_Bitmap(struct odm_dm_struct *pDM_Odm, u32 macid, u32 ra_mask, u8 rssi_level)
 {
 	struct sta_info *pEntry;
diff --git a/drivers/staging/r8188eu/include/odm_precomp.h b/drivers/staging/r8188eu/include/odm_precomp.h
index e6e6c7c49130..bb4ea0b57f08 100644
--- a/drivers/staging/r8188eu/include/odm_precomp.h
+++ b/drivers/staging/r8188eu/include/odm_precomp.h
@@ -31,7 +31,6 @@
 #include "odm_RegConfig8188E.h"
 #include "odm_RTL8188E.h"
 
-void odm_RateAdaptiveMaskInit(struct odm_dm_struct *pDM_Odm);
 void odm_DynamicBBPowerSavingInit(struct odm_dm_struct *pDM_Odm);
 void odm_TXPowerTrackingInit(struct odm_dm_struct *pDM_Odm);
 void ODM_EdcaTurboInit(struct odm_dm_struct *pDM_Odm);
-- 
2.34.1

