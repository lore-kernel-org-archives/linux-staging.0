Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91DC29B795
	for <linux-staging@lists.linux.dev>; Sun,  1 Feb 2026 13:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769952459; cv=none; b=bH45xvh4w3PZhzxumSqj+VO53T2Q8IUlN3iwTdDYZvdBr4xYDsO/4ui5YqSvTIx9Z9liv5d2aEz2kBhRBk4quxySaoBoRWP4hWB7TYwSP3/WjCmYbSoR123+/fDopyTJNkAi9RXxiS+M/oXn1qi9qdQmpmHlOF9uRzMvjCUIfNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769952459; c=relaxed/simple;
	bh=LGH5AqPOEsiIUve9uUoEOb5Gf3ZLwNENwTScdQdP7X0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jUUbXwbF4+8oqxGoc+MESmTtTdWkqHOZ0WHeKh8pWnG34urCkHAgbFCeMbpe/oJ5FWL1AfO5c7gOwkxKPWwg9qQHc0Xcdkn7/rb7R3SiO8BWk0+yb/5FAdQVtHJY4X/c/1EyTKUfSQ2XqOg0LEbeqBLUE9WHTH4sljTfqfRAmwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QdapXV+l; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QdapXV+l"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-48068127f00so30176445e9.3
        for <linux-staging@lists.linux.dev>; Sun, 01 Feb 2026 05:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769952456; x=1770557256; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I3UUytHfblt7ijE/UxVwvx3W9WU1y/4ofbR1uKj5fyA=;
        b=QdapXV+lC0wARKaneoZCfgnYngwQYvRaCFqU3Bx1s9EnUA4CyrkeBvPgVcXL/G9zRd
         7lLHBi9Ry6Px+VKuodWwKKYROJEz74hcTL1l7VvjRunXeWd22Z6RrOSZA3XDx5lfo5BH
         Hnov6OpEG2cJnznK+3QejLxFeEUOAlP37IzISbCW7sz/+M8MK2ukTPhiqMVepNYPOdjw
         SvfXCrt2wRdni4yLrhmz3ESat4RkS+5wjQ/XxeNt0gzx8f4qylfFAnFA7GXKiC/LaygO
         ciljlNntRp2tyJ66b6CGYLvGM3QFw18t7XEdYVQPKmIcrBiS5ropKT5Uf9djHATqm7Uh
         2p/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769952456; x=1770557256;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I3UUytHfblt7ijE/UxVwvx3W9WU1y/4ofbR1uKj5fyA=;
        b=pN2NhyKzWCwn47jUeR5kRVEs55kym0+/cIm35aGPqiXUBllL3mjN+Uf31x+LqfjM7p
         0dZUGHQqOlMEif6kOFFLYEpbFQf0mzcSMfJL0s0oLfiuEXo8GX5/snFWNghtjcGIUyY4
         ifGBzIgqmSEYDcOgDXE+aNCYs5vHfP5rOgU3QBcbibIa8cIrj8uKAOMunmapb1/Aql66
         FNqxLIurxrQjlwPOK7Rou7c/EAZHWgPiyOL5bSKTL/bmpk6Hti8DcVbbC4YZNwxeTPp4
         wYKYHBuoNRhDqWBHd+k5uAo9Mqo81kzMXJtfxh6v/Vc04Z4IM6jid3fwiiMgKbuq+Hn8
         N7gw==
X-Forwarded-Encrypted: i=1; AJvYcCWvk8SvNuklvyYYh95LjpJ8hXxIJAZHT9Nqmv0A4fU8JNdG7pFAuKvhMR/os/hRZn3obxFU0yxHHntOpvY1@lists.linux.dev
X-Gm-Message-State: AOJu0YxEhDS5Lwb850U31GoCEncYaxAw/hsXlWoH7YRsy1T9N+mw/WSc
	yYP3RsuHRDXGTqw4SFXhglA+N3JEHiN1Nbxv6yTCATMgy5AWzzqletWx
