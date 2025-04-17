Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2B51B87D7
	for <linux-staging@lists.linux.dev>; Thu, 17 Apr 2025 00:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744850748; cv=none; b=mJD8ysNGeVzE5rb1CGqxtnVpDRk54kucEuuQWtmbHLejAuwBHIS9XWcZw7j5i46yIkcL/VF7INJHjiNnB3bInsTOb8fKrbsSzC3ENbaJZDHFnt98WQTKJXg5lCZy5mHR5KtSWVg0bpurdQ3DC04sNFHLTxKb45I0/uq4XaZ7uIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744850748; c=relaxed/simple;
	bh=BfpNSRi1Uu/jpmaQIwRuJR7O8bLRmM8l//Nz8oq/Em0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tEEU7Uo3oCEu9j9fgGBYtm/TT3dNOWKXTIbGKxgQHc8vj3XJF1M/LjDr9gWL/yzaSKfuHwc2xb5QCKhlumvhD93jfLA3u+jEjlocEcnLBLxpr6SsHbQxva0urigzhmBObADoYf8ZPT37trEjCgXdLOPb1UoCt2iR9sys8xnhzDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=lFZTEG/N; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="lFZTEG/N"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-736b350a22cso150647b3a.1
        for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 17:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744850746; x=1745455546; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IAKFbJ92CSJHJrxPyaZfvAqvrH9/BDlLmlfyn2taFCM=;
        b=lFZTEG/NsagGUbBnfzvEihw2exQTOIIse5hXviMTa4AUzkANuPrQMATtFBaNjwQq42
         NAdK/ORfLTazGtdEdTPZ/eThXHbVkHRMQLYlbIcjpeeLd73MJXin5O0dQOocwdBflNWJ
         Nt9+deG0rwPWbuKsiVqh2/LPznwGy4y5I2lsKiQ3V8PI4Rf7Ae4Hk3/6AXwVrLp8Sr1m
         eQ5JBewNmJBtmD7UVyKebzE0FKBoQkjqg1btn1egVqMQtEU2dZpL4obLWD19iaYw1F4W
         6LRYu085vdedgXZT/MyYtKJz7TOafAZlldgdcKGHvRE6Pkt/LinkScz3Hyz0bveHiwvm
         PHDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744850746; x=1745455546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IAKFbJ92CSJHJrxPyaZfvAqvrH9/BDlLmlfyn2taFCM=;
        b=U3mjUnHPxblegTJ1dbW7AOH/zqZ4HEYSJOeByEnVFC+VhXCVDpjlXzXohyG7fisESH
         NOhiGWuHHFQq8JYukIYUI0r+ERUBfeNVqQI8S66MdYXXeMn8/t+wbWSl5fxW7vb8NG7A
         p8zHLVde+qAtP9XCfIg7GP4McFGu9v7swDb1QSlkv734oLuw3d5ryh6L5sVkKXzhgCOM
         h4TvY4y/M6zlNKVXFpTks0/3vy2SSboucNsVAUWMIOKU2I6h2RhPtRJM7qT+TicvZRSP
         uQG6dJWupxj2ko5rDt+bMVxih2n5IpvkObC2J0L/Vo/gNBSAbqiiV/4hsLda97OiKgeC
         w13Q==
X-Gm-Message-State: AOJu0Yz2dGzmmyr8JB9i0MrzuMXxGt2S0kPZo57zqb5IvV2eKTRk7WdH
	3DqsZwka5SX+a3G/5RKXX/h3fYe/VBbnt1HBhQedbOOoXXTqNVBk4lUPEcKRNw==
X-Gm-Gg: ASbGncsPD7RJ9/PpaA8T+Xl0hGTETr/rdxfLkZHdFxt0GsKih1sJofpUnffSK+p1J/5
	T/fuSHcWa9oB2iFtLO+TU3Glae1Z3q4NMQmHHXbvT+vR2NiF8SUjklqsOhF5M6iZOV4KvIhVOLL
	KbgW2Y7wKe/T+qRiXPUZ9Qq37nb4GIzUPlCDlGdj8ZO0oMBQwu7pmu55ZDsyVBZ+C8GvQxniKwP
	E1JeU0GKUcBxTE84d/nFUs3tPCZ6cMwfuvSDBuNLqaywuhlAOqM7MunXuvB8LulyXVULbM6y5Rv
	CW2jSlQ7AOkYf6GWAPv8ZEaVp8y+lHMSKNiLc8z1VZJABVHoIySjiC7GD93l9Br4cRtKPknKkBR
	mrcBf1Q==
