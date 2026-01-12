Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA9037F0EB
	for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 17:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768239774; cv=none; b=gP+xq8fk/VZapKUAyyQR6VCEotDan0tkGkLktSjotWOCRAbt3Vn3C3npoWTK5CTto1WJ+Alvj5IClPe+41jHam2Asr6PRlT9/WTsi/N669BdAJDxnL2sRWXp3GE1IkugfMo5IQ7hqmZL4Gq9vM7SGBPlmvQ9WKYzJaVZ5NydNzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768239774; c=relaxed/simple;
	bh=khmVz6FFKv7kz4nywElY5ZXGTX+pjuCrf69zzh1UYSc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WRAd/qjGXr7QpAGo9Nasb4r5Ege2PJTxefmHD9PiGO23s0sT0dsdSoNPMslhwDcgq9RcPyrrmkPPdJuN/C96mWKuDbeRKT+P2QfNFrBjNfR8s0JqIL6NmaDFwj9CRVFOVJeTW6p9eGw9s/gr3TvapTXsngxu/wKa7OQWZCqMg8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I81pFOlG; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I81pFOlG"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-432755545fcso3928969f8f.1
        for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 09:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768239769; x=1768844569; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pyohsf51aPrWfo9ty04whOpdFeY/aeTmS4mSb/V191Q=;
        b=I81pFOlG4fMQsd8hjwogjr8HK6Fw042U338wNDzM2FIECp+5UGO4/k3Eq4DmM90vAq
         G2bVGuWUc1PdJXzw6Dkt4uyQq9tbXx3sfK59/3Leh1Jscia1XqHs7zuJ+UR2MeE9pT+g
         qKWXW/LdX9zoJB34iWQznDazh68DcVVqYG5PypI5wVBnaJHESWPxEMQKA+P5/sK5AR6r
         FNZoW6TwwQ3iKPhvjrkAjBrAcdgrNs6VN9wtXTB4KfI3E1AG9chEBHmaBMUrS/6Pvrpm
         16aLzyELloBq6nJM2gY5XJ/+d7+x/CwhXnkxfcGxz1iPC4S8/I6SpaSOMWiV+ECIxMGa
         uy4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768239769; x=1768844569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pyohsf51aPrWfo9ty04whOpdFeY/aeTmS4mSb/V191Q=;
        b=Z5jq9EFGBKQ0opWvLDX///w4vxsNSHvz8y+kY5sPJczD8FNemJf5YHdznCH/vCXpBm
         QwgoLYuyO5ZU1+ylz53rMFy2jpKoe2t8hD4bfF6CnBxE+e3cAs6ORVwSLUsfUjIDPFG6
         Isuqr3RlOWPmhZuHYqUjPUrAm1h3bM1mvXryLesB4C0w0/OXCcnkeu/4mD9jDiHVJ22i
         k5j6MR14MRklBq1+30kKvJVaAqscXRLSYJHto22L/Do5yBduTI7z2tIjHc3BvTp8yZv7
         7vy5Pp2xBZQZEQ5L3uJ0uNq0QPeXxmZGb07541b61zyLnsbnkJ0fw3Iu8sDAHc3dPU8Y
         HrpQ==
X-Gm-Message-State: AOJu0YxBmXC9e68t0wv58Z/1bFsBrMC55BQ1RMc+jRyp9pOvIHeQ7lu5
	KeeCsKH2jQzGqkVJNL0viq+8wzEoU0Y6xOkh1kGrXaAjJiVYTW18cnZBT9loKZc8
