Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E1D10F1
	for <linux-staging@lists.linux.dev>; Sun, 17 May 2026 14:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779028716; cv=none; b=DbDPBSDkFIIt7y6KUF8blTbgdw5IQH7Ud0vpxj+IWbcWvbac8ZiXv87lnxPXZqATxEJol3r/lr+kaqF636khCzbcbEUL5gFcegGcCr1KRkKdknByhM2z7KGrPBddeO9cHie32xjm7K1uH8k10tRA9xBb8o0rSLoytCuWyfVOrLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779028716; c=relaxed/simple;
	bh=0zWGGdkvbcYDd+s0bY4oKpy+fugmU7wAK1NNafNgg/I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CVV+HuAmnaqqLc7v/vGShtix2i5Yi9Xxn2hTjv/QUWdIvZUD98ZPJxeluoAMhtKt2Ga23CbYnFCpwQp9LXmwjFHA3UgJuQ5tZL/iDU7xm0UHi+jGZeSvtSVpC9LAyjTXDt/0jdgCWwTLhb+azgZk7dxHWtgUePDgVSCuu7f17vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rKFUqrCp; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rKFUqrCp"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-836ebdeb969so536648b3a.3
        for <linux-staging@lists.linux.dev>; Sun, 17 May 2026 07:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779028714; x=1779633514; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6K7UeqDcDe+lUbm9oh9P7ROLs6JPUFfrpjQvkOPYIIA=;
        b=rKFUqrCpcOodRfFCppeW452Rlv4O9XigAEZGe3PijEw9qVaZ521A9CIgWFNaEYEfxC
         OxZaKCAf7BaNXkTU7so9FjlDBh5G+j6dpeDSSGW6voAPCAKreCpyXL4XHxznwImmPq00
         96VKGsGI+RrHgAT8JKXgt8l8+79f6EJxejkxbpAxTjHQwlfYN5hrjEnPPd7bjeTXtcVG
         o/AP1qdHTil1FkZDC29Z/d5RxaDvYllNxjkacPcCchdB0Fz/1zcysAIflzXQwsCyO/1f
         Cn0bWMtX5cFxnAs+gb8ungaxm7BckI+7ZvgBenc7BJv8o/Ns9byW4NEK5xpC7khzylAd
         BS9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779028714; x=1779633514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6K7UeqDcDe+lUbm9oh9P7ROLs6JPUFfrpjQvkOPYIIA=;
        b=rwGwWCZldioIRDP3ye/y+8c3PwwxsCq1ZFbE6mPCuiVvZmQCM2sLhPm8TdKKtWjZSp
         4nnjE8abMQKBDtwI3iz+Da0TMb9avV7r4ZXJGbr8ZWEE4v8QKu1jVrIAduTQm1ZVq2Ug
         OQ6oD7Y9Rv34YOHgp3pp1RYZuE0N/9EQY4IZiCT0ovE1NXMGCnIVM7jAYXQUhQgYmSvA
         VNRt+7qeI3WRfFaNpfyVIjKo5NO2QwF2j3fnG9W6mCcyAYLpv9ee3DF+W46ky+O4lDxX
         067E+f7alCch4n16M8ieP7aDSXznDuEAKf78oQUenVakUrg/nwSr/cuiJFaw1LxVvb5e
         q38g==
X-Gm-Message-State: AOJu0YwPR5i17He5xylNhDDaeuCnPd1YFIOQrhq+WE8Yf8tRqIZ1d7lM
	aIr7g85Rf9YSbHiTWEg/pzqRlX5lrWJYuf12GjwhaDxoU19rPM0cCYDWpZxNGB91
X-Gm-Gg: Acq92OEAR//x18M/QTyE/HNojaUNyAhZdjQfprboBeSi0HHGX0qyfRAyP1iwxyekeu9
	8i+xKyHnDvHOPXFBn2VbNloEW6/681334Hggsy1A2rjCl8Gh2WxvvDUiF2FM3a0vW5pGpPrKiTO
	HfGN5MA1ePj5qjS9ap28PxlVMcmyGz8SyLPY5vGqHxr88Zn9jzk6A3TsAH2XUAM0SzX0mxxtV5J
	CHS5TzCvcbEVp8+gGcxPBAoVrQCqIgAK1mtxB88Khpg+cO5XRApQasdXC9Umhw2QDxU/o3Z2/gW
	59bQpMJDdiA+0z7zbyfIkkI6VfF6L9XAIrfectYUFlmhnPViNABITCAL+e/sT1J3QGdwldT5no8
	O1gMHtEubAE454nYxiw5XE5CuqQiIkknRUXEwZKiFBNk3TRIMUr0uadRuIaNACNiP8h+/klBDHs
	TuUT4gDUleIBFmUNebXplt2C0i6f5ML07CH/AVPaAAXR0n8vabsmsX9pFdsPOMmJVd4Koc6yDf6
	NnBe/GKj00/HA==
X-Received: by 2002:a05:6a00:4b04:b0:838:127d:a168 with SMTP id d2e1a72fcca58-83f33c002d1mr11960491b3a.17.1779028714537;
        Sun, 17 May 2026 07:38:34 -0700 (PDT)
Received: from localhost.localdomain ([115.242.226.50])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f196647aasm11036887b3a.5.2026.05.17.07.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 07:38:33 -0700 (PDT)
From: Moksh Panicker <mokshpanicker.7@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	Moksh Panicker <mokshpanicker.7@gmail.com>
Subject: [PATCH 3/4] staging: rtl8723bs: reformat rtw_efuse_one_byte_read() signature
Date: Sun, 17 May 2026 14:37:22 +0000
Message-Id: <20260517143723.13281-4-mokshpanicker.7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260517143723.13281-1-mokshpanicker.7@gmail.com>
References: <20260517143723.13281-1-mokshpanicker.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reformat multi-line function signature to a single line to fix
line length and coding style warnings from checkpatch.pl.

Closes: https://lore.kernel.org/oe-kbuild-all/202605150301.7FuEahpv-lkp@intel.com/
Signed-off-by: Moksh Panicker <mokshpanicker.7@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_efuse.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index 2be74f2d4ac8..ef0cec40d388 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -79,11 +79,7 @@ u8 rtw_efuse_read_1_byte(struct adapter *Adapter, u16 Address)
 } /* rtw_efuse_read_1_byte */
 
 /*  11/16/2008 MH Read one byte from real Efuse. */
-u8
-rtw_efuse_one_byte_read(
-struct adapter *padapter,
-u16	addr,
-u8	*data)
+u8 rtw_efuse_one_byte_read(struct adapter *padapter, u16 addr, u8 *data)
 {
 	u32 tmpidx = 0;
 	u8 bResult;
-- 
2.34.1

