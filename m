Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576F91DDC10
	for <linux-staging@lists.linux.dev>; Thu, 17 Apr 2025 00:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744850752; cv=none; b=oJamQqsXZ3XdC/eHpUOn867LprAH7bK4QzpmNZ+vPv9ZEjYS0fcGYtzJRiWLGsRAaZiZxgUUyK2tMycQr6kMZoYeWDSPwvO0cmBU4EoxRqzW9hwRo6vwlZrpundE5CN0zAtha5ViXbBWMz2MmyQXD6XI+nArtHHZLGyI1ERVEUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744850752; c=relaxed/simple;
	bh=vqqMD2vMr3KfIaXswxJ7mru+gGuO0Ld1w+78Qj406Ug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B94IjBaNpFxgMj9MngCqi3fmXNEvNfMxFpJs47UWArf+wYxGjde5ZNQ9xwA1PoHr3Ad82R2q5/uau+VXbtaccOzXmO8vx7UoA3rLGhbOnzt+XwA4WgP/jHWq5v8EUDs4y79PqVhst7sSnFPLw1YZ/PSMcx4ZoXWVma8Uv6QWhWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=GFe0klmF; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="GFe0klmF"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-227d6b530d8so2732925ad.3
        for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 17:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744850750; x=1745455550; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9MpLJjSgDnPFGiVpHm3KvyZyL7VDXcVSfSDoSsrVCXw=;
        b=GFe0klmF4GWrVMz5Jw+lbgfYNfJu8tsAUK9ekuVPqDJ7ifBF+GLvIupoOGewOLWhn9
         wU3W9zS200eEwJhuQu+T99NWGtV3Ulo1jG5jHHq4+LCBvqMTKtP4rAi/DxO92Xz2eEM7
         yI/a5kak8PONOh9L18bmRvYxEDOCoPBbvaN0Vi5SaWHW9I60yBl2e9yIrd2Te4BLbNMM
         LefRsK2OE613b8q+aWZqZrHju1bZRBGF4xgLF8oxHczo0KswhObQ1aU5xMeD4pUnwJJQ
         aJD3XO+ENnSIwMFxKNWkxAKDDOo5LSJe4ki0W/f/tik58jo2bE2KXpPj3cwVoERVS9Sr
         HyAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744850750; x=1745455550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9MpLJjSgDnPFGiVpHm3KvyZyL7VDXcVSfSDoSsrVCXw=;
        b=l/qSS53QlSqjvpgez9y6Bbfk3qflTIAswcl8DOnYw1NYWrJl0EFoD6zfkgwd71dcaC
         ppUbFOeUmrL4Mn7K6Zj2PqZoJoC7nppcJW0kMDg9znB+Umhl7a5tHnpDle2tMBBwSIC0
         dLkXBnj0/o7NcomcoQlYcohTXFcfIrsN+4okuPRxdwMiKSTlRplvqPyh18T+QtSSublz
         oTLmdCLg4d98mx84I8vGM4E4Of1lAvaevwhi4MHrmG6cLUjdieThp86ki/SY9+b/xhB6
         6xaNg5WXrLB1TyEfqsOQeZaproAotfru0GNYbQEYqwOln6B0f0PoKXHHFeKTQ1q1FfAh
         Lrhw==
X-Gm-Message-State: AOJu0YwU++CIBp7PH9NrkhdevUwoE6QYjDfP7NcGrf1242kGdF6lpbbG
	Do9JEjgEG1wo5BGY+N0mXU3YnWcOYQ+ctNMwekESRk9bnl0KcnhQoefvRDEp9w==
X-Gm-Gg: ASbGncv/x54oVE8Jk9M2MtiR+9pZZlVpOC3+hs0U3Qd5NNugnHOkM1BkNOv0hhGFKEV
	Fpt8dclAJySMXiDgGL6KizE4xz6ArXaMg9TywfQvcRlmYwg/7NjdCbpHGE6bNtkrr66QhvBa0S2
	OE++MGCMxkcKguFW83oTo2Bp4ItqmJEwVwpKAbmVIH4ADdZdpohzpEG8aYY/uR8wpvGE/HILKfS
	CAlg6Wgu7NpVoVxmKcXah50hABBdjRUFlJV+yomiTrTrZtOS5dHju444Far5PmvXLL3E1PTLcGh
	X4S7deij+dxq1CsKpJ81s/qgho4Y8ptvmnABewtlvKp0wqFxZ/tgYb575tSRZJEnTh0FLBUMimG
	MyMqV8x14ox5l5Lb2
