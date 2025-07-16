Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163241D90DD
	for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 17:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752688249; cv=none; b=sVCvEytcRNXk0VG/0eUAmJXOHztQB03VaJnYPKwzc+1tpHZsr//kUTgf3o51zVypvWfts4/CQm1xoK3925HLNqWJcEeVSHtS+VUPRECJaVukyXAnlZpX05enDJfoz/PUkcS2x/OFWOASE8XUV3UZq/DIJHUqCjTAGSwB7p7webc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752688249; c=relaxed/simple;
	bh=BqDirHU7AZcgF0SBs883Q9y1oL8z1MvSU98FRaQNSbY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tOo+qTIZHpHCFcoyOXC9t9oR5mX+kecTjTyJ7sq7zOHA8mmoV+IAObeAqE2utYfDeqXWeHOeMgHhEoBu5s7W4eDRo7FoyfX8w89VFMog+h3DHgilfCBZXyrg1GQ8YF+J46abKxxV6iWxLXj05Q4soFhG3e5DPDJzGQh0T1B72HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EJFlK0RF; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EJFlK0RF"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-40a4bf1eb0dso102675b6e.3
        for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 10:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752688247; x=1753293047; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sPPU3Ai5/SbOqE0q7h6plNBBdyj2mE3sA3b71xM4R5o=;
        b=EJFlK0RFv41yopdBO138471z40sAXCbXpuUd9NKTKoepyW/njf56Gg6z9mT8Ou39v8
         Il1CkGDG655WKzvAzq7y3kqH45jqB9mhTalFS1VCflmGGeZDNgbY7C589agWdH0wafkS
         mlYKedjvMcEDLhWJPNEmGr+E0fhrqYJQAEURRFViQy+Nl5lhKpsOiZ5nrdJJgOe9po9e
         ZRxZDKuRlp+vrXuRrFovXVs7zHwah3pn+b4pLYG+tXNMspEt+aRiJKN6M30g//7UXoZg
         avnln+dswiMK4mujDcsE2RaYIlFP3N31iGMz+aBrRjy/qmz/myMzKK3wRix0qEyun6Fr
         I8tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752688247; x=1753293047;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sPPU3Ai5/SbOqE0q7h6plNBBdyj2mE3sA3b71xM4R5o=;
        b=O+OJCP8RKJqu1W3GTnhiailgshkQgHZGP2sYxyBKKDCJdt/TganhXj5qo31qNC8CZO
         HP8U/S0nUgDICh4fW+5L2Qk7xdasjN54IECwW3rSqzLjdHSeFuMfrLJmVGaveJglrbS6
         /2bVZSmkkF+oHEpGWeDrQhfO+X4pYMslxGYxIwJ/xU5X7ZlwrcoraKq/FlSAvScscod4
         y0e1Fd6pp6TJtFeylVmFxXt1/jY1TGwx2nwXhZ6THCvGu8OCpa3KnBJoBtaZhBiyOHXl
         ILZ/xksehZ7mrqFruRYfCp1iSTsthULzQNWKB1MbJ9zRuTt1N43oXf1/ri6yPxIUimm+
         bmpA==
X-Forwarded-Encrypted: i=1; AJvYcCV/f7cofbLPO5hXjLegO3XCmzuk6lOY+FpVO9QFNN1IyG3FOP4UoESb6o9cMxZzGal7MDTmyKpimDowvZ7n@lists.linux.dev
X-Gm-Message-State: AOJu0YwGX+F2yYm1fvKgpIX+a7LYUZYGoT3tNY20APxxEYg8lUJgP93K
	itZ5h/Yi466C80PAzelvBf9zj5W8TWs2LoT0MbLbDyHxvqtNNZQmz2rVH/o5NNiq
X-Gm-Gg: ASbGncsVh662ezDVjSL0wq9UIkhMqpwMdbBomva5UvjyK/COnComUr9xI+gEfFACX8g
	6ULsETBZHRXomBfDxTQvUausXfSmXnG0KtlTCZc1jflNHQJa61h9oF74wHKi9fzMfRKGvMYxjdi
	a4x/FV9FNyMdFeN4/WanzDdOAIVzy+MqBlys/a0lAIEzXePisR9uki4a18C13z9T5EwaYD37oyJ
	9GQvz3k+iNYV005y9gXM0NUkzcZKKiLl9PaPUSe4ZNgZC9vkAcRnwpchHD0TU51HGDEt4u9KfFi
	ihTQWTRjAAckgcWZzXMFQ8+pSW1X+2fP9/tCbz7nGdwh2Ft7TEObYjPfVB+zMvwRESulEGrpaOU
	pDT/PobIxkTBRqPadeJyU/nj1jWDFNRYIx6/rr5EPRRPUQpL/lYJx
