Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253694EA385
	for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 06:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778567727; cv=none; b=ma6e2viebe3Gs7dS6pNckHzcKzba6YyvCn9uryp0WQPk32e88J/yKev46cdOBb+rxcddkMj8NQVab/VQoDrizPkeVH/+Cmd0XAYesdWq6/Fs16t+gggzprCPiQc7FYH1eu4dC3MHNw9V2phui2OnDon3incmGtELX6NiD0EdmmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778567727; c=relaxed/simple;
	bh=RfXyqAbEpc/Ebt1Tm5FG0xI5sYAI0W45gTZdDXhdGQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SqJANjTqGYugcdidq43fI6UfkeAu4c9nwvef3p8ujjhz0liNT7/IQUoXUYHK20vLWQlQZacVYYir0stW3H/ENWPUKLhtwLiSz/wbGgpZgvrdXoWwUXaN3F+wl3N4la20+TIUDJgWoYL05ojGYfFEl0wesky1ZYnNee0JfZWoGQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mva8zL/v; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mva8zL/v"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3660daea6a5so2713432a91.1
        for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 23:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778567717; x=1779172517; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GE3c15q44/WMPZ4E65RvxWCHOUX7Li7yDwaf8XQdnfo=;
        b=mva8zL/vua5MdGj7BKLt8/7V+khyXfWldBRgoiB8kSBodhBY7b0B8BhQCDoBVujnTM
         KcW+jFV5fFxEnIrNueYnZJrbjyop6D/Hw0wJpUzPawpqP3olgdBoAk1rhAfR3ekqlLmx
         P/0dIHfUe8xeZx4g3mqTRz3wbiwpax423/Ym9Ek8hvDz2aRiaWav+WIzTLv8H5UfJ90e
         5UJf2+2zsOARS3/14eGuQ3qLhQR2dLCDM9nKgbnLEQsz8pxMeHYgRZI+P9ojrej5un0M
         I97oRTxWWWUxD9f7NKs8qVA9PzwIvI5so2H4HK6fmUuHrhx2Bx9alOxGoNilTRBYx7C3
         QAGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778567717; x=1779172517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GE3c15q44/WMPZ4E65RvxWCHOUX7Li7yDwaf8XQdnfo=;
        b=RW/MWSDTG7UGRRMc2skJX9GeI8ZHaKdTV56x8bih+/0CsHRiMTTuRQWTwc3qoL32wC
         ADM88VA8te6U0v/WnzZXjDcxD/It43Grm9Kplm8Z3HJCmJjJy0z6fBjy/SrA+/YUXoPm
         16VZmRxHs5KCJPobeobmWLKK0qZv+J74u8NDVJB4Kg6+DkoGx3YhDiiAMZngd6FFv1EL
         swVAQIv+QxbdRJyZmIX9KoWOA17JJ2LrlB9TjGn8RMitWH7SCmgbbeU4TsuoKM2Ou+Dj
         p9y4i0b9hhnf/FCNZsTCewNgKWooMdbTHGRuJOuuCpJ0dARiXImB7udqSMCpNiRIxyqB
         iyrA==
X-Forwarded-Encrypted: i=1; AFNElJ88/DfUN6fcJ207wbV7MmLXgjEjXnvKp9BXTYbDjFaXKuaUVSYan3evAgn+f8/SFJdvrO1Glogx1utuO2WY@lists.linux.dev
X-Gm-Message-State: AOJu0YzGffSdzl1n/3Xn5MhIU7AJgT8QlPMnL1Sqr3SfhG4KYiuhKMZr
	CTgRsj3/SrccHKGpKkHmSSKXXmrJzi6ypsiW22q7zdWdZkc03Hr6Fc71
X-Gm-Gg: Acq92OG0P4gHbHWEnZT4Qw/qJ1OYqIU+zikFVHmdpUO1C4EKJorcFemLlhzQ50wSLpV
	O6NCz2N0iM1p9+Z97k4exuPiqYrw1WjX7SsyTPKL96VFmRECglWhGl3IC6HDLcnWcwAu8jwgI+f
	Z8f2qiNvXKTVzhJWwpJsYpd1k76B6whoTTj6VWyhYM47uaBXr75vQMKsIFZK3WdzeCwwqPIFs/o
	JqEawtSBT1oSdSCzssiXyNSigBT32lsH7488COPzbsw6xhfKEMqez19DcMOXXqo87itB1WiTwZP
	u98Rni9Rejj7gC/HEVyvkLgx0ZP8UoQNSQXbsQARpskwmrhtcD3tQiq/abpouf6S08rFQu78Pug
	ZW2i7n3Ka0bW0u1XMIj4nmserWIyIEYVCAJzUqQGTugliwWHvHrN+JFRgbqrP733EP/H5Rnvrn8
	YETgCxvj87meEXZmcVbtX4DSh0JfcxrDGazzUo41lR0l6Ssx9Qgk02ZWEDP9s5DJC8jIy//ng=
X-Received: by 2002:a17:90b:4b02:b0:368:6ff3:6675 with SMTP id 98e67ed59e1d1-3686ff36c68mr6533453a91.3.1778567716567;
        Mon, 11 May 2026 23:35:16 -0700 (PDT)
Received: from localhost ([2404:7c00:52:d485:aae2:91ff:fe57:5e15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368b01ef884sm620845a91.5.2026.05.11.23.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 23:35:16 -0700 (PDT)
From: Chhabilal Dangal <yogeshdangal66@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chhabilal Dangal <yogeshdangal66@gmail.com>
Subject: [PATCH v3 3/3] staging: sm750fb: remove unused functions
Date: Tue, 12 May 2026 12:19:57 +0545
Message-ID: <20260512063457.80882-3-yogeshdangal66@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260512063457.80882-1-yogeshdangal66@gmail.com>
References: <20260512063457.80882-1-yogeshdangal66@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sm750_hw_cursor_set_data2() in sm750_cursor.c and sm750_enable_i2c()
in ddk750_power.c are defined and declared but never called.

Remove both dead functions and their declarations.

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

