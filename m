Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5640241C2FA
	for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 15:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774972421; cv=none; b=qTFTSGdQq9HyxPoFms2+O30NeluT2f/OA8/ElOw2vikT10kYkCnqxos1NeckEp8sVXcyVCRXjzQ+Nrj0xlQ0Zy/WANOt0sCEC16npQkXz/XslSfB9Az/Lbc0gFoOGOE/JolPll/sA2FZcru24w6ZGwIGsHjGqc7yKDvRJeAYcos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774972421; c=relaxed/simple;
	bh=KqOX0QTjyrQthPnGGNfj1yyeSQY3S3suAR1f0FINYTo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JUSmoOb6wvRSUqp//3MpYkWmpW8g0o6nL7pR9VSBwwSHjR0Pw/mK/OL5MQIFFLhpBmLOXVjndUWqQdbogeuea9gv+mnLzlcTv4ua7B5llgy7Uh02KMgtsPF7QubP9cawz+DPn5huPa292+4GJyjIws9ESlPXbvldysXc6fKBJQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IgP6iLm8; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IgP6iLm8"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59e5aa4ca41so4066646e87.2
        for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 08:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774972418; x=1775577218; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UkTWrybRgAV7ipgx2kMqPDzJNaCK0w7dTQ7YGgYCQMU=;
        b=IgP6iLm8UKINQ1vFIyZJIXYI7xQqdMg42J7WXFlJmxlVGdaxEB95Z7P83HOD+99/7/
         MSe/hO7xaO2fvT1aS0wrhYSbQlrOVkrgS+TjIbctuWuplY5vq2O+kgkuTvTBiASXp8il
         t/uByn3J5NDuOGmM8Fd7Au1D8sHi3yGGk4F0RutyHZAPWC/dRYQyGwSwUQmtvAwexEVB
         J4hkVYocHOk9YrqS5kBwqb2QZvs5udPv+r0nJxnEUcSWKubY7ZdzAdDo58eHIxRkRVxx
         Zz7vfXshGNiI+wYe4twtVngyemllSpJn6wFlIu22mZrKNByZKOS7BpVQWpNcu6vCXYm3
         lR/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774972418; x=1775577218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UkTWrybRgAV7ipgx2kMqPDzJNaCK0w7dTQ7YGgYCQMU=;
        b=lwl8Wu+qNZMYF2XL+F0Y0CRA9D3Fy948VjUeOYWYAGgqQjhhApoqN2JkfZj0I96joa
         2oSlBgnnuOqoEjLVRr7+jsvtgN2KUjpRvGhgCTVRPwD+3af1u7zD7HIVkWFdZXnoOFDw
         8rQUpelCUzo48a6msRNW53r8nxXZ5RlEglVtL0+Msanl8rVNzwX5F3FwwOTHh83jgDDB
         MpbNfbNmsUdrpa9R8r/7QBawqbNciVZAzk31KyrZ0PPzkW7PcSIWhgLEUVkMz/cvkxJE
         UXQwOvph2bWtCctaXcKtpi708eaPCkhiyLqBYjz5FpBYDimxZvHtipZrSoRgA8jd5XJB
         FcoQ==
X-Gm-Message-State: AOJu0YxP2a9ARhkh/j7lsjlkAOO/NCWdlR89Gk72YNGgyozyG9QDyxJ3
	lEDTHRuZB2/bzgXBeOEqNTnGV2njWs3J+pYafT1IDK31RBWj7GfzkhhU
X-Gm-Gg: ATEYQzx/yvQk+pDek4f+Qkx9eDMAwRM7r4ybMthXr87FadeNkKuVIu3kWtwQmrvndRU
	+raBO34DRcSfdqnBj+D7CkmZqNszQxBgOECgMjuqWWUdna1wyQ+SGJPlrjHEiWI0PFUV70Z5T48
	u98gX+LXSCCysI/GNYy55aSS7/diW4vHD9XX4xRsL1R6tCFE1McFSsY72ItKK0mHSoQ4OqkeMcu
	U+nL8CebFYhtpdcAMsm2b7VQAfRXwX3cASTQhTyD7HnxLKH75eOOTGeDaBxOSLA3SHC0PFBH6jy
	Hn51DZQc9VuShcKL3plyUgzKtUwa66bngRGhB0OzvEEidajUlRlsjdAfwF8ppKcUin8HajLdCWr
	DX5JHrwqLGGR3LG2l/P5DkKRTIr2pY+3Ijx6eU16zqQG6+IwRt3vk/NLgQ7PucYKqnUn2LG8yIt
	LVDwJ8oDNH/5wPJDHqRo0/++DzJ4nJQR9XQPcIUubG8kaBwRh7t8iixIvW+bsOaw==
