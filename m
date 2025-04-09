Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D253227C864
	for <linux-staging@lists.linux.dev>; Wed,  9 Apr 2025 18:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744222218; cv=none; b=h9xTPj8xlPmzqDbqPU9EedGS83Uzo/fL0CXf9CTAIvP88BvXBCxUdMiZRIUb/uwWxauXQeHHTAFKWG61b3yevDcLFb4vHPr3+LjKTBHTVpGpuB82YkvchqdwJCJVF7UD8Llp1z0A0tDliuU87EgxEq68SLvtfE04C3MRlCdjRfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744222218; c=relaxed/simple;
	bh=w2YzpdWlDBDV9vUBM5jDBBVZIFC1lTCI/u5LtobYl/A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uaPOHce3IRYEevkkPwPLeUVQx2s25z9c81JvKggPn3J59GnJS99eJtVPYoVkzVVgmxWMfL+Yn4ibrwBptR2StgaN+B6wx8m7PrJoWeJUO5HcG9Qx7g47TS4Z+Ux90H91bhQpbvkeYmFIGU8imzVHJ9kXWVgQsqp6c0CS//6pgao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=c/5syWxX; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="c/5syWxX"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22401f4d35aso83063525ad.2
        for <linux-staging@lists.linux.dev>; Wed, 09 Apr 2025 11:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744222216; x=1744827016; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5jJtvIiGmaqv063/TYbeDFEuemkLKlqs8hde2cOBC8k=;
        b=c/5syWxX5H6hHxEJyc4mrrz4NncImPcJZh0sV7FmgE7Bqun3XcJee8RW/iKk70K2Oy
         cE05hvWj+bzSf2znHZ/1QXO9mi08lp/643PFRSQNLp8FtRZtlR/xat5PilTmItCf2Iuj
         fMcWirV/b320HOqB2UmSDxnPg1E9Nfz9436O+ZtidZDG2aoM7hwrRTXO6xWThq5i54it
         Ylt49wU5/+WgFiUAuK03N8t2Iy7S20x5aG3siYEdRPhANH267Zccmm2N858w+B3ttMS/
         zcPeBYuphXWxJxC2kYR3k9wkFzKueD4HotpPiWWbyVw3Px4YEMTXMKqs+S/TgsaJmxTX
         Fk4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744222216; x=1744827016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5jJtvIiGmaqv063/TYbeDFEuemkLKlqs8hde2cOBC8k=;
        b=wwc94Frd2vLYlxFjMy8eVXRZvRi0Bk+Ocer/zWkRjJQhd+mf//gly+F58DAyQr3DoZ
         GiHQcE2KSzXX3PUCRu1jD3O2Fb4XX88V5X3dweFKh1kXrYcuGNb1GDUZ027ZLqFXpJd+
         94AGBp+AoGLg4FYbo5CIZFDL4mOLJRdDx0ELOS/O8YuwOyIBtMLryIh9QljbM6c+sqV1
         ylZc0On+0HAhBYECiw9xP3TRlT+HKJa7FWiMOWptpx051ytx9f23vZnb8PLOz/E4LNYk
         yuyclTzFke9UhwmYqfjcYDRptFiQQs43CchjDeGyduMEj7dyCg0+qu5rHVE7GWRyfNJ2
         iMlA==
X-Gm-Message-State: AOJu0Yz0zO4zJXdQzncOoGZlyAJU1FxpjCrjxjnaKjMIy9+2U98IIFuw
	uTx7wLOJYfgO8jGAvovfMMNz6VLwShTNu27qwyL+p8jbprosO/he+RPHD4xdUw==
X-Gm-Gg: ASbGncv7qKcUx3w5PmjkV8lMhUZQfZqLKh0a0Vj8N+q3uTfzMNg4DSbZX3d6RwQwaFc
	UMaoikhIzl1RklobFnCPWC0Y4vxCvautHFQSCdcwF2qdekW77gHflzKRskbvUMP4GABMOSI0RDE
	RF/xstasaGUKhsJBbHh3crKqPODpi9SNGs4YGkQ4XGFym0XKSE1uAnm4wRBwq/4C3R/xB8TKlFU
	t5IswC2O+i0N4p0vWnm0GHA3/kyY7Iiuuqgj0GlQA4QhpA+QTUMyIdgcPaoj4yEkfnIKg9SCKHx
	H3QeTbl7TZiQ708zolw00azy0ahSEXWyR516dEia/CFdi+VaP5frM3+lXPfJKyuckLqKJr5sSJG
	Bqj/gjA==
X-Google-Smtp-Source: AGHT+IGB/0bIECaDIXnib5X73HwOOL+qMK7CDMDksWIM6RbyaIUKObzVvYfnCaDEiPhA+ErrdWoC8A==
X-Received: by 2002:a17:902:f644:b0:224:c46:d167 with SMTP id d9443c01a7336-22ac29a7d25mr57633465ad.16.1744222216056;
        Wed, 09 Apr 2025 11:10:16 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1e5171dsm1653480b3a.153.2025.04.09.11.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 11:10:15 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 17/23] staging: gpib: hp_82335: u8 over uint8_t
