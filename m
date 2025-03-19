Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E9522258B
	for <linux-staging@lists.linux.dev>; Wed, 19 Mar 2025 21:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742421602; cv=none; b=SZswn/YDhyqKmMuGUb4DmiyyO8U9Lo6Q/hI5VMNjfu+fPeDIdsIYPn7oWqRmQKKUvlP2pchA+ZWKgqaMj1xF4GlHTnUu1OY9ZIqjVTuWFfxvvkR6Bap33BTWC7ekDRllIre+P+OMa0SYybojP6ARpw/GQbORh9OBbfudLqjbKDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742421602; c=relaxed/simple;
	bh=oSkyX86WPQ2oy6XZlMfq5KCFag3oWc//ibWpUhjN0YM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TOIqWW84FtsU7Dl3xtfVu7kKKqpGUSSANethkyXOhBVjD4Qt605xrKal8U0riy6lfZ6qATEoOBpMJpMk2B/4UnrIoETp5OgmNkIIjFwezjGwJGFb653wcr7CzmsGoWmEeU/o1ywVTMw9ACzgaKCQ3yyMfd90oLPRKjF6yueoFzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=B9562INB; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="B9562INB"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-224341bbc1dso798105ad.3
        for <linux-staging@lists.linux.dev>; Wed, 19 Mar 2025 14:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1742421599; x=1743026399; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7TPShQPwcbR0wWc9GXdkhoktbjVKQjXa4xvDcq95nA8=;
        b=B9562INBoV8t2AiJK8K5Xd7TYHAi1uLlwOZ2IJZn4JIUsCeOa096Sk+tzRzybSS3Yu
         8Ptcilu44r2b9cIaEQ0+4lvugxrehWAnYWD751dx/dYL3dHqxVEil1u1uTH+S4bxi59l
         n+tBbRyYp7JEf3NC5fpy0FDX8CdRS+gVe++Khhj1OuyMQMUptl/3v49Dun5R0Z8pPzMl
         BhgrlMVGgYst7SyWbs/tY1nQI3x+zao+kqGMlI9x7sO3OYSdfyAOr9uMvrXHxQMVHBz0
         7VbZqhT11NtHs6r8tGrmieeZX/Pkpfc8/zwk0qxRzkJP7WAppLjvr36Mg2fB+7jsmmDT
         q7uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742421599; x=1743026399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7TPShQPwcbR0wWc9GXdkhoktbjVKQjXa4xvDcq95nA8=;
        b=tjU8Xn0oaNFlkQ+c+8HfZcg8wEnNA6JzkiiYf66MQ1Gq3wnPLo3DkL+FXKvtm7F2Rr
         gnJOkN5gDLbkMqGi+d6sAEMm7c37rjbFbPGPeTlJYgnyimgVNFSTTLzBpZyyosMVhNmk
         HL5VB1/wODiy20IczlPgPSi7ibJKDDCeqnLweN+Edzc6/lx1Oof7IEioJMDvKzS4wWkH
         8azWoykDc1YBtNEFdg8Tq9aXqtAiIvv/Oec7BGmIaasRQYb9+PbPStqpuzmcf2fSBN39
         SNxRDyM8JfEed7FhmwNGL9FwL6mV/vy2UqxeduU5g4H/V0y5gSwplr317HrENIlmva8K
         q90g==
X-Gm-Message-State: AOJu0Ywzu5B0ELWlhKsxXkYfsX6p1oR+KxnCBzP2/9b7ZCieELnmAM/P
	hVRLSHw+SAzfb2sAzSncVLUENbEzyC5eAHHQRoIYstOgLFvtSM4YtBm2T/z+AA==
X-Gm-Gg: ASbGnctv7npuoZnx4TEz5g7cUGyQvIHOXDlBE70KFH3aDKod/nUYMg68x6Xq+d6q67X
	GMOU8+ClBKncSwlkNCjDKkqwruyVrzsJphmBEZ0WBque08TzcN9euQat9PEWCnPrdCZrIr5W3YX
	7HeEKE4U0OkpPUDOxVNWhw8/T3iJ9Rt+a0hG4LmqxTYOhJb4Ljoo9aQRTIYtuKB8ykGKEFNvABd
	Ob6x9Q98wpXLYqCob38oll+xCWLNhfOGpWtb7CZ5sw0QvXpfyEHW+LgjJhb4i1hDE6eWUvB20Eq
	qy8WecA4dBYRlDd0PJnTj6vfeSGREkMso62TN2XdhRFINUQdDJ62JRUbAZV5eb5FUDS7aNkdM1j
	kIJFRuz+Lhg==
