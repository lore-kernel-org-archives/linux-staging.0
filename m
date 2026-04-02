Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D4637880B
	for <linux-staging@lists.linux.dev>; Thu,  2 Apr 2026 05:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775108563; cv=none; b=CBIWD/LTaI+OH3rIm0NvZWhj+kkuxLf+wp57pk4zJiucm3eEAildSYVDbkT9guo6rDWKAtwXY++rUQAzQnFDcnOYqpN73wQECVTbPP/u2iFkMPGMlTiWf2c/9zeWU/HLEvZow4+1TPpRSKL0LH8ZkDLGD1KnygQcLpl8hKS9d+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775108563; c=relaxed/simple;
	bh=90sso5S1gXTvm083WMHjD+jUiC9M4V8inI85GweuAK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AYzXkYP/ImwIjEe2FcUPS1ZhhUziJz5i7Un7fH2NhrL3/q9Gy8JtiEguEuFMbbUCavnv84kxUDKHz7h/UPz52I6K/BSxoXabLj3b+Zn+q0tYal4T7ClqMBUvMAQZ1IPGHtrOwOY8E+ipn0m0M87GrVrOCdfK/2VWC5fAfwV3AxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eI/599hF; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eI/599hF"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a2c3dfb4a1so731897e87.2
        for <linux-staging@lists.linux.dev>; Wed, 01 Apr 2026 22:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775108560; x=1775713360; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mRP3UsFMZH1CRQLPmuMCWvCQtgIgueLd2w3AajB4haI=;
        b=eI/599hFD+k89jVdpLsXDhdWhCk0TSIvk9+UxfM0SNgEx/L0+JlUc2RhoEHZqE8WBH
         bxdZgzqwhqGrKVOJ1Tcq0fkAPxmPqI9JPTrEDnoMSk3u7zPZ0rECSEJYF7BGCgV7pySy
         0ZJepV3oguGF84s1chbzYzxMMMyUQFMR6wPcAUMbVaLZ/0bkPu5Ka1XkeZgWnZHPQ+a3
         9YmWDfpX0+0/yqMsbc8a1Ct0ABaPeBlpYp5yKxzq4G/kGb+AnQXkMxHZe8dJ/9gxOwcS
         I08cGu9UqxTNVbfptH4zOQNzPPxY4qVUwPzE7bPzQP3EmTcPjMr7/wQJgzhW4llKZn1X
         q/qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775108560; x=1775713360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mRP3UsFMZH1CRQLPmuMCWvCQtgIgueLd2w3AajB4haI=;
        b=C19gymS1jRnioykGNM4FisZUDBVdJ0fa43GVzVJSemx/ljVd1o9pkbbUbJiQM8kQ1p
         EYYtrNLLo0dy3bdlu/srPly4RYLlDcegoQKKRGrxCu+zaxLsjZ76o6y9MAswotL4a+ms
         s52sxz6CZ/pmIysUkg/7huv8r7uDyXbX/JjaDsO14T7FOMYAqYX4+bcCZKH7Hej19OdM
         4iaX5C0GQrHrOeOS6ljoEIAcIRK9xWYgUL//1qOhU8oVv7LzEENamw65SdPZsW/e3TrS
         LIWmg4VFnQC4+9VgltoyVIE3HhA5BU45qkHYcFDOqJ8fKqUGUGsDzFUGXzcuiL5lKhK8
         7d5A==
X-Gm-Message-State: AOJu0Yz7aXpVDGx6ec7JsY1B6OpiP8cV17oRkUfz/bKoum0QY9fJc4n7
	5nlgVyFhqbVwHCE9+7l9HgOq0X05DusS9kPlYF23IFGHKRQP5c16Emtm
X-Gm-Gg: ATEYQzwbs+jeM6mS8p0HHeTNkLLRr9Id6H3FeQ2ee30+YpiGZOiPYb0JA7bzfUVWAJB
	epUH360kEMQXNPncnQt/xZyU71FrQHHKTtX+CPRW9Kx+JWbKBub6UJg1bBhoW1pJ0GWdMwLNNcq
	k5MqAqmos8vHywnQbYtDgq3Yrojy+zVli6CwZRcQEMChe+3Z78c3hZSIhAs1qwfgZnH2Tv9IO/3
	7Yw4WpazS8JYoh0ZPKH8mvlifl2/yXeH1JLXQR5TSPqPU3XAdZNNleTTREqr7q7M9fnpLCndG8v
	1oshNEp1td9csN2WW5lETioGoqXu9ZohRFqb074i6j76PaBmLLLyD1lSCfHP6+v+hlHAAfU6QEu
	Lj6+7kTMTSNikwaGspC4iSjuHXalr0Oa5UKG8nSZH5qGaaX3PXlChPhTvoDURm2/wuuDwbRVbqA
	o6ovpp4rKj9+Vg8TDFQr9S7BBbDMmI
X-Received: by 2002:a05:6512:1113:b0:5a2:b40b:3f81 with SMTP id 2adb3069b0e04-5a2c767646cmr733621e87.27.1775108559703;
        Wed, 01 Apr 2026 22:42:39 -0700 (PDT)
Received: from localhost ([2a02:aa1:115f:85c8:99af:b9fd:7f92:d8b4])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6c9cb95sm436906e87.23.2026.04.01.22.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 22:42:39 -0700 (PDT)
From: Linus Probert <linus.probert@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Probert <linus.probert@gmail.com>
Subject: [PATCH v5 4/7] staging: rtl8723bs: EFUSE_ShadowMapUpdate -> rtw_efuse_shadow_map_update
Date: Thu,  2 Apr 2026 07:42:12 +0200
Message-ID: <20260402054215.271981-5-linus.probert@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260402054215.271981-1-linus.probert@gmail.com>
References: <20260402054215.271981-1-linus.probert@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Renames EFUSE_ShadowMapUpdate to rtw_efuse_shadow_map_update in order to
conform to kernel code style.

Discovered using checkpatch.pl tool.

Signed-off-by: Linus Probert <linus.probert@gmail.com>
---
v5: Reworded subject

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

