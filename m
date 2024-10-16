Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A77207209
	for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 11:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729077331; cv=none; b=YPJcPQlmmPgYrle8tk/uYuUXmqBOH3uERf8ao5Eg/y3P6Z70nl68YuUvMAi5S569N7UNRWrB6pieGGNUFnxNhUFMYfSPeQg/BL95vuHOUTA7n8GNaTEJn7u4fzXdHIGZaqx+hRNCTnnREeRNXC7L0ZL/JfuoNU13YJN2j01LDBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729077331; c=relaxed/simple;
	bh=m/uk+7smZSyuTFM0Il9a3c+5rwTPGgk875g4G4nmmeo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CnYFb523g23osqWmf/Da3pggBzxmT5Hb693Tp5v7AuoUpmR9zo/ljNl2WfxiP7z7hwsQXG406Dcwp3HMtfK1CaKwGFEDCtY795W+jQVBN3kZGZE0srcwo7b5TEJTXrgf2dYF+JZcvVhqleZdBLxYE7kbRIcvA/6zN9ZCBWKpU5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n/6NqgxX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n/6NqgxX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83F10C4CECD;
	Wed, 16 Oct 2024 11:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729077330;
	bh=m/uk+7smZSyuTFM0Il9a3c+5rwTPGgk875g4G4nmmeo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n/6NqgxXDraZP1jy8LgibcZqdmEAy76LR8NTtVWXEawlXRxpdq0AkgTqo2S7VU6BB
	 kekCdEl7B8L/MfvbCXosiduuQw25sEHLWIrYG8jIc+3QlSl7dT7725CAlbf/+TUEJJ
	 M9x+dvxUZQqXd0lal5ZuP6SW5poQ8Us5DwfKl7OFrvvm16idFSTeI464U++m1xhn4T
	 wZeG/121LjMQmBZkzpZHKCK9Y73ZRjMor7EFgEwMVdAOGQZVUqvAngBkeoqtlkSm2q
	 OPzX8EDSn3pUB4p/wMdWrdK4PBCoj1qMw968sbRPP9AJNdatm7bHotju5NGwGe+ksY
	 lXWwEcx0MrA7A==
From: Arnd Bergmann <arnd@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Penkler <dpenkler@gmail.com>
Cc: linux-staging@lists.linux.dev,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 1/7] staging: gpib: add module descriptions
Date: Wed, 16 Oct 2024 11:15:15 +0000
Message-Id: <20241016111521.1143191-2-arnd@kernel.org>
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

Every loadable module should have a description, and not having one
causes a W=1 build warning, so add these to the newly added modules.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/staging/gpib/agilent_82350b/agilent_82350b.c | 1 +
 drivers/staging/gpib/agilent_82357a/agilent_82357a.c | 1 +
 drivers/staging/gpib/cb7210/cb7210.c                 | 1 +
 drivers/staging/gpib/cec/cec_gpib.c                  | 1 +
 drivers/staging/gpib/common/gpib_os.c                | 1 +
 drivers/staging/gpib/eastwood/fluke_gpib.c           | 1 +
 drivers/staging/gpib/gpio/gpib_bitbang.c             | 1 +
 drivers/staging/gpib/hp_82335/hp82335.c              | 1 +
 drivers/staging/gpib/ines/ines_gpib.c                | 1 +
 drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c   | 1 +
 drivers/staging/gpib/nec7210/nec7210.c               | 1 +
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c            | 1 +
 drivers/staging/gpib/pc2/pc2_gpib.c                  | 1 +
 drivers/staging/gpib/tms9914/tms9914.c               | 1 +
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c          | 1 +
 15 files changed, 15 insertions(+)

diff --git a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
index 1296db4d47c6..3ed5ee91d5f1 100644
--- a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
+++ b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
@@ -18,6 +18,7 @@
 #include <linux/wait.h>
 
 MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("GPIB driver for Agilent 82350b");
 
 int agilent_82350b_accel_read(gpib_board_t *board, uint8_t *buffer, size_t length, int *end,
 			      size_t *bytes_read)
diff --git a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
index bbc7e8866872..53ec10729905 100644
--- a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
+++ b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
@@ -15,6 +15,7 @@
 #include "tms9914.h"
 
 MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("GPIB driver for Agilent 82357A/B usb adapter");
 
 #define MAX_NUM_82357A_INTERFACES 128
 static struct usb_interface *agilent_82357a_driver_interfaces[MAX_NUM_82357A_INTERFACES];
