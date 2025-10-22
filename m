Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BACF287258
	for <linux-staging@lists.linux.dev>; Wed, 22 Oct 2025 22:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761170615; cv=none; b=LfE9RS7SEEvWgq3teyP2S+k2SmYBd+BkyNMxuGW5LUDgn/9RpiWbs/SRWya+xoiT5Y3mVSLjP1CtDNy+5RANfhIRQ/R84Hvxiy5rGbABH9410XVqCSmENVIxW4z9/w6YEOhKhyCK++DCMhjVA+kkU5BWt+c/UxJD6t67W6NzyFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761170615; c=relaxed/simple;
	bh=Ad2cCbxg4Z1sO77CXRzr3tWjUJufZzDngeFPn5U+ARc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HJFwZvePIcvTiZ6M3/+nrUbvLzgfabwUDxzDV/AUVyExzmy21YsfK2MhcjFpuFj4kBzgAcmYIqwRKbzp4+ygCXXmvjS96UDTinjNLki1PjzZaGolGwwqrweB1Qscxwx1CyCJQV9zrGiVP/V5vuu45zahIp2HsfZ8m28cAhOtVug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ap82ON96; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ap82ON96"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7835321bc98so99821b3a.2
        for <linux-staging@lists.linux.dev>; Wed, 22 Oct 2025 15:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761170612; x=1761775412; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ux/kk3E8TaoNJw/zffvlizfWUNSIBjq0m1/nXej3Ft0=;
        b=Ap82ON96Ux2b3b45rHxN421F8qWV800rnBul06WiW7zNJBylTsz8nFCfW3hDEo80EC
         VkcfJ04TpTwcrmz99TLdBPHgcQt8Zljh0HsMnI8c+xDcbjTSiPsk01tAPsHH6U0MjP79
         qyyWlCF0bL5UEqBBq9Qmn9RD+WN3Z+JuaSrp8hVT7Zm7tyZVi8EJ/HvDl4s/hoB47x+t
         bXRMTh3SdUA5j/2qCj34VQ2jCOMxz6f+pWbd0y6TJPSQYoGzy+CScUD6YjXdEWKaYbFA
         192+Wy06AwgpmFmnYD4eYTDrfjFZYdwdtdP6+WFwIhQ+2qeA+DesRtn3YZyiAus5Dvyk
         0iRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761170612; x=1761775412;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ux/kk3E8TaoNJw/zffvlizfWUNSIBjq0m1/nXej3Ft0=;
        b=uYZI52GEGXM7tQVqmGXcL6Ir10nIIGfKOsW4HoDVR54aPvDrgRdoaYUGt7soDfLMLT
         /FAIDvbrsV4oqPrznWzemzy+O4lOZ2p7C5dEvgBxHvPxopaloBRNoCNeMmMBHEIdfATN
         PoUPz70ObJD2TX0d42vh/xLOB7DH1b8aapGKIUT1LXWJQq6AY1HHZzDbvgyxJcaGtpUx
         t31Ydrc+p5O1qnQ2qKBwCL1g0qHxEM8hUlE4uoG+2fENaZ3sL0uS2b43p9vJOnCSSSCb
         HYiqmDO04AjVj5ju+g/u4Ikp5PCLqX6qe7k5IIciZw68U/WSxDptRS8qDZgaXv1pbH09
         ruCg==
X-Forwarded-Encrypted: i=1; AJvYcCW7RN2kSGGF1cHLIQJX2T/8soEbdza9UleCNgdtiLaPRILr0LAI0MxNheSQIBScWEmOYbzVI9IlhFPWSO3y@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+41rITvmaBCekJTrYAM6hjgQe0XDYz1EBDj370HB9z1T3UsHd
	q8Vul3iKU2wmyMKt+NSpgG2NuLjxX8SMM1N+CFKGek9ud7E5KTgf+T/Y7Kb5J17D
X-Gm-Gg: ASbGncvkMv0znYfnq4dCbixpavphcrNXkqjjJnL4D2DdF6l2fEaqZRvSTbEXj6Jc7py
	hwFZVchHwKFwdzW2muHzvzw8SvVv6UEJO/52Nji5Ys68nzopH1KeMeRj6CyId428fwLYlfJJdcG
	7kJV+3DySuBOPlCfGyIKQU8qfUHzhYBYefdxP4sgNwQ0dJYRDeDNArjEhEo54nWXC+woIyus27s
	WcrmIiunEaTITD3hAtKSXbuA+2QhKlVXOpeBOU/FBtj/avamW8vJJLdVhHCViNO8C5c0g9DY6AD
	p/zdgFC/as45Dv2TYlu3hZIGQ7ZkRUx2OQbN4JV7tzHGJGDV9DBJ5DGsC/8YcESS/T9TSDdo87p
	UGTcYWUyFmHsVFG2sLbRIgYvtpRHDwYcvvTvwLV4iXaorg47t6OhCDL1j8bJX6ux7YV8rYsj8KO
	nF0UhJZHHmqfUmLCnnqKSftZQ=
