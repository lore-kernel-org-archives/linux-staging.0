Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF9021CFFD
	for <linux-staging@lists.linux.dev>; Wed, 19 Mar 2025 21:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742421599; cv=none; b=KA66vKTydmFOUy6R6JZ8HQqpaUzpzv7mYj8LXdHt9DpksIASZmtCvKtyM4qysr9CIid8P9QbrEwR0SjJCPcTdUTViLDEb6J73vVdhP2qdwQZpC/5I3I2rJZw/5BdmfNvp7jiEckGFqYpZEiRzJCRcPDluJ3ay9/JSCHphs+GJnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742421599; c=relaxed/simple;
	bh=e4dbAKaOnBk95nGbq3xaWlhEEnq7lytyehXJ34fFCcQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ikXxTtFmmNUwz3TR7O7ZfSUcnI3npACvoUlOBNuWB2jBMkGIa1ZtWS7muS4UOwBfg3fi8sbl2qMzY2VUPtHM9FQOauzR4+nsMZ39jZowU4Swtn1QLMNSN1HQn8CAk5Nw5xouJL5SWyZ1bvFh5NBXcxzx+Oqf13Ots8xYKls1M/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=GCUiBDNN; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="GCUiBDNN"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2ff784dc055so245545a91.1
        for <linux-staging@lists.linux.dev>; Wed, 19 Mar 2025 14:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1742421597; x=1743026397; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DdrlZfOcjEPmyLhxrYOcoDg7rx+YwK3dt8M5HQJ7Vxc=;
        b=GCUiBDNN+vu8Lez5mcn2hH+BrxNV3unJkd6L78mCLdbDmwEEayxyfTGZV+pNFcB/Rj
         tcpmvXTBHjl6LhufNQuCeIfRjzkFRcH7F/IrdK2pa8f4B96w/nKFfuoOa0aS4vdyQRMw
         F6m4SV5G1K6wkTp2LSnuMT5aAwWzYrkkSkJTcsf+3j0IoSRU7cY1qJZ+S4e6C5Pt63Mv
         4bDnk4HnqFPan5yBBz7nfO9IvEYhxHiKcUxSqr9FVf7Bb7EiwB/pu5NpUNZr399Jhnnf
         aMar4/+TBIwaZT/j+9tTaGoX3G7vsUQFJzJP0czKCYO8otN4Ug4k6jf9d0f9PSMpR33E
         rZOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742421597; x=1743026397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DdrlZfOcjEPmyLhxrYOcoDg7rx+YwK3dt8M5HQJ7Vxc=;
        b=HEvq96FjQ6Ezc1X84qPlXwUwYF/MGf5yGZ6Sn26xuyl+0yudqXm2XSHukefLN70P8e
         JsCkUd3GtlUz2E9K6FvMLpXXO0V31xWTROVdMq1rdgIGTlAcmyFYfWv2PahEneRLlrKk
         AC7L9YeD+reu7RB92QbWbQFSrElys6EIEy4FeVVbaAD0bBAaEWe6ej8mLKQrb587f+Ob
         8gBvghTSvQkBtZVCL4kqIK6NoTvpoACjQ7DhB3CimBWbiB1g8JbcNA5q7f2njqDB0Map
         Euh83FJYMWRDc++BMhCcrkfxnizhi0ttgWTY49YbA7nfhzbQ4G4dStF9nlMMmOuyntz+
         wAeA==
X-Gm-Message-State: AOJu0YxxjZ8uGDVZ0IaDMh8UFuogAUruICKEhKn1Mc/7dZ38peO71Mwu
	cozc/MHQGWPYXfoejgiLRDty5h/9cwKMwQks4ZarBxaGpRMAXo3HaMHS/La8ug==
X-Gm-Gg: ASbGncs928blc1EPtL8tRjO0DZnHCQ10r6VtzHAbYwnNobo+bXUagK6auprk+tshqvo
	LVGy0zo2IORXlZA3eC32oMfoht+1q4EmACFRrvMK7kQNTs14YdxXFsU8MwgACu1HAsM+uKEx7Fd
	kEtCL8bG2cl2MwtyqHZclrdrfU5dtp06PHRP/wcDAv2xORjszjyORp/EvppGkH9yhWKO7uPBAd9
	T5aIJK8kI6JPQpRfp3/oyQlsVe2tdBo5mUrYjG5CHeb2qGeHLxxbCtALRSG7WWyGkOrdEXlY8O0
	Snw1F5jGT/5qxE/NwEXyLoW0DYH1mEtFWr7m3CdCUId+fASBgJrhpwit9U+I7pBLdp3m6lP1CEj
	zzklD616wTg==
