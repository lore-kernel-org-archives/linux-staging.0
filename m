Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B308627BF87
	for <linux-staging@lists.linux.dev>; Wed,  9 Apr 2025 18:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744222213; cv=none; b=c/t7PqojTvHwDDzdF8f6slobi6kMkjpVOV5HyoHGFCW1LvalLQtEjZmmkG+sxdE/U+ql1YA4IVtQzlI8vozQjC4CiepX3MW75HbIBxUpSHxu3V8TmICEOTGUuxEpRlu5Ee/Jwv4S7dnvwa1XL4NXiUqjhTzNz3vmWi4xEx3RQzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744222213; c=relaxed/simple;
	bh=Z/9PFyrUgpPd5rVWjXXudWLnGwRK1lzpWznXRZ2vt5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YgNqEOetvYjh1Qzgz7TGpL+nhAAXr4zukkveMZT0zUQALmb2u0APnZY+cSvW2C6dNFtRwi0sSnFHwJglzM+p9qRkpxpfbBtNdlu8CiV++XmM7dOfHD/E/1u+DTTOWAaZ+4jeEfHzgC+Qa2URxhV7HlZuPVGiURXjJwsTfwDFJzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=F5sZfhbj; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="F5sZfhbj"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22403cbb47fso76960725ad.0
        for <linux-staging@lists.linux.dev>; Wed, 09 Apr 2025 11:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744222210; x=1744827010; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sqFta0OAs/A1Mf1ccmkajj8vrVujNWivC2RzSA3YSm8=;
        b=F5sZfhbjBC4FloFhgrmiyTNaIoJOPN4HycCXesy8+rDeopFBHigYy8FjarOtkPErIz
         lEqB0C6omdNefY/99QgtDQJT9wTfVJyOMthm+wtPrNiwXghuJ71EwgrmEHe6FqW1ci7K
         25fIKSigjcBuIio0zu52X3Et820feo/cx+LTqpqdBvZVP39fXZbL5nXOwdhFk33+L9AK
         YtiGrhXxHvnArgYgkn4Bm6aM+ZwbZOmIa9sxmtgxjjHYlgKkKrC9ll6Yb5sTQl3OQ7mD
         RRDrFq02nbcf0EJPBI5HnbHwkmFz3jR66ZgACp8m/ymjpyvzJ1JEEs1KBaChIoA797ZI
         E4uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744222210; x=1744827010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sqFta0OAs/A1Mf1ccmkajj8vrVujNWivC2RzSA3YSm8=;
        b=T38wIt50FVT6C2x5C+7B93FOjh954jVcdW5MBP/PxA4/t0Qd4VN9E3AS5NrtwCfUS3
         RWwzb+eBY9EcpN3Ami3Ey7x1zwpfxrg0TuzMFgMY03+r/9xa/UVT7nts5vaK0FCT44XO
         YvLBZSLPXYU021wlMOOau3PWRwU6CG93okKn9O/NRKzBztvx7B3y3Wy0jSV2QBtBsuZK
         VTV0QdS26sAtwQ5mIaDGfHKcvKV8n2x9qXm45u+oyQoQQvheVaMjwB49S1FGaxQ7TiNZ
         QqRQZ3nsEuC+nv+HZN8ybEwnGLJi+vzDfNP/J+Ch7jEaoa8WMV6gNUmqSAHARClPvR+k
         PSAg==
X-Gm-Message-State: AOJu0YzSNrfrwYEy5xgG9ZWXX9qN+EPiIHUMSG9DZpbxYWxPVOiit/ps
	XZHKhPr8SX2l0nEvbHywgcx7vXhdEjmZkEZyvqLHPYT0of11x1O8ThGMRN5vSA==
X-Gm-Gg: ASbGncujK4rS9JXw3mBBodfztWnOZYwj6uNENoJ9bb1dR48oPm1ES7HMy+jMP2yC/NM
	+1oC2+565LB9w4laQbgBHKmJ78CerJN7GIw7cykh7xsvDaOBrjZIbvfVXxFIT2emwOLIPTNHLRh
	JcItgmnJRcD/t2ob9jwjJD3Ql7m/gnumw3xJLNBq2n3uABLTWJOsEO97ntLmSz51i5Q7/Hnq/lF
	9MI1e7BLr+8ywEmHSzb91ElT6wsJRwkD+oVsKefqMId25cnLjzgkTgJPZFxlNSaxO0nReZ19Lo4
	KRD3YdSd9ligfJ/GQYVpRjfv7X1N2QReMyJBu4KWZSZHF6pq6zX2AY1ZKxY9fkzTaVUbX1Wtmcv
	D8X23cw==
X-Google-Smtp-Source: AGHT+IFLyv9CmUbEcdfnl8fz4Fmbrxb1KZDGtW3HewJTA/yvxwPhPX1jbaV/s6Q9U8fXSvOEWj/oMA==
X-Received: by 2002:a17:903:1ce:b0:220:e392:c73 with SMTP id d9443c01a7336-22ac29bf75emr45048045ad.22.1744222209974;
        Wed, 09 Apr 2025 11:10:09 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b8b2b6sm15146145ad.65.2025.04.09.11.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 11:10:09 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 12/23] staging: gpib: agilent_82350b: u8 over uint8_t
