Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9423F270EC9
	for <linux-staging@lists.linux.dev>; Wed,  9 Apr 2025 18:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744222199; cv=none; b=TGnwFQ9K5Ms73qAeWJ0A+/weFFdoaTHaGSpXiQN4j60Jv6hxe3+qQQoqwKdJMFzGnB1HPHC2WM5VCUVF4l3h+LbvMxuAXYqJwWl9HIjYjkxl3Dk7rBymP97YLHejONEYV42FBrGv3AsmYf1yfEuGzXsWyUC0sMjw/Kd1hldrFU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744222199; c=relaxed/simple;
	bh=Npo/5wmys8bKib8amEXL12NAz41h3Ae0REUt415xRqg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ad7ZNl/N9alw+SEUIZxb8dzF4kyvRggkAI83kkVT3GJGOSaDtJxWpkxyy1AUCqSHC2XSKaNd/lLKtDBTriKhR01r8X+rj3aUYHEqB4912ZETydAWWEIhKLc2VMOY19ldA72EgdPJGQyklSXohzKuXAsT6mM06wBQMnnUB0z5NuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=LdldclPJ; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="LdldclPJ"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2243803b776so102463485ad.0
        for <linux-staging@lists.linux.dev>; Wed, 09 Apr 2025 11:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744222197; x=1744826997; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uOWS7gFbbPMik75gLek1M9JlkUTV20kqo/4vcLA/kIg=;
        b=LdldclPJUec/dljp8n1RpzKV5HmMCUQm2cUmlWsoEqlUW/baz5WR88xSgLXFHeevuy
         wHrbOqj2eFl2fWcYNu1k8NfkFIL/k8Csd1L8cS1tlMF5ToyziDiEKLUqCdydgJZptDpc
         ReZk2iQ3SfH0rtEnNxtU+kb01N3y76Kia/9xnvPHyv9F8A+f+VtUuyXPhboGTn5Jc8QU
         d6fxwI2tgbwTUDKZNp0N7ipRuSoJ8Po3MwKspi9RIzOIqjw305g54T3C59xRM7rGivNO
         q0GsFUhziWC4R7L7t6+YYSzzBxx20LczvllbCIqzHtTG+ZdWIKHZToGJ09AEX0BQDgSc
         rrTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744222197; x=1744826997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uOWS7gFbbPMik75gLek1M9JlkUTV20kqo/4vcLA/kIg=;
        b=wk2KfykY5Ho3Y8vH0avbVJmP/FsHIBtksF5GqLcWOUulkrAnqJLoVZ99TABZ9wkXwk
         c5FuIKtuv8knk8FIYmVraK4wYIsyHBUtK1rEyeajHlZ2MarOUr64Fv3VjfUZza1F01/D
         NhyOKLmgcWkECoOPXt8WX9vOGEUtV2Is9jEqqOH3bRxgFvJEeTSuwp388D8wRBx6jdbQ
         k99/GDQnNQ8qG8Kk6sWNylHR5QFAkSCErRQa3qRVHfaVKV8wZ7qkQDBRpE6ZytiRLop1
         5dsKZGI6hEZCC0huoC4JkLG/8CPKFgYuKt+FCsuLv1fb5ZBXC7uYcDqKYuVv32YV6QMS
         YjQQ==
X-Gm-Message-State: AOJu0YwNjIY/eMSlCvMrkgAFepay3GGWG6hQDeLtzmgipgQeYgvW2kdg
	HgbQywdEWnad7bPhfkyiTC05cCoixU6TiGsCKcywcT4E+iyWWl4MdgCbCrIN3w==
X-Gm-Gg: ASbGncsUYWrOW8q7S44XAOdD/jFigA78niYGrfWCoqAVAC8kGNK0k6mjUcLDbGY8vdQ
	eXqZzv0cIE3J+YoeMh3T63XzCId2j51MUe/qSiKueCftunqsIBUrrPA+OnK4QEJ23XNmKUnrPDh
	MQhLUlArKoYTvaaemke41nDE5iWXtwLVmZyykGSiYbZUigNKesAaziStrtaX5BJrkKmrRi3eY8d
	OhOjMAmmg423YuIFbRd3z6E4SGgjrhhw6hNu6SS2hl1n9cBII46LQs+43S5Sc3tBMBq8V06bInA
	O/kuUAfXQ2e5t/xSJUcR6RAuctFZ2gJoGKiBXsJ9Pu+Yz/CgleGja9bkYHROGdpG6tTJx+snNj6
	aJcwSkA==
