Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF24202F98
	for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 11:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729077335; cv=none; b=RTJsItWgF0spZYnXoXsNc03B2vO6HkqQ1lL5K/JhVjRsbwkFj5gL6R5J/U2iL2YMIOiH96KqqQ1EBJE3YBpIaocbw65me/r6z+E2tHVf9A5+cDgTe1uFMMFtV0aGjh4WM1OBGKT8uZLLDLXHQakWTp0cT0L4ADIrQr8YA+QHQqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729077335; c=relaxed/simple;
	bh=t8eojDsXCHwHNEu7niFjOvPSJrpXcO/pZqjiMbz3/vY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EnYAhRnK0rP9qEbOh62HWpExwD7759PXbrX4B21qyaIYn9RFCwvC2hf6gZyq8YhpXeKCTgQtPbyHpIJEq9CxAsf/BCxQqfg4aiFqwBEUXtuhC9shV7MZYIBMq1/d2v94DcI5fz+ViObFfq8PqfzqOe7CYVmYboPQqeu46bXzJ/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z7svvW/Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z7svvW/Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2579FC4CECD;
	Wed, 16 Oct 2024 11:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729077335;
	bh=t8eojDsXCHwHNEu7niFjOvPSJrpXcO/pZqjiMbz3/vY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z7svvW/Z1Pxwkriv4hLbxb0zjXPA9Nd6daQwf1L/o614rNJmwgWkXTk/uI1BK10yw
	 gW/2gBZe8d3iJFoY1NhkDCGvbsCztnnHXxAhvXc1k0oDq9SoyFZFco35EvE7b/8KbD
	 qhsFqWdwwMO2p8TyLYHuLz4JuVQls8D8MHUf6ykSVcYbgy0u1yWoQDvHLhpDJpWJp4
	 oJVnH7loOoSrAaiQcqZ174uXzXwlcjdfeKBMF13V0qtcngcqiIScgsYcJWR87b8yep
	 3rUwDat8X7CMHjltWFyBDr0Xihxub8+8AyYNYqWypFzqOAyBl6C5pRSQl8mmln0+S5
	 inUqPSEy6mwJA==
From: Arnd Bergmann <arnd@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Penkler <dpenkler@gmail.com>
Cc: linux-staging@lists.linux.dev,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 4/7] staging: gpib: make port I/O code conditional
Date: Wed, 16 Oct 2024 11:15:18 +0000
Message-Id: <20241016111521.1143191-5-arnd@kernel.org>
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

A few of the helper modules contain functions for both IORESOURCE_MEM
and IORESOURCE_IO type access, with the latter not being supported
on all architectures but also not used by all the drivers.

Add #ifdef checks around these to allow building the library code
and use it on MMIO-only configurations.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/staging/gpib/common/gpib_os.c  |  2 ++
 drivers/staging/gpib/nec7210/nec7210.c | 38 ++++++++++++++------------
 drivers/staging/gpib/tms9914/tms9914.c |  2 ++
 3 files changed, 24 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index e9dd7b2d1569..e93a45132a40 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -140,6 +140,7 @@ unsigned int readw_wrapper(void *address)
 };
 EXPORT_SYMBOL(readw_wrapper);
 
+#ifdef CONFIG_HAS_IOPORT
 void outb_wrapper(unsigned int value, void *address)
 {
 	outb(value, (unsigned long)(address));
@@ -163,6 +164,7 @@ unsigned int inw_wrapper(void *address)
 	return inw((unsigned long)(address));
 };
 EXPORT_SYMBOL(inw_wrapper);
