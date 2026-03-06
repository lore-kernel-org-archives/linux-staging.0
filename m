Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8593346B4
	for <linux-staging@lists.linux.dev>; Fri,  6 Mar 2026 16:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772813541; cv=none; b=frk+/3MISfXSfcDz6mcVxBEJF2pERD16G6Ufmpml1s6c40SQY0L9fC/VFTZrm/z+hZW9SrLv5fHwmjw1QBuaNHiTE986ct+OEhsQ0kFNYGXtq3ZesTEjyJwyufknp3M4cbsU5fcSM5pdPglA5VFBxbM+7z3/8B/rk+OHKdtT63s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772813541; c=relaxed/simple;
	bh=jhu0qma8iNVtqNdEPhK0fNJNczmlM9TMFzPRRNKy9Q8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bKHCNNyd9eIQjR0+VJr7v4sH0zQFUG3x/vsueRbqHVDAXPefPO+c4rr93eN787LD4edaHk7UceXBuQDzdueig2Ts3tOlh9+KGceLUtXjidwZxcw42MOs76FTyn+i1lT3/xLv6eWnYrhv5CKBHhXTlQLL5yHePRZqgnhUsG7pPd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jBER29w+; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jBER29w+"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c70ea5e9e9dso3527240a12.1
        for <linux-staging@lists.linux.dev>; Fri, 06 Mar 2026 08:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772813539; x=1773418339; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GZOOcTt60XFXlZ82mTaKlLM1zacYcRvsWUQTcaKAGWA=;
        b=jBER29w+2w3cxm29kiE6IU+kqU8pUgMLqStlb1hKet5d07ahNosjVV5Ay80bo3uTKH
         /UoJCQGDxRr7d5W3BbpRY0MwuVmiK33KkJu4IkA++09eUXMDgSweZlPVd+XDfvmcGEJC
         Ko0Vp08Z7LNxtol5AGtpaUVE/R9nEvQnObwLU1ZlPd8foT8k4Ke3mHG8eGuXEiwUIhSg
         rfcH4nwpkRz9dgPmDa85fvuUMaV72ZRNotO8YSGrRgg8CeFsUkk9t+G6D0aL7WCZCR0/
         zKUjr9YyRwDoyxy1Oo4eDr9g51fQ4n8oLBvG9wM0vuWD+1dX7WenW4J8V9b9a3X6+xNh
         yySg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772813539; x=1773418339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GZOOcTt60XFXlZ82mTaKlLM1zacYcRvsWUQTcaKAGWA=;
        b=MUNMxufwAwV0Pv6ZU5tqYDLPNsbRt8EIrE40IaK4kg7OmE965+laqQxe4Di7HSUOSu
         w9EcbnyP1GwBjDetzxE4aFAd1mom8pHE/w12ZpFD6ucbqjr7XhZLSs8Y7EYbtzHCja3G
         dXiEnITAe78NL7QRlwaQrTGHpAZ+XIXazt0HG1TLmFiLGTIfQsfvCUgE7K1Yp6Sg0s37
         vgKxyW4abJe9Ew4OsyIab+xJdyDt+mrDh8xJu5kY1+jklvb5GXk2xIZxCBV0ZMBNhQWy
         s82xAHACvM66qkIvzCzC0JAWcajHfPOVTwfVsERirNkOV+5kiBGa5MWP4bXWIE/23pWs
         L1zA==
X-Forwarded-Encrypted: i=1; AJvYcCXpD2L+AaFa+iG7fWGEB8sJ1cS3tt3HavHSKAYheprg9C6+Gjuza4ZEwWKNLyppYgBvmkiksQtmUl752CUU@lists.linux.dev
X-Gm-Message-State: AOJu0YxapAVhUAlgGbtYHE5RytB4zbbXrFQUalfXUmT9WGlENZNsmHM1
	BFhJBu/0GDtbil+0OVP0pFwyyvyxPQpGsDD8mi43d89Ha4Uzx+rlk/LH
X-Gm-Gg: ATEYQzx3+sEsIQgKrCZ4lH9DprM6kkaeG4vCgBG1C4AIo3C0eaSClBweGT5sPRJy8dn
	sj0T4GlcGSKvcMzHPzBt3+/zhTmrU4jOyGsaVl7BeYoqLYeTN83YcILxGardu17WeQkTw8ikj0o
	GXYF3H+s645pKOogCqcejsePxgc+ezNTb/6q0603eV3gS2UHOPpLrQiKo743DRBEQUeV8N3s0M7
	nV36JAayR7ZV+IjobcC/SJP5Sp3ivLU43n0CSzA6SKyyQ1KAKoqysKoKg74Ap4C2XI0oFL8LiU9
	23CL6hoAhp6KTeaa0xsPlnASAvliX/43X1qR5u1m5m+S+QU0qDzFqaXzT+hDcI6qHE9Njv9Z9R1
	1qjuEIcNHYzPPZrSm22XcBoXlo0xq8WUYTwOVIljwuuYw7D7FesZlII4x6/ywwNe19xgUi2Hqz6
	9en1uR0AlTBecOuJe9O9AK3MdzyzVNuCgduUhVWZiD3hzRWIg0ApPisWRNFw+5mhNbvIn3zSr/7
	zqpjOGCp4RPrMmcec8kkZ9HMkX3o8SoIIyYg9Jk2Cwh
