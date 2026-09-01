Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D0D477E31
	for <linux-staging@lists.linux.dev>; Tue,  1 Sep 2026 10:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788259174; cv=none; b=bgBGEWUD6LAaQCa/Bnj/1HkKUjsnnJZpFNlBeKqk6FvMTeUNu1J9RJ0Lpt9OPrHxSewPqBZAcloQmj+BDw9WACtgReify5oX0CC9WWR5DuVBVDPCfdKtYCbSgxPmnHACfdiS1MTUo7vkXs0o9Gl5XUHAd9P6h+VSROEOI2WMIbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788259174; c=relaxed/simple;
	bh=Wk/xdeu9s2D6TjNypVsWQOHmXWfUJMBX/XxmxZ7jtdM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=flsoW6TVZSGGb9vGclBBBkwiWFZoWvFDFR9tmEfpV5eN+zaBpnubGUctj4GwI+PIj5+R3HqGIaotYaDYjnugNtnwootrcJEoItObP86yhjU6lOvNKa5DURiLDnoO/PPCVnwu/s7dzLOIbCIaPXxwkqtmh0zEH+4lbsWGZoTUXq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rCVed/9v; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rCVed/9v"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c25b3c641fbso142670766b.1
        for <linux-staging@lists.linux.dev>; Tue, 01 Sep 2026 03:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788259170; x=1788863970; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6jb7pMwxdDzbuNzL/3IW6rWm99OzJOPz1C4e0fB1UjE=;
        b=rCVed/9vaGd36Vy6TvLVq9DJxk0iNAVs9IywioKuxwHP8FjCLoxQAatfTXaJ+M9NZK
         TAWWFsICr6sbF/I62h+Kn+ZxVe12qsbpwpbl4UGu22bgBT6An+t7J8Lmz4qUeHkAyJPM
         W+rH0+F9vmTpRYvBaYZSC0QTbLiA8OocRXudSj2MTbMm8pgoqQWg/QEEW0ghnnXjpq3P
         TyXkHke6iXUBPdt+N3LYq4U2bSFexQN50lrFx/EDA3DCWa2IDLNtjCmbPDcdvg3gJtem
         kcsT6cqO30zJr+NldZAtj/KceDjIBlG0NplZSAinEQXX4upk1K5eXjLE+AMVA8gzrkef
         2WvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788259170; x=1788863970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6jb7pMwxdDzbuNzL/3IW6rWm99OzJOPz1C4e0fB1UjE=;
        b=lY3kZTkySrfwBndMhRQaXlS1f8C2o3OWhUZ81PAFeiRCKQg5UwoS3hGi/t6Dcuehlp
         gapb+R1R0Z3MtbGRHh5ObbTfRuJzqMHE1diSabTwyuVw0S2VFPeLMNKSIxQARwbzeTzS
         o/04dZED4n6nOLYvW67CwM0vRqUIcxFqoC+tbs4W0Uv97/Cj6GvHN9zSwC+dXPKKcHJK
         u3haX2XxnsxrYFJ4z50J3yjocbiQXCVWhAtEkwrfmnhHal+1Ddu0zZJnwV99JTlq/vu5
         ss0zT0utlz4lhv3AK95ZSgjSP4qXQjQaFcrD9KvdMP7snd1giYuHBGeJGf+g2PHPCnAr
         7++A==
X-Gm-Message-State: AFuF++kpBc+Vn2tlNHShzxa6sasnrGOXJAXnzebDS7pR8p5hYXEjGNaq
	dVwROeg5zovemOFkqYqIGC7ta3aMTmdj7H8FovSbBBnE/puxdLM/hBgM
X-Gm-Gg: AR+sD11yeQq8E08mYWebbDotxyeW0Rr/QEqym6b+0Slk1akuZHgZcS+v9ud+BpWDWTt
	VopmYzEOkRbYJgOOJHXvR53Y4vw/OzcCFv6matRkAdxsrkq/hqLpNwVA6M/6Lr0ZgBGLxI88tKx
	aKMLZr6wbghCqSbaIhkv39x5K6F5ZSfxRyIyr8QXRftSwyCiTZzlEBuSbEPvL3S0iHSurchTeTq
	Ues7/tw2liHM0RNG6a6BddtbGRqwscvHE9FI54yP2DfrZ7giRa+BAbErsxAlUTNUHG9qnFCJaBV
	Arf1WqWJcKZ19wp5rYmCP7HalfBiHKOyS1rGAyZoqSku1zzfVZKFW0OKwkY05cMQQxPtjAuxp5d
	2LNHbitLTCfb0cVRwCULn9PNQ56HHqkt1BoDo/Y3gtkkJjgGn1DGwvkXbNfH/4CiCkVZoEAvhmn
	Cu0wMM/WW0LSevWg21TYYUFyAYHI98DJSh92VlnByz0Cdmtcflp2UjEUj1FQxVL/QRo902tTc3z
	tuhhxOzA4sg/tf032aOX9iym8eE2ZQ=
