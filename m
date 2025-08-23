Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E3C25B662
	for <linux-staging@lists.linux.dev>; Sat, 23 Aug 2025 12:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755953023; cv=none; b=A4K6jAZI7TABzF3PflkAAUkZiQCrbXFA6AALXgDrgldxp+U31i65Sa3XFxRqeOBx1ofN2a0TzTztGFwG36lmEG80EiU3LMYdKgWbwn7jia06Wd3Zi+ic7Wgz7tLnevn4dnoaDjb7V3p68Qu3peDR6LIihTIcXhCmVnLLvg592q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755953023; c=relaxed/simple;
	bh=roanaskB8oiM/AncCs6OPMtvzR+UvubYsGnl124M0yc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C6yrSPpIIAx2ITfHFPkP9atS1f9AI/SsqmjhgA1+AYTUG/ejY36eRg10ZyIpWO76ojp5xBLyooGIYG2PjLFLkz9YGIBsAIbcjYg56X+ioY3l/M7xMrvkwa0wXVmvvAujhE6IL9m9KSzQLn5theW3pw+NX2C7oXG0BhC73XCuylA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jNSIPy4b; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jNSIPy4b"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-61c13619cacso3743590a12.3
        for <linux-staging@lists.linux.dev>; Sat, 23 Aug 2025 05:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755953020; x=1756557820; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mhPbh306uA+mZWGyZJvI2krS7O9T1n16n8YRZur58lw=;
        b=jNSIPy4bm0vWCKNl09i8mpoD1a0CaP8BixGN9I0rlVsgapbBU37KS+amLA05deHGov
         gtfUsl93bJndxAlvCsAHhCMk+1CF+b+2csX2e2aA5yIk03MZlnD4dy0G1mt5jo7x0pB2
         JDp7s7iiXLiqiuyTNiBZnrgcmhf39+xO/dZI3d6FcQArVw3n9ziERju6oKbRALSYjXi1
         TwVO0kMpg1AGzWb/Ydsf5B9er/JDsVZzh80/ptj36VQConFYW56DAKtswJx8QxFHCLk0
         ecQ9tzw3JFzwIZyU9l/g6A0YC6xcAsTX2eLyPYVtc+7yCm9cbDN3X60neOiAHAz5Mib7
         ztnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755953020; x=1756557820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mhPbh306uA+mZWGyZJvI2krS7O9T1n16n8YRZur58lw=;
        b=F91K7WglhFcQGclN245fEw9q4GvzVF/y+9GegKEh8x3sYTgDX6ID5KOlCDhZVrtuvL
         2o+8FlYzwu2MQUkj01bomHN4GkT9JgLc8vWgEjHKC8VepMFKRz7gH8oXXf2FpOi/tEoG
         7NgZxdVI0oWcTlucwuqE6aM47LRL1151hrxkPeHTYfwA6ySGPxBs6KcLH/aGMav8yQXf
         qzM1RgLEn1ugMjXRKFSZ7hA0YUgn2K31yrscelhCqhFEvcH5bNQDAz/74312j9TH5UfH
         1EKesl3KWRLu/aYUIzq5yQxHxnR4gyFgC6stZjOuEQrvgBM/FqAlWspUDPeCjOKfgnD6
         4oDA==
X-Forwarded-Encrypted: i=1; AJvYcCWx7bkwm2KA8VA1aMnx9cL/Rdhf4QSJ2KWYCCVph1/wg8MFnMZ1BTfsSfFoBmXVJ/TbQb0vVyr5Eh2OGw5M@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9ISrk+W9dCxMIKOkdVWwsfM51kIMbrpg/H6qARoQn3T3exg1B
	n7HxHxzScEt4y0kDCah9olFuLltqZqx/p/zmIg9PeesQua8g1v+ZERMC
