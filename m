Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620B22C83
	for <linux-staging@lists.linux.dev>; Fri,  8 Oct 2021 17:26:30 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id o20so31845558wro.3
        for <linux-staging@lists.linux.dev>; Fri, 08 Oct 2021 10:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fah6fMg3qj46qR+RN20MjI9vCGiqxDv/9mCcKXLHlzU=;
        b=qEBIWBGsMqbjtO+6chLcT7CNx4AIvrqniID3DIg4cZqWDsqvVU/rZuFNc7Z1bjYwsz
         GtNJtOx7k7JUhDgAKz5bRnGdHSZr2Io4h09AhVCw7ZZjDR7zZVje6gi0j9qLaBSYAd4T
         AcQa0UZjetlmWQkjIQtZY88fUjWi0UjcVzVnf1EVZIutuuNi20pCoQRNyRnJy3k0MhJH
         T+iQUvp8CNVhI4BM8dMg0tHf6clkrLY81CtpMH8jqZgJygvyD3ub33L30M05u32ZidG0
         +XMyWi8chHA2Dw2sa43U9ipk6rgd5IVHSix4vnPVUk10Hmn9bXeLn4d+xLIPN/qZPOA2
         j/zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fah6fMg3qj46qR+RN20MjI9vCGiqxDv/9mCcKXLHlzU=;
        b=nmWCLEU7WKvuFUB4ESZT6JiFr5w8ViQBHDFjoHwtfv9KMLBJVr5jXO46eqWkRY366G
         7J3/N3AdX0GN7k2gb8/cSC5RMKPkLj0vuJSl4C3oSvHnNbs5UlrBL9dTuUIj7EFmr8zQ
         MuN2w0Zg5TlTJE4QjxOVtp77GcLYFfdxTbz+BT3KkbDjENq2PkdDPM6WIiGGWZx2eGAv
         dyIpRnxcndvJx0sB8FlpdCfWWL2GWqUZcD8ZA1zipDDTwXkDG/dZrSxMuWRRePxs0WZB
         PQF64389G42RVoucYws+CmmjvL4q2KGk8SmE1itnF4gOoEMl0maeb8Wo4vbtofz/4dQH
         sr1A==
X-Gm-Message-State: AOAM532My/XDxvcZeRXnRmdBYamAeRjcAtJ3muqxZ+KM0vc+xNQiSTkG
	rZ6B9hCG9igyFkbX7gPJQ7A=
X-Google-Smtp-Source: ABdhPJwL/0AmBXev2xD93BuHSliY7tqUR4qWFZvht8EafV6HhK29M/t7wRT82QC30LmkHgh8vnOCOA==
X-Received: by 2002:a05:600c:35d0:: with SMTP id r16mr4849133wmq.26.1633713988669;
        Fri, 08 Oct 2021 10:26:28 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::5d0b])
        by smtp.gmail.com with ESMTPSA id 61sm3212780wrl.94.2021.10.08.10.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 10:26:28 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: r8188eu: remove some dead code
Date: Fri,  8 Oct 2021 19:26:21 +0200
Message-Id: <20211008172621.8721-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In this driver SupportICType is ODM_RTL8188E and SupportInterface is
ODM_ITRF_USB. Remove an if statement that is never true and remove
function odm_DIGbyRSSI_LPS() which is used only in this dead if block.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
Tested on x86_64 with Inter-Tech DMG-02.

 drivers/staging/r8188eu/hal/odm.c     | 59 +--------------------------
 drivers/staging/r8188eu/include/odm.h | 14 -------
 2 files changed, 1 insertion(+), 72 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index bc49dc856a60..d3f8c7442daf 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -186,17 +186,7 @@ void ODM_DMWatchdog(struct odm_dm_struct *pDM_Odm)
 	odm_FalseAlarmCounterStatistics(pDM_Odm);
 	odm_RSSIMonitorCheck(pDM_Odm);
 
-	/* For CE Platform(SPRD or Tablet) */
-	/* 8723A or 8189ES platform */
-	/* NeilChen--2012--08--24-- */
-	/* Fix Leave LPS issue */
-	if ((pDM_Odm->Adapter->pwrctrlpriv.pwr_mode != PS_MODE_ACTIVE) &&/*  in LPS mode */
-	    ((pDM_Odm->SupportICType & (ODM_RTL8723A)) ||
-	    (pDM_Odm->SupportICType & (ODM_RTL8188E) &&
-	    ((pDM_Odm->SupportInterface  == ODM_ITRF_SDIO)))))
-		odm_DIGbyRSSI_LPS(pDM_Odm);
-	else
-		odm_DIG(pDM_Odm);
+	odm_DIG(pDM_Odm);
 	odm_CCKPacketDetectionThresh(pDM_Odm);
 
 	if (*pDM_Odm->pbPowerSaving)
