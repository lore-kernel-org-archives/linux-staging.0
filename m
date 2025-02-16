Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A68A748F
	for <linux-staging@lists.linux.dev>; Sun, 16 Feb 2025 22:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739745940; cv=none; b=MKvcvWWeY6OXoBvz4hX/R6lDcHuiIfOLouYD3v5VTmsQBNqd0/uXy+UJB9rwfyc3Jnen+mE/2t/qQ8TKXfuIp70CihSowIvnSftoTCmz5m6lCJCjXX0yG+aQ5u/FGbMrOsP56HAxKAVLiXL8qpSSuiXYYcSGNy+0gC8TFDvb5hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739745940; c=relaxed/simple;
	bh=o5h+vxYNv93C+B5377DoXBzz3I1RzT+aVxCT1CztCts=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V6T2ItnMWW0pYOUspiM49K9VFL+4DVEPfOKdfNNhn+Y5+Yt1vwxyyN5Zq/SSTqOIxvr+3az2MclJpDnMj0xz7OWMxHTNu7FyS9uCBiHWz2NnQRx48NcCC0uf6oZpEF8TgoCJ0tKzBEmcio72GHnyBEG+zx44KZU3Gy9shSgQQj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WCAScxtL; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WCAScxtL"
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-220c4159f87so49284785ad.0
        for <linux-staging@lists.linux.dev>; Sun, 16 Feb 2025 14:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739745938; x=1740350738; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1lXgZGYbOeNkArlRc4xYi0BsMJqExmF6NA5ol15gPq0=;
        b=WCAScxtLo1y/UbwGpp6JfPtwwoF6vIgXjGvxHws7AuSoeexgPRDmCC+UIwJ4jYdQBT
         UK1RsOM3nBt2wKrss4jz6r3RMGCqOTR22NV7BGuQ6m+ES8oHxoB2RCtW3ffRa+XlptF8
         8fceI432WY/JFTuDhZLeYVcYcYqitGHQqJKlm58lemeJQj3LlwdfYRePr1wZklcHe2u/
         ACl6nSHz+dacvRYSiyhflyc4g51Gm0XbSnx3FGYEObJFmBO7GQ01vJs7sSS68iwBQxVs
         ztLCbALpBM6NS/0iP0+SQDgZAJNz+8QrFZTghw84hhWLN+hneU8ZXUtHGkC1iI/jYGzj
         qRYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739745938; x=1740350738;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1lXgZGYbOeNkArlRc4xYi0BsMJqExmF6NA5ol15gPq0=;
        b=q3DcxZxI+6e87u6/bg59jXf3yPkFGR4YznHf4s9B0zuLdKtQiqdZB7iiwrUI79QhFf
         D54j33h2w0JfanXHzir0VK/I8sat4oxncey4MSTYkr2X3nHZh5fC7s1ujFHGvBZbuiWB
         T+xZzk2dq6FSHMQac66m9/s0mmLNG8xHSqToern8/12EpBSVpNa8Djj8pH+h7WizQYqi
         taD2YG8AxC7SNGVCK1zjlOX5j5clAoNhwRh9oCfiLokJQ8fZM+nES53pFDYE7WzyrHKZ
         g7FEnE99WtJ1D++G8x5BRHnO3ids7vb8rgONtioVNUk+WZz27C3kGZoz2DsWBhiDk8Kh
         4rSA==
X-Forwarded-Encrypted: i=1; AJvYcCWquereXGSuF0MBw/hwKfUj3MO19f48I7mzO8RIwbeoZdho+5ci5QkaaaC/ahmRx+JdCaDJEe8L4JmViE/0@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8qAlxR6vV7fymZj4a912JZ6/20WkJk5D2OlxrljvxdYYwjTub
	UOXsPfg1K1IMNMXOn5QgJYpQj/AWQLlyNvJhG3mU5DJQaykH4sG3
