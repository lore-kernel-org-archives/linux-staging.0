Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259972641D8
	for <linux-staging@lists.linux.dev>; Sat, 23 Aug 2025 12:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755953027; cv=none; b=vBJvFKYHwTzGtc+x+5MFlmqiJ2kUutJmQdk9cuaRn3/tCYDC+9H++aWTHWSYsHpFmJawgC7fOcv8+FlQIv0r+7h7EiNzdEVVf7B4CAWmiLpoa4CsyJDLChOvKBbGpw8B0Wf52lbjQHQ0Oryyrjd8hIx9Q4F6Ie8/ZszoEQTHfsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755953027; c=relaxed/simple;
	bh=yKqwH5a6Nz+pa77SkUNK6+bxeAf7vNAaaZiTcMwKWHU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SVDAhAvz+Wy9ZZHIMFDkM9KWIjrKk/vEZggobtPKbXqmQ8xNzWuk9JjiopFwyGEsZOBZGqxEQFfXI6z5q5FC4A3UuMdFAaFz54199nb0ZzDdAjzZlubA7AJvFR1N/ojeA2Ea7u5nA9ZlTEAZ1xrE/HSaqOuft5I0E7RueqcDQqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UPpsS+IM; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UPpsS+IM"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-afcb7abfc5cso466889066b.3
        for <linux-staging@lists.linux.dev>; Sat, 23 Aug 2025 05:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755953022; x=1756557822; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xzIetETHYWHivxrw/pp5DLuF943UAIx59/qdlutf55Y=;
        b=UPpsS+IMV6oBsyJeLYyE1Cvko6FpqnxrtSG7+jdV+PZn0dcrHXgrtCbGkliDhXrZXr
         uTxqZSES8O7JYkqmaSPRXfKdZxmpbGNFutYr/sNhH+KEIQFCDPA+Ggn+6bscvFUNbcDj
         Fy4mDbOtVeDWP0nzxS63H7nA7pKuS9ffNMoaepFO+qUnOmb4NjgihZFR3tXReATdiwtL
         JmFsgkAPIMGuARd1C9lRUQSrzZFt469rjWo55Wsj7GTIpyAav5gpKhOyjDAINA6kBcJw
         XaqmEwKkxKmqAYx8H6tuIadTWVPMiY+UzgHEaP7larssw3zh2S3gCrbrh6jZWL2oSfLx
         7Vkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755953022; x=1756557822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xzIetETHYWHivxrw/pp5DLuF943UAIx59/qdlutf55Y=;
        b=HbXJbNeA2E5fcax06g3FBgVmmvDdOdZjuDli/raQXLY/D8HfNO3sP7A/OJQaBM00Ur
         diRUvwuq/BYH5buIn6UrsIooIj/uZp9nAL5NbZJ7+H2+lGci08IyiApWzDNhtUIvQtwi
         X4/obzfoNOxaWUtNIiE15hRhNIGl79jwcnY6m/VY1G78DGzPZlOKuVXerRppPSbQ0grY
         om1KXKU2AJ1x8k2CuNv7gvHuzTKKW5m7mwq5tVbeR9Pmk25TuC8CqFfJvtDqFvDSVC83
         cN5bo3OPkEAk3yVAgfNnq2IG+8UN/2/yCyUQmjVHpcfIid1VIyqFwFZ7UjxQ4UIxzWs+
         81Ag==
X-Forwarded-Encrypted: i=1; AJvYcCWLoCu98i2dl8MrWX6peeS64ZoU7q7JAvUiNUg2ef9ZRCrdKCJZPNDyjdlQIfxd/3d3X38WjkflbC3/rxCM@lists.linux.dev
X-Gm-Message-State: AOJu0YwiNiqBIx0s/ksgCfw4oPjpxXQfqgMnw9hHk4QQ7RXn4Q7jE4N5
	0hx+aPV06eoZovhOI8N/dRUaoIXlgr1ND1+nrzbBex2Coef0HMZpzGMX
