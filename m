Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C62A50
	for <linux-staging@lists.linux.dev>; Thu, 22 May 2025 00:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747874027; cv=none; b=hjUBZ+hJBy1WQ2cKXEFC+QKsvBOGu9MFMB9GVNbkuLQ3OrYocOJpKbLyO5vSsDrYAQloubj2+HYk9vWvggGS3qnidgm9iZiOFoWSPT4kP89xK3WDEOqo2H0ka4t6qu93oZ5IithD+NhFUVFn7JWg1Ior5Y3lJunhaGYQClQ7qzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747874027; c=relaxed/simple;
	bh=9WDWmbciPiw9ZwZ7jfIf604Dt4ZghrOpB00gmHmOrKk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cKD+qoJ5ZjtkycXnp8SphM4k5BOKK4LaTDq+WOk8pRGjZokkpKu5vv2GEBsvkloi7W6RNZt5pvp8lMHQ2UOgegEBMYWRcpI3ljQJRDDcVvARpg7/vjOkEQ3pDyqzh11XZufgnaNOj+C4ce1rHrr9wXVSvxGZ51HIvPKR+l6oeU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d37XE66w; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d37XE66w"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-70cb6744e1eso51311557b3.3
        for <linux-staging@lists.linux.dev>; Wed, 21 May 2025 17:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747874024; x=1748478824; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5be0pJqrV4kUYpz3rwnukSBU4EkOBXt7QJ8172KXPF8=;
        b=d37XE66w+NgynT/Ctf9bM3IHXlXGAG3fX/CzL6YtnuhnxJiE2qmjtFCqtHRt5dmF8f
         P5KS+hwtRguAlck+QscoCC8lHTwqSr84RZP6/bf4cfWR5pjG0Ncg7zkc1K9TaoBtNrIU
         aCQj3gcDcBb1tYcUTmuO+bIY7C++FxcigTjUXTRq6ma4TY/qdI2sE4IX3KiQetbBKtZW
         q6Exa7XmRN3E2XjflXYI70HuRCtYMvyDqgeXj1Cm5Nm8nsM6ZFMW0N6ua/wvxsfRekSS
         N1BZANacKVFTGTtCDt2XRyhfGBh9VU/B/IzQ9gboAqFYQ19eH0Y1y9uFeBvv2GCyGQCI
         9nbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747874024; x=1748478824;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5be0pJqrV4kUYpz3rwnukSBU4EkOBXt7QJ8172KXPF8=;
        b=MwcIoRkCyHDnlelowClPBsptueMjSIt20/3mSXY9oJeTN9jJJfKFa+5uePkVz3O1u/
         Ukc4Hhw8PDJTf42NAxc7riUgue11k+WnWQUBpLmZNPKiYyrx/nsS7n7boXaCwZzIkaJF
         Ge3fVy/OnBIbDPnY5qk1++lU9mlhE3N/D5zX6mHCQgTuXpA53mMeY40bhba/SUhdYQhg
         nUuDjvE/oKJxonSRsXIpEYN58lMGPJ/+kC5x9Uk+0S5bPp8z+eFz5iIyMCXA1LP/S2x9
         Urzi1h7vzBQdD+C/0kx9tTIsgQoCdbIsPqRD42jewYSZ/dQvmW0/yVNrB+89CEl64vfQ
         9fyQ==
X-Gm-Message-State: AOJu0YxpAz/eAnP0sTN2uvrYIf7By+wWXAERka9YfBYiL5dN48+wXtN9
	sW6wR+FjZO7uT5ib9qNQYuPXVjaDpYPY8MHa44k0YyljboX8/1CKf8es
X-Gm-Gg: ASbGncuxZy+ncYlXONEwzSjJQfVcUgV0m/B+zz1qzz0zY8YwfLOA8N/1wbMna79qizO
	0Ize0EHQmH2mj0eVnJoMbmgkLjlfFbJuhhHYIoTz67fK6FwqQZ9GkqIILpPSVWm8GGDXEjJHH6t
	RyAS6R1NAjDGWYtlKUxiTUp8BLWBUrPahl9NE63cbhcfps5w3B47uZxCPS+m5z89v1yeTB/aTor
	QsunY7cZ1ZTsSUWG6nxOUtbq5hZopXC8smgeLwz7shOUBmFhoZILKo1Zl+ohxBrYYs1CLvoGTXl
	GCIOLRncQD9KD8BOwgDorBfWTqjmd3x5eMgRmJwVKGRMBGkFUWhnq49ex7cz3vlFKn0RbV1gYNz
	PKSM=
