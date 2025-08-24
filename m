Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B2F2641E3
	for <linux-staging@lists.linux.dev>; Sun, 24 Aug 2025 09:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756029522; cv=none; b=C8FqIfh4UBve8ZO6nRUimTyOO7ktP+9ZridzmLy5VVKLOySuhJ1g2E0P+JJrJhi1laa2x6nDF7k+QqdpMKH0G5Sd+g29siaV1xya6df3JtNjw0xUWqRZXkvqwE5leqv0SnODiikaXtrDP2CaHX9mY+IhKk9v8C9QagcZ1pygrXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756029522; c=relaxed/simple;
	bh=ldbo9YYAOT7pxAUaEDrlbL+4YuIsDyCnu0vvNTDKWvc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ajIT9Z8jLnYA4zxA4Y8R0V0+z7CWuEwrFkjpj9ZGf1lVUQmH8PpUz5ImM5g/poZtoHDYszw9dh0rHU66qibOiDv6I1HXxTJ5kMxRlQ2uJw64a9ntJ9cnVJVbbVBiprua89yFl3AQGa845i5EyH6ii9Y5sX8XhcL95Co04VoaoWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cKwKL1E5; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cKwKL1E5"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-afcb72d51dcso462204866b.0
        for <linux-staging@lists.linux.dev>; Sun, 24 Aug 2025 02:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756029518; x=1756634318; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1fGiG7/VSnTA1owBp74Wd5IB4bdDfmXxntCUjoYB1M8=;
        b=cKwKL1E5jiwHkXf5EJGx25ki2VASuteQSVngTkMWBxw37V654gwD/oBFp57v1d5g7z
         asccqhLNk/VDjt98qI+J9ASHwcLS0yTzbBuneme2ZgjQP2+QypkQt34HNV8p/8VyVYqC
         wXcNw1Yg53lxu7e/oBTjrcKTQXEEAsacBTMkNe3igP6YmsCZkaMJEEwOqKKEjQ03j7zb
         D/e7svLJebBZ7LNOFBBBUt1vi5Fd13e0f7KsQ8v+ZTUCJsAHySBa7I9dFY7nRovv2VYn
         OzKgpdoc4+oWWorxflg3SRL5Tl38FE4WaEQMKndgo1rT+oSa06iOUYkEcmexHZihrF45
         1JpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756029518; x=1756634318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1fGiG7/VSnTA1owBp74Wd5IB4bdDfmXxntCUjoYB1M8=;
        b=LIlQvzsN4Jl/Pwhs46tvj6PZz5czZt0VVUjG1gJdTeoFNSBQIG0DNLKu5rXA57XfBi
         WTv+aomvAIjfOdcF5+rRmNHtA+mpVCu3v2jvNI/slc75hTYPbEKHtgtk2D4D/vbKLgZ5
         ZlsyKeQ5RyHpD8gFEmVG3eJdQZlg3XTHFFFkjbvxJSmv8N9RzQOm0BBAA6ORbuI0Lutw
         PUzQnrTQEMpwzZ8vMLIpUpv4ZHTApkzEEDkyaifurN+BdUZopCI3dxFaPlum2j+aDeM2
         xFvBj8J/2ePE9GXCUjR4UF/5Br1x4ak9EI+0wYW4AoboO53HikoMSYrw/EXVugWMEUfF
         R91A==
X-Forwarded-Encrypted: i=1; AJvYcCXl8Dnp4ErOFq1xRX/F0PfN6xAdA9GnVYlM2lGPBiKmsaZgV/iXsVRlCSyhmm/5YthHm8VEGtK+lKUu86nC@lists.linux.dev
X-Gm-Message-State: AOJu0Yxu2pdlcCffko08Ua8Yl0C2esHYh1MFo8J47WR38Ztjkd+wRFTL
	ao+q/Qc5nWcGpoEB0LZbd7dmDzgHq2foLR5InY2Vmw9YpVL1LEael2Pu
X-Gm-Gg: ASbGncsfSn2OGOYXwEaX5jz2Oaed7k7ygwaVVC3fhAZdgxhXgoAVeaaiTaUUCRc4xNh
	v6GGEmXd57JVe5yGcvelE5Ge6kKlRZmmog3JN0gE4kKbLfWlYUO/SMwj6RAKBGVxgzKaEjacJ/T
	44oD81FhRwheh8wCDZAGVvNoPy7F3nsPvnIBlkWL9bZaNxzE8Bkarnt4S99rzHw6AawR1KVAOd9
	sJh6P/B1Ho28hbtQ+73MXCC72UY4LnGH2+PiBT0lpoMemuX4fEDFgXG1XveHfMY4EklrkMOw5t/
	ZFiFf4USDmJopmhY65sQUEZQS/QBhu7/yuO3zcbboS4mpLAC0QPevvHOmTozA+KeQI3M/lnitkh
	9A8y4cHf1OqjFa7PF1sxoY7gGuA==
X-Google-Smtp-Source: AGHT+IEChKPlkeYc+u70DNblLlkC7GNSA1YYbKn+4HtbpIDoAJGxZs5hUdLvvGsztjC+LEpHLFdh4A==
X-Received: by 2002:a17:907:80c:b0:afd:d94b:830e with SMTP id a640c23a62f3a-afe29513a3amr629745866b.63.1756029518387;
        Sun, 24 Aug 2025 02:58:38 -0700 (PDT)
