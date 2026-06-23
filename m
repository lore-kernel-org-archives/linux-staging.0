Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5334C3D564B
	for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 12:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782216851; cv=none; b=JjxO6mODzsBKlH7ZtaF+oUTl8LCxt1dKN2uWu/uOYsuHT4VmBjKZ2OgrEK2Z/1QsmSzBphVOwbCXMa4eWMe/C5AV17+EtP99Ofs+E4jzTfSN3/R5mploweaHDRgp2PhlvKup3Q6OsGh4NxnR08igEki5vQwOsOu7YZAV+JXG1eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782216851; c=relaxed/simple;
	bh=P90oU5W2XfLuLfc2S4EMuan8o43pgnvtWJWWmftL6EM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WcdKf6mqDNeuTTBtlhXVUMjYTup/8eEDHx4cmtVL7YYfqSLyqAMbtahIukTXdIgFSQO1m3ZqyIiHspDKksCCXUO8Cvc0oUssAZbUkKumag4cUsxPFbDkLAsOYmN9fli+tiTrqHlLX0SaV+BLWi0LvF/JfyzD+Ehne0M9EC2UiPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o1DHPsYD; arc=none smtp.client-ip=209.85.216.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o1DHPsYD"
Received: by mail-pj1-f66.google.com with SMTP id 98e67ed59e1d1-36b9ec98144so3890867a91.1
        for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 05:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782216848; x=1782821648; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=voBIL7ZfDAIileWd2tny21BbKop0c6dw5i1mJxyiwaU=;
        b=o1DHPsYDyK84VLJivV0iMfmwiyoSlBgqKzhOlB4z03R0Ha+5H6KcyUbFgPfRfJ63A7
         O2I5OL1fKf/4DgExrQjtfrACOhnKZJs0yqXsTxoeTX6QXGfgNSDAWO+6DsQXsj0ZHPYk
         sGF6GF9renNq3dpW48CbAXyu4xa1p6IJiK1LcmGfIbUlZL6oAyZ3wRWbWWEUGk+cQKzT
         bvZAaDqa9kyViu0IjYZJ+O/b/lPrP6v95y96a9H0it+af6Otg6mgzkhIV+EWdPe2Y7/Z
         hyHmMKAbdPG5vxASHHSPLnHxbnyxg+jrjPk9btmJzwtjOJD0EEhhdR7d/6IfGWU9xj3N
         7uvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782216848; x=1782821648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=voBIL7ZfDAIileWd2tny21BbKop0c6dw5i1mJxyiwaU=;
        b=MiTkWIs24ngMyv0X+GnYt0pC7C88LrnARuAZUrMWrddmUUViL9WxPZOeUdVolMCDUZ
         WBOvCxNFADSDh6c4tMfSHx6ObV1cR5cIfC+Mm/xZyWtiNFd7dlflXfi81Od570n3sNcZ
         A9ery40MDBB5HuP9/wGqUE38UAomHxLVteFlp2LgzB63BNUwEAx3k+ULKtIZlMIlqOaB
         SWH0H0KuPzPJJ8yYO4d6VxXLybsCtEW+bMDu1pdJzlYoj7ebYIGHYDyHfIr4FrBI2Lun
         T2U7XakdInsun5+/OZlGBOhREVK/x+Hio6c1lkYk/dt0DIym//S+oG8jTMQbSUlq2W2v
         xq3A==
X-Forwarded-Encrypted: i=1; AHgh+Rr3ySDee4qBJaMrsjnijXj0aWL2atGCLFto+hEtf3gxPAtdE+HLge9xD4eiMOMsxC/Fr81LY5mFKE78Eauw@lists.linux.dev
X-Gm-Message-State: AOJu0YzBfLttgSUKIRZ8L5/6xyEjHgKX7EzbpU9teElmh93VybsCn3Kz
	mARZVCBCrx6BCUMTaUfPP+HoukzFF0FcWHYHYAK2DiBr/EDMAK+2ZKE16KqTsc3/iSc=
