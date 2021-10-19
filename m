Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8882C8B
	for <linux-staging@lists.linux.dev>; Tue, 19 Oct 2021 13:51:47 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id z77-20020a1c7e50000000b0030db7b70b6bso2810863wmc.1
        for <linux-staging@lists.linux.dev>; Tue, 19 Oct 2021 06:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z3xaDGd5SiSRwBvg63JopBcro3FsB36YKI7Ymti5lbo=;
        b=e8buj+HAEr2ahjbxvicGaqczJm6Bg2VgdSr7Jt/zIu8NzE0Da5S2cuItXH7VBwOoCm
         3Whrt22tZpWSYQdE3WyuuH5DuQgOB/bytgWo3o+xUH5AWKgRDILpoHxvlj+maOqwZr46
         Yks0Cm+vsG/ZWZ+tU0tw46ujdzHzybHLdD2qxoc4xBs5kTTSCTYwohxGOSGOnPwNDnv5
         Ksrk4lWojd825v87wHdu3fMVSeH5tnwfNSlxas90PutVNF23mE/mEVM/L+JIaj9zU+KH
         R+b9b/LjfdKzWrOlkugNpkyjgpPGEiSeaPTbz7fHAoVfDeyrT+cMNc+K23JULoib1irF
         pCBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z3xaDGd5SiSRwBvg63JopBcro3FsB36YKI7Ymti5lbo=;
        b=KPbcpbNg0v1VBoyPq+lg2uWWRPkV/2bHUV7h4N3ylJVj0ys2SVj/KalE31pJK9gKnm
         /mlJJkgw2LfbP+jpJAEkIwlv+vlw/NYM9hziiZsnkfCUMaS3Hbic3q415M1YCWUAYOOj
         lE9MzCjHhi2vOQ+1WURQm7mGg48dR6kk/q8gSpUGnYK6AkFCezA9v7V0vOvI+Q2b/Txe
         N//x6PD/MAWZmimGh+Z+e4tNGA2O7ViIPFrE+5lwlce7D5L972f8D2Jp6YfjggoX/utR
         JO5lX4Sh8maSulus3ySQH5WXm330xlP12NCyBsMH3oGQdsge+gqieyljsPWMPpDo2U+R
         Herw==
X-Gm-Message-State: AOAM532qe3TcopR15t5KA7ZevltgHLsGpxrNaooFq+FnHg83dA+ets5I
	oN6dIf+++KfOAKyEzgxqMgY=
X-Google-Smtp-Source: ABdhPJz7OlARBSlDJWkP5MueamYixkEJUYBuRFAXfxLGz5NPP8YUK11dZVEAwpIZDLPgkWn5DyKEtQ==
X-Received: by 2002:a05:600c:2212:: with SMTP id z18mr6072991wml.39.1634651505533;
        Tue, 19 Oct 2021 06:51:45 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::3de4])
        by smtp.gmail.com with ESMTPSA id i203sm2280699wma.48.2021.10.19.06.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 06:51:45 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 4/7] staging: r8188eu: remove unused cases from ODM_CmnInfo{Hook,Update}
