Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5BF1CAA74
	for <linux-staging@lists.linux.dev>; Thu, 17 Apr 2025 00:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744850750; cv=none; b=Ek20aPIMk6Jo0d3IDdv/ko2+XSIh4ejHlLY61HqcENWYzE0rPTqx4PK0KpzzHMbJo4eFFC2WypOpLB1jm7BiR+WbMoFfvz/n0EU0+bVNmLSslgHFV9oNjFklogx8yweqh7TDozPEud3PUUev+W9ay/3BvHNkk0XTKUfBVlcxbdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744850750; c=relaxed/simple;
	bh=j+MTmHFRQP0zHm00kamesmDnYTv1fzOMNJlvemIhMc4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r10P459BtqPjOIEO2txkKRw9KwamvJEGYwRn9pNPygy7T2RIZCOkiJTxoon8ja06sOl7/WrxWVLB3oIlN45naMFpA7Kw5kU8OMovlg4JatsO9VkXe4C4iN7uA9COVkS5y4XEx9U+8NMkD221oLaWE/Um8bFnmh3nTjnG0qo781I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=jFcAa33f; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="jFcAa33f"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2295d78b45cso3834515ad.0
        for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 17:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744850747; x=1745455547; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ckx60dJiiATx8q3ipdm187MmOymO4PQNEigjQjcjyXo=;
        b=jFcAa33f/2scoLduv3GnYxg6mvCX+l4xPDWdBtjyaE11Vb7KYLUT0tzD+IGSxYrbcN
         sLHWx4ZRcS15BEwDtu8GAJYDgrfynuwv4bCMUd14jwam0VHvNllfylUna7lXzFRx15lm
         FADaQc+02+x5CKmZp9HYgTATyU6DtcwHON5Ssdm721D/iS9CRYfk9u6x9VvQQIhQavYV
         sv/qzLv4APgtHHzA8OungnoY1Z0z2lWrCvESCgYRBP3ra4a0XRZ2Sum7ZMYflMI7UgBI
         MdwIId0gDG2qIdK6c1VEIeO8VWCdWThuAKMX7BhWo5NPnh7CpzND/WEt6szDhayW1Pw0
         DRWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744850747; x=1745455547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ckx60dJiiATx8q3ipdm187MmOymO4PQNEigjQjcjyXo=;
        b=fMJN/m1o+uInUGSvvLpCruqvNpfFvIWdGHqXIk+Nrm7w2mGvGWuNLI6eyMbwTD96Fi
         MBPQsYyHoYC1Tj1eKwiIM1SaUYZqE5H7v+NQkB987FB6epfNDMxjV+6brz7pAfZ6JGsC
         XuE+ndHvxtrVqe3StknTxBUwCpoQTX7O/z+a6HzKmkkN49Y4SYwMCk/0WkS5vAIqbApu
         f9HYwts2bfWZlXUMJr6ARiIj332MnWadiu1XAoAyj8PEOFHjscC38oBfaWfIgaBDXkeu
         2SGK+06VtElUi1Kzz49mF7OhhxO2WsNDs8oTJoHbrA+8JZw0zvj+l/xJa7zC3OIuCjdb
         gGtg==
X-Gm-Message-State: AOJu0YyPlF+3ThjXhipqD+qwhXShMbUG8x0If/boSGB0r4tpYWeBsWws
	/dSwJhTHagoGrhtbIKs/Ne+ALLojvmaAdSmZLhcmMpiK6QgnAYK+22E+ZObDqg==
X-Gm-Gg: ASbGncvCHwS7jFcgqiWfOzoaZXrL8lfQpBr3JQYsOf1g3M1FS89SaySZgXW/EjCEYc4
	/5xpH1yCu5W/SpN90167Q7eSMQuBoTpJvOw2xR6u4lRCbgthT3Iw++qtzND0uo2Psffay038Qq/
	MQxMjbQ2Ot8+Pcwj791UmDuU1zb2LFYh6b7JXg0FcwCzGZDv1e4Yvc64juLsxtoIQpT8nEE0Sg9
	q4oOnqC21cIUHfeJRXeRiyeaidoRuxwY0WVpve80a6aoIwk8n1c8fKnWr3sbtOfwdidZr9s3wfd
	dbuwn1XUJHVOlaCJhUC4U9IYQ1nZkX4U/dPfDBIkbRDoRyTNu1wtiI04FJa7IyZl0IALb5iX/3y
	P9JvaNg==
