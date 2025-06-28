Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DD8221FBA
	for <linux-staging@lists.linux.dev>; Sat, 28 Jun 2025 14:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751120627; cv=none; b=BgY4R4brVfMdNNfdoaKz8XHMNXnc+m1leTENudZcvi6g4POI7JGLbinwPExcqc348A8iH04hWqkQrQx1ZVc2Qyzo8cAUFLJlMFAQxS+AxVdyE0odqabGMsIXqcTapW+tViI/mBFxtRTxpe8YZDmKf2rJkrutc2RC5HFuNuWq19Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751120627; c=relaxed/simple;
	bh=y8vZHnIcnnizXNKPY2Mc8qBAg1LXMI8wsARCtaw3agw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gDaEJcb9axqSxaXaQpsBtvM4iEJyLm5Rt2KQsfeb5iCrHt+Pi7rrfx+beEuC5hB6n9HGRfgrsvCD4SStSWdOrl/ofamtdDEpLPpLMC/EeRM1ALX1uuf+c56jvINWekRYZxYeUH/JBLj5e0hQbsFas4iwxWCFpgmCbJtorWzNsf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dtVrkozI; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dtVrkozI"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ae0dd62f2adso521946566b.2
        for <linux-staging@lists.linux.dev>; Sat, 28 Jun 2025 07:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751120624; x=1751725424; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WYXNYp1TJi32LMgdotg59zB/0M2Rxxe9xf9QDl4Zu3o=;
        b=dtVrkozIQQ3FDOBWB40k6U+9+j58kZs3VOC3fsYsAg93+N9VzKGx1KCbEy6cRjDc4F
         1UKpIO62CKcfFqqhb+XJw6eSkq//V5pPsm6og2H448y2S/Lbt/iDu6EIxyxMMHe7xIe/
         xdnuCQskObJ+jkfDHn+JqYnW38/pFPuWC1P/2xjm3rFqMLfX27MuALB88p9bOToySIQr
         Fb0SOXPeTeAIM2raXFAE6Uenxs9C+3wOJl1y/qDrJOd5Zqp+N6qlsn10L6BT7IQ21obU
         98viEg9W7BJAU+lf0NvFwSRyF0PVxlCWcNnItVIJby89ib2mG6xIhN94hlbVTht4KW1h
         vcEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751120624; x=1751725424;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WYXNYp1TJi32LMgdotg59zB/0M2Rxxe9xf9QDl4Zu3o=;
        b=MM11bHezszRArqo4gZZJm9bBEY7Sr7NHslB1b0kXNgZgG0BonpQPVfz7kA5ksXalAZ
         waomNm5ZV/jx3ChYR5NWtQtYkeH5ia874pnJbhwznUqRpzmovnr5eGZIXM2to+I7Tn9d
         pTLvE1wxrpfgOFSluHknDjciHLCNq72g22QYrz1MwHX6dWPB49+L1HB29DfqHRM5mNmT
         qT/fWvq8c21SI5tripgb6Bo5RhNWL6zV4/DBP3Nu4RM2+en33R/u8W5atmqiUMILm2dn
         G7LQ15Poe7UCABIVw2/m6ItENfTaG5QfJIaEdJwB9T54Q6Oh34jlJB80yre7yjjTeXue
         meGg==
X-Forwarded-Encrypted: i=1; AJvYcCXTzL9DJ6baclvp+aMx+9M7oy5fO9ajDxrBz9OD/o/a5wSmULoWhKT/FJUh/FV39zrFPXTnNdRRuOCdSEfV@lists.linux.dev
X-Gm-Message-State: AOJu0YyCV+QtjEPSQPMXiIJ3zISDmaGby9TdAq1MJn6rn4kO2ixmagkQ
	7RbdZg2ZXDpiGpQkfekiAbxL8im/Cp6IVx47IPENG2pMFYaWatYl4kyX
X-Gm-Gg: ASbGncuRSjaxMH3KLKyoFMwqww+gi9rZf0fUqOGR6CN3haHUUBOEIknZotEe9CF7Ti5
	rqM5qrXDn91A4NTru1H4z1FCTvbMVNjcmSINIJ4HZfDIAtOEm7NHeMwUAlX52iX4EE6MmTqs52q
	zf/OrAZpdYW6qqGGQSLMPoh8/qVWOZbY7ErvcK5WsbH1gKIRsWNPcwkbshVUtokzZZeZwxxPUOq
	XaokQFiVm3n09XXx1ZcouSBUWMrFlciyU3Zxc78bDXRbhp1zLM2fGNu6VlDiahOGQqPPP+dmkLy
	eQMOgCrTjRS4oJYe7RrzsoPJ67M06MapwCIKPUwDI+ogPcQ/GsfiKnvhv6JxAtojr/CyzDjI+mP
	DGPk7sPftNOQSlIYj8ECbPmst3TwOpEyFNFRk/fp4k5J5154=
