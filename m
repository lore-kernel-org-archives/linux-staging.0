Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B872F2B
	for <linux-staging@lists.linux.dev>; Fri,  4 Feb 2022 08:04:38 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id z5so4482024plg.8
        for <linux-staging@lists.linux.dev>; Fri, 04 Feb 2022 00:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to;
        bh=9akPYn9foeJJwkENSEH/4ySJpRDetAUi4tiFjpoRVKg=;
        b=WBfeSZ+C4dC8PkAYMHkX60qEBh+C3r6oT7XU83Sj6WSpkSIB6+yFU5gIxJL2MyiNtC
         1SEfJHj4YKUTEqLnOvHB7IfuWZFStA5CKX+ccD5dtW+2t74Czl4GaWMitZsuH4/yU14r
         Awo8Da3X+xZPvM4gE+6WFO5sdZ/5x3tYjX3ITxcL5lXhrDloSISvA0kcdm3P5FwzLVQ7
         SSZYp8QhXMmrRniYx6+NdFRCsBRfr9evego78UAn/VEOHtne23dIxfNEvWPCE3KSXZjK
         HpKIm6atkWnndObmaX/PuS3pMTssOky7itCJGXbTpzbZOhrkFCTcyCXeQ7c/Yss76fpO
         V3mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to;
        bh=9akPYn9foeJJwkENSEH/4ySJpRDetAUi4tiFjpoRVKg=;
        b=rbn9crUe1Dx2KUdtH3tIWGiLxcJkarfkSN9c1EuPVuMZUQopCDOsIiCUbU308A3p/G
         Q42m7A+i+CobeiNyzCL3zDlldRlyXBrCZiyF7WcMiLZofX/+SjzVRCHjcyLeznXDAF1d
         sEwRkHCsgwaS/hf2osWgLJE5IyTTJpwPxFkXeOYMTbWTiJEHlv52xCZc/N2TJF2gKzhW
         bCmegYJm2oi4COdLMcHkAN7diNOmw3xKDzKDx/S9WDCjSoPOVtR43xiyjI38k6ThC6qe
         Ha1aH6dScD1daNCZlvh0ND9wjeVdx07hmqvSTfxugRZakKRm71ZmAqqKXUrCZWzRxZe2
         nylQ==
X-Gm-Message-State: AOAM530VVuicb4e4mt0PJc2BeLeHOmLsfski6tyl/BKAVwz2vth4x2/J
	IAz23alO8L2UmPKNurhLsu8=
X-Google-Smtp-Source: ABdhPJxxtdpm4bOc+eZtpdEJ/tiq5hMmF4Trugx8gVE+XScxR6Nf/lfO35tY/zyqGwt2NJ4XbU59Yw==
X-Received: by 2002:a17:90b:4a85:: with SMTP id lp5mr1843609pjb.25.1643961878009;
        Fri, 04 Feb 2022 00:04:38 -0800 (PST)
Received: from mail.google.com (122-58-164-114-fibre.sparkbb.co.nz. [122.58.164.114])
        by smtp.gmail.com with ESMTPSA id 197sm1423750pfz.152.2022.02.04.00.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 00:04:37 -0800 (PST)
Date: Fri, 4 Feb 2022 21:04:32 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: gregkh@linuxfoundation.org, paulo.miguel.almeida.rodenas@gmail.com,
	realwakka@gmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v5] staging: pi433: add debugfs interface
Message-ID: <YfzeEHJcd+qvYGZ8@mail.google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yfy0QSxL+3lbPlLK@mail.google.com>

This adds debugfs interface that can be used for debugging possible
hardware/software issues.

It currently exposes the following debugfs entries for each SPI device
probed:

  /sys/kernel/debug/pi433/<DEVICE>/regs
  ...

The 'regs' file contains all rf69 uC registers values that are useful
for troubleshooting misconfigurations between 2 devices. It contains one
register per line so it should be easy to use normal filtering tools to
find the registers of interest if needed.

Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
---
Changelog:

v5: I had mistakenly forgotten to git add changes to the rf69.(c|h) in
    the previous patch
v4: remove unnecessary variable initializer, ensure mutex locks are
        released before returning from routine. Req: Dan Carpenter
v3: fix build error, remove redundant comments and validate return values
        from wait_event_interruptible routines: Req: Greg K-h, Dan Carpenter
v2: remove redudant references to dentry pointers in the code and perform
     debugsfs_lookup instead. Req: Greg k-h
v1: https://lore.kernel.org/lkml/20220123073855.GA79453@mail.google.com/
---
drivers/staging/pi433/pi433_if.c | 76 ++++++++++++++++++++++++++++++++
 drivers/staging/pi433/rf69.c     |  2 +-
 drivers/staging/pi433/rf69.h     |  1 +
 3 files changed, 78 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/pi433/pi433_if.c b/drivers/staging/pi433/pi433_if.c
index 86ad497417f7..4fbac3ccef74 100644
--- a/drivers/staging/pi433/pi433_if.c
+++ b/drivers/staging/pi433/pi433_if.c
@@ -41,6 +41,8 @@
 #ifdef CONFIG_COMPAT
 #include <linux/compat.h>
 #endif
+#include <linux/debugfs.h>
+#include <linux/seq_file.h>
 
 #include "pi433_if.h"
 #include "rf69.h"
@@ -1098,12 +1100,76 @@ static const struct file_operations pi433_fops = {
 	.llseek =	no_llseek,
 };
 