X-Google-Smtp-Source: AGHT+IEdCTmf+booYmpeSlMxYQnwdzga0cgjOxAhPB7jmKFdFBItROXjqRm4kRn9w2Cteev9SIvNBA==
X-Received: by 2002:a05:6808:148a:b0:406:7a50:947a with SMTP id 5614622812f47-41d0526b939mr2279000b6e.27.1752688246938;
        Wed, 16 Jul 2025 10:50:46 -0700 (PDT)
Received: from localhost.localdomain ([181.161.11.224])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-414197c52a6sm2874649b6e.19.2025.07.16.10.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 10:50:46 -0700 (PDT)
From: =?UTF-8?q?Ignacio=20Pe=C3=B1a?= <ignacio.pena87@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Cc: Ignacio Pena <ignacio.pena87@gmail.com>
Subject: [PATCH v3 1/3] staging: rtl8723bs: remove unnecessary comment separator lines
Date: Wed, 16 Jul 2025 13:50:42 -0400
Message-Id: <20250716175044.81439-1-ignacio.pena87@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ignacio Pena <ignacio.pena87@gmail.com>

Remove the long dashed separator lines from block comments as they
don't follow kernel coding style, as suggested by Greg KH.

Signed-off-by: Ignacio Pena <ignacio.pena87@gmail.com>
---
Changes in v3:
- Fixed compilation issue by keeping the closing */ marker

Changes in v2:
- Removed separator lines instead of just fixing the format

 drivers/staging/rtl8723bs/core/rtw_efuse.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index 7a74b011d..abc123def 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -70,7 +70,7 @@ Efuse_Write1ByteToFakeContent(u16 Offset, u8 Value)
  * When			Who		Remark
  * 11/17/2008	MHC		Create Version 0.
  *
- *---------------------------------------------------------------------------*/
+ */
 void
 Efuse_PowerSwitch(
 struct adapter *padapter,
@@ -163,7 +163,7 @@ EFUSE_GetEfuseDefinition(
  * When			Who		Remark
  * 09/23/2008	MHC		Copy from WMAC.
  *
- *---------------------------------------------------------------------------*/
+ */
 u8
 EFUSE_Read1Byte(
 struct adapter *Adapter,
@@ -313,7 +313,7 @@ Efuse_WordEnableDataWrite(struct adapter *padapter,
  * When			Who		Remark
  * 11/11/2008	MHC		Create Version 0.
  *
- *---------------------------------------------------------------------------*/
+ */
 void
 Efuse_ReadAllMap(
 	struct adapter *padapter,
@@ -350,7 +350,7 @@ void Efuse_ReadAllMap(struct adapter *padapter, u8 efuseType, u8 *Efuse, bool bP
  * When			Who		Remark
  * 11/12/2008	MHC		Create Version 0.
  *
- *---------------------------------------------------------------------------*/
+ */
 static void efuse_ShadowRead1Byte(struct adapter *padapter, u16 Offset, u8 *Value)
 {
 	struct eeprom_priv *pEEPROM = GET_EEPROM_EFUSE_PRIV(padapter);
@@ -396,7 +396,7 @@ static void efuse_ShadowRead4Byte(struct adapter *padapter, u16 Offset, u32 *Val
  * When			Who		Remark
  * 11/13/2008	MHC		Create Version 0.
  *
- *---------------------------------------------------------------------------*/
+ */
 void EFUSE_ShadowMapUpdate(struct adapter *padapter, u8 efuseType, bool bPseudoTest)
 {
 	struct eeprom_priv *pEEPROM = GET_EEPROM_EFUSE_PRIV(padapter);
@@ -429,7 +429,7 @@ void EFUSE_ShadowMapUpdate(struct adapter *padapter, u8 efuseType, bool bPseudoT
  * When			Who		Remark
  * 11/12/2008	MHC		Create Version 0.
  *
- *---------------------------------------------------------------------------*/
+ */
 void EFUSE_ShadowRead(struct adapter *padapter, u8 Type, u16 Offset, u32 *Value)
 {
 	if (Type == 1)
-- 
2.39.5
