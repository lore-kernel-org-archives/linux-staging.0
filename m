Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6DB39B48E
	for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 13:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771939697; cv=none; b=cVy+mbNxLrol0kRFL7kmkSCud+KCxYXcDDLtqE5KB/mDE4rjItOmz6V4KX8BsYBYhxRw5XLtFIIgmsQFOApLRQVDyw3KU11CS1r+RHhXxXIaGuzRyQp+ohIIjsbFi72iAXQbjrH5WgKEkbNRqYBCa6kiOmJrdXe4sMJCEGY/Om0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771939697; c=relaxed/simple;
	bh=e88uWuebZCn6rYikGkpBksiWx7hOdqPIzpwA4JqfFwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MwPRKN1xTkdQDbiAKZUrQpP8OtQL7jMWv0PQE7QodcT5VabxK0u2uGt715JhfKhkI25Ed2hxLhxho5PymHA/ZNjzZQA4KMNx2KW5SO5t/086fjkMGWY0d6NAgk/Hr1Cd5DifljkA+zA9PzL9Z6h++7OLmtme8sD9zja1jaQ5V68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=kxDDJRs+; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="kxDDJRs+"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1771939693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kPsBySVpuOGtJf2M7KBHmN0lUJFa/B+3IIggRYDpGmo=;
	b=kxDDJRs+WMH8FvB3niB4Osharic+kiQsOVvrZElsqEao9Eg3hpuZOw8aTt/VAcP5B4owHx
	w0WkUkcB8r+Csf5qnhW+spADpCZ9kB1pparA0Q3wZz9dp1lSqMP+NSHKAGo+zEzN1naU2j
	+xlGuPy7Gk3OK4TPKZVUsSZuJHoHo3I=
From: luka.gejak@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <luka.gejak@linux.dev>
Subject: [PATCH 04/21] staging: rtl8723bs: convert PSTA_INFO_T to struct sta_info *
Date: Tue, 24 Feb 2026 14:27:31 +0100
Message-ID: <20260224132748.12336-5-luka.gejak@linux.dev>
In-Reply-To: <20260224132748.12336-1-luka.gejak@linux.dev>
References: <20260224132748.12336-1-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

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
2.53.0