X-Received: by 2002:a17:906:2545:b0:c25:4e5:fe33 with SMTP id a640c23a62f3a-c25b3e13d44mr415955666b.24.1788259169788;
        Tue, 01 Sep 2026 03:39:29 -0700 (PDT)
Received: from burk (46-162-75-122.cust.bredband2.com. [46.162.75.122])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee0b23esm544216266b.2.2026.09.01.03.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 03:39:29 -0700 (PDT)
From: Philip Nielsen <philipnielsen64@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Philip Nielsen <philipnielsen64@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: avoid CamelCase in rtw_efuse
Date: Tue,  1 Sep 2026 12:39:19 +0200
Message-ID: <20260901103919.20245-1-philipnielsen64@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Avoid CamelCase naming for local variables, function parameters,
and static helper functions in rtw_efuse.c as well as associated
prototypes in rtw_efuse.h to adhere to the Linux
kernel coding style and clear checkpatch.pl checks.

Signed-off-by: Philip Nielsen <philipnielsen64@gmail.com>
---
Changes in v2:
  - Rebase on top of latest staging-testing branch.


 drivers/staging/rtl8723bs/core/rtw_efuse.c    | 72 +++++++++----------
 drivers/staging/rtl8723bs/include/rtw_efuse.h |  4 +-
 2 files changed, 38 insertions(+), 38 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index 7e215c9845f6..b2d22307b115 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -41,48 +41,48 @@ rtw_efuse_calculate_word_counts(u8 word_en)
  * 09/23/2008	MHC		Copy from WMAC.
  *
  */
