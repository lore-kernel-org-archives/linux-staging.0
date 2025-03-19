Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B638021C195
	for <linux-staging@lists.linux.dev>; Wed, 19 Mar 2025 21:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742421585; cv=none; b=ILQR4CJA+IMYLvUN45qTkHJFIyHM2+HXZh70Wjg7dXfq0j1i++OgrbTjeVoaQy0ehlC/Z3CaJmb+hd0GwUm27rlfgcjkUDXENoUxFcS1sLLb4Sl3f3gaZaPQIByW3lwretFmR6r2kI5fqPa1gK3kMYY58xX6aiFPJRbchrOtw78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742421585; c=relaxed/simple;
	bh=vD6quqeCzKlpnY7dOUwCk16YlEJO6p4KoywYWJNFZPg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tkCHgiyksygHyREt+i4cKoQnn+lRQl1k56qh1MR6Lybjk0st1bYCw1PlGkga55wdD/fJ/N6Jcye5agfedhTYM7XXdfwixOnLfQ7HnaBXPjzcXm1vT4f37G7C26ovDddUpL0n6vZCDAi/viP0DwkwnvTLfI6HwE8NoHqYNi8wcGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=OF+XsZO6; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="OF+XsZO6"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22438c356c8so823585ad.1
        for <linux-staging@lists.linux.dev>; Wed, 19 Mar 2025 14:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1742421583; x=1743026383; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HUNOx6AMS3SHRYHpYYpQh3DOz0o7uDzbGPhBpeav/x8=;
        b=OF+XsZO6dGyV3gEctPikZLGiv42Xkl5sFmNPme3cEo8xfn51vu1dUDIB9+qaKyATLC
         33V1pGBOe7QeANb93UVTP2j4DRz8hamuFHRLXaTUKMLzyFT9zC2v+m2QyvW9R6pMF5Fx
         EwlYp3xlWlFquNanjTK/b1yQvi0pOS76c9XggiHeH/Ld4lLfZCgd3juM0izTNrpgjtrm
         GZ7HTggMaOT1FR2khexKP7t5io5GUNisABKIKemVcP6170dxjd2CxD/9617V6BRS2UnH
         TNh40ae4CMw80RrVfew01e7yMuusHg24aWFDqe7l6mTJHWJx4N077eg36NeXfj1AXhSA
         UJKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742421583; x=1743026383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HUNOx6AMS3SHRYHpYYpQh3DOz0o7uDzbGPhBpeav/x8=;
        b=RsFD7av2XI78XWKrylpdr6KvvINpMHVq5nTe0Uw6GcwS3VAp3lBVw/KGJWTAu6AQ9/
         MeNxPz0Do8sz0TICOoAAZwFJn5ACdr8q8tFI65xuMfqjboMjE0IVfRIMcfvFlohsTF84
         08+sxL14i0MqLXyyq7BeU4rYqyAyKCTpbvX6ahppBE1S/hLpdMeywQy1G6e+k/SAtgMr
         P1J7SruGDh+yrbqHrXqDipaWdfyRPlUOel08WwQOyfsvxMoUySTALuxQTL6Eads6DD0r
         X3gIQX26Jxk5zYyKUzxexePVoradgPGIg/JTaSLh489kjqK79bm0at9T6679TP563hVd
         dFuQ==
X-Gm-Message-State: AOJu0Yw9V7NeqFpfnlz52129PN7AamYfuOYm5unZX/p/jp2jpwzzhJ+C
	JTXDOGmgIDOQd8sqbVshnyvcQZkQECD2EI4IQ+bl7nvJt4VoN/N5YCnc39/1bMSC5bEDs/TUHJI
	=
