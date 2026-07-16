Received: from mail-pj2-f3.google.com (mail-pj2-f3.google.com [74.125.227.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF07265CBE
	for <linux-staging@lists.linux.dev>; Thu, 16 Jul 2026 04:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784177193; cv=none; b=br2s4F/XHWdQVh5QZkVdyUsf63sJ/4V9mFdE3H8CbHKf+s/pq01HD79gLQ58clYSg322Vd081n2hWg2vXkcXw52y9SaQchTIlMXlXI2+rIlI8z/L/3BDgna/0KjFLtPh3t8JZVX1XlQD3OHfZkX22T5IgbxA29zNmXEK3S6AP+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784177193; c=relaxed/simple;
	bh=jLsncUXgsxf2LHonIcXGrctbpjoU4r/DWZEFpHjfutg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tOh5YHyI+We3haG37DfUh1BP/Day+LGPEJ3tF/SJFeVgg+jOoPjBI8hEJhbEIlpfDO/NXkhG65W8ybtAGf1wxRtftpSWZQmivqg3SJ4N8D3TGAyev1Nunad6rSjNZ05cGnEye2F/2M17KT2jlrpwj4Yi7HPOOj3W/Y+p/i74cf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RAH8JwKu; arc=none smtp.client-ip=74.125.227.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RAH8JwKu"
Received: by mail-pj2-f3.google.com with SMTP id d9443c01a7336-2ce7ac92dfcso22685735ad.1
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 21:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784177192; x=1784781992; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=enEY90CGFOJDQcplxBar2hJV6yl0T0mtmkQgs1NewkI=;
        b=RAH8JwKu5VZK76avE9NWCGyzkK8CocPo2F+NFwHm3VBGjR2DwqaQcNI2Ucw1omyhSF
         DrmNefNmSggnr9AdY5UCibvDg3p0yJ0eqgxtKKhAq/FBABH2Awqaey3+4wlqa5GSehim
         A/QyAUJ17Q8KHo6SsDCym+Dy3FPByLN7B/AanrrdYbSKYJh2sVy9Ex6dQgBstKDRsq7X
         Ocy24tta177rw3UPsEuZK1Ys0zAB1+e7NRyJAqjGJ8yLTmt326UClxQXvPUS5UTOOH68
         TBL9pFpkDOsnAV4oW0TzpMmDkYaue6i0yx0iKPI9JOvDKY9jhm1t4crpLyN+plQO8ra5
         v4Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784177192; x=1784781992;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=enEY90CGFOJDQcplxBar2hJV6yl0T0mtmkQgs1NewkI=;
        b=VfUlSkdzMdCwcXPFwIAyF7gY+9WswYjatCH407kO4rQB140jeZ1zO6IooBI8qoqTlA
         //duJ4vT8fao0u1bRrzIJcsv60kCQA+WqlYnQ8c9Z4w7uQMQV5ibz/SXY7Wkvcbm4c3b
         tE8Mkff03XqeOhD32Z387G7Owzv75Xyc/9iLCUbKVw+8mpx9yAGE2SafXvmqcbXRq7pY
         lq0//5EhCW8jb7HTMkTrScP+NyM5gZMCNa87+J9jBjs3VLQe+XUZtdQIhRdTj3NU8uck
         lJoMv85yKtu2k5ssNv3yxuCS+07jWAr/PqgV2cArsTRomJjXFwsPgJEt6M0ElXMFzN4b
         IzwA==
X-Forwarded-Encrypted: i=1; AHgh+Rq0OIk7r9alGs5lTtzX00d7zgKvLK6PAYlYaz4CeC5koVs+5yPmk8RXjoRHndEUhTrQ0FkPB03eVZ8RH5W5@lists.linux.dev
X-Gm-Message-State: AOJu0YxAKr6+7aEuCksJn/VU4DH1Rfqm1D7YW1ivjb1BT4jGF/Lejv8c
	oKaivJjcnFyiImvJbx6Fr3J15RLR3k2d8JtOCZAMxvO8Zj7PrvA6QHaR
X-Gm-Gg: AfdE7cm7f6xtqkrGs+ZYHRV8aPec2VVeCd8LdvIoAhvIJX/N2WTIvua/ianJ2ZPaVhN
	spAx56nJ5e0gdu+7Bq04ujP8FF9OrNM9GJgi7oPK+MAxgH/KzQ/A4kT0S7vFSn2aUYCpQwkZ62b
	sFd7JpNRpLavP6XUHzITS1yUq83on+ZhOVmzAXTZ49lASJkky8MGzRP7+mtZNsNZRD65A1L9pYN
	SA8wIz+/ChrAZ1UIYUl9wrTlmrpnImqoigRUZqlAVKDopd6U+2ZGovbz4ckN7XYqPvYPdaaIdqD
	NhiM+Ku7IkihQahRNsL9TWLnzIuq7NBdrSlkjgiWvYNgrK+62KyW6dqr8FKqRztOnAXZQwbZ8W3
	Yg8VmTk7XLeaOTCqwj7pNnlNVWSNV3awBe0IFk7cLnSArzopoTbPMK8zMOTXRj4Ww8YxmUsWA9X
	3ckVAKVz6JJgIdVPUNyKxaHA00B0H6d2uVqA==
X-Received: by 2002:a05:6a20:eec2:20b0:3c3:75ff:95b6 with SMTP id adf61e73a8af0-3c375ff9bc9mr2981268637.31.1784177192013;
        Wed, 15 Jul 2026 21:46:32 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e538368sm10282930eec.12.2026.07.15.21.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 21:46:31 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] staging: sm750fb: remove unused set_all_eng_off field
Date: Thu, 16 Jul 2026 04:46:13 +0000
Message-ID: <20260716044613.2659-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The set_all_eng_off field is only initialized to 0 and is never set by
any caller.

Remove the unused field together with the dead cleanup path guarded by
it.

No functional change intended.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/sm750fb/ddk750_chip.c | 27 ---------------------------
 drivers/staging/sm750fb/ddk750_chip.h |  7 -------
 drivers/staging/sm750fb/sm750.c       |  1 -
 3 files changed, 35 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_chip.c b/drivers/staging/sm750fb/ddk750_chip.c
index 0bb56bbec43f..aa78d0bc1d87 100644
--- a/drivers/staging/sm750fb/ddk750_chip.c
+++ b/drivers/staging/sm750fb/ddk750_chip.c
@@ -263,33 +263,6 @@ int ddk750_init_hw(struct initchip_param *p_init_param)
 		poke32(MISC_CTRL, reg);
 	}
 
