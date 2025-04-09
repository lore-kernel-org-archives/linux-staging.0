Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6846277037
	for <linux-staging@lists.linux.dev>; Wed,  9 Apr 2025 18:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744222202; cv=none; b=Dgy4/RBtwA6Jzv2J/GeqxmLT5iAmRXxJetdu2D+EmH8EzGai4ksx/47itl+EIt59gj/0+UEypxUU4Lb6IsjCz+4XUCYWVTBmlcERyXxAUUGRaA/s1CcXuUBpb5rj4HCs2WKrWvFNo7ENtlZcOoByD6GqZ6gxhji6knqzHJouG+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744222202; c=relaxed/simple;
	bh=GdE6W80rlu8ua8UaYII1OhLDqcac3EXFdx/vFJn37P4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rLR6RTR9sshmni8ksPzwfMSJlACi0nN9eKm0+mrxANGjZI6QUsPDWW9OPEoX43O7X+/EwTb9deEV/7WlrUlL8xTwUOpF4+adhRL5bUXzuBTZwkhwyioUW2T9eoeo/5lxDCks++uF744JtIm5LvUgHrTzBn4xmaHu1EwkikHQSts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=LhwzfyPH; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="LhwzfyPH"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2254e0b4b79so91721145ad.2
        for <linux-staging@lists.linux.dev>; Wed, 09 Apr 2025 11:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744222199; x=1744826999; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pDVB50iRfeTTYvKU1KyH7TEIfsC9GnwNTuPYKh5rtk0=;
        b=LhwzfyPHm72URoZ3LIV0tTCOR4RpwpMJ9IpwHsiroS7WYvA3WdvVG1UC0TQgsozRL3
         UDuLVDU1ZuE/jQIBKzJWxIIHWtKBk30cD/uPbZjdI4esvwXi5piUvSaJAU3P5rA+OMm8
         snEAzD0kBzpwMsbKIcO3k6HJrNq3zySCGKsOUPqR77qnTY0HwYwkoFwGUMi3w1hLAm5B
         02AETouS2lfxsCesEnn4j4WTCxbh9Qc7BBJ9TdRt+7jAEmMW2WMiMX6LmnImxipbbiy9
         5AUXSHQSuLF/xEB138zHiKIpBIbXqZlHaYSqmI0eyVWxRaQLVXaCcOjnaDLyjCarskt2
         bP+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744222199; x=1744826999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pDVB50iRfeTTYvKU1KyH7TEIfsC9GnwNTuPYKh5rtk0=;
        b=tLRdrSO38NH4CyIuqdLwSMGdqjQ2hIQctUkWA3pbybz2bPXonKOdqcLH6lXirFdj9C
         fwZGypnlldSHsB67fNK3KIB4qaW8H7RebIb2SqHSDuKz1+qtnEw8OF+XDSHa6ufU3qSd
         VMGpvWaUr/PwiXDQ436HBh6VXhPMC2ye5bPpOfk+LMX4EoNkyHajs4RCSs/1SrxfgFOy
         rVUPEg/HLLcw9lj3cz151fLdN+c8rwoDiS+lJrs4kY4dVuGgB3khbHBsrk8OOv/8ukV8
         K95y0AOT195riQbZ3V1Ebvql2kyvjqtJjVdXa7sxAdH3/mvJFirYreeXlnZwEz2J4diP
         2rIA==
X-Gm-Message-State: AOJu0Yz+fy8D2F/xYgN9zSfpwgU5bp/QPpvY0fFCI+j0ZkQwsF0XwY/Z
	eB7X3hob0qsdGsgwFCTOr8ZvakkaRQR0Ktgtj0vSApl4MNB2st9jmjTxYjysOA==
X-Gm-Gg: ASbGncu4q92IrpxMlYOgsFsnLAIRXAHNNOMzqwjC4ObibvC5CHQb1bcYPBS2TwwpbPs
	0UEXjYsP9MoX75rs6HA+o3Un8j/12sYwCqWLbTdUFXesDKPLQCCdIbMs+Rsv2RzHvga1gphVnU9
	/hcrMY2yI/wz0yW8NNIWGY7+r56kwj2lXITfAcZsXl4e7f+9c832AuMhQyzPgHCODHkM06PYi4H
	Zw6VA/qs65Llj5hEguaEUinxq1PBs5uPQjBlFrL60+ZL00yqsREx7oo3UOmfteceAsinwN+lBnn
	1maCoPHhtM6CXCeIG85y5xNTGLsPwnbm1Vxx107zyCQ19B84eYYsCQ++h6Z/bfjmuznpeLcZLfT
	VPDge/oWBRqO5pz8i
