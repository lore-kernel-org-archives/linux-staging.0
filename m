Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B28241C314
	for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 15:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774972422; cv=none; b=M8DlIx2DAkTzVH3VAffAUw1wOUvIYWf8/l+S5zx1CtwmtWYqpnVNDN3YzT7C2yhgtHB/p9zmjneLQdHTYqS/gn21iBRdC7z1TqbvYB8dMfxIa63HxFjwvhgAoSvuMwR61+ViMCBT5qB6EM+Llj3efnab+wuCepL790gNwuL18P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774972422; c=relaxed/simple;
	bh=5vIT9yO+eYeZ+TULciDzFfYomNAWRbzFGfAtf7tZWyU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fVS6bBkVeMiPw20pRrNlw1xmZAlIc8+UsSNnstN7deGnw0ECmN5Fe0/FErd1ylW/vx/wRN5jM/Qi3YJ7xyXSqfeHncZ8mjh7B2deCsRzsE//paOxN70OhVdRDrQ6rSo/LdNfiwBFj3vDXVKciJDP3+vGxa8F8uTZrfG3RXtSKZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RnGDxzw6; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RnGDxzw6"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a2bb0fe3bbso1076082e87.3
        for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 08:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774972419; x=1775577219; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6wB8kXrslJfwr7cmQ+2VH4UXBhmevW447e3YUnn0hJ4=;
        b=RnGDxzw6nWzz/jU640mbBpmOz6AqD+D3ylwwvRgj5E1XyqjbkprLalWh7/vw84/F2g
         GnbPs5klwGnXp0t/OKS9kJkM4+lmfu8Y+42g1n9ROSzaIAZmLJOCP4B9YFIOeHUUGpMS
         bKNEx3pMbvsuOrKw4Gu7UnX9iRWg4gueTT4anruzpZGsKKNOIdGphGaKiMmbKIKpzMZ6
         U76oxqrSAFNgQ6gt5KzeenrTUXWepG+0ib9B65ipGnyiB5ca1Jnz42n7RCBle3zqV3e/
         IvpLukfhM8m/7ugiYu7BjpBgokPF60/bO+DjAOXHABZpIrVGh1GHmktsNLOMHeFcKvUt
         VUhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774972419; x=1775577219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6wB8kXrslJfwr7cmQ+2VH4UXBhmevW447e3YUnn0hJ4=;
        b=qETygKhvz+EExsL2gnRwHS962a7j8jumIyALA7S02ZOvn+x6rtYqVRVNw6nUjAAAbF
         25KNMUDOl0ym76/YuNQa4MJeMmibLmK6GKyZlZj8GItLLMkGtxfOqQdhFqI1nHQ/++c0
         ATobG+4C1Y6TuvauG6fZltMHH9a/EcFc2XN+afNs40+mORrUzqN/wTIVdOb0WMBov5RA
         MK1bbvQ/tSqvxaD5EQj/Citrt5KpdgCmDY3uAM8BHbkPmFpS2SlPYoA6KM0Kh/vqoVU8
         ByJKYZAlJKUBq4Kb0vGIZ6zjWVS3yPk+ynHQFENGUuxfp+UjsJfpm6RkRFP9owDPPdbJ
         pErg==
X-Gm-Message-State: AOJu0YxMqqJ2sUOcGkyEgtAYKz1M1gFyfbntFL9SEIhU06+q3oQfXFAY
	7yBLwwkWfdo/fRvyu0+7lu43qEJ+S1JB2vRQd8IiqSI8GRBZdafKc8Ma
X-Gm-Gg: ATEYQzx6slNMWD56yqf5+6XPT82Ws8chVCRUHKFqG4Cn+4qvR25UwkQUS42tQAk29ky
	ZkijIKxWiskj4+1LIx7/QcoerU3uBFFvuyl7OAvTY+DpvMaoES2rMYm8ikE8x2cGt+pSwmqsCMf
	Z/ZZzrTEqU68086kQ1P+SkS+uAM/L8GKwI/MPsD2o1Tejdj3o9xHsjLlALCm179cBf1yshr0YhY
	HP4R9H1Hroz/LKYmwrfUWe06z2FYa16Swrm0nSQc6io8ToLlD73h+5v1vL4+kzAOmbq6rU9qJSd
	7ZG1ZPXmnsWOwjWaGisN05uHbyRc8tW1P4EmUilHnXKeQ5Hz51ubLYVrIir2hbmKO5k9fB6JkmO
	QoToWUfB1X5QHqUUxGYbKEazhjiSLpQH+rPVKmvhUpxbyRQaN9p52tV9YJ0hKfMIJc+YHeiTpoS
	vXtpDNkkrqAgmpNR0oOp66UMMvWVCjIXj2GphAxij/VdXM3aqL7lhTcvADkDeLEw==