X-Google-Smtp-Source: AGHT+IFidBuGN0n+VIOG8CSLHLwCIO25lpQNbrmEyMabU9NWT6sPaBFaUtvwxsYr97qTiXyu8zpE5w==
X-Received: by 2002:aa7:9313:0:b0:736:a6e0:e66d with SMTP id d2e1a72fcca58-73c266e1782mr5325800b3a.6.1744850745872;
        Wed, 16 Apr 2025 17:45:45 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd2198b53sm11094153b3a.21.2025.04.16.17.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 17:45:45 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2 07/14] staging: gpib: gpib_bitbang: u8 over uint8_t
Date: Thu, 17 Apr 2025 00:45:26 +0000
Message-ID: <20250417004533.86765-8-matchstick@neverthere.org>
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
 drivers/staging/gpib/gpio/gpib_bitbang.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/gpib/gpio/gpib_bitbang.c b/drivers/staging/gpib/gpio/gpib_bitbang.c
index 443d739c7edf..0da718389182 100644
--- a/drivers/staging/gpib/gpio/gpib_bitbang.c
+++ b/drivers/staging/gpib/gpio/gpib_bitbang.c
@@ -325,7 +325,7 @@ static void set_data_lines(u8 byte);
 static u8 get_data_lines(void);
 static void set_data_lines_input(void);
 static void set_data_lines_output(void);
-static inline int check_for_eos(struct bb_priv *priv, uint8_t byte);
+static inline int check_for_eos(struct bb_priv *priv, u8 byte);
 static void set_atn(struct gpib_board *board, int atn_asserted);
 
 static inline void SET_DIR_WRITE(struct bb_priv *priv);
@@ -354,7 +354,7 @@ static char printable(char x)
  *									   *
  ***************************************************************************/
 
-static int bb_read(struct gpib_board *board, uint8_t *buffer, size_t length,
+static int bb_read(struct gpib_board *board, u8 *buffer, size_t length,
 		   int *end, size_t *bytes_read)
 {
 	struct bb_priv *priv = board->private_data;
@@ -492,7 +492,7 @@ static irqreturn_t bb_DAV_interrupt(int irq, void *arg)
  *									   *
  ***************************************************************************/
 
-static int bb_write(struct gpib_board *board, uint8_t *buffer, size_t length,
+static int bb_write(struct gpib_board *board, u8 *buffer, size_t length,
 		    int send_eoi, size_t *bytes_written)
 {
 	unsigned long flags;
@@ -729,7 +729,7 @@ static irqreturn_t bb_SRQ_interrupt(int irq, void *arg)
 	return IRQ_HANDLED;
 }
 
-static int bb_command(struct gpib_board *board, uint8_t *buffer,
+static int bb_command(struct gpib_board *board, u8 *buffer,
 		      size_t length, size_t *bytes_written)
 {
 	size_t ret;
@@ -921,7 +921,7 @@ static void bb_remote_enable(struct gpib_board *board, int enable)
 	}
 }
 
-static int bb_enable_eos(struct gpib_board *board, uint8_t eos_byte, int compare_8_bits)
+static int bb_enable_eos(struct gpib_board *board, u8 eos_byte, int compare_8_bits)
 {
 	struct bb_priv *priv = board->private_data;
 
@@ -988,12 +988,12 @@ static int bb_secondary_address(struct gpib_board *board, unsigned int address,
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
 
@@ -1001,11 +1001,11 @@ static void bb_parallel_poll_response(struct gpib_board *board, int ist)
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
@@ -1366,7 +1366,7 @@ inline long usec_diff(struct timespec64 *a, struct timespec64 *b)
 		(a->tv_nsec - b->tv_nsec) / 1000);
 }
 
-static inline int check_for_eos(struct bb_priv *priv, uint8_t byte)
+static inline int check_for_eos(struct bb_priv *priv, u8 byte)
 {
 	if (priv->eos_check)
 		return 0;
-- 
2.43.0

