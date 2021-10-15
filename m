Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91412C83
	for <linux-staging@lists.linux.dev>; Fri, 15 Oct 2021 16:35:17 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id g25so27363893wrb.2
        for <linux-staging@lists.linux.dev>; Fri, 15 Oct 2021 09:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FZ3AjY9NzrSEpOSGYQgp06cuEE/nwnpuRkFbzAwkn88=;
        b=gZi5vv7ziBin0FEsKqnoGFrOItzJ0j2yyyub2k0kANtCVNEOuE1J8tr7OdVFUzXn8K
         c5w3SNljcTmhp94pl4Uvmj42sxGiXXm4ApClZKylJXymqgcgJBAsLcjexaRnIzqKOmgB
         7fT+fMy4sUJN/B43n9RM8v5PuGH/nEH3ZSUT5zmSGSyIpymWXdUTN0VTGAFdt/aymW/S
         zKvamMozAc33lRGOHdIdehvRpJXXMbmkrxPzQdbOz2gSaWaA9jbZhAhwtYEpyGAI+F/0
         TvN8UnBzOepoVmwOHVZ+wiWcY/LdPGR+PWpeJlCYeJI/ngYgqvbfONy6KcOjpFTzJVdE
         W7eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FZ3AjY9NzrSEpOSGYQgp06cuEE/nwnpuRkFbzAwkn88=;
        b=uoYk3J7izImQV3ligAmzIBQZ0qhMTDJ9n9sqyCgq+PF8L60czAuFyDztpfeToMdVlq
         encCktbefD83kl9wFz65/NGw8Zr9qB9CvAIh3k3N4RsViG7ReBhvaqGss+YkJZfKgRv8
         EC1sFikepppwIZKFpCkuOnlZ6O1qSbGmVGC0wOP6UvZqC3DljCkR4tBh+f8cLkHEnYXV
         J/jpx0ao2f4ID61LJUYbs541P23Hi+wV3YWP+yQ0Y4EwnW2THaDhmn4Z6Kal3qjwBI7y
         0DCkM/xGnBe8BO2Uk0G0/KsUXVcPr6T9nfsf3VTzOmKmMd0jLUjc26dtBceIRrvth3L9
         oSCQ==
X-Gm-Message-State: AOAM530KfmjonERUktwJKOewtjMiJjr3LdJKH221BnKgdswg+OitFIg9
	p/zk3DoLoBcYFQQ+Puwlkgs=
X-Google-Smtp-Source: ABdhPJy7pGO99MtrHukH/WNYmtoTCdoFIyKFSNhYWeUardcKZJopbRaAgo46ntbrAZ7UHm1ib6vcMg==
X-Received: by 2002:adf:fa8f:: with SMTP id h15mr15680108wrr.323.1634315716091;
        Fri, 15 Oct 2021 09:35:16 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ad78])
        by smtp.gmail.com with ESMTPSA id c17sm5489593wrq.4.2021.10.15.09.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 09:35:15 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/7] staging: r8188eu: remove empty functions from odm.c
Date: Fri, 15 Oct 2021 18:35:01 +0200
Message-Id: <20211015163507.9091-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211015163507.9091-1-straube.linux@gmail.com>
References: <20211015163507.9091-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove empty functions from odm.c.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm.c             | 32 -------------------
 drivers/staging/r8188eu/hal/odm_HWConfig.c    |  7 +---
 drivers/staging/r8188eu/include/odm.h         |  7 ----
 drivers/staging/r8188eu/include/odm_precomp.h |  2 --
 4 files changed, 1 insertion(+), 47 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index 2178ffe41bb3..627213392795 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -196,13 +196,9 @@ void ODM_DMWatchdog(struct odm_dm_struct *pDM_Odm)
 	    (pDM_Odm->AntDivType == CGCS_RX_HW_ANTDIV)	||
 	    (pDM_Odm->AntDivType == CG_TRX_SMART_ANTDIV))
 		odm_HwAntDiv(pDM_Odm);
-	else if (pDM_Odm->AntDivType == CGCS_RX_SW_ANTDIV)
-		odm_SwAntDivChkAntSwitch(pDM_Odm, SWAW_STEP_PEAK);
 
 	ODM_TXPowerTrackingCheck(pDM_Odm);
 	odm_EdcaTurboCheck(pDM_Odm);
-
-	odm_dtc(pDM_Odm);
 }
 
 /*  Init /.. Fixed HW value. Only init time. */
@@ -1023,29 +1019,6 @@ void ODM_TXPowerTrackingCheck(struct odm_dm_struct *pDM_Odm)
 /*  We select left antenna as default antenna in initial process, modify it as needed */
 /*  */
 
-/* 3============================================================ */
-/* 3 SW Antenna Diversity */
-/* 3============================================================ */
-void ODM_SwAntDivChkPerPktRssi(struct odm_dm_struct *pDM_Odm, u8 StationID, struct odm_phy_status_info *pPhyInfo)
-{
-}
-
-void odm_SwAntDivChkAntSwitch(struct odm_dm_struct *pDM_Odm, u8 Step)
-{
-}
-
-void ODM_SwAntDivRestAfterLink(struct odm_dm_struct *pDM_Odm)
-{
-}
-
-void odm_SwAntDivChkAntSwitchCallback(struct timer_list *t)
-{
-}
-
-/* 3============================================================ */
-/* 3 SW Antenna Diversity */
-/* 3============================================================ */
-
 void odm_InitHybridAntDiv(struct odm_dm_struct *pDM_Odm)
 {
 	if (!(pDM_Odm->SupportAbility & ODM_BB_ANT_DIV))
@@ -1228,8 +1201,3 @@ void ODM_SingleDualAntennaDefaultSetting(struct odm_dm_struct *pDM_Odm)
 	pDM_SWAT_Table->ANTA_ON = true;
 	pDM_SWAT_Table->ANTB_ON = true;
 }
