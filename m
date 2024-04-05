Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4691612EBD9
	for <linux-staging@lists.linux.dev>; Fri,  5 Apr 2024 07:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712302813; cv=none; b=pD3SUco8xWCqi8V36AatfvS/2dfMz+W9fFONF6ywyH8icJYkCrYInVyJ6wTxLBRdcZct5avNohSjxZwo1OdX3GtJphAvV0rE8HlACxX2ugTMaUOMLFDJ1yzyviM8ZlBZ1ceVC1ypdwU15sLqKeRJcCYZqjcVqB4VBbld/lgTgGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712302813; c=relaxed/simple;
	bh=g/WMOp/DBXdvY4p/J51T2DdQvuOBI7ftgCcNNdq/ZQg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gsCR1cv8FMaSBOPAE60K7aeKR9YRnJrD5mezh0V4uHwqdbGDlYk+zOLvEqJAz830FrxicZr6wtHqQh/zwqe+JzdjnFe9nm3hEPpCgCWqBsozMCNQgYo4qJcmL7pFeb+W7pKjH9HNgfWnjSGMosm3z7/r45jPhgmjZUuml349JE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lPfgljt5; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lPfgljt5"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-343cd12630aso837627f8f.1
        for <linux-staging@lists.linux.dev>; Fri, 05 Apr 2024 00:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712302809; x=1712907609; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AwPl8LYnfW65bMF9In5HJ2vXzRSbzAQqtlyK3TQNiLw=;
        b=lPfgljt5vrrT5dtPOU71GHDmjSMMReGAo9CiAkm+hfWnITbJxg/PeF2oQQWeL+AwjE
         1bq8ojyfnHPq+vkWmyb5OBV5VvNeCMFzgx1x7CAPx1vGQ98W/io1qGH8dUF0d4HMKHLB
         MFu4UUa+H49rUx53WllmSENy7Nfre42J/FLHVYPLhmAcrQnNb4LBYjY/3lWqUZivOADv
         yDo1VMu9ZSedIB+DHIhywpCT1I61r/VEnL8JPMz5Ele2fXFG7pEZmrWwrtSnmweugh9q
         9+4G0lqBCdYAvyuQv9CJS+Wmtmb6crtNrHq2ZVAUCAbwxoU1saE5aOJoDsYu2+rf30PM
         QQ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712302809; x=1712907609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AwPl8LYnfW65bMF9In5HJ2vXzRSbzAQqtlyK3TQNiLw=;
        b=mp5hKtT+yBV8ZW4PrOKmdY/8FH8Eq4XZCTHhC5CwodW+5LB1jaU/Gv+GA+O7h9krRK
         C78kuFIvtcuBEbH4MPqdUaLLizfJsdbx2OGENe+b7Rbh4mWmT5/xK5863BU2Tht1Ar+T
         PEwsBGyNHEf0JCYWhScsNym/UAhtQD+43RYeRMUJG+qoyuTHRiXp4RafrSebllLCDZcz
         4YukLFM0Ds/DGsTAyDG6Orxu02x+TLQQiPWaekOrU2AG8cLFE0d5UJgAQkYqN0Q7Ai3P
         L9RASKDDae2f4p/+j+40B2en6keZimLuMMxn5yFsUl0tnJwd/XtKJbDNWmUSo0w2Ye/N
         37KQ==
X-Gm-Message-State: AOJu0YxRtH9QIUShnlGx/+45fvXCwqWbWyzI/McCSU3UwCwIMXlPwnNf
	J7DeLrGKJvCxFclUO1DhyUGOujA29F3tE4gCkk5OrkhbAOXfght3
X-Google-Smtp-Source: AGHT+IE0sMMNCxSYmp0x3kPCLZg78NOnz9SZri+Mr58KiTRI2D6/xbzd9ED7iUBVyJbGpQkDY/NsWQ==
X-Received: by 2002:adf:f345:0:b0:343:75eb:bb79 with SMTP id e5-20020adff345000000b0034375ebbb79mr490731wrp.49.1712302809544;
        Fri, 05 Apr 2024 00:40:09 -0700 (PDT)
