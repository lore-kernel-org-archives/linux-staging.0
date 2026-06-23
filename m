Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92B53D4119
	for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 11:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782214142; cv=none; b=oNC0iHmoBZLLuCzXm4K8IMYJtJsSEfjP9sQza3lEY7UuiTc/w01CIUqwUx78N1Hm7qehrwdMyTApg1H1/ijvu+lKrt0gSHnjLwHwAmVrBcxfFaQHK9x0gj8xcxJ67ocAfLBahT4HU1PAMq4NgfnVlAkGgh23yDEIyPtBx3ITaGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782214142; c=relaxed/simple;
	bh=iL4EiZ5ShmM/OkNdV8QFsLChVig7aKYvAVvTK3SrgUw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HMZagWiN7Z+sTP99oEYeNsBbEXFjoizv5gZAW67E70VrvGcAlqnxSLIIJh4AXsoyB1QiEFsY+qGfoK2nxU++0zyw1B70Z/0FjmaHJ3QG2cbi3zSCN02guYA1S2tPK91law7+/RqvOEXPz3b0E1HKMKah1rQmLYXVQ0u6rGaqves=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P6T+ZMeG; arc=none smtp.client-ip=209.85.216.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P6T+ZMeG"
Received: by mail-pj1-f67.google.com with SMTP id 98e67ed59e1d1-36bdda53d99so2247083a91.0
        for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 04:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782214139; x=1782818939; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7G6yTgB2Ni9hPEBym1NnAZeZS0QUq3ksDQGbv3jbAbQ=;
        b=P6T+ZMeG0DlVkQZw6YfDQAJjsIKLJnH0c9qYlVkQ3t5JxU8GS/caDwb1F5OUxDixf4
         C21LX/1UD2a7sZuZoHeyib4xAvCRasOZgNU69F3lQkvJiHzrka8VTQhcaW40YWbscKZH
         k8MF7RdVQzgXO6QlNGZ3JSe5o242imv4iZDu+3jqiQ+B8mbnCJtKlOUbgP7wwpwDVzbG
         7OwIpb0+AanrBd243GQhmMqsno5m3DMitqTr2j/3Ylvd+qaJUrRdUP6brbZ1PyFlLFlu
         g+0QXmXFZXJ67iKR5JgbinbDA8GDw0EJ4l2hZrX2ZIzkjtfHg5lyUpB7d3ztH1+eIvF+
         dOaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782214139; x=1782818939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7G6yTgB2Ni9hPEBym1NnAZeZS0QUq3ksDQGbv3jbAbQ=;
        b=Fgv7gMITTnePSDWg22mCvvzUL3ESFWwa+LfTek4QA/cgWQM4O9ncfk5M2HcdvizGCC
         HQbDnjrZfZRFVWhoqypb3TdU6ynNqqMyFEbDMy0TjtPuLsQwxhGiaII+8GAogXE7NgkT
         KW9O28z9N0zvzG+AaLHSmEjcrAwOfyk6NR3dumAIFhpWUj8onFzr18eM0uxAkyj+TUUJ
         CBvbtextCCuy7UFCdXdSsozfPpvYdmxBV2oYTf+CxmP28RBegJpmmdPHZ7ScQ1zwfZs+
         3nJXRi9CucjZQOoWccDRlv4/dpTkODVc8dhDvtB8yEk6vFg8n31oE6CVXVCzkHWEP3E7
         Ui6g==
X-Forwarded-Encrypted: i=1; AHgh+Rq0qM0mhl/VDb/JET17x4HQ+0ZANRm4s4eovXOm8xTveRHRjpKDpHTOMQtgYNxPouLGRo+pT6nznvLxuA1T@lists.linux.dev
X-Gm-Message-State: AOJu0YywBmZe0rw4BbPO3uvnIwfm2pEQlx0Rpae5WOf8abj88GsA660S
	Dpp2i3F0qfd8KgD9USZNppTSMXlwbVACU++R529Jr/4tmcRtsFEvYYqe