X-Google-Smtp-Source: AGHT+IHcsUWVZB6e2o76BW6K94RqekrDrDHodcxAypBj07xCzdSWG1XfD23cL7OAg96WQcgXxs2pHw==
X-Received: by 2002:a17:902:d4cf:b0:224:a96:e39 with SMTP id d9443c01a7336-22ac295d279mr44855175ad.9.1744222199245;
        Wed, 09 Apr 2025 11:09:59 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c95ce8sm15109465ad.107.2025.04.09.11.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 11:09:59 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 03/23] staging: gpib: fluke_gpib: u8 over uint8_t
Date: Wed,  9 Apr 2025 18:09:33 +0000
Message-ID: <20250409180953.398686-4-matchstick@neverthere.org>
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
 drivers/staging/gpib/eastwood/fluke_gpib.c | 28 +++++++++++-----------
 drivers/staging/gpib/eastwood/fluke_gpib.h | 12 +++++-----
 2 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/gpib/eastwood/fluke_gpib.c b/drivers/staging/gpib/eastwood/fluke_gpib.c
index e1f8598e4e04..dcd4fbddd66b 100644
--- a/drivers/staging/gpib/eastwood/fluke_gpib.c
+++ b/drivers/staging/gpib/eastwood/fluke_gpib.c
@@ -34,7 +34,7 @@ static irqreturn_t fluke_gpib_internal_interrupt(struct gpib_board *board);
 
 static struct platform_device *fluke_gpib_pdev;
 