Date: Wed,  9 Apr 2025 18:09:42 +0000
Message-ID: <20250409180953.398686-13-matchstick@neverthere.org>
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
 .../gpib/agilent_82350b/agilent_82350b.c      | 22 +++++++++----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
index 901f7182502b..ce9c88a2b9f5 100644
--- a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
+++ b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
@@ -27,10 +27,10 @@ MODULE_DESCRIPTION("GPIB driver for Agilent 82350b");
 static int read_transfer_counter(struct agilent_82350b_priv *a_priv);
 static unsigned short read_and_clear_event_status(struct gpib_board *board);
 static void set_transfer_counter(struct agilent_82350b_priv *a_priv, int count);
-static int agilent_82350b_write(struct gpib_board *board, uint8_t *buffer,
+static int agilent_82350b_write(struct gpib_board *board, u8 *buffer,
 				size_t length, int send_eoi, size_t *bytes_written);
 
-static int agilent_82350b_accel_read(struct gpib_board *board, uint8_t *buffer,
+static int agilent_82350b_accel_read(struct gpib_board *board, u8 *buffer,
 				     size_t length, int *end, size_t *bytes_read)
 
 {
@@ -145,7 +145,7 @@ static int translate_wait_return_value(struct gpib_board *board, int retval)
 	return 0;
 }
 
-static int agilent_82350b_accel_write(struct gpib_board *board, uint8_t *buffer,
+static int agilent_82350b_accel_write(struct gpib_board *board, u8 *buffer,
 				      size_t length, int send_eoi,
 				      size_t *bytes_written)
 {
@@ -297,7 +297,7 @@ static void set_transfer_counter(struct agilent_82350b_priv *a_priv, int count)
 }
 
 // wrappers for interface functions
-static int agilent_82350b_read(struct gpib_board *board, uint8_t *buffer,
+static int agilent_82350b_read(struct gpib_board *board, u8 *buffer,
 			       size_t length, int *end, size_t *bytes_read)
 {
 	struct agilent_82350b_priv *priv = board->private_data;
@@ -305,7 +305,7 @@ static int agilent_82350b_read(struct gpib_board *board, uint8_t *buffer,
 	return tms9914_read(board, &priv->tms9914_priv, buffer, length, end, bytes_read);
 }
 
-static int agilent_82350b_write(struct gpib_board *board, uint8_t *buffer,
+static int agilent_82350b_write(struct gpib_board *board, u8 *buffer,
 				size_t length, int send_eoi, size_t *bytes_written)
 
 {
@@ -314,7 +314,7 @@ static int agilent_82350b_write(struct gpib_board *board, uint8_t *buffer,
 	return tms9914_write(board, &priv->tms9914_priv, buffer, length, send_eoi, bytes_written);
 }
 
-static int agilent_82350b_command(struct gpib_board *board, uint8_t *buffer,
+static int agilent_82350b_command(struct gpib_board *board, u8 *buffer,
 				  size_t length, size_t *bytes_written)
 
 {
@@ -373,7 +373,7 @@ static void agilent_82350b_remote_enable(struct gpib_board *board, int enable)
 	tms9914_remote_enable(board, &priv->tms9914_priv, enable);
 }
 
-static int agilent_82350b_enable_eos(struct gpib_board *board, uint8_t eos_byte,
+static int agilent_82350b_enable_eos(struct gpib_board *board, u8 eos_byte,
 				     int compare_8_bits)
 {
 	struct agilent_82350b_priv *priv = board->private_data;
@@ -412,7 +412,7 @@ static int agilent_82350b_secondary_address(struct gpib_board *board,
 	return tms9914_secondary_address(board, &priv->tms9914_priv, address, enable);
 }
 
-static int agilent_82350b_parallel_poll(struct gpib_board *board, uint8_t *result)
+static int agilent_82350b_parallel_poll(struct gpib_board *board, u8 *result)
 {
 	struct agilent_82350b_priv *priv = board->private_data;
 
@@ -420,7 +420,7 @@ static int agilent_82350b_parallel_poll(struct gpib_board *board, uint8_t *resul
 }
 
 static void agilent_82350b_parallel_poll_configure(struct gpib_board *board,
-						   uint8_t config)
+						   u8 config)
 {
 	struct agilent_82350b_priv *priv = board->private_data;
 
@@ -434,14 +434,14 @@ static void agilent_82350b_parallel_poll_response(struct gpib_board *board, int
 	tms9914_parallel_poll_response(board, &priv->tms9914_priv, ist);
 }
 
-static void agilent_82350b_serial_poll_response(struct gpib_board *board, uint8_t status)
+static void agilent_82350b_serial_poll_response(struct gpib_board *board, u8 status)
 {
 	struct agilent_82350b_priv *priv = board->private_data;
 
 	tms9914_serial_poll_response(board, &priv->tms9914_priv, status);
 }
 
-static uint8_t agilent_82350b_serial_poll_status(struct gpib_board *board)
+static u8 agilent_82350b_serial_poll_status(struct gpib_board *board)
 {
 	struct agilent_82350b_priv *priv = board->private_data;
 
-- 
2.43.0