X-Google-Smtp-Source: AGHT+IHYrFT5dAL+C82IX4ktyem8/uw/i49r6KNMVsvIbtHJn2HOu9uoeECYGG2O16oWWcDdJ2lEyg==
X-Received: by 2002:a17:903:2451:b0:224:1001:677c with SMTP id d9443c01a7336-22c358c568fmr49927625ad.9.1744850747009;
        Wed, 16 Apr 2025 17:45:47 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33ef0e6dsm20988265ad.52.2025.04.16.17.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 17:45:46 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2 08/14] staging: gpib: hp_82335: u8 over uint8_t
Date: Thu, 17 Apr 2025 00:45:27 +0000
Message-ID: <20250417004533.86765-9-matchstick@neverthere.org>
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
 drivers/staging/gpib/hp_82335/hp82335.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/gpib/hp_82335/hp82335.c b/drivers/staging/gpib/hp_82335/hp82335.c
index 7f14ecb46026..3d08d2f726e1 100644
--- a/drivers/staging/gpib/hp_82335/hp82335.c
+++ b/drivers/staging/gpib/hp_82335/hp82335.c
@@ -30,7 +30,7 @@ static void hp82335_detach(struct gpib_board *board);
 static irqreturn_t hp82335_interrupt(int irq, void *arg);
 
 // wrappers for interface functions
-static int hp82335_read(struct gpib_board *board, uint8_t *buffer, size_t length,
+static int hp82335_read(struct gpib_board *board, u8 *buffer, size_t length,
 			int *end, size_t *bytes_read)
 {
 	struct hp82335_priv *priv = board->private_data;
@@ -38,7 +38,7 @@ static int hp82335_read(struct gpib_board *board, uint8_t *buffer, size_t length
 	return tms9914_read(board, &priv->tms9914_priv, buffer, length, end, bytes_read);
 }
 
-static int hp82335_write(struct gpib_board *board, uint8_t *buffer, size_t length, int send_eoi,
+static int hp82335_write(struct gpib_board *board, u8 *buffer, size_t length, int send_eoi,
 			 size_t *bytes_written)
 {
 	struct hp82335_priv *priv = board->private_data;
@@ -46,7 +46,7 @@ static int hp82335_write(struct gpib_board *board, uint8_t *buffer, size_t lengt
 	return tms9914_write(board, &priv->tms9914_priv, buffer, length, send_eoi, bytes_written);
 }
 
-static int hp82335_command(struct gpib_board *board, uint8_t *buffer, size_t length,
+static int hp82335_command(struct gpib_board *board, u8 *buffer, size_t length,
 			   size_t *bytes_written)
 {
 	struct hp82335_priv *priv = board->private_data;
@@ -89,7 +89,7 @@ static void hp82335_remote_enable(struct gpib_board *board, int enable)
 	tms9914_remote_enable(board, &priv->tms9914_priv, enable);
 }
 
-static int hp82335_enable_eos(struct gpib_board *board, uint8_t eos_byte, int compare_8_bits)
+static int hp82335_enable_eos(struct gpib_board *board, u8 eos_byte, int compare_8_bits)
 {
 	struct hp82335_priv *priv = board->private_data;
 
@@ -124,14 +124,14 @@ static int hp82335_secondary_address(struct gpib_board *board, unsigned int addr
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
 
@@ -145,14 +145,14 @@ static void hp82335_parallel_poll_response(struct gpib_board *board, int ist)
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
 
@@ -227,12 +227,12 @@ static inline unsigned int tms9914_to_hp82335_offset(unsigned int register_num)
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