X-Google-Smtp-Source: AGHT+IFqtfzZcIJzqrMS8fVLbpZe4AfElC5e1G6eMy+1t8WREOI4FS/mYUqR+pMxpIN+BBHuiCJhVg==
X-Received: by 2002:a17:90b:3c11:b0:2ff:5a9d:937f with SMTP id 98e67ed59e1d1-301be200718mr7480776a91.24.1742421596915;
        Wed, 19 Mar 2025 14:59:56 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf635929sm2426373a91.40.2025.03.19.14.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 14:59:56 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 16/20] staging: gpib: pc2: struct gpib_board
Date: Wed, 19 Mar 2025 21:59:20 +0000
Message-ID: <20250319215924.19387-17-matchstick@neverthere.org>
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
 drivers/staging/gpib/pc2/pc2_gpib.c | 68 ++++++++++++++---------------
 1 file changed, 34 insertions(+), 34 deletions(-)

diff --git a/drivers/staging/gpib/pc2/pc2_gpib.c b/drivers/staging/gpib/pc2/pc2_gpib.c
index 6711851301ec..d8e0733d8ab0 100644
--- a/drivers/staging/gpib/pc2/pc2_gpib.c
+++ b/drivers/staging/gpib/pc2/pc2_gpib.c
@@ -58,7 +58,7 @@ MODULE_DESCRIPTION("GPIB driver for PC2/PC2a and compatible devices");
 
 irqreturn_t pc2_interrupt(int irq, void *arg)
 {
-	gpib_board_t *board = arg;
+	struct gpib_board *board = arg;
 	struct pc2_priv *priv = board->private_data;
 	unsigned long flags;
 	irqreturn_t retval;
@@ -71,7 +71,7 @@ irqreturn_t pc2_interrupt(int irq, void *arg)
 
 irqreturn_t pc2a_interrupt(int irq, void *arg)
 {
-	gpib_board_t *board = arg;
+	struct gpib_board *board = arg;
 	struct pc2_priv *priv = board->private_data;
 	int status1, status2;
 	unsigned long flags;
@@ -90,7 +90,7 @@ irqreturn_t pc2a_interrupt(int irq, void *arg)
 }
 
 // wrappers for interface functions
-static int pc2_read(gpib_board_t *board, uint8_t *buffer, size_t length, int *end,
+static int pc2_read(struct gpib_board *board, uint8_t *buffer, size_t length, int *end,
 		    size_t *bytes_read)
 {
 	struct pc2_priv *priv = board->private_data;
@@ -98,7 +98,7 @@ static int pc2_read(gpib_board_t *board, uint8_t *buffer, size_t length, int *en
 	return nec7210_read(board, &priv->nec7210_priv, buffer, length, end, bytes_read);
 }
 
-static int pc2_write(gpib_board_t *board, uint8_t *buffer, size_t length, int send_eoi,
+static int pc2_write(struct gpib_board *board, uint8_t *buffer, size_t length, int send_eoi,
 		     size_t *bytes_written)
 {
 	struct pc2_priv *priv = board->private_data;
@@ -106,133 +106,133 @@ static int pc2_write(gpib_board_t *board, uint8_t *buffer, size_t length, int se
 	return nec7210_write(board, &priv->nec7210_priv, buffer, length, send_eoi, bytes_written);
 }
 
-static int pc2_command(gpib_board_t *board, uint8_t *buffer, size_t length, size_t *bytes_written)
+static int pc2_command(struct gpib_board *board, uint8_t *buffer, size_t length, size_t *bytes_written)
 {
 	struct pc2_priv *priv = board->private_data;
 
 	return nec7210_command(board, &priv->nec7210_priv, buffer, length, bytes_written);
 }
 
-static int pc2_take_control(gpib_board_t *board, int synchronous)
+static int pc2_take_control(struct gpib_board *board, int synchronous)
 {
 	struct pc2_priv *priv = board->private_data;
 
 	return nec7210_take_control(board, &priv->nec7210_priv, synchronous);
 }
 
-static int pc2_go_to_standby(gpib_board_t *board)
+static int pc2_go_to_standby(struct gpib_board *board)
 {
 	struct pc2_priv *priv = board->private_data;
 
 	return nec7210_go_to_standby(board, &priv->nec7210_priv);
 }
 
-static void pc2_request_system_control(gpib_board_t *board, int request_control)
+static void pc2_request_system_control(struct gpib_board *board, int request_control)
 {
 	struct pc2_priv *priv = board->private_data;
 
 	nec7210_request_system_control(board, &priv->nec7210_priv, request_control);
 }
 
-static void pc2_interface_clear(gpib_board_t *board, int assert)
+static void pc2_interface_clear(struct gpib_board *board, int assert)
 {
 	struct pc2_priv *priv = board->private_data;
 
 	nec7210_interface_clear(board, &priv->nec7210_priv, assert);
 }
 
-static void pc2_remote_enable(gpib_board_t *board, int enable)
+static void pc2_remote_enable(struct gpib_board *board, int enable)
 {
 	struct pc2_priv *priv = board->private_data;
 
 	nec7210_remote_enable(board, &priv->nec7210_priv, enable);
 }
 
-static int pc2_enable_eos(gpib_board_t *board, uint8_t eos_byte, int compare_8_bits)
+static int pc2_enable_eos(struct gpib_board *board, uint8_t eos_byte, int compare_8_bits)
 {
 	struct pc2_priv *priv = board->private_data;
 
 	return nec7210_enable_eos(board, &priv->nec7210_priv, eos_byte, compare_8_bits);
 }
 
-static void pc2_disable_eos(gpib_board_t *board)
+static void pc2_disable_eos(struct gpib_board *board)
 {
 	struct pc2_priv *priv = board->private_data;
 
 	nec7210_disable_eos(board, &priv->nec7210_priv);
 }
 
-static unsigned int pc2_update_status(gpib_board_t *board, unsigned int clear_mask)
+static unsigned int pc2_update_status(struct gpib_board *board, unsigned int clear_mask)
 {
 	struct pc2_priv *priv = board->private_data;
 
 	return nec7210_update_status(board, &priv->nec7210_priv, clear_mask);
 }
 
-static int pc2_primary_address(gpib_board_t *board, unsigned int address)
+static int pc2_primary_address(struct gpib_board *board, unsigned int address)
 {
 	struct pc2_priv *priv = board->private_data;
 
 	return nec7210_primary_address(board, &priv->nec7210_priv, address);
 }
 
-static int pc2_secondary_address(gpib_board_t *board, unsigned int address, int enable)
+static int pc2_secondary_address(struct gpib_board *board, unsigned int address, int enable)
 {
 	struct pc2_priv *priv = board->private_data;
 
 	return nec7210_secondary_address(board, &priv->nec7210_priv, address, enable);
 }
 
-static int pc2_parallel_poll(gpib_board_t *board, uint8_t *result)
+static int pc2_parallel_poll(struct gpib_board *board, uint8_t *result)
 {
 	struct pc2_priv *priv = board->private_data;
 
 	return nec7210_parallel_poll(board, &priv->nec7210_priv, result);
 }
 
-static void pc2_parallel_poll_configure(gpib_board_t *board, uint8_t config)
+static void pc2_parallel_poll_configure(struct gpib_board *board, uint8_t config)
 {
 	struct pc2_priv *priv = board->private_data;
 
 	nec7210_parallel_poll_configure(board, &priv->nec7210_priv, config);
 }
 
-static void pc2_parallel_poll_response(gpib_board_t *board, int ist)
+static void pc2_parallel_poll_response(struct gpib_board *board, int ist)
 {
 	struct pc2_priv *priv = board->private_data;
 
 	nec7210_parallel_poll_response(board, &priv->nec7210_priv, ist);
 }
 
-static void pc2_serial_poll_response(gpib_board_t *board, uint8_t status)
+static void pc2_serial_poll_response(struct gpib_board *board, uint8_t status)
 {
 	struct pc2_priv *priv = board->private_data;
 
 	nec7210_serial_poll_response(board, &priv->nec7210_priv, status);
 }
 
-static uint8_t pc2_serial_poll_status(gpib_board_t *board)
+static uint8_t pc2_serial_poll_status(struct gpib_board *board)
 {
 	struct pc2_priv *priv = board->private_data;
 
 	return nec7210_serial_poll_status(board, &priv->nec7210_priv);
 }
 
-static unsigned int pc2_t1_delay(gpib_board_t *board, unsigned int nano_sec)
+static unsigned int pc2_t1_delay(struct gpib_board *board, unsigned int nano_sec)
 {
 	struct pc2_priv *priv = board->private_data;
 
 	return nec7210_t1_delay(board, &priv->nec7210_priv, nano_sec);
 }
 
-static void pc2_return_to_local(gpib_board_t *board)
+static void pc2_return_to_local(struct gpib_board *board)
 {
 	struct pc2_priv *priv = board->private_data;
 
 	nec7210_return_to_local(board, &priv->nec7210_priv);
 }
 
-static int allocate_private(gpib_board_t *board)
+static int allocate_private(struct gpib_board *board)
 {
 	struct pc2_priv *priv;
 
@@ -245,13 +245,13 @@ static int allocate_private(gpib_board_t *board)
 	return 0;
 }
 
-static void free_private(gpib_board_t *board)
+static void free_private(struct gpib_board *board)
 {
 	kfree(board->private_data);
 	board->private_data = NULL;
 }
 
-static int pc2_generic_attach(gpib_board_t *board, const gpib_board_config_t *config,
+static int pc2_generic_attach(struct gpib_board *board, const gpib_board_config_t *config,
 			      enum nec7210_chipset chipset)
 {
 	struct pc2_priv *pc2_priv;
@@ -294,7 +294,7 @@ static int pc2_generic_attach(gpib_board_t *board, const gpib_board_config_t *co
 	return 0;
 }
 
-static int pc2_attach(gpib_board_t *board, const gpib_board_config_t *config)
+static int pc2_attach(struct gpib_board *board, const gpib_board_config_t *config)
 {
 	int isr_flags = 0;
 	struct pc2_priv *pc2_priv;
@@ -338,7 +338,7 @@ static int pc2_attach(gpib_board_t *board, const gpib_board_config_t *config)
 	return 0;
 }
 
-static void pc2_detach(gpib_board_t *board)
+static void pc2_detach(struct gpib_board *board)
 {
 	struct pc2_priv *pc2_priv = board->private_data;
 	struct nec7210_priv *nec_priv;
@@ -365,7 +365,7 @@ static void pc2_detach(gpib_board_t *board)
 	free_private(board);
 }
 
-static int pc2a_common_attach(gpib_board_t *board, const gpib_board_config_t *config,
+static int pc2a_common_attach(struct gpib_board *board, const gpib_board_config_t *config,
 			      unsigned int num_registers, enum nec7210_chipset chipset)
 {
 	unsigned int i, j;
@@ -459,22 +459,22 @@ static int pc2a_common_attach(gpib_board_t *board, const gpib_board_config_t *co
 	return 0;
 }
 
-static int pc2a_attach(gpib_board_t *board, const gpib_board_config_t *config)
+static int pc2a_attach(struct gpib_board *board, const gpib_board_config_t *config)
 {
 	return pc2a_common_attach(board, config, pc2a_iosize, NEC7210);
 }
 
-static int pc2a_cb7210_attach(gpib_board_t *board, const gpib_board_config_t *config)
+static int pc2a_cb7210_attach(struct gpib_board *board, const gpib_board_config_t *config)
 {
 	return pc2a_common_attach(board, config, pc2a_iosize, CB7210);
 }
 
-static int pc2_2a_attach(gpib_board_t *board, const gpib_board_config_t *config)
+static int pc2_2a_attach(struct gpib_board *board, const gpib_board_config_t *config)
 {
 	return pc2a_common_attach(board, config, pc2_2a_iosize, NAT4882);
 }
 
-static void pc2a_common_detach(gpib_board_t *board, unsigned int num_registers)
+static void pc2a_common_detach(struct gpib_board *board, unsigned int num_registers)
 {
 	int i;
 	struct pc2_priv *pc2_priv = board->private_data;
@@ -507,12 +507,12 @@ static void pc2a_common_detach(gpib_board_t *board, unsigned int num_registers)
 	free_private(board);
 }
 
-static void pc2a_detach(gpib_board_t *board)
+static void pc2a_detach(struct gpib_board *board)
 {
 	pc2a_common_detach(board, pc2a_iosize);
 }
 
-static void pc2_2a_detach(gpib_board_t *board)
+static void pc2_2a_detach(struct gpib_board *board)
 {
 	pc2a_common_detach(board, pc2_2a_iosize);
 }
-- 
2.43.0