-	if (p_init_param->set_all_eng_off == 1) {
-		sm750_enable_2d_engine(0);
-
-		/* Disable Overlay, if a former application left it on */
-		reg = peek32(VIDEO_DISPLAY_CTRL);
-		reg &= ~DISPLAY_CTRL_PLANE;
-		poke32(VIDEO_DISPLAY_CTRL, reg);
-
-		/* Disable video alpha, if a former application left it on */
-		reg = peek32(VIDEO_ALPHA_DISPLAY_CTRL);
-		reg &= ~DISPLAY_CTRL_PLANE;
-		poke32(VIDEO_ALPHA_DISPLAY_CTRL, reg);
-
-		/* Disable alpha plane, if a former application left it on */
-		reg = peek32(ALPHA_DISPLAY_CTRL);
-		reg &= ~DISPLAY_CTRL_PLANE;
-		poke32(ALPHA_DISPLAY_CTRL, reg);
-
-		/* Disable DMA Channel, if a former application left it on */
-		reg = peek32(DMA_ABORT_INTERRUPT);
-		reg |= DMA_ABORT_INTERRUPT_ABORT_1;
-		poke32(DMA_ABORT_INTERRUPT, reg);
-
-		/* Disable DMA Power, if a former application left it on */
-		sm750_enable_dma(0);
-	}
-
 	/* We can add more initialization as needed. */
 
 	return 0;
diff --git a/drivers/staging/sm750fb/ddk750_chip.h b/drivers/staging/sm750fb/ddk750_chip.h
index ee2e9d90f7dd..2a13debc179f 100644
--- a/drivers/staging/sm750fb/ddk750_chip.h
+++ b/drivers/staging/sm750fb/ddk750_chip.h
@@ -76,13 +76,6 @@ struct initchip_param {
 	 */
 	unsigned short master_clock;
 
-	/*
-	 * 0 = leave all engine state untouched.
-	 * 1 = make sure they are off: 2D, Overlay,
-	 * video alpha, alpha, hardware cursors
-	 */
-	unsigned short set_all_eng_off;
-
 	/*
 	 * 0 = Do not reset the memory controller
 	 * 1 = Reset the memory controller
diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index a2f244878f85..039e2033f84e 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -837,7 +837,6 @@ static void sm750fb_setup(struct sm750_dev *sm750_dev, char *src)
 	sm750_dev->init_parm.mem_clock = 0;
 	sm750_dev->init_parm.master_clock = 0;
 	sm750_dev->init_parm.power_mode = 0;
-	sm750_dev->init_parm.set_all_eng_off = 0;
 	sm750_dev->init_parm.reset_memory = 1;
 
 	/* defaultly turn g_hwcursor on for both view */
-- 
2.43.0

