Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90796346797
	for <linux-staging@lists.linux.dev>; Fri,  6 Feb 2026 07:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770364522; cv=none; b=bv6xnQUF/nUZpBuM57xscDnprJDckM3e5SkOdfGyd0dfhYRFke1rIBjSLjVNIU33kUvvyDJuQvLoRWFXTTNG1QYEqDGiDPRei4Kh8YV90VhZcy3R4ESciTVdPp39YTQmoTkcPRfe8CVzaQrg7foTIFC+JuNwf3z1To7Yc/K4Ur4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770364522; c=relaxed/simple;
	bh=9RwoaCnbHlgF1fsHH6ESX+0AIMJG1sMgXc247Q7x+k0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DOHOaqMykUYAQvxstcVtUYd2tJgYozx3wW+GNweBBzN+5mdoAoUCRlmvC9FYgBN9y2VF5PDdtmjSL7LSxivMOEnhYtnvuljeWpuG+dmhZOdrG9haESVplEUUQREOZDxTpeQbim/h02jvVEOmZWeRaV5Byei2RsNocbUh2U6FiCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=auW3GZrO; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="auW3GZrO"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4806e0f6b69so13278385e9.3
        for <linux-staging@lists.linux.dev>; Thu, 05 Feb 2026 23:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770364521; x=1770969321; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R50CaaEOLe9bahQiL94jLLGpNfkGwJIQXyhTbdEaFaM=;
        b=auW3GZrO6qigSa8hzUaji7otpQXLCkEXwUMmHrtyfqxpNpuCgKUA3wkwYsjj8qlAAA
         HWDMybd9e/nodrZMqdfkqUEQ8lsejDtXpiT4Hr2IW16VfQs8d4KJ5sEUQixjk86KBb6d
         zoMNchXGxEhnGFO8P6BYGMXS4HzcIVijBOWg0yG7oZ6PSHmNMk2tkX7xmgbZJ4x2EMZr
         QOsMa3VCaxFmnuPs2uxD4LZ3xh4zMTTcmeNQ5+bF5LCTvVwN5uaS0fWz41pRC/86JnfA
         J0WBF1VjJ8eA1YyctisdEssyq8t8N+onVw6x0NLl3qDYNiP/Cj7uvv2RKHlNAsPJUq1Q
         7BJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770364521; x=1770969321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R50CaaEOLe9bahQiL94jLLGpNfkGwJIQXyhTbdEaFaM=;
        b=XpSpcw3ls4pWYiCrlCYpSnNP3XIcSpfN80W+AATTPZdB6Tyj4DQjKDhlWB9kp+/0Y+
         Gx10wGFUEOYtKdw9F7MkCiyg+XYciNYYeHIS6G6YLn6TjL6aDXqpESz9rz2XHsfeOJ5x
         Ghh5CA8P32NSb0Y6KZd4uB55YjLi6Y9Q6f01N902gkOrVzBtJ28+Dj2ToRuj7RZ4w7iH
         Iawb6e5uz+2X6+4Ac/r4MnkAHRGUVOR18UrU60bIrgubqU+fSMv+kK+jiW6LwiRqf2TZ
         MQmt1p9GlMW9m2igpfcqE6fpC+u4cMRvj1JVWoDhpPekMyCk/QgEKSo00Dkna2Mu6gD3
         +Z7g==
X-Forwarded-Encrypted: i=1; AJvYcCXP8q0Wr97uwgj4sBbE4GN9flAGQHNmhYZFhlotoIbsH5YHl2zg+vrJ16+EBy4H/ytsgt1NuHy2Mx0Ebc3c@lists.linux.dev
X-Gm-Message-State: AOJu0YyWFUJdzhyHff19HFpgBgjZwL16gWkw+yZDAWvxximnCGkoNKiZ
	1cqgwVY9OSs/Xf34PwVA+ZoAvp3mUxscOaoxhmId29VFZC/FRlU8hd8=
