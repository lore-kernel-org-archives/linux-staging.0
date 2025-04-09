Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E4B27603D
	for <linux-staging@lists.linux.dev>; Wed,  9 Apr 2025 18:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744222203; cv=none; b=IJ6NQ880JhPLZekac+c8HxyNLeTU/n5Y/xtWw8H/sdFqOBpclizc5J2UwlJl8UyZeWTGm9eyi2q5hf3z6kNHkjsQSa9a17JHPQJjHIEH/I0emxobwxDYqimv5GBI4cSfnes06lttpauGihHDgojQNySU68DhlDSd5rLDsBcaqh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744222203; c=relaxed/simple;
	bh=jqUPwEQlcnwZt3/asgScigP93X2I5b2gZl/ENeZQ3iE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m7lV0qtRkA8Cn+4OR2Gr28A+1wY6dO9Qm1DEZL4ZVJxu1tIOCkat1tz75WalZ528lSDkbSZkrQ0bAL2Saq6wbmd6SwZmxcjAYw9TARgO4M6kj8YtqnG6qKNUPmIGH8cj9Ji4wtk1yeX+LzTC8qAbQ/SN6VdlSif3lRrXz8zK0gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=hNABelYe; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="hNABelYe"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-227a8cdd241so83407555ad.3
        for <linux-staging@lists.linux.dev>; Wed, 09 Apr 2025 11:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744222200; x=1744827000; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CecMt/raU8dnOgWd9SQV1F1UDBfO/Dd21R5LTc9yaMI=;
        b=hNABelYeYnuZB5QzCrzTQY0u9VJd+1sZJ0w+1r5kyZgFHCp74RKtaBo6P0VOSpycjP
         peL4Q9heU7rHIpwexMVHSMfpTE32AEBsEDT+lR5dYcYbdoez75YJB2/Gst44uZTxGj4G
         228UM6XQw4+D9IxjYzP1Xz8shxj6MUyyOfJdDsSGf/uvRwlHfo6/n0NcR1pxmD0eAoCw
         OZv6i+FtEwQX9e6clKPvJ7Ydlf1FdC8uUV7ZFmTzy8vV4/2WAlaT11qREimFvt8TnFMF
         CLiTVwipy/LPVyvqIaL80xvD+wWsFF91TEu4Pk4DLGUYFAlomqKpH7jt9M5TvvRCASFm
         fJLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744222200; x=1744827000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CecMt/raU8dnOgWd9SQV1F1UDBfO/Dd21R5LTc9yaMI=;
        b=APyjp0WHTeuilxU0zI+NLuxiO5PdvK7l3HFFADcbWvrXr3VwnIoKm0nS3lUEUwHCfc
         EG5AgctRvBdPm0+ZjEttIaYt96sZoJbZq0vprZ3w47jCxcNNErKDd6FkV2+5n8mEbeFI
         9sn6GPAYR+zv40qeAlj3vRUTxI7mt89cWaMVgFxxeLfTsDfxUg1QCF+wxZCwvJYdUqvi
         kQgdwK3Z/6eM3DF3oOL3jH9yCJLlnh7OaPYB5BHOJlqI1EOeUmmQD0s64uY3g+N5K9jx
         EOkojJZeasKfQcXNwQve3j5FesOIw1b/eSTiCD/1n9+emvnRABp47+xXu95M1ETlgj58
         IC6g==
X-Gm-Message-State: AOJu0YyCii0W4gLnMSPRT3KdjriNyCNuck+kgB/3HQc8TaW8I3wD7H16
	MWk1ZkqPBdWrMyxAm/PS/7sgXX9WxtKJc76PEFFiKc+nw12FCk9eU2NHG8VanQ==
X-Gm-Gg: ASbGncsrO8EByKjhHIkA9rXRHhuIRcl3J6WXnBtLZu87sPHAWUWkFH0vGbQ7wprbzNg
	VMLuludYjhFxFyafj0eC9Y/en8L2DhkfOoSNHt0FnrzzfBJIK+5mgtJ+AwDdInNbdqvdR+mTduf
	44jpKvEhRdvLPpLQBdh1u9HJG80sqKcwBHqcfytG4a7da/5Olu/AFNi8JK5IIcv5V2NUHlg2q7K
	7jn3DSCLEkJQGZBN4a1nc30D/mHPV6jnm+18+WJ7ClBYglC2Mrfcspyu44qzmYlChgQQSfcn+wD
	cBVf7YDHDcVjfBqjuftGoeRxxi5+wAfn+jzqrkt5/GjC3JPR4n8ZUkebd5QLaQVAQVVCL7IMvZs
	Uaj/aaw==
X-Google-Smtp-Source: AGHT+IEWUOHZgP8g4/g3KQWG8J1PQkBdlWsjrYzDs/V3gnf3e76QSCrxCzAE8HB12n1p9qtyZvIaBQ==
X-Received: by 2002:a17:902:d48b:b0:215:94eb:adb6 with SMTP id d9443c01a7336-22ac2a1dee3mr64152325ad.40.1744222200490;
        Wed, 09 Apr 2025 11:10:00 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b62b88sm15201115ad.41.2025.04.09.11.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 11:10:00 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 04/23] staging: gpib: fmh_gpib: u8 over uint8_t
