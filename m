Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6B474BF4
	for <linux-staging@lists.linux.dev>; Tue,  2 Apr 2024 11:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712056476; cv=none; b=FApQ4vMXpFV++Ozn5vkD6JY4weuo7jQhOoI/sC/j3Qb1wLJDVd8+r2GGqJl3ZWlmWqj6UGaiklXLaNPDRtfHXTMFGnAdsPc5La8QBRDJDC7XboUTNDivxtZNUq/gcXsA59VW8hNMn/yIIZ8ZDPMSZr83Y6062CGFJyNFEko+kPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712056476; c=relaxed/simple;
	bh=gcpheDANWK19woUIfqj/fVqHsx2og6+K7UySgK3tvLo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FQcBlKf3DewthVQ0p8GlqJMsX2SYknr9berooGdd8EXM4zFGL14ehxKYn1vmEQiliJ61/B72pF7tFa205X9lejjBdAZsdyclG9TP2UH3YkhL9LwRE/iywPAEyo2GSV2FUrHfNL4M1zel0nCN/UDqOPQ4urPfv3EqmglB76OWwVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CaQ9tsCC; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CaQ9tsCC"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6992094e1b6so959726d6.1
        for <linux-staging@lists.linux.dev>; Tue, 02 Apr 2024 04:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712056473; x=1712661273; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kVb/UGONQyBT+z/L6u7Z9rLkuNJQKGw42waV76KdoHg=;
        b=CaQ9tsCCeRETSnz72edmehLS4NQkjElJ8HILdoINSoiT+N7tCM4fnIT7g1P49B3YvR
         ivoFonHgXOrcpEb0RpqbbadHxXnQgFKZD1BvvW6vHVha8bMn10xjTkKcexjRiiu5CUhH
         jm5LrFFY6hcL9PohulK5jiEfxDoxKh+su0+zNLvKmxsP8f4l3XOeoa3NGhkiBiUGNhPa
         WihkXumtQ51cnIFzY7jhp9jyuBG6IKGsyU3WlGpWXMQgP7ispMzFgwJ/C+7jNg08ERvN
         m/CDH8sOF3EXzWY9wOk43k7KB25pGzxLVY5znGq2p6oJewnlBwl0uKQWORpOGAuC9Bm1
         SQew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712056473; x=1712661273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kVb/UGONQyBT+z/L6u7Z9rLkuNJQKGw42waV76KdoHg=;
        b=NF/lXeaocvVIC6lAKi6oEZv5FXDZqbazdBsdBfP+X8wZ7qLH9GDyOrYeyF/Xjrk6TX
         5PFHD1Vp23W9DItuQJKBROEMp4K9Ivj4ITe+Qna5EOU4JZVX+ZUJ62DsXehtYEPcYNZe
         khY3472OTWWcKwB9KqkDcGYrIAC+7r5gk899PtIMaIisY6eXD6Ykmm0RrD50zjE6h5Vb
         37bheNQUQp92aMg4V3Fs9EPFnOsRMHcTB8xLwdqbETzcWv2t9yf1Ml8MLqIKRhisO48U
         kMjLlQcpgXbKEqyIRMey3145Zftmle53C1y44Xc7iqHXvZFXC0zNyPzcqvplVjdaYsmx
         fHKw==
X-Gm-Message-State: AOJu0YwinzSv0wCj+Ykbx8fPrUDZlP1X6cb+0ZAUWg2fSVTVEb5j02fX
	kZBsdhX18+hAEvnIJewGGXVjbrqBRyU1rERaAOc66sGwVmt4VUJY
X-Google-Smtp-Source: AGHT+IERjMFu5RgQedji7m32aGiXlcLxDQOA+nmAxLDWEk0/x7zTg44X+OPQJBASf129EwgkdSYPFg==
X-Received: by 2002:a0c:e647:0:b0:698:6f2e:623a with SMTP id c7-20020a0ce647000000b006986f2e623amr13315711qvn.56.1712056473439;
        Tue, 02 Apr 2024 04:14:33 -0700 (PDT)
Received: from YOGA.local ([2a06:c701:737b:ef00:2c6f:6cdc:f641:6ecf])
        by smtp.gmail.com with ESMTPSA id 11-20020a05621420cb00b006968a6fb010sm5428855qve.91.2024.04.02.04.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 04:14:33 -0700 (PDT)
From: Shahar Avidar <ikobh7@gmail.com>
To: gregkh@linuxfoundation.org,
	hverkuil-cisco@xs4all.nl,
	andriy.shevchenko@linux.intel.com,
	robh@kernel.org,
	felixkimbu1@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/6] staging: pi433: Remove duplicated code using the "goto" error recovery scheme.
Date: Tue,  2 Apr 2024 14:14:13 +0300
Message-Id: <20240402111414.871089-6-ikobh7@gmail.com>
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

pi433_init had "unregister_chrdev" called twice.
Remove it using goto statements.

Signed-off-by: Shahar Avidar <ikobh7@gmail.com>
---
v2->v1:
Followed by Dan Carpenter's <dan.carpenter@linaro.org> comments:
        - Remove empty "fail" goto tag.
        - Reorder pi433 init & exit calls so they have reverse order.
        - Add "unreg_spi_drv" goto tag.
        - Check "debugfs_create_dir" return value.
        - Update "if" statments for consistency.

 drivers/staging/pi433/pi433_if.c | 33 +++++++++++++++++++-------------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/pi433/pi433_if.c b/drivers/staging/pi433/pi433_if.c
index 62ce75b07bf0..47e0c51ffe2e 100644
--- a/drivers/staging/pi433/pi433_if.c
+++ b/drivers/staging/pi433/pi433_if.c
@@ -1399,25 +1399,32 @@ static int __init pi433_init(void)
 	 * Last, register the driver which manages those device numbers.
 	 */
 	status = alloc_chrdev_region(&pi433_devt, 0, N_PI433_MINORS, "pi433");
-	if (status < 0)
+	if (status)
 		return status;
 
 	status = class_register(&pi433_class);
-	if (status) {
-		unregister_chrdev(MAJOR(pi433_devt),
-				  pi433_spi_driver.driver.name);
-		return status;
-	}
-
-	root_dir = debugfs_create_dir(KBUILD_MODNAME, NULL);
+	if (status)
+		goto unreg_chrdev;
 
 	status = spi_register_driver(&pi433_spi_driver);
-	if (status < 0) {
-		class_unregister(&pi433_class);
-		unregister_chrdev(MAJOR(pi433_devt),
-				  pi433_spi_driver.driver.name);
+	if (status)
+		goto unreg_class;
+
+	root_dir = debugfs_create_dir(KBUILD_MODNAME, NULL);
+	if (IS_ERR(root_dir)) {
+		status = PTR_ERR(root_dir);
+		goto unreg_spi_drv;
 	}
 
+	return 0;
+
+unreg_spi_drv:
+	spi_unregister_driver(&pi433_spi_driver);
+unreg_class:
+	class_unregister(&pi433_class);
+unreg_chrdev:
+	unregister_chrdev(MAJOR(pi433_devt), pi433_spi_driver.driver.name);
+
 	return status;
 }
 
@@ -1425,10 +1432,10 @@ module_init(pi433_init);
 
 static void __exit pi433_exit(void)
 {
+	debugfs_remove(root_dir);
 	spi_unregister_driver(&pi433_spi_driver);
 	class_unregister(&pi433_class);
 	unregister_chrdev(MAJOR(pi433_devt), pi433_spi_driver.driver.name);
-	debugfs_remove(root_dir);
 }
 module_exit(pi433_exit);
 
-- 
2.34.1