X-Google-Smtp-Source: AGHT+IFKuJl/aeUSGhla9FOWsU2V8+3HJ8VUb4CYfV/wKpEd6/jg8WfSCM6hMpkMfJIdXmgjLpnGmA==
X-Received: by 2002:a17:902:c944:b0:220:e9ac:e746 with SMTP id d9443c01a7336-22c359a43dcmr64796545ad.53.1744850750593;
        Wed, 16 Apr 2025 17:45:50 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73c2b2122c5sm1565886b3a.76.2025.04.16.17.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 17:45:50 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2 11/14] staging: gpib: pc2: u8 over uint8_t
Date: Thu, 17 Apr 2025 00:45:30 +0000
Message-ID: <20250417004533.86765-12-matchstick@neverthere.org>
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
 drivers/staging/gpib/pc2/pc2_gpib.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/gpib/pc2/pc2_gpib.c b/drivers/staging/gpib/pc2/pc2_gpib.c
index ae265e2eb46a..fd191d24d7a6 100644
--- a/drivers/staging/gpib/pc2/pc2_gpib.c
+++ b/drivers/staging/gpib/pc2/pc2_gpib.c
@@ -90,7 +90,7 @@ irqreturn_t pc2a_interrupt(int irq, void *arg)
 }
 
 // wrappers for interface functions
-static int pc2_read(struct gpib_board *board, uint8_t *buffer, size_t length, int *end,
+static int pc2_read(struct gpib_board *board, u8 *buffer, size_t length, int *end,
 		    size_t *bytes_read)
 {
 	struct pc2_priv *priv = board->private_data;
@@ -98,7 +98,7 @@ static int pc2_read(struct gpib_board *board, uint8_t *buffer, size_t length, in
 	return nec7210_read(board, &priv->nec7210_priv, buffer, length, end, bytes_read);
 }
 
-static int pc2_write(struct gpib_board *board, uint8_t *buffer, size_t length, int send_eoi,
+static int pc2_write(struct gpib_board *board, u8 *buffer, size_t length, int send_eoi,
 		     size_t *bytes_written)
 {
 	struct pc2_priv *priv = board->private_data;
@@ -106,7 +106,7 @@ static int pc2_write(struct gpib_board *board, uint8_t *buffer, size_t length, i
 	return nec7210_write(board, &priv->nec7210_priv, buffer, length, send_eoi, bytes_written);
 }
 
-static int pc2_command(struct gpib_board *board, uint8_t *buffer,
+static int pc2_command(struct gpib_board *board, u8 *buffer,
 		       size_t length, size_t *bytes_written)
 {
 	struct pc2_priv *priv = board->private_data;
@@ -149,7 +149,7 @@ static void pc2_remote_enable(struct gpib_board *board, int enable)
 	nec7210_remote_enable(board, &priv->nec7210_priv, enable);
 }
 
-static int pc2_enable_eos(struct gpib_board *board, uint8_t eos_byte, int compare_8_bits)
+static int pc2_enable_eos(struct gpib_board *board, u8 eos_byte, int compare_8_bits)
 {
 	struct pc2_priv *priv = board->private_data;
 
@@ -184,14 +184,14 @@ static int pc2_secondary_address(struct gpib_board *board, unsigned int address,
 	return nec7210_secondary_address(board, &priv->nec7210_priv, address, enable);
 }
 
-static int pc2_parallel_poll(struct gpib_board *board, uint8_t *result)
+static int pc2_parallel_poll(struct gpib_board *board, u8 *result)
 {
 	struct pc2_priv *priv = board->private_data;
 
 	return nec7210_parallel_poll(board, &priv->nec7210_priv, result);
 }
 
-static void pc2_parallel_poll_configure(struct gpib_board *board, uint8_t config)
+static void pc2_parallel_poll_configure(struct gpib_board *board, u8 config)
 {
 	struct pc2_priv *priv = board->private_data;
 
@@ -205,14 +205,14 @@ static void pc2_parallel_poll_response(struct gpib_board *board, int ist)
 	nec7210_parallel_poll_response(board, &priv->nec7210_priv, ist);
 }
 
-static void pc2_serial_poll_response(struct gpib_board *board, uint8_t status)
+static void pc2_serial_poll_response(struct gpib_board *board, u8 status)
 {
 	struct pc2_priv *priv = board->private_data;
 
 	nec7210_serial_poll_response(board, &priv->nec7210_priv, status);
 }
 
-static uint8_t pc2_serial_poll_status(struct gpib_board *board)
+static u8 pc2_serial_poll_status(struct gpib_board *board)
 {
 	struct pc2_priv *priv = board->private_data;
 
-- 
2.43.0