X-Google-Smtp-Source: AGHT+IHmIwPJz79bewQ8fxEC6DnTidzwcQaEUNvh7Tm4o1r0JJ452iy88nNmcAIWXOnWrcMs1t/QVA==
X-Received: by 2002:a05:690c:b82:b0:70d:ed5d:b4c7 with SMTP id 00721157ae682-70ded5db75emr88829467b3.12.1747874024507;
        Wed, 21 May 2025 17:33:44 -0700 (PDT)
Received: from maquina-virtual-para-linux.. ([191.156.47.168])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-70ca8324059sm28667417b3.49.2025.05.21.17.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 17:33:44 -0700 (PDT)
From: Donny Turizo <donnyturizo13@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Donny-Dev <donnyturizo13@gmail.com>
Subject: [PATCH] Subject: [PATCH v2] staging: rtl8723bs: rename _Read_EEPROM to _read_eeprom
Date: Thu, 22 May 2025 00:33:37 +0000
Message-ID: <20250522003337.23613-1-donnyturizo13@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Donny-Dev <donnyturizo13@gmail.com>

Fixes a checkpath warning by renaming the function _Read_EEPROM
to follow the kernel coding style (snake_case).

Signed-off-by: Donny Turizo <donnyturizo13@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c         | 2 +-
 drivers/staging/rtl8723bs/include/rtw_cmd.h      | 2 +-
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 49bcefb5e8d2..a0b85beffe5d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -15,7 +15,7 @@ static struct _cmd_callback rtw_cmd_callback[] = {
 	{GEN_CMD_CODE(_Write_BBREG), NULL},
 	{GEN_CMD_CODE(_Read_RFREG), &rtw_getbbrfreg_cmdrsp_callback},
 	{GEN_CMD_CODE(_Write_RFREG), NULL}, /*5*/
-	{GEN_CMD_CODE(_Read_EEPROM), NULL},
+	{GEN_CMD_CODE(_read_eeprom), NULL},
 	{GEN_CMD_CODE(_Write_EEPROM), NULL},
 	{GEN_CMD_CODE(_Read_EFUSE), NULL},
 	{GEN_CMD_CODE(_Write_EFUSE), NULL},
diff --git a/drivers/staging/rtl8723bs/include/rtw_cmd.h b/drivers/staging/rtl8723bs/include/rtw_cmd.h
index cb44119ce9a9..e4e7e350d0fc 100644
--- a/drivers/staging/rtl8723bs/include/rtw_cmd.h
+++ b/drivers/staging/rtl8723bs/include/rtw_cmd.h
@@ -636,7 +636,7 @@ enum {
 	GEN_CMD_CODE(_Write_BBREG),
 	GEN_CMD_CODE(_Read_RFREG),
 	GEN_CMD_CODE(_Write_RFREG), /*5*/
-	GEN_CMD_CODE(_Read_EEPROM),
+	GEN_CMD_CODE(_read_eeprom),
 	GEN_CMD_CODE(_Write_EEPROM),
 	GEN_CMD_CODE(_Read_EFUSE),
 	GEN_CMD_CODE(_Write_EFUSE),
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index 2080408743ef..63373d665d4f 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -684,7 +684,7 @@ enum {
 	GEN_EVT_CODE(_Read_MACREG) = 0, /*0*/
 	GEN_EVT_CODE(_Read_BBREG),
 	GEN_EVT_CODE(_Read_RFREG),
-	GEN_EVT_CODE(_Read_EEPROM),
+	GEN_EVT_CODE(_read_eeprom),
 	GEN_EVT_CODE(_Read_EFUSE),
 	GEN_EVT_CODE(_Read_CAM),			/*5*/
 	GEN_EVT_CODE(_Get_BasicRate),

base-commit: a481f0ebf213e0ccb85f70c07bfcd733d2dc6783
prerequisite-patch-id: 669780b7fd46182223f192ddc59e8fe8a549c490
prerequisite-patch-id: d6c04e7cdd735e1491a1e60522a1724b7e122af4
-- 
2.43.0