X-Received: by 2002:a05:6a21:6b02:b0:394:593a:eead with SMTP id adf61e73a8af0-398590d3c3fmr2811515637.65.1772813539264;
        Fri, 06 Mar 2026 08:12:19 -0800 (PST)
Received: from kforge-fedora.gk.pfsense.com (static-103-70-166-143.unpl.net. [103.70.166.143])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c739e0a7156sm2140860a12.2.2026.03.06.08.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 08:12:18 -0800 (PST)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>,
	daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	karanja99erick@gmail.com,
	benjaminpotron@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: hal: remove unnecessary braces
Date: Fri,  6 Mar 2026 21:41:25 +0530
Message-ID: <20260306161128.72571-1-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Checkpatch reports the following warning in odm_DIG.c

WARNING: braces {} are not necessary for single statement blocks

Remove unnecessary braces from single line conditional statements in
odm_DIG.c to fix checkpatch warning.

Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---
Changes have been compile tested. No functionality change intended

 drivers/staging/rtl8723bs/hal/odm_DIG.c | 28 +++++++++----------------
 1 file changed, 10 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_DIG.c b/drivers/staging/rtl8723bs/hal/odm_DIG.c
index f10427abd849..33661182d85a 100644
--- a/drivers/staging/rtl8723bs/hal/odm_DIG.c
+++ b/drivers/staging/rtl8723bs/hal/odm_DIG.c
@@ -220,9 +220,8 @@ void odm_Adaptivity(void *pDM_VOID, u8 IGI)
 	s8 Diff, IGI_target;
 	bool EDCCA_State = false;
 
-	if (!(pDM_Odm->SupportAbility & ODM_BB_ADAPTIVITY)) {
+	if (!(pDM_Odm->SupportAbility & ODM_BB_ADAPTIVITY))
 		return;
-	}
 
 	if (*pDM_Odm->pBandWidth == ODM_BW20M) /* CHANNEL_WIDTH_20 */
 		IGI_target = pDM_Odm->IGI_Base;
@@ -286,16 +285,14 @@ void ODM_Write_DIG(void *pDM_VOID, u8 CurrentIGI)
 	struct dm_odm_t *pDM_Odm = (struct dm_odm_t *)pDM_VOID;
 	struct dig_t *pDM_DigTable = &pDM_Odm->DM_DigTable;
 
-	if (pDM_DigTable->bStopDIG) {
+	if (pDM_DigTable->bStopDIG)
 		return;
-	}
 
 	if (pDM_DigTable->CurIGValue != CurrentIGI) {
 		/* 1 Check initial gain by upper bound */
 		if (!pDM_DigTable->bPSDInProgress) {
-			if (CurrentIGI > pDM_DigTable->rx_gain_range_max) {
+			if (CurrentIGI > pDM_DigTable->rx_gain_range_max)
 				CurrentIGI = pDM_DigTable->rx_gain_range_max;
-			}
 
 		}
 
@@ -314,24 +311,20 @@ bool odm_DigAbort(void *pDM_VOID)
 	struct dm_odm_t *pDM_Odm = (struct dm_odm_t *)pDM_VOID;
 
 	/* SupportAbility */
-	if (!(pDM_Odm->SupportAbility & ODM_BB_FA_CNT)) {
+	if (!(pDM_Odm->SupportAbility & ODM_BB_FA_CNT))
 		return	true;
-	}
 
 	/* SupportAbility */
-	if (!(pDM_Odm->SupportAbility & ODM_BB_DIG)) {
+	if (!(pDM_Odm->SupportAbility & ODM_BB_DIG))
 		return	true;
-	}
 
 	/* ScanInProcess */
-	if (*(pDM_Odm->pbScanInProcess)) {
+	if (*(pDM_Odm->pbScanInProcess))
 		return	true;
-	}
 
 	/* add by Neil Chen to avoid PSD is processing */
-	if (pDM_Odm->bDMInitialGainEnable == false) {
+	if (pDM_Odm->bDMInitialGainEnable == false)
 		return	true;
-	}
 
 	return	false;
 }
@@ -413,9 +406,9 @@ void odm_DIG(void *pDM_VOID)
 	if (pDM_Odm->bLinked && bPerformance) {
 		/* 2 Modify DIG upper bound */
 		/* 4 Modify DIG upper bound for 92E, 8723A\B, 8821 & 8812 BT */
-		if (pDM_Odm->bBtLimitedDig == 1) {
+		if (pDM_Odm->bBtLimitedDig == 1)
 			offset = 10;
-		} else
+		else
 			offset = 15;
 
 		if ((pDM_Odm->RSSI_Min + offset) > dm_dig_max)
@@ -475,9 +468,8 @@ void odm_DIG(void *pDM_VOID)
 	}
 
 	/* 2 Abnormal lower bound case */
-	if (pDM_DigTable->rx_gain_range_min > pDM_DigTable->rx_gain_range_max) {
+	if (pDM_DigTable->rx_gain_range_min > pDM_DigTable->rx_gain_range_max)
 		pDM_DigTable->rx_gain_range_min = pDM_DigTable->rx_gain_range_max;
-	}
 
 
 	/* 1 False alarm threshold decision */
-- 
2.52.0

