Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1819A3FC2
	for <linux-staging@lists.linux.dev>; Wed, 21 May 2025 00:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747785719; cv=none; b=Fo1OUpRM28JfNIXIbYknQWvLZHW2nWY4+5rLbxsaTfRcnOGxPeIuMtOQinydwNF3YZK0iPKJEWiepV7dBaeNJ+1gITVtNeYVk/EU5ZZTkD1b23Z2VEm8A6XPtT4/Rko3fwaUhv/bN7oXUhBMxq7GQsDTStolcjTJWaHbVAXPgLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747785719; c=relaxed/simple;
	bh=EcGufDOm9fGFbYzvClF0fN1nkMM3LTQrZV3c1hDs6Kw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lDNv2OQIQSUfi2/ov3M/aYB9/Oyoyu9juaCFUnOf3m9wPhVbhJqcTsMRjwTwZTZfbcytwQItaytGaLFurddvDJCTi8RNATQ9jMrjH0smXcROViLrQOgYDRYgSXPmKm2Jwxei3ESnecDIuRRpi1JU0LXezTimVF4kaMtCJCvU0qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IE2uvNw2; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IE2uvNw2"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e75668006b9so6471423276.3
        for <linux-staging@lists.linux.dev>; Tue, 20 May 2025 17:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747785717; x=1748390517; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mo+zLzQUmgHMc8tbg5R/8OdiMOJGR326sXoQk7Y8AMI=;
        b=IE2uvNw2XRND1MGyZC7QhdwxEYIG2Sap67ifqOR0JubkwueHawc2DUCbzKL+hB3hvr
         mMBrD2zaOrldGBJKagPQuebuJljXQzdHEvEbvAdUjTJLn2oFrsB4dMw1dlZp17KY31g/
         /dEHo23HXobar5bMqqEIs2ulAHrYBvu09LwxPoBKxfquugPrsdlGM/bdeU1ehW0PF71o
         PO8jKHE+Gp9g/FYm5ywuYkFJCUK7ON4nI/wV4j2WxzjtT19SER2rWNqkCs/kmH3moXAQ
         lMEajmlmeFfDecK7ukp26s8fjKUiQSUVKC81cTVlSYdlzcmnD44D7paTcGKzk2WyY5i5
         IwPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747785717; x=1748390517;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mo+zLzQUmgHMc8tbg5R/8OdiMOJGR326sXoQk7Y8AMI=;
        b=nS8xrOq/rYwgI7gz2g1p2+b1UCqEHenSzOHOGF+ceBoH96B9u0otcx9Z7nVEP+uQ0V
         /OQSbrRIJWSml7wxf5Dn02XzhePqJf8hxhiWl5YZmB+ewxB3bCEP7L2D5nyIL3/fM7tA
         zDxLjn7YBEKqq4l5mL/Dtjv/vgUPwMZTCR0+dpcXFoviS/oUNyTtbWdZ9wYMTxKgODVP
         o5J5Cw7ujzAqcLIRQVDMiEhdUq2DilZrIGiBX4kuWtUaLXrlJWAnIAlMx/N0zF1XWyYR
         Vy/a9r2FBoH4iphZEM5ZK5y5i3gm7vc/jwDiG8mZvv2nmCFc8gFZoChcWd9M4JOJwPGb
         l1jQ==
X-Gm-Message-State: AOJu0YzRq9SGo4RZzK+t46oC982VpxSjZ5VoRhgXnfx9IAESLX7OH0zE
	SMTKAQaCLRwica5RrfX9UIw0it4l7nASHlH5Do72XMEZZdAWMl/gjWwR
X-Gm-Gg: ASbGncv5XtUgLCUt679vZG2/GpCho+qDQTvmvR6Up0Dru/QJJbnngNGJ73lvkiwB/qp
	VQ9ZpgYfvBi9nKVAwiXj5QJCOgfex9bhnsNPpi5EGZwU4kBCaTnmVT7/J/khanCJsYKPbrrgIIi
	krqlDscW49MS7stPagCcKhAv6iiUD1C8IsqLT/SyV1D1vY9NJyxOrrMdPe+MgO/6RHt+ShBvfjX
	VzDB0S3b190iu/lhgh81J3qIkVS8I0gYr2+QKuiyTJIiaOGk2s5Atzw2bGUahs7lBHXkJC8eSVw
	8OiaY/H2bpeXJdbGblT7612l0g0GaQtj0UI/UVYE2KvWp6aLkyqKIw0Mickex6tiVNNM6OoP3dY
	utk3l/TtvQLactQ==
X-Google-Smtp-Source: AGHT+IFEdNQ61+22MRl9RE1e9fkueHA+0h6HUofwO7Q1r1JDFjo7U6QL3yK9koCDi7UeL6aNl8Ui1Q==
X-Received: by 2002:a05:6902:2b05:b0:e7b:675b:8cd4 with SMTP id 3f1490d57ef6-e7b6a40d992mr24496999276.34.1747785716856;
        Tue, 20 May 2025 17:01:56 -0700 (PDT)
Received: from maquina-virtual-para-linux.. ([191.156.250.69])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e7b6acb1ed4sm3631439276.30.2025.05.20.17.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 17:01:56 -0700 (PDT)
From: Donny-Dev <donnyturizo13@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Donny-Dev <donnyturizo13@gmail.com>
Subject: [PATCH] drivers/staging/rtl8723bs: Fix camelCase to snake_case style in core files
Date: Wed, 21 May 2025 00:01:50 +0000
Message-ID: <20250521000150.11659-1-donnyturizo13@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Donny-Dev <donnyturizo13@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 557bfdf09..81f795a82 100644
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

