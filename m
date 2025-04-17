Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B0D1D5172
	for <linux-staging@lists.linux.dev>; Thu, 17 Apr 2025 00:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744850751; cv=none; b=slS2n923Flzx4VVdsI9lyQQIhVdT+He+awHRVbRD3Id3GOBgA2L4OzvNxYbbHW8hzyiQMlq5swO6tE9R+hGiU9N7iebpqCnDbY1SCQt1NEYzRVEVMVloj/nQBgkltrQkXMeM0jp/WOFnw/nqpwGQlGZ29KEbIzbbb9cuPQCoUKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744850751; c=relaxed/simple;
	bh=Uf8hdJ0esOyHrstMds9ztbt/YWlLDotxQpLQRfIe4TQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VtH0OG1eEYaU2AXxEvIRMY1MMtxGQIctgT24S7yt5T0WfslI7QegScBacGYcL+DTsFewvH2H1DWjlaLpGHuI1YPFuKqqs0gTa8BqqWElZbagW68hLzfb+AgXMkO6XaEfuANJN2BnTJRwF+V9YUmfWxbHp4Y50d6+FpNl0ZPwmaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=QF6PLZgV; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="QF6PLZgV"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2241053582dso3398815ad.1
        for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 17:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744850748; x=1745455548; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b2BNNM03a2O4ef/en52iuKrDen3mrX992h2ND005joM=;
        b=QF6PLZgV48jlVydGMba+mhFarmgxslJxnowwZpDQPYpnqNTLnYNglR0A1V7YsTqDow
         dAAIRiUL8ojqXwFrLqvdwGqZa4o5pzKo11Yt9G4gpNn6sQeWQMtZoFpA33TNOZ+0i+N6
         G+qYd3WWgIpPNX/uwGtFOQ8zBlfA4rbpSME011ExF7+CJmKFzd/dtZ65Wj5xfSvkX9e2
         z1a5iVPQr5XSQnOBqGXMnFI1O5/Lr7etB1dgNFy59bZmQQCIMrFCqfUy1i9IsfuseatE
         0d8rDCS/Gbo7Iye2ajwedwxz8DR6yJBcOSvR05QhYmlPuAxiUhZvfaNWh8YI+hmYQC/E
         kBiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744850748; x=1745455548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b2BNNM03a2O4ef/en52iuKrDen3mrX992h2ND005joM=;
        b=PUWdR6iTLIZi+sVe1V0SXrvKOIKEWqMGdPgWLuLdQfgDl9gt+/mJs8j8scLD5uzQ+6
         eWT9cTR/XJx0AdTotMEoqLm9gR1xysEZctqsov4z7o+VTmHNwZ58dG+X5bZtGyynRcpN
         qVP4TKEk6mdZ4acZN5w75E8ISWZ8OdhHGxDt8s3TLLSmIPSbTJqwtLJU9Xj+yeE+O4R/
         oi4vpv9gi3sM9iMMAA+pkak7NEL4Kur5IaSYxG0NTuWCc+DQ+faqgv40kqgv0QmnxrJg
         ShL0nrJFDcCK8mGGJ/2vyDovk7/jGLXl4alDCqAC8miUVooFLR5mbNzOPSRAijgw0HZN
         E8mw==
X-Gm-Message-State: AOJu0YyM4wCGSIGQ8OzLapCEQ7YxDpbM2uBWOK9SkIP0T20ARrN3L243
	Qb1i4WU0Gu6KYYeFhTZF7uotqVoN+eVqgnkPQwG1mdJjpIYEpiLuQblGrUhR1w==
