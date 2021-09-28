Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4112FB2
	for <linux-staging@lists.linux.dev>; Tue, 28 Sep 2021 13:19:45 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id d21so57885119wra.12
        for <linux-staging@lists.linux.dev>; Tue, 28 Sep 2021 06:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8HUcm5UT8JTYv5A4ahE88o0H+HS/K/Ez1md4de9EFkw=;
        b=N9h7vGgYxhTfG/rPL/UUZwjgJlgxCX7aKe58zQiLohkWQ7lAPWCbGbeIRU2VYh+26w
         Oc5xucrs/nXS5SWJwLS89YfUfu7Ddpxb+Fmh4zvgPgFoozNwSXmjmvAdFaVjipmKjl0n
         mWsXiun9+UZyIIASw+LAsdc80S/WC5kALyji3BxY10lSnSSMTljSN9lf0u4wogjQRJUU
         TRVdtwvyIxjFikbFG1xVwixWb/P7dUi66zJSI9NUeZDcJ1GKTL52JeyENPE7cdL2ZswA
         BFJg8PR3oFtow79JQkUkxsRIxT7Z5t3FD0OpHmgav90zRI/rp5J9dzNP8y213mlOYnLE
         4VWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8HUcm5UT8JTYv5A4ahE88o0H+HS/K/Ez1md4de9EFkw=;
        b=UPrVlIg40uQJD137SGtgjzaTI4dvznU0Va5oHEbeBilRyupQ4InzN4UqyGgjVjw9/W
         kZI1YMpnDuRRsvyMOKb5S1NqdJKdnrWaxAeeX3hQb+rv6s7au0sPqgVL6kV+GQ9/+PAK
         EanyCzEWvTvk+KRgaXzJ6ulGT3ZsUHzpNhOsAsbAFG/yOJMMOhJeqTo6Dqrxdr+9Y4wW
         qgx4AGUFER69cQiW0lVTXM+T5e09iAgoyA0e4b/hMJKk5N2FSMUOV+GR+zfyn3YMi+2e
         Fqu2dafzv4BsrR0z1iaX5IaxNxJJziO1duKOc5r4dIIlDJqasiditzDojbN5GshWRCod
         QUBQ==
X-Gm-Message-State: AOAM531MQ4Wr39b7OdV20qZn9NmsRNWZS5Ir1Ct3j5H5ZhHKOHFaBfGL
	4Mq+3NUIS64dhOvB/YmsQmQ=
X-Google-Smtp-Source: ABdhPJyBXkFf+ZZb89amsGVO7SyPHmvxULxEmwLibAEHQGfF0bWIv7G+AY8FvLknUNigTxKEt0zk2g==
X-Received: by 2002:a5d:64cd:: with SMTP id f13mr6264111wri.419.1632835183694;
        Tue, 28 Sep 2021 06:19:43 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::dc89])
        by smtp.gmail.com with ESMTPSA id m5sm1727030wms.41.2021.09.28.06.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 06:19:43 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/2] staging: r8188eu: remove odm_DynamicBBPowerSaving()
Date: Tue, 28 Sep 2021 15:19:29 +0200
Message-Id: <20210928131930.8866-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SupportICType is ODM_RTL8188E in this driver. So function
odm_DynamicBBPowerSaving() does nothing, remove it. It is the only
user of odm_1R_CCA(), remove that function as well.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm.c             | 54 -------------------
 drivers/staging/r8188eu/include/odm_precomp.h |  2 -
 2 files changed, 56 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index e0784e38e083..277357111452 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -205,7 +205,6 @@ void ODM_DMWatchdog(struct odm_dm_struct *pDM_Odm)
 
 	odm_RefreshRateAdaptiveMask(pDM_Odm);
 
-	odm_DynamicBBPowerSaving(pDM_Odm);
 	if ((pDM_Odm->AntDivType ==  CG_TRX_HW_ANTDIV)	||
 	    (pDM_Odm->AntDivType == CGCS_RX_HW_ANTDIV)	||
 	    (pDM_Odm->AntDivType == CG_TRX_SMART_ANTDIV))
@@ -859,59 +858,6 @@ void odm_DynamicBBPowerSavingInit(struct odm_dm_struct *pDM_Odm)
 	pDM_PSTable->initialize = 0;
 }
 