+#endif
 
 /* this is a function instead of a constant because of Suse
  * defining HZ to be a function call to get_hz()
diff --git a/drivers/staging/gpib/nec7210/nec7210.c b/drivers/staging/gpib/nec7210/nec7210.c
index 632322799ed2..1330743d05fd 100644
--- a/drivers/staging/gpib/nec7210/nec7210.c
+++ b/drivers/staging/gpib/nec7210/nec7210.c
@@ -1031,6 +1031,7 @@ void nec7210_board_online(struct nec7210_priv *priv, const gpib_board_t *board)
 }
 EXPORT_SYMBOL(nec7210_board_online);
 
+#ifdef CONFIG_HAS_IOPORT
 /* wrappers for io */
 uint8_t nec7210_ioport_read_byte(struct nec7210_priv *priv, unsigned int register_num)
 {
@@ -1050,24 +1051,6 @@ void nec7210_ioport_write_byte(struct nec7210_priv *priv, uint8_t data, unsigned
 }
 EXPORT_SYMBOL(nec7210_ioport_write_byte);
 
-uint8_t nec7210_iomem_read_byte(struct nec7210_priv *priv, unsigned int register_num)
-{
-	return readb(priv->iobase + register_num * priv->offset);
-}
-EXPORT_SYMBOL(nec7210_iomem_read_byte);
-
-void nec7210_iomem_write_byte(struct nec7210_priv *priv, uint8_t data, unsigned int register_num)
-{
-	if (register_num == AUXMR)
-		/* locking makes absolutely sure noone accesses the
-		 * AUXMR register faster than once per microsecond
-		 */
-		nec7210_locking_iomem_write_byte(priv, data, register_num);
-	else
-		writeb(data, priv->iobase + register_num * priv->offset);
-}
-EXPORT_SYMBOL(nec7210_iomem_write_byte);
-
 /* locking variants of io wrappers, for chips that page-in registers */
 uint8_t nec7210_locking_ioport_read_byte(struct nec7210_priv *priv, unsigned int register_num)
 {
@@ -1093,6 +1076,25 @@ void nec7210_locking_ioport_write_byte(struct nec7210_priv *priv, uint8_t data,
 	spin_unlock_irqrestore(&priv->register_page_lock, flags);
 }
 EXPORT_SYMBOL(nec7210_locking_ioport_write_byte);
+#endif
+
+uint8_t nec7210_iomem_read_byte(struct nec7210_priv *priv, unsigned int register_num)
+{
+	return readb(priv->iobase + register_num * priv->offset);
+}
+EXPORT_SYMBOL(nec7210_iomem_read_byte);
+
+void nec7210_iomem_write_byte(struct nec7210_priv *priv, uint8_t data, unsigned int register_num)
+{
+	if (register_num == AUXMR)
+		/* locking makes absolutely sure noone accesses the
+		 * AUXMR register faster than once per microsecond
+		 */
+		nec7210_locking_iomem_write_byte(priv, data, register_num);
+	else
+		writeb(data, priv->iobase + register_num * priv->offset);
+}
+EXPORT_SYMBOL(nec7210_iomem_write_byte);
 
 uint8_t nec7210_locking_iomem_read_byte(struct nec7210_priv *priv, unsigned int register_num)
 {
diff --git a/drivers/staging/gpib/tms9914/tms9914.c b/drivers/staging/gpib/tms9914/tms9914.c
index a85a796de024..b4a8ab55c5ec 100644
--- a/drivers/staging/gpib/tms9914/tms9914.c
+++ b/drivers/staging/gpib/tms9914/tms9914.c
@@ -862,6 +862,7 @@ void tms9914_online(gpib_board_t *board, struct tms9914_priv *priv)
 }
 EXPORT_SYMBOL_GPL(tms9914_online);
 
+#ifdef CONFIG_HAS_IOPORT
 // wrapper for inb
 uint8_t tms9914_ioport_read_byte(struct tms9914_priv *priv, unsigned int register_num)
 {
@@ -877,6 +878,7 @@ void tms9914_ioport_write_byte(struct tms9914_priv *priv, uint8_t data, unsigned
 		udelay(1);
 }
 EXPORT_SYMBOL_GPL(tms9914_ioport_write_byte);
+#endif
 
 // wrapper for readb
 uint8_t tms9914_iomem_read_byte(struct tms9914_priv *priv, unsigned int register_num)
-- 
2.39.5

