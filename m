Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550AD3C3C16
	for <linux-staging@lists.linux.dev>; Wed,  9 Sep 2026 21:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788990988; cv=none; b=ghsLiDyNIak0P3+Kyavg/ve7oFHFoAk2AxyFjgHTFODQlKHDCgQSWchgRONa8vkL8YWvVC46Byd0FpABrriZdm14ywMp/jAsEfRhe4SD+Nijh6yfVkyQq31Sysb/FAWkiw4pV0Lh8nkcmeFy7DPHCivv9XrUtKdP3SncZk4a02M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788990988; c=relaxed/simple;
	bh=S9xRZ/7yngBdBHR/K/t6g824mEWNRk2libWaXsTUnrI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OAkhX3g1PYzmmfvlhKhfGam21Oy/EpKnhOyjtSd+Imbns4kOVUzL45u0vN7xJ2Vn9fYOaL9XvyptPRr/O6oic77xWI+4PfVM+90jO/sUCt1r6mYcMc/lNrO+he3W2S4OyolpiKubmv8OVgn5wf7nyH9wq3S8MaSoMIkkZDMdTGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UqKdWIdt; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UqKdWIdt"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-39682983a0fso7084641a91.3
        for <linux-staging@lists.linux.dev>; Wed, 09 Sep 2026 14:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788990981; x=1789595781; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=20cqJYQWVs9k9eXVphEma8zLTYH1lgYyH7XvrGtAYAg=;
        b=UqKdWIdtygRfArAgxs/uOUvOpItteNXfDqdJD0Z6RqgMR0xrUN9qGngf7a3w00OELX
         22TVqWb2vuTNt0j3F5dXx9GYFL0fgNh8PaJPGP8rMQMSxifbwHjvuYEJ9HOqRjCDww7q
         y9wA6LNG4ozMJsuL72L98P2Hw1R7TU1iC4vPsbLxy/wmEl69IB+jwkfKf7+GJRWV1jiq
         wMCS+YG3zclOfbs/m+hoTRfj7HooOpAzdrOrrvr5TsMMCAi2d7vd0o7KwShoIT2i71W0
         wtQYtqKE1V/9lfyGYuiPcT17gGCJ2ry7m4mVSf74D1EVcE4os13xb5I59DdYjRccAkWf
         eFBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788990981; x=1789595781;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=20cqJYQWVs9k9eXVphEma8zLTYH1lgYyH7XvrGtAYAg=;
        b=H5ESsIWtplTIAHpLtJauz+qDibKy2obIBFV6p7t1tUeHVhVmYkq2pDNVKDy7fMvnBa
         YfFnOzT57VgScgpfF1Ir4FAYpNKNp9F2r7qqm+OBWAav7bXrctG0i4d4dO08SPTJ31Et
         SkEH3d8kF8OcbKTkBvglTFc5SaT/4IurqYo8dDA/iKaXCVEFh6y70hNrhuen51w7arRl
         U+c72wFEDYQhDvkX0IIc/OjeYOBZxI7YmkoyNnXSFwQAuGLo29c1UecLP1g0TYW3zkWe
         XClfUh25nXWREQiystDZCZbHgKZWVzok5cdZqK61MiQzL5hzovDVNwSmFzXcOm6oRW1Q
         HNVw==
X-Forwarded-Encrypted: i=1; AKwUvByDWWecKtOD8uGoFKHVZQ4MD3OsY+yrgjZgpHSpmWoh/sfp7+IYdUoParAiM61Ey+8pZLJ/I8AebCfcKcqd@lists.linux.dev
X-Gm-Message-State: AFuF++mqS/bv7lwVXn4neOb2kq7nr/2plHK+Ft3+bSHfGW/Rzu24D4SD
	7nRJCtmsdjGefEaiG9fZgY14XaO63tr/eS6lfEQsjbIuCfhx1XF9BEn1ZuOvXXqseyZkGmPz
