Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3079D277031
	for <linux-staging@lists.linux.dev>; Wed,  9 Apr 2025 18:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744222214; cv=none; b=HsDHmGcLiSTT7sigX3s01SbLAxKa4DAlZNwIyi7gok0p9Dp7hytci/Xv76p/ehftGQRw3CA6RHn9tqb7cqJZhHUY5GChMeZqhJd0/INeSyP76W51w+T381n8najWl2lzcQDIZ6I7gkOLn5r1uKTZO4FvSUqJ77g/ilteVhdfsh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744222214; c=relaxed/simple;
	bh=UF3Ph7GJtyTErF51igoxP/Xy5CQFL3IB/NvZ0MboohI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eUixuikgWv1PNgH5u6qOzB4O+mibpGuQPL4A+zTRXfcon5fIDymNo9p1i8XWSJgjTJaB6YXy3AJqblE5Wb2kkmyzLd1+kc6EUfDa/NNf0dx1yZ6VFJBg4ZezxSJwn2+kJpEIhpAyTr/ehr7gi1rmOImhCWnG51EzWmSyjnujsbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=DFr9dsti; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="DFr9dsti"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-227cf12df27so208975ad.0
        for <linux-staging@lists.linux.dev>; Wed, 09 Apr 2025 11:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744222211; x=1744827011; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lX8GXS+GtiD2xY/xkUPG2Y/uCTE9iFOvDsNI6cDVLP0=;
        b=DFr9dstiFpvXgcIVFxe8k1DUdYaDLMEl7OHQM3l7KjMGF3ZNRBVuTxHBZCi2KJQa4g
         JH8bwGfqu8WsbXFSrxFMTOLSSfnfMEjsM0PIT5v8h4RL7/eYHDMXFoXv2Ewdn5cOlO64
         kNQ7fG3nQFWevzfrpmppN2qsPCoCfxPddJ3SH4bf9Jaw4yeXWge3/iQlZJ40GTxVv3HP
         apgcdtzOEf2bINFMcakMHiVBHJ894Z7Jp23yFf6f+Y8kU1JfPSEot56vgvZxJPcmbQwq
         WLCo8pPjIdClTPaBbbs6LnsgWKxhBRVctTuNt0/vRxSiZCvXme/bzj3QoOyhKrlSJ5x7
         owlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744222211; x=1744827011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lX8GXS+GtiD2xY/xkUPG2Y/uCTE9iFOvDsNI6cDVLP0=;
        b=AnGlE7pREDeTMqY0m1F0r1bkyFwMx983f9eDkH5V/ymdzaOh/UfGAasu3oTIfv/Liu
         vYZU+PeZbA7CG0rjHic+KLzf8XVVbLK75ZIN94yu4YRrx/Tw7khDsY8aLy2sGmiOqP0g
         53BHJfj668XvMLA8KyNDtbIhPyQEMprxMynaV3zEIc+Emt2Ah56YMirejJEhzh2BKSCX
         e1KDXH838pOuL5/S1UZWnAccSFg89w8I2syuenKdLe+jKfTD/zxYpG65Wfc2iK4TWbPR
         0EvhPnaU1hZ9/pVbq9r1KSyS4yBb+wOjXThRDdj4IYZbk/P7Kkxcv4ugJHPBVMviniXy
         czOQ==
X-Gm-Message-State: AOJu0YzysvcmI7IX7ANVPxukvFzPcNdiZILJDt+YfCGEFlyRDvDmqhmN
	OZO+EgcB5RxbIj9ZELejjVkFUu8JJr/uwNHmvTfQS3fP/yIt5121tP8M5BzXhw==
X-Gm-Gg: ASbGncvuhTeuNP2Yg2ILsDfxxLLn5Gea8epAibsHaqFUEkgr5UbC0u7iYCfqUJXsBLn
	G2hLsCrzCjMi/IktbD2s+ppOLaSZ/vQyMvJ/30sdHR/9D90FceO3jmeSsR5WD+jBk0pOFZgyK5S
	ZnVqjYwtGG6XuaOwtNkMSw+KoPJ2xocp53ESk4Tbg5UAPM0RafhtIwxQnMipkjstATYowgZRZtG
	wYhW7nZoJSUWZq6uh9LqXLBonkTyLh5o5YXY1UIofmu4b+Es0ZFlUmfD5bHTj2CZ2KMX6HZraOt
	t8LkEWfoVlZopWUYvrLdyFbnCFC/8T3RdEm+ybTTk+YyY4LCFpC/IAzeDXsCa8dPs1xDpzyVNX/
	9u6/V6gzV7Zjtd6zB
