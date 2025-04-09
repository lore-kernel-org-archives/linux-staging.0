Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B1927C857
	for <linux-staging@lists.linux.dev>; Wed,  9 Apr 2025 18:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744222220; cv=none; b=mV+VFOwBvl0OBn70NG9z7FMvZsKyVzPzXXcP4ombbv4KzZyZrRPVGDDLuc/0Z1CyrSkkkXN/QtYjfzXk01Vhtp56tDpDEi2EEnABuaVtziybc2NlNkJpGEQXgEpDcmilPYaH/xqSzRxMWrYd1tEw3q23AIAHY+jc8YDpu8Pkq3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744222220; c=relaxed/simple;
	bh=7K/Ey0gHYN42qnHgygKczjLg5EqGKk8ytvPGlUSZALE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t6eHTh4h36373ptdGpNbzgsS2R/KIselnfRg383kQ4pZKkSMwUN58Ql2X7r4GAHhrYZtAdrwv8NasDZ7QYIIIs5S8ZyyIbWY/ZGRqULMKhWBqC2rKBqcX+jL1WcFhNc8X5UOLOBMQiSDp3A1HW7Gi0BwfbuHnyPUDOLjqIBAYB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=Nqe21DSm; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="Nqe21DSm"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so6411877b3a.0
        for <linux-staging@lists.linux.dev>; Wed, 09 Apr 2025 11:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744222217; x=1744827017; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NCUDjguyHlhjk06kpVPD65mb7rJ1QHXPUgq+Tlq7pMU=;
        b=Nqe21DSmW90pbDbc7FmK16iX+23qBLE/sPIjxIyMWtG8mzOs5bb1KvmlGo6Mf1U/zZ
         GhE8HL0UU7CPSgujZ+FiOTIGhifdB0KPwfI1DQHrw815qXSlz0y6KMozYO7SzCGjZ7po
         Ery1/S58R0Kxjee8i9TUcZ5o7xQ1/ftDCT49eHgRXKguvTS+SqNz6PJRRUgJ7KzRzm93
         oAeaYEqrf20KSEPeyBsMHZOws5Vt3CkxrDyVZJ+GUOsjPjXVP/O1loi9UuY1jtROw2xj
         QCvndqfQMAb8OfxPE39jy5msvH7pBZfILdeyxa26Lu8ZptEl4YJNh7WOqPJYNhA0o7Na
         0rZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744222217; x=1744827017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NCUDjguyHlhjk06kpVPD65mb7rJ1QHXPUgq+Tlq7pMU=;
        b=I+ZtaD+TA7bpJEjkQF/Sl9jweoq1JYM1fQdlm9+fLJKPPIldaxz+O5AM9en0FSFOlA
         IglCrKzZZPJDVrrlhgYMVOwgJMKO9KQohpnW9fHZxMYz8eD3YO6EN9Las+pRyEZCCKqA
         neITNusiUh77mWdyp39/X0zOLbYSO66Eqh14K/A2KuiyzHMPJ6/DPL4oBIODXJNKCXeD
         Nv6J2AY3g8qwSSa1flGGlD28L835NMgRF3jnzsRhBI7FFWo7IZAcLyh7iTetpPnG9WKL
         uly5IMppzAT1q1lZ7GI+HQS/ABZ6/EFdgJBLLp+cVFe1Rnabmg+hSzFZ4Ey9XvulxBE8
         EBWw==
X-Gm-Message-State: AOJu0YyFPQcWjNO4cmlGzk829EDpBuYU5mncQWstd/TdChXzLe21bdSE
	Hi52M7tqySUkOiRxcXfVkc09Mix5XA5DhhGE8MVYmOVQcSyGw8PURzV69osu4A==
X-Gm-Gg: ASbGncvxMKaCYMUkyLxak2doQPXq4iDDyLF/G01zfzujFB6EDYWXqn0Soori2pOzbUV
	he70PVKizzNu46FpmoTLU2vIts9tsQLOqc02oN5kAJUROffwCOJusZHgGxmjaSBSAsx6SJQZZQi
	TV7C2uWVvvCESZdu+cSvyaDmhMb8CS15Yh3NaaNB/CDbtphTje9KYsdMN1MSHUhnAIufqQ+4sJY
	LBN/qTCAavHaqhEbaPBbLTEVlJV3kYR4bIIq4LpzaE9r5n+KuhIrIAjimwncm8YJxIyj8BeREsu
	2r5IqQBG9jMwMUrtzdOpm1RaNX/XLLXXv4RM9B5rM2FWLdMqKR5Q93QimlLUFgbYjv52V0x85rf
	Ux3gN4A==
