Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C533C71
	for <linux-staging@lists.linux.dev>; Fri, 14 May 2021 09:04:10 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id lz27so2344532ejb.11
        for <linux-staging@lists.linux.dev>; Fri, 14 May 2021 02:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bsPvsOJLLWsDWrctgnXx6QspWf32LGW+sbwchp6lOsA=;
        b=iil4SoAaj523yVchmt33nw6U57kM1MFKz7UiFiXqxOzuZe+m3glctKosX5iBY9bW9V
         Vw9YzDWyiDYGqjE0fq6vGHAi5JITiVarH8egPbLkwyLq6+nUn5misd8OwbxhoYNAKXEI
         ptc+HwlrPqdqEKPWPvw4/TFlRq3dD3Lzjt5HMFW79DiyDWAAC0HWRf44x4xvOqvTlCXM
         ON0Fc87gmORhgkEteNlkJ06FTT5ivHPwA20Ls8UsYpUOy6G51HwWpKekdfMsei1DhLt2
         YXhydRr2en6mhH6wlonZSfOH4fQtWRnya6GCGYeaGjbFwh9z5Qbw5YQ65siv0+a8Y7cS
         3pww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bsPvsOJLLWsDWrctgnXx6QspWf32LGW+sbwchp6lOsA=;
        b=OSm1F/NC7oFZsDaJsQKX6Pegi51ilJvi0Ewk2KL98Cg6MoffbrOEsDwL0410dYNNZR
         8E/i19eTB0R+wyZkxe2OXhbRae+dZ9kAAVJutJGAkrvsrM+FGiea+yncQhR84XXCRoNS
         WGGpXdjy17dWHIQDYqgQBSn4rMZIZad5n4M4UjqUCnmo3iVx4GcfEdWQPAgT506vmyCL
         YGNF/BDA0MPoSg+9Fo3Nha0Tah7NEssrKggmHPyl8rLOY3m0ZS0jdauiM7F02cQUui9I
         h0rZzR4sObvZu6JmSserm2B1w6jYq5Uwc1YKM9CIE6P8NYAmJLc06mg2wU4Aq0PPC091
         LQ9g==
X-Gm-Message-State: AOAM533pyA+E4qzhqx5sNjy/qgLRMWYDY51ZDVc3Wzhyce0zfs+SwxRo
	dpp6ulYpX8TVCBoKD+73Swg=
X-Google-Smtp-Source: ABdhPJyv+Zu+UsrDNZW0H+tuZMif7hDejSPLaTmCuMx4leJKCOtFw4foV3vqsjyDXwx/PwlL+M3hZQ==
X-Received: by 2002:a17:906:170d:: with SMTP id c13mr46809834eje.491.1620983049428;
        Fri, 14 May 2021 02:04:09 -0700 (PDT)
Received: from linux.local (host-79-52-107-152.retail.telecomitalia.it. [79.52.107.152])
        by smtp.gmail.com with ESMTPSA id cq9sm2446395edb.44.2021.05.14.02.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 May 2021 02:04:09 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	lkp@intel.com
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v3 1/2] staging: rtl8723bs: hal: Remove three set but unused variables
Date: Fri, 14 May 2021 11:04:00 +0200
Message-Id: <20210514090401.16123-2-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210514090401.16123-1-fmdefrancesco@gmail.com>
References: <20210514090401.16123-1-fmdefrancesco@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed three set but unused variables. Issue detected by GCC while
building for x86_64.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---

Changes from v2: Rewrote the subject line.
Changes from v1: none.

 drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
index c42fd36c88ef..3b8be8137683 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
@@ -1629,7 +1629,7 @@ void PHY_IQCalibrate_8723B(
 	s32 result[4][8];	/* last is final result */
 	u8 i, final_candidate;
 	bool bPathAOK, bPathBOK;
-	s32 RegE94, RegE9C, RegEA4, RegEAC, RegEB4, RegEBC, RegEC4, RegECC, RegTmp = 0;
+	s32 RegE94, RegE9C, RegEA4, RegEB4, RegEBC, RegEC4, RegTmp = 0;
 	bool is12simular, is13simular, is23simular;
 	bool bSingleTone = false, bCarrierSuppression = false;
 	u32 IQK_BB_REG_92C[IQK_BB_REG_NUM] = {
@@ -1646,7 +1646,6 @@ void PHY_IQCalibrate_8723B(
 /* 	u32 		Path_SEL_BB = 0; */
 	u32 		GNT_BT_default;
 	u32 		StartTime;
-	s32			ProgressingTime;
 
 	if (!ODM_CheckPowerStatus(padapter))
 		return;
@@ -1777,22 +1776,18 @@ void PHY_IQCalibrate_8723B(
 		RegE94 = result[i][0];
 		RegE9C = result[i][1];
 		RegEA4 = result[i][2];
-		RegEAC = result[i][3];
 		RegEB4 = result[i][4];
 		RegEBC = result[i][5];
 		RegEC4 = result[i][6];
-		RegECC = result[i][7];
 	}
 
 	if (final_candidate != 0xff) {
 		pDM_Odm->RFCalibrateInfo.RegE94 = RegE94 = result[final_candidate][0];
 		pDM_Odm->RFCalibrateInfo.RegE9C = RegE9C = result[final_candidate][1];
 		RegEA4 = result[final_candidate][2];
-		RegEAC = result[final_candidate][3];
 		pDM_Odm->RFCalibrateInfo.RegEB4 = RegEB4 = result[final_candidate][4];
 		pDM_Odm->RFCalibrateInfo.RegEBC = RegEBC = result[final_candidate][5];
 		RegEC4 = result[final_candidate][6];
-		RegECC = result[final_candidate][7];
 		bPathAOK = bPathBOK = true;
 	} else {
 		pDM_Odm->RFCalibrateInfo.RegE94 = pDM_Odm->RFCalibrateInfo.RegEB4 = 0x100;	/* X default value */
@@ -1844,10 +1839,6 @@ void PHY_IQCalibrate_8723B(
 	}
 
 	pDM_Odm->RFCalibrateInfo.bIQKInProgress = false;
-
-	ProgressingTime = jiffies_to_msecs(jiffies - StartTime);
-
-
 }
 
 
@@ -1856,7 +1847,6 @@ void PHY_LCCalibrate_8723B(struct dm_odm_t *pDM_Odm)
 	bool		bSingleTone = false, bCarrierSuppression = false;
 	u32 		timeout = 2000, timecount = 0;
 	u32 		StartTime;
-	s32			ProgressingTime;
 
 #if DISABLE_BB_RF
 	return;
@@ -1882,6 +1872,4 @@ void PHY_LCCalibrate_8723B(struct dm_odm_t *pDM_Odm)
 
 
 	pDM_Odm->RFCalibrateInfo.bLCKInProgress = false;
-
-	ProgressingTime = jiffies_to_msecs(jiffies - StartTime);
 }
-- 
2.31.1

