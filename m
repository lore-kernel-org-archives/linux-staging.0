Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297BC21D3E4
	for <linux-staging@lists.linux.dev>; Wed, 19 Mar 2025 21:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742421592; cv=none; b=OWcolp3EGqFy/0SYrSeFRVjhmub5m0oxV6MTiwbQh7VIJwB/vHaVsDIm0USPYFr8AxYgjqIrQhYvtbI5acZtmcTalV9ZaLNCaJl1PsXTuO2Evc1B/FK2PhTZpj0/HHEzll0bNwJ1TNPfbjwT5UenI4S3oFW3tIWGBsRCB+7uhoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742421592; c=relaxed/simple;
	bh=Fw4a9mlnKOTNcdiM0fswp36qHY5x+EfCvi/48WgyqWY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RhIytUu0k1nlyewb+OR7YUIHrr+FB60lkM5N9r3z1Leg/gu8hliIHmpAwUfNYLr8JbXTJQAdtf0LDAvsNa17J+3ZJf3usPu+ergzbM15GQM8c9b7IqE7HOIBzan/j4giiJ5CwqnbnRnF1iThrdovwJaLNoneCeTcaf79N5MD9wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=jZhAVdue; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="jZhAVdue"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2264aefc45dso1718695ad.0
        for <linux-staging@lists.linux.dev>; Wed, 19 Mar 2025 14:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1742421589; x=1743026389; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uy7IplSbVwpQnJVRuVqNjgdWMp+XadaNyfeEyd6Aua4=;
        b=jZhAVdueZ/hoOBLEi+eMEeJGkYMawzuM1ZKiSGvBzHZpG2EoLo2jKI3B4mMWg7cexG
         Bjv36zzzp7k2AomIFBDFnw7N20oCSY6jh6R4BM48TP0Aq2dW25S+UnybFJ6FoyZGz4mw
         OLYW5VOpHosY9MD8QvFvCJa/F+iSFyaI512NwHxVkPMls1zZmm8YTtaZ6ihhUtaWvPfH
         qAfnYvIPIFhW40B4xOIx4tgX0lCoRdl3ADTG75WRQlz53HwHOoY/17HRMFO1Zwfw+V9+
         FbEoZCVA17DuwfKLCAdOHAx6WErbicfNyAqalv8ztABQ5SIgYxuhYqZ17Bqoogi6y3AY
         v+RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742421589; x=1743026389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uy7IplSbVwpQnJVRuVqNjgdWMp+XadaNyfeEyd6Aua4=;
        b=m5Hv0B2bcOIqYPCihCFmEsFcTVkiCWh6/Gq/skIXNUlJFbQgOEiRFlc53qKs8OF9Pl
         GuZuEKZI1wZ2Fm+aGXihaFiO21SaXegn4YZKW+MdzM/NHNc8CbT/ZBGxK2+5fB1wn86m
         ndChfbnGyRPxeM+fIU2KB3BHGMklNxtTfIpIUwBIVyvVc6okPRRdzP0cxzi7xNL5+Z8A
         svT0Rzj0bPvwEpH/K45V9p+s99a01M9ITdq0naca4aWm34h0tX1t1rNZqvn6mdlla//m
         srBPllP0auel8VeGxoitAebbZ/VMORiNwc/M+H0FCMWAvhXSO5UaUhsWxRKDplDCNuNx
         uK0w==
X-Gm-Message-State: AOJu0YxDUXoTs3IrziXRSRFoooZuMOg+KWjvkTFf0KIDKtp9fkPV2dQS
	3mr2vwecxA86/tq0c2lhETJVq4sZ74KOSX8F2sfmUCe+wIfZ+XwPtSQW892zDA==