Date: Wed,  9 Apr 2025 18:09:47 +0000
Message-ID: <20250409180953.398686-18-matchstick@neverthere.org>
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
 drivers/staging/gpib/hp_82335/hp82335.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/gpib/hp_82335/hp82335.c b/drivers/staging/gpib/hp_82335/hp82335.c
index 32b3aba673d9..1ef85a54626b 100644
--- a/drivers/staging/gpib/hp_82335/hp82335.c
+++ b/drivers/staging/gpib/hp_82335/hp82335.c
@@ -29,7 +29,7 @@ static void hp82335_detach(struct gpib_board *board);
 static irqreturn_t hp82335_interrupt(int irq, void *arg);
 
 // wrappers for interface functions
-static int hp82335_read(struct gpib_board *board, uint8_t *buffer, size_t length,
+static int hp82335_read(struct gpib_board *board, u8 *buffer, size_t length,
 			int *end, size_t *bytes_read)
 {
 	struct hp82335_priv *priv = board->private_data;
@@ -37,7 +37,7 @@ static int hp82335_read(struct gpib_board *board, uint8_t *buffer, size_t length
 	return tms9914_read(board, &priv->tms9914_priv, buffer, length, end, bytes_read);
 }
 
-static int hp82335_write(struct gpib_board *board, uint8_t *buffer, size_t length, int send_eoi,
+static int hp82335_write(struct gpib_board *board, u8 *buffer, size_t length, int send_eoi,
 			 size_t *bytes_written)
 {
 	struct hp82335_priv *priv = board->private_data;
@@ -45,7 +45,7 @@ static int hp82335_write(struct gpib_board *board, uint8_t *buffer, size_t lengt
 	return tms9914_write(board, &priv->tms9914_priv, buffer, length, send_eoi, bytes_written);
 }
 
-static int hp82335_command(struct gpib_board *board, uint8_t *buffer, size_t length,
+static int hp82335_command(struct gpib_board *board, u8 *buffer, size_t length,
 			   size_t *bytes_written)
 {
 	struct hp82335_priv *priv = board->private_data;
@@ -88,7 +88,7 @@ static void hp82335_remote_enable(struct gpib_board *board, int enable)
 	tms9914_remote_enable(board, &priv->tms9914_priv, enable);
 }
 
-static int hp82335_enable_eos(struct gpib_board *board, uint8_t eos_byte, int compare_8_bits)
+static int hp82335_enable_eos(struct gpib_board *board, u8 eos_byte, int compare_8_bits)
 {
 	struct hp82335_priv *priv = board->private_data;
 
@@ -123,14 +123,14 @@ static int hp82335_secondary_address(struct gpib_board *board, unsigned int addr
 	return tms9914_secondary_address(board, &priv->tms9914_priv, address, enable);
 }
 
-static int hp82335_parallel_poll(struct gpib_board *board, uint8_t *result)
+static int hp82335_parallel_poll(struct gpib_board *board, u8 *result)
 {
 	struct hp82335_priv *priv = board->private_data;
 
 	return tms9914_parallel_poll(board, &priv->tms9914_priv, result);
 }
 
-static void hp82335_parallel_poll_configure(struct gpib_board *board, uint8_t config)
+static void hp82335_parallel_poll_configure(struct gpib_board *board, u8 config)
 {
 	struct hp82335_priv *priv = board->private_data;
 
@@ -144,14 +144,14 @@ static void hp82335_parallel_poll_response(struct gpib_board *board, int ist)
 	tms9914_parallel_poll_response(board, &priv->tms9914_priv, ist);
 }
 
-static void hp82335_serial_poll_response(struct gpib_board *board, uint8_t status)
+static void hp82335_serial_poll_response(struct gpib_board *board, u8 status)
 {
 	struct hp82335_priv *priv = board->private_data;
 
 	tms9914_serial_poll_response(board, &priv->tms9914_priv, status);
 }
 
-static uint8_t hp82335_serial_poll_status(struct gpib_board *board)
+static u8 hp82335_serial_poll_status(struct gpib_board *board)
 {
 	struct hp82335_priv *priv = board->private_data;
 
@@ -226,12 +226,12 @@ static inline unsigned int tms9914_to_hp82335_offset(unsigned int register_num)
 	return 0x1ff8 + register_num;
 }
 
-static uint8_t hp82335_read_byte(struct tms9914_priv *priv, unsigned int register_num)
+static u8 hp82335_read_byte(struct tms9914_priv *priv, unsigned int register_num)
 {
 	return tms9914_iomem_read_byte(priv, tms9914_to_hp82335_offset(register_num));
 }
 
-static void hp82335_write_byte(struct tms9914_priv *priv, uint8_t data, unsigned int register_num)
+static void hp82335_write_byte(struct tms9914_priv *priv, u8 data, unsigned int register_num)
 {
 	tms9914_iomem_write_byte(priv, data, tms9914_to_hp82335_offset(register_num));
 }
-- 
2.43.0

