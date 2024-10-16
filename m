Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA1720607A
	for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 11:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729077332; cv=none; b=Z2vse61xcdNYe/evwGKuWpwxkjL5+Wp+/97a+jqOgyY4yv91kpN7VQd6vJ79/RNzZRN8IDH+8z8jiKEkTHm4rjq6L+93O3/rciNdL5egt7KN3Fd48/KQ+yPOJ1PWUAAW4gLphSRpAgxJAKSHhFWFhs9Y24PB4UCHqtQqjLBk/Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729077332; c=relaxed/simple;
	bh=G/EmZWBnxCkUCN2bCu9tkeLce6q6buvxLVO37Ke6+oE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CkPJVoQsg/8bcMbWH0XIQQ0Nil1hjnkDiC0JO+qIsZyZMq2MfqowUHtkLfv3huU9GSJ9Q1HybOLJhD1qrRef0frwt0JqtqwgTZMEQPULjL+jpHGRpdEXIVfrLde6pqwAte7YL732eX6G8++KMD3tzLRfU6Eg10oOcdhmGwBVEY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L5loXvoW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L5loXvoW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 127F3C4CECF;
	Wed, 16 Oct 2024 11:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729077332;
	bh=G/EmZWBnxCkUCN2bCu9tkeLce6q6buvxLVO37Ke6+oE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L5loXvoWxmYd+Uj5XJ5XmGzg5pCWFjZdvOWQEr0wVWAtVzOc2vu6AU0A0v0SRDHZW
	 bhKEqDNgoSizx8QwsYowCkdD0tRiu2R3HZ1yOPOkwkdBNUO3wSwJ6P/1q7e+246zlw
	 SLvB89RRrZiwwyetd268DtugjXR1+hnFBtDiCZWijOhEB5lnnxD7DvbS3Dun3APu+I
	 xzhgYuMqSIonEef7BvjDC0IRekCNXtt/BGwu7Si2uHmiXggXySn20nOxljFGo0Hwzb
	 xisWvHMcDkSWKSDoSy9FIs2mR7J6Qsn8w+BDnS7DcNPI1iOQUUWDBp4u9F3lFkDNap
	 1XncWyo7M/THA==
From: Arnd Bergmann <arnd@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Penkler <dpenkler@gmail.com>
Cc: linux-staging@lists.linux.dev,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 2/7] staging: gpib: avoid unused const variables
Date: Wed, 16 Oct 2024 11:15:16 +0000
Message-Id: <20241016111521.1143191-3-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241016111521.1143191-1-arnd@kernel.org>
References: <20241016111521.1143191-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Variables that are 'static const' but not used anywhere cause a warning
with "gcc -Wunused-const-variable", which we may want to enable by default
in the future.

