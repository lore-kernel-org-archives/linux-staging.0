Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FFA2262E
	for <linux-staging@lists.linux.dev>; Sat, 13 May 2023 21:43:20 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1a50cb65c92so80197365ad.0
        for <linux-staging@lists.linux.dev>; Sat, 13 May 2023 14:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684014200; x=1686606200;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=TFqA5Fp34TBgSDS7XHhZzOf9NoT5Y8oq5mDAcsTBZAs=;
        b=gXOXeb7IbsL1IVT9HYI3Ylm4h7MveCHnqhIqzLOa3oZHd3/5AlWRU5fUzCHLiqvcwk
         tSj5sCU4GIpN8rsERESGywaoILF2epo7S69nNb5RlHrDuXqMBTHLxmiEyXpzlphJJdXX
         O5fuu/EKBazBNGcGehwI0oYvLeOiBjYHVOX9CcwLRZrFzmSC7FObAkNUHnVZyoTN/l/+
         XOrsRPDBpoayOfS/cCmzc2cBoMHg4g6K7n8kIb3kmuJzyiOWzuoHG2zW364FpfSpHMDU
         DmrJhbP693mbcz1hyWDUJEAStIQJ7w5d+M3QDQ2kFViZ/48Pr5PMt+dHxB+K+6k26MO3
         I2xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684014200; x=1686606200;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TFqA5Fp34TBgSDS7XHhZzOf9NoT5Y8oq5mDAcsTBZAs=;
        b=LB7NBdW27wwFLMA67AFxo3Tc0mDCbgn5dn+GrpwVb4sdK1i3gQ8umCVHnVUDNJs9gf
         pla7+JSdo1MRlaXAReKKHC1ZnghB4lJAiS/Opg1qQ4sCZQq56GnJ2Z0EuN+rEkZq2+pK
         frLWv/h385xrMe448quYNsTr+/671HOdCv74F1aNf0qIAzGVpSbHsTHb2ZXuJlKlVAYx
         TF0k/nDW+WWuyUjBC30OxUIjSIWr5tSYQEqr9puGi3Wiq8AluN0aadopMVXNQkD9tfGo
         GoCS3kTgZFiUXFjLel0cZ+LVsoOdtVFtaHNPSUYg2TyYDdYC7ca2FOkQ0mlQ3G/VIZQv
         /bDQ==
X-Gm-Message-State: AC+VfDx2uSN3Q5G2okmvRxNxRas/M96E0ubEZz//vXrDGDbNLfOrye3h
	DlJpYjn8P44Ea3LGjyAF28c=
X-Google-Smtp-Source: ACHHUZ4ttVT9tp2heOUWTFqiLtK8SrrSIzByFLnlIsU3687NFfgUYS6VlNZ5nFgd1uQZ5yogM8BN0A==
X-Received: by 2002:a05:6a20:7d8d:b0:101:166:863f with SMTP id v13-20020a056a207d8d00b001010166863fmr24264699pzj.23.1684014199568;
        Sat, 13 May 2023 14:43:19 -0700 (PDT)
Received: from redkillpc.. ([49.207.202.99])
        by smtp.gmail.com with ESMTPSA id e12-20020a62aa0c000000b00634dde2992bsm9060328pff.132.2023.05.13.14.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 May 2023 14:43:18 -0700 (PDT)
From: Prathu Baronia <prathubaronia2011@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Prathu Baronia <prathubaronia2011@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] axis-fifo: use devm_kasprintf for device name
Date: Sun, 14 May 2023 03:10:27 +0530
Message-Id: <20230513214029.122689-1-prathubaronia2011@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- Replaces devm_kzalloc and snprintf combo.
- Also made the fops alignment proper.

Signed-off-by: Prathu Baronia <prathubaronia2011@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index dfd2b357f484..8b46699efb34 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -720,11 +720,11 @@ static int axis_fifo_close(struct inode *inod, struct file *f)
 }
 
 static const struct file_operations fops = {
-	.owner = THIS_MODULE,
-	.open = axis_fifo_open,
+	.owner   = THIS_MODULE,
+	.open    = axis_fifo_open,
 	.release = axis_fifo_close,
-	.read = axis_fifo_read,
-	.write = axis_fifo_write
+	.read    = axis_fifo_read,
+	.write   = axis_fifo_write
 };
 
 /* read named property from the device tree */
@@ -820,10 +820,6 @@ static int axis_fifo_probe(struct platform_device *pdev)
 	 * ----------------------------
 	 */
 
-	device_name = devm_kzalloc(dev, 32, GFP_KERNEL);
-	if (!device_name)
-		return -ENOMEM;
-
 	/* allocate device wrapper memory */
 	fifo = devm_kzalloc(dev, sizeof(*fifo), GFP_KERNEL);
 	if (!fifo)
@@ -861,7 +857,9 @@ static int axis_fifo_probe(struct platform_device *pdev)
 	dev_dbg(fifo->dt_device, "remapped memory to 0x%p\n", fifo->base_addr);
 
 	/* create unique device name */
-	snprintf(device_name, 32, "%s_%pa", DRIVER_NAME, &r_mem->start);
+	device_name = devm_kasprintf(dev, GFP_KERNEL, "%s_%pa", DRIVER_NAME, &r_mem->start);
+	if (!device_name)
+		return -ENOMEM;
 	dev_dbg(fifo->dt_device, "device name [%s]\n", device_name);
 
 	/* ----------------------------
-- 
2.34.1