X-Google-Smtp-Source: AGHT+IGLPlZ9WeVKzKGO49wItqhrjqOOsFD5nfPhmYeckXxIffF7CpoWoEPGYXRK60Kll07h9yPdtA==
X-Received: by 2002:a17:902:e742:b0:21f:5063:d3ca with SMTP id d9443c01a7336-22ad0208852mr5228345ad.16.1744222211279;
        Wed, 09 Apr 2025 11:10:11 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b8aea0sm15231015ad.56.2025.04.09.11.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 11:10:11 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 13/23] staging: gpib: agilent_82357a: u8 over uint8_t
Date: Wed,  9 Apr 2025 18:09:43 +0000
Message-ID: <20250409180953.398686-14-matchstick@neverthere.org>
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
 .../gpib/agilent_82357a/agilent_82357a.c      | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
index 3cf81a909a23..3d6e11ef465e 100644
--- a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
+++ b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
@@ -420,10 +420,10 @@ static int agilent_82357a_abort(struct agilent_82357a_priv *a_priv, int flush)
 }
 
 // interface functions
-int agilent_82357a_command(struct gpib_board *board, uint8_t *buffer, size_t length,
+int agilent_82357a_command(struct gpib_board *board, u8 *buffer, size_t length,
 			   size_t *bytes_written);
 
-static int agilent_82357a_read(struct gpib_board *board, uint8_t *buffer, size_t length, int *end,
+static int agilent_82357a_read(struct gpib_board *board, u8 *buffer, size_t length, int *end,
 			       size_t *nbytes)
 {
 	int retval;
@@ -535,7 +535,7 @@ static int agilent_82357a_read(struct gpib_board *board, uint8_t *buffer, size_t
 }
 
 static ssize_t agilent_82357a_generic_write(struct gpib_board *board,
-					    uint8_t *buffer, size_t length,
+					    u8 *buffer, size_t length,
 					    int send_commands, int send_eoi,
 					    size_t *bytes_written)
 {
@@ -675,13 +675,13 @@ static ssize_t agilent_82357a_generic_write(struct gpib_board *board,
 	return 0;
 }
 
-static int agilent_82357a_write(struct gpib_board *board, uint8_t *buffer,
+static int agilent_82357a_write(struct gpib_board *board, u8 *buffer,
 				size_t length, int send_eoi, size_t *bytes_written)
 {
 	return agilent_82357a_generic_write(board, buffer, length, 0, send_eoi, bytes_written);
 }
 
-int agilent_82357a_command(struct gpib_board *board, uint8_t *buffer, size_t length,
+int agilent_82357a_command(struct gpib_board *board, u8 *buffer, size_t length,
 			   size_t *bytes_written)
 {
 	return agilent_82357a_generic_write(board, buffer, length, 1, 0, bytes_written);
@@ -832,7 +832,7 @@ static void agilent_82357a_remote_enable(struct gpib_board *board, int enable)
 	return;// 0;
 }
 
-static int agilent_82357a_enable_eos(struct gpib_board *board, uint8_t eos_byte,
+static int agilent_82357a_enable_eos(struct gpib_board *board, u8 eos_byte,
 				     int compare_8_bits)
 {
 	struct agilent_82357a_priv *a_priv = board->private_data;
@@ -946,7 +946,7 @@ static int agilent_82357a_secondary_address(struct gpib_board *board,
 	return 0;
 }
 
-static int agilent_82357a_parallel_poll(struct gpib_board *board, uint8_t *result)
+static int agilent_82357a_parallel_poll(struct gpib_board *board, u8 *result)
 {
 	struct agilent_82357a_priv *a_priv = board->private_data;
 	struct usb_device *usb_dev;
@@ -988,7 +988,7 @@ static int agilent_82357a_parallel_poll(struct gpib_board *board, uint8_t *resul
 	return 0;
 }
 
-static void agilent_82357a_parallel_poll_configure(struct gpib_board *board, uint8_t config)
+static void agilent_82357a_parallel_poll_configure(struct gpib_board *board, u8 config)
 {
 	//board can only be system controller
 	return;// 0;
@@ -1000,13 +1000,13 @@ static void agilent_82357a_parallel_poll_response(struct gpib_board *board, int
 	return;// 0;
 }
 
-static void agilent_82357a_serial_poll_response(struct gpib_board *board, uint8_t status)
+static void agilent_82357a_serial_poll_response(struct gpib_board *board, u8 status)
 {
 	//board can only be system controller
 	return;// 0;
 }
 
-static uint8_t agilent_82357a_serial_poll_status(struct gpib_board *board)
+static u8 agilent_82357a_serial_poll_status(struct gpib_board *board)
 {
 	//board can only be system controller
 	return 0;
-- 
2.43.0

