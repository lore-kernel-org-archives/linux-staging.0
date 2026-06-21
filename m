Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742B71DFDAF
	for <linux-staging@lists.linux.dev>; Sun, 21 Jun 2026 04:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782017630; cv=none; b=XmhzQWgQkSSYlN2ij6nK9gmZ0MISNsH/u3fkBGToMdEmtjvalMDJE+5o/oR+KO9TmzZy5IrZ5uThwURjyJBXG0xRKqZOL5VW4cS3B43yBzkVglBiNwoMFE2Ck08JcPqhTQHo4gBKL5ByVTKAE8PQ8Dt6Z6ZLGXb138fQRrtM3k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782017630; c=relaxed/simple;
	bh=ysODE48MG38Ze7E7lc6OSDgmmH6AUYqISUF/OUOmkLA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=n2mjb6+2VlVaLdeihvWb3rHglFw0oPiMwOlowM/QJquXrILHubnirqT7KvHnj2jL3Fd2u2RENW/aRBv8IxFBRRwUeXrsIobImdl0xKGrNDAL+l59aEqoPCm26nWvUBI2bNbNHa5UoKEJDtB+kP3XKIIv1/Qx3Q52w5UxlgXVid4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ay7a31xE; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ay7a31xE"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2c6ec0af575so20407155ad.1
        for <linux-staging@lists.linux.dev>; Sat, 20 Jun 2026 21:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782017629; x=1782622429; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7G/nkYZdx0E/SLt2rECUHCRRofMdYVLWGsUUXwSGwrk=;
        b=Ay7a31xEmQSKuSXOnnlo6s6H5Ts6qgNr/KuTmlmFvC2Mn5Vf2Zfij8EvJdnVRuBRQP
         JFan1nqc+lSFnuH3Cmq0tRwHy9hIgWyssBQQLeWjmGcOCIUk94BxCkSRJUt290koLGbb
         XrSsGSfOcQ04qBeHHD9rzBnJSLGvhRv48Iu+srUFGqOQsSGhDt3NrnSJ0MM5x1qniEMc
         Mz0uA9sLvBJIuHA4N3JZFofWhS8BCNu8x7Da4z0FYDkUyePAdG+wDFGKFZWqxqBKk9G9
         wNp6f2esinG7QjllDW2wx7IyHatC9gja/g0MV5ivOAjKwD6D05JMsYKq/HPzyxCOyZJ7
         QQjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782017629; x=1782622429;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7G/nkYZdx0E/SLt2rECUHCRRofMdYVLWGsUUXwSGwrk=;
        b=eZTonZ7NzIGV0yphYf1Vdx/GP8taG2KZFMsR+XhJXcKRvIQQq/uZeJtMSEaJKxPQYd
         MAiPDNSW11p82zGVtlHPB7mUpmJwO79OlxsRcQot6pbGh3swsZh0UY8xXS3Hfd7pcHJ0
         GJ7vg5wYu3DD4fBoaKpDQFJDgX47ludw+clhdw3om3rpZZVwpr5nV8HXRe2aawB3s8Bl
         uYMu6OxmbM/9VgnLnzAX+KmV25PsbLMZ8kVSY39immVpxoM+GOmeXe/8V1eJVreojxmg
         we6CiugdTJrDRw5zUStyxKIdnCRujvYnOVmAXBKZM8xGW7UDKwKpQMKqLIrreQaqyFjE
         VN8Q==
X-Gm-Message-State: AOJu0YwJVSBp8ooEtIDFcCrH6cgLzXyjLEmqP42t6RjX3SLoco9eV717
	CkXnZA6xi7ohMulTgGhCtnvY6D8Co5SkbdM3hB/Mou3gumjg7F5S/2Vv
