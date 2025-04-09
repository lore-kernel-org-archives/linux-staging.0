Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7817727C844
	for <linux-staging@lists.linux.dev>; Wed,  9 Apr 2025 18:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744222217; cv=none; b=EvNoIuzAFjwQyzIoWMVj05C7aFdVeNOdhUy1Z12Vpor5znymWU+QDZHKV0T3VQlAqnTImaZND5HHUhoJuA3XcEHyP9nSGgi3pXSo2ZeOczuOoJ/JCyxbZdgvxUu/cQH0NDjohnerm0kDy5eEXEn9bOG3h6yEbRZeh8krNggrepg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744222217; c=relaxed/simple;
	bh=HRwow9ClQsrXSbnVN6eKngDAH8a3mB3oX0jq3BVbb2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KdGlfx9exeCs8ErsuN/ATu5mJtEM9YvXr/d6LgpOp/7cKa7NK3Jr/WThXeEDTyAwoGTuxTbRz7KbEAKK0kwTKfcpVY8ifW0Z5INpq27x1lh2Ef9wmqbJDdTzIm1B+C5EcHlLj0ovl3n36fFN8yq1qIKa+xaCBQiHmfsEpTZOV2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=THk3Z9Oz; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="THk3Z9Oz"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22401f4d35aso83063325ad.2
        for <linux-staging@lists.linux.dev>; Wed, 09 Apr 2025 11:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744222215; x=1744827015; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YKllNz6gZ/alTRBBxLGzP5qPEaY07InopJtWbOeGT40=;
        b=THk3Z9OzSxaxwNpSnuuAztAvDjFuMWRaX9R1a25bbGZeEsnPacpqEJMyPOIjYAH1DZ
         SYhqIqgs6LveAc9dQYVe5uGD7lL00MFo0njkSalnw69ZV9LqFNDw78XuFLxGSgnU/FqF
         LAn2kDM4dTdoGEQWJ/1y/w7Zeeg1w/MEUeVwBx2Ur8oc5Eyt9zmXg5jzJ7Xr6W4UGD82
         jSJ2+3n+XaW7ozTkKRw7fIW5kShlWyog1qdvIcknx3GX5zsRFPrgHtwYjpub6ENpb/w0
         wDlNWeEPH6P4EhKZrCfYc/NXaD3PboMJy4mzpYbbtmPzz0JVdYMXH1TEsXxPuIN8QjGL
         DK0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744222215; x=1744827015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YKllNz6gZ/alTRBBxLGzP5qPEaY07InopJtWbOeGT40=;
        b=YHt++n7Ubgn45UrzttBJuNJ2EsXLz0sFpFGhdbuwiTm4k12AIfnJfGmsn27QOrColi
         NsQOWWTLPcWEQ9pUrY55RTF/dfLHrbtjwIEfCR1BNQ9EJrQswQPX00EPi+EGHCWRt40p
         tuUF60yO8xlSnzuQ03o7WQ3//6QDU1R02Y5sE4v9yddk7SAzR6nqGOElWiBIX+hSPjyN
         IMzoAQoadcPEFwcF+CbedLgAFLuDR65EJcyvEdU3rsR1JJWG0OTy76pqiygQzEJox46s
         16x7wsUc0wlAJLJL7aOai0rSgsHJPKiVCsRItJagyEV1NBs9/vnKmWlwWqII3erTq/9+
         E1tw==
X-Gm-Message-State: AOJu0Yx8aYJZA2+i4VHXqYehJFNKTxaUyHjD6sUA31f3VQQFT0TAnFvU
	kuuszxVlxYnPo3cfQv+Ftks5RC6teq5lk2cffqwr2mvqZ4/Xtavvio/74XAxKPa5Y7lDgex0aEA
	=
X-Gm-Gg: ASbGnctSAVbsuS/zxIfcCT2XL1MRBi4glWtRzj+q/LijIkkZZyti9vE8Ru0uvhlBPgj
	MdsTy/+eXFXwaLrCW262+cAD3L17QWJX4MqL7d0/ShD1MsYPkIecd1BxVG1CP/jB+sqJj8+Dvsm
	goZv8yG0hAi0/g0nhZRvfhMVFC7LecViTkd2bnbRvLo2wgOi2Py1hNLl2xX3Y6NNI/LdPn1ga14
	Q3WXjC3JozpBPz80FtSdcWWm1Nigxt8jl7KNfkSEitu/TeCfW4arxHoaku3KxKoXyOG93HHEN1b
	bBCjsldwkdo3Qn59qhnybQ41Vnv7ygoxEvuyWvR4Po/G+tOxbI/lPJln8tn4oVOHYBzLJ2RfE8m
	Iul9QZA==