X-Google-Smtp-Source: AGHT+IF0pXpoY52fqhA3oW8On3xQ2utlN6BtI/CBDPXt++Fm3oLlC6tIO8ZtVEag++ICgiy4SZcHMg==
X-Received: by 2002:a05:6a00:a91:b0:736:32d2:aa8e with SMTP id d2e1a72fcca58-73bae4b9158mr4829808b3a.6.1744222217327;
        Wed, 09 Apr 2025 11:10:17 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1e69505sm1655899b3a.168.2025.04.09.11.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 11:10:17 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 18/23] staging: gpib: hp_82341: u8 over uint8_t
Date: Wed,  9 Apr 2025 18:09:48 +0000
Message-ID: <20250409180953.398686-19-matchstick@neverthere.org>
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
 drivers/staging/gpib/hp_82341/hp_82341.c | 26 ++++++++++++------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/gpib/hp_82341/hp_82341.c b/drivers/staging/gpib/hp_82341/hp_82341.c
index f2306245ce4c..fc0c4e45eb4f 100644
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
@@ -172,7 +172,7 @@ static int restart_write_fifo(struct gpib_board *board, struct hp_82341_priv *hp
 	return 0;
 }
 
-static int hp_82341_accel_write(struct gpib_board *board, uint8_t *buffer, size_t length,
+static int hp_82341_accel_write(struct gpib_board *board, u8 *buffer, size_t length,
 				int send_eoi, size_t *bytes_written)
 {
 	struct hp_82341_priv *hp_priv = board->private_data;
@@ -255,7 +255,7 @@ static int hp_82341_attach(struct gpib_board *board, const struct gpib_board_con
 static void hp_82341_detach(struct gpib_board *board);
 
 // wrappers for interface functions
-static int hp_82341_read(struct gpib_board *board, uint8_t *buffer, size_t length, int *end,
+static int hp_82341_read(struct gpib_board *board, u8 *buffer, size_t length, int *end,
 			 size_t *bytes_read)
 {
 	struct hp_82341_priv *priv = board->private_data;
@@ -263,7 +263,7 @@ static int hp_82341_read(struct gpib_board *board, uint8_t *buffer, size_t lengt
 	return tms9914_read(board, &priv->tms9914_priv, buffer, length, end, bytes_read);
 }
 
-static int hp_82341_write(struct gpib_board *board, uint8_t *buffer, size_t length, int send_eoi,
+static int hp_82341_write(struct gpib_board *board, u8 *buffer, size_t length, int send_eoi,
 			  size_t *bytes_written)
 {
 	struct hp_82341_priv *priv = board->private_data;
@@ -271,7 +271,7 @@ static int hp_82341_write(struct gpib_board *board, uint8_t *buffer, size_t leng
 	return tms9914_write(board, &priv->tms9914_priv, buffer, length, send_eoi, bytes_written);
 }
 
-static int hp_82341_command(struct gpib_board *board, uint8_t *buffer, size_t length,
+static int hp_82341_command(struct gpib_board *board, u8 *buffer, size_t length,
 			    size_t *bytes_written)
 {
 	struct hp_82341_priv *priv = board->private_data;
@@ -319,7 +319,7 @@ static void hp_82341_remote_enable(struct gpib_board *board, int enable)
 	tms9914_remote_enable(board, &priv->tms9914_priv, enable);
 }
 
-static int hp_82341_enable_eos(struct gpib_board *board, uint8_t eos_byte, int compare_8_bits)
+static int hp_82341_enable_eos(struct gpib_board *board, u8 eos_byte, int compare_8_bits)
 {
 	struct hp_82341_priv *priv = board->private_data;
 
@@ -354,14 +354,14 @@ static int hp_82341_secondary_address(struct gpib_board *board, unsigned int add
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
 
@@ -375,14 +375,14 @@ static void hp_82341_parallel_poll_response(struct gpib_board *board, int ist)
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
 
@@ -479,12 +479,12 @@ static void hp_82341_free_private(struct gpib_board *board)
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