X-Gm-Gg: AfdE7clXB1PhlNuOPweWkEKMmg55swG7K6nl4qeXhHu3CXZ9GrW59q6fxRlEAQFWdOj
	Ke/Vp1ris53FzuIqKfdrhjybyoHKopC4bEIC5Rq6UzSuHSK6HYyIhDALOn6TUa0xAeqVXULKqak
	WelmFZd3d2E7/TbsA3S/NwhuMRfSV7PzMmLu1+Zc10zr70VJX37UaFPicBTIV/h01UfhVMebAzK
	RY6CuV7G+YVGx+xoU+3Vp0InyxMVAokxpJuKFpTSASlkv7vbVkbU2sOSrA1SkCON65S30pvYvS9
	M4SCYLfU9eYzmVDIu/PQSmJO7B9CCt8PudrGY57uQ+Qkipxw57+V0JqZv+IKujuJcEDo2rbxURl
	8P3YAjlG2JJe4WvX7rU3YlBICKvdIXHUdiVrR49KWkAtNR+cpvQUtLQE66IdEHUFdi8Uah6dg0N
	PfwAM+9e/Oay/JAORgWir/msXIlQu/wuibwomNRY2d6KFMV53RHaiy9jtFbUIwlq/8h1pB3m5Dm
	2aT6AHIXc9ykjDz4OC/Vogc0bCtfuzZYNv651aQFNgyZRR98u26e3HMUg==
X-Received: by 2002:a17:902:db0e:b0:2c6:8e82:977c with SMTP id d9443c01a7336-2c718cbdd0bmr100658595ad.15.1782017628373;
        Sat, 20 Jun 2026 21:53:48 -0700 (PDT)
Received: from kapoor.mahindrauniversity.edu.in ([122.184.65.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7436f90d4sm36864575ad.34.2026.06.20.21.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 21:53:47 -0700 (PDT)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>
Cc: linux-staging@lists.linux.dev,
	linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [staging] staging: sm750fb: fix remaining CamelCase issues
Date: Sun, 21 Jun 2026 10:23:40 +0530
Message-ID: <20260621045340.65872-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Rename the remaining CamelCase variables and constants to follow
kernel coding style:
- powerMode → power_mode
- setAllEngOff → set_all_eng_off
- resetMemory → reset_memory
- sm750_doubleTFT → SM750_DOUBLE_TFT
- sm750_dualTFT → SM750_DUAL_TFT

Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 125ad1062..f034d3278 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -859,9 +859,9 @@ static void sm750fb_setup(struct sm750_dev *sm750_dev, char *src)
 	sm750_dev->init_parm.chip_clk = 0;
 	sm750_dev->init_parm.mem_clk = 0;
 	sm750_dev->init_parm.master_clk = 0;
-	sm750_dev->init_parm.powerMode = 0;
-	sm750_dev->init_parm.setAllEngOff = 0;
-	sm750_dev->init_parm.resetMemory = 1;
+	sm750_dev->init_parm.power_mode = 0;
+	sm750_dev->init_parm.set_all_eng_off = 0;
+	sm750_dev->init_parm.reset_memory = 1;
 
 	/* defaultly turn g_hwcursor on for both view */
 	g_hwcursor = 3;
@@ -880,9 +880,9 @@ static void sm750fb_setup(struct sm750_dev *sm750_dev, char *src)
 		} else if (!strncmp(opt, "nocrt", strlen("nocrt"))) {
 			sm750_dev->nocrt = 1;
 		} else if (!strncmp(opt, "36bit", strlen("36bit"))) {
-			sm750_dev->pnltype = sm750_doubleTFT;
+			sm750_dev->pnltype = SM750_DOUBLE_TFT;
 		} else if (!strncmp(opt, "18bit", strlen("18bit"))) {
-			sm750_dev->pnltype = sm750_dualTFT;
+			sm750_dev->pnltype = SM750_DUAL_TFT;
 		} else if (!strncmp(opt, "24bit", strlen("24bit"))) {
 			sm750_dev->pnltype = sm750_24TFT;
 		} else if (!strncmp(opt, "nohwc0", strlen("nohwc0"))) {
-- 
2.53.0

