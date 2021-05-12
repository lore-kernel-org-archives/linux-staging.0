Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A2B70
	for <linux-staging@lists.linux.dev>; Wed, 12 May 2021 13:23:53 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id s20so29445582ejr.9
        for <linux-staging@lists.linux.dev>; Wed, 12 May 2021 06:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mu6f1EfDWo3sEPAYXZ5DgmDZlGa4c7PZIpXPaX8NC8o=;
        b=bCe4UMNYMtOFu7hRHS/vsTGZW5eD8cJKivPO0Zv+tyhasGCHFwas+WxgK1vpdxfYjh
         XcdXre7KJyUxj53hM7P6n+mdkrfUVXRMoyecwOQGNsOXVCGglaJglKsbbF9TTzxKW4Gb
         ksYVG2FBE00JxWmZNCyk9rsS+9kwYuGAdAEtfA8pAEBAZTL7GAND/1GANpsEyzJrlepY
         8Aalog8uxaM1D5U3xiOxUd6xvTpNCBbk9yoyK+XxxMkYPqZHNWgTBRv7g1SLmjtLI6/Z
         L2hfcod6e3AItisaa8PcRJuBHDAx3NbRnVCAWjQHZcfoEoZIKMM4uSbv/Q0mzfq6o3R/
         27LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mu6f1EfDWo3sEPAYXZ5DgmDZlGa4c7PZIpXPaX8NC8o=;
        b=AMRESAz7Nz3QyminwNwopsfmxgY8kufrOH3lnTcispCuidFM9xKloQydDhM/lTzGEI
         Sjk82tMTR+0jG8/wBPIF9BJuOwHMoAhMHH0558GHoiONzw0rShuBghezKuUxxO6e8rXS
         iNmwEfWDGj1Z/C22P6Kb8JCH7eITVQf5V0kSPkjWytIxvbPCgKizi5LrcM9q0SKAzFwv
         acgCzwpfTHtI6uWeDIHygPE74vPdH05D2CCSdJShXbW46b51XUHkaWLFWCKaP2rx6kXj
         IVudkVnCTjbXQwwBM35cT+yNswKvbi0ioTniQth7fWUDkY6j+L6QwXQct0JMhE2XhrF+
         QcKg==
X-Gm-Message-State: AOAM533/P5hv+ZjhCzo6j4InGb1WWQQoAIDo+ueiRNAqadUXAGkEVarA
	QMhsMUNAO9mrNq7Hpi2Kmew=
X-Google-Smtp-Source: ABdhPJy8C9WaQWbfXcVcwOlPQuenUERD29PKItKgKUxRCQP1RCl2kBeouvXx3kyRRcP5F1cg+9ts3g==
X-Received: by 2002:a17:906:2ed0:: with SMTP id s16mr12345180eji.543.1620825831946;
        Wed, 12 May 2021 06:23:51 -0700 (PDT)
Received: from linux.local (host-79-52-107-152.retail.telecomitalia.it. [79.52.107.152])
        by smtp.gmail.com with ESMTPSA id yw9sm2881705ejb.91.2021.05.12.06.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 06:23:51 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v2 1/2] staging: rtl8723bs: hal: Remove set but unused variables
Date: Wed, 12 May 2021 15:23:43 +0200
Message-Id: <20210512132344.30225-2-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210512132344.30225-1-fmdefrancesco@gmail.com>
References: <20210512132344.30225-1-fmdefrancesco@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed set but unused variables. Issue detected by GCC for x86_64.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---

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

