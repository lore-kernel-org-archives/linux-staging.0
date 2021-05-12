Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A249270
	for <linux-staging@lists.linux.dev>; Wed, 12 May 2021 08:26:19 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id b25so33662134eju.5
        for <linux-staging@lists.linux.dev>; Wed, 12 May 2021 01:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NMAtkouy/UQHrdTj1Ln2w4uJpCPejRtEz1B0Xgr6qJ4=;
        b=lRem6m6mNyxYTmNSN+B48ut74tpPFWUlTDXZTXWdJ9g3LQi+GIr5g4aWK7sTeMZ0B6
         qzSHX8pN65PW3YUd7nBFaE5C8g6EtZqzt9nkX9kdWqYH85pmYZJWp2ZOgvEoiwt8Arwf
         4DP0UflQdUg/EAOuQE1MReNMGFO16sFB/qhhEEcQdzLxY4940qlAkDHif7hWZ7C/6uJ+
         8yp+6bcsMnYjm6U1czKukgMBkanwPhKTyb41rB3HSMw4C9xd+LBXV2HY5+KZXE+7/FAe
         1NHcOmZ2Q6KIYUW6uWrTiGSfLe6rkAsR77SF/xNb//xHT9MmGTBZnRS+MKnMVV8q/TjQ
         l4PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NMAtkouy/UQHrdTj1Ln2w4uJpCPejRtEz1B0Xgr6qJ4=;
        b=h9+sGaLmjjN9Os4nEXJDbCUGGchP/CKjhOn8h64NUqSRp7OPlB3V5np2Mi25ywFrBE
         YMjG1E04B8tdjj4ihpKC+37vgZKa7ugCk5SXZ1MuT7YMFJVEHCXmi8y/DRz3zYbFyK9B
         5Z3zOK32uWX/q0gxYzbuHgyAE2nFZihxAOdqr8jPyh7SQz0kS21q0mq5L6/CQ689piwK
         nflqLl/NU7w3XhpCkhspjtV68nmsw8VRi/QF+hyW3gcPWhiID+w3gDnb51qjzm1Zg1tg
         1RFyklthPqkcpYRt03Rm8GC/8so83KYrnT4qR/Y06tvwcUJMa2vqS8TCK2qDK9rMeoYx
         Ye3Q==
X-Gm-Message-State: AOAM533HQLDU49Ae6AqUdViXO4DFhAjEH/R/AUsyA4czKEPzimGignpk
	SreELuCrwfN+CgUWFbwFgP0=
X-Google-Smtp-Source: ABdhPJy6+KsjMc7QIOlXs0YiNhWM+EIHgLXW4KiuDaN2yf7P7VhKgbzOSian+YJ1xJofsG+kn5ot9Q==
X-Received: by 2002:a17:906:3b13:: with SMTP id g19mr36287442ejf.238.1620807978124;
        Wed, 12 May 2021 01:26:18 -0700 (PDT)
Received: from linux.local (host-79-52-107-152.retail.telecomitalia.it. [79.52.107.152])
        by smtp.gmail.com with ESMTPSA id s17sm3355797ejz.78.2021.05.12.01.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 01:26:17 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH] staging: rtl8723bs: hal: Remove two set but unused variables
Date: Wed, 12 May 2021 10:26:14 +0200
Message-Id: <20210512082614.30890-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed two set but unused variables. Issue detected by GCC.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
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