X-Gm-Gg: ASbGncuPdr6WOWhdSOh7LR8ZF2Yqnm0EAs4gUpDCQkwcdSZuovR9yFrBOsksuCmFu4u
	tTpRzM7WyITr4wsWNqLl+cdA2o4umrKqPVipLANFfOgtc0QflEPN5vPYCiFoivuxOJgK4XlyxRi
	k26rfYemIQRSVMZg8VaIIR0aFZEtqQtUAcol8BxSeZwzvAbxfD55p3R7mkjCHXehsnczoYuhVqG
	yMYk29UGEQFZJSs1qTL+36garTlRi4L//koNvbtlC5JCXaSaq+tmUc+qTiYpUtmm5N+rrvp10lb
	rskFV/BIFVbnLZ1q
X-Google-Smtp-Source: AGHT+IETsdToexfOKnV5RTAsBCUGxTRJy/k3CPXnlBh32kLjeoH5tmu6Ztfx5d8mopXKW1L5W9JtpA==
X-Received: by 2002:a17:902:f54e:b0:220:ca08:8986 with SMTP id d9443c01a7336-2210402d6b2mr139799835ad.22.1739745937571;
        Sun, 16 Feb 2025 14:45:37 -0800 (PST)
Received: from pronto ([2409:4066:d04:319e:1d76:db25:b6bf:4f52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d556fbeesm59571015ad.183.2025.02.16.14.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 14:45:37 -0800 (PST)
Date: Mon, 17 Feb 2025 04:15:32 +0530
From: Ravi Kumar Kairi <kumarkairiravi@gmail.com>
To: dpenkler@gmail.com
Cc: gregkh@linuxfoundation.org, krzysztof.kozlowski@linaro.org,
	broonie@kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging:gpib:agilent_82350b: Fixed spelling errors removed
 commented code
Message-ID: <Z7JqjL_qGn8zEQXF@pronto>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fixed spelling error from "havn't" to "haven't" and removed commented
code which created empty lines removed them as well, removed few
whitespaces and other empty lines. Removed braces from a single line.

Signed-off-by: Ravi Kumar Kairi <kumarkairiravi@gmail.com>
---
 .../gpib/agilent_82350b/agilent_82350b.c      | 29 ++++---------------
 1 file changed, 6 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
index 5c62ec24fc..9c9e66b85b 100644
--- a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
+++ b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
@@ -48,7 +48,7 @@ static int agilent_82350b_accel_read(gpib_board_t *board, uint8_t *buffer, size_
 		return 0;
 	//disable fifo for the moment
 	writeb(DIRECTION_GPIB_TO_HOST, a_priv->gpib_base + SRAM_ACCESS_CONTROL_REG);
-	// handle corner case of board not in holdoff and one byte might slip in early
+	// handle corner case of board not in hold off and one byte might slip in early
 	if (tms_priv->holdoff_active == 0 && length > 1) {
 		size_t num_bytes;
 
@@ -121,10 +121,10 @@ static int agilent_82350b_accel_read(gpib_board_t *board, uint8_t *buffer, size_
 	writeb(DIRECTION_GPIB_TO_HOST, a_priv->gpib_base + SRAM_ACCESS_CONTROL_REG);
 	if (retval < 0)
 		return retval;
-	// read last bytes if we havn't received an END yet
+	// read last bytes if we haven't received an END yet
 	if (*end == 0) {
 		size_t num_bytes;
-		// try to make sure we holdoff after last byte read
+		// try to make sure we hold off after last byte read
 		retval = tms9914_read(board, tms_priv, buffer, length, end, &num_bytes);
 		*bytes_read += num_bytes;
 		if (retval < 0)
@@ -176,8 +176,6 @@ static int agilent_82350b_accel_write(gpib_board_t *board, uint8_t *buffer, size
 
 	event_status = read_and_clear_event_status(board);
 
-	//pr_info("ag_ac_wr: event status 0x%x tms state 0x%lx\n", event_status, tms_priv->state);
-
 #ifdef EXPERIMENTAL
 	pr_info("ag_ac_wr: wait for previous BO to complete if any\n");
 	retval = wait_event_interruptible(board->wait,
@@ -190,18 +188,14 @@ static int agilent_82350b_accel_write(gpib_board_t *board, uint8_t *buffer, size
 		return retval;
 #endif
 
-	//pr_info("ag_ac_wr: sending first byte\n");
 	retval = agilent_82350b_write(board, buffer, 1, 0, &num_bytes);
 	*bytes_written += num_bytes;
 	if (retval < 0)
 		return retval;
 
-	//pr_info("ag_ac_wr: %ld bytes eoi %d tms state 0x%lx\n",length, send_eoi, tms_priv->state);
-
 	write_byte(tms_priv, tms_priv->imr0_bits & ~HR_BOIE, IMR0);
 	for (i = 1; i < fifotransferlength;) {
 		clear_bit(WRITE_READY_BN, &tms_priv->state);
-
 		block_size = min(fifotransferlength - i, agilent_82350b_fifo_size);
 		set_transfer_counter(a_priv, block_size);
 		for (j = 0; j < block_size; ++j, ++i) {
@@ -210,13 +204,8 @@ static int agilent_82350b_accel_write(gpib_board_t *board, uint8_t *buffer, size
 		}
 		writeb(ENABLE_TI_TO_SRAM, a_priv->gpib_base + SRAM_ACCESS_CONTROL_REG);
 
-		//pr_info("ag_ac_wr: send block: %d bytes tms 0x%lx\n", block_size,
-		// tms_priv->state);
-
-		if (agilent_82350b_fifo_is_halted(a_priv)) {
+		if (agilent_82350b_fifo_is_halted(a_priv))
 			writeb(RESTART_STREAM_BIT, a_priv->gpib_base + STREAM_STATUS_REG);
-			//	pr_info("ag_ac_wr: needed restart\n");
-		}
 
 		retval = wait_event_interruptible(board->wait,
 						  ((event_status =
@@ -226,8 +215,6 @@ static int agilent_82350b_accel_write(gpib_board_t *board, uint8_t *buffer, size
 						  test_bit(TIMO_NUM, &board->status));
 		writeb(0, a_priv->gpib_base + SRAM_ACCESS_CONTROL_REG);
 		num_bytes = block_size - read_transfer_counter(a_priv);
-		//pr_info("ag_ac_wr: sent  %ld bytes tms 0x%lx\n", num_bytes, tms_priv->state);
-
 		*bytes_written += num_bytes;
 		retval = translate_wait_return_value(board, retval);
 		if (retval)
@@ -238,9 +225,6 @@ static int agilent_82350b_accel_write(gpib_board_t *board, uint8_t *buffer, size
 		return retval;
 
 	if (send_eoi) {
-		//pr_info("ag_ac_wr: sending last byte with eoi byte no:   %d\n",
-		// fifotransferlength+1);
-
 		retval = agilent_82350b_write(board, buffer + fifotransferlength, 1, send_eoi,
 					      &num_bytes);
 		*bytes_written += num_bytes;
@@ -284,8 +268,7 @@ static irqreturn_t agilent_82350b_interrupt(int irq, void *arg)
 		tms9914_interrupt_have_status(board, &a_priv->tms9914_priv, tms9914_status1,
 					      tms9914_status2);
 	}
-//pr_info("event_status=0x%x s1 %x s2 %x\n", event_status,tms9914_status1,tms9914_status2);
-//write-clear status bits
+
 	if (event_status & (BUFFER_END_STATUS_BIT | TERM_COUNT_STATUS_BIT)) {
 		writeb(event_status & (BUFFER_END_STATUS_BIT | TERM_COUNT_STATUS_BIT),
 		       a_priv->gpib_base + EVENT_STATUS_REG);
@@ -317,7 +300,7 @@ static void set_transfer_counter(struct agilent_82350b_priv *a_priv, int count)
 
 	writeb(complement & 0xff, a_priv->gpib_base + XFER_COUNT_LO_REG);
 	writeb((complement >> 8) & 0xff, a_priv->gpib_base + XFER_COUNT_MID_REG);
-	//I don't think the hi count reg is even used, but oh well
+	// I don't think the hi count reg is even used, but oh well
 	writeb((complement >> 16) & 0xf, a_priv->gpib_base + XFER_COUNT_HI_REG);
 }
 
-- 
2.48.1