X-Gm-Gg: ASbGncsrFCOCVG0kCjDelYh+OI0WGcAPdZHzCfHbPKaONSVgigZMd2yz4kamrqvdPMl
	S1F95FxI21bYGfKmeirvtcQvmyy2+I6MR1AAKGE1N3XAw2DR9a58rDPraHPLKaAa/E7bIi54J90
	XkQ3AFB8ZHbwy39u8nPutE6evnRdNqP5oZrfkB3uOK0aJjN5N3mZbSLzozYBuRxd8Z8W9a7dzwj
	01p3emHkWrxF2bd3Keh3vwLsETa/vcddI0F84Ldw7Xv0bQu8UbmRcxbLHrjC4t40XckPmQVt57I
	DGIiYqmen1wKE5YXkAaVVBhDBAvHYgAgxS0n1u90arTVptEdw3i86zZhBg05afybqYmAPOE1i7h
	U1FkIi/HtdgKw2Jd8oUtH7MPGHA==
X-Google-Smtp-Source: AGHT+IGoWn0EzUfWZg7qbR8GjlLBISJjayqiLGwRwZ01kRQx/zgS9Ft3sPxThIfe1JhSI6idF2vlyg==
X-Received: by 2002:a17:907:1b29:b0:afa:1b3f:37a2 with SMTP id a640c23a62f3a-afe295d2b84mr583479466b.37.1755953022331;
        Sat, 23 Aug 2025 05:43:42 -0700 (PDT)
Received: from tumbleweed ([95.90.184.246])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe49a1f5a6sm165076466b.111.2025.08.23.05.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Aug 2025 05:43:42 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 09/14] staging: rtl8723bs: remove bPseudoTest from Hal_GetEfuseDefinition
Date: Sat, 23 Aug 2025 14:43:16 +0200
Message-ID: <20250823124321.485910-10-straube.linux@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250823124321.485910-1-straube.linux@gmail.com>
References: <20250823124321.485910-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bPseudoTEst parameter is not used in Hal_GetEfuseDefinition. Remove the
unused parameter and adjust the function calls.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_efuse.c        |  6 +++---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 13 ++++++-------
 drivers/staging/rtl8723bs/include/hal_intf.h      |  2 +-
 3 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index 25ec7278b815..9d065721c28a 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -123,7 +123,7 @@ u16		Address)
 	u32 k = 0;
 	u16 contentLen = 0;
 
