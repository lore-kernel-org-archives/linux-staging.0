Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529EE43B6C7
	for <linux-staging@lists.linux.dev>; Wed,  8 Jul 2026 12:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783512528; cv=none; b=mJHfni1oXmNgHPcj41e5o7Jx0sHiJvqQlAf8mrbZEnkTjq4SrnyyiXsifWxbeFqn37w9ViEGn18Ss9X0CRXBwondkRhdJcqGCmLecyU1HAUWU1/wXVxTJt3YLKPwZz2NnZERaWv6JiBANvN81Ifmha1vWg2vSivNKrECpLOvc8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783512528; c=relaxed/simple;
	bh=6TeoPMQvaGGiUgpQ0CUrRX+Gf5Tq/W4nF1Mgc+W7RR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V+a17ZwycNY3lIgJaZysa+3N+vpgC2v8mfA3PEDFJYeKO9qOWBmb5YHDcDBlJgEhjPQqwMCylPji14IHuFaNDaXGWTittBOsIG9HU8rBREgmDVmdi2wgMMwFV7StmdDAUrD/EztMWq3HpER2qMnpOjcp8Sygn6T6Ar8YIX5hbak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QkGtO9Ee; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QkGtO9Ee"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cad68425a7so840415ad.1
        for <linux-staging@lists.linux.dev>; Wed, 08 Jul 2026 05:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783512527; x=1784117327; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l2kZSf623HYDi2Srcexl0GU1swSPjNebDGJsAM3gZqM=;
        b=QkGtO9Eeo8fpW1M4qiwYuefIC7KUdzD8+Mfo6LWCOFN+HK90D+Gc61EUEuMKunNEy5
         sxGTidthNj1S1cHxRjPLrV+D3eQ5lbxpEyc9wG1tn9w4fHMyduNpcBbCncRYKMWfWNld
         2/IXIoWyGRvPZxiKTetemBJWIIBRx196zGez5756fQxb/RqbQrKQ8bXng/e6pd6yJwB8
         cMJGcDB2jfRAR2xE2xMMRhNpY5JS4wEgP0Z7shOnERTo4vROO4vD7aNNBABh2iDJ3QM+
         ZAScP35TivqDoB7QGk/tnlu/jd9wMi1NjhamAaHrgmGeD9yKh/N7hkLzTz8vLS4rsZDI
         v8fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783512527; x=1784117327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l2kZSf623HYDi2Srcexl0GU1swSPjNebDGJsAM3gZqM=;
        b=m/+Yh6m/U8Rzks/2o3FCgCLUKjFrfshbLWEJELi45P5gqVVTViEyfF6VfN+BxiqNSC
         ExbB5yAWebj6MtIvySsKYokN+ssxwC0cITAkI94c5FcpcJXt3XzLT4LLhGeMY8mcpyen
         gAnCJEeccjhttYjCHWt0oPhxD5m1rQfwtRffVZd+x/8kKYMgVaA0+kg+khoumS2MGRww
         okZhS6hINvYfV4Kp816QCav7w4FD/SEGxG7kJ5LEKUFGthAIdqo4EdrSnx+UjdC0cLs5
         HOcc1mEr/neNv2aIpgCjZRLlEild9j4PqhVz95ZVKMH0MszQMR1sQkFdfWSNA+vINBmO
         n0Qw==
X-Forwarded-Encrypted: i=1; AHgh+RoOco7fqkI+yrRO3jVLdZHAtX7qUV190x2aCXLsj1YX1WFZqtpkTCEy1g9LqS02b6a7z2M9Wj6PXs62V41r@lists.linux.dev
X-Gm-Message-State: AOJu0YybhjpYxBDapmM9a8mSur4CM2vw3aSAaEsrmjHSuFwzrSJK9o90
	12agzDEshl33/zwLK742aJfFL3L7iLKTy7BsiStlOj+8NZSY6VWqyhpa
X-Gm-Gg: AfdE7cl0hypYX/LWRlN/2EBN8WtLa6qnuiiEPb9Hmmd3pEjwiYNXDZbmaEITp/vV0C6
	RLERzR0XyIqhITCm7ejhcTq/xBf0gBHofEqhisnn6wfHlJstfyDtzGHlos0GmtebHpkp6LOfaRb
	KJxJ+rNyK2fLmiE0kgWlcw5S7yl7soWGuQDLeCAWWto1IBaNAP35N0Tuz/DZ9UIfrk1SJlo9eD/
	pqK4jrL2aV/AOBjMDA+O69dhvFRWDzK3fXGhdlxM+qURZN+vOguAi7aRjCbl+0hwvgZpB5Jk9fG
	OVNkZbvAG0e8VSTpfWwskdJ5mBJOL5XsKeMt7I73Y9CgkzsLyaAHwdzi42LbDF8eRy4kM9K/UCj
	cwIOi7NY4Oyu/3huHb3tgahjinrLEuWn4A7nRd5qJmlU2WWI1CHSFueSHm09gr7aiePxI2HRUWX
	EYAtcy3Ig5rNRPqNY20BNGWrICFb4pWpWKd/s6/Y6xqUoo3jwdqAQdNzGd1VQJkYaEHxmD116bo
	MEiP8c2aez9NxwHfbxk/u8=
X-Received: by 2002:a17:902:fc84:b0:2ca:d803:5c8f with SMTP id d9443c01a7336-2ccea2af3bbmr19552885ad.1.1783512526502;
        Wed, 08 Jul 2026 05:08:46 -0700 (PDT)
Received: from localhost.localdomain (n58-104-240-194.mrk2.qld.optusnet.com.au. [58.104.240.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb7e9sm27952165ad.10.2026.07.08.05.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:08:45 -0700 (PDT)
From: Daniel Guihot <daniel.guihot123@gmail.com>
To: gregkh@linuxfoundation.org
Cc: daniel.guihot123@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2] staging: rtl8723bs: remove unnecessary braces from single statement blocks
Date: Wed,  8 Jul 2026 22:07:48 +1000
Message-ID: <20260708120747.22388-2-daniel.guihot123@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <2026070718-charging-outsource-81a1@gregkh>
References: <2026070718-charging-outsource-81a1@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove braces around single statement blocks in rtl8723b_hal_init.c to
comply with the kernel coding style, as reported by checkpatch.pl:

  WARNING: braces {} are not necessary for single statement blocks
  WARNING: braces {} are not necessary for any arm of this statement

No functional change.

Signed-off-by: Daniel Guihot <daniel.guihot123@gmail.com>
---
v2: No code changes, v1 was accidentally delivered from two different
addresses. Resent for consistency.

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