@@ -456,53 +446,6 @@ void ODM_Write_DIG(struct odm_dm_struct *pDM_Odm, u8 CurrentIGI)
 	}
 }
 
-/* Need LPS mode for CE platform --2012--08--24--- */
-/* 8723AS/8189ES */
-void odm_DIGbyRSSI_LPS(struct odm_dm_struct *pDM_Odm)
-{
-	struct adapter *pAdapter = pDM_Odm->Adapter;
-	struct false_alarm_stats *pFalseAlmCnt = &pDM_Odm->FalseAlmCnt;
-
-	u8 RSSI_Lower = DM_DIG_MIN_NIC;   /* 0x1E or 0x1C */
-	u8 bFwCurrentInPSMode = false;
-	u8 CurrentIGI = pDM_Odm->RSSI_Min;
-
-	if (!(pDM_Odm->SupportICType & (ODM_RTL8723A | ODM_RTL8188E)))
-		return;
-
-	CurrentIGI = CurrentIGI + RSSI_OFFSET_DIG;
-	bFwCurrentInPSMode = pAdapter->pwrctrlpriv.bFwCurrentInPSMode;
-
-	/*  Using FW PS mode to make IGI */
-	if (bFwCurrentInPSMode) {
-		/* Adjust by  FA in LPS MODE */
-		if (pFalseAlmCnt->Cnt_all > DM_DIG_FA_TH2_LPS)
-			CurrentIGI = CurrentIGI + 2;
-		else if (pFalseAlmCnt->Cnt_all > DM_DIG_FA_TH1_LPS)
-			CurrentIGI = CurrentIGI + 1;
-		else if (pFalseAlmCnt->Cnt_all < DM_DIG_FA_TH0_LPS)
-			CurrentIGI = CurrentIGI - 1;
-	} else {
-		CurrentIGI = RSSI_Lower;
-	}
-
-	/* Lower bound checking */
-
-	/* RSSI Lower bound check */
-	if ((pDM_Odm->RSSI_Min - 10) > DM_DIG_MIN_NIC)
-		RSSI_Lower = (pDM_Odm->RSSI_Min - 10);
-	else
-		RSSI_Lower = DM_DIG_MIN_NIC;
-
-	/* Upper and Lower Bound checking */
-	if (CurrentIGI > DM_DIG_MAX_NIC)
-		CurrentIGI = DM_DIG_MAX_NIC;
-	else if (CurrentIGI < RSSI_Lower)
-		CurrentIGI = RSSI_Lower;
-
-	ODM_Write_DIG(pDM_Odm, CurrentIGI);/* ODM_Write_DIG(pDM_Odm, pDM_DigTable->CurIGValue); */
-}
-
 void odm_DIGInit(struct odm_dm_struct *pDM_Odm)
 {
 	struct rtw_dig *pDM_DigTable = &pDM_Odm->DM_DigTable;
diff --git a/drivers/staging/r8188eu/include/odm.h b/drivers/staging/r8188eu/include/odm.h
index 48d383f91c16..ac053312d817 100644
--- a/drivers/staging/r8188eu/include/odm.h
+++ b/drivers/staging/r8188eu/include/odm.h
@@ -4,18 +4,6 @@
 #ifndef	__HALDMOUTSRC_H__
 #define __HALDMOUTSRC_H__
 
-/*  */
-/* 3 PSD Handler */
-/* 3============================================================ */
-
-/*  LPS define */
-#define DM_DIG_FA_TH0_LPS		4 /*  4 in lps */
-#define DM_DIG_FA_TH1_LPS		15 /*  15 lps */
-#define DM_DIG_FA_TH2_LPS		30 /*  30 lps */
-#define RSSI_OFFSET_DIG			0x05;
-
-/*  structure and define */
-
 /*  Add for AP/ADSLpseudo DM structuer requirement. */
 /*  We need to remove to other position??? */
 struct rtl8192cd_priv {
@@ -972,8 +960,6 @@ u32 ConvertTo_dB(u32 Value);
 u32 GetPSDData(struct odm_dm_struct *pDM_Odm, unsigned int point,
 	       u8 initial_gain_psd);
 
-void odm_DIGbyRSSI_LPS(struct odm_dm_struct *pDM_Odm);
-
 u32 ODM_Get_Rate_Bitmap(struct odm_dm_struct *pDM_Odm, u32 macid,
 			u32 ra_mask, u8 rssi_level);
 
-- 
2.33.0

