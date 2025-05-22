Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51724A1A
	for <linux-staging@lists.linux.dev>; Thu, 22 May 2025 02:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747880252; cv=none; b=LeUNabb9Z9BJiczeM+UI05rAckFkcJaBr8Q/UF/sMvVCXbUXeoggwizAZie280V60ph8WgESrhxuY1FggoJW6QIF4kyQqLPHoBi4B8akUTIzULuUsKraUFN9aEKe0gMhAmap4p/XswhOc/Ci9ZsylEZUgMNG9Ut+HlujtSxV0uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747880252; c=relaxed/simple;
	bh=QGo1LBga1vpUEKc+8qjsPWTMysADMWrG32qHjuDbXb8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LBbIiz/NhO1QnM2y9ojdJOirIZUf/6mF7+M4tHFx/xr6DXuioLTqO4K1Q7HmzylQD6WBfVCr0leSUwzRifPTOTx+SX8rbHU0TrJ54xpCNM6fs+wpGmI69v/x1ZtCbb5fl58t6Xoo59DTobBwnaMrRqK3vlqtu22Lco8AElEzuuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=THE+XHvQ; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="THE+XHvQ"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e7d5f3e6169so1279882276.3
        for <linux-staging@lists.linux.dev>; Wed, 21 May 2025 19:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747880250; x=1748485050; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WDr3eISUVPW2GSYKg/ARqYypW2g9PgYCPGEerPGGiic=;
        b=THE+XHvQQdI6wh54Vj2+VcRiUwZAYFaWxKmkBwudGKDjFRz0ccUqQhVPbDt7p0cS+Y
         ec46NuGAar2ootQFaHxMboWx8uq3LB9sfAQYknk3FGZ2X408lYaIv8aZ6KGikLZ49W5o
         GfvMPUvSSAbpPuOVRg1Dqz9FXWxSz85qvWPy2k5opwbzntwwNqoH3Ca4pd59o1FqedcG
         Wttf85AhC/TqWHzZVK3iinG6pT3o3e6OOlmv9b52sh1Lt1hS806Lv+xOHR2qMB9zizBG
         RNTTX/WiY1rFycn6BIxlWCBiiCoadzFllrT3lnB50kQw1WQuLQ9Bn8PQKyTiEsT5fWF2
         vSiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747880250; x=1748485050;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WDr3eISUVPW2GSYKg/ARqYypW2g9PgYCPGEerPGGiic=;
        b=cEtZiC1mjuv2j2osvRVsvxeSw7ebIeqHCxMCgTWg2lFqd//rMXoVo/uGFxcbehrzky
         GKNoo3NolGx5RcmpPQLubxaQ8M7mWp76eNetpW8AosLE9fpz/WBH0vQdY4py2Q2acNgI
         ssF53pVu7TTemVLttNaDV9haHivZOmYd/nXYi1ewCG1zxzNnJBLvr4vOY881g1CSHMiY
         CfWQiDedxcUK6Jf/ls/8x6ySMVPdJGCt3e1PXvV8VOsJwtASESi+RosC1EomobsYk5e7
         +xTT2LwSBjHFp+9w6U9x3hsqyNTX0JW4rgHYZIdYcRsI+4PfbT25zDf+Up6FXC+T7YBB
         l/1A==
X-Gm-Message-State: AOJu0Yw9yqazAdxVLXGBfpyk2wlDrkfyI/Vuen+vjRUT0+UkA3gIEXDs
	NxYXfSAGJxd2YFhqfoxawhPyzNt1QytijntSy9ydAVPZaCqMqkEtbn8F
X-Gm-Gg: ASbGncs5QaovQXtaGy4IUy7s3KKdMeavgrOIkBWY52a+A/0IaIjkdPBR4wfd7iVJPNx
	pjdYK9CBxXb4ouYBlDIVY1Q7W22mc5W4ZCQUBlIZmWORye+iBySzaVPiOzJLaxq5lcescDg9T2S
	gfuP8L/NsTCgR/hA5R+PRuWcZ1kbFXHdpXpYQ0qMbq5ur2qYT3t2JHl+1TF66+GwOlNxfUkOGGw
	uPqSwhvo0X9GQp7BimkIvlL5UaCkqYP3kmRTXtLgEGnHCR18WEBiT5mEHc4sd68bkG7yfK8yj4c
	AwJp6wu9mci69bdoMItpMWaVu1yZucLmIguWgJAYadBKMfSbezqmo3X3OJNCXntYTflOcUHZvHN
	YQdg=
X-Google-Smtp-Source: AGHT+IFMHQ9v2R61v5zZ2TO7ToSlglABVgGGVkYA8Vyhw+Z6nBks3GAw2e0C0fTNlgVAx5EORt3hSA==
X-Received: by 2002:a05:6902:6c12:b0:e7d:585d:6aac with SMTP id 3f1490d57ef6-e7d585d6f25mr8408781276.39.1747880249710;
        Wed, 21 May 2025 19:17:29 -0700 (PDT)
Received: from maquina-virtual-para-linux.. ([191.156.33.198])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e7b6adaa721sm4365837276.44.2025.05.21.19.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 19:17:29 -0700 (PDT)
From: Donny Turizo <donnyturizo13@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Donny-Dev <donnyturizo13@gmail.com>
Subject: [PATCH] drivers/staging/rtl8723bs: Fix camelCase to snake_case style in core files
Date: Thu, 22 May 2025 02:17:22 +0000
Message-ID: <20250522021722.28178-1-donnyturizo13@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Donny-Dev <donnyturizo13@gmail.com>

Signed-off-by: Donny Turizo <donnyturizo13@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 437934dd255e..49bcefb5e8d2 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -9,8 +9,8 @@
 #include <linux/jiffies.h>
 
 static struct _cmd_callback rtw_cmd_callback[] = {
-	{GEN_CMD_CODE(_Read_MACREG), NULL}, /*0*/
-	{GEN_CMD_CODE(_Write_MACREG), NULL},
+	{GEN_CMD_CODE(_read_macreg), NULL}, /*0*/
+	{GEN_CMD_CODE(_write_macreg), NULL},
 	{GEN_CMD_CODE(_Read_BBREG), &rtw_getbbrfreg_cmdrsp_callback},
 	{GEN_CMD_CODE(_Write_BBREG), NULL},
 	{GEN_CMD_CODE(_Read_RFREG), &rtw_getbbrfreg_cmdrsp_callback},
-- 
2.43.0