X-Gm-Gg: AY/fxX7XrFF3WTaPOwYXw2ZDaHmxFuPgZOg2j2BGU+cjW+RHxLubUQOfpMJjKemqqTe
	8+ycQDV7S9TllxDAYAcHSiWpn1rD/debwyU97eHSHGqNTqokXwi7gHo3IF0llNXlQ+x6g/Pp4zs
	bmkE09uTpIbL2Ug8tuGj1rUT8PAlOuqkRZLnXrOS5C1Gud/2dLO4acXCaH81Aj+MxvL2QWJQatG
	EtdFNSJY/hfIK+F5i4Q0CINeD0yNhSg0hFB/HAsBs9/ZdTBYjJ7Wy7drCa6nCP/F1EJSJ3XwNVd
	TJeC/QpGFf6J8LpajqWYEmaKTSDuNg94hbUpPdX49aUwtGPsF2AJ1dxYMMDqvDnSG9uHjvwgLJT
	vxzIHu5Emr7P1kAIGRG1n/M1i+8AR6W+6HH9pnsnoumKS4GkK+8VfZMaJgYKzKXhbKU77LFBsXt
	Yys1OuLES+f0IDVWwh0c6bqLfpQ4Q5oEUwjL09gWCwtEIC+JhmbA==
X-Google-Smtp-Source: AGHT+IFbgECo+PXB2hI2DU+NscoMvyawgDGPOblB1Ltagsi+VtPdci1QcR2KtKNqPLgcmsz21p+7Og==
X-Received: by 2002:a05:6000:2891:b0:42f:9f18:8f40 with SMTP id ffacd0b85a97d-432c3760ac4mr23163367f8f.42.1768239768533;
        Mon, 12 Jan 2026 09:42:48 -0800 (PST)
