Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2126834678E
	for <linux-staging@lists.linux.dev>; Fri,  6 Feb 2026 07:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770364512; cv=none; b=olFdXueoph65f5FBDPdVmdjXYYQf9OOtWjQ3lDqUXVShQsVYyMBGlRmq59OXbJyVeXgVUzSsvrmvxDWtWfacYnB1UAhgvvrDDoMnlpCxkaDJgf713l0AEOsHoeOHLthKI9q3eFpYuObrf6qHTL5ZeqIjISpvugpHTKuBlopgChQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770364512; c=relaxed/simple;
	bh=otooM0HaLz3j7/uc1lvtqnJfrSu/hhMY81f9X2yW/es=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iLaDYsg/OpWrgcXAwvfyWSrhA2OvpFRWKKYFQCBOG8nKqwwM58S2XCJi4M9/QX/Pcy8QJhUcsxNFZXngbPOeIdOrucit/7lULy3JJXKKAwZ8IvvbzyrHEFcBssUkOai1FMvdUoXMflWTKe2aY0aV7Q/kzlYtBPutSukqZgsrISs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cw0ly5Ra; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cw0ly5Ra"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-436234ef0f0so909498f8f.1
        for <linux-staging@lists.linux.dev>; Thu, 05 Feb 2026 23:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770364510; x=1770969310; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0mJxoLnymAFaTj0pfdXZKLYayb+MzEzGAG8dpIXADiA=;
        b=Cw0ly5RaUt5B51OSrX+rDxaRFwp8Mj6o4nSPfJ17H1vsMtuF5TqT4YZcdIvz6n7nRU
         ScTUdM9zjJV2HKDYt0v2jqwD9SdBDwMcztjcFrL/1vWzpZnhIoz4qLtfJMYOA06VgPab
         HXDqTZG+UajeX1jI77sn7Bz4mMY8N1ZyN0EYfGomXSF8SSfuSu7bQDLkvRUFHE0MPVxP
         bO7/PnEekG+DJJPp3t7cwYgM8g0eg67flWN5Km/A/ZLdGPwGOHRc41F1W+UiaHctUf4u
         D4y2fRR2sM+JqJd/vf3T0EZ/bboO/SNC7neAGFwHdZ+uxjrVuovCMJFqAr0BKf0rcH88
         jP2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770364510; x=1770969310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0mJxoLnymAFaTj0pfdXZKLYayb+MzEzGAG8dpIXADiA=;
        b=wNd50s7XAGd+1T1YZuVNG4z4TOSvbg7ZgZ7Vsgi0vGkNA/qpkmS5s3hkDMNeYjreHL
         hOkQDqSZ2vD+Yh1T6DE+WerDFXMEVfPKFoM3EOlPQd2zB6LhtpNaptpCano4TOA+WYzf
         9fTePHXry2j3n+Wwes5cTybRwOdX8NXv6swBgIGVbRmq0aIeJ6gwYfCEf5+pr34AbfpM
         6gt5kHPPJRssWF2zZJu8Gw2WQC/iAg4sFPW1GQqZXqmT8zAQa+A0RU7SkzYp7yw3kHZh
         zrrbqdX7oLoSlv1M1JXi6Cevyyyt//E6AXCQd/XUZdCElmeSI6u2P3bxJPUY9sU0wovc
         pdEg==
X-Forwarded-Encrypted: i=1; AJvYcCUPiUoovIK0DPOOFDY8AhcGAUJpsl9SGXEf8W4p+iaq9pCisvqHND6o9PxFcS+JI7FH0q4lJgxYT2WC9tVE@lists.linux.dev
X-Gm-Message-State: AOJu0YxZlV6uPU9KW+itp/VVn0mUP0JewFT0F7VrLoqbDmjR1e3JFCXe
	oIPPaSiFgt9+F8Js6LXwKMtkPuEJdLvar1fLMzPiWKshPNOoJ4x5TfY=