X-Google-Smtp-Source: AGHT+IFLNLlQg7skmfuvENWFQa9sK3h19HnsKNv4of4s/nYwHk+iuuK9Mf3j/RnPBHWBMngBx7mG2A==
X-Received: by 2002:a17:902:fc87:b0:224:c76:5e57 with SMTP id d9443c01a7336-22ac2a1d993mr55231495ad.39.1744222196843;
        Wed, 09 Apr 2025 11:09:56 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c95c6dsm15136925ad.121.2025.04.09.11.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 11:09:56 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 01/23] staging: gpib: cb7210: u8 over uint8_t
Date: Wed,  9 Apr 2025 18:09:31 +0000
Message-ID: <20250409180953.398686-2-matchstick@neverthere.org>
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
 drivers/staging/gpib/cb7210/cb7210.c | 26 +++++++++++++-------------
 drivers/staging/gpib/cb7210/cb7210.h | 12 ++++++------
 2 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/gpib/cb7210/cb7210.c b/drivers/staging/gpib/cb7210/cb7210.c
index a8549718b425..d0d445de573b 100644
--- a/drivers/staging/gpib/cb7210/cb7210.c
+++ b/drivers/staging/gpib/cb7210/cb7210.c
@@ -27,7 +27,7 @@
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("GPIB driver Measurement Computing boards using cb7210.2 and cbi488.2");
 
-static int cb7210_read(struct gpib_board *board, uint8_t *buffer, size_t length,
+static int cb7210_read(struct gpib_board *board, u8 *buffer, size_t length,
 		       int *end, size_t *bytes_read);
 
 	static inline int have_fifo_word(const struct cb7210_priv *cb_priv)
@@ -76,7 +76,7 @@ static inline void input_fifo_enable(struct gpib_board *board, int enable)
 	spin_unlock_irqrestore(&board->spinlock, flags);
 }
 
