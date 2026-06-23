Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519D23C4554
	for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 07:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782201577; cv=none; b=NW2QE4bqdGYUIVk06qLJK8f7IsEyWNLXAzpMyqpembMCoNGX+e4ph/gi1xyoXkkaTFNqBcFNZG8Y6qe0PWH+GoPU+T30LMhMWRt30tl12vPFEqVZnrv0lcL72jYW6sdO8Zs9TZfSWwOPH2uItTodpqNoOgC4qv2oxYMQkixnhp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782201577; c=relaxed/simple;
	bh=Ka4Lyha3vFafp3foU0eFNlygrV4KRvN0oNvTeAGbOLI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rslKB5yoHQf0RJzaxMGKmZQgZkQsCZRakLLPWSUJQiVY2gDdXB1SvfbmiTF7gheCGgpAc+q6cAg+Uezksqpw723e4SIpHk0KmFIviWShZXSRTrCATkc7sLBAS1BU9m1ohUnUDvPaNPTyHDwks5QnnAmtCSThTaKaSbHwkLcfN9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iCEFd39/; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iCEFd39/"
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-8453f568e84so5036243b3a.0
        for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 00:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782201575; x=1782806375; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P7S99AxS/oTD9J1SJJcKHnBmyCae+yqMlNAHMIlEQ+k=;
        b=iCEFd39/Jq/ttj18s5wkhumxcC0Z7usirTm3QhVmaUrFvrVJVA7lvLvZNgCiNiwK28
         HYqL1U/AssRjXQ7t/4ERXApjlr1V3dVuzBTQa4cYD+eC4XLC3MeDkuOA3fM/SczRtHSi
         /+qSuUpWu8JksAIQedGKH4BI13Katn8rXmn08X8kE5LKzz1cGXTtZaVjc+LOBxsTLFpw
         4Gea5zCKaWV3+RMPdSEaCF3Ymjh2QWIxc4LH0KrymcoUeaIXWClpQofPdChtMFzbCndl
         J6YCwA24FlP2VTylAvuQnB0yxa0wCfymxeNhjMsUQhYV0pWC530XH7WruKF+FGBMQtaI
         UPOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782201575; x=1782806375;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P7S99AxS/oTD9J1SJJcKHnBmyCae+yqMlNAHMIlEQ+k=;
        b=JKgQlD/F2NH9d25EuXIvSlx3zVZtYCuxfPzCHRHQTX1gYgVfdgZMPb4Kyox8z2ZShF
         8ayqaEvBnt2pbru1HSe+5sviOGE7w7cQpDycBezcyDlQNgR2EZRyZmuL/IebYXHyVbvT
         /ttrsN1Iz9RP+9D+pzOr6dfObqsVVqowTAg02ZCv+Wqo0bSc13+CCzpc1kSx9kHCCO8H
         +Makxjo/Qz2TbyAb36hZs2nIANY2KSTqpyoKZgDyxP8u5k17o9JsTLUc3wZp6+zV49lK
         q7rZIicLx2JIe7qrOvuHNfZ4Tn6fcETeLn+XQxNsl2gl20y88j/hPY9nrNH6TxA8+Jce
         g23A==
X-Gm-Message-State: AOJu0YwL8jvBrHCY07Qj5LA1Qtau/JM7cuXaqmA/kkPPKA/3DRsyfusw
	blneLBqtJh6Ji1Mk6wDmrk034CT3H/ciXYgzakrWEPFQ9htCZvTT0VkE
X-Gm-Gg: AfdE7ckt0Kt6JpUxpNqiIy/FxzteXRWHSMsmMwp3kej5UqM1898+DiF6FB/0QH0T4uT
	j7ZuRxJDpMbBz3MmSrNYfrht/JlmgeelLhiQMVo2flqK2M8g5jIorOAdC4YecGpt1NoU0V2CDlV
	xypis4kGwMUckJCXtAYFqt8yUz7+/D///TVTlnZCDBq2bkwcPjD4breH7G2IQlUye1lF6lp3qR1
	PF5pg1ubSdzbUD/4jpu1i9h4kl98zcpI7VmO8E102gVJnC4Ug1ujfFhPjI8gq5lF9ywPBFoJUmd
	xfQ9ImQvHLLIASz1IgWKWtE/0+mmpCLbIXPAVLlvOsGJYGbhYwGw2wfV5BqZX8kzxrKMdizNaIm
	jYglzmYSh//g2eciXnFN5gW5S7i7Z3ZSqWlwKuI5hIYDnuJTFQMezh490571OANsrfzH5hI0NQd
	tg9kFJJkLkfTI+Mq2XALKEvx1DbgOm2qKbkTtXggXX+vuXXEsB7WCM9DlUP2CR8wg=
X-Received: by 2002:a05:6a00:3e15:b0:842:38d2:a35f with SMTP id d2e1a72fcca58-845952d836dmr2289931b3a.31.1782201575469;
        Tue, 23 Jun 2026 00:59:35 -0700 (PDT)
Received: from localhost.localdomain ([2408:8362:1ec6:4980:1a3c:b7ff:fef1:8b0f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564ea146asm9693380b3a.43.2026.06.23.00.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 00:59:34 -0700 (PDT)
From: Bruce Ou <oubruce1234@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Bruce Ou <oubruce1234@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix CamelCase warnings in rtw_efuse.c
Date: Tue, 23 Jun 2026 15:55:07 +0800
Message-ID: <20260623075507.6157-1-oubruce1234@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Bruce Ou <oubruce1234@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_efuse.c | 42 +++++++++++-----------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index 099320e4e..b5dc5892f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -46,31 +46,31 @@ EFUSE_Read1Byte(
 struct adapter *Adapter,
 u16		Address)
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
+	if (Address < content_len) {/* E-fuse 512Byte */
 		/* Write E-fuse Register address bit0~7 */
 		temp = Address & 0xFF;
 		rtw_write8(Adapter, EFUSE_CTRL + 1, temp);
-		Bytetemp = rtw_read8(Adapter, EFUSE_CTRL + 2);
+		byte_temp = rtw_read8(Adapter, EFUSE_CTRL + 2);
 		/* Write E-fuse Register address bit8~9 */
-		temp = ((Address >> 8) & 0x03) | (Bytetemp & 0xFC);
+		temp = ((Address >> 8) & 0x03) | (byte_temp & 0xFC);
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
-void EFUSE_ShadowMapUpdate(struct adapter *padapter, u8 efuseType)
+void EFUSE_ShadowMapUpdate(struct adapter *padapter, u8 efuse_type)
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
 } /*  EFUSE_ShadowMapUpdate */
 
 
-- 
2.43.0

