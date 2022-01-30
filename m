Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1C029CA
	for <linux-staging@lists.linux.dev>; Sun, 30 Jan 2022 06:18:32 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id e6so9981727pfc.7
        for <linux-staging@lists.linux.dev>; Sat, 29 Jan 2022 22:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=dG/QvFD37vEgjdhgbYhQHvG7sBh/ORqBt6k3eWpPNz8=;
        b=iVpd4MAQaStY9YlHc2qfS2XoQrwbhnGeJyMctD/8nVc1lg35dUM4JV/gm27ARp8v/5
         WBD56CnXVjYUDTXrZ0gXVPByNL0vNR9BDo3Wx5HCehj3Dis7c4gp2rkNxR0NTAfLbwXq
         +WFRClTv6qr+AedSQ2WdGs3X4T3vEoKQ4CXxLr23veNc5cRijSkh9oBfjo50a3LC6dON
         +5DZgOX64gt4sua3dKwhkMUy9cSJcndkaO9LdPeczWkLhtI0f5nLYzwy+7tgorBFgyBl
         7WGUvJPP3uJnk9/HDl1cKS2a40E6nF6hEl5tstbfXWGVnhjpDxPSPzYQ311CQ4PKoaJi
         kN6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=dG/QvFD37vEgjdhgbYhQHvG7sBh/ORqBt6k3eWpPNz8=;
        b=R1mEFhrEpaoddNOrPgvd1rT/xmVviySn/19FKkIuyvW5hJKjKetwqmMWe5UAtTsB81
         8nsVBPb1qZa6D0f7MqDHOXmmpOgHCpZgMk5sOFfLecX8a54HxrpoH+VUMjyuHT1K0k/3
         ycAXFNPHkLf35s8xpYI8c9p1VzCufWXZs0FxxYEnD8ThrnQe2hnXuW59AJ2RQgRp8AKY
         0RwNI5rt4WwHznlvimuzy3kbHx2efA5gTgZSwLq/rjeLJeb5OY0qUUmzz1ELb738Q+dC
         qvgf/pLk7gRJQOHJE45EN0w2mgvlQbUPGmEiN49spXHACYPfRAqHvpGboxifWqUqrEij
         e/gg==
X-Gm-Message-State: AOAM533ZCdg8692shAh45XdoyD30iQfhXBuZaqTzj9M1ND/302DFIDou
	y18O51UTIRaoLfic6S4E1C4=
X-Google-Smtp-Source: ABdhPJx03navMcD0yp7qxY9skuhK1h5+0YZ3UdOXNcEWJO1eqWRhzv+TVQoYv3CJyMM0as1SMSzidA==
X-Received: by 2002:a63:6b8a:: with SMTP id g132mr12418880pgc.540.1643523512006;
        Sat, 29 Jan 2022 22:18:32 -0800 (PST)
Received: from mail.google.com (122-58-164-114-fibre.sparkbb.co.nz. [122.58.164.114])
        by smtp.gmail.com with ESMTPSA id c11sm8858051pgl.92.2022.01.29.22.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jan 2022 22:18:31 -0800 (PST)
Date: Sun, 30 Jan 2022 19:18:26 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: gregkh@linuxfoundation.org, paulo.miguel.almeida.rodenas@gmail.com,
	realwakka@gmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: pi433: remove unnecessary new line escape sequence
 characters
Message-ID: <YfYtsiKbOXghIN+5@mail.google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In this driver there were occurences of '\n'-ended strings when using
dev_dbg function which isn't required which most likely were leftovers
from a previous printk/pr_<level> implementation.

This patch removes the extraneous '\n' characters to make it consistent
with the other dev_dbg instances.

Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
---
Patch dependencies:

The following patches must be applied first given that changes are made
to the same set of files:

- https://lore.kernel.org/lkml/YfYdVokxsQ+Adl+T@mail.google.com/
- https://lore.kernel.org/lkml/YfX+llwDWZZMz+NY@mail.google.com/
---
 drivers/staging/pi433/pi433_if.c | 14 +++++++-------
 drivers/staging/pi433/rf69.c     | 16 ++++++++--------
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/pi433/pi433_if.c b/drivers/staging/pi433/pi433_if.c
index 02d4ccebf..db1b092e8 100644
--- a/drivers/staging/pi433/pi433_if.c
+++ b/drivers/staging/pi433/pi433_if.c
@@ -124,13 +124,13 @@ static irqreturn_t DIO0_irq_handler(int irq, void *dev_id)
 
 	if (device->irq_state[DIO0] == DIO_PACKET_SENT) {
 		device->free_in_fifo = FIFO_SIZE;
-		dev_dbg(device->dev, "DIO0 irq: Packet sent\n");
+		dev_dbg(device->dev, "DIO0 irq: Packet sent");
 		wake_up_interruptible(&device->fifo_wait_queue);
 	} else if (device->irq_state[DIO0] == DIO_RSSI_DIO0) {
-		dev_dbg(device->dev, "DIO0 irq: RSSI level over threshold\n");
+		dev_dbg(device->dev, "DIO0 irq: RSSI level over threshold");
 		wake_up_interruptible(&device->rx_wait_queue);
 	} else if (device->irq_state[DIO0] == DIO_PAYLOAD_READY) {
-		dev_dbg(device->dev, "DIO0 irq: Payload ready\n");
+		dev_dbg(device->dev, "DIO0 irq: Payload ready");
 		device->free_in_fifo = 0;
 		wake_up_interruptible(&device->fifo_wait_queue);
 	}