X-Gm-Gg: AZuq6aLoqsYGecLzLqTOkks3HqpLPdD/CuoWcNpkwlzBPMQoV2nD2ZU2GWXIDSMrVx9
	e+C+WE8ogGnYnyOlHYLUZo41WY3pKJfP6yjtct3+Sn8RNaooL8COKERcyXgYaObB29WXLurxeBq
	fYB4kHADlqKL91jl6fMKgU6+LFeBycZJT75rLAvg5KtkQFRyewo+BhcAF01nwIILZJpTPaUwJc4
	BkICslXoL9n9GeD9497it3jB5TdGRtj0KogyP6yskd/5LT/IC9xv+oB/woTeC2vaH5ZEycgarYw
	2WVcgNKy5EleqrNs+M5ZXu8G4b3/aLrPZpFcUX3Z8j28HAl4RCEz6OKGmmi+Gj75ytIxbI/ILhS
	vxBIzy7VfXgEwYo26iSOx/xuLBaQhWvsijlpUuL/N11Kp0kfanrR2QJ7O2F3CSFHapD2hMCpx
X-Received: by 2002:a05:600c:3f0d:b0:47a:9560:ec28 with SMTP id 5b1f17b1804b1-482db465f83mr106113515e9.13.1769952455843;
        Sun, 01 Feb 2026 05:27:35 -0800 (PST)
Received: from BERA ([31.223.9.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066c37420sm418189755e9.9.2026.02.01.05.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 05:27:35 -0800 (PST)
Date: Sun, 1 Feb 2026 16:27:33 +0300
From: Bera =?iso-8859-1?B?Wfx6bPw=?= <b9788213@gmail.com>
To: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: refactor ODM_SetIQCbyRFpath to reduce
 duplication
Message-ID: <aX9UxRK_iYwxhTAm@BERA.localdomain>
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
changing. Introduce a small static inline helper, set_iqc(),
to encapsulate a single PHY_SetBBReg() invocation and select
the RF path once based on RFpath. This reduces code duplication,
makes the intent clearer and eases future maintenance.

No functional change intended: register keys/values and
the selection logic remain the same.

Signed-off-by: Bera Yüzlü <b9788213@gmail.com>
---
 .../staging/rtl8723bs/hal/HalPhyRf_8723B.c    | 33 +++++++++----------
 1 file changed, 16 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
index 34692cca33f5..bd535f774852 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
@@ -1074,10 +1074,17 @@ static void _PHY_PathBFillIQKMatrix8723B(
 /*  */
 /*  MP Already declare in odm.c */
 
+/* Helper */
+static inline void set_iqc(struct dm_odm_t *Odm, u32 *table)
+{
+	PHY_SetBBReg(Odm->Adapter, table[KEY], bMaskDWord, table[VAL]);
+}
+
 void ODM_SetIQCbyRFpath(struct dm_odm_t *pDM_Odm, u32 RFpath)
 {
 
 	struct odm_rf_cal_t *pRFCalibrateInfo = &pDM_Odm->RFCalibrateInfo;
+	u8 path;
 
 	if (
 		(pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC80][VAL] != 0x0) &&
@@ -1085,23 +1092,15 @@ void ODM_SetIQCbyRFpath(struct dm_odm_t *pDM_Odm, u32 RFpath)
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
+		path = RFpath ? PATH_S0 : PATH_S1; /* S1: RFpath = 0, S0:RFpath = 1 */
+
+		/* TX IQC */
+		set_iqc(pDM_Odm, pRFCalibrateInfo->TxIQC_8723B[path][IDX_0xC94]);
+		set_iqc(pDM_Odm, pRFCalibrateInfo->TxIQC_8723B[path][IDX_0xC80]);
+		set_iqc(pDM_Odm, pRFCalibrateInfo->TxIQC_8723B[path][IDX_0xC4C]);
+		/* RX IQC */
+		set_iqc(pDM_Odm, pRFCalibrateInfo->RxIQC_8723B[path][IDX_0xC14]);
+		set_iqc(pDM_Odm, pRFCalibrateInfo->RxIQC_8723B[path][IDX_0xCA0]);
 	}
 }
 
-- 
2.43.0

