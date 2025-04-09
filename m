Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589C327817E
	for <linux-staging@lists.linux.dev>; Wed,  9 Apr 2025 18:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744222209; cv=none; b=lgRyt/vleFjOCqDdGgDLb8nKiG3kxD6NvuBNZN59qYRwEhd6a/0ybyNLVSm5g//X/K4tUeX/rPFRuCbx/6wy2Zr9kdmK+umBx5ncRT/qGmElBYoqbyRN76WsAb/xpwmD2rl4f6YxpH3SSTuyuOHWYgs7JE30tDMg/PmhRMJ6M4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744222209; c=relaxed/simple;
	bh=i55/zbqHXEP9n9Jp0TAj7NFy/jb3tlzhWzJIzs8Xu6o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g/wSyEeetP4fmCLh4xB+HAEd02VKUY3Z8az3B3AJcfrZGTudEvErv6R3fLdgyPfjruHJecFIpdbUmaS7SPGkzYMRvpfzJG8SJpuIuCuBSkmfW/1QMG+0UogcLX3OBUr7NxvjpZdo2e5k3Sy1vEheUM1qJ/ukWiFQeGrcZ2FPoTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=Y4P36F44; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="Y4P36F44"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-736bfa487c3so6206140b3a.1
        for <linux-staging@lists.linux.dev>; Wed, 09 Apr 2025 11:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744222206; x=1744827006; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yXkvdn8RYwOYRtLEQqbmHYo+oTivxTewzyUjW/RrAvo=;
        b=Y4P36F44DyTG/kNEKevZFmLiGpgFKnDT5Q5bZjA6a31a2Cx9mKraZ6Q7kOMsEXen+H
         I6fOhdyasQgpNJMOmNWft9bfgctB4vzjtJ8v05O1TCw2jmWVf50A/U8zOu5XsuUJ0WWY
         sJkdeNx8OrWUFh4WDucqeLgmuwbZGV7xKNJCgdfycPkrXe7wf9fdcUvfMDXFVeXeAllN
         AWSGx8qJPdHRyHrd1UsI+7azo+ALpzbxbEmQQ5g8WnmvPZ+npUMoGLGXfMNi2/Fn21Yq
         HFblHS0+pSW0m6ZjXwbhcNjS5t1vBUQHbX0XAi4zVT2eavVaJeVbM0Sxr3nH+a1zEL8N
         g1Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744222206; x=1744827006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yXkvdn8RYwOYRtLEQqbmHYo+oTivxTewzyUjW/RrAvo=;
        b=cyF7JeHVR1BbikBbsZRfCc0KZ0YPHg8Q6MkqK+uiGAf+5JG5gtF8q7dgGV4jHwfovb
         8xe5BtybpPkkdpkPWkeXau6BkUE9eiiilLewYgB6Bz7ydWOmSSQN7TfgZGzy8zp3InKC
         lZrqjOz293FJoG2EgeLA218xOUtLAz4+4G9JqyhFQ7d4s+dMuWjNOSCJea/NhCtMf5V/
         oGf/d8rULUovHdJcEmZOx79oDC0y6Mjomfh2Et9tCb1A57Of5bIZZi5f2kYKZ0uUiLgt
         SGwpIPtTEsb4LxYZ5bPTygyhUFJyXb2Vm0U9dsm248ivLN/1cvc9c/YevmzND0pgUkEe
         7uJA==
X-Gm-Message-State: AOJu0YwbufsEfCs4kKZhzWjAAIYHAvy8s6xZ9DUKaJkP4wXE5EkwcFYM
	XSGWa4Z1Gi/Dxy6cWID8InQCfwCP1rXugP4czZ4CJxMMQJfgK+MPlK1UXxu+yQ==
X-Gm-Gg: ASbGncvxf3esDAFerJkeAEgGYQgC+im8eOMJAR9GJ3uQ83QpYlC+5ALIL86SOUJdWxM
	c/zBhi2KcZkSRVs3SD9PMAVORDMkZ+DoUOWIJMsmPXP0S0rv8kDV19MU8nHVJ8BsVqGFZIH+94O
	bkEDlFMqeCsO/mN4Jji1WiFLfZf68X9FprmUfHvDxILnSoDJvYvYlYWJ/YtiV96KnPC5x6FIi/l
	K8UxCNgEQgBpJ5wXPM1a4GoTZUn2YevStjNA1i9yIyfFzWhL24tHB5yh4P33K5ApdF7AfaDCA3H
	dOkRA1tnVLCA/iUXR1eLYBdE5ivBfYeFF3rZwETfrQIKPkRGWnWdNmF19Vx9+x4F5AobXETawOI
	o71vlb9P/eB7Z5ZX+