Date: Wed,  9 Apr 2025 18:09:34 +0000
Message-ID: <20250409180953.398686-5-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250409180953.398686-1-matchstick@neverthere.org>
References: <20250409180953.398686-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reported by checkpatch.pl.

CHECK: Prefer kernel type 'u8' over 'uint8_t'

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/fmh_gpib/fmh_gpib.c | 32 ++++++++++++------------
 drivers/staging/gpib/fmh_gpib/fmh_gpib.h |  6 ++---
 2 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/gpib/fmh_gpib/fmh_gpib.c b/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
index 30fbf1065de2..261d663cf8c1 100644
--- a/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
+++ b/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
@@ -48,7 +48,7 @@ static struct platform_driver fmh_gpib_platform_driver;
 static struct pci_driver fmh_gpib_pci_driver;
 
 // wrappers for interface functions
-static int fmh_gpib_read(struct gpib_board *board, uint8_t *buffer, size_t length,
+static int fmh_gpib_read(struct gpib_board *board, u8 *buffer, size_t length,
 			 int *end, size_t *bytes_read)
 {
 	struct fmh_priv *priv = board->private_data;
@@ -56,7 +56,7 @@ static int fmh_gpib_read(struct gpib_board *board, uint8_t *buffer, size_t lengt
 	return nec7210_read(board, &priv->nec7210_priv, buffer, length, end, bytes_read);
 }
 
-static int fmh_gpib_write(struct gpib_board *board, uint8_t *buffer, size_t length,
+static int fmh_gpib_write(struct gpib_board *board, u8 *buffer, size_t length,
 			  int send_eoi, size_t *bytes_written)
 {
 	struct fmh_priv *priv = board->private_data;
@@ -64,7 +64,7 @@ static int fmh_gpib_write(struct gpib_board *board, uint8_t *buffer, size_t leng
 	return nec7210_write(board, &priv->nec7210_priv, buffer, length, send_eoi, bytes_written);
 }
 
-static int fmh_gpib_command(struct gpib_board *board, uint8_t *buffer, size_t length,
+static int fmh_gpib_command(struct gpib_board *board, u8 *buffer, size_t length,
 			    size_t *bytes_written)
 {
 	struct fmh_priv *priv = board->private_data;
@@ -108,7 +108,7 @@ static void fmh_gpib_remote_enable(struct gpib_board *board, int enable)
 	nec7210_remote_enable(board, &priv->nec7210_priv, enable);
 }
 
-static int fmh_gpib_enable_eos(struct gpib_board *board, uint8_t eos_byte, int compare_8_bits)
+static int fmh_gpib_enable_eos(struct gpib_board *board, u8 eos_byte, int compare_8_bits)
 {
 	struct fmh_priv *priv = board->private_data;
 
@@ -143,14 +143,14 @@ static int fmh_gpib_secondary_address(struct gpib_board *board, unsigned int add
 	return nec7210_secondary_address(board, &priv->nec7210_priv, address, enable);
 }
 
-static int fmh_gpib_parallel_poll(struct gpib_board *board, uint8_t *result)
+static int fmh_gpib_parallel_poll(struct gpib_board *board, u8 *result)
 {
 	struct fmh_priv *priv = board->private_data;
 
 	return nec7210_parallel_poll(board, &priv->nec7210_priv, result);
 }
 
-static void fmh_gpib_parallel_poll_configure(struct gpib_board *board, uint8_t configuration)
+static void fmh_gpib_parallel_poll_configure(struct gpib_board *board, u8 configuration)
 {
 	struct fmh_priv *priv = board->private_data;
 
@@ -179,7 +179,7 @@ static void fmh_gpib_local_parallel_poll_mode(struct gpib_board *board, int loca
 	}
 }
 
-static void fmh_gpib_serial_poll_response2(struct gpib_board *board, uint8_t status,
+static void fmh_gpib_serial_poll_response2(struct gpib_board *board, u8 status,
 					   int new_reason_for_service)
 {
 	struct fmh_priv *priv = board->private_data;
@@ -214,7 +214,7 @@ static void fmh_gpib_serial_poll_response2(struct gpib_board *board, uint8_t sta
 	spin_unlock_irqrestore(&board->spinlock, flags);
 }
 
-static uint8_t fmh_gpib_serial_poll_status(struct gpib_board *board)
+static u8 fmh_gpib_serial_poll_status(struct gpib_board *board)
 {
 	struct fmh_priv *priv = board->private_data;
 
@@ -393,7 +393,7 @@ static int fmh_gpib_all_bytes_are_sent(struct fmh_priv *e_priv)
 	return 1;
 }
 
-static int fmh_gpib_dma_write(struct gpib_board *board, uint8_t *buffer, size_t length,
+static int fmh_gpib_dma_write(struct gpib_board *board, u8 *buffer, size_t length,
 			      size_t *bytes_written)
 {
 	struct fmh_priv *e_priv = board->private_data;
@@ -471,7 +471,7 @@ static int fmh_gpib_dma_write(struct gpib_board *board, uint8_t *buffer, size_t
 	return retval;
 }
 
-static int fmh_gpib_accel_write(struct gpib_board *board, uint8_t *buffer,
+static int fmh_gpib_accel_write(struct gpib_board *board, u8 *buffer,
 				size_t length, int send_eoi, size_t *bytes_written)
 {
 	struct fmh_priv *e_priv = board->private_data;
@@ -586,7 +586,7 @@ static int wait_for_tx_fifo_half_empty(struct gpib_board *board)
 /* supports writing a chunk of data whose length must fit into the hardware'd xfer counter,
  * called in a loop by fmh_gpib_fifo_write()
  */
-static int fmh_gpib_fifo_write_countable(struct gpib_board *board, uint8_t *buffer,
+static int fmh_gpib_fifo_write_countable(struct gpib_board *board, u8 *buffer,
 					 size_t length, int send_eoi, size_t *bytes_written)
 {
 	struct fmh_priv *e_priv = board->private_data;
@@ -652,7 +652,7 @@ static int fmh_gpib_fifo_write_countable(struct gpib_board *board, uint8_t *buff
 	return retval;
 }
 
-static int fmh_gpib_fifo_write(struct gpib_board *board, uint8_t *buffer, size_t length,
+static int fmh_gpib_fifo_write(struct gpib_board *board, u8 *buffer, size_t length,
 			       int send_eoi, size_t *bytes_written)
 {
 	struct fmh_priv *e_priv = board->private_data;
@@ -699,7 +699,7 @@ static int fmh_gpib_fifo_write(struct gpib_board *board, uint8_t *buffer, size_t
 	return retval;
 }
 
-static int fmh_gpib_dma_read(struct gpib_board *board, uint8_t *buffer,
+static int fmh_gpib_dma_read(struct gpib_board *board, u8 *buffer,
 			     size_t length, int *end, size_t *bytes_read)
 {
 	struct fmh_priv *e_priv = board->private_data;
@@ -848,7 +848,7 @@ static void fmh_gpib_release_rfd_holdoff(struct gpib_board *board, struct fmh_pr
 	spin_unlock_irqrestore(&board->spinlock, flags);
 }
 
-static int fmh_gpib_accel_read(struct gpib_board *board, uint8_t *buffer, size_t length,
+static int fmh_gpib_accel_read(struct gpib_board *board, u8 *buffer, size_t length,
 			       int *end, size_t *bytes_read)
 {
 	struct fmh_priv *e_priv = board->private_data;
@@ -898,7 +898,7 @@ static int fmh_gpib_accel_read(struct gpib_board *board, uint8_t *buffer, size_t
 /* Read a chunk of data whose length is within the limits of the hardware's
  * xfer counter.  Called in a loop from fmh_gpib_fifo_read().
  */
-static int fmh_gpib_fifo_read_countable(struct gpib_board *board, uint8_t *buffer,
+static int fmh_gpib_fifo_read_countable(struct gpib_board *board, u8 *buffer,
 					size_t length, int *end, size_t *bytes_read)
 {
 	struct fmh_priv *e_priv = board->private_data;
@@ -956,7 +956,7 @@ static int fmh_gpib_fifo_read_countable(struct gpib_board *board, uint8_t *buffe
 	return retval;
 }
 
-static int fmh_gpib_fifo_read(struct gpib_board *board, uint8_t *buffer, size_t length,
+static int fmh_gpib_fifo_read(struct gpib_board *board, u8 *buffer, size_t length,
 			      int *end, size_t *bytes_read)
 {
 	struct fmh_priv *e_priv = board->private_data;
diff --git a/drivers/staging/gpib/fmh_gpib/fmh_gpib.h b/drivers/staging/gpib/fmh_gpib/fmh_gpib.h
index de6fd2164414..e7602d7e1401 100644
--- a/drivers/staging/gpib/fmh_gpib/fmh_gpib.h
+++ b/drivers/staging/gpib/fmh_gpib/fmh_gpib.h
@@ -124,13 +124,13 @@ static const unsigned int fifo_data_mask = 0x00ff;
 static const unsigned int fifo_xfer_counter_mask = 0x0fff;
 static const unsigned int fifo_max_burst_length_mask = 0x00ff;
 
-static inline uint8_t gpib_cs_read_byte(struct nec7210_priv *nec_priv,
-					unsigned int register_num)
+static inline u8 gpib_cs_read_byte(struct nec7210_priv *nec_priv,
+				   unsigned int register_num)
 {
 	return readb(nec_priv->mmiobase + register_num * nec_priv->offset);
 }
 
-static inline void gpib_cs_write_byte(struct nec7210_priv *nec_priv, uint8_t data,
+static inline void gpib_cs_write_byte(struct nec7210_priv *nec_priv, u8 data,
 				      unsigned int register_num)
 {
 	writeb(data, nec_priv->mmiobase + register_num * nec_priv->offset);
-- 
2.43.0