X-Gm-Gg: AZuq6aKW8aGyHlvDzlEnnKqXFnRsjliVj0huUep1LhxsNkwvrJJLUYzLYKuBLRw1dqi
	4N0uZq8fgZTqIrpwwGpa+IK126Uh7Ur+3zBLusMg4bdn21rn5SBK+4QglDmvvqn3Xc4oqk1b5px
	RvLuBjw4kY7uxsJJmLeiGcApuowrf+HJtPFLdv9wg/mPyg+hi7ObaPUbikvciMLnh7vomnbvq+V
	Oc2/7plrQwi8jEELbkQ50cljSAUGk4XICv33aglC4qv52WZEc3g7ngm3Eoeac9K0+PNJ3SIAmTm
	HWCtg6MmPSHq2BBufxSNq/LJIfvOu4OBwRn6hop0124pM7A7m9vQz+eAManbdZUQlXYW6zs9WsM
	QqAdAnPuAgNXXf/v0of0UPbp99Vcm2xlLvxka3aVHdyOcLFz4HX8tvjV3J3oW72uuEEz6UlqiNo
	5JqjNnkc3aW9okJUHsNSBpJcnRPjEDB7Jll7K8hHQxpREVpBIel9aE/Rd0GrYtVjs=
X-Received: by 2002:a05:600c:3509:b0:47e:f481:24b7 with SMTP id 5b1f17b1804b1-48320214735mr26719095e9.17.1770364520921;
        Thu, 05 Feb 2026 23:55:20 -0800 (PST)
