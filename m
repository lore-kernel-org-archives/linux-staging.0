Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C641272
	for <linux-staging@lists.linux.dev>; Thu, 23 Sep 2021 07:31:29 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id me1so3836141pjb.4
        for <linux-staging@lists.linux.dev>; Thu, 23 Sep 2021 00:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S0bJ8PVow7mAR7edomoeT/pRcZv2URWivCPDRIDgXaY=;
        b=XDb7RW3JQSrJM0tS4veUbCULYZXvGiWG8V9aJEuBODFGeqz1NQBKtgEONVOVv6670q
         87NTnqMeZ2umfgKj4Oc8CZbaJ4n52orvYXLKlJI06aZ7j4HFfXyhRrxkb7E6BWsPnA37
         R3h7XU0dzsvYQ0ghVCdnLJ1r9pn9PLu031x2j1SM6jEJRihZIwrP32erGKxbxAjz49tM
         fuNHza9b3+bNinLZ1PCfbQ/f6gIoFd2SSN5Rgfir061mP0JPNgbx2IfbBZcsR1p2y7Wo
         KoCwJWJFY3SxaBtMtoEwroZ93RLtR+bDWe1Aha+GvwVzpYWZR2Cdg1pK4sbFro7Rf8OX
         AaoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S0bJ8PVow7mAR7edomoeT/pRcZv2URWivCPDRIDgXaY=;
        b=IYrQ4xUwvHozwQRkF3CCYaJX/yVezV+wN09K5yRT6ejdMQZrrROncfCjwPLHCeNEqr
         M6iRmOFhJdKnYrd2tDaHtQyu64eE1XjViTIqrGHsQEStR8P6LhLJHYfn6rIBxtFtWx3V
         DkV2WfGvpl5UY39+tt/XkzAvdhrkz5IBjD0UEHOI7BJPCnn5yrmhzv5UF7rBVkV03UAY
         vhgcIUijoK5pd59kCb6P7UYCGGD2vDmVxgMFWPwF3k5Keh5XubJFNizJA6n4YisXHZvP
         F7I1uwfiU0osQ/xwr0jJEdtjczS8vZ0VRVnhWzIoBzzOigRXGNpai8zyQpDN73TPkdcm
         34rw==
X-Gm-Message-State: AOAM533Cw4RSErf5a9aCHy3Wg+worfbG234kpffl1lx2dRdhfVgxTBni
	d2hFtbGmOg9XH0A4ncyTfTE=
X-Google-Smtp-Source: ABdhPJwZE8gafurumRSN3Yc0hZFOvhRfQrBkR3uOSpW5gWJQic8/lZcvhk/7fCLeOEsq5/mWCvb6aw==
X-Received: by 2002:a17:902:c408:b0:13d:c6ef:7cf3 with SMTP id k8-20020a170902c40800b0013dc6ef7cf3mr2584295plk.86.1632382289202;
        Thu, 23 Sep 2021 00:31:29 -0700 (PDT)
Received: from localhost.localdomain ([175.195.128.78])
        by smtp.gmail.com with ESMTPSA id d19sm4581667pfn.102.2021.09.23.00.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Sep 2021 00:31:28 -0700 (PDT)
From: Sidong Yang <realwakka@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Sidong Yang <realwakka@gmail.com>
Subject: [PATCH] staging: pi433: goto abort when setting failed in tx_thread
Date: Thu, 23 Sep 2021 08:31:15 +0100
Message-Id: <20210923073115.7933-1-realwakka@gmail.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tx_thread in pi433 works for transmitting. it reads tx_cfg and data
stored in kfifo put in pi433_write() and transmits. If it exits,
pi433_write() just store its data and no one transmits data. So,
tx_thread should not exit even when it failed for setting registers.
It seems that it's okay to go to abort and continue to loop and wait for
writing.

Signed-off-by: Sidong Yang <realwakka@gmail.com>
---
 drivers/staging/pi433/pi433_if.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/pi433/pi433_if.c b/drivers/staging/pi433/pi433_if.c
index c8d0c63fdd1d..29bd37669059 100644
--- a/drivers/staging/pi433/pi433_if.c
+++ b/drivers/staging/pi433/pi433_if.c
@@ -649,7 +649,7 @@ pi433_tx_thread(void *data)
 		/* clear fifo, set fifo threshold, set payload length */
 		retval = rf69_set_mode(spi, standby); /* this clears the fifo */
 		if (retval < 0)
-			return retval;
+			goto abort;
 
 		if (device->rx_active && !rx_interrupted) {
 			/*
@@ -661,33 +661,33 @@ pi433_tx_thread(void *data)
 
 		retval = rf69_set_fifo_threshold(spi, FIFO_THRESHOLD);
 		if (retval < 0)
-			return retval;
+			goto abort;
 		if (tx_cfg.enable_length_byte == OPTION_ON) {
 			retval = rf69_set_payload_length(spi, size * tx_cfg.repetitions);
 			if (retval < 0)
-				return retval;
+				goto abort;
 		} else {
 			retval = rf69_set_payload_length(spi, 0);
 			if (retval < 0)
-				return retval;
+				goto abort;
 		}
 
 		/* configure the rf chip */
 		retval = rf69_set_tx_cfg(device, &tx_cfg);
 		if (retval < 0)
-			return retval;
+			goto abort;
 
 		/* enable fifo level interrupt */
 		retval = rf69_set_dio_mapping(spi, DIO1, DIO_FIFO_LEVEL);
 		if (retval < 0)
-			return retval;
+			goto abort;
 		device->irq_state[DIO1] = DIO_FIFO_LEVEL;
 		irq_set_irq_type(device->irq_num[DIO1], IRQ_TYPE_EDGE_FALLING);
 
 		/* enable packet sent interrupt */
 		retval = rf69_set_dio_mapping(spi, DIO0, DIO_PACKET_SENT);
 		if (retval < 0)
-			return retval;
+			goto abort;
 		device->irq_state[DIO0] = DIO_PACKET_SENT;
 		irq_set_irq_type(device->irq_num[DIO0], IRQ_TYPE_EDGE_RISING);
 		enable_irq(device->irq_num[DIO0]); /* was disabled by rx active check */
@@ -695,7 +695,7 @@ pi433_tx_thread(void *data)
 		/* enable transmission */
 		retval = rf69_set_mode(spi, transmit);
 		if (retval < 0)
-			return retval;
+			goto abort;
 
 		/* transfer this msg (and repetitions) to chip fifo */
 		device->free_in_fifo = FIFO_SIZE;
@@ -742,7 +742,7 @@ pi433_tx_thread(void *data)
 		dev_dbg(device->dev, "thread: Packet sent. Set mode to stby.");
 		retval = rf69_set_mode(spi, standby);
 		if (retval < 0)
-			return retval;
+			goto abort;
 
 		/* everything sent? */
 		if (kfifo_is_empty(&device->tx_fifo)) {
-- 
2.20.1

