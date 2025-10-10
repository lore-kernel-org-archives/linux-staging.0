Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D4C20A5DD
	for <linux-staging@lists.linux.dev>; Fri, 10 Oct 2025 18:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760122511; cv=none; b=eQUjqUcAqciyaTZa/DTDuNlGy4JZh+P+xUDnR4f0S3fk5mE7qHqHqkXcW1OKXVT84zjua09r+LtqSF39y5w+xqC1DH8WcOJ91vUs2ZNege4O/OJ3AXmPPVrj5MgYuqAEM+HrlwWyCrjjQkxSzZj97aGlBrUr7lB6fmXVXLraX+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760122511; c=relaxed/simple;
	bh=qahg4N6BzokiIUngztu2WrxRTDDc4/q2Z0s+8sjejrg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T+RK7jTSoit75D3qzMfUuVDb9nktkqeSl0iCuTRY2c3vLxSsjvpPNdC2B4GMO9ptWwgUyT2U/5AAZAzF1YfDRWhZd8Q4c+xQsmxz/A6TqdP91JcJF6Q+hwdcpRxqndTGC2OQ7TGVKy3/uevEHKG4B3v71Y6s13ELZpVGL4ZL3VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZWawW/wp; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZWawW/wp"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-793021f348fso2288664b3a.1
        for <linux-staging@lists.linux.dev>; Fri, 10 Oct 2025 11:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760122503; x=1760727303; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NWoSzjh1fyMpZJllg9eYh+eBr2MZ//XchSf7cCFYHiU=;
        b=ZWawW/wpRv29NVjZmbytwbU5wOApC2w3Pp8jnBUfsadF7Wv4kIZfKrL0fzmQ35sxF3
         6DPZmC4+tKQrdlwJiEe6gkb1/V2gdZqRKzW1C2mtIBkCJzyx/MupVTgLzFF+7wgvUk2A
         itDHUsqYYkSEHRVmLvut3J5bMU7hdbHFp1TWB2cRxksuLLGhqMafwtybniacAMi+rTaG
         7DUK/nfZjsHTCtlf/jL+yymAMoMzjMkD39M5sQoB/GEF3lD2ISrDMmDxEMqPvzONdk7/
         aZvD/+ijAk4NZ/d4Qhl6EMAXVaOA+vcu+RBCFt4PZBhiA6xFS39sI5YcthqcQfFslMgP
         hrNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760122503; x=1760727303;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NWoSzjh1fyMpZJllg9eYh+eBr2MZ//XchSf7cCFYHiU=;
        b=VmtBl81L2NH2yz8ymLfVYRX8D/PDoQ3nILsHxVsWugOvOO5jgwX37zvElpuuRG9RFu
         J/C+KtpIlVhKZ44KLNtAP2B56nfL+O7KdDp7y3ECmibpvXZ+k4797jKqWVUC/0B+Ij7I
         kHlp+k/+VnNf68eh5AaAsRqC1cQkEH78Hwhiz6u2CQuT5/6w+mTchd4/np7OqQzhqXDI
         R/NVEuiDsUPuX58nv8JvuvOvU5J1adqeQ/O5VsiaQJFXDISyqpA5WkIYYY3YwpBAi5Eo
         +510wAZF4zxeIAvYQJl/7cBC0hHW/Yxbxq8rxQP+kfQBmNvXP7Oc9XnZrPcE/6y9zJ2x
         iFpg==
X-Forwarded-Encrypted: i=1; AJvYcCVnGHpuYmHiKfzPrufZZq2MyEom31q1R42xab6v9dUjicfod05FMy+4KhwyuZELsRJiycJ6A74Or8yrmpiv@lists.linux.dev
X-Gm-Message-State: AOJu0Yxd0qFzQG4Yuz8+rcmh+PA6Y4HUsLqRJ/NOtFj1WH7Gs1mHCSlc
	gkzFLxTCfXlcT/gnEFFlqCH9iGGLNu0wg3pYI09b8R7yNeyb8J30Mvqo
X-Gm-Gg: ASbGnctDGfC8e3tHsR3uH58l3DMd89vIRmfkdGOeXTUQlheip0nxnVgISC6qxoImyL8
	Xzcg+0gI+zPk0BNp+X4oOevXE0nqeWHFxliQiG5eEaMtqRXkMWBFvIKfQsRBU/VZXuBCKS1CWy1
	tjrFNxZ2y5dUwZlSwIeeWsVTo7xM6AIFeL1vRPDz5SH97m/JM9bzUavWe6QogLTayXQjXLDIYul
	474nBudGcObH6+9hCNPlDPsmo+XfDyAddN5cpuj7Tj5maE3WsN/1IkdBwV0wyDmwwJ0Z+imKRTy
	tRS4A+CeR0QU6fNLbzFxvHRZXlvUAmi0dZi7GfX3l0A6EUB6X1Dbgq27ZzQB6hlHJWMfY+6YKnW
	CbHn8/KELserhKwjOVGcj0pOePTyonStZZQnCdXMo0siRn1gc7hO/hiuptoVqTSgq
X-Google-Smtp-Source: AGHT+IHB0rF5y61Mc6/ergahfN2ZDy34ebQEHJ9mYi5p+LfCq49osvAzf+LrBUXfLqmK4t9OgN8guA==
X-Received: by 2002:a05:6a20:3ca2:b0:2f9:dc8d:d2a1 with SMTP id adf61e73a8af0-32da817f74dmr18195270637.21.1760122503244;
        Fri, 10 Oct 2025 11:55:03 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:860f:5abf:20b2:7217:3f90])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b63e05csm3739887b3a.22.2025.10.10.11.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 11:55:02 -0700 (PDT)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: gregkh@linuxfoundation.org
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: remove todo/note and duplicated EFUSE_CTRL macro
Date: Fri, 10 Oct 2025 15:49:12 -0300
Message-ID: <20251010185456.26754-1-rodrigo.gobbi.7@gmail.com>
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

If my interpretation is correct about that comment, I`m think we can remove the
note/TODO since it`s very old. Also, I`m removing the duplicated define, since
the hal_com_reg.h is already included at rtw_efuse.c.

Tks and regards.
---
 drivers/staging/rtl8723bs/core/rtw_efuse.c      | 3 ---
 drivers/staging/rtl8723bs/include/hal_com_reg.h | 4 ----
 2 files changed, 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index 208373113a62..6391932e214b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -26,9 +26,6 @@ u8 fakeBTEfuseContent[EFUSE_MAX_BT_BANK][EFUSE_MAX_HW_SIZE];
 u8 fakeBTEfuseInitMap[EFUSE_BT_MAX_MAP_LEN] = {0};
 u8 fakeBTEfuseModifiedMap[EFUSE_BT_MAX_MAP_LEN] = {0};
 
-#define REG_EFUSE_CTRL		0x0030
-#define EFUSE_CTRL			REG_EFUSE_CTRL		/*  E-Fuse Control. */
-
 static bool
 Efuse_Read1ByteFromFakeContent(u16 Offset, u8 *Value)
 {
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

