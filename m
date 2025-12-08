Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com [209.85.167.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE2B21D3D6
	for <linux-staging@lists.linux.dev>; Mon,  8 Dec 2025 11:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765192613; cv=none; b=QDhfuOzQ7eDi6YkWyTS29F9QiSYumSEvANj/g/XLwyE1BX6MEVSJv5fFChIgP/5bIVUbyw0CXAivdx29uzPMckdqOrizxELcZfyfYaOpZHCrMGGk7byAoTA72NYiZwk8CZ9j6oHpUvYNwWDSHW7mqPJwJ8Ey4yWNP1ojXrIpQf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765192613; c=relaxed/simple;
	bh=SOUqlzQpcjCK0fTaxI1RTsijxJFfgOEwIrAYv7Vz+lk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ck99aa80jhMfvGI+6Ho74vBrcRgD0IhBZZmukByGSWq1IGuXFYw/UrzFsSKUFAyB9CQ1jfv8JaAneyQ22sou4tFPNftAECESSV8r6bMIdoUFh0cpocqCrQp1ofCKL8CjqhUyAPGuZT1VemZu7aVIMAgTpvfuIBUCUPFzD6ACUa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KBl7A7+m; arc=none smtp.client-ip=209.85.167.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KBl7A7+m"
Received: by mail-lf1-f65.google.com with SMTP id 2adb3069b0e04-597c83bb5c2so3291625e87.3
        for <linux-staging@lists.linux.dev>; Mon, 08 Dec 2025 03:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765192608; x=1765797408; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k1FcJaTt57JlbJy66zrOJwhugl21WOuVNYEAfr8aZYo=;
        b=KBl7A7+mtn0oeN3pL7LnBhwhbf3jxH1l9/H6M9Y6ovRzqNP8y7Fv7/ioombH/jzvqR
         EM0KJ75IXpI7moIjrNWl006g2j5wgh1V+7R1YXNpwrEMIfy6sZAQ6ueHvdIqdjKWwej6
         9kGYWUtJsMTuPPvnu/NzGLvzqOsROCij/TFDRgstnSxVq0ePcI+TZFKGfybl9lYL97/M
         du/Os3l831rqqBMsFkPcgcHpzpNBxZ20lmLNLXd4jwY80tZbGS7lKSHLz5UJhRf+YTgV
         8Hi5g8o4WCrroA0ZRlqadvnUMdJOXzxUE+BJXUlo0xVMDav7/3cNJRpDxCiD/Lt9HyzJ
         lDAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765192608; x=1765797408;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k1FcJaTt57JlbJy66zrOJwhugl21WOuVNYEAfr8aZYo=;
        b=nD2atRXpLi8G9idyq1/mcgfwkyaGWWCVxQ16aoVM7+g8IOypnzIQ3F5TTFxrIZ+JhR
         s4izJab8XjVEqZgPt8ltMLX+6x2MQBr4Q2qNX3y3bIVHKp4ZdIYqS0J3a3H4uBr89+mE
         VsD/iQWktaXrIx+sTlGNrAY/sqr2ePamthzFXUOKqvfnlGugjQ0flUyeuoCOeDa6jk7M
         sbhRHyFUzph2vl8c62LGS1aG+jK6QF4HiE4N9AKo6t8Lw/ngbZtFpSbcXTrRT09/QjbA
         DXZkiZ5x00fqmpJkQBrSMKflsBYt4zibbdxhuPKGQ+DDNH+4+79L570ZGzRm2DJPkWbV
         LZ4Q==
X-Forwarded-Encrypted: i=1; AJvYcCU4+FIwGuRzNT4SS8movOSyWb3Y84WoQqgZMH9Zn/0eE+ONG8VOUUQzLvku7UO087j7MzedA94w2TmOE5+S@lists.linux.dev
X-Gm-Message-State: AOJu0YzbxItO4QFvVRMImNc2nWZcB0LO/mWo6uqzZi7KQC37BE0Pl23i
	thCY5cF5UUKBjOP7rKDYk0Jx3kknjgBr2t0k3uHJ0eG+iD+UHEIglsoY
X-Gm-Gg: ASbGncssj98BozYZhFfQT1R3wrmRgIMUy/ltBkD2cwBVLHTecu6WJWja9wdWo7TNivR
	Xcp+I9eAuVnqvKV2Hh03N06Bws2QD3BPgmvb6ZGNKQbCJ3DDbWgc/hGsI12W6MfZKJG4q7Btsqe
	V8GASr0Tpk6B7uMoemZYK7msFv68VEkmhw73NY6VPhgpIcXDCaTcrtlOudisWWRFgM4doeWDAcC
	0bkOkCLpuTusJ+jkBdkio+ezkuuBpkwflsHR5Yn8ellDyt11tbSiR6+h9WOmPD9bbLLUzNtfLPg
	hRDE/tZje9dV/q/OWbAuLF0AtjC+xAKTR/ZtGPGYBOApfTQwCCTn0Ga0GR7GDq/CRalfng6Q452
	9/eqY/6f6ZSnhWIb67WTzoXKw/if72dWu5BZd29e6jw0j1+y3EjkMqqwIEobdCHk9i9Lk4lhDuA
	ZE0sdqxE7auA1r9C3e+cINrC+bzmnpuVoIsygcCIxKMCv2VObeBPKgqpbqbA==
X-Google-Smtp-Source: AGHT+IFU4R3moE77eHxDxOCHEP0tsIAxCKnS+8bBbj0g/HYxCv24Zem1PsGdmmHLOWneqk3oWD3pdA==
X-Received: by 2002:a05:6512:234b:b0:594:5545:b743 with SMTP id 2adb3069b0e04-5987f918492mr2689851e87.27.1765192608021;
        Mon, 08 Dec 2025 03:16:48 -0800 (PST)
Received: from rbta-msk-lt-302690.astralinux.ru.astracloud.ru ([89.107.11.60])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7c1e405sm3975815e87.49.2025.12.08.03.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 03:16:47 -0800 (PST)
From: Alexandra Diupina <dyupina99999@gmail.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Alexandra Diupina <dyupina99999@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Cox <alan@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	lvc-project@linuxtesting.org
Subject: [PATCH v2] media: atomisp: avoid memory leak in ia_css_pipe_create_cas_scaler_desc_single_output()
Date: Mon,  8 Dec 2025 14:16:17 +0300
Message-Id: <20251208111617.21966-1-dyupina99999@gmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ia_css_pipe_create_cas_scaler_desc_single_output() may fail,
so add cleanup by ia_css_pipe_destroy_cas_scaler_desc()
rather than simply exiting the function. Also add error handling
for kcalloc() in load_video_binaries() and load_primary_binaries().

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
Signed-off-by: Alexandra Diupina <dyupina99999@gmail.com>
---
v2: add kcalloc() error handling
 drivers/staging/media/atomisp/pci/sh_css.c | 41 ++++++++++++++--------
 1 file changed, 26 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 73bd87f43a8c..c1239e910fdc 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -4528,21 +4528,20 @@ static int load_video_binaries(struct ia_css_pipe *pipe)
 			  NULL,
 			  &cas_scaler_descr);
 		if (err)