Received: from localhost.localdomain ([2400:adc1:447:6d00:1c1a:7818:23f6:aae1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0dacd1sm39090716f8f.4.2026.01.12.09.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 09:42:48 -0800 (PST)
From: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	mahad.ibrahim.dev@gmail.com
Subject: [PATCH 05/10] staging: rtl8723bs: Fix spacing coding style issues in HalHWImg8723B_BB.c
Date: Mon, 12 Jan 2026 22:42:22 +0500
Message-ID: <20260112174227.14922-6-mahad.ibrahim.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112174227.14922-1-mahad.ibrahim.dev@gmail.com>
References: <20260112174227.14922-1-mahad.ibrahim.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch.pl checks regarding "spaces preferred around that"
operator.

Adhere to kernel coding standards by adding spaces around arithmetic and
bitwise operations.

Signed-off-by: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
---
 .../staging/rtl8723bs/hal/HalHWImg8723B_BB.c  | 34 +++++++++----------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_BB.c b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_BB.c
index 630dace0af47..5fcb9420fb3d 100644
--- a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_BB.c
+++ b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_BB.c
@@ -217,7 +217,7 @@ void ODM_ReadAndConfig_MP_8723B_AGC_TAB(struct dm_odm_t *pDM_Odm)
 
 	for (i = 0; i < ArrayLen; i += 2) {
 		u32 v1 = Array[i];
-		u32 v2 = Array[i+1];
+		u32 v2 = Array[i + 1];
 
 		/*  This (offset, data) pair doesn't care the condition. */
 		if (v1 < 0x40000000) {
@@ -226,7 +226,7 @@ void ODM_ReadAndConfig_MP_8723B_AGC_TAB(struct dm_odm_t *pDM_Odm)
 		} else {
 			/*  This line is the beginning of branch. */
 			bool bMatched = true;
-			u8  cCond  = (u8)((v1 & (BIT29|BIT28)) >> 28);
+			u8  cCond  = (u8)((v1 & (BIT29 | BIT28)) >> 28);
 
 			if (cCond == COND_ELSE) { /*  ELSE, ENDIF */
 				bMatched = true;
@@ -246,22 +246,22 @@ void ODM_ReadAndConfig_MP_8723B_AGC_TAB(struct dm_odm_t *pDM_Odm)
 				 *   Condition isn't matched.
 				 *   Discard the following (offset, data) pairs.
 				 */
-				while (v1 < 0x40000000 && i < ArrayLen-2)
+				while (v1 < 0x40000000 && i < ArrayLen - 2)
 					READ_NEXT_PAIR(v1, v2, i);
 
 				i -= 2; /*  prevent from for-loop += 2 */
 			} else {
 				/*  Configure matched pairs and skip to end of if-else. */
-				while (v1 < 0x40000000 && i < ArrayLen-2) {
+				while (v1 < 0x40000000 && i < ArrayLen - 2) {
 					odm_ConfigBB_AGC_8723B(pDM_Odm, v1, bMaskDWord, v2);
 					READ_NEXT_PAIR(v1, v2, i);
 				}
 
 				/*  Keeps reading until ENDIF. */
-				cCond = (u8)((v1 & (BIT29|BIT28)) >> 28);
-				while (cCond != COND_ENDIF && i < ArrayLen-2) {
+				cCond = (u8)((v1 & (BIT29 | BIT28)) >> 28);
+				while (cCond != COND_ENDIF && i < ArrayLen - 2) {
 					READ_NEXT_PAIR(v1, v2, i);
-					cCond = (u8)((v1 & (BIT29|BIT28)) >> 28);
+					cCond = (u8)((v1 & (BIT29 | BIT28)) >> 28);
 				}
 			}
 		}
@@ -477,7 +477,7 @@ void ODM_ReadAndConfig_MP_8723B_PHY_REG(struct dm_odm_t *pDM_Odm)
 
 	for (i = 0; i < ArrayLen; i += 2) {
 		u32 v1 = Array[i];
-		u32 v2 = Array[i+1];
+		u32 v2 = Array[i + 1];
 
 		/*  This (offset, data) pair doesn't care the condition. */
 		if (v1 < 0x40000000) {
@@ -486,7 +486,7 @@ void ODM_ReadAndConfig_MP_8723B_PHY_REG(struct dm_odm_t *pDM_Odm)
 		} else {
 			/*  This line is the beginning of branch. */
 			bool bMatched = true;
-			u8  cCond  = (u8)((v1 & (BIT29|BIT28)) >> 28);
+			u8  cCond  = (u8)((v1 & (BIT29 | BIT28)) >> 28);
 
 			if (cCond == COND_ELSE) { /*  ELSE, ENDIF */
 				bMatched = true;
@@ -506,21 +506,21 @@ void ODM_ReadAndConfig_MP_8723B_PHY_REG(struct dm_odm_t *pDM_Odm)
 				 *   Condition isn't matched.
 				 *   Discard the following (offset, data) pairs.
 				 */
-				while (v1 < 0x40000000 && i < ArrayLen-2)
+				while (v1 < 0x40000000 && i < ArrayLen - 2)
 					READ_NEXT_PAIR(v1, v2, i);
 
 				i -= 2; /*  prevent from for-loop += 2 */
 			} else { /*  Configure matched pairs and skip to end of if-else. */
-				while (v1 < 0x40000000 && i < ArrayLen-2) {
+				while (v1 < 0x40000000 && i < ArrayLen - 2) {
 					odm_ConfigBB_PHY_8723B(pDM_Odm, v1, bMaskDWord, v2);
 					READ_NEXT_PAIR(v1, v2, i);
 				}
 
 				/*  Keeps reading until ENDIF. */
-				cCond = (u8)((v1 & (BIT29|BIT28)) >> 28);
-				while (cCond != COND_ENDIF && i < ArrayLen-2) {
+				cCond = (u8)((v1 & (BIT29 | BIT28)) >> 28);
+				while (cCond != COND_ENDIF && i < ArrayLen - 2) {
 					READ_NEXT_PAIR(v1, v2, i);
-					cCond = (u8)((v1 & (BIT29|BIT28)) >> 28);
+					cCond = (u8)((v1 & (BIT29 | BIT28)) >> 28);
 				}
 			}
 		}
@@ -550,9 +550,9 @@ void ODM_ReadAndConfig_MP_8723B_PHY_REG_PG(struct dm_odm_t *pDM_Odm)
 
 	for (i = 0; i < ARRAY_SIZE(Array_MP_8723B_PHY_REG_PG); i += 4) {
 		u32 v1 = Array[i];
-		u32 v2 = Array[i+1];
-		u32 v3 = Array[i+2];
-		u32 v4 = Array[i+3];
+		u32 v2 = Array[i + 1];
+		u32 v3 = Array[i + 2];
+		u32 v4 = Array[i + 3];
 
 		odm_ConfigBB_PHY_REG_PG_8723B(pDM_Odm, v1, v2, v3, v4);
 	}
-- 
2.47.3