X-Gm-Gg: AYBFou2VuuLSo7j8M3neBQK8GDceS6zaFfm6zoo/nUmatB1Afohd7tipazgdrDSHiLR
	bCqnYS1jIg762tS/NCWqNILIyBhUxkjwzypdsOhUGqMQBgHQ83641XxFBpdgod++th794/kwnlm
	DOVMJ2XQwXRLY6dHXWmbte8nWBXuc0lIdVL2XYKrAfOljrO/y57solnB8KUZAYhc24gPTKb0fYJ
	SjlJKAuwDMEKbK+ywGiRCPfFivc9gbWRlN45WbeY0o7PcI0qzd+CLWKryGNreGCxxPixWfoZZiW
	wmyWmsKTrvEDzCPX60kluV/ikKlinx1Co2LX6d7GmnXjpAt8w9RD86RFAxY+TIeXEUyT7NM0dS5
	XaQ26h2wGAcMC5h4Ui3aaKd6FFUOJ4FBpPOYWI1oAevllu8E6864pOY0Lmu/70slUq1dpNyE24W
	trcMv4Pv5nTmAB5ce9iwT1QLl0mqHM2yQt/KKRxoEcgoLXPFgevS1b8vokS1Kzi9jy
X-Received: by 2002:a17:90b:3c05:b0:393:288:29e3 with SMTP id 98e67ed59e1d1-39b26106c44mr57003505a91.10.1788990980635;
        Wed, 09 Sep 2026 14:56:20 -0700 (PDT)
Received: from frese.. ([189.60.169.129])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3396e7e477csm15478156eec.29.2026.09.09.14.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 14:56:20 -0700 (PDT)
From: Enzo Frese <freseenzo@gmail.com>
To: gregkh@linuxfoundation.org
Cc: m.steinmoetzger@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Enzo Frese <freseenzo@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix checkpatch style issues in odm_DynamicBBPowerSaving.c
Date: Wed,  9 Sep 2026 18:56:08 -0300
Message-ID: <20260909215608.117443-1-freseenzo@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix several checkpatch.pl style warnings in
odm_DynamicBBPowerSaving.c:

- remove unnecessary blank line after opening brace
- add missing spaces around '&' and '>>' operators
- add braces on all arms of if/else statements
- remove trailing whitespace

CamelCase naming issues are left untouched, as renaming
these identifiers would require wider refactoring across
the driver, as already noted in the driver's TODO file.

Signed-off-by: Enzo Frese <freseenzo@gmail.com>
---
 .../rtl8723bs/hal/odm_DynamicBBPowerSaving.c  | 36 +++++++++++--------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_DynamicBBPowerSaving.c b/drivers/staging/rtl8723bs/hal/odm_DynamicBBPowerSaving.c
index ba6357c6a7ed..ed743f6678dc 100644
--- a/drivers/staging/rtl8723bs/hal/odm_DynamicBBPowerSaving.c
+++ b/drivers/staging/rtl8723bs/hal/odm_DynamicBBPowerSaving.c
@@ -33,11 +33,10 @@ void ODM_RF_Saving(void *pDM_VOID, u8 bForceInNormal)
 	}
 
 	if (pDM_PSTable->initialize == 0) {
-
-		pDM_PSTable->Reg874 = (PHY_QueryBBReg(pDM_Odm->Adapter, 0x874, bMaskDWord)&0x1CC000)>>14;
-		pDM_PSTable->RegC70 = (PHY_QueryBBReg(pDM_Odm->Adapter, 0xc70, bMaskDWord)&BIT(3))>>3;
-		pDM_PSTable->Reg85C = (PHY_QueryBBReg(pDM_Odm->Adapter, 0x85c, bMaskDWord)&0xFF000000)>>24;
-		pDM_PSTable->RegA74 = (PHY_QueryBBReg(pDM_Odm->Adapter, 0xa74, bMaskDWord)&0xF000)>>12;
+		pDM_PSTable->Reg874 = (PHY_QueryBBReg(pDM_Odm->Adapter, 0x874, bMaskDWord) & 0x1CC000) >> 14;
+		pDM_PSTable->RegC70 = (PHY_QueryBBReg(pDM_Odm->Adapter, 0xc70, bMaskDWord) & BIT(3)) >> 3;
+		pDM_PSTable->Reg85C = (PHY_QueryBBReg(pDM_Odm->Adapter, 0x85c, bMaskDWord) & 0xFF000000) >> 24;
+		pDM_PSTable->RegA74 = (PHY_QueryBBReg(pDM_Odm->Adapter, 0xa74, bMaskDWord) & 0xF000) >> 12;
 		/* Reg818 = PHY_QueryBBReg(padapter, 0x818, bMaskDWord); */
 		pDM_PSTable->initialize = 1;
 	}