X-Google-Smtp-Source: AGHT+IHQQm9vHH/AY/TOYUwpph9KfJogqhoEu+d3uc5fVZC2OAR1SKhB7+yES8VUq3t8TR37cQizmA==
X-Received: by 2002:a05:6a00:2e1d:b0:739:4a93:a5db with SMTP id d2e1a72fcca58-73bafd709c2mr3555922b3a.22.1744222206442;
        Wed, 09 Apr 2025 11:10:06 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1e69c2asm1714749b3a.175.2025.04.09.11.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 11:10:06 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 09/23] staging: gpib: ines: u8 over uint8_t
Date: Wed,  9 Apr 2025 18:09:39 +0000
Message-ID: <20250409180953.398686-10-matchstick@neverthere.org>
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
 drivers/staging/gpib/ines/ines.h      | 20 ++++++++++----------
 drivers/staging/gpib/ines/ines_gpib.c | 22 +++++++++++-----------
 2 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/gpib/ines/ines.h b/drivers/staging/gpib/ines/ines.h
index abe977f8f961..396cf0bd9ad1 100644
--- a/drivers/staging/gpib/ines/ines.h
+++ b/drivers/staging/gpib/ines/ines.h
@@ -36,30 +36,30 @@ struct ines_priv {
 };
 
 // interface functions