Date: Tue, 19 Oct 2021 15:51:34 +0200
Message-Id: <20211019135137.9893-5-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211019135137.9893-1-straube.linux@gmail.com>
References: <20211019135137.9893-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused cases from ODM_CmnInfo{Hook,Update}.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm.c     | 30 ---------------------------
 drivers/staging/r8188eu/include/odm.h | 10 ---------
 2 files changed, 40 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index ef29540983b1..3aa84078319e 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -249,36 +249,12 @@ void ODM_CmnInfoHook(struct odm_dm_struct *pDM_Odm, enum odm_common_info_def Cmn
 	case	ODM_CMNINFO_CHNL:
 		pDM_Odm->pChannel = (u8 *)pValue;
 		break;
-	case	ODM_CMNINFO_DMSP_GET_VALUE:
-		pDM_Odm->pbGetValueFromOtherMac = (bool *)pValue;
-		break;
-	case	ODM_CMNINFO_BUDDY_ADAPTOR:
-		pDM_Odm->pBuddyAdapter = (struct adapter **)pValue;
-		break;
-	case	ODM_CMNINFO_DMSP_IS_MASTER:
-		pDM_Odm->pbMasterOfDMSP = (bool *)pValue;
-		break;
 	case	ODM_CMNINFO_SCAN:
 		pDM_Odm->pbScanInProcess = (bool *)pValue;
 		break;
 	case	ODM_CMNINFO_POWER_SAVING:
 		pDM_Odm->pbPowerSaving = (bool *)pValue;
 		break;
-	case	ODM_CMNINFO_ONE_PATH_CCA:
-		pDM_Odm->pOnePathCCA = (u8 *)pValue;
-		break;
-	case	ODM_CMNINFO_DRV_STOP:
-		pDM_Odm->pbDriverStopped =  (bool *)pValue;
-		break;
-	case	ODM_CMNINFO_PNP_IN:
-		pDM_Odm->pbDriverIsGoingToPnpSetPowerSleep =  (bool *)pValue;
-		break;
-	case	ODM_CMNINFO_INIT_ON:
-		pDM_Odm->pinit_adpt_in_progress =  (bool *)pValue;
-		break;
-	case	ODM_CMNINFO_ANT_TEST:
-		pDM_Odm->pAntennaTest =  (u8 *)pValue;
-		break;
 	case	ODM_CMNINFO_NET_CLOSED:
 		pDM_Odm->pbNet_closed = (bool *)pValue;
 		break;
@@ -314,12 +290,6 @@ void ODM_CmnInfoUpdate(struct odm_dm_struct *pDM_Odm, u32 CmnInfo, u64 Value)
 	case	ODM_CMNINFO_RSSI_MIN:
 		pDM_Odm->RSSI_Min = (u8)Value;
 		break;
-	case	ODM_CMNINFO_RA_THRESHOLD_HIGH:
-		pDM_Odm->RateAdaptive.HighRSSIThresh = (u8)Value;
-		break;
-	case	ODM_CMNINFO_RA_THRESHOLD_LOW:
-		pDM_Odm->RateAdaptive.LowRSSIThresh = (u8)Value;
-		break;
 	}
 }
 
diff --git a/drivers/staging/r8188eu/include/odm.h b/drivers/staging/r8188eu/include/odm.h
index 6aac90fcf3cc..1ad7ee5919ef 100644
--- a/drivers/staging/r8188eu/include/odm.h
+++ b/drivers/staging/r8188eu/include/odm.h
@@ -243,16 +243,8 @@ enum odm_common_info_def {
 	ODM_CMNINFO_BW,			/*  ODM_BW_E */
 	ODM_CMNINFO_CHNL,
 
-	ODM_CMNINFO_DMSP_GET_VALUE,
-	ODM_CMNINFO_BUDDY_ADAPTOR,
-	ODM_CMNINFO_DMSP_IS_MASTER,
 	ODM_CMNINFO_SCAN,
 	ODM_CMNINFO_POWER_SAVING,
-	ODM_CMNINFO_ONE_PATH_CCA,	/*  ODM_CCA_PATH_E */
-	ODM_CMNINFO_DRV_STOP,
-	ODM_CMNINFO_PNP_IN,
-	ODM_CMNINFO_INIT_ON,
-	ODM_CMNINFO_ANT_TEST,
 	ODM_CMNINFO_NET_CLOSED,
 	ODM_CMNINFO_MP_MODE,
 /*  POINTER REFERENCE----------- */
@@ -262,8 +254,6 @@ enum odm_common_info_def {
 	ODM_CMNINFO_WIFI_DISPLAY,
 	ODM_CMNINFO_LINK,
 	ODM_CMNINFO_RSSI_MIN,
-	ODM_CMNINFO_RA_THRESHOLD_HIGH,		/*  u8 */
-	ODM_CMNINFO_RA_THRESHOLD_LOW,		/*  u8 */
 	ODM_CMNINFO_RF_ANTENNA_TYPE,		/*  u8 */
 	ODM_CMNINFO_BT_DISABLED,
 	ODM_CMNINFO_BT_OPERATION,
-- 
2.33.1