-static uint8_t fluke_locking_read_byte(struct nec7210_priv *nec_priv, unsigned int register_number)
+static u8 fluke_locking_read_byte(struct nec7210_priv *nec_priv, unsigned int register_number)
 {
 	u8 retval;
 	unsigned long flags;
@@ -45,7 +45,7 @@ static uint8_t fluke_locking_read_byte(struct nec7210_priv *nec_priv, unsigned i
 	return retval;
 }
 
-static void fluke_locking_write_byte(struct nec7210_priv *nec_priv, uint8_t byte,
+static void fluke_locking_write_byte(struct nec7210_priv *nec_priv, u8 byte,
 				     unsigned int register_number)
 {
 	unsigned long flags;
@@ -56,7 +56,7 @@ static void fluke_locking_write_byte(struct nec7210_priv *nec_priv, uint8_t byte
 }
 
 // wrappers for interface functions
-static int fluke_read(struct gpib_board *board, uint8_t *buffer, size_t length, int *end,
+static int fluke_read(struct gpib_board *board, u8 *buffer, size_t length, int *end,
 		      size_t *bytes_read)
 {
 	struct fluke_priv *priv = board->private_data;
@@ -64,7 +64,7 @@ static int fluke_read(struct gpib_board *board, uint8_t *buffer, size_t length,
 	return nec7210_read(board, &priv->nec7210_priv, buffer, length, end, bytes_read);
 }
 
-static int fluke_write(struct gpib_board *board, uint8_t *buffer, size_t length,
+static int fluke_write(struct gpib_board *board, u8 *buffer, size_t length,
 		       int send_eoi, size_t *bytes_written)
 {
 	struct fluke_priv *priv = board->private_data;
@@ -72,7 +72,7 @@ static int fluke_write(struct gpib_board *board, uint8_t *buffer, size_t length,
 	return nec7210_write(board, &priv->nec7210_priv, buffer, length, send_eoi, bytes_written);
 }
 
-static int fluke_command(struct gpib_board *board, uint8_t *buffer,
+static int fluke_command(struct gpib_board *board, u8 *buffer,
 			 size_t length, size_t *bytes_written)
 {
 	struct fluke_priv *priv = board->private_data;
@@ -116,7 +116,7 @@ static void fluke_remote_enable(struct gpib_board *board, int enable)
 	nec7210_remote_enable(board, &priv->nec7210_priv, enable);
 }
 
-static int fluke_enable_eos(struct gpib_board *board, uint8_t eos_byte, int compare_8_bits)
+static int fluke_enable_eos(struct gpib_board *board, u8 eos_byte, int compare_8_bits)
 {
 	struct fluke_priv *priv = board->private_data;
 
@@ -151,14 +151,14 @@ static int fluke_secondary_address(struct gpib_board *board, unsigned int addres
 	return nec7210_secondary_address(board, &priv->nec7210_priv, address, enable);
 }
 
-static int fluke_parallel_poll(struct gpib_board *board, uint8_t *result)
+static int fluke_parallel_poll(struct gpib_board *board, u8 *result)
 {
 	struct fluke_priv *priv = board->private_data;
 
 	return nec7210_parallel_poll(board, &priv->nec7210_priv, result);
 }
 
-static void fluke_parallel_poll_configure(struct gpib_board *board, uint8_t configuration)
+static void fluke_parallel_poll_configure(struct gpib_board *board, u8 configuration)
 {
 	struct fluke_priv *priv = board->private_data;
 
@@ -172,14 +172,14 @@ static void fluke_parallel_poll_response(struct gpib_board *board, int ist)
 	nec7210_parallel_poll_response(board, &priv->nec7210_priv, ist);
 }
 
-static void fluke_serial_poll_response(struct gpib_board *board, uint8_t status)
+static void fluke_serial_poll_response(struct gpib_board *board, u8 status)
 {
 	struct fluke_priv *priv = board->private_data;
 
 	nec7210_serial_poll_response(board, &priv->nec7210_priv, status);
 }
 
-static uint8_t fluke_serial_poll_status(struct gpib_board *board)
+static u8 fluke_serial_poll_status(struct gpib_board *board)
 {
 	struct fluke_priv *priv = board->private_data;
 
@@ -373,7 +373,7 @@ static void fluke_dma_callback(void *arg)
 	spin_unlock_irqrestore(&board->spinlock, flags);
 }
 
-static int fluke_dma_write(struct gpib_board *board, uint8_t *buffer, size_t length,
+static int fluke_dma_write(struct gpib_board *board, u8 *buffer, size_t length,
 			   size_t *bytes_written)
 {
 	struct fluke_priv *e_priv = board->private_data;
@@ -458,7 +458,7 @@ static int fluke_dma_write(struct gpib_board *board, uint8_t *buffer, size_t len
 	return retval;
 }
 
-static int fluke_accel_write(struct gpib_board *board, uint8_t *buffer, size_t length,
+static int fluke_accel_write(struct gpib_board *board, u8 *buffer, size_t length,
 			     int send_eoi, size_t *bytes_written)
 {
 	struct fluke_priv *e_priv = board->private_data;
@@ -546,7 +546,7 @@ static int fluke_get_dma_residue(struct dma_chan *chan, dma_cookie_t cookie)
 	return state.residue;
 }
 
-static int fluke_dma_read(struct gpib_board *board, uint8_t *buffer,
+static int fluke_dma_read(struct gpib_board *board, u8 *buffer,
 			  size_t length, int *end, size_t *bytes_read)
 {
 	struct fluke_priv *e_priv = board->private_data;
@@ -659,7 +659,7 @@ static int fluke_dma_read(struct gpib_board *board, uint8_t *buffer,
 	return retval;
 }
 
-static int fluke_accel_read(struct gpib_board *board, uint8_t *buffer, size_t length,
+static int fluke_accel_read(struct gpib_board *board, u8 *buffer, size_t length,
 			    int *end, size_t *bytes_read)
 {
 	struct fluke_priv *e_priv = board->private_data;
diff --git a/drivers/staging/gpib/eastwood/fluke_gpib.h b/drivers/staging/gpib/eastwood/fluke_gpib.h
index 3e4348196b42..c721636c6eca 100644
--- a/drivers/staging/gpib/eastwood/fluke_gpib.h
+++ b/drivers/staging/gpib/eastwood/fluke_gpib.h
@@ -67,8 +67,8 @@ static inline int cb7210_page_in_bits(unsigned int page)
 }
 
 // don't use without locking nec_priv->register_page_lock
-static inline uint8_t fluke_read_byte_nolock(struct nec7210_priv *nec_priv,
-					     int register_num)
+static inline u8 fluke_read_byte_nolock(struct nec7210_priv *nec_priv,
+					int register_num)
 {
 	u8 retval;
 
@@ -77,14 +77,14 @@ static inline uint8_t fluke_read_byte_nolock(struct nec7210_priv *nec_priv,
 }
 
 // don't use without locking nec_priv->register_page_lock
-static inline void fluke_write_byte_nolock(struct nec7210_priv *nec_priv, uint8_t data,
+static inline void fluke_write_byte_nolock(struct nec7210_priv *nec_priv, u8 data,
 					   int register_num)
 {
 	writel(data, nec_priv->mmiobase + register_num * nec_priv->offset);
 }
 
-static inline uint8_t fluke_paged_read_byte(struct fluke_priv *e_priv,
-					    unsigned int register_num, unsigned int page)
+static inline u8 fluke_paged_read_byte(struct fluke_priv *e_priv,
+				       unsigned int register_num, unsigned int page)
 {
 	struct nec7210_priv *nec_priv = &e_priv->nec7210_priv;
 	u8 retval;
@@ -99,7 +99,7 @@ static inline uint8_t fluke_paged_read_byte(struct fluke_priv *e_priv,
 	return retval;
 }
 
-static inline void fluke_paged_write_byte(struct fluke_priv *e_priv, uint8_t data,
+static inline void fluke_paged_write_byte(struct fluke_priv *e_priv, u8 data,
 					  unsigned int register_num, unsigned int page)
 {
 	struct nec7210_priv *nec_priv = &e_priv->nec7210_priv;
-- 
2.43.0