-u8 rtw_efuse_read_1_byte(struct adapter *Adapter, u16 Address)
+u8 rtw_efuse_read_1_byte(struct adapter *adapter, u16 address)
 {
-	u8 Bytetemp = {0x00};
+	u8 byte_temp = {0x00};
 	u8 temp = {0x00};
 	u32 k = 0;
-	u16 contentLen = 0;
+	u16 content_len = 0;
 
-	Hal_GetEfuseDefinition(Adapter, EFUSE_WIFI, TYPE_EFUSE_REAL_CONTENT_LEN, &contentLen);
+	Hal_GetEfuseDefinition(adapter, EFUSE_WIFI, TYPE_EFUSE_REAL_CONTENT_LEN, &content_len);
 
-	if (Address < contentLen) {/* E-fuse 512Byte */
+	if (address < content_len) {/* E-fuse 512Byte */
 		/* Write E-fuse Register address bit0~7 */
-		temp = Address & 0xFF;
-		rtw_write8(Adapter, EFUSE_CTRL + 1, temp);
-		Bytetemp = rtw_read8(Adapter, EFUSE_CTRL + 2);
+		temp = address & 0xFF;
+		rtw_write8(adapter, EFUSE_CTRL + 1, temp);
+		byte_temp = rtw_read8(adapter, EFUSE_CTRL + 2);
 		/* Write E-fuse Register address bit8~9 */
-		temp = ((Address >> 8) & 0x03) | (Bytetemp & 0xFC);
-		rtw_write8(Adapter, EFUSE_CTRL + 2, temp);
+		temp = ((address >> 8) & 0x03) | (byte_temp & 0xFC);
+		rtw_write8(adapter, EFUSE_CTRL + 2, temp);
 
 		/* Write 0x30[31]= 0 */
-		Bytetemp = rtw_read8(Adapter, EFUSE_CTRL + 3);
-		temp = Bytetemp & 0x7F;
-		rtw_write8(Adapter, EFUSE_CTRL + 3, temp);
+		byte_temp = rtw_read8(adapter, EFUSE_CTRL + 3);
+		temp = byte_temp & 0x7F;
+		rtw_write8(adapter, EFUSE_CTRL + 3, temp);
 
 		/* Wait Write-ready (0x30[31]= 1) */
-		Bytetemp = rtw_read8(Adapter, EFUSE_CTRL + 3);
-		while (!(Bytetemp & 0x80)) {
-			Bytetemp = rtw_read8(Adapter, EFUSE_CTRL + 3);
+		byte_temp = rtw_read8(adapter, EFUSE_CTRL + 3);
+		while (!(byte_temp & 0x80)) {
+			byte_temp = rtw_read8(adapter, EFUSE_CTRL + 3);
 			k++;
 			if (k == 1000)
 				break;
 		}
-		return rtw_read8(Adapter, EFUSE_CTRL);
+		return rtw_read8(adapter, EFUSE_CTRL);
 	} else {
 		return 0xFF;
 	}
 } /* rtw_efuse_read_1_byte */
 
-/*  11/16/2008 MH Read one byte from real Efuse. */
+/*  11/16/2008 MH Read one byte from real efuse. */
 u8 rtw_efuse_one_byte_read(struct adapter *padapter, u16 addr, u8 *data)
 {
 	u32 tmpidx = 0;
-	u8 bResult;
+	u8 b_result;
 	u8 readbyte;
 
 	/*  <20130121, Kordan> For SMIC EFUSE specificatoin. */
@@ -107,19 +107,19 @@ u8 rtw_efuse_one_byte_read(struct adapter *padapter, u16 addr, u8 *data)
 	}
 	if (tmpidx < 100) {
 		*data = rtw_read8(padapter, EFUSE_CTRL);
-		bResult = true;
+		b_result = true;
 	} else {
 		*data = 0xff;
-		bResult = false;
+		b_result = false;
 	}
 
-	return bResult;
+	return b_result;
 }
 
 /*-----------------------------------------------------------------------------
- * Function:	Efuse_ReadAllMap
+ * Function:	efuse_read_all_map
  *
- * Overview:	Read All Efuse content
+ * Overview:	Read All efuse content
  *
  * Input:       NONE
  *
@@ -132,15 +132,15 @@ u8 rtw_efuse_one_byte_read(struct adapter *padapter, u16 addr, u8 *data)
  * 11/11/2008	MHC		Create Version 0.
  *
  */
-static void Efuse_ReadAllMap(struct adapter *padapter, u8 efuseType, u8 *Efuse)
+static void efuse_read_all_map(struct adapter *padapter, u8 efuse_type, u8 *efuse)
 {
-	u16 mapLen = 0;
+	u16 map_len = 0;
 
 	Hal_EfusePowerSwitch(padapter, true);
 
-	Hal_GetEfuseDefinition(padapter, efuseType, TYPE_EFUSE_MAP_LEN, &mapLen);
+	Hal_GetEfuseDefinition(padapter, efuse_type, TYPE_EFUSE_MAP_LEN, &map_len);
 
-	Hal_ReadEFuse(padapter, efuseType, 0, mapLen, Efuse);
+	Hal_ReadEFuse(padapter, efuse_type, 0, map_len, efuse);
 
 	Hal_EfusePowerSwitch(padapter, false);
 }
@@ -161,18 +161,18 @@ static void Efuse_ReadAllMap(struct adapter *padapter, u8 efuseType, u8 *Efuse)
  * 11/13/2008	MHC		Create Version 0.
  *
  */
-void rtw_efuse_shadow_map_update(struct adapter *padapter, u8 efuseType)
+void rtw_efuse_shadow_map_update(struct adapter *padapter, u8 efuse_type)
 {
-	struct eeprom_priv *pEEPROM = GET_EEPROM_EFUSE_PRIV(padapter);
-	u16 mapLen = 0;
+	struct eeprom_priv *eeprom = GET_EEPROM_EFUSE_PRIV(padapter);
+	u16 map_len = 0;
 
-	Hal_GetEfuseDefinition(padapter, efuseType, TYPE_EFUSE_MAP_LEN, &mapLen);
+	Hal_GetEfuseDefinition(padapter, efuse_type, TYPE_EFUSE_MAP_LEN, &map_len);
 
-	if (pEEPROM->bautoload_fail_flag)
-		memset(pEEPROM->efuse_eeprom_data, 0xFF, mapLen);
+	if (eeprom->bautoload_fail_flag)
+		memset(eeprom->efuse_eeprom_data, 0xFF, map_len);
 	else
-		Efuse_ReadAllMap(padapter, efuseType, pEEPROM->efuse_eeprom_data);
+		efuse_read_all_map(padapter, efuse_type, eeprom->efuse_eeprom_data);
 
 	/* PlatformMoveMemory((void *)&pHalData->EfuseMap[EFUSE_MODIFY_MAP][0], */
-	/* void *)&pHalData->EfuseMap[EFUSE_INIT_MAP][0], mapLen); */
+	/* void *)&pHalData->EfuseMap[EFUSE_INIT_MAP][0], map_len); */
 } /*  rtw_efuse_shadow_map_update */
diff --git a/drivers/staging/rtl8723bs/include/rtw_efuse.h b/drivers/staging/rtl8723bs/include/rtw_efuse.h
index a60e05cf699c..1e5d61f4587b 100644
--- a/drivers/staging/rtl8723bs/include/rtw_efuse.h
+++ b/drivers/staging/rtl8723bs/include/rtw_efuse.h
@@ -71,7 +71,7 @@ struct efuse_hal {
 u8 rtw_efuse_calculate_word_counts(u8 word_en);
 u8 rtw_efuse_one_byte_read(struct adapter *padapter, u16 addr, u8 *data);
 
-u8 rtw_efuse_read_1_byte(struct adapter *padapter, u16 Address);
-void rtw_efuse_shadow_map_update(struct adapter *padapter, u8 efuseType);
+u8 rtw_efuse_read_1_byte(struct adapter *padapter, u16 address);
+void rtw_efuse_shadow_map_update(struct adapter *padapter, u8 efuse_type);
 
 #endif
-- 
2.55.0