X-Google-Smtp-Source: AGHT+IEIBsS2sRRMto4uxP3LsqFbJegXJQ1nGuGajJIP6ekBcJ4imrhcf5G77VNk+z4ZU3Vy7EtcVg==
X-Received: by 2002:a17:902:f652:b0:220:fe50:5b44 with SMTP id d9443c01a7336-22649928095mr62806625ad.31.1742421599396;
        Wed, 19 Mar 2025 14:59:59 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68bedd4sm120331005ad.105.2025.03.19.14.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 14:59:59 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 18/20] staging: gpib: tnt4882: struct gpib_board
Date: Wed, 19 Mar 2025 21:59:22 +0000
Message-ID: <20250319215924.19387-19-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250319215924.19387-1-matchstick@neverthere.org>
References: <20250319215924.19387-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_board.

Adhering to Linux code style.

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c | 100 ++++++++++----------
 1 file changed, 50 insertions(+), 50 deletions(-)

diff --git a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
index e62f3424ca20..bc99526f2d0c 100644
--- a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
+++ b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
@@ -51,7 +51,7 @@ struct tnt4882_priv {
 	unsigned short auxg_bits;	// bits written to auxiliary register G
 };
 
-static irqreturn_t tnt4882_internal_interrupt(gpib_board_t *board);
+static irqreturn_t tnt4882_internal_interrupt(struct gpib_board *board);
 
 // register offset for nec7210 compatible registers
 static const int atgpib_reg_offset = 2;