X-Gm-Gg: AfdE7cmuO2JQtaDTD37MBP8BnOTvuPp9OHLTr8uAxaEyDJxx0wBBX0f/7pbkpLx5sAS
	X67rwO0ftDGDGW853pNOlsfJ3qTuCe6kb/fWtGcYC/ot4zQO2kDni70oXZOdO8X19Y5+DieAW68
	216QzBovix/Mf/KmxC8542nEoCebEow5EMvmxFjj7hrMt4N3yS9fNlJtPKOo6B7u5Pv5LnV6d58
	VB2Xhku1vXkRmGCjnfHJUcYZqiSC5czeqrJs2a/AfNwzRvJBgaJqUciyotmxSFDiAIaPCmn/U4i
	diFBXrfGYMke/YS6QS8svVRB4ZDw4bUK5Yo0jO5pnwIoWVVfgAlDeAOXmqojaav99WoCAcAJ9EG
	iWDmNu9dDmtywI+BiG7jjhGCMaso5sbK6kXQu0KwbSgxYprfky9TbfmIBlWpnLD6hDh3ReRshN2
	QUMaMJAxOzjeS2XvX1/05obzkd4S4aJwpsHn9qdbHWG0x0K92Ql8kHgA+C
X-Received: by 2002:a17:90b:3c8a:b0:36c:689c:a4c9 with SMTP id 98e67ed59e1d1-37d4e659a6dmr14476044a91.21.1782214139013;
        Tue, 23 Jun 2026 04:28:59 -0700 (PDT)
Received: from localhost.localdomain ([27.10.55.237])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d4eff2387sm9768300a91.5.2026.06.23.04.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 04:28:58 -0700 (PDT)
From: Bruce Ou <oubruce1234@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Bruce Ou <oubruce1234@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix CamelCase style warnings in rtw_efuse.c
Date: Tue, 23 Jun 2026 19:26:29 +0800
Message-ID: <20260623112629.4953-1-oubruce1234@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix coding style warnings reported by checkpatch.pl regarding
CamelCase local variable names in rtw_efuse.c. This includes
variables like contentLen, mapLen, efuseType, Bytetemp, bResult,
and Address.

No functional changes are introduced.

