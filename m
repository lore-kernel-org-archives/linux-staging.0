Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2BE23D7DD
	for <linux-staging@lists.linux.dev>; Sat, 23 Aug 2025 12:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755953021; cv=none; b=fyOFjsg4BVLFNIffi4gPHQj3DB1JAFndVJGHi6inal6LRwf0tWlj4ZwQLsjBQzeMOOPiY8LrtTYgi4J0A+wiuFhqvkNkAdVluxHDfgGpe6uj17r8VlxRyAINNQgawqcmm0MhWlGF5y2QcpHeVPTI3Yr0EWG75VKPHDXVt2BRxmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755953021; c=relaxed/simple;
	bh=nznVPVV1oW8RI0ysSjFO0IF3ye9S9TcnQ8RsmxBEwJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j/N2OePrN/9AS1j9I9hQRRJiarESR4n6I5F5sVldxIsxy563DW4YpsRTxBjrW9OshPS9rZ3kCN7tH5Jxg4Zf/55edW6oSbUYakZyQMnqHH/T91eYAG5qKM57FBca0DytKyhbEh2toBrsEA66AMre+aMaNhUccxpEIk6lPrfRBg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d7mG4T9z; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d7mG4T9z"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-afca3e71009so613160666b.0
        for <linux-staging@lists.linux.dev>; Sat, 23 Aug 2025 05:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755953017; x=1756557817; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Z2TZ8sXO8/N8zS0gdcv8jeOIWY2VQYSICdu1a/1qRE=;
        b=d7mG4T9zajz9U08OBOi1sBX5alcTtjNnomjKgClN5OL47jJaORW1YJuFFPrkz6kkc6
         ZNN2mMdvV+EolR30XgyEUqTHCWavq3j9dPmMNvKuzItS4QVbq+Oc0NPiadZqaotfmHC2
         72u8xUENI8s6JQSoIQ8iWejZ+mKOcYTaGaTosA4zzB+o6lgI1u3+u2oe4sCPTrz88XDF
         hwy/XKvtFxjfcUXqAYXuJbbazMXsMlbLEv7uBaBM+KJ1PBlh6mJ/6EcBn0huy88Zoobg
         OZKipvxZvsKT6Th+O/skEfxdlF39m89ASAg5E17BOScMqLLhzx8g/R9RJ2p47Gb3YDld
         wYMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755953017; x=1756557817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Z2TZ8sXO8/N8zS0gdcv8jeOIWY2VQYSICdu1a/1qRE=;
        b=Nx0niOXC/HGx3s63VSuTg4uI8LaBd57kc8pxbz2xDMfv52ZoTD4v1VsWHvkXDSu/An
         RwcKiofiK769gb16JpYlFLpRg6hX/Y7Ym/Qzy1/hclAtBW1B5G9Aguwz9wR7eUYYsONg
         cDK2wXjM29w4rcbAasxre+QSGV0+Qzszq274pOyHPHb0r/86TrE6e6IGlXPmpJv99WDZ
         5ML7WvkDYK/nBc5iEU8lFRxFambahuHanrSJaHfzuK+ojkSsu2FPhTmOus+dH9u9DY86
         PzIrbe2CJaxsX+rMtv2ly0aJGQ3j2a07Eg6AmbeEbIambWqVxBSYEgfTZrn858dAvFNq
         kbTA==
X-Forwarded-Encrypted: i=1; AJvYcCUfTFwUZORzu6Lde3ne531aY+cA9rq0zBbNdARqKB4jsFVWJ3MMXj6K0XX3PlB1qaNa19ZvUq92OK1P9KFb@lists.linux.dev
X-Gm-Message-State: AOJu0YzTlxdJj3nRcxko1Bk6WqcTX9GTSKaptw6UWW7Pt4VghLGR3wsj
	dv0K52t8TEHZCG+UFbsqCCBUcyZqAQOrpC8BgLCFLQ2dG3G8t+ls8NwI
X-Gm-Gg: ASbGncs0+URIrRFkAz8lLG2tXZ9ETwbgd781BIdUlvP8Q+UuOqnELmLVlpI+ycH/L/Q
	XUevvPhhqX2DZsUG77aYPVwKgiobaewVG1pK40EkPy3PbKtKdrlJgI7hFdBSvFdq08QBw8eIrKR
	JLcIChej151DwQL61tuan4sdOjQgpn+hssdCk6QS9wSRfFzyh/tej6tCuasFObDXjhpO+faPmf2
	wzJeaMV8fFFGXZ9EMck31ChW16dZr6FtUuHA4sXkNn27LZkiHWONvcafgPRGDTgRpQ/9CUhUVah
	YUKxI9gzaO+FRpjo5jtXAgWjx1uElv09qFClKnJMfnYaBKu6H+mqmVBLSumDh1FpWjN7zyEVIkw
	JzjP9iTKlcpv+LLesU7tkAuxiYQ==
