Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B637D3002BD
	for <linux-staging@lists.linux.dev>; Tue, 14 Oct 2025 20:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760472466; cv=none; b=rVLHgttU2XaylFDdbZTOIyGdBmqI+ZsZ2wT0ql+duAfXNDUnum99O43bUV43/ok2dGpjQqwtBs8rsuVVrYXJ3cWOGecJ2FSx3LGfxP0DCo1DYR97+VMEg2kc0LFIpeXrHOP+LuPzq3/hT5fzmTGsITwYgTCNYuaRjYOEE1cZc98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760472466; c=relaxed/simple;
	bh=11G9qWo3AalZFB6Fko0IXrFFm6wbNdqaAFoKRnYqgaI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bXz2a6kZpUCE3fnSwhwNudWRJTpGh3F+Nd47dSPzQwQGlGUZcwENS/bx5yn01EUAoeA2rPKlO+eJiUpnf67TDtfEHMzlBewGpCTfv9VMW0sXDEkRdBNKoD8uQd4J8lHU/HUKxu/CQgr4C6vRw6HB0qVo/32LWNA0kjrAhlCd9AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=duQ6f6yn; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="duQ6f6yn"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-27ee41e074dso66629625ad.1
        for <linux-staging@lists.linux.dev>; Tue, 14 Oct 2025 13:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760472464; x=1761077264; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EUJFv7ESp/8mj4VXSk9djpKF9F8nqTF7GCFJU4tlJik=;
        b=duQ6f6ynI6NLZOLtBiI9bKCkDh0yfkkrpnqlvgAdUPqbCAIImVMvJk8NhkC8chnzFJ
         E/vwRnP9KAfVlGpe+kcoFhjJOiL7aE4mHgkSSLspSEDrvmks1AKSy3uhPWnYjRv6WyC8
         cF4RqxafX19A1CKhKnfs5rDWh6zIP3L2xmQQzDNqUyPTJIFeStqa/Yq4KjMrSqMwDEk3
         suPLuSwrtOLKf6LKEsEFEkIhoWW+h8dxR63WmcLmpna3IuyvfQ9LLhPVJUjso4BHMn+B
         n7Uzw/wG935lYkfr6BtrHk7zCdtqSvFEqAa+I85kHXafDL/mD7anRH0s651953FSZIig
         lbKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760472464; x=1761077264;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EUJFv7ESp/8mj4VXSk9djpKF9F8nqTF7GCFJU4tlJik=;
        b=Dzc2KWOuAsFMQrY+3utoS9EG7aHVp3QYMT77j1bX+nCdpH7nuPKnO3zDDV0BYMfR4T
         t2BHJIZP62UmTmI9TKObchEeDGvPeKW74MeH20D5xKDascRLIeDnIEBMCUzEXJ5zJDBh
         taF1WTMdh/quai1L4Sk3mzOlWwP1j1uWytnWcDwDB3xMDVP6kQVdn+VZq5PS+2mS9ueJ
         OpH9KrkT6EuBBomvL9Oz+NzmmVQwNNafsTCl8ypjZckSIk8k/MKHoFbbW4M1rc4x+Pat
         eX4ICXFeVkc0TEL6hjnw1trREHAxJqrVktn2VIuoWJyzqlMKpiWdYFPAp29mcJ2ixiOO
         UsBw==
X-Forwarded-Encrypted: i=1; AJvYcCUkcSReSWlniZehN+rmhXl/XSTk5DyznWGIbK3dQcFP157LnNRy43KV/djKsHLEuNhv3kcd5KGrIULtCJPC@lists.linux.dev
X-Gm-Message-State: AOJu0YyZIfkck1mXZJwqfF/EJhavry2yovhqJ0BY2moYeHT39CvxYYbj
	KeBxQPZz5lerIxyrxq0dUfzkcHqBjS4CQf9cbjZrOT1E7hsVnGmrFWC+
X-Gm-Gg: ASbGncsGRQHSv++M2YJCxA7GJ+AkKu428jg1Ab4QCoEN2iz+c30Ju4WfhoxkbUXl9k+
	38Lb4rp+DTjsPQuW7+5FC2XP6fdjcENXVTTjqmtgznfkQUgsJ8He9H8xQIH74RuUtPrnqhuQ20n
	uEAE/y1w175MwBfzk0H73gJrMwZFYs+VrxhVjlWKd4hWcj/Ok0nYfF02PNzMAU9eE1B6JIRJu48
	Xf/f8kK4aJjk/Z7m59BW1FM4ZaBNX+TwRTyksAjrxJkmgk2+7KEzV9QjzMhVjZkxvS70uBZUKaQ
	jh300yR7ByneHX+YeGcgtA6ADz6GIvm68rpLrvs8wOIFp4hWmcip/7fvyoQek82zbwSL9OYz1HY
	YlMqxWZ5ZBlJSnm8mIQh762xdDMDAF9u22BfAK47bbHmS
X-Google-Smtp-Source: AGHT+IFFKeB1Mvjp4X6Fnn/pnWiCLBzUt9+3u52VJg1yNRK0ffmaoQzkUVGVa1S5Cm0s2yvoXega6A==
X-Received: by 2002:a17:902:cecb:b0:268:baa6:94ba with SMTP id d9443c01a7336-290272ff553mr380301905ad.53.1760472463985;
        Tue, 14 Oct 2025 13:07:43 -0700 (PDT)