The gpib code already has a mix of 'enum' and 'static const' variables
for named constants, so convert the ones that are causing problems to
enums as well, or move them closer to the only users where possible.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/staging/gpib/common/gpib_os.c         |  2 ++
 drivers/staging/gpib/eastwood/fluke_gpib.h    |  8 +++++---
 .../staging/gpib/include/nec7210_registers.h  |  6 +++---
 drivers/staging/gpib/include/tms9914.h        |  4 +++-
 .../staging/gpib/include/tnt4882_registers.h  |  4 +++-
 drivers/staging/gpib/ines/ines.h              |  3 ---
 drivers/staging/gpib/ines/ines_gpib.c         |  6 ++++--
 drivers/staging/gpib/tms9914/tms9914.c        |  3 ---
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c   |  3 ++-
 drivers/staging/gpib/uapi/gpib_user.h         | 20 ++++++++++---------
 10 files changed, 33 insertions(+), 26 deletions(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index 01efe99adeb3..e9dd7b2d1569 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -523,6 +523,8 @@ int serial_poll_all(gpib_board_t *board, unsigned int usec_timeout)
  * SPD and UNT are sent at the completion of the poll.
  */
 
+static const int gpib_addr_max = 30;	/* max address for primary/secondary gpib addresses */
+
 int dvrsp(gpib_board_t *board, unsigned int pad, int sad,
 	  unsigned int usec_timeout, uint8_t *result)
 {
diff --git a/drivers/staging/gpib/eastwood/fluke_gpib.h b/drivers/staging/gpib/eastwood/fluke_gpib.h
index d6c5b0124c7e..fcbd42f8f9af 100644
--- a/drivers/staging/gpib/eastwood/fluke_gpib.h
+++ b/drivers/staging/gpib/eastwood/fluke_gpib.h
@@ -136,6 +136,8 @@ enum cb7210_aux_cmds {
 	AUX_HI_SPEED = 0x41,
 };
 
-static const int fluke_reg_offset = 4;
-static const int fluke_num_regs = 8;
-static const unsigned int write_transfer_counter_mask = 0x7ff;
+enum {
+	fluke_reg_offset = 4,
+	fluke_num_regs = 8,
+	write_transfer_counter_mask = 0x7ff,
+};
diff --git a/drivers/staging/gpib/include/nec7210_registers.h b/drivers/staging/gpib/include/nec7210_registers.h
index 2ad512c372c4..888803dd97f9 100644
--- a/drivers/staging/gpib/include/nec7210_registers.h
+++ b/drivers/staging/gpib/include/nec7210_registers.h
@@ -17,9 +17,6 @@ enum nec7210_chipset {
 	TNT5004,	// NI (minor differences to TNT4882)
 };
 
-// nec7210 has 8 registers
-static const int nec7210_num_registers = 8;
-
 /* nec7210 register numbers (might need to be multiplied by
  * a board-dependent offset to get actually io address offset)
  */
@@ -33,6 +30,9 @@ enum nec7210_write_regs {
 	AUXMR,	// auxiliary mode
 	ADR,	// address
 	EOSR,	// end-of-string
+
+	// nec7210 has 8 registers
+	nec7210_num_registers = 8,
 };
 
 // read registers
diff --git a/drivers/staging/gpib/include/tms9914.h b/drivers/staging/gpib/include/tms9914.h
index 1cbba02c3581..456b488212d2 100644
--- a/drivers/staging/gpib/include/tms9914.h
+++ b/drivers/staging/gpib/include/tms9914.h
@@ -132,7 +132,9 @@ irqreturn_t tms9914_interrupt_have_status(gpib_board_t *board, struct tms9914_pr
 					  int status1,	int status2);
 
 // tms9914 has 8 registers
-static const int tms9914_num_registers = 8;
+enum {
+	ms9914_num_registers = 8,
+};
 
 /* tms9914 register numbers (might need to be multiplied by
  * a board-dependent offset to get actually io address offset)
diff --git a/drivers/staging/gpib/include/tnt4882_registers.h b/drivers/staging/gpib/include/tnt4882_registers.h
index f0a719772f41..1b1441cd03d5 100644
--- a/drivers/staging/gpib/include/tnt4882_registers.h
+++ b/drivers/staging/gpib/include/tnt4882_registers.h
@@ -40,7 +40,9 @@ enum {
 	BSR = BCR,
 };
 
-static const int tnt_pagein_offset = 0x11;
+enum {
+	tnt_pagein_offset = 0x11,
+};
 
 /*============================================================*/
 
diff --git a/drivers/staging/gpib/ines/ines.h b/drivers/staging/gpib/ines/ines.h
index ae7d042e9f04..7e8302619998 100644
--- a/drivers/staging/gpib/ines/ines.h
+++ b/drivers/staging/gpib/ines/ines.h
@@ -212,7 +212,4 @@ enum ines_auxd_bits {
 	INES_T6_50us = 0x10,
 };
 
-static const int ines_isa_iosize = 0x20;
-static const int ines_pcmcia_iosize = 0x20;
-
 #endif	// _INES_GPIB_H
diff --git a/drivers/staging/gpib/ines/ines_gpib.c b/drivers/staging/gpib/ines/ines_gpib.c
index 1e43fab32eaf..382c9e579a6d 100644
--- a/drivers/staging/gpib/ines/ines_gpib.c
+++ b/drivers/staging/gpib/ines/ines_gpib.c
@@ -88,8 +88,6 @@ unsigned int ines_t1_delay(gpib_board_t *board, unsigned int nano_sec)
 	return retval;
 }
 
-static const int in_fifo_size = 0xff;
-
 static inline unsigned short num_in_fifo_bytes(struct ines_priv *ines_priv)
 {
 	return ines_inb(ines_priv, IN_FIFO_COUNT);
@@ -885,6 +883,8 @@ int ines_pci_accel_attach(gpib_board_t *board, const gpib_board_config_t *config
 	return 0;
 }
 
+static const int ines_isa_iosize = 0x20;
+
 int ines_isa_attach(gpib_board_t *board, const gpib_board_config_t *config)
 {
 	struct ines_priv *ines_priv;
@@ -995,6 +995,8 @@ static int pc_debug = PCMCIA_DEBUG;
 #define DEBUG(args...)
 #endif
 
+static const int ines_pcmcia_iosize = 0x20;
+
 /*    The event() function is this driver's Card Services event handler.
  *    It will be called by Card Services when an appropriate card status
  *    event is received.  The config() and release() entry points are
diff --git a/drivers/staging/gpib/tms9914/tms9914.c b/drivers/staging/gpib/tms9914/tms9914.c
index 052d5e3acc91..a85a796de024 100644
--- a/drivers/staging/gpib/tms9914/tms9914.c
+++ b/drivers/staging/gpib/tms9914/tms9914.c
@@ -816,9 +816,6 @@ irqreturn_t tms9914_interrupt_have_status(gpib_board_t *board, struct tms9914_pr
 }
 EXPORT_SYMBOL(tms9914_interrupt_have_status);
 
-// size of modbus pci memory io region
-static const int iomem_size = 0x2000;
-
 void tms9914_board_reset(struct tms9914_priv *priv)
 {
 	/* chip reset */
diff --git a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
index f14d3ce937ba..466da4c6f3fc 100644
--- a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
+++ b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
@@ -100,7 +100,6 @@ static const int atgpib_reg_offset = 2;
 
 // number of ioports used
 static const int atgpib_iosize = 32;
-static const int pcmcia_gpib_iosize = 32;
 
 /* paged io */
 static inline unsigned int tnt_paged_readb(struct tnt4882_priv *priv, unsigned long offset)
@@ -1796,6 +1795,8 @@ void __exit exit_ni_gpib_cs(void)
 	pcmcia_unregister_driver(&ni_gpib_cs_driver);
 }
 
+static const int pcmcia_gpib_iosize = 32;
+
 int ni_pcmcia_attach(gpib_board_t *board, const gpib_board_config_t *config)
 {
 	struct local_info_t *info;
diff --git a/drivers/staging/gpib/uapi/gpib_user.h b/drivers/staging/gpib/uapi/gpib_user.h
index 4348bb69c933..0896a55a758f 100644
--- a/drivers/staging/gpib/uapi/gpib_user.h
+++ b/drivers/staging/gpib/uapi/gpib_user.h
@@ -46,12 +46,12 @@ enum ibsta_bits {
 	SRQI = (1 << SRQI_NUM),	/* SRQ is asserted */
 	END = (1 << END_NUM),	/* EOI or EOS encountered */
 	TIMO = (1 << TIMO_NUM),	/* Time limit on I/O or wait function exceeded */
-	ERR = (1 << ERR_NUM)	/* Function call terminated on error */
-};
+	ERR = (1 << ERR_NUM),	/* Function call terminated on error */
 
-static const int device_status_mask = ERR | TIMO | END | CMPL | RQS;
-static const int board_status_mask = ERR | TIMO | END | CMPL | SPOLL |
-	EVENT | LOK | REM | CIC | ATN | TACS | LACS | DTAS | DCAS | SRQI;
+	device_status_mask = ERR | TIMO | END | CMPL | RQS,
+	board_status_mask = ERR | TIMO | END | CMPL | SPOLL |
+		EVENT | LOK | REM | CIC | ATN | TACS | LACS | DTAS | DCAS | SRQI,
+};
 
 /* IBERR error codes */
 enum iberr_code {
@@ -209,7 +209,9 @@ static inline uint8_t CFGn(unsigned int meters)
 }
 
 /* mask of bits that actually matter in a command byte */
-static const uint8_t gpib_command_mask = 0x7f;
+enum {
+	gpib_command_mask = 0x7f,
+};
 
 static inline int is_PPE(uint8_t command)
 {
@@ -261,8 +263,6 @@ static inline int gpib_address_equal(unsigned int pad1, int sad1, unsigned int p
 	return 0;
 }
 
-static const int gpib_addr_max = 30;	/* max address for primary/secondary gpib addresses */
-
 enum ibask_option {
 	IbaPAD = 0x1,
 	IbaSAD = 0x2,
@@ -341,7 +341,9 @@ enum t1_delays {
 	T1_DELAY_350ns = 3
 };
 
-static const int request_service_bit = 0x40;
+enum {
+	request_service_bit = 0x40,
+};
 
 enum gpib_events {
 	EventNone = 0,
-- 
2.39.5