@@ -151,7 +151,7 @@ static irqreturn_t DIO1_irq_handler(int irq, void *dev_id)
 			device->free_in_fifo = FIFO_SIZE - FIFO_THRESHOLD - 1;
 	}
 	dev_dbg(device->dev,
-		"DIO1 irq: %d bytes free in fifo\n", device->free_in_fifo);
+		"DIO1 irq: %d bytes free in fifo", device->free_in_fifo);
 	wake_up_interruptible(&device->fifo_wait_queue);
 
 	return IRQ_HANDLED;
@@ -726,7 +726,7 @@ static int pi433_tx_thread(void *data)
 			retval = wait_event_interruptible(device->fifo_wait_queue,
 							  device->free_in_fifo > 0);
 			if (retval) {
-				dev_dbg(device->dev, "ABORT\n");
+				dev_dbg(device->dev, "ABORT");
 				goto abort;
 			}
 		}
@@ -1180,7 +1180,7 @@ static int pi433_probe(struct spi_device *spi)
 
 	retval = spi_setup(spi);
 	if (retval) {
-		dev_dbg(&spi->dev, "configuration of SPI interface failed!\n");
+		dev_dbg(&spi->dev, "configuration of SPI interface failed!");
 		return retval;
 	}
 
@@ -1283,7 +1283,7 @@ static int pi433_probe(struct spi_device *spi)
 		goto device_create_failed;
 	} else {
 		dev_dbg(device->dev,
-			"created device for major %d, minor %d\n",
+			"created device for major %d, minor %d",
 			MAJOR(pi433_dev),
 			device->minor);
 	}
diff --git a/drivers/staging/pi433/rf69.c b/drivers/staging/pi433/rf69.c
index 2ab3bf46e..9a8f93fd7 100644
--- a/drivers/staging/pi433/rf69.c
+++ b/drivers/staging/pi433/rf69.c
@@ -37,9 +37,9 @@ u8 rf69_read_reg(struct spi_device *spi, u8 addr)
 		 * that module is connected. Therefore no error
 		 * handling, just an optional error message...
 		 */
-		dev_dbg(&spi->dev, "read 0x%x FAILED\n", addr);
+		dev_dbg(&spi->dev, "read 0x%x FAILED", addr);
 	else
-		dev_dbg(&spi->dev, "read 0x%x from reg 0x%x\n", retval, addr);
+		dev_dbg(&spi->dev, "read 0x%x from reg 0x%x", retval, addr);
 #endif
 
 	return retval;
@@ -62,9 +62,9 @@ static int rf69_write_reg(struct spi_device *spi, u8 addr, u8 value)
 		 * that module is connected. Therefore no error
 		 * handling, just an optional error message...
 		 */
-		dev_dbg(&spi->dev, "write 0x%x to 0x%x FAILED\n", value, addr);
+		dev_dbg(&spi->dev, "write 0x%x to 0x%x FAILED", value, addr);
 	else
-		dev_dbg(&spi->dev, "wrote 0x%x to reg 0x%x\n", value, addr);
+		dev_dbg(&spi->dev, "wrote 0x%x to reg 0x%x", value, addr);
 #endif
 
 	return retval;
@@ -870,7 +870,7 @@ int rf69_read_fifo(struct spi_device *spi, u8 *buffer, unsigned int size)
 
 	if (size > FIFO_SIZE) {
 		dev_dbg(&spi->dev,
-			"read fifo: passed in buffer bigger then internal buffer\n");
+			"read fifo: passed in buffer bigger then internal buffer");
 		return -EMSGSIZE;
 	}
 
@@ -885,7 +885,7 @@ int rf69_read_fifo(struct spi_device *spi, u8 *buffer, unsigned int size)
 
 #ifdef DEBUG_FIFO_ACCESS
 	for (i = 0; i < size; i++)
-		dev_dbg(&spi->dev, "%d - 0x%x\n", i, local_buffer[i + 1]);
+		dev_dbg(&spi->dev, "%d - 0x%x", i, local_buffer[i + 1]);
 #endif
 
 	memcpy(buffer, &local_buffer[1], size);
@@ -902,7 +902,7 @@ int rf69_write_fifo(struct spi_device *spi, u8 *buffer, unsigned int size)
 
 	if (size > FIFO_SIZE) {
 		dev_dbg(&spi->dev,
-			"read fifo: passed in buffer bigger then internal buffer\n");
+			"read fifo: passed in buffer bigger then internal buffer");
 		return -EMSGSIZE;
 	}
 
@@ -911,7 +911,7 @@ int rf69_write_fifo(struct spi_device *spi, u8 *buffer, unsigned int size)
 
 #ifdef DEBUG_FIFO_ACCESS
 	for (i = 0; i < size; i++)
-		dev_dbg(&spi->dev, "0x%x\n", buffer[i]);
+		dev_dbg(&spi->dev, "0x%x", buffer[i]);
 #endif
 
 	return spi_write(spi, local_buffer, size + 1);
-- 
2.34.1

