Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D94285CA8
	for <linux-staging@lists.linux.dev>; Fri,  3 Apr 2026 22:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775255625; cv=none; b=e208dTkI0ZO0svNaf2Sk4hoYDCTdemiG3kgr1Pc/bMWSbF4Y5nRD4X9x2j250ssUXEejRaVDhnH4dyy5CJKvIoU3MI+/7/Og7XNNrEaOb645yW5TN3MK2GK7qp33hJ6WH5QphnDZ6ZO6GzWB2XhuN5L+K3OGYR68XmiUp8G5i8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775255625; c=relaxed/simple;
	bh=hohUF/7ke7gONNgzIVu/Ti52s31i2FeyV2hmuTwh/sA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bAOe/5QOWWUd83XiBov3RIbml86Cq27qmyyQYmoGSZl10o7IsspMesSamPVvsZGELWx1t9rGdfzgNfg5f7nByWFobwTRTpKgLZdwH5bB2Hd9eVc+99JaaBBBa4Rd8Lgo4D8giVfqWM/agJPGHcBZyUDjou5DzEKz8fPXn54zYu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rkpiZtK7; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rkpiZtK7"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-38ddd8d3b7fso5097601fa.3
        for <linux-staging@lists.linux.dev>; Fri, 03 Apr 2026 15:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775255622; x=1775860422; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p62OwUStppW4mxj1XOBXaHr/ncA9MlcNmwvpDHHnKb8=;
        b=rkpiZtK7DF2kaeLPK9QRIZIUhe4RvvpubZji/LOWOu70i2l2iLyvdHAAgXXRYNOeVf
         b3ylLQ1MF02l8uceS6jtlBkkRaID2Nm2w5vDTY1NHCZpHdctdX+Ihcs5iw3Fr1h6FkwM
         /XBGHLA4dzNV1wFuYzHQaz7S2dJosfaz/6XUch3BK8ju93i510FTx6zM9+kOjjla5GjQ
         xLTb/vqtOuU0WZJZRVWKsFdK3h83LWfSzQFWnbmvbPT4NHyoE9JQ5uBpLPsKhbp7rMlu
         NyzBOg/fhmOhno7NixFDihWYYJhA8eVY/PQjFT6due2nUFP6bsLKTUG68QVImdc9UZxu
         dkeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775255622; x=1775860422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p62OwUStppW4mxj1XOBXaHr/ncA9MlcNmwvpDHHnKb8=;
        b=ofe/LPNfXMCZ3N1btfBGjKkarr0qPja10qbQ5fBjIlA9QRcZy8geIggeRovoEVdWpv
         taZcu5Ors4lJ91PYJ4axGK7s/MR3FicxbMkofU88BzMWQufe+5xhqXG+72bXdgFTmdg1
         RcirS4VKizuyyEhRpjuRIfD0Cn1STbIvJJ8c5f1XaD05VLeevvf8ulWhSwurkVjdNu0A
         0N1QZ7mL3HmGx4TtaUFCH3ytOppVUZ6wodPmMwxnWznsa9SPv9497aKlQQHptB3JDgrn
         nxDqzTaZmpAewmliQggv1tywxINh9zYv6/7wXqL+UaVM0Vznaxz7ZJG1OdcwqdGw6ecG
         bqIg==
X-Gm-Message-State: AOJu0Yy0kdbpycSJMlLUysV/GitPv72yYNDQDtKVKa1YD7oQPn9rIMZM
	KzGw+8GnmqwaIFLnQgBJDoaMg/7tY2H13JQ0eqovg4lAF5jHAH3UrkYi
X-Gm-Gg: AeBDieu+4I9Lmf0reBErrTKAB/eel88DSam8zY3HzyjtWonSu0noGoGLTpZWNm/r7YH
	0/gQbJkE3mruOzzd6r0oWZ+4XmzGuARrCs9PccNv4+vks69o5VwUSaJHmCNEmoT21sS+dl1z2zo
	ek8SrNzGpddkdchZOIdJNmVbwvv2i/rM8vD5d4sxU8V+isqA8c9xyX/hoZvmg/5XYAgSkFMj+q9
	9dQgESfs6WoG0gB/ZZOFkd6tEaamqYlvLWh8VzcvqJTTbX1HdUh+lINWqenCwGJ5F2FkPe7LqFz
	yo3z5JAMkMH4qp5o2b4GV7YPeWV8KqAd3kFC+3QLzND+v8jP0O/cbU6ISZANcldBaDJrM0z+H6y
	AtYFhkLQdYA5M1lHnHe9HplQRek3zAEEsoDCJGyeaRme5A8ExxAE/rnz9/2CvWSZlTFRVdB8fvi
	6fm80/mW+MgliDpkeIzbNX1bySY9jebCouLy92DZpJqNFpCwMUt2No