X-Gm-Gg: ASbGnctK0YFxJUz2XSxF+J+8GoJYy3upAI21eJt5yGurmTTCWjWDjL/IS8WW5qAB7Bj
	M3+3rf6bwcrxDPWK2b4E3ysy9wLPReRYmgz0Q2Fj0ClEUYar0ielNi4mJfrbo5tdbq3rYUipZxQ
	9wMQETwUP7bQ3SfC/SQwZE6NcCn4xc5e1UPeWaGXZkYhNLpQh11Lcn+sscXoyd5Qiv/KHxyA/yE
	mvtldu47EP54Rl+vUFUyjv4ZH0I/bJkpDTje/tS+hkx7z6EwGe875p1cnZq4YJm9YvMBilrh5fg
	p9EoxoW8CvTI+Wg8Psl0+QsHHV0dwKCAc7fi7CtUTkeWpe0i5HHTo6deojQTmzwLQXx4XgHnnDO
	Sp5svwkqDYQ==
X-Google-Smtp-Source: AGHT+IHLf1ezARTJkSh0ZQFiWLFXkKppFFH7GG+XwSuM6etYQCdBrwI9LnCcqVJt1FzhpXaNPQKvbQ==
X-Received: by 2002:a17:902:e5ce:b0:224:23ab:b88b with SMTP id d9443c01a7336-2265ed81a4emr11237995ad.8.1742421583017;
        Wed, 19 Mar 2025 14:59:43 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bbe7ccsm120016755ad.174.2025.03.19.14.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 14:59:42 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 05/20] staging: gpib: cec_gpib: struct gpib_board
Date: Wed, 19 Mar 2025 21:59:09 +0000
Message-ID: <20250319215924.19387-6-matchstick@neverthere.org>
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
 drivers/staging/gpib/cec/cec_gpib.c | 59 +++++++++++++++--------------
 1 file changed, 30 insertions(+), 29 deletions(-)

