Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA7D26B2BA;
	Tue,  8 Apr 2025 10:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744107676; cv=none; b=N0xEEYqwHwZ+icDjEerfYGZvhNXFApp4zbxxVs7KzaJb+btgqxLtfRJDU0GPv9jxXsbEmQPB7nvEsr5woZrooWlTfz6BfZWgd69oNLRsb/jHZpqwfghwFDFYxge6jak2PcxG222yJ21s3ZzF5uOY7Y51zDpxBec5s/cbo5EEHb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744107676; c=relaxed/simple;
	bh=JHgSmpHywThLvhaNGwqkN6rlBmIZHywWloaU6MKIwBE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EiOMqUljKncH0Uwyrv1Xib6yoc4u6IfE4FZHAd5KuDSW1vDrD1HjdTWv2ztSm7tY2YIlsQuwyU0NDdpN4F5SglNbCnOeDmte7BvhogVlkLcxYUujLb1k8teg1LKYqJwKSmWhKvGL2ZMVhr67/jcj2Fnlpr6zX/mPQKaQ9HpeaAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TCdo00N/; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TCdo00N/"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso58324545e9.0;
        Tue, 08 Apr 2025 03:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744107673; x=1744712473; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qAIrh/4WE88oUvyzDDtUAXVVh7UEV5wee/SgtjWD0Rc=;
        b=TCdo00N/u4BsIn5eHqF0xEB0i5WJEc/BLFc8glG4bzHNW7GemixAZTEhgKX9viAuPs
         OfF1jLFMlAFMTwFJrvA65kEZA2gKWRBNmvdOssnBYZnhBYjeiMB0XPuDiPxaBtPKPr7Q
         y/AJr0g3qaasRbniWhiLP4FVIL+wq7lbc2h4jjT1NcbFTOHGo5l2g/5W9Wd1CZKyTVs6
         Vkuvs7+SlxliN8rcMdMS2ircHlWNg3HWDtKTm2Ly8pfrCsYFy0r0Rw1WBmWUz/AR749l
         TV/zWvtfcGcI9sV5R8vyofkkXmH24uDIllB5VldoYgGjBaaxCHI3slqdX5hNNJ82qkTW
         eQ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744107673; x=1744712473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qAIrh/4WE88oUvyzDDtUAXVVh7UEV5wee/SgtjWD0Rc=;
        b=jUhUBu0sZbKOSJcMmZ4tWJem858I+D1xNvKlmvADQqoptEJFpk02FOoFayo0wquFpJ
         D9jPrUrFIT/Macs/Cu/xtqziVjdpmnkLROsL2YCQytCZapCsWvGYGO01VlvVm6nvySVl
         BH8Uayxha6rIIL+XKSbAT6v8GdtCTklbQ84TE9UrZfTx5qls+zcatMbTg4j5A1kzVsqI
         RoO34FCdfNramuTmNmVwQaEK470lKRqWENDCu6nEC57WIy+t0ps6Kqi4EB6ANv7+vYbi
         nceCTnHVZfzRidQqAxbERhVA4g0U1GP0Lu3dwcNUFvTjqK9iQSlRLGxtI7jTkoJgWtzY
         DAKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKBlEeLe7h7zpO5/HVy49HBRQ7+c5sWZWSJnENxQ4VIuPLjEm23Nw/Mc3V+0pFUooK4B3g2/IDWuWtprlx@lists.linux.dev
X-Gm-Message-State: AOJu0YznN8Om0iJC0+vv5zyprSm+ApQL/e20k+VWqBGU9cj7MgwqGWih
	iY2b+ArszDZbGon0UH26EFLw53WKzZNu8rAjpPmmOfrFtdQNwbJr
X-Gm-Gg: ASbGncuFGr4y6a0Dz+2+xSknd4a0JJg2EIp9LOV6aTRCbueQyvmu01O/YT51wERvD83
	PsX5q0WWwo2aLG+APyaDvjhFoBD3V8PSybxPPBXcMTMwrOPYAJ7CI5MTl4Vtn0a3Z9AmvznPASl
	HHj8GiOk10irpPrzLVXFG/W+T4UM6q/Bf90a3A1Gdkd2QYPZE85gkrr5U8IUeHV1PuqdAuZZEB6
	YWbqprPwaSyC1UWLmv0z6R8Xy0O/vawTCl4VrTk/6OP5krtRTBd7VSKeQ/PUYsE4fuMfWkTzdIy
	TbNp5EOtiY0XO8nW+aIQjArcvdQ=