-			return err;
+			goto ERR;
 		mycs->num_yuv_scaler = cas_scaler_descr.num_stage;
 		mycs->yuv_scaler_binary = kcalloc(cas_scaler_descr.num_stage,
 						  sizeof(struct ia_css_binary),
 						  GFP_KERNEL);
 		if (!mycs->yuv_scaler_binary) {
-			mycs->num_yuv_scaler = 0;
 			err = -ENOMEM;
-			return err;
+			goto ERR;
 		}
 		mycs->is_output_stage = kcalloc(cas_scaler_descr.num_stage,
 						sizeof(bool), GFP_KERNEL);
 		if (!mycs->is_output_stage) {
 			err = -ENOMEM;
-			return err;
+			goto ERR;
 		}
 		for (i = 0; i < cas_scaler_descr.num_stage; i++) {
 			struct ia_css_binary_descr yuv_scaler_descr;
@@ -4556,12 +4555,19 @@ static int load_video_binaries(struct ia_css_pipe *pipe)
 			err = ia_css_binary_find(&yuv_scaler_descr,
 						 &mycs->yuv_scaler_binary[i]);
 			if (err) {
-				kfree(mycs->is_output_stage);
-				mycs->is_output_stage = NULL;
-				return err;
+				goto ERR;
 			}
 		}
+ERR:
 		ia_css_pipe_destroy_cas_scaler_desc(&cas_scaler_descr);
+		if (err) {
+			mycs->num_yuv_scaler = 0;
+			kfree(mycs->yuv_scaler_binary);
+			mycs->yuv_scaler_binary = NULL;
+			kfree(mycs->is_output_stage);
+			mycs->is_output_stage = NULL;
+			return err;
+		}
 	}
 
 	{
@@ -5106,8 +5112,7 @@ static int load_primary_binaries(
 			  NULL,
 			  &cas_scaler_descr);
 		if (err) {
-			IA_CSS_LEAVE_ERR_PRIVATE(err);
-			return err;
+			goto ERR;
 		}
 		mycs->num_yuv_scaler = cas_scaler_descr.num_stage;
 		mycs->yuv_scaler_binary = kcalloc(cas_scaler_descr.num_stage,
@@ -5115,15 +5120,13 @@ static int load_primary_binaries(
 						  GFP_KERNEL);
 		if (!mycs->yuv_scaler_binary) {
 			err = -ENOMEM;
-			IA_CSS_LEAVE_ERR_PRIVATE(err);
-			return err;
+			goto ERR;
 		}
 		mycs->is_output_stage = kcalloc(cas_scaler_descr.num_stage,
 						sizeof(bool), GFP_KERNEL);
 		if (!mycs->is_output_stage) {
 			err = -ENOMEM;
-			IA_CSS_LEAVE_ERR_PRIVATE(err);
-			return err;
+			goto ERR;
 		}
 		for (i = 0; i < cas_scaler_descr.num_stage; i++) {
 			struct ia_css_binary_descr yuv_scaler_descr;
@@ -5137,11 +5140,19 @@ static int load_primary_binaries(
 			err = ia_css_binary_find(&yuv_scaler_descr,
 						 &mycs->yuv_scaler_binary[i]);
 			if (err) {
-				IA_CSS_LEAVE_ERR_PRIVATE(err);
-				return err;
+				goto ERR;
 			}
 		}
+ERR:
 		ia_css_pipe_destroy_cas_scaler_desc(&cas_scaler_descr);
+		if (err) {
+			kfree(mycs->yuv_scaler_binary);
+			mycs->yuv_scaler_binary = NULL;
+			kfree(mycs->is_output_stage);
+			mycs->is_output_stage = NULL;
+			IA_CSS_LEAVE_ERR_PRIVATE(err);
+			return err;
+		}
 
 	} else {
 		capt_pp_out_info = pipe->output_info[0];
-- 
2.30.2

