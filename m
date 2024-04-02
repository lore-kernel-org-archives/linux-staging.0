Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2FD6995D
	for <linux-staging@lists.linux.dev>; Tue,  2 Apr 2024 11:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712056475; cv=none; b=MAvKjPc96BxvQX85pzeWyT88cix1qqkj1whhdSH2qIRyfefP0deIUheoK6H8SHp7467z9W8+tfHgKF/B+sjgrjqG3W3rCIEAo4DBUmpytD4UozUKaLaBboZ73cpR0MjGbCnx9wxhdcPGfNjsUJ4CcU3vZ8oBD8jGUfRXFwPEKng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712056475; c=relaxed/simple;
	bh=HjRvMGXjDbwDSvM16WAhK4wPegt0yyIWO/1j4Z95mjo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mAYq4aWacRcAj8X19PPnvzu7F12pTu7rjLoW7RvBVdssTXtHiFQK65WWDMNY36XBpOi/hg9qbEK1otX8ixDeK9bV5e+qXtuBFfpiN4O9Z5mbHjP0Peq5fJWVPUhAqNy5ApCfzREKHjSDHUlPhlXdWIZYXHPDPva8nw5ivHnYl14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jw57BDtX; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jw57BDtX"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-696315c9da5so37274956d6.2
        for <linux-staging@lists.linux.dev>; Tue, 02 Apr 2024 04:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712056471; x=1712661271; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJrpsii5KxAd/+yN0rzfHDl19GAcoZcZzgV5GRtFABE=;
        b=jw57BDtXO148SHjUu+/3g8llWo2lqzjxenwrg3S0jPxD5HeVcc6midAZp/g5oGOTO6
         7KGfRPoWePOyo6oOzCh1heDdbnvezfIkIf/uk/w0kNt7c/bdrh8RwCZzekJlaJWY7RLR
         Lu/a/Lkbhxb2+N6SJEfxEx0EOCHeR2DqZWbrZhdls8PkLv5HVmFiH14Tf6JqMuGWP/Z/
         wg+rdIyxjQP+60E/gBtgBYAfxPFlW6X1nTJY5A2MooNLwUCbRwiWZkyP45vJWPalwXPc
         RjgqdH2ylG3367/wBqzqKWjm1sUTT1CrhvIl8+WnkFcBRnmV8k5H7wtTFN3ZNE5kB8FP
         LiHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712056471; x=1712661271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YJrpsii5KxAd/+yN0rzfHDl19GAcoZcZzgV5GRtFABE=;
        b=giFmXx/ZKTRToDo+5kbvyXZjd2HTJ50UR6B18oJ+hTdcxw/1kMCkvcpI7mOX2AFejw
         dMUtOqv3E8BZZV95S+6hY2AAGuhNnvY6qVzNFaSXmM2xVZxaCTNDTQETHfWO/TMFeLo5
         nDeM7CVSdPy5pLrhRyATqAG6zaIYRp0ZJG+bGf9CPYKTQeyNZn9BT4UC+9YbaR4HSobW
         S8fq4I7PFFopudElVJueAQTxtxuqk6RZB2S7aitMrH+5CHkcfip2LJ1IteTPqqMWnNps
         gC6iyAbf9rnpmKe5hp4+9Lr7Ie/v9hCLUwMDhuQgcuqvcuKtUtOu22wC1ixyDTqwo50A
         JbOQ==
X-Gm-Message-State: AOJu0YxzuqF11sJNhlrJPh47PQpDc6bQf1y0Uj0zDp52MdwT1nOn9tEF
	oxx/QV0iLHBs0YjNrScTGlY0FAi5RR2Ce470yS9arRIT3D1rg709
X-Google-Smtp-Source: AGHT+IF+fzJLuXaGOfACwLIziHCh2KfismoKuF2DlR8MVTa2dSbqg37YPm3Lu8RyXS7XIz2TLdqRwA==
X-Received: by 2002:a0c:ecc4:0:b0:699:21a9:8ecd with SMTP id o4-20020a0cecc4000000b0069921a98ecdmr196674qvq.5.1712056471307;
        Tue, 02 Apr 2024 04:14:31 -0700 (PDT)