Received: from archlinux ([2a09:bac5:3e67:a82::10c:4a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034e205a6sm172580365ad.35.2025.10.14.13.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 13:07:43 -0700 (PDT)
From: Fokaz Chakma <fokazmchakma4427@gmail.com>
To: dpenkler@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fokaz Chakma <fokazmchakma4427@gmail.com>
Subject: [PATCH] staging: gpib/pc2: convert explanatory comments to /* ... */ style
Date: Wed, 15 Oct 2025 01:37:27 +0530
Message-ID: <20251014200727.206103-1-fokazmchakma4427@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Converted single-line // comments that explain data or logic
to kernel-style /* ... */ comments, per
Documentation/process/coding-style.rst.

// XXX notes are left unchanged.

Signed-off-by: Fokaz Chakma <fokazmchakma4427@gmail.com>
---
 drivers/staging/gpib/pc2/pc2_gpib.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/gpib/pc2/pc2_gpib.c b/drivers/staging/gpib/pc2/pc2_gpib.c
index 9f3943d1d..c9c2b3ed8 100644
--- a/drivers/staging/gpib/pc2/pc2_gpib.c
+++ b/drivers/staging/gpib/pc2/pc2_gpib.c
@@ -19,30 +19,30 @@
 #include "nec7210.h"
 #include "gpibP.h"
 
-// struct which defines private_data for pc2 driver
+/* struct which defines private_data for pc2 driver */
 struct pc2_priv {
 	struct nec7210_priv nec7210_priv;
 	unsigned int irq;
-	// io address that clears interrupt for pc2a (0x2f0 + irq)
+	/* io address that clears interrupt for pc2a (0x2f0 + irq) */
 	unsigned int clear_intr_addr;
 };
 
-// pc2 uses 8 consecutive io addresses
+/* pc2 uses 8 consecutive io addresses */
 static const int pc2_iosize = 8;
 static const int pc2a_iosize = 8;
 static const int pc2_2a_iosize = 16;
 
-// offset between io addresses of successive nec7210 registers
+/* offset between io addresses of successive nec7210 registers */
 static const int pc2a_reg_offset = 0x400;
 static const int pc2_reg_offset = 1;
 
-// interrupt service routine
+/* interrupt service routine */
 static irqreturn_t pc2_interrupt(int irq, void *arg);
 static irqreturn_t pc2a_interrupt(int irq, void *arg);
 
-// pc2 specific registers and bits
+/* pc2 specific registers and bits */
 
-// interrupt clear register address
+/* interrupt clear register address */
 static const int pc2a_clear_intr_iobase = 0x2f0;
 static inline unsigned int CLEAR_INTR_REG(unsigned int irq)
 {
@@ -78,7 +78,7 @@ irqreturn_t pc2a_interrupt(int irq, void *arg)
 	irqreturn_t retval;
 
 	spin_lock_irqsave(&board->spinlock, flags);
-	// read interrupt status (also clears status)
+	/* read interrupt status (also clears status) */
 	status1 = read_byte(&priv->nec7210_priv, ISR1);
 	status2 = read_byte(&priv->nec7210_priv, ISR2);
 	/* clear interrupt circuit */
@@ -89,7 +89,7 @@ irqreturn_t pc2a_interrupt(int irq, void *arg)
 	return retval;
 }
 
-// wrappers for interface functions
+/* wrappers for interface functions */
 static int pc2_read(struct gpib_board *board, u8 *buffer, size_t length, int *end,
 		    size_t *bytes_read)
 {
@@ -273,7 +273,7 @@ static int pc2_generic_attach(struct gpib_board *board, const struct gpib_board_
 	 * is adapted to use isa_register_driver.
 	 */
 	if (config->ibdma)
-	// driver needs to be adapted to use isa_register_driver to get a struct device*
+	/* driver needs to be adapted to use isa_register_driver to get a struct device */
 		dev_err(board->gpib_dev, "DMA disabled for pc2 gpib");
 #else
 	if (config->ibdma) {
@@ -284,7 +284,7 @@ static int pc2_generic_attach(struct gpib_board *board, const struct gpib_board_
 		if (!nec_priv->dma_buffer)
 			return -ENOMEM;
 
-		// request isa dma channel
+		/* request isa dma channel */
 		if (request_dma(config->ibdma, "pc2")) {
 			dev_err(board->gpib_dev, "can't request DMA %d\n", config->ibdma);
 			return -1;
@@ -319,7 +319,7 @@ static int pc2_attach(struct gpib_board *board, const struct gpib_board_config *
 
 	nec7210_board_reset(nec_priv, board);
 
-	// install interrupt handler
+	/* install interrupt handler */
 	if (config->ibirq) {
 		if (request_irq(config->ibirq, pc2_interrupt, isr_flags, "pc2", board))	{
 			dev_err(board->gpib_dev, "can't request IRQ %d\n", config->ibirq);
@@ -447,7 +447,7 @@ static int pc2a_common_attach(struct gpib_board *board, const struct gpib_board_
 		return -1;
 	}
 
-	// make sure interrupt is clear
+	/* make sure interrupt is clear */
 	if (pc2_priv->irq)
 		outb(0xff, CLEAR_INTR_REG(pc2_priv->irq));
 
-- 
2.51.0