@@ -55,20 +54,29 @@ void ODM_RF_Saving(void *pDM_VOID, u8 bForceInNormal)
 				else
 					pDM_PSTable->CurRFState = RF_Save;
 			}
-		} else
+		} else {
 			pDM_PSTable->CurRFState = RF_MAX;
-	} else
+		}
+	} else {
 		pDM_PSTable->CurRFState = RF_Normal;
+	}
 
 	if (pDM_PSTable->PreRFState != pDM_PSTable->CurRFState) {
 		if (pDM_PSTable->CurRFState == RF_Save) {
-			PHY_SetBBReg(pDM_Odm->Adapter, 0x874, 0x1C0000, 0x2); /* Reg874[20:18]=3'b010 */
-			PHY_SetBBReg(pDM_Odm->Adapter, 0xc70, BIT(3), 0); /* RegC70[3]= 1'b0 */
-			PHY_SetBBReg(pDM_Odm->Adapter, 0x85c, 0xFF000000, 0x63); /* Reg85C[31:24]= 0x63 */
-			PHY_SetBBReg(pDM_Odm->Adapter, 0x874, 0xC000, 0x2); /* Reg874[15:14]=2'b10 */
-			PHY_SetBBReg(pDM_Odm->Adapter, 0xa74, 0xF000, 0x3); /* RegA75[7:4]= 0x3 */
-			PHY_SetBBReg(pDM_Odm->Adapter, 0x818, BIT(28), 0x0); /* Reg818[28]= 1'b0 */
-			PHY_SetBBReg(pDM_Odm->Adapter, 0x818, BIT(28), 0x1); /* Reg818[28]= 1'b1 */
+			/* Reg874[20:18]=3'b010 */
+			PHY_SetBBReg(pDM_Odm->Adapter, 0x874, 0x1C0000, 0x2);
+			/* RegC70[3]= 1'b0 */
+			PHY_SetBBReg(pDM_Odm->Adapter, 0xc70, BIT(3), 0);
+			/* Reg85C[31:24]= 0x63 */
+			PHY_SetBBReg(pDM_Odm->Adapter, 0x85c, 0xFF000000, 0x63);
+			/* Reg874[15:14]=2'b10 */
+			PHY_SetBBReg(pDM_Odm->Adapter, 0x874, 0xC000, 0x2);
+			/* RegA75[7:4]= 0x3 */
+			PHY_SetBBReg(pDM_Odm->Adapter, 0xa74, 0xF000, 0x3);
+			/* Reg818[28]= 1'b0 */
+			PHY_SetBBReg(pDM_Odm->Adapter, 0x818, BIT(28), 0x0);
+			/* Reg818[28]= 1'b1 */
+			PHY_SetBBReg(pDM_Odm->Adapter, 0x818, BIT(28), 0x1);
 		} else {
 			PHY_SetBBReg(pDM_Odm->Adapter, 0x874, 0x1CC000, pDM_PSTable->Reg874);
 			PHY_SetBBReg(pDM_Odm->Adapter, 0xc70, BIT(3), pDM_PSTable->RegC70);
-- 
2.43.0

