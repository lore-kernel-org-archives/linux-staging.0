Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF222E413
	for <linux-staging@lists.linux.dev>; Sat, 18 Apr 2026 14:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776522991; cv=none; b=X/59TITx3uRuF+MQwU7rf0/7bDv/7LN1GhHUn2cQ8eu6FDpT37WBrYTPOaeqaYhUhYzbnkvrx+w53RHEXYaod7E2udEee7hRePT2Akxx2x/5uCcqCiwkHc7jeQDC36CR1KwB+4orKJGwI7b2corkRqykEg/QQ1jaQClVW4l/BTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776522991; c=relaxed/simple;
	bh=s1QiCuvO/yxnom0YdaAgahlW+22nZ8MdjRUuFA4w6ME=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p+FwYs0MysLgOZ/H9Ulq/npk6rAHe5a97Qs1QFv17Ab5k9wcUtMpL0Tvrr22BHwVOtJb8V40Lfi0PzsJrw++Wj5nVLKFJnM+uIqM3RN8D/pHhtXea/776dQKvZqZd+2gKjfLF32vs3esHyRnhC4HOk/oEhtL+A0hD+RmJ+WeuIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=crimson.net.eu.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=crimson.net.eu.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488afb0427eso20222835e9.1
        for <linux-staging@lists.linux.dev>; Sat, 18 Apr 2026 07:36:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776522987; x=1777127787;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J8Myl5eTPvtfBTYrdmzc0XSzpZs+RgyOgv0qYMVJpcU=;
        b=ALotD8kfeXyGyn9Spw1Drjlo/9XXUFQ3+mUonVNJhbBRL38cIsae7lrRrHiqqLm6VF
         s1tQkTljeJrWUkSl+NicZuMqvmQrmYZ9O8emH7TkHNCKdBKaiD4E2ihFBYQlFRJuu7JS
         dqntepTG68XaZKienibh9U32qWqaZJXWvkUvFPJRTGnreqZ3EtXoAKsllW1qFZQwCVe3
         Q+Row6feL+Oenz8W7xdncX2ZgHnC8vrhkuXRxHeBR6/Aun0P9Gjum1jUNDU2o6/eHXBe
         s254Y9jY0Vgg/W1WoHt2jFAZ84lwCprcX2Ncn462WR3PeDr/SS5DAfed9vqSqu1xCVDM
         wgMA==
X-Forwarded-Encrypted: i=1; AFNElJ+hXAsiUHBiF2m4BA/kfY/NKE5tXLamE7DYjT1wwq6L6cWYK4w2n1J0bwR7OXBC7No5QH83w39Z+aQ+0Qqn@lists.linux.dev
X-Gm-Message-State: AOJu0Ywt7lKyHiP7PkkE6tBiyewPMBb+O/g7G2eQWKMDPkj2i+uuvEvR
	VhY64MzFgz87g0xoCChGUA5keoghiEGiWgRVTF5NFPQo78+taBWtbXYu
X-Gm-Gg: AeBDiet69xS7EB4WhgtnsVh9xU1knr7o1/n6XVwuvjf29qZGhm74LzgryBq1/ZIua59
	1lIgO5u5ZqCXbfxBOUd6RWS+CCIbGAeamquqcnxd+4xD2niMIxLSkqFZYbb43EmGcOO7egjQr1u
	9Fk+2fQ89vRnvn9DBjDTQ2qrhyl0/vY2uqVL8Ui2/B/z1dHmrutYI6PX56ESeF3wTERHW2MbucS
	jqePTRIrCTRxN82GEUUqj9e163pjQJdm3WgFHNutfCSpakniUuxt8FgKspBPnCMGDFK0niuC/u4
	zM9oBNjcbIfwWzsr0jW7LFIyv4KkUFtsQ6OABSvD0S1oRv/Hv09X7t2jej7ljL5jBGxIayrQC/B
	Mh1RhQIMhTMbIM8g0IUu6dV+RQGJrAo5pjNPc+lenEWThnF5MOsOZS+aNqRhgybqp01P31lXpHA
	T3qh0JPS/H65kPRxn1Jj6Qb654+F72rwB2DNGPyPzkzZoq5mOdcjH4f3SpKsW4dMkJRCjj++r9e
	EKGR4z+csCrlV79gK8uKOscSdy4e5ua9w==
X-Received: by 2002:a05:600c:674f:b0:488:be21:54ae with SMTP id 5b1f17b1804b1-488fb6e9cecmr107092205e9.0.1776522987033;
        Sat, 18 Apr 2026 07:36:27 -0700 (PDT)