X-Received: by 2002:a05:6512:3b8d:b0:5a2:a70b:b2ca with SMTP id 2adb3069b0e04-5a2ab920a5emr5178748e87.23.1774972417941;
        Tue, 31 Mar 2026 08:53:37 -0700 (PDT)
Received: from localhost (c188-150-77-196.bredband.tele2.se. [188.150.77.196])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13f4373sm2611983e87.6.2026.03.31.08.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 08:53:37 -0700 (PDT)
From: Linus Probert <linus.probert@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Probert <linus.probert@gmail.com>
Subject: [PATCH v3 3/7] staging: rtl8723bs: rename global function to snake_case
Date: Tue, 31 Mar 2026 17:53:14 +0200
Message-ID: <20260331155318.185117-4-linus.probert@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331155318.185117-1-linus.probert@gmail.com>
References: <20260331155318.185117-1-linus.probert@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Renames EFUSE_Read1Byte to rtw_efuse_read_1_byte in order to conform to
kernel code styl.

Discovered using checkpatch.pl tool.

Signed-off-by: Linus Probert <linus.probert@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_efuse.c        | 6 +++---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 3 ++-
 drivers/staging/rtl8723bs/include/rtw_efuse.h     | 2 +-
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index a7b120cc70a3..d6212b3b0b1d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -26,7 +26,7 @@ rtw_efuse_calculate_word_counts(u8 word_en)
 }
 
 /*-----------------------------------------------------------------------------
- * Function:	EFUSE_Read1Byte
+ * Function:	rtw_efuse_read_1_byte
  *
  * Overview:	Copy from WMAC fot EFUSE read 1 byte.
  *
@@ -42,7 +42,7 @@ rtw_efuse_calculate_word_counts(u8 word_en)
  *
  */
 u8
-EFUSE_Read1Byte(
+rtw_efuse_read_1_byte(
 struct adapter *Adapter,
 u16		Address)
 {
@@ -79,7 +79,7 @@ u16		Address)
 	} else
 		return 0xFF;
 
-} /* EFUSE_Read1Byte */
+} /* rtw_efuse_read_1_byte */
 
 /*  11/16/2008 MH Read one byte from real Efuse. */
 u8
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 355167883f08..941c2ebef9e2 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1559,7 +1559,8 @@ void Hal_ReadRFGainOffset(
 
 	if (!AutoloadFail) {
 		Adapter->eeprompriv.EEPROMRFGainOffset = PROMContent[EEPROM_RF_GAIN_OFFSET];
-		Adapter->eeprompriv.EEPROMRFGainVal = EFUSE_Read1Byte(Adapter, EEPROM_RF_GAIN_VAL);
+		Adapter->eeprompriv.EEPROMRFGainVal = rtw_efuse_read_1_byte(Adapter,
+									    EEPROM_RF_GAIN_VAL);
 	} else {
 		Adapter->eeprompriv.EEPROMRFGainOffset = 0;
 		Adapter->eeprompriv.EEPROMRFGainVal = 0xFF;
diff --git a/drivers/staging/rtl8723bs/include/rtw_efuse.h b/drivers/staging/rtl8723bs/include/rtw_efuse.h
index b8cd9e694f56..7b78fd5e583b 100644
--- a/drivers/staging/rtl8723bs/include/rtw_efuse.h
+++ b/drivers/staging/rtl8723bs/include/rtw_efuse.h
@@ -71,7 +71,7 @@ struct efuse_hal {
 u8 rtw_efuse_calculate_word_counts(u8 word_en);
 u8 rtw_efuse_one_byte_read(struct adapter *padapter, u16 addr, u8 *data);
 
-u8 EFUSE_Read1Byte(struct adapter *padapter, u16 Address);
+u8 rtw_efuse_read_1_byte(struct adapter *padapter, u16 Address);
 void EFUSE_ShadowMapUpdate(struct adapter *padapter, u8 efuseType);
 void EFUSE_ShadowRead(struct adapter *padapter, u8 Type, u16 Offset, u32 *Value);
 void Rtw_Hal_ReadMACAddrFromFile(struct adapter *padapter);
-- 
2.53.0