Signed-off-by: Bruce Ou <oubruce1234@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_efuse.c | 54 +++++++++++-----------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index a40d6eab7249..b1d32f211102 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -44,33 +44,33 @@ rtw_efuse_calculate_word_counts(u8 word_en)
 u8
 rtw_efuse_read_1_byte(
 struct adapter *Adapter,
-u16		Address)
+u16		address)
 {
-	u8 Bytetemp = {0x00};
+	u8 byte_temp = {0x00};
 	u8 temp = {0x00};
 	u32 k = 0;
-	u16 contentLen = 0;
+	u16 content_len = 0;
 
-	Hal_GetEfuseDefinition(Adapter, EFUSE_WIFI, TYPE_EFUSE_REAL_CONTENT_LEN, &contentLen);
+	Hal_GetEfuseDefinition(Adapter, EFUSE_WIFI, TYPE_EFUSE_REAL_CONTENT_LEN, &content_len);
 
-	if (Address < contentLen) {/* E-fuse 512Byte */
+	if (address < content_len) {/* E-fuse 512Byte */
 		/* Write E-fuse Register address bit0~7 */
-		temp = Address & 0xFF;
+		temp = address & 0xFF;
 		rtw_write8(Adapter, EFUSE_CTRL + 1, temp);
-		Bytetemp = rtw_read8(Adapter, EFUSE_CTRL + 2);
+		byte_temp = rtw_read8(Adapter, EFUSE_CTRL + 2);
 		/* Write E-fuse Register address bit8~9 */
-		temp = ((Address >> 8) & 0x03) | (Bytetemp & 0xFC);
+		temp = ((address >> 8) & 0x03) | (byte_temp & 0xFC);
 		rtw_write8(Adapter, EFUSE_CTRL + 2, temp);
 
 		/* Write 0x30[31]= 0 */
-		Bytetemp = rtw_read8(Adapter, EFUSE_CTRL + 3);
-		temp = Bytetemp & 0x7F;
+		byte_temp = rtw_read8(Adapter, EFUSE_CTRL + 3);
+		temp = byte_temp & 0x7F;
 		rtw_write8(Adapter, EFUSE_CTRL + 3, temp);
 
 		/* Wait Write-ready (0x30[31]= 1) */
-		Bytetemp = rtw_read8(Adapter, EFUSE_CTRL + 3);
-		while (!(Bytetemp & 0x80)) {
-			Bytetemp = rtw_read8(Adapter, EFUSE_CTRL + 3);
+		byte_temp = rtw_read8(Adapter, EFUSE_CTRL + 3);
+		while (!(byte_temp & 0x80)) {
+			byte_temp = rtw_read8(Adapter, EFUSE_CTRL + 3);
 			k++;
 			if (k == 1000)
 				break;
@@ -89,7 +89,7 @@ u16	addr,
 u8	*data)
 {
 	u32 tmpidx = 0;
-	u8 bResult;
+	u8 result;
 	u8 readbyte;
 
 	/*  <20130121, Kordan> For SMIC EFUSE specificatoin. */
@@ -114,13 +114,13 @@ u8	*data)
 	}
 	if (tmpidx < 100) {
 		*data = rtw_read8(padapter, EFUSE_CTRL);
-		bResult = true;
+		result = true;
 	} else {
 		*data = 0xff;
-		bResult = false;
+		result = false;
 	}
 
-	return bResult;
+	return result;
 }
 
 /*-----------------------------------------------------------------------------
@@ -139,15 +139,15 @@ u8	*data)
  * 11/11/2008	MHC		Create Version 0.
  *
  */
-static void Efuse_ReadAllMap(struct adapter *padapter, u8 efuseType, u8 *Efuse)
+static void Efuse_ReadAllMap(struct adapter *padapter, u8 efuse_type, u8 *Efuse)
 {
-	u16 mapLen = 0;
+	u16 map_len = 0;
 
 	Hal_EfusePowerSwitch(padapter, true);
 
-	Hal_GetEfuseDefinition(padapter, efuseType, TYPE_EFUSE_MAP_LEN, &mapLen);
+	Hal_GetEfuseDefinition(padapter, efuse_type, TYPE_EFUSE_MAP_LEN, &map_len);
 
-	Hal_ReadEFuse(padapter, efuseType, 0, mapLen, Efuse);
+	Hal_ReadEFuse(padapter, efuse_type, 0, map_len, Efuse);
 
 	Hal_EfusePowerSwitch(padapter, false);
 }
@@ -216,20 +216,20 @@ static void efuse_ShadowRead4Byte(struct adapter *padapter, u16 Offset, u32 *Val
  * 11/13/2008	MHC		Create Version 0.
  *
  */
-void rtw_efuse_shadow_map_update(struct adapter *padapter, u8 efuseType)
+void rtw_efuse_shadow_map_update(struct adapter *padapter, u8 efuse_type)
 {
 	struct eeprom_priv *pEEPROM = GET_EEPROM_EFUSE_PRIV(padapter);
-	u16 mapLen = 0;
+	u16 map_len = 0;
 
-	Hal_GetEfuseDefinition(padapter, efuseType, TYPE_EFUSE_MAP_LEN, &mapLen);
+	Hal_GetEfuseDefinition(padapter, efuse_type, TYPE_EFUSE_MAP_LEN, &map_len);
 
 	if (pEEPROM->bautoload_fail_flag)
-		memset(pEEPROM->efuse_eeprom_data, 0xFF, mapLen);
+		memset(pEEPROM->efuse_eeprom_data, 0xFF, map_len);
 	else
-		Efuse_ReadAllMap(padapter, efuseType, pEEPROM->efuse_eeprom_data);
+		Efuse_ReadAllMap(padapter, efuse_type, pEEPROM->efuse_eeprom_data);
 
 	/* PlatformMoveMemory((void *)&pHalData->EfuseMap[EFUSE_MODIFY_MAP][0], */
-	/* void *)&pHalData->EfuseMap[EFUSE_INIT_MAP][0], mapLen); */
+	/* void *)&pHalData->EfuseMap[EFUSE_INIT_MAP][0], map_len); */
 } /*  rtw_efuse_shadow_map_update */
 
 /*-----------------------------------------------------------------------------
-- 
2.43.0