+static int pi433_debugfs_regs_show(struct seq_file *m, void *p)
+{
+	struct pi433_device *dev;
+	u8 reg_data[114];
+	int i;
+	char *fmt = "0x%02x, 0x%02x\n";
+	int ret;
+
+	dev = m->private;
+
+	mutex_lock(&dev->tx_fifo_lock);
+	mutex_lock(&dev->rx_lock);
+
+	// wait for on-going operations to finish
+	ret = wait_event_interruptible(dev->rx_wait_queue, !dev->tx_active);
+	if (ret)
+		goto out_unlock;
+
+	ret = wait_event_interruptible(dev->tx_wait_queue, !dev->rx_active);
+	if (ret)
+		goto out_unlock;
+
+	// skip FIFO register (0x0) otherwise this can affect some of uC ops
+	for (i = 1; i < 0x50; i++)
+		reg_data[i] = rf69_read_reg(dev->spi, i);
+
+	reg_data[REG_TESTLNA] = rf69_read_reg(dev->spi, REG_TESTLNA);
+	reg_data[REG_TESTPA1] = rf69_read_reg(dev->spi, REG_TESTPA1);
+	reg_data[REG_TESTPA2] = rf69_read_reg(dev->spi, REG_TESTPA2);
+	reg_data[REG_TESTDAGC] = rf69_read_reg(dev->spi, REG_TESTDAGC);
+	reg_data[REG_TESTAFC] = rf69_read_reg(dev->spi, REG_TESTAFC);
+
+	seq_puts(m, "# reg, val\n");
+
+	for (i = 1; i < 0x50; i++)
+		seq_printf(m, fmt, i, reg_data[i]);
+
+	seq_printf(m, fmt, REG_TESTLNA, reg_data[REG_TESTLNA]);
+	seq_printf(m, fmt, REG_TESTPA1, reg_data[REG_TESTPA1]);
+	seq_printf(m, fmt, REG_TESTPA2, reg_data[REG_TESTPA2]);
+	seq_printf(m, fmt, REG_TESTDAGC, reg_data[REG_TESTDAGC]);
+	seq_printf(m, fmt, REG_TESTAFC, reg_data[REG_TESTAFC]);
+
+out_unlock:
+	mutex_unlock(&dev->rx_lock);
+	mutex_unlock(&dev->tx_fifo_lock);
+
+	return ret;
+}
+
+static int pi433_debugfs_regs_open(struct inode *inode, struct file *filp)
+{
+	return single_open(filp, pi433_debugfs_regs_show, inode->i_private);
+}
+
+static const struct file_operations debugfs_fops = {
+	.llseek =	seq_lseek,
+	.open =		pi433_debugfs_regs_open,
+	.owner =	THIS_MODULE,
+	.read =		seq_read,
+	.release =	single_release
+};
+
 /*-------------------------------------------------------------------------*/
 
 static int pi433_probe(struct spi_device *spi)
 {
 	struct pi433_device	*device;
 	int			retval;
+	struct dentry		*entry;
 
 	/* setup spi parameters */
 	spi->mode = 0x00;
@@ -1252,6 +1318,10 @@ static int pi433_probe(struct spi_device *spi)
 	/* spi setup */
 	spi_set_drvdata(spi, device);
 
+	entry = debugfs_create_dir(dev_name(device->dev),
+				   debugfs_lookup(KBUILD_MODNAME, NULL));
+	debugfs_create_file("regs", 0400, entry, device, &debugfs_fops);
+
 	return 0;
 
 del_cdev:
@@ -1275,6 +1345,9 @@ static int pi433_probe(struct spi_device *spi)
 static int pi433_remove(struct spi_device *spi)
 {
 	struct pi433_device	*device = spi_get_drvdata(spi);
+	struct dentry *mod_entry = debugfs_lookup(KBUILD_MODNAME, NULL);
+
+	debugfs_remove(debugfs_lookup(dev_name(device->dev), mod_entry));
 
 	/* free GPIOs */
 	free_gpio(device);
@@ -1349,6 +1422,8 @@ static int __init pi433_init(void)
 		return PTR_ERR(pi433_class);
 	}
 
+	debugfs_create_dir(KBUILD_MODNAME, NULL);
+
 	status = spi_register_driver(&pi433_spi_driver);
 	if (status < 0) {
 		class_destroy(pi433_class);
@@ -1366,6 +1441,7 @@ static void __exit pi433_exit(void)
 	spi_unregister_driver(&pi433_spi_driver);
 	class_destroy(pi433_class);
 	unregister_chrdev(MAJOR(pi433_dev), pi433_spi_driver.driver.name);
+	debugfs_remove_recursive(debugfs_lookup(KBUILD_MODNAME, NULL));
 }
 module_exit(pi433_exit);
 
diff --git a/drivers/staging/pi433/rf69.c b/drivers/staging/pi433/rf69.c
index c68ad4809e91..2ab3bf46e37d 100644
--- a/drivers/staging/pi433/rf69.c
+++ b/drivers/staging/pi433/rf69.c
@@ -24,7 +24,7 @@
 
 /*-------------------------------------------------------------------------*/
 
-static u8 rf69_read_reg(struct spi_device *spi, u8 addr)
+u8 rf69_read_reg(struct spi_device *spi, u8 addr)
 {
 	int retval;
 
diff --git a/drivers/staging/pi433/rf69.h b/drivers/staging/pi433/rf69.h
index c25942f142a6..3ff5609ecf2e 100644
--- a/drivers/staging/pi433/rf69.h
+++ b/drivers/staging/pi433/rf69.h
@@ -17,6 +17,7 @@
 #define FIFO_SIZE	66		/* bytes */
 #define FIFO_THRESHOLD	15		/* bytes */
 
+u8 rf69_read_reg(struct spi_device *spi, u8 addr);
 int rf69_get_version(struct spi_device *spi);
 int rf69_set_mode(struct spi_device *spi, enum mode mode);
 int rf69_set_data_mode(struct spi_device *spi, u8 data_mode);
-- 
2.34.1