-static int fifo_read(struct gpib_board *board, struct cb7210_priv *cb_priv, uint8_t *buffer,
+static int fifo_read(struct gpib_board *board, struct cb7210_priv *cb_priv, u8 *buffer,
 		     size_t length, int *end, size_t *bytes_read)
 {
 	ssize_t retval = 0;
@@ -170,7 +170,7 @@ static int fifo_read(struct gpib_board *board, struct cb7210_priv *cb_priv, uint
 	return retval;
 }
 
-static int cb7210_accel_read(struct gpib_board *board, uint8_t *buffer,
+static int cb7210_accel_read(struct gpib_board *board, u8 *buffer,
 			     size_t length, int *end, size_t *bytes_read)
 {
 	ssize_t retval;
@@ -264,7 +264,7 @@ static inline void output_fifo_enable(struct gpib_board *board, int enable)
 	spin_unlock_irqrestore(&board->spinlock, flags);
 }
 
-static int fifo_write(struct gpib_board *board, uint8_t *buffer, size_t length,
+static int fifo_write(struct gpib_board *board, u8 *buffer, size_t length,
 		      size_t *bytes_written)
 {
 	size_t count = 0;
@@ -350,7 +350,7 @@ static int fifo_write(struct gpib_board *board, uint8_t *buffer, size_t length,
 	return retval;
 }
 
-static int cb7210_accel_write(struct gpib_board *board, uint8_t *buffer,
+static int cb7210_accel_write(struct gpib_board *board, u8 *buffer,
 			      size_t length, int send_eoi, size_t *bytes_written)
 {
 	struct cb7210_priv *cb_priv = board->private_data;
@@ -540,7 +540,7 @@ static void cb_pci_detach(struct gpib_board *board);
 static void cb_isa_detach(struct gpib_board *board);
 
 // wrappers for interface functions
-static int cb7210_read(struct gpib_board *board, uint8_t *buffer, size_t length,
+static int cb7210_read(struct gpib_board *board, u8 *buffer, size_t length,
 		       int *end, size_t *bytes_read)
 {
 	struct cb7210_priv *priv = board->private_data;
@@ -548,7 +548,7 @@ static int cb7210_read(struct gpib_board *board, uint8_t *buffer, size_t length,
 	return nec7210_read(board, &priv->nec7210_priv, buffer, length, end, bytes_read);
 }
 
-static int cb7210_write(struct gpib_board *board, uint8_t *buffer, size_t length,
+static int cb7210_write(struct gpib_board *board, u8 *buffer, size_t length,
 			int send_eoi, size_t *bytes_written)
 {
 	struct cb7210_priv *priv = board->private_data;
@@ -556,7 +556,7 @@ static int cb7210_write(struct gpib_board *board, uint8_t *buffer, size_t length
 	return nec7210_write(board, &priv->nec7210_priv, buffer, length, send_eoi, bytes_written);
 }
 
-static int cb7210_command(struct gpib_board *board, uint8_t *buffer, size_t length,
+static int cb7210_command(struct gpib_board *board, u8 *buffer, size_t length,
 			  size_t *bytes_written)
 {
 	struct cb7210_priv *priv = board->private_data;
@@ -606,7 +606,7 @@ static void cb7210_remote_enable(struct gpib_board *board, int enable)
 	nec7210_remote_enable(board, &priv->nec7210_priv, enable);
 }
 
-static int cb7210_enable_eos(struct gpib_board *board, uint8_t eos_byte, int compare_8_bits)
+static int cb7210_enable_eos(struct gpib_board *board, u8 eos_byte, int compare_8_bits)
 {
 	struct cb7210_priv *priv = board->private_data;
 
@@ -641,14 +641,14 @@ static int cb7210_secondary_address(struct gpib_board *board, unsigned int addre
 	return nec7210_secondary_address(board, &priv->nec7210_priv, address, enable);
 }
 
-static int cb7210_parallel_poll(struct gpib_board *board, uint8_t *result)
+static int cb7210_parallel_poll(struct gpib_board *board, u8 *result)
 {
 	struct cb7210_priv *priv = board->private_data;
 
 	return nec7210_parallel_poll(board, &priv->nec7210_priv, result);
 }
 
-static void cb7210_parallel_poll_configure(struct gpib_board *board, uint8_t configuration)
+static void cb7210_parallel_poll_configure(struct gpib_board *board, u8 configuration)
 {
 	struct cb7210_priv *priv = board->private_data;
 
@@ -662,14 +662,14 @@ static void cb7210_parallel_poll_response(struct gpib_board *board, int ist)
 	nec7210_parallel_poll_response(board, &priv->nec7210_priv, ist);
 }
 
-static void cb7210_serial_poll_response(struct gpib_board *board, uint8_t status)
+static void cb7210_serial_poll_response(struct gpib_board *board, u8 status)
 {
 	struct cb7210_priv *priv = board->private_data;
 
 	nec7210_serial_poll_response(board, &priv->nec7210_priv, status);
 }
 
-static uint8_t cb7210_serial_poll_status(struct gpib_board *board)
+static u8 cb7210_serial_poll_status(struct gpib_board *board)
 {
 	struct cb7210_priv *priv = board->private_data;
 
diff --git a/drivers/staging/gpib/cb7210/cb7210.h b/drivers/staging/gpib/cb7210/cb7210.h
index 2108fe7a8ce5..32d8ec5991de 100644
--- a/drivers/staging/gpib/cb7210/cb7210.h
+++ b/drivers/staging/gpib/cb7210/cb7210.h
@@ -73,8 +73,8 @@ static inline int cb7210_page_in_bits(unsigned int page)
 	return 0x50 | (page & 0xf);
 }
 
-static inline uint8_t cb7210_paged_read_byte(struct cb7210_priv *cb_priv,
-					     unsigned int register_num, unsigned int page)
+static inline u8 cb7210_paged_read_byte(struct cb7210_priv *cb_priv,
+					unsigned int register_num, unsigned int page)
 {
 	struct nec7210_priv *nec_priv = &cb_priv->nec7210_priv;
 	u8 retval;
@@ -89,8 +89,8 @@ static inline uint8_t cb7210_paged_read_byte(struct cb7210_priv *cb_priv,
 }
 
 // don't use for register_num < 8, since it doesn't lock
-static inline uint8_t cb7210_read_byte(const struct cb7210_priv *cb_priv,
-				       enum hs_regs register_num)
+static inline u8 cb7210_read_byte(const struct cb7210_priv *cb_priv,
+				  enum hs_regs register_num)
 {
 	const struct nec7210_priv *nec_priv = &cb_priv->nec7210_priv;
 	u8 retval;
@@ -99,7 +99,7 @@ static inline uint8_t cb7210_read_byte(const struct cb7210_priv *cb_priv,
 	return retval;
 }
 
-static inline void cb7210_paged_write_byte(struct cb7210_priv *cb_priv, uint8_t data,
+static inline void cb7210_paged_write_byte(struct cb7210_priv *cb_priv, u8 data,
 					   unsigned int register_num, unsigned int page)
 {
 	struct nec7210_priv *nec_priv = &cb_priv->nec7210_priv;
@@ -113,7 +113,7 @@ static inline void cb7210_paged_write_byte(struct cb7210_priv *cb_priv, uint8_t
 }
 
 // don't use for register_num < 8, since it doesn't lock
-static inline void cb7210_write_byte(const struct cb7210_priv *cb_priv, uint8_t data,
+static inline void cb7210_write_byte(const struct cb7210_priv *cb_priv, u8 data,
 				     enum hs_regs register_num)
 {
 	const struct nec7210_priv *nec_priv = &cb_priv->nec7210_priv;
-- 
2.43.0

