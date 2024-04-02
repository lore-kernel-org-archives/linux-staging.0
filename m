Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2B162178
	for <linux-staging@lists.linux.dev>; Tue,  2 Apr 2024 11:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712056468; cv=none; b=az5OPvMhgcHBv8vymMnGY/elVmpjHmpJG7puwpXsxvVt+VC4ouSaxFQrgZc/Zp7r1HBs5neBOg7TjCgRnQ5/B0zmdazOnNUn8LwneSG4YSaVdqXuuU8z0xMq80D4OVXH2Yizl5sqEYuPFVfn8wr7seuhnxwcs5NJyCTFJLKvxqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712056468; c=relaxed/simple;
	bh=g/WMOp/DBXdvY4p/J51T2DdQvuOBI7ftgCcNNdq/ZQg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Kh0XZrs+yRv1mgzpyhEmzZgEP9i5b+bJcpvVi+H1qf5yEUlEC/QU/6nOZ1cFQ88fSZwIUMoG0A0gWYGRrF5sNMaWyMIlQ3Prfg2+CNktUgLfPkgirDd4nNjHkD2IVyooBkuCa19lDrpzptCXhna0mnemz96NbP2FBPhqpKyOCK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qn7MIMpq; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qn7MIMpq"
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-476bb6b964bso1800371137.1
        for <linux-staging@lists.linux.dev>; Tue, 02 Apr 2024 04:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712056465; x=1712661265; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AwPl8LYnfW65bMF9In5HJ2vXzRSbzAQqtlyK3TQNiLw=;
        b=Qn7MIMpqbrdx5NEMcf/UvqixE0BMO6tsIOvfZxcMWGTL3zBl8fLKDcuA157eyE69tN
         26ySXduzTEj2NNJdJevI7K/SFXqm5Dhvcuu5kD9C6HsYSZs13SujsSmOwx+KG8Uifv51
         46aCpnOuout29qPSh5igXdyUaC5t15+yVJq9lPKsx6LcLMfZkbZh/CqAWfkkghL/TBdX
         54Ed19YMIEssTiYb3RCUQf6eWImqzkTyr68BQGzliFikAfm3/wf/ZquOWABV83WdruLt
         HueJF1rNJJY/edZPU7bDnmGKVgjSzYHg3x8TYfpNJuR/osZg9tFhf+aQs6RlCaC70TfP
         8C5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712056465; x=1712661265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AwPl8LYnfW65bMF9In5HJ2vXzRSbzAQqtlyK3TQNiLw=;
        b=jsv1ogxNMButQ5fl/BE+x4FttaEGd8WseW0Wna1g9E+9FvKf7k6AU6OKAa5WpJkbHA
         UuptV/yJBdsVolHKOD3xI5xliTGJW//98IncXN0HqziE3Bk/v8aXQqwj9VdS3db/8nVb
         yf7oQJzj4WFag28gcbGloSR6g8C+JzViIO6RrqqpO6zyiYEGKuJ0619rF5WBnYj0IhO5
         yIBT8qhIu8ntAyELqgah245pDbYpUGxO4alh19SMapBeTzJJV4Hr38EK/OedhW+5Gf+j
         4hMp5gazU5kZt55pumnKWzlZq+8H/pSJH34NLSSLj2jSeamFPq3szGFaOgn5MRCd9OBB
         auAQ==
X-Gm-Message-State: AOJu0Yxg9sznuYOfw3cbasoOtQdc373iAukYDYW37YLF1ZpGWt3Kahkg
	QRzJIEItfDHszJxNRc7JT6dAN8cTsUOlxTEueVzmo36hOC2RKD03
X-Google-Smtp-Source: AGHT+IGQ+gz5kG9dTgq1zUZPBLECe9wqwN5K7d6gbfjwiXOgW0CKfm40k68E2evbnEs3WIhJ/0Q7UQ==
X-Received: by 2002:a67:f2d0:0:b0:478:46db:6222 with SMTP id a16-20020a67f2d0000000b0047846db6222mr9938357vsn.24.1712056464764;
        Tue, 02 Apr 2024 04:14:24 -0700 (PDT)
Received: from YOGA.local ([2a06:c701:737b:ef00:2c6f:6cdc:f641:6ecf])
        by smtp.gmail.com with ESMTPSA id 11-20020a05621420cb00b006968a6fb010sm5428855qve.91.2024.04.02.04.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 04:14:24 -0700 (PDT)
From: Shahar Avidar <ikobh7@gmail.com>
To: gregkh@linuxfoundation.org,
	hverkuil-cisco@xs4all.nl,
	andriy.shevchenko@linux.intel.com,
	robh@kernel.org,
	felixkimbu1@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/6] staging: pi433: Rename struct pi433_device buffer field to tx_buffer.
Date: Tue,  2 Apr 2024 14:14:09 +0300
Message-Id: <20240402111414.871089-2-ikobh7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240402111414.871089-1-ikobh7@gmail.com>
References: <20240402111414.871089-1-ikobh7@gmail.com>
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