X-Gm-Gg: AZuq6aL9dywit2zFUN/v++hIauYPVUeTgiNdeVk+a5hCcbh6PqCkcBDju4iirDezbh8
	4h60xIW24VLwcc9/YuBY0xI2pygwJjP+rzyamSRnxoY8YC/L1c1FoQsBhizQxhmYsqTdc3BnWkZ
	X0cB+Wtdsk0zCbeTajmR9/QGPsu/HIDGMooeo7SH1uqlvwO5tOVKpawJPnABVZKuqqU9jsx4KmQ
	3SgmGftjHySEkl++wYZ+qgnBHBOo1HviWwLL+IHn7PJKPH8MK+6UOwmbONlvl1VirgRM2v+uI/c
	l0S/0VRMZUAQOrtb7HTSz9RAZydksmT6xKQPpX5KyVezBod1fiKVhCUdKqa0bMuCNCM1YwPChbY
	Fdbemcy3D/SiCKvcoHsGAt7Vk04SbtVHAMExYqtQTPzblPvJhNrnQttUQTN60YypwXZ8uCEVRnW
	1E94bImA3/bVzCpAPNV3Exm7qGbO7vFUks60pZBrwGIJKMSZqBbPBj+14ghosCyMg=
X-Received: by 2002:a05:6000:401f:b0:436:1888:c0a9 with SMTP id ffacd0b85a97d-43629651d35mr2134393f8f.6.1770364510414;
        Thu, 05 Feb 2026 23:55:10 -0800 (PST)