Received: from LGPC ([31.223.131.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296bd3b8sm3836039f8f.11.2026.02.05.23.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 23:55:20 -0800 (PST)
From: lukagejak5@gmail.com
X-Google-Original-From: luka.gejak@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <luka.gejak@linux.dev>
Subject: [PATCH v2 17/26] staging: rtl8723bs: hal: fix line lengths in rtl8723b_hal_init.c
Date: Fri,  6 Feb 2026 08:54:30 +0100
Message-ID: <20260206075439.103287-18-luka.gejak@linux.dev>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260206075439.103287-1-luka.gejak@linux.dev>
References: <20260206075439.103287-1-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luka Gejak <luka.gejak@linux.dev>

Break long lines exceeding 100 characters to comply with kernel coding
style.

Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
---
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 64 ++++++++++++-------
 1 file changed, 41 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 61b95f5703c0..e657e1872a0b 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -58,7 +58,10 @@ static int _BlockWrite(struct adapter *padapter, void *buffer, u32 buffSize)
 	remainSize_p1 = buffSize % blockSize_p1;
 
 	for (i = 0; i < blockCount_p1; i++) {
-		ret = rtw_write32(padapter, (FW_8723B_START_ADDRESS + i * blockSize_p1), *((u32 *)(bufferPtr + i * blockSize_p1)));
+		u32 addr = FW_8723B_START_ADDRESS + i * blockSize_p1;
+		u32 data = *((u32 *)(bufferPtr + i * blockSize_p1));
+
+		ret = rtw_write32(padapter, addr, data);
 		if (ret == _FAIL) {
 			netdev_dbg(padapter->pnetdev, "write failed at %s %d, block:%d\n",
 				   __func__, __LINE__, i);
@@ -261,27 +264,34 @@ void rtl8723b_FirmwareSelfReset(struct adapter *padapter)
 	struct hal_com_data *pHalData = GET_HAL_DATA(padapter);
 	u8 val;
 	u8 Delay = 100;
+	bool old_fw;
 
-	if (
-		!(IS_FW_81xxC(padapter) && ((pHalData->FirmwareVersion < 0x21) || (pHalData->FirmwareVersion == 0x21 && pHalData->FirmwareSubVersion < 0x01)))
-	) { /*  after 88C Fw v33.1 */
-		/* 0x1cf = 0x20. Inform 8051 to reset. 2009.12.25. tynli_test */
-		rtw_write8(padapter, REG_HMETFR+3, 0x20);
+	/* Check for old firmware version */
+	old_fw = IS_FW_81xxC(padapter) &&
+		 ((pHalData->FirmwareVersion < 0x21) ||
+		  (pHalData->FirmwareVersion == 0x21 &&
+		   pHalData->FirmwareSubVersion < 0x01));
+
+	if (old_fw)
+		return;
 
+	/* after 88C Fw v33.1 */
+	/* 0x1cf = 0x20. Inform 8051 to reset. 2009.12.25. tynli_test */
+	rtw_write8(padapter, REG_HMETFR + 3, 0x20);
+
+	val = rtw_read8(padapter, REG_SYS_FUNC_EN + 1);
+	while (val & BIT2) {
+		Delay--;
+		if (Delay == 0)
+			break;
+		udelay(50);
 		val = rtw_read8(padapter, REG_SYS_FUNC_EN + 1);
-		while (val & BIT2) {
-			Delay--;
-			if (Delay == 0)
-				break;
-			udelay(50);
-			val = rtw_read8(padapter, REG_SYS_FUNC_EN + 1);
-		}
+	}
 
-		if (Delay == 0) {
-			/* force firmware reset */
-			val = rtw_read8(padapter, REG_SYS_FUNC_EN + 1);
-			rtw_write8(padapter, REG_SYS_FUNC_EN + 1, val & (~BIT2));
-		}
+	if (Delay == 0) {
+		/* force firmware reset */
+		val = rtw_read8(padapter, REG_SYS_FUNC_EN + 1);
+		rtw_write8(padapter, REG_SYS_FUNC_EN + 1, val & (~BIT2));
 	}
 }
 
@@ -1000,9 +1010,13 @@ void rtl8723b_SetBeaconRelatedRegisters(struct adapter *padapter)
 	rtw_write32(padapter, REG_TCR, value32);
 
 	/*  NOTE: Fix test chip's bug (about contention windows's randomness) */
-	if (check_fwstate(&padapter->mlmepriv, WIFI_ADHOC_STATE|WIFI_ADHOC_MASTER_STATE|WIFI_AP_STATE) == true) {
-		rtw_write8(padapter, REG_RXTSF_OFFSET_CCK, 0x50);
-		rtw_write8(padapter, REG_RXTSF_OFFSET_OFDM, 0x50);
+	{
+		u16 state_mask = WIFI_ADHOC_STATE | WIFI_ADHOC_MASTER_STATE | WIFI_AP_STATE;
+
+		if (check_fwstate(&padapter->mlmepriv, state_mask)) {
+			rtw_write8(padapter, REG_RXTSF_OFFSET_CCK, 0x50);
+			rtw_write8(padapter, REG_RXTSF_OFFSET_OFDM, 0x50);
+		}
 	}
 
 	_BeaconFunctionEnable(padapter, true, true);
@@ -1655,7 +1669,9 @@ static u8 fill_txdesc_sectype(struct pkt_attrib *pattrib)
 	return sectype;
 }
 
-static void fill_txdesc_vcs_8723b(struct adapter *padapter, struct pkt_attrib *pattrib, struct txdesc_8723b *ptxdesc)
+static void fill_txdesc_vcs_8723b(struct adapter *padapter,
+				  struct pkt_attrib *pattrib,
+				  struct txdesc_8723b *ptxdesc)
 {
 	if (pattrib->vcs_mode) {
 		switch (pattrib->vcs_mode) {
@@ -1686,7 +1702,9 @@ static void fill_txdesc_vcs_8723b(struct adapter *padapter, struct pkt_attrib *p
 	}
 }
 
-static void fill_txdesc_phy_8723b(struct adapter *padapter, struct pkt_attrib *pattrib, struct txdesc_8723b *ptxdesc)
+static void fill_txdesc_phy_8723b(struct adapter *padapter,
+				  struct pkt_attrib *pattrib,
+				  struct txdesc_8723b *ptxdesc)
 {
 	if (pattrib->ht_en) {
 		ptxdesc->data_bw = BWMapping_8723B(padapter, pattrib);
-- 
2.52.0

