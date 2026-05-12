Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A44D24BBFD
	for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 05:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778562486; cv=none; b=dygel4yH+MzjiCd6WV2C9puaocq2KRR8JfS3781qlpeA56Xl+vd4Qh9sSF7KLDWMAYBsaeInPys79rMFU0bbNgmmVyLnUKdnkCqRnsFcjdAZQ03PF9lEj7s275KdzyQ7pSrb+TYXK6KD0WegqnS3llsG9fmknIFeY9Ltc6AaPlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778562486; c=relaxed/simple;
	bh=BAuthF2Z16WH+zfDEHk3KKdJ2eXOVPk1jSTNkvFdwRk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bxv3FWr31xjMuvHYpc14UZE3jkHDK/uF66HPOgBaLMQ4PpDbWEZrrSDjBSAEz6IoxO5c5EiPqNfdl1/P09AIPs452DT0EzQXgatbN0/v+FrqGwqZWhXBy05qlAQ9qV2e6x0Zds0wwr89Dg/BzwhYtMrOh/gRrqdKCYhw/dAJ8i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m5ihgdcL; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m5ihgdcL"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8353fd1cb5fso2437541b3a.0
        for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 22:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778562485; x=1779167285; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=upF+QNLvJv5Mrb2znPY+HkCjKz2u/xiqje/4qNyRhbA=;
        b=m5ihgdcL5tPYrm/0zj/lMzll5cmtG5rr5GVeMHZ3D9JlNPYqkdg3CwQmwpTJDsEXi7
         rnoKhbzN6LLZTvsY2uGrwymavMV3zAK4iKFJpm18TBGcdISX/7pb/YuEtl9AbuUiN1V0
         2KNDQWFrvag0m3Jkel8OcWEQ523k98QQmLcoZ+9sGw8LfE7PDw24dsWAT281AqT4xWo2
         00kDJAHO9Y9U98AxofPIsu5zx2xb9VcHaE5baDwRqwJkZBWkwE6QdbpCCwDWfTXiqIP4
         +Lo5SJJqJY6Dp7RymQS/AnpIuKUmvPJZ1J69iKYbmKjl9YRnHkHiJ/5ObOSLcu/Brwmh
         Ddeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778562485; x=1779167285;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=upF+QNLvJv5Mrb2znPY+HkCjKz2u/xiqje/4qNyRhbA=;
        b=qlkqotJ9bdmw6tc4l/Bl3Wk3jsbypnd4xTjcJF2nlpiQcIdW2/l5bM80wAkPrZvIOa
         JyN5nqGxqba31HHUZI4h3UQtlTjNxZhxB2qWQpu10JIOiuGyvCad+dzcu30aqkJ7vhAd
         3fxFZi/iQkUmZ1514VhCgbTPiQ+YEyc1lbyC5qBfZkM+BNysCcgJ+vRSJ74UeYOcar7Y
         Nm32SoOmjFwERriQvm+BP7IZrW9MBG57K12OE82kS3C0hX8VHdTzAml6xyXXCtZy2Kp2
         XB3rtz72qxnpcpNE59VpWXjQtvBslk0WWseuQOn4AnhJHu7QqAr/D3FP2R8CWhDz7N4R
         sOdg==
X-Forwarded-Encrypted: i=1; AFNElJ83a6PyvcoSM5G5TJZG6x5vTr97KPdMo6O/l5UvflqZrDnkwUqG68byc53aUb/k/xvXS96QuQq5UiwTP6Cf@lists.linux.dev
X-Gm-Message-State: AOJu0Yyfy8iURvYBUXaie6L4e6goLqjvzEu8QwMK06f3X32gvly3vm2o
	wl1cFIoRH1SPPx4rFRPxUUf7iowj3usREiFRXOaeJxMJjaXofDxajTrz
X-Gm-Gg: Acq92OF5TcUGjg/mMY/09G1R2McA0I3LvG95vVYcERYf+eOcKVRh4ntfQeJtNonqM60
	M3u8SDXGJHQzud9QmFVRuiaGS4V/1rJAkA3V2jDulPAtYlFFFfAfaLK79ot7f9Kcx0w7Sb7BZnp
	p0/yrhnEonzy5CCVS+OX9Vk7cbJl6lgRCsWcxTXpyGnjt4GbbCg/pKVxgM8wkC37QbbujosBbzr
	m6tlpGaaHXCbn2qo3e6RBsS0nz42Yrnh+6WueJcawTO1yhMxnzQRqtbDGsDKjdtxakNHWv8vJJs
	dhVL1CDlopUEtUU/A+g9LuASaDdVgJ77U3kVvmLNrcmrKIjSEsSrCd9R73cj45I6vm1RvSrtVou
	F3k018NfhPojmSr52ylvM6VJDFAyj9o1w4G5/7oDbaQYxolOokyIcv0SSlCqdM/EWwHrv2VyXh5
	Gf3CuTMwPOraK5ovJ+XexPR6A5LXAQNwN9bvIvc38wy95SuuZsw9Lx6x5e1VC29bCA7whjnwEus
	cbKVG2v2i4rfSY=
X-Received: by 2002:a05:6a00:3981:b0:82f:39df:dd54 with SMTP id d2e1a72fcca58-83ee83021e3mr2137334b3a.8.1778562484707;
        Mon, 11 May 2026 22:08:04 -0700 (PDT)
Received: from localhost.localdomain ([2404:7c00:52:d485:aae2:91ff:fe57:5e15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c7b92sm21645449b3a.29.2026.05.11.22.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 22:08:04 -0700 (PDT)
From: Chhabilal Dangal <yogeshdangal66@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chhabilal Dangal <yogeshdangal66@gmail.com>
Subject: [PATCH v1 2/2] staging: sm750fb: remove unused functions
Date: Tue, 12 May 2026 10:52:25 +0545
Message-ID: <20260512050725.58408-1-yogeshdangal66@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sm750_hw_cursor_set_data2() in sm750_cursor.c is defined and declared
but never called anywhere in the driver.

sm750_enable_i2c() in ddk750_power.c is similarly defined and declared
but has no callers. The software I2C implementation (ddk750_swi2c.c)
uses GPIO directly rather than the I2C gate.

Remove both dead functions and their declarations per the TODO item
to refine the code and remove unused code.

Tested by building the full kernel and module with CONFIG_FB_SM750=m
on x86_64:
  make -j$(nproc)
  make M=drivers/staging/sm750fb modules
Signed-off-by: Chhabilal Dangal <yogeshdangal66@gmail.com>
---
 drivers/staging/sm750fb/ddk750_power.c | 16 ----------------
 drivers/staging/sm750fb/ddk750_power.h |  5 -----
 drivers/staging/sm750fb/sm750_cursor.h |  2 --
 3 files changed, 23 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_power.c b/drivers/staging/sm750fb/ddk750_power.c
index 12834f78eef7..1f7e0ec1d02b 100644
--- a/drivers/staging/sm750fb/ddk750_power.c
+++ b/drivers/staging/sm750fb/ddk750_power.c
@@ -127,19 +127,3 @@ void sm750_enable_gpio(unsigned int enable)
 	sm750_set_current_gate(gate);
 }
 
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
2.54.0