X-Received: by 2002:a2e:bc27:0:b0:38a:5402:a9e9 with SMTP id 38308e7fff4ca-38d8d37ac6emr13561411fa.5.1775255622025;
        Fri, 03 Apr 2026 15:33:42 -0700 (PDT)
Received: from localhost (94.191.136.33.mobile.tre.se. [94.191.136.33])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd2108b63sm14536121fa.27.2026.04.03.15.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 15:33:41 -0700 (PDT)
From: Linus Probert <linus.probert@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Probert <linus.probert@gmail.com>
Subject: [PATCH v6 3/7] staging: rtl8723bs: rename EFUSE_Read1Byte() to rtw_efuse_read_1_byte()
Date: Sat,  4 Apr 2026 00:33:23 +0200
Message-ID: <20260403223327.1831215-4-linus.probert@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260403223327.1831215-1-linus.probert@gmail.com>
References: <20260403223327.1831215-1-linus.probert@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Renames EFUSE_Read1Byte to rtw_efuse_read_1_byte in order to conform to
kernel code style.

Discovered using checkpatch.pl tool.

Signed-off-by: Linus Probert <linus.probert@gmail.com>
---
v6: fixed typo
v5: no change
v4: distinct subject
v3: created

 drivers/staging/rtl8723bs/core/rtw_efuse.c        | 6 +++---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 3 ++-
 drivers/staging/rtl8723bs/include/rtw_efuse.h     | 2 +-
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index a7b120cc70a3..d6212b3b0b1d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -26,7 +26,7 @@ rtw_efuse_calculate_word_counts(u8 word_en)
 }
 
 /*-----------------------------------------------------------------------------
- * Function:	EFUSE_Read1Byte
+ * Function:	rtw_efuse_read_1_byte
  *
  * Overview:	Copy from WMAC fot EFUSE read 1 byte.
  *
@@ -42,7 +42,7 @@ rtw_efuse_calculate_word_counts(u8 word_en)
  *
  */
 u8
-EFUSE_Read1Byte(
+rtw_efuse_read_1_byte(
 struct adapter *Adapter,
 u16		Address)
 {
@@ -79,7 +79,7 @@ u16		Address)
 	} else
 		return 0xFF;
 
-} /* EFUSE_Read1Byte */
+} /* rtw_efuse_read_1_byte */
 
 /*  11/16/2008 MH Read one byte from real Efuse. */
 u8
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 355167883f08..941c2ebef9e2 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1559,7 +1559,8 @@ void Hal_ReadRFGainOffset(
 
 	if (!AutoloadFail) {
 		Adapter->eeprompriv.EEPROMRFGainOffset = PROMContent[EEPROM_RF_GAIN_OFFSET];
-		Adapter->eeprompriv.EEPROMRFGainVal = EFUSE_Read1Byte(Adapter, EEPROM_RF_GAIN_VAL);
+		Adapter->eeprompriv.EEPROMRFGainVal = rtw_efuse_read_1_byte(Adapter,
+									    EEPROM_RF_GAIN_VAL);
 	} else {
 		Adapter->eeprompriv.EEPROMRFGainOffset = 0;
 		Adapter->eeprompriv.EEPROMRFGainVal = 0xFF;
diff --git a/drivers/staging/rtl8723bs/include/rtw_efuse.h b/drivers/staging/rtl8723bs/include/rtw_efuse.h
index b8cd9e694f56..7b78fd5e583b 100644
--- a/drivers/staging/rtl8723bs/include/rtw_efuse.h
+++ b/drivers/staging/rtl8723bs/include/rtw_efuse.h
@@ -71,7 +71,7 @@ struct efuse_hal {
 u8 rtw_efuse_calculate_word_counts(u8 word_en);
 u8 rtw_efuse_one_byte_read(struct adapter *padapter, u16 addr, u8 *data);
 
-u8 EFUSE_Read1Byte(struct adapter *padapter, u16 Address);
+u8 rtw_efuse_read_1_byte(struct adapter *padapter, u16 Address);
 void EFUSE_ShadowMapUpdate(struct adapter *padapter, u8 efuseType);
 void EFUSE_ShadowRead(struct adapter *padapter, u8 Type, u16 Offset, u32 *Value);
 void Rtw_Hal_ReadMACAddrFromFile(struct adapter *padapter);
-- 
2.53.0