X-Google-Smtp-Source: AGHT+IEVvLWR5puwGmIhIK0h2QSC6EpbRXEsJwHX8+Yi8eRbzozYZ7hLPVlfE/o/gbWcfoFK+dtQrA==
X-Received: by 2002:a7b:cb42:0:b0:43d:fa59:bcee with SMTP id 5b1f17b1804b1-43edf4581d1mr71419705e9.33.1744107672582;
        Tue, 08 Apr 2025 03:21:12 -0700 (PDT)
Received: from parrot ([105.113.112.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34a8952sm156083585e9.10.2025.04.08.03.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 03:21:12 -0700 (PDT)
From: Richard Akintola <princerichard17a@gmail.com>
To: outreachy@lists.linux.dev
Cc: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Akintola <princerichard17a@gmail.com>
Subject: [PATCH v2 7/8] staging: sm750fb: change sii164CheckInterrupt to snake_case
Date: Tue,  8 Apr 2025 11:20:39 +0100
Message-Id: <c5c01f1840ca37c24fcca7bff4b09adba37c3a7f.1744105389.git.princerichard17a@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1744105388.git.princerichard17a@gmail.com>
References: <cover.1744105388.git.princerichard17a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change camelCase function name sii164CheckInterrupt to
sii164_check_interrupt in order to conform to kernel code styles
as reported by checkpatch.pl

CHECK: Avoid camelCase: <sii164CheckInterrupt>

Signed-off-by: Richard Akintola <princerichard17a@gmail.com>
---
 drivers/staging/sm750fb/ddk750_dvi.c    | 2 +-
 drivers/staging/sm750fb/ddk750_sii164.c | 4 ++--
 drivers/staging/sm750fb/ddk750_sii164.h | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_dvi.c b/drivers/staging/sm750fb/ddk750_dvi.c
index ac1aab77da28..1def02be4cce 100644
--- a/drivers/staging/sm750fb/ddk750_dvi.c
+++ b/drivers/staging/sm750fb/ddk750_dvi.c
@@ -23,7 +23,7 @@ static struct dvi_ctrl_device dcft_supported_dvi_controller[] = {
 		.set_power = sii164_set_power,
 		.enable_hot_plug_detection = sii164_enable_hot_plug_detection,
 		.is_connected = sii164_is_connected,
-		.check_interrupt = sii164CheckInterrupt,
+		.check_interrupt = sii164_check_interrupt,
 		.clear_interrupt = sii164ClearInterrupt,
 #endif
 	},
diff --git a/drivers/staging/sm750fb/ddk750_sii164.c b/drivers/staging/sm750fb/ddk750_sii164.c
index 6ce15b7816d9..aebde3d8b903 100644
--- a/drivers/staging/sm750fb/ddk750_sii164.c
+++ b/drivers/staging/sm750fb/ddk750_sii164.c
@@ -370,14 +370,14 @@ unsigned char sii164_is_connected(void)
 }
 
 /*
- *  sii164CheckInterrupt
+ *  sii164_check_interrupt
  *      Checks if interrupt has occurred.
  *
  *  Output:
  *      0   - No interrupt
  *      1   - Interrupt occurs
  */
-unsigned char sii164CheckInterrupt(void)
+unsigned char sii164_check_interrupt(void)
 {
 	unsigned char detectReg;
 
diff --git a/drivers/staging/sm750fb/ddk750_sii164.h b/drivers/staging/sm750fb/ddk750_sii164.h
index 90b7ae823a10..aa3f34c13979 100644
--- a/drivers/staging/sm750fb/ddk750_sii164.h
+++ b/drivers/staging/sm750fb/ddk750_sii164.h
@@ -36,7 +36,7 @@ char *sii164_get_chip_string(void);
 void sii164_set_power(unsigned char powerUp);
 void sii164_enable_hot_plug_detection(unsigned char enable_hot_plug);
 unsigned char sii164_is_connected(void);
-unsigned char sii164CheckInterrupt(void);
+unsigned char sii164_check_interrupt(void);
 void sii164ClearInterrupt(void);
 #endif
 /*
-- 
2.39.5