X-Gm-Gg: ASbGncvFNZjedSSYwXcedfAoN4esz4vSoIin8hpCjl++e3yxMueD447K+ZujmG3JA1k
	SOhJPw+WnTR7AOFmF8Of/8az3efG++2SLJhAWDlsnbFjrDQIIdhOQvLBVlVczt20939gP4NUKj3
	8wuAsAUmywWfLPonnGtfaLz4+FNFCJMzPlA4AG06F6dS+TPkghPMw4xYkLY2f7Mps2bZz2n9+wh
	OquEfpXPnHkXnnNV0oBeK0eBP8OPnVKkTYtW+PUxonJHYuSukOiKKtpjCONq5j10StCBJ3FQ2YB
	91ETx3qA00SEVkKT6gMdTE0+OClkf2N1REZZS7DlyiX30LsCJu68B8ND1Evj3g/9EH3UboJoJGb
	eab6Vk8HmHA==
X-Google-Smtp-Source: AGHT+IGlGp+Tgp4LzxeXuHM5RYUmkEn3xQFe8FyDBR/GUioIdO+tPqN9bQ5tM2rVodSFNkYenoFTDA==
X-Received: by 2002:a05:6a20:914b:b0:1f5:8eb1:d5d2 with SMTP id adf61e73a8af0-1fd117fd115mr1298491637.13.1742421589459;
        Wed, 19 Mar 2025 14:59:49 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56ea93c84sm11463587a12.64.2025.03.19.14.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 14:59:49 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 10/20] staging: gpib: hp2335: struct gpib_board
Date: Wed, 19 Mar 2025 21:59:14 +0000
Message-ID: <20250319215924.19387-11-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250319215924.19387-1-matchstick@neverthere.org>
References: <20250319215924.19387-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_board.

Adhering to Linux code style.

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/hp_82335/hp82335.c | 56 ++++++++++++-------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/drivers/staging/gpib/hp_82335/hp82335.c b/drivers/staging/gpib/hp_82335/hp82335.c
index 982544d1b382..368e60c6ecd2 100644
--- a/drivers/staging/gpib/hp_82335/hp82335.c
+++ b/drivers/staging/gpib/hp_82335/hp82335.c
@@ -24,12 +24,12 @@
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("GPIB driver for HP 82335 interface cards");
 
-static int hp82335_attach(gpib_board_t *board, const gpib_board_config_t *config);
-static void hp82335_detach(gpib_board_t *board);
+static int hp82335_attach(struct gpib_board *board, const gpib_board_config_t *config);
+static void hp82335_detach(struct gpib_board *board);
 static irqreturn_t hp82335_interrupt(int irq, void *arg);
 
 // wrappers for interface functions