Received: from tumbleweed ([95.90.184.246])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe79fba62dsm41314766b.100.2025.08.24.02.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 02:58:38 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/4] staging: rtl8723bs: remove bWrite from Hal_EfusePowerSwitch
Date: Sun, 24 Aug 2025 11:58:28 +0200
Message-ID: <20250824095830.79233-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250824095830.79233-1-straube.linux@gmail.com>
References: <20250824095830.79233-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function Hal_EfusePowerSwitch is always called with bWrite set to
false. Remove the pWrite parameter and reomve resulting dead code to reduce
code complexity.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_efuse.c    |  4 +--
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 25 +++----------------
 drivers/staging/rtl8723bs/include/hal_intf.h  |  2 +-
 3 files changed, 6 insertions(+), 25 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index f0c705ccdbdc..d5c53b614f61 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -164,13 +164,13 @@ static void Efuse_ReadAllMap(struct adapter *padapter, u8 efuseType, u8 *Efuse)
 {
 	u16 mapLen = 0;
 
-	Hal_EfusePowerSwitch(padapter, false, true);
+	Hal_EfusePowerSwitch(padapter, true);
 
 	Hal_GetEfuseDefinition(padapter, efuseType, TYPE_EFUSE_MAP_LEN, (void *)&mapLen);
 
 	Hal_ReadEFuse(padapter, efuseType, 0, mapLen, Efuse);
 
-	Hal_EfusePowerSwitch(padapter, false, false);
+	Hal_EfusePowerSwitch(padapter, false);
 }
 
 /*-----------------------------------------------------------------------------
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 66ba3bcd22e4..36680ecb5897 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -568,8 +568,6 @@ void Hal_GetEfuseDefinition(
 	}
 }
 
-#define VOLTAGE_V25		0x03
-
 /*  */
 /* 	The following is for compile ok */
 /* 	That should be merged with the original in the future */
@@ -578,7 +576,7 @@ void Hal_GetEfuseDefinition(
 #define REG_EFUSE_ACCESS_8723			0x00CF	/*  Efuse access protection for RTL8723 */
 
 void Hal_EfusePowerSwitch(
-	struct adapter *padapter, u8 bWrite, u8 PwrState
+	struct adapter *padapter, u8 PwrState
 )
 {
 	u8 tempval;
@@ -626,25 +624,8 @@ void Hal_EfusePowerSwitch(
 			tmpV16 |= (LOADER_CLK_EN | ANA8M);
 			rtw_write16(padapter, REG_SYS_CLKR, tmpV16);
 		}
-
-		if (bWrite) {
-			/*  Enable LDO 2.5V before read/write action */
-			tempval = rtw_read8(padapter, EFUSE_TEST+3);
-			tempval &= 0x0F;
-			tempval |= (VOLTAGE_V25 << 4);
-			rtw_write8(padapter, EFUSE_TEST+3, (tempval | 0x80));
-
-			/* rtw_write8(padapter, REG_EFUSE_ACCESS, EFUSE_ACCESS_ON); */
-		}
 	} else {
 		rtw_write8(padapter, REG_EFUSE_ACCESS, EFUSE_ACCESS_OFF);
-
-		if (bWrite) {
-			/*  Disable LDO 2.5V after read/write action */
-			tempval = rtw_read8(padapter, EFUSE_TEST+3);
-			rtw_write8(padapter, EFUSE_TEST+3, (tempval & 0x7F));
-		}
-
 	}
 }
 
@@ -1474,9 +1455,9 @@ void Hal_EfuseParsePackageType_8723B(
 	u8 package;
 	u8 efuseContent;
 
-	Hal_EfusePowerSwitch(padapter, false, true);
+	Hal_EfusePowerSwitch(padapter, true);
 	efuse_OneByteRead(padapter, 0x1FB, &efuseContent);
-	Hal_EfusePowerSwitch(padapter, false, false);
+	Hal_EfusePowerSwitch(padapter, false);
 
 	package = efuseContent & 0x7;
 	switch (package) {
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index 4fe48cccb889..2fa2382ad5f3 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -265,7 +265,7 @@ u8 GetHalDefVar8723BSDIO(struct adapter *Adapter, enum hal_def_variable eVariabl
 u8 SetHalDefVar8723BSDIO(struct adapter *Adapter, enum hal_def_variable eVariable, void *pValue);
 void UpdateHalRAMask8723B(struct adapter *padapter, u32 mac_id, u8 rssi_level);
 void rtl8723b_SetBeaconRelatedRegisters(struct adapter *padapter);
-void Hal_EfusePowerSwitch(struct adapter *padapter, u8 bWrite, u8 PwrState);
+void Hal_EfusePowerSwitch(struct adapter *padapter, u8 PwrState);
 void Hal_ReadEFuse(struct adapter *padapter, u8 efuseType, u16 _offset,
 		   u16 _size_byte, u8 *pbuf);
 void Hal_GetEfuseDefinition(struct adapter *padapter, u8 efuseType, u8 type,
-- 
2.51.0