-
-/* Justin: According to the current RRSI to adjust Response Frame TX power, 2012/11/05 */
-void odm_dtc(struct odm_dm_struct *pDM_Odm)
-{
-}
diff --git a/drivers/staging/r8188eu/hal/odm_HWConfig.c b/drivers/staging/r8188eu/hal/odm_HWConfig.c
index b76aa93573dc..3d639b2720b2 100644
--- a/drivers/staging/r8188eu/hal/odm_HWConfig.c
+++ b/drivers/staging/r8188eu/hal/odm_HWConfig.c
@@ -376,13 +376,8 @@ static void ODM_PhyStatusQuery_92CSeries(struct odm_dm_struct *dm_odm,
 {
 	odm_RxPhyStatus92CSeries_Parsing(dm_odm, pPhyInfo, pPhyStatus,
 					 pPktinfo, adapt);
-	if (dm_odm->RSSI_test) {
-		/*  Select the packets to do RSSI checking for antenna switching. */
-		if (pPktinfo->bPacketToSelf || pPktinfo->bPacketBeacon)
-				ODM_SwAntDivChkPerPktRssi(dm_odm, pPktinfo->StationID, pPhyInfo);
-	} else {
+	if (!dm_odm->RSSI_test)
 		odm_Process_RSSIForDM(dm_odm, pPhyInfo, pPktinfo);
-	}
 }
 
 void ODM_PhyStatusQuery(struct odm_dm_struct *dm_odm,
diff --git a/drivers/staging/r8188eu/include/odm.h b/drivers/staging/r8188eu/include/odm.h
index 187f872d09b5..435626f05fd2 100644
--- a/drivers/staging/r8188eu/include/odm.h
+++ b/drivers/staging/r8188eu/include/odm.h
@@ -875,16 +875,11 @@ void ODM_SetAntenna(struct odm_dm_struct *pDM_Odm, u8 Antenna);
 
 void ODM_RF_Saving(struct odm_dm_struct *pDM_Odm, u8 bForceInNormal);
 
-void ODM_SwAntDivRestAfterLink(struct odm_dm_struct *pDM_Odm);
-
 void ODM_TXPowerTrackingCheck(struct odm_dm_struct *pDM_Odm);
 
 bool ODM_RAStateCheck(struct odm_dm_struct *pDM_Odm, s32 RSSI,
 		      bool bForceUpdate, u8 *pRATRState);
 
-void ODM_SwAntDivChkPerPktRssi(struct odm_dm_struct *pDM_Odm, u8 StationID,
-			       struct odm_phy_status_info *pPhyInfo);
-
 u32 ConvertTo_dB(u32 Value);
 
 u32 GetPSDData(struct odm_dm_struct *pDM_Odm, unsigned int point,
@@ -914,6 +909,4 @@ void ODM_AntselStatistics_88C(struct odm_dm_struct *pDM_Odm, u8 MacId,
 
 void ODM_SingleDualAntennaDefaultSetting(struct odm_dm_struct *pDM_Odm);
 
-void odm_dtc(struct odm_dm_struct *pDM_Odm);
-
 #endif
diff --git a/drivers/staging/r8188eu/include/odm_precomp.h b/drivers/staging/r8188eu/include/odm_precomp.h
index 892a2501f05a..22299f167af8 100644
--- a/drivers/staging/r8188eu/include/odm_precomp.h
+++ b/drivers/staging/r8188eu/include/odm_precomp.h
@@ -43,13 +43,11 @@ void odm_CommonInfoSelfUpdate(struct odm_dm_struct *pDM_Odm);
 void odm_FalseAlarmCounterStatistics(struct odm_dm_struct *pDM_Odm);
 void odm_DIG(struct odm_dm_struct *pDM_Odm);
 void odm_CCKPacketDetectionThresh(struct odm_dm_struct *pDM_Odm);
-void odm_SwAntDivChkAntSwitch(struct odm_dm_struct *pDM_Odm, u8 Step);
 void odm_EdcaTurboCheck(struct odm_dm_struct *pDM_Odm);
 void odm_CommonInfoSelfInit(struct odm_dm_struct *pDM_Odm);
 void odm_RSSIMonitorCheck(struct odm_dm_struct *pDM_Odm);
 void odm_RefreshRateAdaptiveMask(struct odm_dm_struct *pDM_Odm);
 void odm_TXPowerTrackingThermalMeterInit(struct odm_dm_struct *pDM_Odm);
-void odm_SwAntDivChkAntSwitchCallback(struct timer_list *t);
 void odm_InitHybridAntDiv(struct odm_dm_struct *pDM_Odm);
 void odm_HwAntDiv(struct odm_dm_struct *pDM_Odm);
 
-- 
2.33.0