diff --git a/drivers/staging/gpib/cec/cec_gpib.c b/drivers/staging/gpib/cec/cec_gpib.c
index 8f2b4b46a446..abe5b1b8bc5b 100644
--- a/drivers/staging/gpib/cec/cec_gpib.c
+++ b/drivers/staging/gpib/cec/cec_gpib.c
@@ -25,7 +25,7 @@ MODULE_DESCRIPTION("GPIB driver for CEC PCI and PCMCIA boards");
 
 static irqreturn_t cec_interrupt(int irq, void *arg)
 {
-	gpib_board_t *board = arg;
+	struct gpib_board *board = arg;
 	struct cec_priv *priv = board->private_data;
 	unsigned long flags;
 	irqreturn_t retval;
@@ -40,12 +40,12 @@ static irqreturn_t cec_interrupt(int irq, void *arg)
 #define CEC_DEV_ID    0x5cec
 #define CEC_SUBID 0x9050
 
-static int cec_pci_attach(gpib_board_t *board, const gpib_board_config_t *config);
+static int cec_pci_attach(struct gpib_board *board, const gpib_board_config_t *config);
 
-static void cec_pci_detach(gpib_board_t *board);
+static void cec_pci_detach(struct gpib_board *board);
 
 // wrappers for interface functions
-static int cec_read(gpib_board_t *board, uint8_t *buffer, size_t length, int *end,
+static int cec_read(struct gpib_board *board, uint8_t *buffer, size_t length, int *end,
 		    size_t *bytes_read)
 {
 	struct cec_priv *priv = board->private_data;
@@ -53,7 +53,7 @@ static int cec_read(gpib_board_t *board, uint8_t *buffer, size_t length, int *en
 	return nec7210_read(board, &priv->nec7210_priv, buffer, length, end, bytes_read);
 }
 
-static int cec_write(gpib_board_t *board, uint8_t *buffer, size_t length, int send_eoi,
+static int cec_write(struct gpib_board *board, uint8_t *buffer, size_t length, int send_eoi,
 		     size_t *bytes_written)
 {
 	struct cec_priv *priv = board->private_data;
@@ -61,126 +61,127 @@ static int cec_write(gpib_board_t *board, uint8_t *buffer, size_t length, int se
 	return nec7210_write(board, &priv->nec7210_priv, buffer, length, send_eoi, bytes_written);
 }
 
-static int cec_command(gpib_board_t *board, uint8_t *buffer, size_t length, size_t *bytes_written)
+static int cec_command(struct gpib_board *board, uint8_t *buffer,
+		       size_t length, size_t *bytes_written)
 {
 	struct cec_priv *priv = board->private_data;
 
 	return nec7210_command(board, &priv->nec7210_priv, buffer, length, bytes_written);
 }
 
-static int cec_take_control(gpib_board_t *board, int synchronous)
+static int cec_take_control(struct gpib_board *board, int synchronous)
 {
 	struct cec_priv *priv = board->private_data;
 
 	return nec7210_take_control(board, &priv->nec7210_priv, synchronous);
 }
 
-static int cec_go_to_standby(gpib_board_t *board)
+static int cec_go_to_standby(struct gpib_board *board)
 {
 	struct cec_priv *priv = board->private_data;
 
 	return nec7210_go_to_standby(board, &priv->nec7210_priv);
 }
 
-static void cec_request_system_control(gpib_board_t *board, int request_control)
+static void cec_request_system_control(struct gpib_board *board, int request_control)
 {
 	struct cec_priv *priv = board->private_data;
 
 	nec7210_request_system_control(board, &priv->nec7210_priv, request_control);
 }
 
-static void cec_interface_clear(gpib_board_t *board, int assert)
+static void cec_interface_clear(struct gpib_board *board, int assert)
 {
 	struct cec_priv *priv = board->private_data;
 
 	nec7210_interface_clear(board, &priv->nec7210_priv, assert);
 }
 
-static void cec_remote_enable(gpib_board_t *board, int enable)
+static void cec_remote_enable(struct gpib_board *board, int enable)
 {
 	struct cec_priv *priv = board->private_data;
 
 	nec7210_remote_enable(board, &priv->nec7210_priv, enable);
 }
 
-static int cec_enable_eos(gpib_board_t *board, uint8_t eos_byte, int compare_8_bits)
+static int cec_enable_eos(struct gpib_board *board, uint8_t eos_byte, int compare_8_bits)
 {
 	struct cec_priv *priv = board->private_data;
 
 	return nec7210_enable_eos(board, &priv->nec7210_priv, eos_byte, compare_8_bits);
 }
 
-static void cec_disable_eos(gpib_board_t *board)
+static void cec_disable_eos(struct gpib_board *board)
 {
 	struct cec_priv *priv = board->private_data;
 
 	nec7210_disable_eos(board, &priv->nec7210_priv);
 }
 
-static unsigned int cec_update_status(gpib_board_t *board, unsigned int clear_mask)
+static unsigned int cec_update_status(struct gpib_board *board, unsigned int clear_mask)
 {
 	struct cec_priv *priv = board->private_data;
 
 	return nec7210_update_status(board, &priv->nec7210_priv, clear_mask);
 }
 
-static int cec_primary_address(gpib_board_t *board, unsigned int address)
+static int cec_primary_address(struct gpib_board *board, unsigned int address)
 {
 	struct cec_priv *priv = board->private_data;
 
 	return nec7210_primary_address(board, &priv->nec7210_priv, address);
 }
 
-static int cec_secondary_address(gpib_board_t *board, unsigned int address, int enable)
+static int cec_secondary_address(struct gpib_board *board, unsigned int address, int enable)
 {
 	struct cec_priv *priv = board->private_data;
 
 	return nec7210_secondary_address(board, &priv->nec7210_priv, address, enable);
 }
 
-static int cec_parallel_poll(gpib_board_t *board, uint8_t *result)
+static int cec_parallel_poll(struct gpib_board *board, uint8_t *result)
 {
 	struct cec_priv *priv = board->private_data;
 
 	return nec7210_parallel_poll(board, &priv->nec7210_priv, result);
 }
 
-static void cec_parallel_poll_configure(gpib_board_t *board, uint8_t config)
+static void cec_parallel_poll_configure(struct gpib_board *board, uint8_t config)
 {
 	struct cec_priv *priv = board->private_data;
 
 	nec7210_parallel_poll_configure(board, &priv->nec7210_priv, config);
 }
 
-static void cec_parallel_poll_response(gpib_board_t *board, int ist)
+static void cec_parallel_poll_response(struct gpib_board *board, int ist)
 {
 	struct cec_priv *priv = board->private_data;
 
 	nec7210_parallel_poll_response(board, &priv->nec7210_priv, ist);
 }
 
-static void cec_serial_poll_response(gpib_board_t *board, uint8_t status)
+static void cec_serial_poll_response(struct gpib_board *board, uint8_t status)
 {
 	struct cec_priv *priv = board->private_data;
 
 	nec7210_serial_poll_response(board, &priv->nec7210_priv, status);
 }
 
-static uint8_t cec_serial_poll_status(gpib_board_t *board)
+static uint8_t cec_serial_poll_status(struct gpib_board *board)
 {
 	struct cec_priv *priv = board->private_data;
 
 	return nec7210_serial_poll_status(board, &priv->nec7210_priv);
 }
 
-static unsigned int cec_t1_delay(gpib_board_t *board, unsigned int nano_sec)
+static unsigned int cec_t1_delay(struct gpib_board *board, unsigned int nano_sec)
 {
 	struct cec_priv *priv = board->private_data;
 
 	return nec7210_t1_delay(board, &priv->nec7210_priv, nano_sec);
 }
 
-static void cec_return_to_local(gpib_board_t *board)
+static void cec_return_to_local(struct gpib_board *board)
 {
 	struct cec_priv *priv = board->private_data;
 
@@ -215,7 +216,7 @@ static gpib_interface_t cec_pci_interface = {
 	.return_to_local = cec_return_to_local,
 };
 
-static int cec_allocate_private(gpib_board_t *board)
+static int cec_allocate_private(struct gpib_board *board)
 {
 	struct cec_priv *priv;
 
@@ -228,13 +229,13 @@ static int cec_allocate_private(gpib_board_t *board)
 	return 0;
 }
 
-static void cec_free_private(gpib_board_t *board)
+static void cec_free_private(struct gpib_board *board)
 {
 	kfree(board->private_data);
 	board->private_data = NULL;
 }
 
-static int cec_generic_attach(gpib_board_t *board)
+static int cec_generic_attach(struct gpib_board *board)
 {
 	struct cec_priv *cec_priv;
 	struct nec7210_priv *nec_priv;
@@ -252,7 +253,7 @@ static int cec_generic_attach(gpib_board_t *board)
 	return 0;
 }
 
-static void cec_init(struct cec_priv *cec_priv, const gpib_board_t *board)
+static void cec_init(struct cec_priv *cec_priv, const struct gpib_board *board)
 {
 	struct nec7210_priv *nec_priv = &cec_priv->nec7210_priv;
 
@@ -264,7 +265,7 @@ static void cec_init(struct cec_priv *cec_priv, const gpib_board_t *board)
 	nec7210_board_online(nec_priv, board);
 }
 
-static int cec_pci_attach(gpib_board_t *board, const gpib_board_config_t *config)
+static int cec_pci_attach(struct gpib_board *board, const gpib_board_config_t *config)
 {
 	struct cec_priv *cec_priv;
 	struct nec7210_priv *nec_priv;
@@ -322,7 +323,7 @@ static int cec_pci_attach(gpib_board_t *board, const gpib_board_config_t *config
 	return 0;
 }
 
-static void cec_pci_detach(gpib_board_t *board)
+static void cec_pci_detach(struct gpib_board *board)
 {
 	struct cec_priv *cec_priv = board->private_data;
 	struct nec7210_priv *nec_priv;
-- 
2.43.0