X-Gm-Gg: ASbGncsCsOjAb1PX74yhqvhCflic+Hlu8tv3eH7OUtXhgQZrHAfV8/dkBvLUnnXL1TH
	CwPHxPYgAMZxX12abpxys+dv+0SbMo9HN6+UDubhMPfDi6swhRCauMAQagCzZpQUw9IXk07DlGR
	9NW+hjp9MeJ/c8srguoPtLY/H8wANx53WRA0ALLxjmrmuiAg1n7xzoaqjCWuAwBRtbVr3SNy+BX
	/G0RLi3mdu211G82XB1D9CV7OH4SfY3sO5vDiKF8w0N8ohydNZOwwhogCYR2QLPngt38XhOUYia
	vT3vqBBNxutJ2cvEdsS3UDVAj4wNlOMwErXSTU4MAk164b14QuTVFI3VD4ALUsE27hJdMgHod99
	vkIfoH7eCWI1mDirlb7enVYmebw==
X-Google-Smtp-Source: AGHT+IF8QpcsQjg3wQz9UpkXvukBigrUxbie1Cl/dEgUT/7krFaNF7F4bkJeHH7UN63rH251d5SH+Q==
X-Received: by 2002:a17:906:c10d:b0:ae0:a590:bc64 with SMTP id a640c23a62f3a-afe294c7236mr550080266b.18.1755953019782;
        Sat, 23 Aug 2025 05:43:39 -0700 (PDT)
Received: from tumbleweed ([95.90.184.246])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe49a1f5a6sm165076466b.111.2025.08.23.05.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Aug 2025 05:43:39 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 05/14] staging: rtl8723bs: remove bPseudoTest from Hal_ReadEFuse
Date: Sat, 23 Aug 2025 14:43:12 +0200
Message-ID: <20250823124321.485910-6-straube.linux@gmail.com>
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

The function Hal_ReadEFuse is always called with bPseudoTest set to false.
Remove the pPseudoTest parameter and replace its usage in the function with
false to reduce code complexity.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_efuse.c        | 2 +-
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 7 +++----
 drivers/staging/rtl8723bs/include/hal_intf.h      | 2 +-
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index 1079e2bc3287..388d885c938f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -271,7 +271,7 @@ static void Efuse_ReadAllMap(struct adapter *padapter, u8 efuseType, u8 *Efuse)
 
 	EFUSE_GetEfuseDefinition(padapter, efuseType, TYPE_EFUSE_MAP_LEN, (void *)&mapLen, false);
 
-	Hal_ReadEFuse(padapter, efuseType, 0, mapLen, Efuse, false);
+	Hal_ReadEFuse(padapter, efuseType, 0, mapLen, Efuse);
 
 	Efuse_PowerSwitch(padapter, false, false);
 }
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 4a0423182f9e..002648a8fd81 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -883,14 +883,13 @@ void Hal_ReadEFuse(
 	u8 efuseType,
 	u16 _offset,
 	u16 _size_byte,
-	u8 *pbuf,
-	bool bPseudoTest
+	u8 *pbuf
 )
 {
 	if (efuseType == EFUSE_WIFI)
-		hal_ReadEFuse_WiFi(padapter, _offset, _size_byte, pbuf, bPseudoTest);
+		hal_ReadEFuse_WiFi(padapter, _offset, _size_byte, pbuf, false);
 	else
-		hal_ReadEFuse_BT(padapter, _offset, _size_byte, pbuf, bPseudoTest);
+		hal_ReadEFuse_BT(padapter, _offset, _size_byte, pbuf, false);
 }
 
 static u16 hal_EfuseGetCurrentSize_WiFi(
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index 67d51e55bd44..2e97a918445c 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -267,7 +267,7 @@ void UpdateHalRAMask8723B(struct adapter *padapter, u32 mac_id, u8 rssi_level);
 void rtl8723b_SetBeaconRelatedRegisters(struct adapter *padapter);
 void Hal_EfusePowerSwitch(struct adapter *padapter, u8 bWrite, u8 PwrState);
 void Hal_ReadEFuse(struct adapter *padapter, u8 efuseType, u16 _offset,
-		   u16 _size_byte, u8 *pbuf, bool bPseudoTest);
+		   u16 _size_byte, u8 *pbuf);
 void Hal_GetEfuseDefinition(struct adapter *padapter, u8 efuseType, u8 type,
 			    void *pOut, bool bPseudoTest);
 u16 Hal_EfuseGetCurrentSize(struct adapter *padapter, u8 efuseType, bool bPseudoTest);
-- 
2.51.0