-int ines_read(struct gpib_board *board, uint8_t *buffer, size_t length,
+int ines_read(struct gpib_board *board, u8 *buffer, size_t length,
 	      int *end, size_t *bytes_read);
-int ines_write(struct gpib_board *board, uint8_t *buffer, size_t length,
+int ines_write(struct gpib_board *board, u8 *buffer, size_t length,
 	       int send_eoi, size_t *bytes_written);
-int ines_accel_read(struct gpib_board *board, uint8_t *buffer, size_t length,
+int ines_accel_read(struct gpib_board *board, u8 *buffer, size_t length,
 		    int *end, size_t *bytes_read);
-int ines_accel_write(struct gpib_board *board, uint8_t *buffer, size_t length,
+int ines_accel_write(struct gpib_board *board, u8 *buffer, size_t length,
 		     int send_eoi, size_t *bytes_written);
-int ines_command(struct gpib_board *board, uint8_t *buffer, size_t length, size_t *bytes_written);
+int ines_command(struct gpib_board *board, u8 *buffer, size_t length, size_t *bytes_written);
 int ines_take_control(struct gpib_board *board, int synchronous);
 int ines_go_to_standby(struct gpib_board *board);
 void ines_request_system_control(struct gpib_board *board, int request_control);
 void ines_interface_clear(struct gpib_board *board, int assert);
 void ines_remote_enable(struct gpib_board *board, int enable);
-int ines_enable_eos(struct gpib_board *board, uint8_t eos_byte, int compare_8_bits);
+int ines_enable_eos(struct gpib_board *board, u8 eos_byte, int compare_8_bits);
 void ines_disable_eos(struct gpib_board *board);
 unsigned int ines_update_status(struct gpib_board *board, unsigned int clear_mask);
 int ines_primary_address(struct gpib_board *board, unsigned int address);
 int ines_secondary_address(struct gpib_board *board, unsigned int address, int enable);
-int ines_parallel_poll(struct gpib_board *board, uint8_t *result);
-void ines_parallel_poll_configure(struct gpib_board *board, uint8_t config);
+int ines_parallel_poll(struct gpib_board *board, u8 *result);
+void ines_parallel_poll_configure(struct gpib_board *board, u8 config);
 void ines_parallel_poll_response(struct gpib_board *board, int ist);
-void ines_serial_poll_response(struct gpib_board *board, uint8_t status);
-uint8_t ines_serial_poll_status(struct gpib_board *board);
+void ines_serial_poll_response(struct gpib_board *board, u8 status);
+u8 ines_serial_poll_status(struct gpib_board *board);
 int ines_line_status(const struct gpib_board *board);
 int ines_t1_delay(struct gpib_board *board, unsigned int nano_sec);
 void ines_return_to_local(struct gpib_board *board);
diff --git a/drivers/staging/gpib/ines/ines_gpib.c b/drivers/staging/gpib/ines/ines_gpib.c
index 3b7c8fc0f2e8..465ee125945b 100644
--- a/drivers/staging/gpib/ines/ines_gpib.c
+++ b/drivers/staging/gpib/ines/ines_gpib.c
@@ -95,7 +95,7 @@ static inline unsigned short num_in_fifo_bytes(struct ines_priv *ines_priv)
 	return ines_inb(ines_priv, IN_FIFO_COUNT);
 }
 
-static ssize_t pio_read(struct gpib_board *board, struct ines_priv *ines_priv, uint8_t *buffer,
+static ssize_t pio_read(struct gpib_board *board, struct ines_priv *ines_priv, u8 *buffer,
 			size_t length, size_t *nbytes)
 {
 	ssize_t retval = 0;
@@ -133,7 +133,7 @@ static ssize_t pio_read(struct gpib_board *board, struct ines_priv *ines_priv, u
 	return retval;
 }
 
-int ines_accel_read(struct gpib_board *board, uint8_t *buffer,
+int ines_accel_read(struct gpib_board *board, u8 *buffer,
 		    size_t length, int *end, size_t *bytes_read)
 {
 	ssize_t retval = 0;
@@ -213,7 +213,7 @@ static int ines_write_wait(struct gpib_board *board, struct ines_priv *ines_priv
 	return 0;
 }
 
-int ines_accel_write(struct gpib_board *board, uint8_t *buffer, size_t length,
+int ines_accel_write(struct gpib_board *board, u8 *buffer, size_t length,
 		     int send_eoi, size_t *bytes_written)
 {
 	size_t count = 0;
@@ -393,7 +393,7 @@ static struct ines_pci_id pci_ids[] = {
 static const int num_pci_chips = ARRAY_SIZE(pci_ids);
 
 // wrappers for interface functions
-int ines_read(struct gpib_board *board, uint8_t *buffer, size_t length,
+int ines_read(struct gpib_board *board, u8 *buffer, size_t length,
 	      int *end, size_t *bytes_read)
 {
 	struct ines_priv *priv = board->private_data;
@@ -412,7 +412,7 @@ int ines_read(struct gpib_board *board, uint8_t *buffer, size_t length,
 	return retval;
 }
 
-int ines_write(struct gpib_board *board, uint8_t *buffer, size_t length, int send_eoi,
+int ines_write(struct gpib_board *board, u8 *buffer, size_t length, int send_eoi,
 	       size_t *bytes_written)
 {
 	struct ines_priv *priv = board->private_data;
@@ -420,7 +420,7 @@ int ines_write(struct gpib_board *board, uint8_t *buffer, size_t length, int sen
 	return nec7210_write(board, &priv->nec7210_priv, buffer, length, send_eoi, bytes_written);
 }
 
-int ines_command(struct gpib_board *board, uint8_t *buffer, size_t length, size_t *bytes_written)
+int ines_command(struct gpib_board *board, u8 *buffer, size_t length, size_t *bytes_written)
 {
 	struct ines_priv *priv = board->private_data;
 
@@ -462,7 +462,7 @@ void ines_remote_enable(struct gpib_board *board, int enable)
 	nec7210_remote_enable(board, &priv->nec7210_priv, enable);
 }
 
-int ines_enable_eos(struct gpib_board *board, uint8_t eos_byte, int compare_8_bits)
+int ines_enable_eos(struct gpib_board *board, u8 eos_byte, int compare_8_bits)
 {
 	struct ines_priv *priv = board->private_data;
 
@@ -497,14 +497,14 @@ int ines_secondary_address(struct gpib_board *board, unsigned int address, int e
 	return nec7210_secondary_address(board, &priv->nec7210_priv, address, enable);
 }
 
-int ines_parallel_poll(struct gpib_board *board, uint8_t *result)
+int ines_parallel_poll(struct gpib_board *board, u8 *result)
 {
 	struct ines_priv *priv = board->private_data;
 
 	return nec7210_parallel_poll(board, &priv->nec7210_priv, result);
 }
 
-void ines_parallel_poll_configure(struct gpib_board *board, uint8_t config)
+void ines_parallel_poll_configure(struct gpib_board *board, u8 config)
 {
 	struct ines_priv *priv = board->private_data;
 
@@ -518,14 +518,14 @@ void ines_parallel_poll_response(struct gpib_board *board, int ist)
 	nec7210_parallel_poll_response(board, &priv->nec7210_priv, ist);
 }
 
-void ines_serial_poll_response(struct gpib_board *board, uint8_t status)
+void ines_serial_poll_response(struct gpib_board *board, u8 status)
 {
 	struct ines_priv *priv = board->private_data;
 
 	nec7210_serial_poll_response(board, &priv->nec7210_priv, status);
 }
 
-uint8_t ines_serial_poll_status(struct gpib_board *board)
+u8 ines_serial_poll_status(struct gpib_board *board)
 {
 	struct ines_priv *priv = board->private_data;
 
-- 
2.43.0

