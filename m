Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001B02076DE
	for <linux-staging@lists.linux.dev>; Wed,  6 Nov 2024 18:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730918046; cv=none; b=J53kDJbDuYqzOUcJ4znJD8XbcsU4KnT9K97cKALw3/a0lqnQmVCcPqFnOoMoUwJykFW33Oiy0ydRUdfqVKKmIqId+/zwLuOzeYKBqH0gVTAoYvGclAqEfvPj7PyIBxSREoJ6G5PEbvRBR0iFgtdVZIA/T9UScQ3mNf9fi1Wtm2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730918046; c=relaxed/simple;
	bh=hBUxEv3qbO/9OB1qQM4GecNfPwIPQArtUwXtuauAVKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YwBGSzkeu8XEqaZqxHc+kbwgvoNGcmwdMMRe1OK11g1O2+kCbIm3JOrfd+enHt2V5uNhgwffeZc0TrjJBmyxrGvaiWkMUtMVdDKrXLdJxLzgbHs0xr238JzOyFuGVLvPUB7CDxNdC7rVjZnoBmZBMhgTzSjAhl/kGuWKRvljdnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nLQEXmtm; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nLQEXmtm"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a7aa086b077so9772166b.0
        for <linux-staging@lists.linux.dev>; Wed, 06 Nov 2024 10:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730918042; x=1731522842; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lmkiHjgr2PxF+ocYxD6zDhmu1c+VcNka7RApTzQc14s=;
        b=nLQEXmtmaWZKAV8O8YAKeCxGgLSqZbY7D2Lu4Ar/gHM3s6CPn67sISrln+W7HRjKWg
         uMCpXy9DMcKf1KggjPVA8TUpLDLEYeuinYRCkjiOHyv+KOm6F7CkmFk8ZjW0H0lsj2kt
         K4vWHz+7FcJm7M/ObrggoJYdd4aarbvjJIA4ziPa6Kg4FxR68ZGAfbd5K6Snm0t+rPgW
         NH3WAkbSKDeJcOP73JTbaGVdI30IS6R5FcN8JaQV1llF3EszaEFjKXXYjZ23t1of1F2t
         d80U5FcOvWpO91lg9nXZsUVFY15QHM0u5o+D2cn+TVVnN3ivJEQoadYQMndoXihJzZ++
         t1Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730918042; x=1731522842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lmkiHjgr2PxF+ocYxD6zDhmu1c+VcNka7RApTzQc14s=;
        b=Gz+JHNCtWESzFX6YfaKAUZ5+WCtkgMmEJdkDzuEU3PxKlTfVnndQIP9h+VKL2IlSo2
         y1J2wGJdaPfOLhvx01xf7tlwXeIojBm6NuOq+Cyi+0wqUi6DxkdAyN1K/ogS60ipM9lL
         JS07gropCsgipzYieBSHL216OTzLI/DP8IkYuZIQs1X+/fXdIVLdoVcB95+WpV/Dcq4Y
         mERnTEExrTIe8Y0yS5eLsNe5wkislFM9cRun2kyHIXUitG/CVPnzeWTNeGP6Ny1zljVe
         mOE9JvA0G0z1J1U/Bl+F/vZ0eeMfCXfWOh5MdT2W3GEdwNij9DSB3mCOo59KTTJQfg/v
         rEmg==
X-Forwarded-Encrypted: i=1; AJvYcCUOWMFS8GxE7q+cq0rHq5Iap1LARo7EZUFPELVn3lvXSEiZ87VljwgXFqTsjVDtEXxJFiWIfel92CKfn+VS@lists.linux.dev
X-Gm-Message-State: AOJu0Yxab94x7tyHSTCOUFudfqXxGNKHRZ1PuTO/5dTyxl4ux6KPL6Hh
	YjvrMFLwGzWMRBqzF8lw5USSm+B+Iqnmxus599ztusna/fVYnAec
X-Google-Smtp-Source: AGHT+IEp5BaNpq8XkNY3ZfxjAdH9fkFzSbcmwNJDPcu5Ly/IEQRNCIg5pGEllGddL9MyK0lFZPW3Gg==
X-Received: by 2002:a17:907:608d:b0:a9e:b5cf:df02 with SMTP id a640c23a62f3a-a9eb5cfe797mr680578066b.41.1730918042214;
        Wed, 06 Nov 2024 10:34:02 -0800 (PST)
Received: from kernel-710.speedport.ip (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb1813a07sm315298966b.190.2024.11.06.10.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 10:34:01 -0800 (PST)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 13/16] staging: rtl8723bs: Remove function hal_EfusePgPacketWrite2ByteHeader
Date: Wed,  6 Nov 2024 19:33:42 +0100
Message-ID: <58b682a5ecc0cce08dfdbfe20690eea47efebf18.1730916582.git.philipp.g.hortmann@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1730916582.git.philipp.g.hortmann@gmail.com>
References: <cover.1730916582.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused function hal_EfusePgPacketWrite2ByteHeader to shorten code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 55 -------------------
 1 file changed, 55 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 9231a4bffb5f..c6cd0f11cd91 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1183,61 +1183,6 @@ static u8 hal_EfusePgPacketWrite1ByteHeader(
 	return true;
 }
 
-static u8 hal_EfusePgPacketWrite2ByteHeader(
-	struct adapter *padapter,
-	u8 efuseType,
-	u16 *pAddr,
-	struct pgpkt_struct *pTargetPkt,
-	u8 bPseudoTest
-)
-{
-	u16 efuse_addr, efuse_max_available_len = 0;
-	u8 pg_header = 0, tmp_header = 0;
-	u8 repeatcnt = 0;
-
-	EFUSE_GetEfuseDefinition(padapter, efuseType, TYPE_AVAILABLE_EFUSE_BYTES_BANK, &efuse_max_available_len, bPseudoTest);
-
-	efuse_addr = *pAddr;
-	if (efuse_addr >= efuse_max_available_len)
-		return false;
-
-	pg_header = ((pTargetPkt->offset & 0x07) << 5) | 0x0F;
-
-	do {
-		efuse_OneByteWrite(padapter, efuse_addr, pg_header, bPseudoTest);
-		efuse_OneByteRead(padapter, efuse_addr, &tmp_header, bPseudoTest);
-		if (tmp_header != 0xFF)
-			break;
-		if (repeatcnt++ > EFUSE_REPEAT_THRESHOLD_)
-			return false;
-
-	} while (1);
-
-	if (tmp_header != pg_header)
-		return false;
-
-	/*  to write ext_header */
-	efuse_addr++;
-	pg_header = ((pTargetPkt->offset & 0x78) << 1) | pTargetPkt->word_en;
-
-	do {
-		efuse_OneByteWrite(padapter, efuse_addr, pg_header, bPseudoTest);
-		efuse_OneByteRead(padapter, efuse_addr, &tmp_header, bPseudoTest);
-		if (tmp_header != 0xFF)
-			break;
-		if (repeatcnt++ > EFUSE_REPEAT_THRESHOLD_)
-			return false;
-
-	} while (1);
-
-	if (tmp_header != pg_header) /* offset PG fail */
-		return false;
-
-	*pAddr = efuse_addr;
-
-	return true;
-}
-
 static struct hal_version ReadChipVersion8723B(struct adapter *padapter)
 {
 	u32 value32;
-- 
2.43.0

