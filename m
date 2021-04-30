Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A712F9C
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 14:44:19 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id bf4so3194546edb.11
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1TVYammkl8ZNcJo8mdkE77hHWM+9bJ8+VczMb0ee9es=;
        b=ROLNYehWiCXWodRWEvtyY8XHMnwXHViRzlFr8bIHGoX/+EX9KkqUxUz+/lepmCa1RH
         /aT7tq6+Z0CWoMWDewlbNbu9E6fQdwLUNRWlLOBs5zbJwTH65DlQdzOvSCJeJ3mnswr9
         lQLRSFmQx53+xqXvt5XcOONPNKy/3MbKY/CzVIROs1ef1mtwKmNWM6jeMep2RbNP6iDH
         EgWafhvw2+T+wiTxymvm4n1c1RGTcA5Oq0BgL8XCE1VQuyaeBWfZIETbTj9tdSrF+tVt
         7cwW9dhUtV9SFcyKWn/bxUS8mJRBZquD0wf/AwzGUHHXlrLGikQnCDcbfBSlayRGF65u
         LZ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1TVYammkl8ZNcJo8mdkE77hHWM+9bJ8+VczMb0ee9es=;
        b=O18XkTDupLqI2WFcAjilDP51kCpPFiJAdsQ7kO5JqTFca4BgnTqSXZmIX9gHjsYwgB
         RvrFUz7QPVekrNzIzNYcWBVzdv8Q+NUBRxv18Eoxqecy9+87CscHvWNoWV/boQsNdsXO
         061ArSbsPboPc6pQvu8pMwb8qYDtx2M+SD7bRyzIXgz3xG2ZVv+ger9cbm/egf+YKxP5
         cFSUGJP2oLi0XibbR/bWZkw0w4I5OHegJeZe0vzIpiwmuL3ofbdObxiDX80+LBieMNCX
         Dc2PhZPy6XP0S4ua3lL4nDAEotiFCPI6lQDQzc8way+OZdRozHz6IjjVLhjBK50o44aa
         1y9A==
X-Gm-Message-State: AOAM532xDcgHyyzFKmYCQFpOR/kVyJjG1xp9s+JY5cSrpE7zMtHNrgJG
	O9DhZ+R9Vo3E498X+ulORP0=
X-Google-Smtp-Source: ABdhPJx+VUjBJSbrDV3IMHyN/udsuYcJqnFyC2Wbd/IfNvHZXpFkOhIBM0WtUzgpFo+uGgv0ZmlWMQ==
X-Received: by 2002:a05:6402:5211:: with SMTP id s17mr6457529edd.327.1619793858364;
        Fri, 30 Apr 2021 07:44:18 -0700 (PDT)
Received: from agape ([109.52.244.36])
        by smtp.gmail.com with ESMTPSA id qu23sm2138059ejb.1.2021.04.30.07.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:44:18 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/43] staging: rlt8723bs: remove if-else blocks left empty by ODM_RT_TRACE deletion
Date: Fri, 30 Apr 2021 16:43:32 +0200
Message-Id: <646608de41fb1ef915834a33453b0a99907d46b0.1619793405.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619793405.git.fabioaiuto83@gmail.com>
References: <cover.1619793405.git.fabioaiuto83@gmail.com>
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