X-Google-Smtp-Source: AGHT+IFw9GhOGm58j/puukv7HldvclAFNdGzNOlslcFMYDa19bZwOEMSMxrh0dUNYYMNPJUL29yHaA==
X-Received: by 2002:a17:907:9693:b0:ae0:d201:a333 with SMTP id a640c23a62f3a-ae3500dfae5mr696619366b.30.1751120623982;
        Sat, 28 Jun 2025 07:23:43 -0700 (PDT)
Received: from localhost.localdomain (ip5f5ab8df.dynamic.kabel-deutschland.de. [95.90.184.223])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353659fe9sm325333166b.53.2025.06.28.07.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 07:23:43 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove empty functions
Date: Sat, 28 Jun 2025 16:23:30 +0200
Message-ID: <20250628142330.58045-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The functions rtw_hal_dm_deinit(), odm_CmnInfoInit_Debug(), and
odm_BasicDbgMessage() are empty, hence we can remove them to get rid of
some dead code.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c     |  4 ----
 drivers/staging/rtl8723bs/hal/odm.c          | 10 ----------
 drivers/staging/rtl8723bs/include/hal_intf.h |  1 -
 drivers/staging/rtl8723bs/os_dep/os_intfs.c  |  3 ---
 4 files changed, 18 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 0db8f623b805..6fb1e81dde42 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -38,10 +38,6 @@ void rtw_hal_dm_init(struct adapter *padapter)
 	rtl8723b_init_dm_priv(padapter);
 }
 
-void rtw_hal_dm_deinit(struct adapter *padapter)
-{
-}
-
 static void rtw_hal_init_opmode(struct adapter *padapter)
 {
 	enum ndis_802_11_network_infrastructure networkType = Ndis802_11InfrastructureMax;
diff --git a/drivers/staging/rtl8723bs/hal/odm.c b/drivers/staging/rtl8723bs/hal/odm.c
index 8d6131f0ad47..ba85efb30db2 100644
--- a/drivers/staging/rtl8723bs/hal/odm.c
+++ b/drivers/staging/rtl8723bs/hal/odm.c
@@ -315,14 +315,6 @@ static void odm_CommonInfoSelfUpdate(struct dm_odm_t *pDM_Odm)
 		pDM_Odm->bOneEntryOnly = false;
 }
 
-static void odm_CmnInfoInit_Debug(struct dm_odm_t *pDM_Odm)
-{
-}
-
-static void odm_BasicDbgMessage(struct dm_odm_t *pDM_Odm)
-{
-}
-
 /* 3 ============================================================ */
 /* 3 RATR MASK */
 /* 3 ============================================================ */
@@ -735,7 +727,6 @@ void ODM_DMInit(struct dm_odm_t *pDM_Odm)
 {
 
 	odm_CommonInfoSelfInit(pDM_Odm);
-	odm_CmnInfoInit_Debug(pDM_Odm);
 	odm_DIGInit(pDM_Odm);
 	odm_NHMCounterStatisticsInit(pDM_Odm);
 	odm_AdaptivityInit(pDM_Odm);
@@ -761,7 +752,6 @@ void ODM_DMInit(struct dm_odm_t *pDM_Odm)
 void ODM_DMWatchdog(struct dm_odm_t *pDM_Odm)
 {
 	odm_CommonInfoSelfUpdate(pDM_Odm);
-	odm_BasicDbgMessage(pDM_Odm);
 	odm_FalseAlarmCounterStatistics(pDM_Odm);
 	odm_NHMCounterStatistics(pDM_Odm);
 
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index 85de862823c2..5dddafe035c2 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -200,7 +200,6 @@ void rtw_hal_def_value_init(struct adapter *padapter);
 void rtw_hal_free_data(struct adapter *padapter);
 
 void rtw_hal_dm_init(struct adapter *padapter);
-void rtw_hal_dm_deinit(struct adapter *padapter);
 
 uint rtw_hal_init(struct adapter *padapter);
 uint rtw_hal_deinit(struct adapter *padapter);
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index 3cbfc305ede3..d757209dec0c 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -709,9 +709,6 @@ void rtw_cancel_all_timer(struct adapter *padapter)
 	rtw_clear_scan_deny(padapter);
 
 	timer_delete_sync(&padapter->recvpriv.signal_stat_timer);
-
-	/* cancel dm timer */
-	rtw_hal_dm_deinit(padapter);
 }
 
 u8 rtw_free_drv_sw(struct adapter *padapter)
-- 
2.49.0

