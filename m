Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B2A2475D0
	for <linux-staging@lists.linux.dev>; Sat,  7 Feb 2026 14:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770472928; cv=none; b=SLbj23MidDs+Z2/H1UPl96ohRN+A/RddBzLSKQ1sBv/Vv5EhmcSf43Kqj9HdhYS4lGp4j0UPHsejDON+sI0S6pLV0C1FF3zkxOK7dos8+prs1LpttGWNj0Yvb17046A7IODPgnZ3xitr4v/Nr4bmjO6yLJreBT7KuG0Gk3PR8ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770472928; c=relaxed/simple;
	bh=VA0zE8rDX2Q4udlhMjvEaVqSPONuk3F8F5XadgQPuM0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PTHCaluwRICkgaAgc8Cph8x7wBrTK1MUVnHFXBfK8Tgb6opHjuPua87O4TpG4WlKT8zcMcgtae90yIaEs2nFHW8w+rFB/Bu93ViFUUgk9mFH/GmXzJ7wFWEjZcm7bTQUXajvP9WME5XELjNEgnvQ10VNucsAaQhwS5S3absIOlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C/yW2xsF; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C/yW2xsF"
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-4801eb2c0a5so28236115e9.3
        for <linux-staging@lists.linux.dev>; Sat, 07 Feb 2026 06:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770472927; x=1771077727; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Knuttv861Uu0HJP206y97ixPrPqbWPfbOEF8vnELD8=;
        b=C/yW2xsFkvozbG9aX8dAFhroy/oSrEbuJeuIY4xdPEs8T9P+kBJIA3kgG5+NKOuSX/
         reoh+nUM8uBkighOhEsWLT659uCbRA6HkppvKiiit3HXDJ4KZhDEQWqcY/+jBos5o+4t
         vvYeLntakaUTp8N8O3N9mVIwUko4t/gdNPVyAQgNMRMtoh+2ofQn0646KkOkXkX2HeWe
         KGlKpwA80E+zvOPyRgvy9RHxYVwZVKjGXL0Cg1e5PRR4mgNHmNddQW/VGStmZscFJ4fR
         UVy6ihhaoCUTTSHng1oBDKqBF8zO9vs9cuKDC/Y++RCAAsuzukvHIw+XlwZgXNdL/+If
         kLmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770472927; x=1771077727;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+Knuttv861Uu0HJP206y97ixPrPqbWPfbOEF8vnELD8=;
        b=oK7T9umo2v6P+0jgRKsIZXqVXjlk+Lv41bbhpSsiZ1CLlfDCBzwrIe1i4XzG7vs//a
         IbmTB+zZXnuCG6N8nKVv4duCges0abt0T2IlsKIHAmtseSPEDqjx6y4pRazujWFoAVCU
         ++cf/avAgVBLD+G9kgTRnYwOjzmmT4wvB2T4++kN0ekxF0z3moAnNPNX3PU6YXHw/VNv
         Y25gabvgDpVKq0Pwnj5Y7KQCTzcH0tFTkkomiaJxlMzHTwmBFcmXja3r/QeiDDpmerEf
         TGSI1+t1IWMYn8XvZJSuTqeB8Wx12PL7Qj+PYGG+z14Q6bGdZL2Ir3uHrfAjn7cEojKj
         8eTw==
X-Forwarded-Encrypted: i=1; AJvYcCXrsPvt4a/CoVW8ZROxhaKF6J9MTO0fBeGp5HK61pCVDRdIQKkqz2uLvfkqyo2uq8SmTlSCSFrEA6jL88Rn@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/hRRXloYxk5EgtDVSOpDg8G/SuEX8YCvU3lJNkBJalT9IqgQO
	78q1mUWqiObxIiz/x71q7BPqURbMj2MqgrROLKKQ0gEXBddPKfdOClZk6YRvMrpK
X-Gm-Gg: AZuq6aK5du+zl/qTM7oiUeM/LbYP3B1IZ3aDRnKVGHvbSK46pwpyfRJ8X9KI7r3KI7h
	EXY9slWkEfbJrC0j/vL7yYU1uZPamFHvgqD5CLNpnitxglghjnZCqsLwRdkMTb6YbuF5I2UwiC1
	ZJENqw3/iH1/m1/kdzPM0u4nxXw/uHMy9XN9lVFP1URoBYOHyz7Kf4fq4Aa1z7CcUtkjObIn6aA
	C9xNdN50U9i4LDdVuJI77muAqYso7Fm/wsGHhoglQSSx07ySLCHroRWD6u5idVYEZGEzQSpHWBF
	hqm5WSj87xnNS+qcNKdByLMwQy0auLF5FdE6HdZtvqe0LC7h0ZIpklUXcbtabV8j//fM7bronXa
	FOpEZNNyH/pwClMNq98QTyt4hSaHdMiTVPcBmTnElYmbsunZBWh4lkM1kwts8RRXvyTgzZHzGkQ
	==
