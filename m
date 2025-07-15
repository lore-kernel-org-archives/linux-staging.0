Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA051F1537
	for <linux-staging@lists.linux.dev>; Tue, 15 Jul 2025 23:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752623063; cv=none; b=AW4Q/Yw/6ZWwtGiMfVhwZZyeMW6Hbf6zGUCitisJSa4toXIJj6lKtY9GaVdtTIMezm+z0re+kFbOezeKa6Ddv9evqtEPPio+TGrxLINl5nIngcQ2ISHxdHjqMdlRxI+9+7w+Gfeltm2lKChwBAgRFr5UICSAjoiIhqehPqHkJ6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752623063; c=relaxed/simple;
	bh=+Atcn7GjradKBoPS2dBsAipA/U2stMAjGUh4M3wWR/A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=HAPc1CoYWcaIUITls63Wp6gKxQinHLpbeXVzD54hOzgQiEIDLByoVNtOQXwyuTVnLve+PoRqLjgjDEgXRxUZwMMrAYAs14f2IfPFCVwvg/7cPk0K1TDQIqgO49ApKxFmI/n6Q42y8bFVDmvHb6WEMaby5X8E4BCvONB/k7kDuZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F+SYGnPv; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F+SYGnPv"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-73e4a448370so1318003a34.0
        for <linux-staging@lists.linux.dev>; Tue, 15 Jul 2025 16:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752623061; x=1753227861; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dOnOPqVVq2mV3MoQFzfHEqB2Oa+icBT3tmfw/6rp8l4=;
        b=F+SYGnPvJtDuPcz3JDEiPeeqB4RbfsjhlbnAJeFZSWBkgPcZiS9lE+IxoQBO+LBNCu
         1fXM5dkME35SqV0MNi7lzxbcMl244HZ0UMn08tUrn9D/b48C2yvCJamPd+d7b0y6Cj5u
         K8z+O8HhbhtGU4e2I8hSZX8NVEfCQnV0JqYfUDdvMhsuQQZzaHgO6ELx22mXr33uTx+b
         0DeKit+l2Xh0TccRM7FQQqBhsiQCwzPm0ErWihv1OeTiZRQfVUMM8/9HtSL6ImYsN5Ig
         Tl3G41In61pcgzKP17sGxLx3uPYYS5WnhLmoKnf5xOvps3S3GclhTlVzOb7fsfwiHK2a
         p62g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752623061; x=1753227861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dOnOPqVVq2mV3MoQFzfHEqB2Oa+icBT3tmfw/6rp8l4=;
        b=JrDv3rLGpf9/pBJp+HnunmlmyHrJ4rsJ34LTU6LHBGxHJt1Ph+KXZ4mk0luOUM62M6
         2ZjM6FbUk/FR4/v09b5uZV+UtJMoKrh2GfYNtz6ZJ3fyq0DG56jaimJ7Oy2f7SWkIYh0
         OcjqJqyqpTo0W2nT9Iyxv/1UtjlyZA45bDdxC8aV7hewas+VBsXZaCtXs1SZWDvX+sS7
         lyTTG8GPJ5IO7boihUEG/QOul1bzpbEGBN+gKFPk8DzmC+rcTuKVb1dl7/keesG5f7qC
         cnauKG6pjtIQD7lUd0MQDIOuP51UEpIxZpggOOYUikwKJRrsayH4u0d4d20SQPsduL3a
         RyuA==
X-Gm-Message-State: AOJu0Yy6q5KSxdu+pWuzsQLU+5BBbqPLdPNu0HDjgKN88jnTRzUv6uGM
	4dUI5fT8WUmVxjyfN/LUMghgedTZ3BhAOydr6wIHa3B7LmXy0DYrI/RJEfZ7+6t8
X-Gm-Gg: ASbGncvmJ3zIGysjBHHj+qXAdSbrR/AeTKUSWOBDif0B4f36k9tHJdMQeOkL8iMdfnR
	f1mJUT/V8zknOubf2AGyDY/tRz4whNbwfdwOc9aFGHR8nM3STKfIVvvQuosCwlOSjxg59vUi+ZI
	XdGHz1PrahzkNXBkRLL+7Cd7qw+MVdPuo/HsYvHzfAIBucdmWnNRRLYRHPGqhyEHjokqptexKMx
	UwTPj00HVJtGosRqphN0Ma9f/zT37xNm4zb2tKOVynPlA3bnHhjiQMAE0Ic6M7IyeQOiKj7JnoI
	rqApztczCHnOuX2tqIhp8VZCi2LNuDlB3AjbhLUknsxKWoHy/EDjtia+h/+sCbi38dX1I98R4uA
	8kwakEUTN7hqBn/a+sADy0DrB+sZ7m3diHZUZcfGOqtdF94F8Q9Ut
