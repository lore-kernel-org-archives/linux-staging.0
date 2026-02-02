Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37D730F52B
	for <linux-staging@lists.linux.dev>; Mon,  2 Feb 2026 07:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770016097; cv=none; b=Mc27+dBwlZOVG7e09b5R2Ns9zADFUaia5UGtuO7DH4CrJCwVoKIt4R+Z4dA5ppRAlZQpJryKKxmufTofyawk48wPNLbNsTGq2/BUpbhtcg5i2QmyD+O1N1ZhUJaqP6d8PAfWLQkZKy1ie9mX0DwohXZb4EsZ5b5Dmb3U8ryOaNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770016097; c=relaxed/simple;
	bh=s7IIdjcLxuh6+n0VJBXhhL+f6Nq2uAQBkFKm9y4KgGs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fAeOl05sxcbobkqXvN/I1PXUswBF87yjsiyw6n9IHW6KiQMpM1aFVjOyZryruGpi0KrRBUThcM7ZFWbGcKZREsj6rgV8c7J8GvD8a7+HwX1Hw2tBNfuBY35OWgFWcuxjFIqBviRmzbJ91qtACNOXldMFdoViYN71ZVvEPWqwCQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=grbu88dI; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="grbu88dI"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48069a48629so42101655e9.0
        for <linux-staging@lists.linux.dev>; Sun, 01 Feb 2026 23:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770016094; x=1770620894; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q9Zo+xZOmys4w+M80kAYROROAzS7qHaFRwNjWPdoPuM=;
        b=grbu88dIIA7l6elncKxlB9yMl6Ys+XZK31+/G0wgn/RtGYloHcKNWKNDdDDTfrEft4
         pvRy7dJ2FbsIv+YVODz/eAktW/ZSphmQAS6qA28wxxeXS6CctbkBBrSsdFM65L/mRJSB
         YLH+tzguSqYDGl8L9wlyUNxNO4pmPGI2oMzzxkVGUpwzKOtlmwGBDMeOpiguKdf2pydY
         0nMVcRnyug0ztVWgcYTEjIuOOUe6HikLyT5K98KgdfVAhXBM4tVEDM+O6/fYobMUZ3r3
         CNGKXHFbxPWzqvLghVBqaJFvi/ATeGr9kGdQQXq9yWxCUrZK2+zgnxp5gF6FW1f2d2vZ
         8eog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770016094; x=1770620894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q9Zo+xZOmys4w+M80kAYROROAzS7qHaFRwNjWPdoPuM=;
        b=F65JZDUBcuf2Hh7T2froJI0FhhiFKL5HEOvMryqcddFeXEr8OZylzc+sRnQxproULw
         SnmPuddle/d/DIfoY+ak+6IwrGmns1tEG5dWLLQVdh3YJms8EF0kCj0Vy5V65THqZF0J
         PTLLmusWLhf5xwMvj3up39luOjsEkb1PNdd+5TYOQkPq++he9Dvl3It2zNAr3lFqIN/a
         O8onMV33dOQgZ4bDvty6fduvXiFdjBMHUt4GQuSH30WpBxGt6eaIpvx8XVxFEXMp7pni
         ERvKAlRXxa+xKgIKjeJ+xWy/PbMU3iNiQw6mLhFPFqxyDZA9Fxm5XMVweP9WI3HD/ngs
         FUkg==
X-Forwarded-Encrypted: i=1; AJvYcCX+2zqpIVNuYTmxBSe058b9byiMvotbDJFhhGGGlmGGOFW2GVhJfmH9sthTGK12/vWf+SWHdqnLAHTx64mA@lists.linux.dev
X-Gm-Message-State: AOJu0YwqUGY0QI/9l+JLEgL54f8bzYcqYGDX3aytKo3FQr3lIf1/dgm4
	Qm4vCacepyn7nIyE2/8SQM/opcnRDC7I+DkWLcOuA8C2D20L0q00LCVkHdAu9A4=
X-Gm-Gg: AZuq6aIhFjUDFgy0/2CvdgGQaHoZA9nKscDbzSs8OU+gEkBAhcLxP2/Vmy/4A2Cbdc0
	5xNjLIpwi5biJDWwoU/K1d0GpsqlA6qRJNzGgXW2dwqu/oh11PVpo5j/kxA387cPXdrJA9vcoMB
	/wP4ANc27UXDJHCuEZGOX+umfUbp/5xgWvy5zbcCbMsGc09aCD6XlyTMEMi5IwkEyg8uLIivXPL
	AfAkzNwzO8tNIa3BPSr8+5iB2E+mpJ8CGdh+Z2T7MUxBd8Hdo2FqUEnuKWv25SKE4cmU5eSL7RM
	CF5KMeBZd15oR3RNWIFqFgIGmcdfJkcxBb8buUmy15/LSkHMz8RsquIJvpk6PC3sAX+qhokUhJ1
	v+hSRZ8LhjKm9qngZIyc2OYDyBSzIY3GEmwTgN8+qu2qL8h2hQR6VgKIYlPTESqama764aaDyzO
	wDANvl3Jn2FPNBNn9ENxmO8VYZYyqKfApvYUmPlzBX6kMj51LUyDOjTenbhkbXDw==
X-Received: by 2002:a05:600c:3152:b0:47d:6140:3284 with SMTP id 5b1f17b1804b1-482db4a1011mr122359325e9.37.1770016094178;
        Sun, 01 Feb 2026 23:08:14 -0800 (PST)
Received: from LGPC ([31.223.131.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806cde00e8sm371369315e9.6.2026.02.01.23.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 23:08:13 -0800 (PST)
From: Luka Gejak <lukagejak5@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <lukagejak5@gmail.com>
Subject: [PATCH v1 2/5] staging: rtl8723bs: convert PSTA_INFO_T to struct sta_info *
Date: Mon,  2 Feb 2026 08:07:49 +0100
Message-ID: <20260202070752.3391-3-lukagejak5@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202070752.3391-1-lukagejak5@gmail.com>
References: <20260202070752.3391-1-lukagejak5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the vendor-specific PSTA_INFO_T typedef with the standard Linux
kernel type 'struct sta_info *' throughout the driver.

Changes:
- Replace all usages of PSTA_INFO_T with struct sta_info * in odm.c,
  odm.h, and odm_HWConfig.c
- Remove the PSTA_INFO_T and STA_INFO_T macro definitions from
  odm_types.h as they are no longer needed

This addresses the second TODO item: convert any remaining unusual
variable types.

Signed-off-by: Luka Gejak <lukagejak5@gmail.com>
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

