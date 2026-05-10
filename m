Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C90A2836A6
	for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 06:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778394807; cv=none; b=UpYB3PjSxIoHNQtVwtzAqm0xMhV7FYa/WxHLnGQJdDgJwsoNEPEfK8nVYIu29qmZ3XyEIFGBHkqU7FsA2mTJMy7h5/9cYMrWS4t3QK9OdKFyW4R/BRvAjH1feh5NpfwZf49mM9ny3sadkA2vovcQylVbUAfruMK1dMYfBflM2TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778394807; c=relaxed/simple;
	bh=tfxHWNX/YKjXKtxhdV8FXSm1Z5M4CJxYa+O48dpnGwY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hG7aO0nUqgMX9EqkeO9ZjkMm28KvRK67Sogj43GB32K4cEUyOiANdamikWvxPOcPPoEHHIPE7+sBqJQGPJPwFpZpSqafXXP/JLjXllhzdB8K2ku+QY86C9ZMWQgjd0oSzM9XxclVyCn3S4qBWVv7MVmlOhR4ZQxp+ADj3HRm+so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H9piEgHT; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H9piEgHT"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2baca78cfaaso22250305ad.1
        for <linux-staging@lists.linux.dev>; Sat, 09 May 2026 23:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778394806; x=1778999606; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4omzytCfkMsnieqo+OfTHvnc9JUer9I14cQu6zl2YFg=;
        b=H9piEgHTy1tz/tgFI0NhrCKsczIIzqGXx5U8zuRW3Rd8u0M8vviJ9rFEgHIunEp9hI
         4YbwTIXuP1b2rmKZmdUGrn5Yi2YMyCrAbfP4XTtETL/8jSEU0czLkYE3RVZC9sLl56dL
         Wxz7IjOyTxI20Htol0+aCpuFyWTMJBpZPXPcixs/5MfqYqGcX2hw4y50+12P2Z8HJ+17
         26wWX2YFreG0RgqaUpkjoikCM4eSXhrcl1+Ec5VdETuaOypE3/gGd6pT0fVIpk8IfS9E
         8K3vsGpyNmIvG1IQ7NWIyrS1aHXgwoVnD0c4w4PBSSTTGdga70TpN30AmRgxWe0q53kn
         7vLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778394806; x=1778999606;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4omzytCfkMsnieqo+OfTHvnc9JUer9I14cQu6zl2YFg=;
        b=ReGxtg2Vs7Mcvj3KUGfEVuZSO5w1DTgMIF5sdZhKnII4Y5FLm3kfrBrkb3uLn0Mb3a
         AhETARe0B1NSk+wUK648WLFWvd2ni1rfYojid60S4ZKZk3abWEcFcnNd19V1E3MEG3mv
         S4L7tKFJ106GN2JgqcAaE4hWGFkH2GE3gyNgy0GqcX36Hi6hD7RFHNOae7tcsWgRVKCE
         fvzooYjwHkDdaGvv0vwvpx00lDn+ym+Z0zilKQVHWB3Cwsg69PtqIn8L2ugCNDIZoyb+
         5iJ2k1oJPmPgy8Lm5KH6iTwHD09K//EtSVOKp4/He1vA19H1wThELGQaflxkV9gpZoJC
         VnaA==
X-Gm-Message-State: AOJu0Yy3DD64Wlq9wjhBazxdoBGKcbVWx1gTofoDdS6MszAfxXx3+UD6
	9cBblZipNvqqZrQndoFntD1DcbRsHxsvBfqhaFxMccSqHx477Wm8fnIj
X-Gm-Gg: Acq92OHDdWGpNfOrC3iJVGUJ6/5l2OD8bp6fTve9VzbvqiwdXJlGseoW1ARNmYKeQMv
	y+VlHiCLNzjpvOwiUxDsbrzapdNlDCnqdbh9dBdv3X+6Q31Sz1+jMt2XdOhX79cYJ53o9HVqDaG
	oI8wHzfrTZ2Z1oRS3nebv7TR6K80skjmQzENXUgqXnnz6Gvxh4ffM6Byxl3lDdFphy/zWrlLm00
	FaD7UKR8ym2WEYXJP1EKlPYre7Qs/tePiB2pX3GpRLzAZUOpDvb8Ch8I3U0fnrGLlWYoVWrUexe
	pA0MEZlr/Iy4TBNKpHKe4YSsPMEcswKjIympRpi19Y0fbUtwIJiKX5mJF1i6xhXe82E+9idhSJ2
	uLiv2qDxr0nRMZaIL1J8GorETp6jOaSa5ALUzi5WMcDaZ7qiKnILRd/8wjN3mCyjNiPaFaHb8np
	67xYlkH6fXNp9HPwa6oyjEZ3cgXS6Z2LyEQ/lP9URqdm14miZJgzL+bsWWKV+PfHu2qgCfGBorr
	mc=
X-Received: by 2002:a17:903:13ce:b0:2b4:62bd:ee3 with SMTP id d9443c01a7336-2ba79c2cfffmr201519705ad.33.1778394805636;
        Sat, 09 May 2026 23:33:25 -0700 (PDT)
Received: from moksh-Nitro-ANV15-51.. ([203.194.96.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e66970sm67572315ad.56.2026.05.09.23.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 23:33:25 -0700 (PDT)
From: Moksh Panicker <mokshpanicker.7@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Moksh Panicker <mokshpanicker.7@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix coding style in rtw_efuse.c
Date: Sun, 10 May 2026 06:33:14 +0000
Message-Id: <20260510063314.34066-1-mokshpanicker.7@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the following checkpatch.pl warnings in rtw_efuse.c:
- Reformat multi-line function signature to fit on a single line
- Add braces to else branch to balance with the if block

Signed-off-by: Moksh Panicker <mokshpanicker.7@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_efuse.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index a7a636449813..b4e1b6efdc77 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -41,10 +41,7 @@ rtw_efuse_calculate_word_counts(u8 word_en)
  * 09/23/2008	MHC		Copy from WMAC.
  *
  */
-u8
-rtw_efuse_read_1_byte(
-struct adapter *Adapter,
-u16		Address)
+u8 rtw_efuse_read_1_byte(struct adapter *Adapter, u16 Address)
 {
 	u8 Bytetemp = {0x00};
 	u8 temp = {0x00};
@@ -76,17 +73,13 @@ u16		Address)
 				break;
 		}
 		return rtw_read8(Adapter, EFUSE_CTRL);
-	} else
+	} else {
 		return 0xFF;
 
 } /* rtw_efuse_read_1_byte */
 
 /*  11/16/2008 MH Read one byte from real Efuse. */
-u8
-rtw_efuse_one_byte_read(
-struct adapter *padapter,
-u16	addr,
-u8	*data)
+u8 rtw_efuse_one_byte_read(struct adapter *padapter, u16   addr, u8	*data)
 {
 	u32 tmpidx = 0;
 	u8 bResult;
-- 
2.34.1