Received: from localhost.localdomain ([151.41.34.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc0f8188sm144271375e9.2.2026.04.18.07.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 07:36:26 -0700 (PDT)
From: deep@crimson.net.eu.org
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kenet Jovan Sokoli <deep@crimson.net.eu.org>
Subject: [PATCH] staging: sm750fb: remove unused functions
Date: Sat, 18 Apr 2026 16:36:20 +0200
Message-ID: <20260418143620.845355-1-deep@crimson.net.eu.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kenet Jovan Sokoli <deep@crimson.net.eu.org>

The functions sm750_enable_i2c() and sm750_hw_cursor_set_data2() are
defined and declared but never used. Following the driver's TODO list
to remove unused code, this patch deletes these dead functions.

Verified by compilation and cppcheck.

Signed-off-by: Kenet Jovan Sokoli <deep@crimson.net.eu.org>
---
 drivers/staging/sm750fb/ddk750_power.c | 17 ----------
 drivers/staging/sm750fb/ddk750_power.h |  5 ---
 drivers/staging/sm750fb/sm750_cursor.c | 43 --------------------------
 drivers/staging/sm750fb/sm750_cursor.h |  2 --
 4 files changed, 67 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_power.c b/drivers/staging/sm750fb/ddk750_power.c
index 12834f78eef7..eaba3bc2e01a 100644
--- a/drivers/staging/sm750fb/ddk750_power.c
+++ b/drivers/staging/sm750fb/ddk750_power.c
@@ -126,20 +126,3 @@ void sm750_enable_gpio(unsigned int enable)
 
 	sm750_set_current_gate(gate);
 }
-
-/*
- * This function enable/disable the I2C Engine
- */
-void sm750_enable_i2c(unsigned int enable)
-{
-	u32 gate;
-
-	/* Enable I2C Gate */
-	gate = peek32(CURRENT_GATE);
-	if (enable)
-		gate |= CURRENT_GATE_I2C;
-	else
-		gate &= ~CURRENT_GATE_I2C;
-
-	sm750_set_current_gate(gate);
-}
diff --git a/drivers/staging/sm750fb/ddk750_power.h b/drivers/staging/sm750fb/ddk750_power.h
index 5cbb11986bb8..1c4f054d7276 100644
--- a/drivers/staging/sm750fb/ddk750_power.h
+++ b/drivers/staging/sm750fb/ddk750_power.h
@@ -33,9 +33,4 @@ void sm750_enable_dma(unsigned int enable);
  */
 void sm750_enable_gpio(unsigned int enable);
 
-/*
- * This function enable/disable the I2C Engine
- */
-void sm750_enable_i2c(unsigned int enable);
-
 #endif
diff --git a/drivers/staging/sm750fb/sm750_cursor.c b/drivers/staging/sm750fb/sm750_cursor.c
index 7ede144905c9..f0338e6e76b1 100644
--- a/drivers/staging/sm750fb/sm750_cursor.c
+++ b/drivers/staging/sm750fb/sm750_cursor.c
@@ -130,46 +130,3 @@ void sm750_hw_cursor_set_data(struct lynx_cursor *cursor, u16 rop,
 		}
 	}
 }
-
-void sm750_hw_cursor_set_data2(struct lynx_cursor *cursor, u16 rop,
-			       const u8 *pcol, const u8 *pmsk)
-{
-	int i, j, count, pitch, offset;
-	u8 color, mask;
-	u16 data;
-	void __iomem *pbuffer, *pstart;
-
-	/*  in byte*/
-	pitch = cursor->w >> 3;
-
-	/* in byte	*/
-	count = pitch * cursor->h;
-
-	/* in byte */
-	offset = cursor->max_w * 2 / 8;
-
-	data = 0;
-	pstart = cursor->vstart;
-	pbuffer = pstart;
-
-	for (i = 0; i < count; i++) {
-		color = *pcol++;
-		mask = *pmsk++;
-		data = 0;
-
-		for (j = 0; j < 8; j++) {
-			if (mask & (1 << j))
-				data |= ((color & (1 << j)) ? 1 : 2) << (j * 2);
-		}
-		iowrite16(data, pbuffer);
-
-		/* assume pitch is 1,2,4,8,...*/
-		if (!(i & (pitch - 1))) {
-			/* need a return */
-			pstart += offset;
-			pbuffer = pstart;
-		} else {
-			pbuffer += sizeof(u16);
-		}
-	}
-}
diff --git a/drivers/staging/sm750fb/sm750_cursor.h b/drivers/staging/sm750fb/sm750_cursor.h
index 88fa02f6377a..51ba0da0270c 100644
--- a/drivers/staging/sm750fb/sm750_cursor.h
+++ b/drivers/staging/sm750fb/sm750_cursor.h
@@ -10,6 +10,4 @@ void sm750_hw_cursor_set_pos(struct lynx_cursor *cursor, int x, int y);
 void sm750_hw_cursor_set_color(struct lynx_cursor *cursor, u32 fg, u32 bg);
 void sm750_hw_cursor_set_data(struct lynx_cursor *cursor, u16 rop,
 			      const u8 *data, const u8 *mask);
-void sm750_hw_cursor_set_data2(struct lynx_cursor *cursor, u16 rop,
-			       const u8 *data, const u8 *mask);
 #endif
-- 
2.43.0

