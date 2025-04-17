Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119311922FB
	for <linux-staging@lists.linux.dev>; Thu, 17 Apr 2025 00:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744850743; cv=none; b=bTy+T8DBbMYI1UI9Ii/pnYWdWjz6YB+nesb2SYvmZgV0m0SbNOhGgoDT29hmhHtUb7OXpD17JH1Ao4UVDtWG/FqwbfnOlPeEyEZdQn8EoATHqF9jfp6KVfUx4K8RjyNvoGBeeHtCYxycABWUQy+CHGUnNIhpPv14ZygpLk+M1qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744850743; c=relaxed/simple;
	bh=Z/9PFyrUgpPd5rVWjXXudWLnGwRK1lzpWznXRZ2vt5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XbhuNvbYhzKv0yiNKNe7COICFmNUncmOtr7kxXonSM2LFPdih6KSy0+mZz0/2qtguxDRaq0ixqhrsIckp4n1/b51rfE0drtUL728ohB0SnG3FIwq1fumU1ydj+Ns7p7sPJope9Wv9f/TmbT+MDmX+Sks+0HSt0inKLTJTg1u6X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=d1sSBsJR; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="d1sSBsJR"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7399838db7fso246444b3a.0
        for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 17:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744850741; x=1745455541; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sqFta0OAs/A1Mf1ccmkajj8vrVujNWivC2RzSA3YSm8=;
        b=d1sSBsJRvBbNVTaNFo6ZG2BQQSW6hOHtma5CpWaA6MKubO7lGxIpS1QBISvjW42tOn
         rc1HzviXbcqZ0wTQyXwE+MZwt9H4bzQd8vRCE6hlCX8q1h6xFwIkmMaOOqtDLNtUKd8W
         efkTf6Jn0fRF/jtevjKT+QcmdcLSmuPtEKreBWR3aEDjS1lD71sx0cG1JX2McFqOQbZZ
         KJGtH1hremWxpOkgglcvZU+Y2/wvJ2dCajvnizwtUFhO/h9kwrgalDV7cLtEPn1xwBW4
         RktQ7V8vTFSTo7RACQtR/k/60DTP/UWIvABNM+CwJDbU6PZBPPw08PyOf9leVrs4f1Dv
         rJMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744850741; x=1745455541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sqFta0OAs/A1Mf1ccmkajj8vrVujNWivC2RzSA3YSm8=;
        b=g6des41h/zLxD+9J1kBSkfC/y4BOYxEaE0NTWQ9EZzEUxJMYLdywieoakrS5nW5fDB
         bTCoyQMbVcPQw23AsVsDjYSDW/LV0cdFh61OrnebXsEp99jQh3vn5D1uAoLkQMemsKR+
         O0mLZ4hDlQ4r+FVurKdwsWKv4/naKA1pLrLzCwoAAlgiEM+kpBwbqqeOhYOy9bPOTkNp
         BgWVpLVxxBgzHO0jps8oFmV+V4QtxHZeCNLHorqv0e1gI0N9Lr6hheelK60zX9B/xOrh
         gt+GeZwbaD2f4zAXQnIefj8rOFLPSwxzyH9F5wT6QmtIGqgPeUqtz9gCx0uXd8iR4HAc
         R/Kg==
X-Gm-Message-State: AOJu0YxJaPmZ2IKib5qyAdzu+NKrL8yXXgCo0eGwsWxATSjWFDevrhWg
	3/IasnZBEAfeZr010tWavbKj8RmIxsioB8Er5bhgBo+kioDRs4fOIJn1OCuPng==
X-Gm-Gg: ASbGncvL19wpGu7tD0DwJtRkYhyqQnATaWh8dmXZJHsz1LvFBzwrKNYaIrZhBAzABPi
	qfwM+HVK5LBgSF6ydB3FWGF2jwPgmhN4SbxOIhBwOL6Z4XMLzNdAkA5tZ/QrkdQoC99fQurHcrN
	O91cLoKClB4y5yizHpCKCyjlq/1B4rbyhB9gDbYj31bUMX/BA3E+DqVOF3FPF6GfljFyMzjjJYH
	vbXQV4jOLGVnu2ukQr243K27WMme2tX7isUjoPNaW3eVXb2I4o6k2dMrf1Q8aKpzAio2cgcWSl7
	jx4a17llcCUOkN4SNp2uUeC8gb42Idu1cC2BXmr0rdSmtv6HWB3sA0NorUgdTumBOQUMq5XSp6H
	Twic5XK5EfvUBGZf7
X-Google-Smtp-Source: AGHT+IFm2kd2Ns0/xVrxZ+SqxY9+nr2Ab80jlqyfZwd1KviJlz3p5qt0eS4Y/Do95MMFvROpfOcjcg==
X-Received: by 2002:a05:6a00:ac9:b0:736:491b:5370 with SMTP id d2e1a72fcca58-73cf2ab2469mr1184689b3a.10.1744850741229;
        Wed, 16 Apr 2025 17:45:41 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c388fsm11493824b3a.54.2025.04.16.17.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 17:45:41 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2 03/14] staging: gpib: agilent_82350b: u8 over uint8_t
Date: Thu, 17 Apr 2025 00:45:22 +0000
Message-ID: <20250417004533.86765-4-matchstick@neverthere.org>
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