X-Gm-Gg: ASbGncvAZheedow7avjEOdJNRrttQZ1ywJUMEDQL1xnE+MIv8dRUKpHjKNSVkFAqqPY
	b1zaTH9YOwuTiGtVjqPqiPV8m+xNrahdqlbeiiiyUdvXnBS4KX6TrHbE196wjge8UscdfGt2y6Y
	dLdQUsjMAHc3ZUN0GAoq6taTVkza+icl+7XE1U99XiCY/6R6+BA46FgfhWdg2zD5UBUpjq6MTaM
	LUpzVgHqslmGcke9bn9LHOkjQzyndhXfGIg+jOtemRH59RhY+7af4f1tsL3oIFPg5XKDycfNVSm
	yw8vNyEmvWAb03SU+9uuKJsnXA900wLEjk85fDU0HW3k1IYB3gqlurC6tFJHoQJtTLNGksuuIUU
	ddSZO7Jko7oVX/zxW
X-Google-Smtp-Source: AGHT+IFzMm2aNT6RpalNo0wsv5DWAsKuoxz22GVHDVmjA01s3MjQDoyRKWUNBlEOLCN7cBdZcj/+6A==
X-Received: by 2002:a17:903:2a8f:b0:21f:85ee:f2df with SMTP id d9443c01a7336-22c358db5e2mr61585775ad.15.1744850748219;
        Wed, 16 Apr 2025 17:45:48 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-308611f002esm2275671a91.15.2025.04.16.17.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 17:45:48 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2 09/14] staging: gpib: hp_82341: u8 over uint8_t
Date: Thu, 17 Apr 2025 00:45:28 +0000
Message-ID: <20250417004533.86765-10-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417004533.86765-1-matchstick@neverthere.org>
References: <20250417004533.86765-1-matchstick@neverthere.org>
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
 drivers/staging/gpib/hp_82341/hp_82341.c | 26 ++++++++++++------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/gpib/hp_82341/hp_82341.c b/drivers/staging/gpib/hp_82341/hp_82341.c
index 1a32a2cc421e..41accfdbc49a 100644
--- a/drivers/staging/gpib/hp_82341/hp_82341.c
+++ b/drivers/staging/gpib/hp_82341/hp_82341.c
@@ -25,11 +25,11 @@ MODULE_DESCRIPTION("GPIB driver for hp 82341a/b/c/d boards");
 static unsigned short read_and_clear_event_status(struct gpib_board *board);
 static void set_transfer_counter(struct hp_82341_priv *hp_priv, int count);
 static int read_transfer_counter(struct hp_82341_priv *hp_priv);
