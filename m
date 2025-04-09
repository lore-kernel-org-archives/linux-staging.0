Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62FFC27CB06
	for <linux-staging@lists.linux.dev>; Wed,  9 Apr 2025 18:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744222222; cv=none; b=eJ/Wq+gV05ZTS3WgVombs33fDRFKC6AVYHaWXe/LK90PvM8zbYT+U3gNiAZhqW0nH6Yoc4kYB9C5NF9X4ALhCKxlLVbjKSMCEfIGGTm24MMKMUeG8/eU8X9cacjQwgIpkuWrZvxidBDbYnTpbL7dxxL31koTza9MsIdDfjuoNxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744222222; c=relaxed/simple;
	bh=08lB9GyRHBGmZQCvI9HEFhzNGWlz+5lYaEIrjpHi2do=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DKWJya62dc6Whanx+wm9+ciuq0R1oG/m2k67CGR1s9BWgFhEVzSL9SK4+TEkAcgE/8WlPPQ9KxoV2ebRywY9koG4ZE0KBobrTRo3mt770LD6Kq2VlkKQU616hj+tbAvlElX2JvZ8o8mr/ke4bfxkrddzMBIiO1cB91NpoporSuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=mn5S+yt2; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="mn5S+yt2"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22548a28d0cso103145725ad.3
        for <linux-staging@lists.linux.dev>; Wed, 09 Apr 2025 11:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744222220; x=1744827020; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F5nuAWwtCCEE0RLHSK/NdiSGSSc8eLrbi7Ma/Uk/fz4=;
        b=mn5S+yt2uxCQG+VV7UYSoXRJRM+rAybzJ8FypxDBxohUYoaKyc7LfYa1D3wLasYxEw
         effGCCm/cOzTu0JnSMKvlP/pGARCmERVY2rw814pVc0lqSyAqCLIwFGVH3K8e1nRwrZs
         6bf8cUw3lvAFca5WR5HMeSpaB3F/av8zcgC2uG55nnjlXI0kifnAWSoY7UZrN5jebugA
         SEt+8gCpVc7DrpI0G0FvHsSiNJoWmqVbKnwPNQ5J4lgT/wtBfz90QoIESrho6ROzJuXS
         C5uTh9DjZ6xgfSGqOr9/5ofqkGSfmVbPewyxuFuXm2Qk1ZnzMnrDq9Tsy5Lt1SDAjV0O
         GQmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744222220; x=1744827020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F5nuAWwtCCEE0RLHSK/NdiSGSSc8eLrbi7Ma/Uk/fz4=;
        b=gz+Qcev/Jo2AjgIK8PI4scgeULZRZaQSDe5Sgn2wzY01JQDS7Vg3m1KcXAsIwX06Sr
         2e/5EWz5ttpZgelIC1DyVz5d7jPxfUpg91xGVePmOV2QNE8Leb/HTf16qQpJWQocKp1D
         +O/lKbqkSZ30e2DngiCJPvLW1/XugKhewTuyvLOlZniuFj8CIT/JMEK5eXM9Mh5wjhv9
         670jUW9drTeq/TVSZ3MTQFFAii2UnPsm3EnFDFPR8jLU6WKIqKvMC7HBdEou+9ukKaRH
         +fRPDrUBtGSB/hiOCb6IKlj/exXEVh2ff1Xbff2WMfT2c1WoHE+XWJeyppwdsnIW1QPX
         lR+w==
X-Gm-Message-State: AOJu0Yz4q9oyBUC0KAzKO6vtihGxDhYc1B6cs3jvHjq+Y/YXFSPYOst2
	yJhczXPpBphiBh5dr6cy/CklSLq+hel2BQd589fkZ5Ha1DGkIS4RjWoaKPCjRw==
X-Gm-Gg: ASbGncsHNJMieFsckNDoyH1xQTyzbI8HJNf0rJ24Jan4oBQ/aPTDzzqqjWxujF9s34A
	P79t0aIqF3bbb1J2EcQeKY2iB8RxsHLEbIod5wCcOmBKxnNYJTmCkpXYmynLaUWnfBP8ZHjZUbr
	Zrbc1YOxq2tLVCaw0KG91a7gosclLM8AXHFUssQY84Qzo1RHNtSsR7mp+d/PYj7+vsKBkwQ/Srg
	gqSEMpb65oYoH54ev6OXJdi/X58PxEzp7A6+1jQ01Jis0e82XtSi3zcONiNizIh6JKfdhROYCJk
	epHj30lhw76JQdD6VnXmV4zqyn+SWtrVEhQntmFGt2heUoyQBjHU4gN5qS0Jyn23klGAGCZOymP
	KVndYIVxuL2kPxEXm
