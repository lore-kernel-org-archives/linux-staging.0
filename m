Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93EE52E1722
	for <linux-staging@lists.linux.dev>; Sun,  5 Jul 2026 19:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783280166; cv=none; b=F1oSLBiMyL78HMsV1lFLTZUVw3n2tQDKl1zjb6zKJBS20RDuqwV96tlBifljxCgCX0ewNXX2Q39Xv3XfFDpLW3lW1hCGZ0Ag//awutY12RZIKDCIhS7LK1AW2f8bslYmq1joo2BPR4REWhKnL4qwaeg1RZ5rObVFoOcerqozhUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783280166; c=relaxed/simple;
	bh=QztdeMOFdrIWd77/JFwZ0L9TaHZTS90cORzHILt7xKo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pyAUVeAzmvOOZCtoaq3sFuL0/q2oJ3IA/pE37iFpPFgiZAqw+aa57S0J14RBPASHLg0sUbOzxfNkqNE0lU789XsWOvtRz0v2ni29ilWBUEXECzNoUbYzyLMsSKNxv6I1AwTuFoqoCNjzxxpvn/eZhzVN2C9bejJExS/rsh7n4is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ivqTp2NS; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ivqTp2NS"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2caa0551d8bso7505045ad.2
        for <linux-staging@lists.linux.dev>; Sun, 05 Jul 2026 12:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783280165; x=1783884965; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w4rdjqjUZoW9EXTRb4ttiQdT9CbW7hl1jr0RLDeWbqw=;
        b=ivqTp2NSRbhrZa1Gvly0B+L3IoksrP0nnuaI+LfGUv3FmbgU0MkX+CEQfdsIl2IjL+
         u9MXLTMRwW5WO66nCCjjSefvdp4QEvrfOroveg7chFLWNllapARKE6q6e36zhWvU8OMr
         99k2tUZqxMxobakCywIU4ugb5X1kELiIzr234xUKUiCzvkAUPB0hMTDpi+/exi4fa7jb
         RbWAWohgcXo4EB7AzFdLjrYCws9gmodhhrWzdOtFDyZopZNr3da87l0/5TLYfXqZ2vvb
         2kNiJw8K2Jh4tSNJ/eW13sE8lWRs7Kovav87KBE1aWxL5V9LZY95W05VqJX8DC2caLvv
         /kxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280165; x=1783884965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w4rdjqjUZoW9EXTRb4ttiQdT9CbW7hl1jr0RLDeWbqw=;
        b=kz76juDmbMhZEoif9etDqSih4NO6vx0pYFVRYtR3qd6ek7h7ZkH8kPSMzwSOaDTaFq
         cC49A+gsCyacUvNGEeVshCmoLHROfP8n/0QEEj/oXaExb5MddHgiBHi9pXdvdslJ3bRa
         0KZd5ODBYqMLrjT1yo01afAgzoyufUCxTUP5aMVb+2326XItueqzuDlWSmTIF84FGhH7
         0aPsC2bwJ88aiNOKpkMPeSTyAsT06m75+OqbWFY3RTwhehqIGq5T5BvUel8gB/W2TLUD
         ZbbQfcI9U6zvEg1knkJ1eCI9IUBmwviisHI8uMp+7Dx98FYpgDBc04xijT7vXUh4XePW
         EZzw==
X-Gm-Message-State: AOJu0YyBw07bfA+WJMwYuc9/IltwOjDwR+tRhK367ZjGY2ayw4t48uCg
	p9u9RiJnLj+vRlEo6BkGE0Nt05wcUC9a7wQQ0fki4VClm9qGzIA0Ki+j
X-Gm-Gg: AfdE7cm0Cg5u/gkdf5dEu0iO+quMH2kVcnC4l5FMWq6e3dYZyWmIJ2JUWcntWmgbyF0
	sQl8O/mx3IlI7277MTe5Cg5Y5RAsjs8dRRTouhT5yyMUHJWQRbvV4ssrUSy1Jf4b203U5Pl1Z3a
	GLfn7ta9Xw6QLAodArmBtRtyjhdqweD8OTPISChwxUDOgnaLqaYO8g8+jBYxG4lr/FDdxKCq4hX
	KQr3xR/Oi1f7Q2DgxmmuxtXcS+eVhjGxxn0Vqy9c0SMQFB/PnZCatkWl7QM3bDsNqmK3gw3t5nG
	Ae3I3wLQh4QwaGaMpMwjyfeIUvhVx3HCeYeCBnIa/GePM5t4TiAmnSNZA9fVt0LAOezXsM/PCKg
	UqlkwrZVBz588/XbB/ki9m9qmjUSMSoKYEf9L1iw4DT6YKIGFf/l/JZozj2yjOmX2XvIe5N9xQz
	Ki9GdTHfiNEC2AjJWcIreXGwfH3407io9WdyZ1kCC+BN2GlXNI/PfvLoGTXXiFrXHuXbPDtO2jG
	s+SP2EkOoBJv+QV2dNyFxI=
X-Received: by 2002:a17:902:d551:b0:2cc:9d9:b8df with SMTP id d9443c01a7336-2cc09d9c025mr43811895ad.5.1783280164894;
        Sun, 05 Jul 2026 12:36:04 -0700 (PDT)