X-Google-Smtp-Source: AGHT+IENtajno4seXWKvWjtKFEsr6sD6i0sgai4p/SCr4G27WgG+SGKVgRRrpwv6dhiSzXAZcXqHAw==
X-Received: by 2002:a17:903:46cd:b0:224:6a7:a5b0 with SMTP id d9443c01a7336-22ac298006amr62975275ad.2.1744222214900;
        Wed, 09 Apr 2025 11:10:14 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b8c69bsm15261225ad.72.2025.04.09.11.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 11:10:14 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 16/23] staging: gpib: gpib_bitbang: u8 over uint8_t
Date: Wed,  9 Apr 2025 18:09:46 +0000
Message-ID: <20250409180953.398686-17-matchstick@neverthere.org>
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
 drivers/staging/gpib/gpio/gpib_bitbang.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/gpib/gpio/gpib_bitbang.c b/drivers/staging/gpib/gpio/gpib_bitbang.c
index c586f739c251..1fb44e2c64a5 100644
--- a/drivers/staging/gpib/gpio/gpib_bitbang.c
+++ b/drivers/staging/gpib/gpio/gpib_bitbang.c
@@ -324,7 +324,7 @@ static void set_data_lines(u8 byte);
 static u8 get_data_lines(void);
 static void set_data_lines_input(void);
 static void set_data_lines_output(void);
-static inline int check_for_eos(struct bb_priv *priv, uint8_t byte);
+static inline int check_for_eos(struct bb_priv *priv, u8 byte);
 static void set_atn(struct gpib_board *board, int atn_asserted);
 
 static inline void SET_DIR_WRITE(struct bb_priv *priv);
@@ -353,7 +353,7 @@ static char printable(char x)
  *									   *
  ***************************************************************************/
 
-static int bb_read(struct gpib_board *board, uint8_t *buffer, size_t length,
+static int bb_read(struct gpib_board *board, u8 *buffer, size_t length,
 		   int *end, size_t *bytes_read)
 {
 	struct bb_priv *priv = board->private_data;
@@ -491,7 +491,7 @@ static irqreturn_t bb_DAV_interrupt(int irq, void *arg)
  *									   *
  ***************************************************************************/
 
-static int bb_write(struct gpib_board *board, uint8_t *buffer, size_t length,
+static int bb_write(struct gpib_board *board, u8 *buffer, size_t length,
 		    int send_eoi, size_t *bytes_written)
 {
 	unsigned long flags;
@@ -728,7 +728,7 @@ static irqreturn_t bb_SRQ_interrupt(int irq, void *arg)
 	return IRQ_HANDLED;
 }
 
-static int bb_command(struct gpib_board *board, uint8_t *buffer,
+static int bb_command(struct gpib_board *board, u8 *buffer,
 		      size_t length, size_t *bytes_written)
 {
 	size_t ret;
@@ -920,7 +920,7 @@ static void bb_remote_enable(struct gpib_board *board, int enable)
 	}
 }
 
-static int bb_enable_eos(struct gpib_board *board, uint8_t eos_byte, int compare_8_bits)
+static int bb_enable_eos(struct gpib_board *board, u8 eos_byte, int compare_8_bits)
 {
 	struct bb_priv *priv = board->private_data;
 
@@ -987,12 +987,12 @@ static int bb_secondary_address(struct gpib_board *board, unsigned int address,
 	return 0;
 }
 
-static int bb_parallel_poll(struct gpib_board *board, uint8_t *result)
+static int bb_parallel_poll(struct gpib_board *board, u8 *result)
 {
 	return -ENOENT;
 }
 
-static void bb_parallel_poll_configure(struct gpib_board *board, uint8_t config)
+static void bb_parallel_poll_configure(struct gpib_board *board, u8 config)
 {
 }
 
@@ -1000,11 +1000,11 @@ static void bb_parallel_poll_response(struct gpib_board *board, int ist)
 {
 }
 
-static void bb_serial_poll_response(struct gpib_board *board, uint8_t status)
+static void bb_serial_poll_response(struct gpib_board *board, u8 status)
 {
 }
 
-static uint8_t bb_serial_poll_status(struct gpib_board *board)
+static u8 bb_serial_poll_status(struct gpib_board *board)
 {
 	return 0; // -ENOENT;
 }
@@ -1364,7 +1364,7 @@ inline long usec_diff(struct timespec64 *a, struct timespec64 *b)
 		(a->tv_nsec - b->tv_nsec) / 1000);
 }
 
-static inline int check_for_eos(struct bb_priv *priv, uint8_t byte)
+static inline int check_for_eos(struct bb_priv *priv, u8 byte)
 {
 	if (priv->eos_check)
 		return 0;
-- 
2.43.0