Received: from localhost.localdomain ([2a06:c701:737b:ef00:2bdf:f41a:ebd1:fb2c])
        by smtp.gmail.com with ESMTPSA id l10-20020adfe58a000000b003434f526cb5sm1311643wrm.95.2024.04.05.00.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 00:40:08 -0700 (PDT)
From: Shahar Avidar <ikobh7@gmail.com>
To: gregkh@linuxfoundation.org,
	hverkuil-cisco@xs4all.nl,
	andriy.shevchenko@linux.intel.com,
	robh@kernel.org,
	felixkimbu1@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/7] staging: pi433: Rename struct pi433_device buffer field to tx_buffer.
Date: Fri,  5 Apr 2024 10:39:54 +0300
Message-Id: <20240405074000.3481217-2-ikobh7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240405074000.3481217-1-ikobh7@gmail.com>
References: <20240405074000.3481217-1-ikobh7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Driver holds buffers in different structs, as does the HW.
Using explicit names for buffers increases readability.

Signed-off-by: Shahar Avidar <ikobh7@gmail.com>
---
 drivers/staging/pi433/pi433_if.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/pi433/pi433_if.c b/drivers/staging/pi433/pi433_if.c
index 8c513ac62156..13b464ab7db8 100644
--- a/drivers/staging/pi433/pi433_if.c
+++ b/drivers/staging/pi433/pi433_if.c
@@ -90,7 +90,7 @@ struct pi433_device {
 	struct task_struct	*tx_task_struct;
 	wait_queue_head_t	tx_wait_queue;
 	u8			free_in_fifo;
-	char			buffer[MAX_MSG_SIZE];
+	char			tx_buffer[MAX_MSG_SIZE];
 
 	/* rx related values */
 	struct pi433_rx_cfg	rx_cfg;
@@ -613,8 +613,8 @@ static int pi433_tx_thread(void *data)
 		if (tx_cfg.enable_address_byte == OPTION_ON)
 			size++;
 
-		/* prime buffer */
-		memset(device->buffer, 0, size);
+		/* prime tx_buffer */
+		memset(device->tx_buffer, 0, size);
 		position = 0;
 
 		/* add length byte, if requested */
@@ -623,15 +623,15 @@ static int pi433_tx_thread(void *data)
 			 * according to spec, length byte itself must be
 			 * excluded from the length calculation
 			 */
-			device->buffer[position++] = size - 1;
+			device->tx_buffer[position++] = size - 1;
 
 		/* add adr byte, if requested */
 		if (tx_cfg.enable_address_byte == OPTION_ON)
-			device->buffer[position++] = tx_cfg.address_byte;
+			device->tx_buffer[position++] = tx_cfg.address_byte;
 
 		/* finally get message data from fifo */
-		retval = kfifo_out(&device->tx_fifo, &device->buffer[position],
-				   sizeof(device->buffer) - position);
+		retval = kfifo_out(&device->tx_fifo, &device->tx_buffer[position],
+				   sizeof(device->tx_buffer) - position);
 		dev_dbg(device->dev,
 			"read %d message byte(s) from fifo queue.\n", retval);
 
@@ -715,7 +715,7 @@ static int pi433_tx_thread(void *data)
 
 				device->free_in_fifo = 0;
 				rf69_write_fifo(spi,
-						&device->buffer[position],
+						&device->tx_buffer[position],
 						write_size);
 				position += write_size;
 			} else {
@@ -723,7 +723,7 @@ static int pi433_tx_thread(void *data)
 				device->free_in_fifo -= size;
 				repetitions--;
 				rf69_write_fifo(spi,
-						&device->buffer[position],
+						&device->tx_buffer[position],
 						(size - position));
 				position = 0; /* reset for next repetition */
 			}
-- 
2.34.1