Received: from localhost.localdomain (n58-104-240-194.mrk2.qld.optusnet.com.au. [58.104.240.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b446a766asm51627548c88.7.2026.07.05.12.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:36:04 -0700 (PDT)
From: Daniel Guihot <daniel.guihot123@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Daniel Guihot <daniel.guihot123@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove unnecessary braces from single statement blocks
Date: Mon,  6 Jul 2026 05:33:42 +1000
Message-ID: <20260705193340.14684-3-daniel.guihot123@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove braces around single statement blocks in rtl8723b_hal_init.c to
comply with the kernel code style, as reported by checkpatch.pl:

  WARNING: braces {} are not necessary for single statement blocks
  WARNING: braces {} are not necessary for any arm of this statement

No functional change.

Signed-off-by: Daniel Guihot <daniel.guihot123@gmail.com>
---
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 32 +++++++------------
 1 file changed, 12 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index bcaf63b2893c..b74fdf66c772 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -194,9 +194,8 @@ static s32 polling_fwdl_chksum(
 		yield();
 	} while (jiffies_to_msecs(jiffies-start) < timeout_ms || cnt < min_cnt);
 
-	if (!(value32 & FWDL_ChkSum_rpt)) {
+	if (!(value32 & FWDL_ChkSum_rpt))
 		goto exit;
-	}
 
 	if (g_fwdl_chksum_fail) {
 		g_fwdl_chksum_fail--;
@@ -235,9 +234,8 @@ static s32 _FWFreeToGo(struct adapter *adapter, u32 min_cnt, u32 timeout_ms)
 		yield();
 	} while (jiffies_to_msecs(jiffies - start) < timeout_ms || cnt < min_cnt);
 
-	if (!(value32 & WINTINI_RDY)) {
+	if (!(value32 & WINTINI_RDY))
 		goto exit;
-	}
 
 	if (g_fwdl_wintint_rdy_fail) {
 		g_fwdl_wintint_rdy_fail--;
@@ -1031,9 +1029,8 @@ void UpdateHalRAMask8723B(struct adapter *padapter, u32 mac_id, u8 rssi_level)
 	rate_bitmap = hal_btcoex_GetRaMask(padapter);
 	mask &= ~rate_bitmap;
 
-	if (pHalData->fw_ractrl) {
+	if (pHalData->fw_ractrl)
 		rtl8723b_set_FwMacIdConfig_cmd(padapter, mac_id, psta->raid, psta->bw_mode, short_gi_rate, mask);
-	}
 
 	/* set correct initial date rate for each mac_id */
 	pdmpriv->INIDATA_RATE[mac_id] = psta->init_rate;
@@ -1184,9 +1181,9 @@ void Hal_EfuseParseIDCode(struct adapter *padapter, u8 *hwinfo)
 
 	/*  Check 0x8129 again for making sure autoload status!! */
 	EEPROMId = le16_to_cpu(*((__le16 *)hwinfo));
-	if (EEPROMId != RTL_EEPROM_ID) {
+	if (EEPROMId != RTL_EEPROM_ID)
 		pEEPROM->bautoload_fail_flag = true;
-	} else
+	else
 		pEEPROM->bautoload_fail_flag = false;
 }
 
@@ -1596,9 +1593,8 @@ static void rtl8723b_cal_txdesc_chksum(struct tx_desc *ptxdesc)
 	/*  Thomas, Lucas@SD4, 20130515 */
 	count = 16;
 
-	for (index = 0; index < count; index++) {
+	for (index = 0; index < count; index++)
 		checksum |= le16_to_cpu(*(__le16 *)(usPtr + index));
-	}
 
 	ptxdesc->txdw7 |= cpu_to_le32(checksum & 0x0000ffff);
 }
@@ -1772,11 +1768,10 @@ static void rtl8723b_fill_default_txdesc(
 		ptxdesc->mbssid = pattrib->mbssid & 0xF;
 
 		ptxdesc->rty_lmt_en = 1; /*  retry limit enable */
-		if (pattrib->retry_ctrl) {
+		if (pattrib->retry_ctrl)
 			ptxdesc->data_rt_lmt = 6;
-		} else {
+		else
 			ptxdesc->data_rt_lmt = 12;
-		}
 
 		ptxdesc->datarate = MRateToHwRate(pmlmeext->tx_rate);
 
@@ -1867,9 +1862,8 @@ void rtl8723b_fill_fake_txdesc(
 		SET_TX_DESC_HWSEQ_SEL_8723B(pDesc, 0);
 	}
 
-	if (IsBTQosNull) {
+	if (IsBTQosNull)
 		SET_TX_DESC_BT_INT_8723B(pDesc, 1);
-	}
 
 	SET_TX_DESC_USE_RATE_8723B(pDesc, 1); /*  use data rate which is set by Sw */
 	SET_TX_DESC_OWN_8723B((u8 *)pDesc, 1);
@@ -2555,9 +2549,8 @@ void SetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val)
 
 			/*  Forece leave RF low power mode for 1T1R to prevent conficting setting in Fw power */
 			/*  saving sequence. 2010.06.07. Added by tynli. Suggested by SD3 yschang. */
-			if (psmode != PS_MODE_ACTIVE) {
+			if (psmode != PS_MODE_ACTIVE)
 				ODM_RF_Saving(&pHalData->odmpriv, true);
-			}
 
 			/* if (psmode != PS_MODE_ACTIVE)	{ */
 			/* 	rtl8723b_set_lowpwr_lps_cmd(padapter, true); */
@@ -2871,11 +2864,10 @@ u8 GetHalDefVar8723B(struct adapter *padapter, enum hal_def_variable variable, v
 		break;
 
 	case HAL_DEF_TX_PAGE_BOUNDARY:
-		if (!padapter->registrypriv.wifi_spec) {
+		if (!padapter->registrypriv.wifi_spec)
 			*(u8 *)pval = TX_PAGE_BOUNDARY_8723B;
-		} else {
+		else
 			*(u8 *)pval = WMM_NORMAL_TX_PAGE_BOUNDARY_8723B;
-		}
 		break;
 
 	case HAL_DEF_MACID_SLEEP:
-- 
2.54.0