-	Hal_GetEfuseDefinition(Adapter, EFUSE_WIFI, TYPE_EFUSE_REAL_CONTENT_LEN, (void *)&contentLen, false);
+	Hal_GetEfuseDefinition(Adapter, EFUSE_WIFI, TYPE_EFUSE_REAL_CONTENT_LEN, (void *)&contentLen);
 
 	if (Address < contentLen) {/* E-fuse 512Byte */
 		/* Write E-fuse Register address bit0~7 */
@@ -257,7 +257,7 @@ static void Efuse_ReadAllMap(struct adapter *padapter, u8 efuseType, u8 *Efuse)
 
 	Efuse_PowerSwitch(padapter, false, true);
 
-	Hal_GetEfuseDefinition(padapter, efuseType, TYPE_EFUSE_MAP_LEN, (void *)&mapLen, false);
+	Hal_GetEfuseDefinition(padapter, efuseType, TYPE_EFUSE_MAP_LEN, (void *)&mapLen);
 
 	Hal_ReadEFuse(padapter, efuseType, 0, mapLen, Efuse);
 
@@ -333,7 +333,7 @@ void EFUSE_ShadowMapUpdate(struct adapter *padapter, u8 efuseType)
 	struct eeprom_priv *pEEPROM = GET_EEPROM_EFUSE_PRIV(padapter);
 	u16 mapLen = 0;
 
-	Hal_GetEfuseDefinition(padapter, efuseType, TYPE_EFUSE_MAP_LEN, (void *)&mapLen, false);
+	Hal_GetEfuseDefinition(padapter, efuseType, TYPE_EFUSE_MAP_LEN, (void *)&mapLen);
 
 	if (pEEPROM->bautoload_fail_flag)
 		memset(pEEPROM->efuse_eeprom_data, 0xFF, mapLen);
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 5355bb80b676..af61730cff14 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -494,8 +494,7 @@ void Hal_GetEfuseDefinition(
 	struct adapter *padapter,
 	u8 efuseType,
 	u8 type,
-	void *pOut,
-	bool bPseudoTest
+	void *pOut
 )
 {
 	switch (type) {
@@ -741,7 +740,7 @@ static void hal_ReadEFuse_WiFi(
 		pbuf[i] = efuseTbl[_offset+i];
 
 	/*  Calculate Efuse utilization */
-	Hal_GetEfuseDefinition(padapter, EFUSE_WIFI, TYPE_AVAILABLE_EFUSE_BYTES_TOTAL, &total, false);
+	Hal_GetEfuseDefinition(padapter, EFUSE_WIFI, TYPE_AVAILABLE_EFUSE_BYTES_TOTAL, &total);
 	used = eFuse_Addr - 1;
 	efuse_usage = (u8)((used*100)/total);
 
@@ -780,7 +779,7 @@ static void hal_ReadEFuse_BT(
 	/*  0xff will be efuse default value instead of 0x00. */
 	memset(efuseTbl, 0xFF, EFUSE_BT_MAP_LEN);
 
-	Hal_GetEfuseDefinition(padapter, EFUSE_BT, TYPE_AVAILABLE_EFUSE_BYTES_BANK, &total, false);
+	Hal_GetEfuseDefinition(padapter, EFUSE_BT, TYPE_AVAILABLE_EFUSE_BYTES_BANK, &total);
 
 	for (bank = 1; bank < 3; bank++) { /*  8723b Max bake 0~2 */
 		if (hal_EfuseSwitchToBank(padapter, bank, false) == false)
@@ -843,7 +842,7 @@ static void hal_ReadEFuse_BT(
 	/*  */
 	/*  Calculate Efuse utilization. */
 	/*  */
-	Hal_GetEfuseDefinition(padapter, EFUSE_BT, TYPE_AVAILABLE_EFUSE_BYTES_TOTAL, &total, false);
+	Hal_GetEfuseDefinition(padapter, EFUSE_BT, TYPE_AVAILABLE_EFUSE_BYTES_TOTAL, &total);
 	used = (EFUSE_BT_REAL_BANK_CONTENT_LEN*(bank-1)) + eFuse_Addr - 1;
 	efuse_usage = (u8)((used*100)/total);
 
@@ -952,7 +951,7 @@ static u16 hal_EfuseGetCurrentSize_WiFi(
 
 error:
 	/*  report max size to prevent write efuse */
-	Hal_GetEfuseDefinition(padapter, EFUSE_WIFI, TYPE_AVAILABLE_EFUSE_BYTES_TOTAL, &efuse_addr, bPseudoTest);
+	Hal_GetEfuseDefinition(padapter, EFUSE_WIFI, TYPE_AVAILABLE_EFUSE_BYTES_TOTAL, &efuse_addr);
 
 exit:
 
@@ -984,7 +983,7 @@ static u16 hal_EfuseGetCurrentSize_BT(struct adapter *padapter, u8 bPseudoTest)
 	efuse_addr = (u16)((btusedbytes%EFUSE_BT_REAL_BANK_CONTENT_LEN));
 	startBank = (u8)(1+(btusedbytes/EFUSE_BT_REAL_BANK_CONTENT_LEN));
 
-	Hal_GetEfuseDefinition(padapter, EFUSE_BT, TYPE_AVAILABLE_EFUSE_BYTES_BANK, &retU2, bPseudoTest);
+	Hal_GetEfuseDefinition(padapter, EFUSE_BT, TYPE_AVAILABLE_EFUSE_BYTES_BANK, &retU2);
 
 	for (bank = startBank; bank < 3; bank++) {
 		if (hal_EfuseSwitchToBank(padapter, bank, bPseudoTest) == false)
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index 2e97a918445c..fbf0b01780ea 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -269,7 +269,7 @@ void Hal_EfusePowerSwitch(struct adapter *padapter, u8 bWrite, u8 PwrState);
 void Hal_ReadEFuse(struct adapter *padapter, u8 efuseType, u16 _offset,
 		   u16 _size_byte, u8 *pbuf);
 void Hal_GetEfuseDefinition(struct adapter *padapter, u8 efuseType, u8 type,
-			    void *pOut, bool bPseudoTest);
+			    void *pOut);
 u16 Hal_EfuseGetCurrentSize(struct adapter *padapter, u8 efuseType, bool bPseudoTest);
 void hal_notch_filter_8723b(struct adapter *adapter, bool enable);
 #endif /* __HAL_INTF_H__ */
-- 
2.51.0