diff --git a/drivers/staging/gpib/cb7210/cb7210.c b/drivers/staging/gpib/cb7210/cb7210.c
index 59f6dde3d966..36fdfd97133e 100644
--- a/drivers/staging/gpib/cb7210/cb7210.c
+++ b/drivers/staging/gpib/cb7210/cb7210.c
@@ -21,6 +21,7 @@
 #include "quancom_pci.h"
 
 MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("GPIB driver Measurement Computing boards using cb7210.2 and cbi488.2");
 
 static inline int have_fifo_word(const struct cb7210_priv *cb_priv)
 {
diff --git a/drivers/staging/gpib/cec/cec_gpib.c b/drivers/staging/gpib/cec/cec_gpib.c
index 692bf98b37e2..3dc933deb401 100644
--- a/drivers/staging/gpib/cec/cec_gpib.c
+++ b/drivers/staging/gpib/cec/cec_gpib.c
@@ -13,6 +13,7 @@
 #include <linux/slab.h>
 
 MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("GPIB driver for CEC PCI and PCMCIA boards");
 
 /*
  * GPIB interrupt service routines
diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index d5860a0a131f..01efe99adeb3 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -20,6 +20,7 @@
 #include <linux/uaccess.h>
 
 MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("GPIB base support");
 MODULE_ALIAS_CHARDEV_MAJOR(GPIB_CODE);
 
 static int board_type_ioctl(gpib_file_private_t *file_priv, gpib_board_t *board, unsigned long arg);
diff --git a/drivers/staging/gpib/eastwood/fluke_gpib.c b/drivers/staging/gpib/eastwood/fluke_gpib.c
index f9f149db222d..651d73e1533a 100644
--- a/drivers/staging/gpib/eastwood/fluke_gpib.c
+++ b/drivers/staging/gpib/eastwood/fluke_gpib.c
@@ -18,6 +18,7 @@
 #include <linux/slab.h>
 
 MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("GPIB Driver for Fluke cda devices");
 
 static int fluke_attach_holdoff_all(gpib_board_t *board, const gpib_board_config_t *config);
 static int fluke_attach_holdoff_end(gpib_board_t *board, const gpib_board_config_t *config);
diff --git a/drivers/staging/gpib/gpio/gpib_bitbang.c b/drivers/staging/gpib/gpio/gpib_bitbang.c
index 81a952beee0d..ca079070ce97 100644
--- a/drivers/staging/gpib/gpio/gpib_bitbang.c
+++ b/drivers/staging/gpib/gpio/gpib_bitbang.c
@@ -368,6 +368,7 @@ static inline void SET_DIR_READ(struct bb_priv *priv);
 #define DIR_WRITE 1
 
 MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("GPIB helper functions for bitbanging I/O");
 
 /****  global variables	 ****/
 #ifdef CONFIG_GPIB_DEBUG
diff --git a/drivers/staging/gpib/hp_82335/hp82335.c b/drivers/staging/gpib/hp_82335/hp82335.c
index 4e277997684b..a7b1634f96e8 100644
--- a/drivers/staging/gpib/hp_82335/hp82335.c
+++ b/drivers/staging/gpib/hp_82335/hp82335.c
@@ -17,6 +17,7 @@
 #include <linux/init.h>
 
 MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("GPIB driver for HP 82335 interface cards");
 
 static int hp82335_attach(gpib_board_t *board, const gpib_board_config_t *config);
 
diff --git a/drivers/staging/gpib/ines/ines_gpib.c b/drivers/staging/gpib/ines/ines_gpib.c
index 9dbbdb048b9f..1e43fab32eaf 100644
--- a/drivers/staging/gpib/ines/ines_gpib.c
+++ b/drivers/staging/gpib/ines/ines_gpib.c
@@ -19,6 +19,7 @@
 #include "gpib_pci_ids.h"
 
 MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("GPIB driver for Ines iGPIB 72010");
 
 int ines_line_status(const gpib_board_t *board)
 {
diff --git a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
index aa7af352e709..2a8f127de427 100644
--- a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
+++ b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
@@ -31,6 +31,7 @@
 #include "gpibP.h"
 
 MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("GPIB driver for LPVO usb devices");
 
 #define NAME "lpvo_usb_gpib"
 
diff --git a/drivers/staging/gpib/nec7210/nec7210.c b/drivers/staging/gpib/nec7210/nec7210.c
index 5c27185b97b0..632322799ed2 100644
--- a/drivers/staging/gpib/nec7210/nec7210.c
+++ b/drivers/staging/gpib/nec7210/nec7210.c
@@ -19,6 +19,7 @@
 #include <linux/delay.h>
 
 MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("GPIB library code for NEC uPD7210");
 
 int nec7210_enable_eos(gpib_board_t *board, struct nec7210_priv *priv, uint8_t eos_byte,
 		       int compare_8_bits)
diff --git a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
index 1da263676f2a..b42a8d5cd05f 100644
--- a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
+++ b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
@@ -14,6 +14,7 @@
 #include "tnt4882_registers.h"
 
 MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("GPIB driver for National Instruments USB devices");
 
 #define MAX_NUM_NI_USB_INTERFACES 128
 static struct usb_interface *ni_usb_driver_interfaces[MAX_NUM_NI_USB_INTERFACES];
diff --git a/drivers/staging/gpib/pc2/pc2_gpib.c b/drivers/staging/gpib/pc2/pc2_gpib.c
index 1a4480e4b668..cd70cedb4899 100644
--- a/drivers/staging/gpib/pc2/pc2_gpib.c
+++ b/drivers/staging/gpib/pc2/pc2_gpib.c
@@ -47,6 +47,7 @@ static inline unsigned int CLEAR_INTR_REG(unsigned int irq)
 }
 
 MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("GPIB driver for PC2/PC2a and compatible devices");
 
 static int pc2_attach(gpib_board_t *board, const gpib_board_config_t *config);
 static int pc2a_attach(gpib_board_t *board, const gpib_board_config_t *config);
diff --git a/drivers/staging/gpib/tms9914/tms9914.c b/drivers/staging/gpib/tms9914/tms9914.c
index aa2308cf5477..052d5e3acc91 100644
--- a/drivers/staging/gpib/tms9914/tms9914.c
+++ b/drivers/staging/gpib/tms9914/tms9914.c
@@ -22,6 +22,7 @@
 #include "tms9914.h"
 
 MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("GPIB library for tms9914");
 
 static unsigned int update_status_nolock(gpib_board_t *board, struct tms9914_priv *priv);
 
diff --git a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
index ef4b9ce36741..f14d3ce937ba 100644
--- a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
+++ b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
@@ -191,6 +191,7 @@ static inline void tnt_writeb(struct tnt4882_priv *priv, unsigned short value, u
 }
 
 MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("GPIB driver for National Instruments boards using tnt4882 or compatible chips");
 
 int tnt4882_line_status(const gpib_board_t *board)
 {
-- 
2.39.5

