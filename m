Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F0415A86D
	for <linux-staging@lists.linux.dev>; Sun,  8 Mar 2026 03:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772939835; cv=none; b=FNeLGqXWPgwZk6VRvBurTQTqMOZr49Z2Dz0rPoJfapYFcije3XBdimBESRNsPTFX0CkbYeRCUAobs/UYeqNrg+4pUBI76bflKXJSZ1s4+Z1yeM+8UD4gHmPPlmmbit1d746eDYwDjsW9eOA34VzsYi1qyloR3svOlJD1oY8hSZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772939835; c=relaxed/simple;
	bh=gK8TW5U+99ZNG0mt/pEtRj4/7YbPm4YtqymLv3xcpDU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JVj/gHp2xeLAzcqyCZaZafF/NoxTzHJGU3uCYY08+zw8qG5Imu1Nq3B8mrooLudMeGbh1FVV2ivJyvGOwdGdGfOuIHQ3quccMhEq+mSrwLGXkhNNH351YYYWBHWBA0FxyyVUDu4FDNU/Vcx9ib6AImOoo0u2JYsRaWsQgfAa8vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SFhL1rSS; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SFhL1rSS"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-354a18c48b5so9315532a91.1
        for <linux-staging@lists.linux.dev>; Sat, 07 Mar 2026 19:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772939834; x=1773544634; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=udIOHISmvp51Gf+PeTQVBN2mDC6yZFdgG63VaoR9SIk=;
        b=SFhL1rSSn90cpzj/LWys1fewVjwpW8yd8CufN/rRXQFqCvCeyv0Vn1SzMKfA3AZMwD
         8v4Ez5Fg7CjQHBGAuRu/YK7cyn+1vUuB+gPrLX3vpQmqw2UGmePyzKIggzRwHwoV4ADU
         C39WDpTcaqtGa4JdFsvIN/eBHNfaofdkVfUoKE5X+jpOJIhLYk785uw1FMAlhL9v2iD2
         FBJ71PuFBIvVkFTjofYWLWkVIRw2IIrqRSIWvfjXhtIa3eVVGCEoBVq/XA+CLb7zPsSz
         6qBuLpNy7ToqK4X4kYjM6afi2y8D8bvIHcU/XNMowh0Sn/DeerRVLOgQfbfRtchA5zvb
         s4OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772939834; x=1773544634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=udIOHISmvp51Gf+PeTQVBN2mDC6yZFdgG63VaoR9SIk=;
        b=nZmBbEwdbC3COf0rZBZNc5h5MYpJcfu6o060DTcY0tdc1X61UlatWmWZs7+49QSXoA
         YIBvWiA/XTTwyRF7dTRiylqEG1irDTWacysCwbqPigfmy0CCLNx0vUxWu+KDMGIfY0HB
         oa33J7CDLkj8pRJ+6LSmGuNM8Q46qVkfHUZ+6a3fj2loJDugKukdacL3a4g3Ok828+xU
         +ucyfS+AdU54QNJpjd49nPvPcCSrHBk+m1KsupPbGCUmCnxIz2F6WVkGgJBRqiWl6G2c
         9/4Ullus4DZJKX+WRDKTrUxNVBmG1zslCSlmMg8LIDDOL0IFrUhHP6znrWhHPC1xZ8X1
         pDKA==
X-Forwarded-Encrypted: i=1; AJvYcCVmiSMcIxxI6hPFMpHTKB2SIuzD9N51dALhgo58Tka0CSRAU0+XfD6Fogah7ByHb00wEsc11hprHUhv0Cyx@lists.linux.dev
X-Gm-Message-State: AOJu0YxmTsg8ZBKP17ztEKlA+dyBNQJfIPwX08HFYkQwJIoopl5axxFd
	LHLC+xXr2haWp7KWKWLtz+Cw7mV2cjdsDiinx6fNOR2GsMzgkqWknQcWMhm8KrEsEc2ZlWp5
X-Gm-Gg: ATEYQzziD4pdDKQ+SOFTEjK6WR+BEhZpf2PmmVmqsQ5Ib+cS0b4IR324isZi1CKPX/+
	omRRj4ytr24G69serRlW+8vnGZ9SGZZ7MD24IlpF5gweM5g2LbM0pM5fenwpl519k0xD5knEMDu
	B4k9Fb3D7TiE3qHMgGop0Pb5BOZwK0O7gDklvKv+BtVZ2dJZ5BqWNtR6b1IjvwzzvDlBJJSq84j
	3sKmlxoZmp0mWjsRNwQcPwZTCShlucyO44O+5H5Iv57qFT3jZC6AV68lTWwRFb0wL9zvMJGeRpy
	3AYJSINW/h4m7KAVvu2+VtQqERMKg2cu0n3FpVb2d0AnVNJN0H3Y1LfZGBDRqLZvoleKqtX1bKE
	OkU5r5WuDcAHDurvpYPwtIWg2B+X23jF3ieIM1Bf1qs2+jAG16xS89faE1xvBBaXq4TGxSlGAkR
	QpybY4Tjv1VTGmDdZFWbV8NIWk21WNXk1+ZnUM17wdxuQBJ1TdBmUGpq6WGMkWW+VmrPxH004u5
	Cv1UOqdY7m32v6JYlUqt7JKnsIs+DEXs6ycnpJLNyMc
X-Received: by 2002:a17:90b:3e4d:b0:359:88c5:3add with SMTP id 98e67ed59e1d1-359be307609mr6888896a91.19.1772939833966;
        Sat, 07 Mar 2026 19:17:13 -0800 (PST)
Received: from kforge-fedora.gk.pfsense.com (static-103-70-166-143.unpl.net. [103.70.166.143])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359b2dffbf2sm9716466a91.13.2026.03.07.19.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 19:17:12 -0800 (PST)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: gregkh@linuxfoundation.org,
	benjaminpotron@gmail.com,
	karanja99erick@gmail.com
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>,
	daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	b9788213@gmail.com
Subject: [PATCH v2] staging: rtl8723bs: remove unnecessary braces
Date: Sun,  8 Mar 2026 08:46:38 +0530
Message-ID: <20260308031704.4907-1-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260307202008.1071-1-b9788213@gmail.com>
References: <20260307202008.1071-1-b9788213@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Checkpatch reports the following warning in odm_DIG.c

WARNING: braces {} are not necessary for single statement blocks

Remove unnecessary braces from single line conditional statements in
odm_DIG.c to fix checkpatch warning.

Suggested-by: Bera Yüzlü <b9788213@gmail.com>
Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---
Changelog:
- Remove hal from subject line as suggested by Bera Yüzlü

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