-void odm_DynamicBBPowerSaving(struct odm_dm_struct *pDM_Odm)
-{
-	if ((pDM_Odm->SupportICType != ODM_RTL8192C) && (pDM_Odm->SupportICType != ODM_RTL8723A))
-		return;
-	if (!(pDM_Odm->SupportAbility & ODM_BB_PWR_SAVE))
-		return;
-	if (!(pDM_Odm->SupportPlatform & (ODM_MP | ODM_CE)))
-		return;
-
-	/* 1 2.Power Saving for 92C */
-	if ((pDM_Odm->SupportICType == ODM_RTL8192C) && (pDM_Odm->RFType == ODM_2T2R)) {
-		odm_1R_CCA(pDM_Odm);
-	} else {
-	/*  20100628 Joseph: Turn off BB power save for 88CE because it makesthroughput unstable. */
-	/*  20100831 Joseph: Turn ON BB power save again after modifying AGC delay from 900ns ot 600ns. */
-	/* 1 3.Power Saving for 88C */
-		ODM_RF_Saving(pDM_Odm, false);
-	}
-}
-
-void odm_1R_CCA(struct odm_dm_struct *pDM_Odm)
-{
-	struct rtl_ps *pDM_PSTable = &pDM_Odm->DM_PSTable;
-
-	if (pDM_Odm->RSSI_Min != 0xFF) {
-		if (pDM_PSTable->pre_cca_state == CCA_2R) {
-			if (pDM_Odm->RSSI_Min >= 35)
-				pDM_PSTable->cur_cca_state = CCA_1R;
-			else
-				pDM_PSTable->cur_cca_state = CCA_2R;
-		} else {
-			if (pDM_Odm->RSSI_Min <= 30)
-				pDM_PSTable->cur_cca_state = CCA_2R;
-			else
-				pDM_PSTable->cur_cca_state = CCA_1R;
-		}
-	} else {
-		pDM_PSTable->cur_cca_state = CCA_MAX;
-	}
-
-	if (pDM_PSTable->pre_cca_state != pDM_PSTable->cur_cca_state) {
-		if (pDM_PSTable->cur_cca_state == CCA_1R) {
-			if (pDM_Odm->RFType == ODM_2T2R)
-				ODM_SetBBReg(pDM_Odm, 0xc04, bMaskByte0, 0x13);
-			else
-				ODM_SetBBReg(pDM_Odm, 0xc04, bMaskByte0, 0x23);
-		} else {
-			ODM_SetBBReg(pDM_Odm, 0xc04, bMaskByte0, 0x33);
-		}
-		pDM_PSTable->pre_cca_state = pDM_PSTable->cur_cca_state;
-	}
-}
-
 void ODM_RF_Saving(struct odm_dm_struct *pDM_Odm, u8 bForceInNormal)
 {
 	struct rtl_ps *pDM_PSTable = &pDM_Odm->DM_PSTable;
diff --git a/drivers/staging/r8188eu/include/odm_precomp.h b/drivers/staging/r8188eu/include/odm_precomp.h
index 6b3800894bc6..210275a51994 100644
--- a/drivers/staging/r8188eu/include/odm_precomp.h
+++ b/drivers/staging/r8188eu/include/odm_precomp.h
@@ -45,14 +45,12 @@ void odm_FalseAlarmCounterStatistics(struct odm_dm_struct *pDM_Odm);
 void odm_DIG(struct odm_dm_struct *pDM_Odm);
 void odm_CCKPacketDetectionThresh(struct odm_dm_struct *pDM_Odm);
 void odm_RefreshRateAdaptiveMaskMP(struct odm_dm_struct *pDM_Odm);
-void odm_DynamicBBPowerSaving(struct odm_dm_struct *pDM_Odm);
 void odm_SwAntDivChkAntSwitch(struct odm_dm_struct *pDM_Odm, u8 Step);
 void odm_EdcaTurboCheck(struct odm_dm_struct *pDM_Odm);
 void odm_CommonInfoSelfInit(struct odm_dm_struct *pDM_Odm);
 void odm_SwAntDivInit(struct odm_dm_struct *pDM_Odm);
 void odm_RSSIMonitorCheck(struct odm_dm_struct *pDM_Odm);
 void odm_RefreshRateAdaptiveMask(struct odm_dm_struct *pDM_Odm);
-void odm_1R_CCA(struct odm_dm_struct *pDM_Odm);
 void odm_RefreshRateAdaptiveMaskCE(struct odm_dm_struct *pDM_Odm);
 void odm_RefreshRateAdaptiveMaskAPADSL(struct odm_dm_struct *pDM_Odm);
 void odm_RSSIMonitorCheckMP(struct odm_dm_struct *pDM_Odm);
-- 
2.33.0