-static int hp_82341_write(struct gpib_board *board, uint8_t *buffer, size_t length, int send_eoi,
+static int hp_82341_write(struct gpib_board *board, u8 *buffer, size_t length, int send_eoi,
 			  size_t *bytes_written);
 static irqreturn_t hp_82341_interrupt(int irq, void *arg);
 
-static int hp_82341_accel_read(struct gpib_board *board, uint8_t *buffer, size_t length, int *end,
+static int hp_82341_accel_read(struct gpib_board *board, u8 *buffer, size_t length, int *end,
 			       size_t *bytes_read)
 {
 	struct hp_82341_priv *hp_priv = board->private_data;
@@ -173,7 +173,7 @@ static int restart_write_fifo(struct gpib_board *board, struct hp_82341_priv *hp
 	return 0;
 }
 
-static int hp_82341_accel_write(struct gpib_board *board, uint8_t *buffer, size_t length,
+static int hp_82341_accel_write(struct gpib_board *board, u8 *buffer, size_t length,
 				int send_eoi, size_t *bytes_written)
 {
 	struct hp_82341_priv *hp_priv = board->private_data;
@@ -256,7 +256,7 @@ static int hp_82341_attach(struct gpib_board *board, const struct gpib_board_con
 static void hp_82341_detach(struct gpib_board *board);
 
 // wrappers for interface functions
-static int hp_82341_read(struct gpib_board *board, uint8_t *buffer, size_t length, int *end,
+static int hp_82341_read(struct gpib_board *board, u8 *buffer, size_t length, int *end,
 			 size_t *bytes_read)
 {
 	struct hp_82341_priv *priv = board->private_data;
@@ -264,7 +264,7 @@ static int hp_82341_read(struct gpib_board *board, uint8_t *buffer, size_t lengt
 	return tms9914_read(board, &priv->tms9914_priv, buffer, length, end, bytes_read);
 }
 
-static int hp_82341_write(struct gpib_board *board, uint8_t *buffer, size_t length, int send_eoi,
+static int hp_82341_write(struct gpib_board *board, u8 *buffer, size_t length, int send_eoi,
 			  size_t *bytes_written)
 {
 	struct hp_82341_priv *priv = board->private_data;
@@ -272,7 +272,7 @@ static int hp_82341_write(struct gpib_board *board, uint8_t *buffer, size_t leng
 	return tms9914_write(board, &priv->tms9914_priv, buffer, length, send_eoi, bytes_written);
 }
 
-static int hp_82341_command(struct gpib_board *board, uint8_t *buffer, size_t length,
+static int hp_82341_command(struct gpib_board *board, u8 *buffer, size_t length,
 			    size_t *bytes_written)
 {
 	struct hp_82341_priv *priv = board->private_data;
@@ -320,7 +320,7 @@ static void hp_82341_remote_enable(struct gpib_board *board, int enable)
 	tms9914_remote_enable(board, &priv->tms9914_priv, enable);
 }
 
-static int hp_82341_enable_eos(struct gpib_board *board, uint8_t eos_byte, int compare_8_bits)
+static int hp_82341_enable_eos(struct gpib_board *board, u8 eos_byte, int compare_8_bits)
 {
 	struct hp_82341_priv *priv = board->private_data;
 
@@ -355,14 +355,14 @@ static int hp_82341_secondary_address(struct gpib_board *board, unsigned int add
 	return tms9914_secondary_address(board, &priv->tms9914_priv, address, enable);
 }
 
-static int hp_82341_parallel_poll(struct gpib_board *board, uint8_t *result)
+static int hp_82341_parallel_poll(struct gpib_board *board, u8 *result)
 {
 	struct hp_82341_priv *priv = board->private_data;
 
 	return tms9914_parallel_poll(board, &priv->tms9914_priv, result);
 }
 
-static void hp_82341_parallel_poll_configure(struct gpib_board *board, uint8_t config)
+static void hp_82341_parallel_poll_configure(struct gpib_board *board, u8 config)
 {
 	struct hp_82341_priv *priv = board->private_data;
 
@@ -376,14 +376,14 @@ static void hp_82341_parallel_poll_response(struct gpib_board *board, int ist)
 	tms9914_parallel_poll_response(board, &priv->tms9914_priv, ist);
 }
 
-static void hp_82341_serial_poll_response(struct gpib_board *board, uint8_t status)
+static void hp_82341_serial_poll_response(struct gpib_board *board, u8 status)
 {
 	struct hp_82341_priv *priv = board->private_data;
 
 	tms9914_serial_poll_response(board, &priv->tms9914_priv, status);
 }
 
-static uint8_t hp_82341_serial_poll_status(struct gpib_board *board)
+static u8 hp_82341_serial_poll_status(struct gpib_board *board)
 {
 	struct hp_82341_priv *priv = board->private_data;
 
@@ -480,12 +480,12 @@ static void hp_82341_free_private(struct gpib_board *board)
 	board->private_data = NULL;
 }
 
-static uint8_t hp_82341_read_byte(struct tms9914_priv *priv, unsigned int register_num)
+static u8 hp_82341_read_byte(struct tms9914_priv *priv, unsigned int register_num)
 {
 	return inb(priv->iobase + register_num);
 }
 
-static void hp_82341_write_byte(struct tms9914_priv *priv, uint8_t data, unsigned int register_num)
+static void hp_82341_write_byte(struct tms9914_priv *priv, u8 data, unsigned int register_num)
 {
 	outb(data, priv->iobase + register_num);
 }
-- 
2.43.0