X-Received: by 2002:a05:6512:3b1f:b0:5a1:2c41:d28d with SMTP id 2adb3069b0e04-5a2c1ef9148mr7006e87.19.1774972419209;
        Tue, 31 Mar 2026 08:53:39 -0700 (PDT)
Received: from localhost (c188-150-77-196.bredband.tele2.se. [188.150.77.196])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13f4329sm2507712e87.3.2026.03.31.08.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 08:53:38 -0700 (PDT)
From: Linus Probert <linus.probert@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Probert <linus.probert@gmail.com>
Subject: [PATCH v3 4/7] staging: rtl8723bs: rename global function to snake_case
Date: Tue, 31 Mar 2026 17:53:15 +0200
Message-ID: <20260331155318.185117-5-linus.probert@gmail.com>
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

Renames EFUSE_ShadowMapUpdate to rtw_shadow_map_update in order to
conform to kernel code style.

Discovered using checkpatch.pl tool.

Signed-off-by: Linus Probert <linus.probert@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_efuse.c        | 6 +++---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 4 ++--
 drivers/staging/rtl8723bs/include/rtw_efuse.h     | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index d6212b3b0b1d..f873250e0f7e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -201,7 +201,7 @@ static void efuse_ShadowRead4Byte(struct adapter *padapter, u16 Offset, u32 *Val
 }	/*  efuse_ShadowRead4Byte */
 
 /*-----------------------------------------------------------------------------
- * Function:	EFUSE_ShadowMapUpdate
+ * Function:	rtw_efuse_shadow_map_update
  *
  * Overview:	Transfer current EFUSE content to shadow init and modify map.
  *
@@ -216,7 +216,7 @@ static void efuse_ShadowRead4Byte(struct adapter *padapter, u16 Offset, u32 *Val
  * 11/13/2008	MHC		Create Version 0.
  *
  */
-void EFUSE_ShadowMapUpdate(struct adapter *padapter, u8 efuseType)
+void rtw_efuse_shadow_map_update(struct adapter *padapter, u8 efuseType)
 {
 	struct eeprom_priv *pEEPROM = GET_EEPROM_EFUSE_PRIV(padapter);
 	u16 mapLen = 0;
@@ -230,7 +230,7 @@ void EFUSE_ShadowMapUpdate(struct adapter *padapter, u8 efuseType)
 
 	/* PlatformMoveMemory((void *)&pHalData->EfuseMap[EFUSE_MODIFY_MAP][0], */
 	/* void *)&pHalData->EfuseMap[EFUSE_INIT_MAP][0], mapLen); */
-} /*  EFUSE_ShadowMapUpdate */
+} /*  rtw_efuse_shadow_map_update */
 
 
 /*-----------------------------------------------------------------------------
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 941c2ebef9e2..3dff8aa2badb 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1188,12 +1188,12 @@ void Hal_InitPGData(struct adapter *padapter, u8 *PROMContent)
 	if (!pEEPROM->bautoload_fail_flag) { /*  autoload OK. */
 		if (!pEEPROM->EepromOrEfuse) {
 			/*  Read EFUSE real map to shadow. */
-			EFUSE_ShadowMapUpdate(padapter, EFUSE_WIFI);
+			rtw_efuse_shadow_map_update(padapter, EFUSE_WIFI);
 			memcpy(PROMContent, pEEPROM->efuse_eeprom_data, HWSET_MAX_SIZE_8723B);
 		}
 	} else {/* autoload fail */
 		if (!pEEPROM->EepromOrEfuse)
-			EFUSE_ShadowMapUpdate(padapter, EFUSE_WIFI);
+			rtw_efuse_shadow_map_update(padapter, EFUSE_WIFI);
 		memcpy(PROMContent, pEEPROM->efuse_eeprom_data, HWSET_MAX_SIZE_8723B);
 	}
 }
diff --git a/drivers/staging/rtl8723bs/include/rtw_efuse.h b/drivers/staging/rtl8723bs/include/rtw_efuse.h
index 7b78fd5e583b..e73f9396e9ca 100644
--- a/drivers/staging/rtl8723bs/include/rtw_efuse.h
+++ b/drivers/staging/rtl8723bs/include/rtw_efuse.h
@@ -72,7 +72,7 @@ u8 rtw_efuse_calculate_word_counts(u8 word_en);
 u8 rtw_efuse_one_byte_read(struct adapter *padapter, u16 addr, u8 *data);
 
 u8 rtw_efuse_read_1_byte(struct adapter *padapter, u16 Address);
-void EFUSE_ShadowMapUpdate(struct adapter *padapter, u8 efuseType);
+void rtw_efuse_shadow_map_update(struct adapter *padapter, u8 efuseType);
 void EFUSE_ShadowRead(struct adapter *padapter, u8 Type, u16 Offset, u32 *Value);
 void Rtw_Hal_ReadMACAddrFromFile(struct adapter *padapter);
 u32 Rtw_Hal_readPGDataFromConfigFile(struct adapter *padapter);
-- 
2.53.0

