Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C909F47DD6D
	for <linux-staging@lists.linux.dev>; Wed,  1 Apr 2026 19:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775070507; cv=none; b=LJRGmIZVm0F0PM8l52PPOWliUnuk4pdvERZAStJaxDxu1TbCqOfZWgFMXn+ua9oEcRxuy9uXW536SSFY47nLhZaFfNVT1dZMH9q0bWuD2NGWvJ8xObZB2eafAhuWtaEjs5ZPekP2BnpjxmmUwt9qcka4nBLFVXv9J3FkvFsK8CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775070507; c=relaxed/simple;
	bh=HZh5TYBsEQbA48+Jt7Z/g+TDNKxwCAhkV7JNxgNsoxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uXXL0075kwvZFKOoL3BnKoO87RDDFGy58dMQs9Q74OLbNhwpuOGzpFf7my5WEGgFmOYKnOq4KzUohOQ97HcWp9EEu42vhTTCNfMBRpVdMFo0RbQJ1BtPqtTq2nhUCKoTJhAscMVc7NP3L+37xOtYdwzYDIB6kBi4/q9V5lXOTJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J1tn7rCb; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J1tn7rCb"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a2a5236811so144021e87.1
        for <linux-staging@lists.linux.dev>; Wed, 01 Apr 2026 12:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775070504; x=1775675304; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GtetszKWoglvl/ZAIKGcp+s8CjbxCD0PUcxMrM+Uavg=;
        b=J1tn7rCbsNspj5bi8v9muRbMWAyr6oOXLQwjls3XLcTs3FwPPFYxHROm66xjojaRmu
         DdfST/qNK+7Ply+UuJegLuomTF53y8upVZNtUgHjtc3+71sYepc9MGaK/QC4Srg/h6D9
         Z9LKxs5d4zjqUWli6ocOXG5fxuLVubbHV5KspEWSzBI2fHLNFrHnM8uG9bFMaeOxfgGQ
         ZcdovfOz48UF/5sJ8ajjAuDPoOc8KrM3QLdASOxkbgHLmtI8bZ0MxKGLo3uCa3cxfSQA
         iRV8Y2xb7Qk3dVXCWC6UMUQd/4mWq+/6ZUFiveA6QlOgvwurpnxX/WMgwp29nafXV2zB
         U4Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775070504; x=1775675304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GtetszKWoglvl/ZAIKGcp+s8CjbxCD0PUcxMrM+Uavg=;
        b=K8lRckJmm9IB7gryfDLCgols8ZM5fIbQCQql0t3S/vQ/n2vrFEtiksSLiN7t5kvHC8
         qw1AMnLzPeMDYoqmXEGw/G0u62/u6YgY6ZLS8fuVUYX3EwiFiHQCWu+JSWImljtzW0jb
         zd+CmCfkaV9rc1CxkXnHmCGmKHiIxXxOA5BNiu5c+wqlMm8kevSQMJkq7UVtrTBqasbn
         +Zjy4scfv5ixBbLDbfn9NJm/eqZl4kGxQA0sqyS29DIwTnYt3ZWsxrwaqM7CiVH2MRS4
         oAlZ4omns0tE8R+yAuHJlUPOAudKoX7/JJ1enIa3WSh4kPzqxZp/S2FvP+tt4iPBbRg6
         Ctdg==
X-Gm-Message-State: AOJu0Yz4VE/a8RPOc4IkQmsJ6zQzVK+zElQLcynLKycTuCPLxVqiwWt6
	L8aQqxsRvoZJLkguVwCzoLyxYFVAi94fe0mVm9UXuxbResgkIQypFJsE
X-Gm-Gg: ATEYQzwtcD2cFEXitvJ1UNhGJ9ZQJwSg/3li8M/5tQ7S+RRM8PUmFnfnR7HDTXThXDf
	gm1Sr5V8hnkUb3K6UOPKJpGGpbgxfIXqROsY5F+tTBhHQ07O1F7AWIvRtybusYvPmU0qEhdGvdN
	Uao6F0a6Te7yDNe5qSn2yKV2pgZGEej8cv5gZpbCBkdLSlV4YRvW+FQgztlVg1HkTbnTOZkRkyl
	X7cyfpVIKzY5WYdypPNQSSWNzgrgUmynKEpcwTNCo4J6mNqiY3OoGeLVInlYcN2Ddtvj44arPB0
	q5isLLJKhtm/sV3F9qVyvJRZAwGCYt3rQpHnjJPnde18eOg6P+0Vg7WBxTVEueiJJbslmIMzWQx
	0mo7NwqssFolZXjmmVn7lVUyhtbrvwp8arvhDCIXPSc0m76pZFvOY3nyGl1MiMPoWR6AVf0DhXd
	B17XRZHZ2aYCLvelxZEAR9IXRBz0Qx
X-Received: by 2002:a05:6512:318b:b0:5a2:b59a:5e99 with SMTP id 2adb3069b0e04-5a2c1f23c58mr1761493e87.22.1775070503830;
        Wed, 01 Apr 2026 12:08:23 -0700 (PDT)
Received: from localhost ([2a02:aa1:115f:85c8:99af:b9fd:7f92:d8b4])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6ccc9fasm137022e87.63.2026.04.01.12.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 12:08:23 -0700 (PDT)
From: Linus Probert <linus.probert@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Probert <linus.probert@gmail.com>
Subject: [PATCH v4 4/7] staging: rtl8723bs: EFUSE_ShadowMapUpdate() -> rtw_shadow_map_update()
Date: Wed,  1 Apr 2026 21:08:11 +0200
Message-ID: <20260401190814.216333-5-linus.probert@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260401190814.216333-1-linus.probert@gmail.com>
References: <20260401190814.216333-1-linus.probert@gmail.com>
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
v4: More descriptive subject

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