X-Gm-Gg: AfdE7clnJ8Ri51mVgXS7xL39SpmdXTz4VEhsZlgUxFCAH/28yHi91PL3Rv2LmftXAld
	f+r7Xa4oV5OM8X1ZrffOuQTXx8RlGsEWicy428EmgScOoqKvXCC9QC8WG3NzZESY6z4ccpFmQEc
	8rT/mLfMuK46hFo63mGsty/kM+xM5XLnKsvLMgXSuKrn1PEdri1eq9StqfsX8ip/PFHp2qG6QWM
	MWdF4JGGTez2l4q9x2PI/0nj90QOZjm2EF9GtZ9nrv33W9vmX0kOrDoOICu1v6vaFJH/A2Xji03
	cLzKtBRdPvBIU/B2zUEDF//ifvbxC0Yl3d/Y2Lzvi2YB7FmYplmMNJvBOZf8ZJsG59yGeNs+SpM
	xK9m34bC4hN7eb+H5mCV0jpZuIYKyw5raCNdZzie23NA84l/RDxFpZ6GRFX2rXWdiO8Ql+fxs4E
	4BGkt8Pd4vKwS6w9syQk+3wNarbAJf4bCf3oeQEcG8Tf/iBq+ooikwVtA/tJ3MUYA=
X-Received: by 2002:a17:90b:3d47:b0:37c:18e0:90e4 with SMTP id 98e67ed59e1d1-37d4d71da02mr14651997a91.2.1782216848272;
        Tue, 23 Jun 2026 05:14:08 -0700 (PDT)
Received: from localhost.localdomain ([2408:8362:1ec6:4980:1a3c:b7ff:fef1:8b0f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d4eede3f9sm9705032a91.3.2026.06.23.05.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 05:14:07 -0700 (PDT)
From: Bruce Ou <oubruce1234@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Bruce Ou <oubruce1234@gmail.com>
Subject: [PATCH v2 3/3] staging: rtl8723bs: fix remaining CamelCase local variables
Date: Tue, 23 Jun 2026 20:08:15 +0800
Message-ID: <20260623120815.14737-4-oubruce1234@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260623120815.14737-1-oubruce1234@gmail.com>
References: <20260623120815.14737-1-oubruce1234@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix coding style warnings reported by checkpatch.pl regarding
the remaining CamelCase local variables in rtw_efuse.c. This includes
variables like contentLen, mapLen, efuseType, and Bytetemp.

No functional changes are introduced.

Signed-off-by: Bruce Ou <oubruce1234@gmail.com>
---
Changes in v2:
  - Split from a single comprehensive patch into a standalone patch.

 drivers/staging/rtl8723bs/core/rtw_efuse.c | 38 +++++++++++-----------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index 6767c6bbaa1b..b1d32f211102 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -46,31 +46,31 @@ rtw_efuse_read_1_byte(
 struct adapter *Adapter,
 u16		address)
 {
-	u8 Bytetemp = {0x00};
+	u8 byte_temp = {0x00};
 	u8 temp = {0x00};
 	u32 k = 0;
-	u16 contentLen = 0;
+	u16 content_len = 0;
 
-	Hal_GetEfuseDefinition(Adapter, EFUSE_WIFI, TYPE_EFUSE_REAL_CONTENT_LEN, &contentLen);
+	Hal_GetEfuseDefinition(Adapter, EFUSE_WIFI, TYPE_EFUSE_REAL_CONTENT_LEN, &content_len);
 
-	if (address < contentLen) {/* E-fuse 512Byte */
+	if (address < content_len) {/* E-fuse 512Byte */
 		/* Write E-fuse Register address bit0~7 */
 		temp = address & 0xFF;
 		rtw_write8(Adapter, EFUSE_CTRL + 1, temp);
-		Bytetemp = rtw_read8(Adapter, EFUSE_CTRL + 2);
+		byte_temp = rtw_read8(Adapter, EFUSE_CTRL + 2);
 		/* Write E-fuse Register address bit8~9 */
 		temp = ((address >> 8) & 0x03) | (byte_temp & 0xFC);
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