Received: from YOGA.local ([2a06:c701:737b:ef00:2c6f:6cdc:f641:6ecf])
        by smtp.gmail.com with ESMTPSA id 11-20020a05621420cb00b006968a6fb010sm5428855qve.91.2024.04.02.04.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 04:14:30 -0700 (PDT)
From: Shahar Avidar <ikobh7@gmail.com>
To: gregkh@linuxfoundation.org,
	hverkuil-cisco@xs4all.nl,
	andriy.shevchenko@linux.intel.com,
	robh@kernel.org,
	felixkimbu1@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/6] staging: pi433: Rename "pi433_dev" of type "dev_t" to "pi433_devt"
Date: Tue,  2 Apr 2024 14:14:12 +0300
Message-Id: <20240402111414.871089-5-ikobh7@gmail.com>
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

Distinguish struct device type instances from dev_t instances
to enhance readability.

Signed-off-by: Shahar Avidar <ikobh7@gmail.com>
---
 drivers/staging/pi433/pi433_if.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/pi433/pi433_if.c b/drivers/staging/pi433/pi433_if.c
index 208c0c6d3649..62ce75b07bf0 100644
--- a/drivers/staging/pi433/pi433_if.c
+++ b/drivers/staging/pi433/pi433_if.c
@@ -53,7 +53,7 @@
 #define FIFO_THRESHOLD	15		/* bytes */
 #define NUM_DIO			2
 
-static dev_t pi433_dev;
+static dev_t pi433_devt;
 static DEFINE_IDR(pi433_idr);
 static DEFINE_MUTEX(minor_lock); /* Protect idr accesses */
 static struct dentry *root_dir;	/* debugfs root directory for the driver */
@@ -1262,7 +1262,7 @@ static int pi433_probe(struct spi_device *spi)
 	}
 
 	/* create device */
-	pi433->devt = MKDEV(MAJOR(pi433_dev), pi433->minor);
+	pi433->devt = MKDEV(MAJOR(pi433_devt), pi433->minor);
 	pi433->dev = device_create(&pi433_class,
 				   &spi->dev,
 				   pi433->devt,
@@ -1276,7 +1276,7 @@ static int pi433_probe(struct spi_device *spi)
 	} else {
 		dev_dbg(pi433->dev,
 			"created device for major %d, minor %d\n",
-			MAJOR(pi433_dev),
+			MAJOR(pi433_devt),
 			pi433->minor);
 	}
 
@@ -1398,13 +1398,13 @@ static int __init pi433_init(void)
 	 * that will key udev/mdev to add/remove /dev nodes.
 	 * Last, register the driver which manages those device numbers.
 	 */
-	status = alloc_chrdev_region(&pi433_dev, 0, N_PI433_MINORS, "pi433");
+	status = alloc_chrdev_region(&pi433_devt, 0, N_PI433_MINORS, "pi433");
 	if (status < 0)
 		return status;
 
 	status = class_register(&pi433_class);
 	if (status) {
-		unregister_chrdev(MAJOR(pi433_dev),
+		unregister_chrdev(MAJOR(pi433_devt),
 				  pi433_spi_driver.driver.name);
 		return status;
 	}
@@ -1414,7 +1414,7 @@ static int __init pi433_init(void)
 	status = spi_register_driver(&pi433_spi_driver);
 	if (status < 0) {
 		class_unregister(&pi433_class);
-		unregister_chrdev(MAJOR(pi433_dev),
+		unregister_chrdev(MAJOR(pi433_devt),
 				  pi433_spi_driver.driver.name);
 	}
 
@@ -1427,7 +1427,7 @@ static void __exit pi433_exit(void)
 {
 	spi_unregister_driver(&pi433_spi_driver);
 	class_unregister(&pi433_class);
-	unregister_chrdev(MAJOR(pi433_dev), pi433_spi_driver.driver.name);
+	unregister_chrdev(MAJOR(pi433_devt), pi433_spi_driver.driver.name);
 	debugfs_remove(root_dir);
 }
 module_exit(pi433_exit);
-- 
2.34.1

