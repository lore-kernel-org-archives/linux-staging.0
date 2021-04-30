Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE052F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 14:57:12 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id l4so105666645ejc.10
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1TVYammkl8ZNcJo8mdkE77hHWM+9bJ8+VczMb0ee9es=;
        b=Dt93daB2CJtDNlFPrNxjDO4adyJgk7S3oMnj3MVdXO7TgjGW1KSgLM7M1PEPd2hOLX
         NviIDIn/O1ti5AXho0QqMUqWcMJv3jH2RGFi2E5B6uGDKEQwKxJt3/ChEFLsD+YfKlc/
         8OVc4hkHsWnsZgBNXznS/fdRgIJYTvBG/jaVM/NTluZFZIBjI2Ym/8U9hPL2mchmeMB5
         pcxbOCFgSmOwFpZ0DbmMLLqgS8RyzLIuoiYi0SUubbWQHXjIr3NZ10dFGklR/j4q1vDj
         +qXg4xZZxTI8i2gb1Uv3uZUU0Vcab+KNHScRlo0FlvdIQOQIktYbVRjL+4o489YQOmjm
         +Ejw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1TVYammkl8ZNcJo8mdkE77hHWM+9bJ8+VczMb0ee9es=;
        b=jGxPdWf++Xge7e61j4wU5GZQWuOPWVRK94qWjU3+CyDMAeKlF49wCjLTxYMbmaq+9X
         LcB/mwmhoEkP4oKjZM5hH2lMGIK4BA/DtXCTMnI9NIsHz8CKyzYnEPIZpGcBqb574lAz
         Um7Ok2iR6ZdUCvIpvxHBhVF/aOy3t4r6r+vUFJzTGrVIWOnsswliBQZBs7Eg0l+2E1xp
         5HlrFZXl3aa+f2OXOrPUPaTEMHhenZznyC+l4Ti3hkjFzsoltjrkhCcLCQysyfSUde4Q
         owWVj3nGf5pO9NFhOTMWBHi70+KGn/tD0VJJLmgz0N/BoQKJbowVkI5MtIoYC86ZLxJh
         838Q==
X-Gm-Message-State: AOAM533puCBHnYKsUYO82q33m7+TXuijAZbYCGZggUCbSWzJt7M7zd6K
	3D1S+3fbSNS2d/K0NdvEKnM=
X-Google-Smtp-Source: ABdhPJzME1IcGKykGxNml2U+mzyPhC9wDKT/+uDE0I3jqKydAbzgomoY8yXUKxhUhwcO3itlldEvWw==
X-Received: by 2002:a17:906:27c3:: with SMTP id k3mr4802727ejc.519.1619794630834;
        Fri, 30 Apr 2021 07:57:10 -0700 (PDT)
Received: from agape ([109.52.244.36])
        by smtp.gmail.com with ESMTPSA id p21sm1543320edw.18.2021.04.30.07.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:57:10 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 02/43] staging: rtl8723bs: remove if-else blocks left empty by ODM_RT_TRACE deletion
Date: Fri, 30 Apr 2021 16:56:24 +0200
Message-Id: <0e1196ebf56787f62dcbfbcba1fcbc2ed37a65ce.1619794331.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619794331.git.fabioaiuto83@gmail.com>
References: <cover.1619794331.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove if-else blocks left empty by ODM_RT_TRACE deletion.
remove unused variables to suppress compiler warnings.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalPhyRf.c       | 13 -------------
 drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c |  9 +--------
 drivers/staging/rtl8723bs/hal/odm_PathDiv.c    |  8 --------
 3 files changed, 1 insertion(+), 29 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf.c b/drivers/staging/rtl8723bs/hal/HalPhyRf.c
index 2e10817bf3dd..b8e385fdda89 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf.c
@@ -118,9 +118,6 @@ void ODM_TXPowerTrackingCallback_ThermalMeter(struct adapter *Adapter)
 
 	/* 4 3. Initialize ThermalValues of RFCalibrateInfo */
 
-	if (pDM_Odm->RFCalibrateInfo.bReloadtxpowerindex)
-		{}
-
 	/* 4 4. Calculate average thermal meter */
 
 	pDM_Odm->RFCalibrateInfo.ThermalValue_AVG[pDM_Odm->RFCalibrateInfo.ThermalValue_AVG_index] = ThermalValue;
@@ -273,16 +270,6 @@ void ODM_TXPowerTrackingCallback_ThermalMeter(struct adapter *Adapter)
 		/*  to increase TX power. Otherwise, EVM will be bad. */
 		/*  */
 		/*  2012/04/25 MH Add for tx power tracking to set tx power in tx agc for 88E. */
-		if (ThermalValue > pDM_Odm->RFCalibrateInfo.ThermalValue) {
-			if (c.RfPathCount > 1)
-				{}
-
-		} else if (ThermalValue < pDM_Odm->RFCalibrateInfo.ThermalValue) { /*  Low temperature */
-
-			if (c.RfPathCount > 1)
-				{}
-
-		}
 
 		if (ThermalValue > pHalData->EEPROMThermalMeter) {
 			for (p = ODM_RF_PATH_A; p < c.RfPathCount; p++)
diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
index 471418f3f724..858aafc24931 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
@@ -689,8 +689,7 @@ static u8 phy_PathA_RxIQK8723B(
 		(tmp < 0xf)
 	)
 		result |= 0x02;
-	else							/* if Tx not OK, ignore Rx */
-		{}
+
 	return result;
 }
 
@@ -988,8 +987,6 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *padapter, bool configPathB)
 		(tmp < 0xf)
 	)
 		result |= 0x02;
-	else
-		{}
 
 	return result;
 }
@@ -1500,7 +1497,6 @@ static void phy_IQCalibrate_8723B(
 				result[t][2] = (PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_Before_IQK_A_2, bMaskDWord)&0x3FF0000)>>16;
 				result[t][3] = (PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_After_IQK_A_2, bMaskDWord)&0x3FF0000)>>16;
 			break;
-		} else {
 		}
 	}
 
@@ -1533,13 +1529,10 @@ static void phy_IQCalibrate_8723B(
 				result[t][6] = (PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_Before_IQK_A_2, bMaskDWord)&0x3FF0000)>>16;
 				result[t][7] = (PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_After_IQK_A_2, bMaskDWord)&0x3FF0000)>>16;
 				break;
-			} else {
 			}
 		}
 
 /* Allen end */
-		if (0x00 == PathBOK) {
-		}
 	}
 
 	/* Back to BB mode, load original value */
diff --git a/drivers/staging/rtl8723bs/hal/odm_PathDiv.c b/drivers/staging/rtl8723bs/hal/odm_PathDiv.c
index cfcbc3741803..bedce2c10b22 100644
--- a/drivers/staging/rtl8723bs/hal/odm_PathDiv.c
+++ b/drivers/staging/rtl8723bs/hal/odm_PathDiv.c
@@ -9,16 +9,8 @@
 
 void odm_PathDiversityInit(void *pDM_VOID)
 {
-	struct dm_odm_t *pDM_Odm = (struct dm_odm_t *)pDM_VOID;
-
-	if (!(pDM_Odm->SupportAbility & ODM_BB_PATH_DIV))
-		{}
 }
 
 void odm_PathDiversity(void *pDM_VOID)
 {
-	struct dm_odm_t *pDM_Odm = (struct dm_odm_t *)pDM_VOID;
-
-	if (!(pDM_Odm->SupportAbility & ODM_BB_PATH_DIV))
-		{}
 }
-- 
2.20.1