@@ -148,7 +148,7 @@ static inline void tnt_writeb(struct tnt4882_priv *priv, unsigned short value, u
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("GPIB driver for National Instruments boards using tnt4882 or compatible chips");
 
-static int tnt4882_line_status(const gpib_board_t *board)
+static int tnt4882_line_status(const struct gpib_board *board)
 {
 	int status = VALID_ALL;
 	int bcsr_bits;
@@ -178,7 +178,7 @@ static int tnt4882_line_status(const gpib_board_t *board)
 	return status;
 }
 
-static unsigned int tnt4882_t1_delay(gpib_board_t *board, unsigned int nano_sec)
+static unsigned int tnt4882_t1_delay(struct gpib_board *board, unsigned int nano_sec)
 {
 	struct tnt4882_priv *tnt_priv = board->private_data;
 	struct nec7210_priv *nec_priv = &tnt_priv->nec7210_priv;
@@ -251,7 +251,7 @@ static int drain_fifo_words(struct tnt4882_priv *tnt_priv, uint8_t *buffer, int
 	return count;
 }
 
-static void tnt4882_release_holdoff(gpib_board_t *board, struct tnt4882_priv *tnt_priv)
+static void tnt4882_release_holdoff(struct gpib_board *board, struct tnt4882_priv *tnt_priv)
 {
 	struct nec7210_priv *nec_priv = &tnt_priv->nec7210_priv;
 	unsigned short sasr_bits;
@@ -274,7 +274,7 @@ static void tnt4882_release_holdoff(gpib_board_t *board, struct tnt4882_priv *tn
 	}
 }
 
-static int tnt4882_accel_read(gpib_board_t *board, uint8_t *buffer, size_t length, int *end,
+static int tnt4882_accel_read(struct gpib_board *board, uint8_t *buffer, size_t length, int *end,
 			      size_t *bytes_read)
 {
 	size_t count = 0;
@@ -426,7 +426,7 @@ static unsigned int tnt_transfer_count(struct tnt4882_priv *tnt_priv)
 	return -count;
 };
 
-static int write_wait(gpib_board_t *board, struct tnt4882_priv *tnt_priv,
+static int write_wait(struct gpib_board *board, struct tnt4882_priv *tnt_priv,
 		      int wait_for_done, int send_commands)
 {
 	struct nec7210_priv *nec_priv = &tnt_priv->nec7210_priv;
@@ -448,7 +448,7 @@ static int write_wait(gpib_board_t *board, struct tnt4882_priv *tnt_priv,
 	return 0;
 }
 
-static int generic_write(gpib_board_t *board, uint8_t *buffer, size_t length,
+static int generic_write(struct gpib_board *board, uint8_t *buffer, size_t length,
 			 int send_eoi, int send_commands, size_t *bytes_written)
 {
 	size_t count = 0;
@@ -539,19 +539,19 @@ static int generic_write(gpib_board_t *board, uint8_t *buffer, size_t length,
 	return retval;
 }
 
-static int tnt4882_accel_write(gpib_board_t *board, uint8_t *buffer, size_t length, int send_eoi,
+static int tnt4882_accel_write(struct gpib_board *board, uint8_t *buffer, size_t length, int send_eoi,
 			       size_t *bytes_written)
 {
 	return generic_write(board, buffer, length, send_eoi, 0, bytes_written);
 }
 
-static int tnt4882_command(gpib_board_t *board, uint8_t *buffer, size_t length,
+static int tnt4882_command(struct gpib_board *board, uint8_t *buffer, size_t length,
 			   size_t *bytes_written)
 {
 	return generic_write(board, buffer, length, 0, 1, bytes_written);
 }
 
-static irqreturn_t tnt4882_internal_interrupt(gpib_board_t *board)
+static irqreturn_t tnt4882_internal_interrupt(struct gpib_board *board)
 {
 	struct tnt4882_priv *priv = board->private_data;
 	int isr0_bits, isr3_bits, imr3_bits;
@@ -592,7 +592,7 @@ static irqreturn_t tnt4882_interrupt(int irq, void *arg)
 }
 
 // wrappers for interface functions
-static int tnt4882_read(gpib_board_t *board, uint8_t *buffer, size_t length, int *end,
+static int tnt4882_read(struct gpib_board *board, uint8_t *buffer, size_t length, int *end,
 			size_t *bytes_read)
 {
 	struct tnt4882_priv *priv = board->private_data;
@@ -612,7 +612,7 @@ static int tnt4882_read(gpib_board_t *board, uint8_t *buffer, size_t length, int
 	return retval;
 }
 
-static int tnt4882_write(gpib_board_t *board, uint8_t *buffer, size_t length, int send_eoi,
+static int tnt4882_write(struct gpib_board *board, uint8_t *buffer, size_t length, int send_eoi,
 			 size_t *bytes_written)
 {
 	struct tnt4882_priv *priv = board->private_data;
@@ -620,7 +620,7 @@ static int tnt4882_write(gpib_board_t *board, uint8_t *buffer, size_t length, in
 	return nec7210_write(board, &priv->nec7210_priv, buffer, length, send_eoi, bytes_written);
 }
 
-static int tnt4882_command_unaccel(gpib_board_t *board, uint8_t *buffer,
+static int tnt4882_command_unaccel(struct gpib_board *board, uint8_t *buffer,
 				   size_t length, size_t *bytes_written)
 {
 	struct tnt4882_priv *priv = board->private_data;
@@ -628,21 +628,21 @@ static int tnt4882_command_unaccel(gpib_board_t *board, uint8_t *buffer,
 	return nec7210_command(board, &priv->nec7210_priv, buffer, length, bytes_written);
 }
 
-static int tnt4882_take_control(gpib_board_t *board, int synchronous)
+static int tnt4882_take_control(struct gpib_board *board, int synchronous)
 {
 	struct tnt4882_priv *priv = board->private_data;
 
 	return nec7210_take_control(board, &priv->nec7210_priv, synchronous);
 }
 
-static int tnt4882_go_to_standby(gpib_board_t *board)
+static int tnt4882_go_to_standby(struct gpib_board *board)
 {
 	struct tnt4882_priv *priv = board->private_data;
 
 	return nec7210_go_to_standby(board, &priv->nec7210_priv);
 }
 
-static void tnt4882_request_system_control(gpib_board_t *board, int request_control)
+static void tnt4882_request_system_control(struct gpib_board *board, int request_control)
 {
 	struct tnt4882_priv *priv = board->private_data;
 
@@ -657,35 +657,35 @@ static void tnt4882_request_system_control(gpib_board_t *board, int request_cont
 	}
 }
 
-static void tnt4882_interface_clear(gpib_board_t *board, int assert)
+static void tnt4882_interface_clear(struct gpib_board *board, int assert)
 {
 	struct tnt4882_priv *priv = board->private_data;
 
 	nec7210_interface_clear(board, &priv->nec7210_priv, assert);
 }
 
-static void tnt4882_remote_enable(gpib_board_t *board, int enable)
+static void tnt4882_remote_enable(struct gpib_board *board, int enable)
 {
 	struct tnt4882_priv *priv = board->private_data;
 
 	nec7210_remote_enable(board, &priv->nec7210_priv, enable);
 }
 
-static int tnt4882_enable_eos(gpib_board_t *board, uint8_t eos_byte, int compare_8_bits)
+static int tnt4882_enable_eos(struct gpib_board *board, uint8_t eos_byte, int compare_8_bits)
 {
 	struct tnt4882_priv *priv = board->private_data;
 
 	return nec7210_enable_eos(board, &priv->nec7210_priv, eos_byte, compare_8_bits);
 }
 
-static void tnt4882_disable_eos(gpib_board_t *board)
+static void tnt4882_disable_eos(struct gpib_board *board)
 {
 	struct tnt4882_priv *priv = board->private_data;
 
 	nec7210_disable_eos(board, &priv->nec7210_priv);
 }
 
-static unsigned int tnt4882_update_status(gpib_board_t *board, unsigned int clear_mask)
+static unsigned int tnt4882_update_status(struct gpib_board *board, unsigned int clear_mask)
 {
 	unsigned long flags;
 	u8 line_status;
@@ -704,21 +704,21 @@ static unsigned int tnt4882_update_status(gpib_board_t *board, unsigned int clea
 	return board->status;
 }
 
-static int tnt4882_primary_address(gpib_board_t *board, unsigned int address)
+static int tnt4882_primary_address(struct gpib_board *board, unsigned int address)
 {
 	struct tnt4882_priv *priv = board->private_data;
 
 	return nec7210_primary_address(board, &priv->nec7210_priv, address);
 }
 
-static int tnt4882_secondary_address(gpib_board_t *board, unsigned int address, int enable)
+static int tnt4882_secondary_address(struct gpib_board *board, unsigned int address, int enable)
 {
 	struct tnt4882_priv *priv = board->private_data;
 
 	return nec7210_secondary_address(board, &priv->nec7210_priv, address, enable);
 }
 
-static int tnt4882_parallel_poll(gpib_board_t *board, uint8_t *result)
+static int tnt4882_parallel_poll(struct gpib_board *board, uint8_t *result)
 {
 	struct tnt4882_priv *tnt_priv = board->private_data;
 
@@ -735,7 +735,7 @@ static int tnt4882_parallel_poll(gpib_board_t *board, uint8_t *result)
 	}
 }
 
-static void tnt4882_parallel_poll_configure(gpib_board_t *board, uint8_t config)
+static void tnt4882_parallel_poll_configure(struct gpib_board *board, uint8_t config)
 {
 	struct tnt4882_priv *priv = board->private_data;
 
@@ -753,7 +753,7 @@ static void tnt4882_parallel_poll_configure(gpib_board_t *board, uint8_t config)
 	}
 }
 
-static void tnt4882_parallel_poll_response(gpib_board_t *board, int ist)
+static void tnt4882_parallel_poll_response(struct gpib_board *board, int ist)
 {
 	struct tnt4882_priv *priv = board->private_data;
 
@@ -763,14 +763,14 @@ static void tnt4882_parallel_poll_response(gpib_board_t *board, int ist)
 /* this is just used by the old nec7210 isa interfaces, the newer
  * boards use tnt4882_serial_poll_response2
  */
-static void tnt4882_serial_poll_response(gpib_board_t *board, uint8_t status)
+static void tnt4882_serial_poll_response(struct gpib_board *board, uint8_t status)
 {
 	struct tnt4882_priv *priv = board->private_data;
 
 	nec7210_serial_poll_response(board, &priv->nec7210_priv, status);
 }
 
-static void tnt4882_serial_poll_response2(gpib_board_t *board, uint8_t status,
+static void tnt4882_serial_poll_response2(struct gpib_board *board, uint8_t status,
 					  int new_reason_for_service)
 {
 	struct tnt4882_priv *priv = board->private_data;
@@ -804,21 +804,21 @@ static void tnt4882_serial_poll_response2(gpib_board_t *board, uint8_t status,
 	spin_unlock_irqrestore(&board->spinlock, flags);
 }
 
-static uint8_t tnt4882_serial_poll_status(gpib_board_t *board)
+static uint8_t tnt4882_serial_poll_status(struct gpib_board *board)
 {
 	struct tnt4882_priv *priv = board->private_data;
 
 	return nec7210_serial_poll_status(board, &priv->nec7210_priv);
 }
 
-static void tnt4882_return_to_local(gpib_board_t *board)
+static void tnt4882_return_to_local(struct gpib_board *board)
 {
 	struct tnt4882_priv *priv = board->private_data;
 
 	nec7210_return_to_local(board, &priv->nec7210_priv);
 }
 
-static void tnt4882_board_reset(struct tnt4882_priv *tnt_priv, gpib_board_t *board)
+static void tnt4882_board_reset(struct tnt4882_priv *tnt_priv, struct gpib_board *board)
 {
 	struct nec7210_priv *nec_priv = &tnt_priv->nec7210_priv;
 
@@ -831,7 +831,7 @@ static void tnt4882_board_reset(struct tnt4882_priv *tnt_priv, gpib_board_t *boa
 	nec7210_board_reset(nec_priv, board);
 }
 
-static int tnt4882_allocate_private(gpib_board_t *board)
+static int tnt4882_allocate_private(struct gpib_board *board)
 {
 	struct tnt4882_priv *tnt_priv;
 
@@ -844,13 +844,13 @@ static int tnt4882_allocate_private(gpib_board_t *board)
 	return 0;
 }
 
-static void tnt4882_free_private(gpib_board_t *board)
+static void tnt4882_free_private(struct gpib_board *board)
 {
 	kfree(board->private_data);
 	board->private_data = NULL;
 }
 
-static void tnt4882_init(struct tnt4882_priv *tnt_priv, const gpib_board_t *board)
+static void tnt4882_init(struct tnt4882_priv *tnt_priv, const struct gpib_board *board)
 {
 	struct nec7210_priv *nec_priv = &tnt_priv->nec7210_priv;
 
@@ -898,7 +898,7 @@ static void tnt4882_init(struct tnt4882_priv *tnt_priv, const gpib_board_t *boar
 	tnt_writeb(tnt_priv, tnt_priv->imr0_bits, IMR0);
 }
 
-static int ni_pci_attach(gpib_board_t *board, const gpib_board_config_t *config)
+static int ni_pci_attach(struct gpib_board *board, const gpib_board_config_t *config)
 {
 	struct tnt4882_priv *tnt_priv;
 	struct nec7210_priv *nec_priv;
@@ -982,7 +982,7 @@ static int ni_pci_attach(gpib_board_t *board, const gpib_board_config_t *config)
 	return 0;
 }
 
-static void ni_pci_detach(gpib_board_t *board)
+static void ni_pci_detach(struct gpib_board *board)
 {
 	struct tnt4882_priv *tnt_priv = board->private_data;
 	struct nec7210_priv *nec_priv;
@@ -1019,7 +1019,7 @@ static int ni_isapnp_find(struct pnp_dev **dev)
 	return 0;
 }
 
-static int ni_isa_attach_common(gpib_board_t *board, const gpib_board_config_t *config,
+static int ni_isa_attach_common(struct gpib_board *board, const gpib_board_config_t *config,
 				enum nec7210_chipset chipset)
 {
 	struct tnt4882_priv *tnt_priv;
@@ -1075,22 +1075,22 @@ static int ni_isa_attach_common(gpib_board_t *board, const gpib_board_config_t *
 	return 0;
 }
 
-static int ni_tnt_isa_attach(gpib_board_t *board, const gpib_board_config_t *config)
+static int ni_tnt_isa_attach(struct gpib_board *board, const gpib_board_config_t *config)
 {
 	return ni_isa_attach_common(board, config, TNT4882);
 }
 
-static int ni_nat4882_isa_attach(gpib_board_t *board, const gpib_board_config_t *config)
+static int ni_nat4882_isa_attach(struct gpib_board *board, const gpib_board_config_t *config)
 {
 	return ni_isa_attach_common(board, config, NAT4882);
 }
 
-static int ni_nec_isa_attach(gpib_board_t *board, const gpib_board_config_t *config)
+static int ni_nec_isa_attach(struct gpib_board *board, const gpib_board_config_t *config)
 {
 	return ni_isa_attach_common(board, config, NEC7210);
 }
 
-static void ni_isa_detach(gpib_board_t *board)
+static void ni_isa_detach(struct gpib_board *board)
 {
 	struct tnt4882_priv *tnt_priv = board->private_data;
 	struct nec7210_priv *nec_priv;
@@ -1523,7 +1523,7 @@ static void __exit tnt4882_exit_module(void)
 
 static int ni_gpib_config(struct pcmcia_device  *link);
 static void ni_gpib_release(struct pcmcia_device *link);
-static void ni_pcmcia_detach(gpib_board_t *board);
+static void ni_pcmcia_detach(struct gpib_board *board);
 
 /*
  * A linked list of "instances" of the dummy device.  Each actual
@@ -1542,7 +1542,7 @@ static struct pcmcia_device   *curr_dev;
 
 struct local_info_t {
 	struct pcmcia_device	*p_dev;
-	gpib_board_t		*dev;
+	struct gpib_board		*dev;
 	int			stop;
 	struct bus_operations	*bus;
 };
@@ -1556,7 +1556,7 @@ struct local_info_t {
 static int ni_gpib_probe(struct pcmcia_device *link)
 {
 	struct local_info_t *info;
-	//struct gpib_board_t *dev;
+	//struct struct gpib_board *dev;
 
 	/* Allocate space for private device-specific data */
 	info = kzalloc(sizeof(*info), GFP_KERNEL);
@@ -1589,7 +1589,7 @@ static int ni_gpib_probe(struct pcmcia_device *link)
 static void ni_gpib_remove(struct pcmcia_device *link)
 {
 	struct local_info_t *info = link->priv;
-	//struct gpib_board_t *dev = info->dev;
+	//struct struct gpib_board *dev = info->dev;
 
 	if (info->dev)
 		ni_pcmcia_detach(info->dev);
@@ -1618,7 +1618,7 @@ static int ni_gpib_config_iteration(struct pcmcia_device *link,	void *priv_data)
 static int ni_gpib_config(struct pcmcia_device *link)
 {
 	//struct local_info_t *info = link->priv;
-	//gpib_board_t *dev = info->dev;
+	//struct gpib_board *dev = info->dev;
 	int last_ret;
 
 	last_ret = pcmcia_loop_config(link, &ni_gpib_config_iteration, NULL);
@@ -1649,7 +1649,7 @@ static void ni_gpib_release(struct pcmcia_device *link)
 static int ni_gpib_suspend(struct pcmcia_device *link)
 {
 	//struct local_info_t *info = link->priv;
-	//struct gpib_board_t *dev = info->dev;
+	//struct struct gpib_board *dev = info->dev;
 
 	if (link->open)
 		dev_warn(&link->dev, "Device still open\n");
@@ -1661,7 +1661,7 @@ static int ni_gpib_suspend(struct pcmcia_device *link)
 static int ni_gpib_resume(struct pcmcia_device *link)
 {
 	//struct local_info_t *info = link->priv;
-	//struct gpib_board_t *dev = info->dev;
+	//struct struct gpib_board *dev = info->dev;
 
 	/*if (link->open) {
 	 *	ni_gpib_probe(dev);	/ really?
@@ -1702,7 +1702,7 @@ static void __exit exit_ni_gpib_cs(void)
 
 static const int pcmcia_gpib_iosize = 32;
 
-static int ni_pcmcia_attach(gpib_board_t *board, const gpib_board_config_t *config)
+static int ni_pcmcia_attach(struct gpib_board *board, const gpib_board_config_t *config)
 {
 	struct local_info_t *info;
 	struct tnt4882_priv *tnt_priv;
@@ -1750,7 +1750,7 @@ static int ni_pcmcia_attach(gpib_board_t *board, const gpib_board_config_t *conf
 	return 0;
 }
 
-static void ni_pcmcia_detach(gpib_board_t *board)
+static void ni_pcmcia_detach(struct gpib_board *board)
 {
 	struct tnt4882_priv *tnt_priv = board->private_data;
 	struct nec7210_priv *nec_priv;
-- 
2.43.0

