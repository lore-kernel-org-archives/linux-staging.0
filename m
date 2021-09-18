Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B283FC0
	for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 09:57:59 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id t18so19323216wrb.0
        for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 02:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PoBjKuAUIrqbP3exqakCt2vgFtdI/tJF3GNqO0fS3j0=;
        b=Ox7zDSD410YxA6Jsf1uhzjcNeueHkAHxdJGWH4aU/QZL+AOmKqFUdAiZPhbv2y9F4z
         2905eK4d5AzuNopZe0VW8qd0uN4bRn1qUoAviujORUnkaPLX1JCwyMEFwIYoK/SSklUQ
         9jHliF5FhkyOZOCKnTiXkSiA2xA/3CgqT66tBUQQT9nBzfIvrubyWSGwSbF1xRCcIflB
         KHWuL6l6Wx7qlzUGLNKiEOl1xQAj1tklmyIH7a5xKl6aFpuwooXw/DaDXUmHSbXMImAW
         rDP20Q+FYwbXFadhSOT6ekDG2B2Jj2mZE6+suK3G+tk9R2WNbmqoIXfTxQ7JKbBygM/n
         R/yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PoBjKuAUIrqbP3exqakCt2vgFtdI/tJF3GNqO0fS3j0=;
        b=NSTU3kPi0YKoUzUWOUMmPb0EciI552I7AZ7mYzA8K7LPIubAKW0QSiTIitDrFVRhpq
         THcK9aZ8xVkUNb7+KWQh25ysrNgyOu/YLbJSUzs91jNQxFIx05q6dFwHczcAIeSocVo3
         YCg3R4ZUJLZV7nzkIjtbvV8bwTpp57D3BoeAY0CICJI5NPu+69B+Kjv0NQkosLeh9KQH
         YOXJjLE3sqiVlgrv1ttqVttL8hvoIsAb1U3E4fE5bXbdrCUlzSFzo42lUCluXIolBjcL
         iLMLA+obwOCMY/DPSSksTwoiKY0LrpaTDSxvSnLLViI/GN5hmOCIs0a9DptBUk0A3G+C
         wdeA==
X-Gm-Message-State: AOAM533ED+IUULn3kQraXKcQ4tRbN2FrgapEebyp7bp4ofN0NFk1PPsi
	qeUAiEcOfcku/Rv34bsxsBg=
X-Google-Smtp-Source: ABdhPJxjof1kHIGNOKsUajD2R19NjrwkzNm2It0qYZJZ7aSUELu5C6Uw2xkU1acWb4ObN3YNEclgIA==
X-Received: by 2002:a05:6000:104e:: with SMTP id c14mr17051583wrx.130.1631959077442;
        Sat, 18 Sep 2021 02:57:57 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ae40])
        by smtp.gmail.com with ESMTPSA id o26sm13013287wmc.17.2021.09.18.02.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 02:57:57 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/8] staging: r8188eu: remove ODM_DIG_LowerBound_88E()
Date: Sat, 18 Sep 2021 11:57:21 +0200
Message-Id: <20210918095727.13591-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210918095727.13591-1-straube.linux@gmail.com>
References: <20210918095727.13591-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function ODM_DIG_LowerBound_88E() is not used, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm_RTL8188E.c     | 9 ---------
 drivers/staging/r8188eu/include/odm_RTL8188E.h | 2 --
 2 files changed, 11 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm_RTL8188E.c b/drivers/staging/r8188eu/hal/odm_RTL8188E.c
index c64a291f9966..7270ce68cfd2 100644
--- a/drivers/staging/r8188eu/hal/odm_RTL8188E.c
+++ b/drivers/staging/r8188eu/hal/odm_RTL8188E.c
@@ -3,15 +3,6 @@
 
 #include "../include/odm_precomp.h"
 
-void ODM_DIG_LowerBound_88E(struct odm_dm_struct *dm_odm)
-{
-	struct rtw_dig *pDM_DigTable = &dm_odm->DM_DigTable;
-
-	if (dm_odm->AntDivType == CG_TRX_HW_ANTDIV)
-		pDM_DigTable->rx_gain_range_min = (u8)pDM_DigTable->AntDiv_RSSI_max;
-	/* If only one Entry connected */
-}
-
 static void odm_RX_HWAntDivInit(struct odm_dm_struct *dm_odm)
 {
 	u32	value32;
diff --git a/drivers/staging/r8188eu/include/odm_RTL8188E.h b/drivers/staging/r8188eu/include/odm_RTL8188E.h
index 00d2678532f8..96e50c9224aa 100644
--- a/drivers/staging/r8188eu/include/odm_RTL8188E.h
+++ b/drivers/staging/r8188eu/include/odm_RTL8188E.h
@@ -11,8 +11,6 @@
 #define	MAIN_ANT_CGCS_RX	0
 #define	AUX_ANT_CGCS_RX	1
 
-void ODM_DIG_LowerBound_88E(struct odm_dm_struct *pDM_Odm);
-
 void ODM_AntennaDiversityInit_88E(struct odm_dm_struct *pDM_Odm);
 
 void ODM_AntennaDiversity_88E(struct odm_dm_struct *pDM_Odm);
-- 
2.33.0

