Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C59419DF6A
	for <linux-staging@lists.linux.dev>; Thu, 17 Apr 2025 00:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744850744; cv=none; b=Cnjpd/IlWmdw14w792HJc/+grEfSYMTg0V0PXJn/8SqT5iYCukx8pjBgTnKMFijY6YijBmP9aTpGfWD3U3tC0ckEfp8IouEbOZsE+zOSYwMcpk/lOF/tWJ7L/tVm2rkfLlgi9h1t/i/fLq93lxgCnSGxYWA9Ne3ZPIs0URXik4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744850744; c=relaxed/simple;
	bh=QqdmVMBjXXestRT/55c3oFFTQMW4oNH6hU5VCPGmLuk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GxMGm12hRsdInMApgmv0fV8zNdid9ZKbHLvh33dbh4smM2n1bXIh6dIlGVVuUKgduvTZdCasw3kjn/6OUemcNuOsHS/gwztXOmvkC9fe3VCDffCIgXKPyLU008Xar5WAaMTCrpPSOGjOByeKqFyStgBK5cVFYOoNwvwxof9KWBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=N5L+LChy; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="N5L+LChy"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7fd581c2bf4so170596a12.3
        for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 17:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744850742; x=1745455542; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=egaRPgkryN6OirBXQ08+dhGZADpQp/3XvoNDYXE4JHk=;
        b=N5L+LChypBjv2QIYZHOx6g50QrywQcu7Haj+d9aRvTL99rJpxy5ZezAAK6zkhVSoPJ
         lNmEFkG2NDpaskusYsDwGoW5THk4p0/ESKadFQuzr7+Ft56rhsZUlhfjOMVWZsp1VPQV
         7tsf1JECca1W4FLRtcPBluscF/fydHLn9iwXFt6zYep7IQYuYzZctjYQiqJDTUekfudx
         ItOT5lGxvCdwU95OPXWZqvVXKXzFP8mw0aXq+x0hRMZAxRdOHQF3SeJHu7hBCRNTPC/z
         YSdGwuJHCw90u1AKHfGJBiLraNZCEI+u+oJr4jSxhFbGwGw8uEIf83l6Voy6Ry9NZuYT
         vJOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744850742; x=1745455542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=egaRPgkryN6OirBXQ08+dhGZADpQp/3XvoNDYXE4JHk=;
        b=oiJhqcVJH5vpS46A2sNvNPve+qBo7EW9dF6lsumEJz0zsfpqO1LU+HmkQ1umlrJweF
         dS8k+spv7+7eA3cr0ro12MP90nZaxhP96y13QnP69Ou3OpB2dIiUmToDIhT6aBB/so3i
         KSSNTEQFAdexMHoiwIsmQAbcBwgngb+QgFvcwQZ/j51BsaPhRCuH/tsSPcumZm+9oaub
         URl+vMMYYwxDjMvRGRlrsGEftuhEjOrT/hLu8iOST9fxIXbjvkfNY8S4L+KuncQrGGDu
         KAYsOETp7l3zGLlEVmsU7etiXBvTJSQFICfRK8aVm30pU7ZADWcsXxs0VenhkcL4UM+0
         eVzQ==
X-Gm-Message-State: AOJu0Yx8MZOP+DBxWktzbufOILLc+pC9+73KKT7/dYQPF/8MGYS9rso/
	HZthbFZrhnFIGUKZM9PIlcmpVod9ko6xxCWx2ina1DVBggSg6j8i/bQ4cbtUkQ==
X-Gm-Gg: ASbGnctPgXuvkq3z4QxhZUjxoS5BbSR0Op/Uiiw950qs0dqimzN0/5ScGX2OMvX4Ews
	YeCRws816DCpdhCTd9kFY1NNQYTaB8HMLff6jIhKWbCT93FfovGcZaMtVODFYBWGLhpNTFVYrK1
	SHzKqNO7uaBl4mwFTBfSsQC04uPm1UeRcXIjT/w3QLGb/SqDp0n9S1eCAiuDkGPjDIPAas6ifNs
	DCNQgf1uvXfUXM1eeJ09bxJg75a8Dr20Yl1Eg8HoSTzXLm15byYVgRF/7zBPcJMxmd8PWqZjulv
	//IUmWao7sn15H+VPR1gwDWcmE7wxavux80cctpmkcXIn5vDnk0TPzi0YzWG0PUfh8gYUseQYSC
	xVKOWow==
X-Google-Smtp-Source: AGHT+IGuVcnz7+jXBqgLq07oqsDUI4UA6qz+jFAUX9R+nmD0RiWXV8pcR7xhwsWukjR3XaIYG8fMJA==
X-Received: by 2002:a17:90b:3c0c:b0:2fe:7fea:ca34 with SMTP id 98e67ed59e1d1-308641725d2mr4923711a91.32.1744850742509;
        Wed, 16 Apr 2025 17:45:42 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-308611ef37asm2310367a91.11.2025.04.16.17.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 17:45:42 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2 04/14] staging: gpib: agilent_82357a: u8 over uint8_t
Date: Thu, 17 Apr 2025 00:45:23 +0000
Message-ID: <20250417004533.86765-5-matchstick@neverthere.org>
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
 .../gpib/agilent_82357a/agilent_82357a.c      | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
index 9e41fe611264..4728ec85caa8 100644
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
@@ -536,7 +536,7 @@ static int agilent_82357a_read(struct gpib_board *board, uint8_t *buffer, size_t
 }
 
 static ssize_t agilent_82357a_generic_write(struct gpib_board *board,
-					    uint8_t *buffer, size_t length,
+					    u8 *buffer, size_t length,
 					    int send_commands, int send_eoi,
 					    size_t *bytes_written)
 {
@@ -676,13 +676,13 @@ static ssize_t agilent_82357a_generic_write(struct gpib_board *board,
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
@@ -834,7 +834,7 @@ static void agilent_82357a_remote_enable(struct gpib_board *board, int enable)
 	return;// 0;
 }
 
-static int agilent_82357a_enable_eos(struct gpib_board *board, uint8_t eos_byte,
+static int agilent_82357a_enable_eos(struct gpib_board *board, u8 eos_byte,
 				     int compare_8_bits)
 {
 	struct agilent_82357a_priv *a_priv = board->private_data;
@@ -948,7 +948,7 @@ static int agilent_82357a_secondary_address(struct gpib_board *board,
 	return 0;
 }
 
-static int agilent_82357a_parallel_poll(struct gpib_board *board, uint8_t *result)
+static int agilent_82357a_parallel_poll(struct gpib_board *board, u8 *result)
 {
 	struct agilent_82357a_priv *a_priv = board->private_data;
 	struct usb_device *usb_dev;
@@ -990,7 +990,7 @@ static int agilent_82357a_parallel_poll(struct gpib_board *board, uint8_t *resul
 	return 0;
 }
 
-static void agilent_82357a_parallel_poll_configure(struct gpib_board *board, uint8_t config)
+static void agilent_82357a_parallel_poll_configure(struct gpib_board *board, u8 config)
 {
 	//board can only be system controller
 	return;// 0;
@@ -1002,13 +1002,13 @@ static void agilent_82357a_parallel_poll_response(struct gpib_board *board, int
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

