Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57FB1117
	for <linux-staging@lists.linux.dev>; Sun, 14 May 2023 13:02:04 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6439b410679so7715085b3a.0
        for <linux-staging@lists.linux.dev>; Sun, 14 May 2023 06:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684069324; x=1686661324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=go5sDeHWgIRTWlpjFAmfS/O0gabJcHfa+czJpZGJ7uc=;
        b=H3jA6TBOe0/k3zwh4ceqX9yAKSFAl74DcDo/vTriw5YFg/OwD1bnoNnMlX4i+Z9f3A
         EztT3flDJJr2hVVLAJsh3STO7bUmt5WdTyYPONA/4mPLnwYXyzLF1TadnSd2pSlS+miq
         Opwzzu6KjY3tNs8vf+uZXHFoGj4ijaB9wpVNV3wTcN2km/yxJigRToKpTxTX+Aeirrk+
         bm8cPaMGBTCtzpbmWKta1F6BzYV3Hat2Afa6mBdjelggK3kf/VNa+5pUbUxwShTBlWul
         IEfH3GEU5kajcSaO6Zxe//SRjE4wvKjKnQoZr/3picoqS2opCuCnIFH0sG1j0ZoK+37O
         4D8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684069324; x=1686661324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=go5sDeHWgIRTWlpjFAmfS/O0gabJcHfa+czJpZGJ7uc=;
        b=erHpaMJVW/Yu4EhzhvyiQP1vI3YEX5r3eoyO9P13ZVFjz5JgtmraF6Lote4lhtQHjR
         LnHYFUCPQQvl7ORXZr5MrUo8UdNmuPemEp88S8QaNcT8G/obDjiV94fNDeZmVsuQcTdb
         LD4FY5v8+LCcLksJjRkoZhO+ggRGM5X1RZ+ODU2wgXXQ+jMXwb2Fo4UkH07Zrgwrex5c
         Sk4U3wB126SWxXj39F1/1WH6I/GEDw2F9vQcpKS20fB81tdB2/kcAYVlW81soY5PL1OV
         SEzBuRJd+hz+dvVA4yrLGrPAiiGIl2SIfDSdVbr3EJnJtHj+KmjrqmnYo7SqJ7NC4ZH2
         bm1w==
X-Gm-Message-State: AC+VfDwh/iyvQ4n1eGBaGe5YwuzX/9nJhFC24GgytjV5ASV9xh56T7zO
	4IPXl5+v3xey9zGSBv9z/jo=
X-Google-Smtp-Source: ACHHUZ7L+PNp68VGado16dQgmCiWZZn0n7EfRpzHISPa/LnbdMBBXDgV+ByyV/dt2HBW+29jfi+qHw==
X-Received: by 2002:a05:6a20:1441:b0:101:8cad:6db9 with SMTP id a1-20020a056a20144100b001018cad6db9mr22684357pzi.47.1684069324095;
        Sun, 14 May 2023 06:02:04 -0700 (PDT)
Received: from redkillpc.. ([49.207.202.99])
        by smtp.gmail.com with ESMTPSA id e35-20020a635463000000b0051b70c8d446sm9766146pgm.73.2023.05.14.06.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 06:02:03 -0700 (PDT)
From: Prathu Baronia <prathubaronia2011@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	prathubaronia2011@gmail.com
Subject: [PATCH v2 1/2] axis-fifo: use devm_kasprintf() for allocating formatted strings
Date: Sun, 14 May 2023 18:31:47 +0530
Message-Id: <20230514130148.138624-2-prathubaronia2011@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230514130148.138624-1-prathubaronia2011@gmail.com>
References: <2023051411-happier-mural-a8ef@gregkh>
 <20230514130148.138624-1-prathubaronia2011@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In various places, string buffers of a fixed size are allocated, and
filled using snprintf() with the same fixed size, which is error-prone.

Replace this by calling devm_kasprintf() instead, which always uses the
appropriate size.

Signed-off-by: Prathu Baronia <prathubaronia2011@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 7a21f2423204..7b3080202b31 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -816,10 +816,6 @@ static int axis_fifo_probe(struct platform_device *pdev)
 	 * ----------------------------
 	 */
 
-	device_name = devm_kzalloc(dev, 32, GFP_KERNEL);
-	if (!device_name)
-		return -ENOMEM;
-
 	/* allocate device wrapper memory */
 	fifo = devm_kzalloc(dev, sizeof(*fifo), GFP_KERNEL);
 	if (!fifo)
@@ -857,7 +853,9 @@ static int axis_fifo_probe(struct platform_device *pdev)
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