X-Google-Smtp-Source: AGHT+IHsNtDefUaq3q9eseLlP1Ue5LkH4Rez/pyXrG4FVr8oYqQkc7QyzWh/klgUh3UxMMpE5Vxqng==
X-Received: by 2002:a05:6830:910:b0:72b:9316:d596 with SMTP id 46e09a7af769-73e64a490cfmr1118118a34.3.1752623060788;
        Tue, 15 Jul 2025 16:44:20 -0700 (PDT)
Received: from localhost.localdomain ([181.161.11.224])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73cf10a7f48sm2514647a34.25.2025.07.15.16.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 16:44:20 -0700 (PDT)
From: =?UTF-8?q?Ignacio=20Pe=C3=B1a?= <ignacio.pena87@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	=?UTF-8?q?Ignacio=20Pe=C3=B1a?= <ignacio.pena87@gmail.com>
Subject: [PATCH] staging: rtl8723bs: Fix comment style warnings
Date: Tue, 15 Jul 2025 19:44:16 -0400
Message-Id: <20250715234416.50030-1-ignacio.pena87@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix checkpatch warnings in rtl8723bs driver:
- Fix block comment style by moving */ to separate line
- Add missing blank line after variable declarations
- Remove space before tab in commented code

These are coding style fixes that don't change functionality.

Signed-off-by: Ignacio Peña <ignacio.pena87@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c   |  2 +-
 drivers/staging/rtl8723bs/core/rtw_efuse.c | 19 +++++++++++++------
 2 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 437934dd2..f02b3b485 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1318,7 +1318,7 @@ u8 rtw_lps_ctrl_wk_cmd(struct adapter *padapter, u8 lps_ctrl_type, u8 enqueue)
 	u8 res = _SUCCESS;
 
 	/* if (!pwrctrlpriv->bLeisurePs) */
-	/* 	return res; */
+	/*	return res; */
 
 	if (enqueue) {
 		ph2c = rtw_zmalloc(sizeof(struct cmd_obj));
diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index 7a74b011d..fc6dee711 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -70,7 +70,8 @@ Efuse_Write1ByteToFakeContent(u16 Offset, u8 Value)
  * When			Who		Remark
  * 11/17/2008	MHC		Create Version 0.
  *
- *---------------------------------------------------------------------------*/
+ *---------------------------------------------------------------------------
+ */
 void
 Efuse_PowerSwitch(
 struct adapter *padapter,
@@ -85,6 +86,7 @@ u8
 Efuse_CalculateWordCnts(u8 word_en)
 {
 	u8 word_cnts = 0;
+
 	if (!(word_en & BIT(0)))
 		word_cnts++; /*  0 : write enable */
 	if (!(word_en & BIT(1)))
@@ -163,7 +165,8 @@ EFUSE_GetEfuseDefinition(
  * When			Who		Remark
  * 09/23/2008	MHC		Copy from WMAC.
  *
- *---------------------------------------------------------------------------*/
+ *---------------------------------------------------------------------------
+ */
 u8
 EFUSE_Read1Byte(
 struct adapter *Adapter,
@@ -313,7 +316,8 @@ Efuse_WordEnableDataWrite(struct adapter *padapter,
  * When			Who		Remark
  * 11/11/2008	MHC		Create Version 0.
  *
- *---------------------------------------------------------------------------*/
+ *---------------------------------------------------------------------------
+ */
 void
 Efuse_ReadAllMap(
 	struct adapter *padapter,
@@ -350,7 +354,8 @@ void Efuse_ReadAllMap(struct adapter *padapter, u8 efuseType, u8 *Efuse, bool bP
  * When			Who		Remark
  * 11/12/2008	MHC		Create Version 0.
  *
- *---------------------------------------------------------------------------*/
+ *---------------------------------------------------------------------------
+ */
 static void efuse_ShadowRead1Byte(struct adapter *padapter, u16 Offset, u8 *Value)
 {
 	struct eeprom_priv *pEEPROM = GET_EEPROM_EFUSE_PRIV(padapter);
@@ -396,7 +401,8 @@ static void efuse_ShadowRead4Byte(struct adapter *padapter, u16 Offset, u32 *Val
  * When			Who		Remark
  * 11/13/2008	MHC		Create Version 0.
  *
- *---------------------------------------------------------------------------*/
+ *---------------------------------------------------------------------------
+ */
 void EFUSE_ShadowMapUpdate(struct adapter *padapter, u8 efuseType, bool bPseudoTest)
 {
 	struct eeprom_priv *pEEPROM = GET_EEPROM_EFUSE_PRIV(padapter);
@@ -429,7 +435,8 @@ void EFUSE_ShadowMapUpdate(struct adapter *padapter, u8 efuseType, bool bPseudoT
  * When			Who		Remark
  * 11/12/2008	MHC		Create Version 0.
  *
- *---------------------------------------------------------------------------*/
+ *---------------------------------------------------------------------------
+ */
 void EFUSE_ShadowRead(struct adapter *padapter, u8 Type, u16 Offset, u32 *Value)
 {
 	if (Type == 1)
-- 
2.39.5 (Apple Git-154)