X-Google-Smtp-Source: AGHT+IHRpKv/D9CHOevfjwnioo0z/Iv1Zr9GBpRkzn1JcjAQVLITUj5WgDhgpwI81f4cG+vFjTQnaw==
X-Received: by 2002:a17:906:c145:b0:afd:eb4f:d5cc with SMTP id a640c23a62f3a-afe0b4ade1fmr866551266b.31.1755953017336;
        Sat, 23 Aug 2025 05:43:37 -0700 (PDT)
Received: from tumbleweed ([95.90.184.246])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe49a1f5a6sm165076466b.111.2025.08.23.05.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Aug 2025 05:43:37 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 01/14] staging: rtl8723bs: remove bPseudoTest from EFUSE_ShadowMapUpdate
Date: Sat, 23 Aug 2025 14:43:08 +0200
Message-ID: <20250823124321.485910-2-straube.linux@gmail.com>
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

The function EFUSE_ShadowMapUpdate is always called with bPseudoTest set
to false. Remove the pPseudoTest parameter and replace its usage in the
function with false to reduce code complexity.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_efuse.c        | 6 +++---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 4 ++--
 drivers/staging/rtl8723bs/include/rtw_efuse.h     | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index 208373113a62..d28298fa2853 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -386,17 +386,17 @@ static void efuse_ShadowRead4Byte(struct adapter *padapter, u16 Offset, u32 *Val
  * 11/13/2008	MHC		Create Version 0.
  *
  */
-void EFUSE_ShadowMapUpdate(struct adapter *padapter, u8 efuseType, bool bPseudoTest)
+void EFUSE_ShadowMapUpdate(struct adapter *padapter, u8 efuseType)
 {
 	struct eeprom_priv *pEEPROM = GET_EEPROM_EFUSE_PRIV(padapter);
 	u16 mapLen = 0;
 
-	EFUSE_GetEfuseDefinition(padapter, efuseType, TYPE_EFUSE_MAP_LEN, (void *)&mapLen, bPseudoTest);
+	EFUSE_GetEfuseDefinition(padapter, efuseType, TYPE_EFUSE_MAP_LEN, (void *)&mapLen, false);
 
 	if (pEEPROM->bautoload_fail_flag)
 		memset(pEEPROM->efuse_eeprom_data, 0xFF, mapLen);
 	else
-		Efuse_ReadAllMap(padapter, efuseType, pEEPROM->efuse_eeprom_data, bPseudoTest);
+		Efuse_ReadAllMap(padapter, efuseType, pEEPROM->efuse_eeprom_data, false);
 
 	/* PlatformMoveMemory((void *)&pHalData->EfuseMap[EFUSE_MODIFY_MAP][0], */
 	/* void *)&pHalData->EfuseMap[EFUSE_INIT_MAP][0], mapLen); */
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 1608bc71bd71..4a0423182f9e 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1438,12 +1438,12 @@ void Hal_InitPGData(struct adapter *padapter, u8 *PROMContent)
 	if (!pEEPROM->bautoload_fail_flag) { /*  autoload OK. */
 		if (!pEEPROM->EepromOrEfuse) {
 			/*  Read EFUSE real map to shadow. */
-			EFUSE_ShadowMapUpdate(padapter, EFUSE_WIFI, false);
+			EFUSE_ShadowMapUpdate(padapter, EFUSE_WIFI);
 			memcpy((void *)PROMContent, (void *)pEEPROM->efuse_eeprom_data, HWSET_MAX_SIZE_8723B);
 		}
 	} else {/* autoload fail */
 		if (!pEEPROM->EepromOrEfuse)
-			EFUSE_ShadowMapUpdate(padapter, EFUSE_WIFI, false);
+			EFUSE_ShadowMapUpdate(padapter, EFUSE_WIFI);
 		memcpy((void *)PROMContent, (void *)pEEPROM->efuse_eeprom_data, HWSET_MAX_SIZE_8723B);
 	}
 }
diff --git a/drivers/staging/rtl8723bs/include/rtw_efuse.h b/drivers/staging/rtl8723bs/include/rtw_efuse.h
index 669565fa1c69..7bc8de3af1f9 100644
--- a/drivers/staging/rtl8723bs/include/rtw_efuse.h
+++ b/drivers/staging/rtl8723bs/include/rtw_efuse.h
@@ -98,7 +98,7 @@ u8 efuse_OneByteWrite(struct adapter *padapter, u16 addr, u8 data, bool	 bPseudo
 void Efuse_PowerSwitch(struct adapter *padapter, u8 bWrite, u8  PwrState);
 
 u8 EFUSE_Read1Byte(struct adapter *padapter, u16 Address);
-void EFUSE_ShadowMapUpdate(struct adapter *padapter, u8 efuseType, bool bPseudoTest);
+void EFUSE_ShadowMapUpdate(struct adapter *padapter, u8 efuseType);
 void EFUSE_ShadowRead(struct adapter *padapter, u8 Type, u16 Offset, u32 *Value);
 void Rtw_Hal_ReadMACAddrFromFile(struct adapter *padapter);
 u32 Rtw_Hal_readPGDataFromConfigFile(struct adapter *padapter);
-- 
2.51.0