Received: from LGPC ([31.223.131.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296bd3b8sm3836039f8f.11.2026.02.05.23.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 23:55:09 -0800 (PST)
From: lukagejak5@gmail.com
X-Google-Original-From: luka.gejak@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <luka.gejak@linux.dev>
Subject: [PATCH v2 09/26] staging: rtl8723bs: convert PSTA_INFO_T to struct sta_info *
Date: Fri,  6 Feb 2026 08:54:22 +0100
Message-ID: <20260206075439.103287-10-luka.gejak@linux.dev>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260206075439.103287-1-luka.gejak@linux.dev>
References: <20260206075439.103287-1-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luka Gejak <luka.gejak@linux.dev>

Replace the vendor-specific PSTA_INFO_T typedef with the standard Linux
kernel type 'struct sta_info *' throughout the driver.
This addresses the second TODO item: convert any remaining unusual
variable types.

Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
---
 drivers/staging/rtl8723bs/hal/odm.c          | 10 +++++-----
 drivers/staging/rtl8723bs/hal/odm.h          |  4 ++--
 drivers/staging/rtl8723bs/hal/odm_HWConfig.c |  2 +-
 drivers/staging/rtl8723bs/hal/odm_types.h    |  3 ---
 4 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm.c b/drivers/staging/rtl8723bs/hal/odm.c
index 639b6da2302b..a22354f728c1 100644
--- a/drivers/staging/rtl8723bs/hal/odm.c
+++ b/drivers/staging/rtl8723bs/hal/odm.c
@@ -141,7 +141,7 @@ static void odm_CommonInfoSelfUpdate(struct dm_odm_t *pDM_Odm)
 {
 	u8 EntryCnt = 0;
 	u8 i;
-	PSTA_INFO_T	pEntry;
+	struct sta_info *pEntry;
 
 	if (*(pDM_Odm->pBandWidth) == ODM_BW40M) {
 		if (*(pDM_Odm->pSecChOffset) == 1)
@@ -194,7 +194,7 @@ u32 ODM_Get_Rate_Bitmap(
 	u8 rssi_level
 )
 {
-	PSTA_INFO_T	pEntry;
+	struct sta_info *pEntry;
 	u32 rate_bitmap = 0;
 	u8 WirelessMode;
 
@@ -264,7 +264,7 @@ static void odm_RefreshRateAdaptiveMaskCE(struct dm_odm_t *pDM_Odm)
 		return;
 
 	for (i = 0; i < ODM_ASSOCIATE_ENTRY_NUM; i++) {
-		PSTA_INFO_T pstat = pDM_Odm->pODM_StaInfo[i];
+		struct sta_info *pstat = pDM_Odm->pODM_StaInfo[i];
 
 		if (IS_STA_VALID(pstat)) {
 			if (is_multicast_ether_addr(pstat->hwaddr))  /* if (psta->mac_id == 1) */
@@ -841,7 +841,7 @@ void ODM_CmnInfoHook(struct dm_odm_t *pDM_Odm, enum odm_cmninfo_e CmnInfo, void
 	/* pDM_Odm->BTCoexist = (bool *)pValue; */
 
 	/* case ODM_CMNINFO_STA_STATUS: */
-	/* pDM_Odm->pODM_StaInfo[] = (PSTA_INFO_T)pValue; */
+	/* pDM_Odm->pODM_StaInfo[] = (struct sta_info *)pValue; */
 	/* break; */
 
 	/* case ODM_CMNINFO_PHY_STATUS: */
@@ -875,7 +875,7 @@ void ODM_CmnInfoPtrArrayHook(
 	/*  Dynamic call by reference pointer. */
 	/*  */
 	case ODM_CMNINFO_STA_STATUS:
-		pDM_Odm->pODM_StaInfo[Index] = (PSTA_INFO_T)pValue;
+		pDM_Odm->pODM_StaInfo[Index] = (struct sta_info *)pValue;
 		break;
 	/* To remove the compiler warning, must add an empty default statement to handle the other values. */
 	default:
diff --git a/drivers/staging/rtl8723bs/hal/odm.h b/drivers/staging/rtl8723bs/hal/odm.h
index 38830552d5bc..856d454b0181 100644
--- a/drivers/staging/rtl8723bs/hal/odm.h
+++ b/drivers/staging/rtl8723bs/hal/odm.h
@@ -853,7 +853,7 @@ struct dm_odm_t { /* DM_Out_Source_Dynamic_Mechanism_Structure */
 	/* 2 Define STA info. */
 	/*  _ODM_STA_INFO */
 	/*  2012/01/12 MH For MP, we need to reduce one array pointer for default port.?? */
-	PSTA_INFO_T pODM_StaInfo[ODM_ASSOCIATE_ENTRY_NUM];
+	struct sta_info *pODM_StaInfo[ODM_ASSOCIATE_ENTRY_NUM];
 
 	/*  */
 	/*  2012/02/14 MH Add to share 88E ra with other SW team. */
@@ -910,7 +910,7 @@ struct dm_odm_t { /* DM_Out_Source_Dynamic_Mechanism_Structure */
 	/* u8 binitialized;  for dm_initial_gain_Multi_STA use. */
 	/* for Antenna diversity */
 	/* u8 AntDivCfg; 0:OFF , 1:ON, 2:by efuse */
-	/* PSTA_INFO_T RSSI_target; */
+	/* struct sta_info *RSSI_target; */
 
 	bool *pbDriverStopped;
 	bool *pbDriverIsGoingToPnpSetPowerSleep;
diff --git a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
index 994b8c578e7a..5bb27b872052 100644
--- a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
+++ b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
@@ -256,7 +256,7 @@ static void odm_Process_RSSIForDM(
 	u8 RSSI_max, RSSI_min, i;
 	u32 OFDM_pkt = 0;
 	u32 Weighting = 0;
-	PSTA_INFO_T pEntry;
+	struct sta_info *pEntry;
 
 
 	if (pPktinfo->station_id == 0xFF)
diff --git a/drivers/staging/rtl8723bs/hal/odm_types.h b/drivers/staging/rtl8723bs/hal/odm_types.h
index 8168dc14e879..893fa87852d8 100644
--- a/drivers/staging/rtl8723bs/hal/odm_types.h
+++ b/drivers/staging/rtl8723bs/hal/odm_types.h
@@ -33,9 +33,6 @@ enum hal_status {
 		#define	ODM_ENDIAN_TYPE			ODM_ENDIAN_BIG
 	#endif
 
-	#define	STA_INFO_T			struct sta_info
-	#define	PSTA_INFO_T		struct sta_info *
-
 	#define SET_TX_DESC_ANTSEL_A_88E(__pTxDesc, __Value) SET_BITS_TO_LE_4BYTE(__pTxDesc+8, 24, 1, __Value)
 	#define SET_TX_DESC_ANTSEL_B_88E(__pTxDesc, __Value) SET_BITS_TO_LE_4BYTE(__pTxDesc+8, 25, 1, __Value)
 	#define SET_TX_DESC_ANTSEL_C_88E(__pTxDesc, __Value) SET_BITS_TO_LE_4BYTE(__pTxDesc+28, 29, 1, __Value)
-- 
2.52.0