X-Received: by 2002:a05:600c:3553:b0:477:63b5:7148 with SMTP id 5b1f17b1804b1-483201dc644mr84015775e9.6.1770472926577;
        Sat, 07 Feb 2026 06:02:06 -0800 (PST)
Received: from BERA ([31.223.72.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4362972fc1bsm14028237f8f.28.2026.02.07.06.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 06:02:06 -0800 (PST)
Date: Sat, 7 Feb 2026 17:02:05 +0300
From: Bera =?iso-8859-1?B?Wfx6bPw=?= <b9788213@gmail.com>
To: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: rtl8723bs: refactor ODM_SetIQCbyRFpath to reduce
 duplication
Message-ID: <aYdF3QYfFHYk3Lpe@BERA.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Refactor ODM_SetIQCbyRFpath to remove duplicated PHY_SetBBReg()
calls and improve readability.

The original implementation duplicated the same PHY_SetBBReg()
calls for both RF paths (S0 / S1) with only the path index
changing. This reduces code duplication,
makes the intent clearer and eases future maintenance.

No functional change intended: register keys/values and
the selection logic remain the same.

Signed-off-by: Bera Yüzlü <b9788213@gmail.com>
---
V2: Removed helper function
V2: Used explicit if() instead of ?:
V2: Removed /* S1: RFpath = 0, S0:RFpath = 1 */ comment based on Dan Carpenter's suggestion

V1 link: https://lore.kernel.org/linux-staging/aX9UxRK_iYwxhTAm@BERA.localdomain/

 .../staging/rtl8723bs/hal/HalPhyRf_8723B.c    | 30 ++++++++-----------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
index 34692cca33f5..9df3274c1048 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
@@ -1078,6 +1078,7 @@ void ODM_SetIQCbyRFpath(struct dm_odm_t *pDM_Odm, u32 RFpath)
 {
 
 	struct odm_rf_cal_t *pRFCalibrateInfo = &pDM_Odm->RFCalibrateInfo;
+	u8 path;
 
 	if (
 		(pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC80][VAL] != 0x0) &&
@@ -1085,23 +1086,18 @@ void ODM_SetIQCbyRFpath(struct dm_odm_t *pDM_Odm, u32 RFpath)
 		(pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC80][VAL] != 0x0) &&
 		(pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xC14][VAL] != 0x0)
 	) {
-		if (RFpath) { /* S1: RFpath = 0, S0:RFpath = 1 */
-			/* S0 TX IQC */
-			PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC94][KEY], bMaskDWord, pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC94][VAL]);
-			PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC80][KEY], bMaskDWord, pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC80][VAL]);
-			PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC4C][KEY], bMaskDWord, pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC4C][VAL]);
-			/* S0 RX IQC */
-			PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xC14][KEY], bMaskDWord, pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xC14][VAL]);
-			PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xCA0][KEY], bMaskDWord, pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xCA0][VAL]);
-		} else {
-			/* S1 TX IQC */
-			PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC94][KEY], bMaskDWord, pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC94][VAL]);
-			PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC80][KEY], bMaskDWord, pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC80][VAL]);
-			PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC4C][KEY], bMaskDWord, pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC4C][VAL]);
-			/* S1 RX IQC */
-			PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xC14][KEY], bMaskDWord, pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xC14][VAL]);
-			PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xCA0][KEY], bMaskDWord, pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xCA0][VAL]);
-		}
+		if (RFpath)
+			path = PATH_S0;
+		else
+			path = PATH_S1;
+
+		/* TX IQC */
+		PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->TxIQC_8723B[path][IDX_0xC94][KEY], bMaskDWord, pRFCalibrateInfo->TxIQC_8723B[path][IDX_0xC94][VAL]);
+		PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->TxIQC_8723B[path][IDX_0xC80][KEY], bMaskDWord, pRFCalibrateInfo->TxIQC_8723B[path][IDX_0xC80][VAL]);
+		PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->TxIQC_8723B[path][IDX_0xC4C][KEY], bMaskDWord, pRFCalibrateInfo->TxIQC_8723B[path][IDX_0xC4C][VAL]);
+		/* RX IQC */
+		PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->RxIQC_8723B[path][IDX_0xC14][KEY], bMaskDWord, pRFCalibrateInfo->RxIQC_8723B[path][IDX_0xC14][VAL]);
+		PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->RxIQC_8723B[path][IDX_0xCA0][KEY], bMaskDWord, pRFCalibrateInfo->RxIQC_8723B[path][IDX_0xCA0][VAL]);
 	}
 }
 
-- 
2.43.0

