Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C4C5A22
	for <linux-staging@lists.linux.dev>; Sun, 20 Feb 2022 10:02:24 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id qx21so25553373ejb.13
        for <linux-staging@lists.linux.dev>; Sun, 20 Feb 2022 02:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+FtVTON5NgIkD0WmM1NUxGxYzj2A7X0c0C9dZIEX6+k=;
        b=CVX7xlP8KQUUXAWtHkmsQfk+3plBV19i057kKwZjO+yD0rIEWp4z9jTPPS3f8BBRi9
         I8KMKn8rRtLOGgI3S+ikTvwjoJA2bkjFWZ1FRdmMUcbDo0sc+fPsbVXR6sjSArIYrME8
         8yw0J75lJrf8sBocttSH9DotVycoEtoWXX9TIQvBnWRLwf+y+7J4l6CwbWfGfjmyD6ot
         i2zZ5Rgv3hqlYpd/FmQphXXmmsUMPVC3fYIw1rd33GFDZJQ3OcLyIVrB0TL4imjlWeFb
         8gRd1DWGNRb2Vr6UIGlQij1srYBgJKthnRsahrWBfoXcYzI8PxReVFjcoFGTHb1frCQu
         gwOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+FtVTON5NgIkD0WmM1NUxGxYzj2A7X0c0C9dZIEX6+k=;
        b=8FRF7/NlCumBYRlCE7zYodR9dijq2cXO/KJGkhIQUg6v+gSBvRK7SxqfZmIXOdvtpu
         5Ctma6noxDVO4zKyWeVHMLLSDRl279l1Tt9bHcoKfMThTF2Pg+0el78Wv/BNAsT5vG1r
         CB/wFx71RtaC9Kgu3SLzPyesRVrKn9FIw10aIRyco2dETBsNrpFYctSZLEhodTCqX5Mh
         o8PWbm84t0zYN0HjPsHV0Ld3ouQ9H64RjgujZmk8fSf1Cx52+yoVv0xFKuQCLMK9+oEr
         vUFXmYVm00fstBXFPtrpn20LS53LzbvpL1g1TKVAzG+qA7S/Z4yxhcmAdi6yDM/4kpQg
         zYRA==
X-Gm-Message-State: AOAM531BQ9PwO1U+6+5D78dqq37DI2RXzmIa+H/nOKFbEuiD2AZT3idq
	klqFvznn1Dz3BGWVLt57F3JSstVlcWw=
X-Google-Smtp-Source: ABdhPJziPjk3j9hUjH4ORe5Jq2hFDIhoHtCHQwiA9LAapRpxIUs3Str3j3PqVBOaU5WsZo6x65wYbQ==
X-Received: by 2002:a17:906:d935:b0:6cc:fcfc:c286 with SMTP id rn21-20020a170906d93500b006ccfcfcc286mr12151046ejb.423.1645351343160;
        Sun, 20 Feb 2022 02:02:23 -0800 (PST)
Received: from localhost.localdomain (ip5f5abb8f.dynamic.kabel-deutschland.de. [95.90.187.143])
        by smtp.gmail.com with ESMTPSA id dx7sm3265223ejb.23.2022.02.20.02.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 02:02:22 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 5/5] staging: r8188eu: remove ODM_CmnInfoUpdate()
Date: Sun, 20 Feb 2022 11:02:12 +0100
Message-Id: <20220220100212.7466-6-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220220100212.7466-1-straube.linux@gmail.com>
References: <20220220100212.7466-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Each case in ODM_CmnInfoUpdate() just sets a single variable. Set the
variables directly and remove ODM_CmnInfoUpdate().

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm.c         | 21 +--------------------
 drivers/staging/r8188eu/hal/rtl8188e_dm.c |  4 ++--
 drivers/staging/r8188eu/include/odm.h     |  7 -------
 3 files changed, 3 insertions(+), 29 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index 5d2f934d78ae..94f9b125d860 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -464,7 +464,7 @@ static void odm_RSSIMonitorCheck(struct odm_dm_struct *pDM_Odm)
 		pdmpriv->EntryMinUndecoratedSmoothedPWDB = 0;
 
 	FindMinimumRSSI(Adapter);
-	ODM_CmnInfoUpdate(&pHalData->odmpriv, ODM_CMNINFO_RSSI_MIN, pdmpriv->MinUndecoratedPWDBForDM);
+	pHalData->odmpriv.RSSI_Min = pdmpriv->MinUndecoratedPWDBForDM;
 }
 
 static void odm_TXPowerTrackingThermalMeterInit(struct odm_dm_struct *pDM_Odm)