X-Google-Smtp-Source: AGHT+IG+rTI28/aurOt2DO10jR1QoV8by/6UPDQbjTQ6we9GJ4kSeKA6D9OJYaE856pmc42gXqGihA==
X-Received: by 2002:a17:902:d487:b0:223:377f:9795 with SMTP id d9443c01a7336-22ac2856deamr60799025ad.0.1744222219786;
        Wed, 09 Apr 2025 11:10:19 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1e6b98csm1708532b3a.178.2025.04.09.11.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 11:10:19 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 20/23] staging: gpib: ni_usb: u8 over uint8_t
Date: Wed,  9 Apr 2025 18:09:50 +0000
Message-ID: <20250409180953.398686-21-matchstick@neverthere.org>
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
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
index 990926664a20..97815dca97f8 100644
--- a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
+++ b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
@@ -586,7 +586,7 @@ static int ni_usb_write_registers(struct ni_usb_priv *ni_priv,
 }
 
 // interface functions
-static int ni_usb_read(struct gpib_board *board, uint8_t *buffer, size_t length,
+static int ni_usb_read(struct gpib_board *board, u8 *buffer, size_t length,
 		       int *end, size_t *bytes_read)
 {
 	int retval, parse_retval;
@@ -716,7 +716,7 @@ static int ni_usb_read(struct gpib_board *board, uint8_t *buffer, size_t length,
 	return retval;
 }
 
-static int ni_usb_write(struct gpib_board *board, uint8_t *buffer, size_t length,
+static int ni_usb_write(struct gpib_board *board, u8 *buffer, size_t length,
 			int send_eoi, size_t *bytes_written)
 {
 	int retval;
@@ -819,7 +819,7 @@ static int ni_usb_write(struct gpib_board *board, uint8_t *buffer, size_t length
 	return retval;
 }
 
-static int ni_usb_command_chunk(struct gpib_board *board, uint8_t *buffer, size_t length,
+static int ni_usb_command_chunk(struct gpib_board *board, u8 *buffer, size_t length,
 				size_t *command_bytes_written)
 {
 	int retval;
@@ -912,7 +912,7 @@ static int ni_usb_command_chunk(struct gpib_board *board, uint8_t *buffer, size_
 	return 0;
 }
 
-static int ni_usb_command(struct gpib_board *board, uint8_t *buffer, size_t length,
+static int ni_usb_command(struct gpib_board *board, u8 *buffer, size_t length,
 			  size_t *bytes_written)
 {
 	size_t count;
@@ -1176,7 +1176,7 @@ static void ni_usb_remote_enable(struct gpib_board *board, int enable)
 	return;// 0;
 }
 
-static int ni_usb_enable_eos(struct gpib_board *board, uint8_t eos_byte, int compare_8_bits)
+static int ni_usb_enable_eos(struct gpib_board *board, u8 eos_byte, int compare_8_bits)
 {
 	struct ni_usb_priv *ni_priv = board->private_data;
 
@@ -1334,7 +1334,7 @@ static int ni_usb_secondary_address(struct gpib_board *board, unsigned int addre
 	return 0;
 }
 
-static int ni_usb_parallel_poll(struct gpib_board *board, uint8_t *result)
+static int ni_usb_parallel_poll(struct gpib_board *board, u8 *result)
 {
 	int retval;
 	struct ni_usb_priv *ni_priv = board->private_data;
@@ -1389,7 +1389,7 @@ static int ni_usb_parallel_poll(struct gpib_board *board, uint8_t *result)
 	return retval;
 }
 
-static void ni_usb_parallel_poll_configure(struct gpib_board *board, uint8_t config)
+static void ni_usb_parallel_poll_configure(struct gpib_board *board, u8 config)
 {
 	int retval;
 	struct ni_usb_priv *ni_priv = board->private_data;
@@ -1467,7 +1467,7 @@ static void ni_usb_serial_poll_response(struct gpib_board *board, u8 status)
 	return;// 0;
 }
 
-static uint8_t ni_usb_serial_poll_status(struct gpib_board *board)
+static u8 ni_usb_serial_poll_status(struct gpib_board *board)
 {
 	return 0;
 }
-- 
2.43.0