-static int hp82335_read(gpib_board_t *board, uint8_t *buffer, size_t length,
+static int hp82335_read(struct gpib_board *board, uint8_t *buffer, size_t length,
 			int *end, size_t *bytes_read)
 {
 	struct hp82335_priv *priv = board->private_data;
@@ -37,7 +37,7 @@ static int hp82335_read(gpib_board_t *board, uint8_t *buffer, size_t length,
 	return tms9914_read(board, &priv->tms9914_priv, buffer, length, end, bytes_read);
 }
 
-static int hp82335_write(gpib_board_t *board, uint8_t *buffer, size_t length, int send_eoi,
+static int hp82335_write(struct gpib_board *board, uint8_t *buffer, size_t length, int send_eoi,
 			 size_t *bytes_written)
 {
 	struct hp82335_priv *priv = board->private_data;
@@ -45,7 +45,7 @@ static int hp82335_write(gpib_board_t *board, uint8_t *buffer, size_t length, in
 	return tms9914_write(board, &priv->tms9914_priv, buffer, length, send_eoi, bytes_written);
 }
 
-static int hp82335_command(gpib_board_t *board, uint8_t *buffer, size_t length,
+static int hp82335_command(struct gpib_board *board, uint8_t *buffer, size_t length,
 			   size_t *bytes_written)
 {
 	struct hp82335_priv *priv = board->private_data;
@@ -53,126 +53,126 @@ static int hp82335_command(gpib_board_t *board, uint8_t *buffer, size_t length,
 	return tms9914_command(board, &priv->tms9914_priv, buffer, length, bytes_written);
 }
 
-static int hp82335_take_control(gpib_board_t *board, int synchronous)
+static int hp82335_take_control(struct gpib_board *board, int synchronous)
 {
 	struct hp82335_priv *priv = board->private_data;
 
 	return tms9914_take_control(board, &priv->tms9914_priv, synchronous);
 }
 
-static int hp82335_go_to_standby(gpib_board_t *board)
+static int hp82335_go_to_standby(struct gpib_board *board)
 {
 	struct hp82335_priv *priv = board->private_data;
 
 	return tms9914_go_to_standby(board, &priv->tms9914_priv);
 }
 
-static void hp82335_request_system_control(gpib_board_t *board, int request_control)
+static void hp82335_request_system_control(struct gpib_board *board, int request_control)
 {
 	struct hp82335_priv *priv = board->private_data;
 
 	tms9914_request_system_control(board, &priv->tms9914_priv, request_control);
 }
 
-static void hp82335_interface_clear(gpib_board_t *board, int assert)
+static void hp82335_interface_clear(struct gpib_board *board, int assert)
 {
 	struct hp82335_priv *priv = board->private_data;
 
 	tms9914_interface_clear(board, &priv->tms9914_priv, assert);
 }
 
-static void hp82335_remote_enable(gpib_board_t *board, int enable)
+static void hp82335_remote_enable(struct gpib_board *board, int enable)
 {
 	struct hp82335_priv *priv = board->private_data;
 
 	tms9914_remote_enable(board, &priv->tms9914_priv, enable);
 }
 
-static int hp82335_enable_eos(gpib_board_t *board, uint8_t eos_byte, int compare_8_bits)
+static int hp82335_enable_eos(struct gpib_board *board, uint8_t eos_byte, int compare_8_bits)
 {
 	struct hp82335_priv *priv = board->private_data;
 
 	return tms9914_enable_eos(board, &priv->tms9914_priv, eos_byte, compare_8_bits);
 }
 
-static void hp82335_disable_eos(gpib_board_t *board)
+static void hp82335_disable_eos(struct gpib_board *board)
 {
 	struct hp82335_priv *priv = board->private_data;
 
 	tms9914_disable_eos(board, &priv->tms9914_priv);
 }
 
-static unsigned int hp82335_update_status(gpib_board_t *board, unsigned int clear_mask)
+static unsigned int hp82335_update_status(struct gpib_board *board, unsigned int clear_mask)
 {
 	struct hp82335_priv *priv = board->private_data;
 
 	return tms9914_update_status(board, &priv->tms9914_priv, clear_mask);
 }
 
-static int hp82335_primary_address(gpib_board_t *board, unsigned int address)
+static int hp82335_primary_address(struct gpib_board *board, unsigned int address)
 {
 	struct hp82335_priv *priv = board->private_data;
 
 	return tms9914_primary_address(board, &priv->tms9914_priv, address);
 }
 
-static int hp82335_secondary_address(gpib_board_t *board, unsigned int address, int enable)
+static int hp82335_secondary_address(struct gpib_board *board, unsigned int address, int enable)
 {
 	struct hp82335_priv *priv = board->private_data;
 
 	return tms9914_secondary_address(board, &priv->tms9914_priv, address, enable);
 }
 
-static int hp82335_parallel_poll(gpib_board_t *board, uint8_t *result)
+static int hp82335_parallel_poll(struct gpib_board *board, uint8_t *result)
 {
 	struct hp82335_priv *priv = board->private_data;
 
 	return tms9914_parallel_poll(board, &priv->tms9914_priv, result);
 }
 
-static void hp82335_parallel_poll_configure(gpib_board_t *board, uint8_t config)
+static void hp82335_parallel_poll_configure(struct gpib_board *board, uint8_t config)
 {
 	struct hp82335_priv *priv = board->private_data;
 
 	tms9914_parallel_poll_configure(board, &priv->tms9914_priv, config);
 }
 
-static void hp82335_parallel_poll_response(gpib_board_t *board, int ist)
+static void hp82335_parallel_poll_response(struct gpib_board *board, int ist)
 {
 	struct hp82335_priv *priv = board->private_data;
 
 	tms9914_parallel_poll_response(board, &priv->tms9914_priv, ist);
 }
 
-static void hp82335_serial_poll_response(gpib_board_t *board, uint8_t status)
+static void hp82335_serial_poll_response(struct gpib_board *board, uint8_t status)
 {
 	struct hp82335_priv *priv = board->private_data;
 
 	tms9914_serial_poll_response(board, &priv->tms9914_priv, status);
 }
 
-static uint8_t hp82335_serial_poll_status(gpib_board_t *board)
+static uint8_t hp82335_serial_poll_status(struct gpib_board *board)
 {
 	struct hp82335_priv *priv = board->private_data;
 
 	return tms9914_serial_poll_status(board, &priv->tms9914_priv);
 }
 
-static int hp82335_line_status(const gpib_board_t *board)
+static int hp82335_line_status(const struct gpib_board *board)
 {
 	struct hp82335_priv *priv = board->private_data;
 
 	return tms9914_line_status(board, &priv->tms9914_priv);
 }
 
-static unsigned int hp82335_t1_delay(gpib_board_t *board, unsigned int nano_sec)
+static unsigned int hp82335_t1_delay(struct gpib_board *board, unsigned int nano_sec)
 {
 	struct hp82335_priv *priv = board->private_data;
 
 	return tms9914_t1_delay(board, &priv->tms9914_priv, nano_sec);
 }
 
-static void hp82335_return_to_local(gpib_board_t *board)
+static void hp82335_return_to_local(struct gpib_board *board)
 {
 	struct hp82335_priv *priv = board->private_data;
 
@@ -207,7 +207,7 @@ static gpib_interface_t hp82335_interface = {
 	.return_to_local = hp82335_return_to_local,
 };
 
-static int hp82335_allocate_private(gpib_board_t *board)
+static int hp82335_allocate_private(struct gpib_board *board)
 {
 	board->private_data = kzalloc(sizeof(struct hp82335_priv), GFP_KERNEL);
 	if (!board->private_data)
@@ -215,7 +215,7 @@ static int hp82335_allocate_private(gpib_board_t *board)
 	return 0;
 }
 
-static void hp82335_free_private(gpib_board_t *board)
+static void hp82335_free_private(struct gpib_board *board)
 {
 	kfree(board->private_data);
 	board->private_data = NULL;
@@ -243,7 +243,7 @@ static void hp82335_clear_interrupt(struct hp82335_priv *hp_priv)
 	writeb(0, tms_priv->mmiobase + HPREG_INTR_CLEAR);
 }
 
-static int hp82335_attach(gpib_board_t *board, const gpib_board_config_t *config)
+static int hp82335_attach(struct gpib_board *board, const gpib_board_config_t *config)
 {
 	struct hp82335_priv *hp_priv;
 	struct tms9914_priv *tms_priv;
@@ -307,7 +307,7 @@ static int hp82335_attach(gpib_board_t *board, const gpib_board_config_t *config
 	return 0;
 }
 
-static void hp82335_detach(gpib_board_t *board)
+static void hp82335_detach(struct gpib_board *board)
 {
 	struct hp82335_priv *hp_priv = board->private_data;
 	struct tms9914_priv *tms_priv;
@@ -354,7 +354,7 @@ module_exit(hp82335_exit_module);
 static irqreturn_t hp82335_interrupt(int irq, void *arg)
 {
 	int status1, status2;
-	gpib_board_t *board = arg;
+	struct gpib_board *board = arg;
 	struct hp82335_priv *priv = board->private_data;
 	unsigned long flags;
 	irqreturn_t retval;
-- 
2.43.0