@@ -639,25 +639,6 @@ void ODM_CmnInfoInit(struct odm_dm_struct *pDM_Odm, enum odm_common_info_def Cmn
 	pDM_Odm->BbSwingFlagOfdm		= false;
 }
 
-/*  Update Band/CHannel/.. The values are dynamic but non-per-packet. */
-void ODM_CmnInfoUpdate(struct odm_dm_struct *pDM_Odm, u32 CmnInfo, u64 Value)
-{
-	/*  */
-	/*  This init variable may be changed in run time. */
-	/*  */
-	switch	(CmnInfo) {
-	case	ODM_CMNINFO_ABILITY:
-		pDM_Odm->SupportAbility = (u32)Value;
-		break;
-	case	ODM_CMNINFO_LINK:
-		pDM_Odm->bLinked = (bool)Value;
-		break;
-	case	ODM_CMNINFO_RSSI_MIN:
-		pDM_Odm->RSSI_Min = (u8)Value;
-		break;
-	}
-}
-
 void ODM_Write_DIG(struct odm_dm_struct *pDM_Odm, u8 CurrentIGI)
 {
 	struct rtw_dig *pDM_DigTable = &pDM_Odm->DM_DigTable;
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_dm.c b/drivers/staging/r8188eu/hal/rtl8188e_dm.c
index df0b412c52eb..6d28e3dc0d26 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_dm.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_dm.c
@@ -36,7 +36,7 @@ static void Update_ODM_ComInfo_88E(struct adapter *Adapter)
 	if (hal_data->AntDivCfg)
 		pdmpriv->InitODMFlag |= ODM_BB_ANT_DIV;
 
-	ODM_CmnInfoUpdate(dm_odm, ODM_CMNINFO_ABILITY, pdmpriv->InitODMFlag);
+	dm_odm->SupportAbility = pdmpriv->InitODMFlag;
 
 	dm_odm->pWirelessMode = &pmlmeext->cur_wireless_mode;
 	dm_odm->pSecChOffset = &hal_data->nCur40MhzPrimeSC;
@@ -80,7 +80,7 @@ void rtl8188e_HalDmWatchDog(struct adapter *Adapter)
 			bLinked = true;
 	}
 
-	ODM_CmnInfoUpdate(&hal_data->odmpriv, ODM_CMNINFO_LINK, bLinked);
+	hal_data->odmpriv.bLinked = bLinked;
 	ODM_DMWatchdog(&hal_data->odmpriv);
 }
 
diff --git a/drivers/staging/r8188eu/include/odm.h b/drivers/staging/r8188eu/include/odm.h
index 7a10f57b9bd3..b88b3f3d08ee 100644
--- a/drivers/staging/r8188eu/include/odm.h
+++ b/drivers/staging/r8188eu/include/odm.h
@@ -122,19 +122,14 @@ enum odm_common_info_def {
 	/*  Fixed value: */
 
 	/* HOOK BEFORE REG INIT----------- */
-	ODM_CMNINFO_ABILITY,		/* ODM_ABILITY_E */
 	ODM_CMNINFO_MP_TEST_CHIP,
 	/* HOOK BEFORE REG INIT-----------  */
 
 /* CALL BY VALUE------------- */
-	ODM_CMNINFO_LINK,
-	ODM_CMNINFO_RSSI_MIN,
 	ODM_CMNINFO_RF_ANTENNA_TYPE,		/*  u8 */
 /* CALL BY VALUE-------------*/
 };
 
-/*  2011/10/20 MH Define ODM support ability.  ODM_CMNINFO_ABILITY */
-
 enum odm_ability_def {
 	/*  BB ODM section BIT 0-15 */
 	ODM_BB_RSSI_MONITOR		= BIT(4),
@@ -455,6 +450,4 @@ void ODM_DMWatchdog(struct odm_dm_struct *pDM_Odm);
 void ODM_CmnInfoInit(struct odm_dm_struct *pDM_Odm,
 		     enum odm_common_info_def CmnInfo, u32 Value);
 
-void ODM_CmnInfoUpdate(struct odm_dm_struct *pDM_Odm, u32 CmnInfo, u64 Value);
-
 #endif
-- 
2.35.1