X-Google-Smtp-Source: AGHT+IHOKCy2DH7KAv9trRUhXlwgWDwBolG+BUKI0eV1iSdxSWzMfxG2dEL1k7vkjKTfjuYp1ROHGw==
X-Received: by 2002:a05:6a00:22cf:b0:781:1481:897d with SMTP id d2e1a72fcca58-7a220b16cd0mr31471379b3a.17.1761170612295;
        Wed, 22 Oct 2025 15:03:32 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:860f:a014:6e9f:df59:b010])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a274b8b350sm261181b3a.37.2025.10.22.15.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 15:03:31 -0700 (PDT)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: gregkh@linuxfoundation.org
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: rtl8723bs: remove todo/note and duplicated EFUSE_CTRL macro
Date: Wed, 22 Oct 2025 19:00:51 -0300
Message-ID: <20251022220324.14260-1-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The usage of EFUSE_xxx and MSR macros are already in place, so the note
and todo about that can be removed. Also, there was a duplication of the
definition of EFUSE_CTRL macro in two places, keep the one at the .h file.

Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
---
At drivers/staging/rtl8723bs/include/hal_com_reg.h file, there is the following note/TODO:

/*  TODO: use these definition when using REG_xxx naming rule. */
/*  NOTE: DO NOT Remove these definition. Use later. */

#define EFUSE_CTRL				REG_EFUSE_CTRL		/*  E-Fuse Control. */
#define EFUSE_TEST				REG_EFUSE_TEST		/*  E-Fuse Test. */
#define MSR						(REG_CR + 2)		/*  Media Status register */

I guess the idea was to standardize those macros rather using the REG_xxx_yyy ones.
In fact, when searching for a missusage of that, there is none, only a duplicated redefinition
of EFUSE_CTRL at drivers/staging/rtl8723bs/core/rtw_efuse.c.

I`m suggesting to remove the note/TODO as well as remove the duplicated define, since the
hal_com_reg.h is already included at rtw_efuse (included indirectly).

Tks and regards.

Changelog:
v2: rebase
v1: https://lore.kernel.org/all/20251010185456.26754-1-rodrigo.gobbi.7@gmail.com/#t
---
 drivers/staging/rtl8723bs/core/rtw_efuse.c      | 3 ---
 drivers/staging/rtl8723bs/include/hal_com_reg.h | 4 ----
 2 files changed, 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index d5c53b614f61..98b15ca10074 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -26,9 +26,6 @@ u8 fakeBTEfuseContent[EFUSE_MAX_BT_BANK][EFUSE_MAX_HW_SIZE];
 u8 fakeBTEfuseInitMap[EFUSE_BT_MAX_MAP_LEN] = {0};
 u8 fakeBTEfuseModifiedMap[EFUSE_BT_MAX_MAP_LEN] = {0};
 
-#define REG_EFUSE_CTRL		0x0030
-#define EFUSE_CTRL			REG_EFUSE_CTRL		/*  E-Fuse Control. */
-
 /*  11/16/2008 MH Add description. Get current efuse area enabled word!!. */
 u8
 Efuse_CalculateWordCnts(u8 word_en)
diff --git a/drivers/staging/rtl8723bs/include/hal_com_reg.h b/drivers/staging/rtl8723bs/include/hal_com_reg.h
index 9a02ae69d7a4..cf5c15dc2bfd 100644
--- a/drivers/staging/rtl8723bs/include/hal_com_reg.h
+++ b/drivers/staging/rtl8723bs/include/hal_com_reg.h
@@ -189,10 +189,6 @@
 /* 	Redifine 8192C register definition for compatibility */
 /*  */
 /*  */
-
-/*  TODO: use these definition when using REG_xxx naming rule. */
-/*  NOTE: DO NOT Remove these definition. Use later. */
-
 #define EFUSE_CTRL				REG_EFUSE_CTRL		/*  E-Fuse Control. */
 #define EFUSE_TEST				REG_EFUSE_TEST		/*  E-Fuse Test. */
 #define MSR						(REG_CR + 2)		/*  Media Status register */
-- 
2.48.1

