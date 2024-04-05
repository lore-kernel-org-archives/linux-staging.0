Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2636713C823
	for <linux-staging@lists.linux.dev>; Fri,  5 Apr 2024 07:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712302817; cv=none; b=iUyvXQPsWeHjgVpK9b+AmD5CragUtUPvNU2NWeq7zduajBe5dkMHvDrEW7pySTyHpUt0RmdvD4yYnDD84GS9BAB9+RbW5Pr7auqEnaQgsNccToT9sYKDWYtm1L4nRGzAZMKHsuxfDK+vkyfA49j9Gm9UumL/z/FQzxUr6Wjw9p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712302817; c=relaxed/simple;
	bh=HjRvMGXjDbwDSvM16WAhK4wPegt0yyIWO/1j4Z95mjo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=d0oej4MEG3UFCtfjcwEJ1bz38PG3I1LxT2np9BgbDFL0d1gITWspD6MIvfGgWelxJUIIcTknAM3vu1ODPGlELieWkbQedU/vJ/q4yzcgQN4jfnTA/iRuswgjejDE5a2+kGwm+LZwDRHliV1lT/nbE8MWQUT+qIhQAfZ1kNDLX0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BBBBVbqU; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BBBBVbqU"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-343cfa6faf0so885866f8f.0
        for <linux-staging@lists.linux.dev>; Fri, 05 Apr 2024 00:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712302814; x=1712907614; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJrpsii5KxAd/+yN0rzfHDl19GAcoZcZzgV5GRtFABE=;
        b=BBBBVbqUWfS/jI7cpUzuqHG8sbS2T5PU31jYuziGUbzbKdSi6k85gDPHEg+lZ5rQkr
         EM/IbUPEsKrRqbv82LvqBVz9xDPlzAds80bb/E5w23pLErqwZGZC19aP8XcpcSUNStWX
         CwM7Q4njIXlnuWNjBwvmxM8tLLbFZ9jkcUuX8LWfNzfyoObSopF/w1whbnHFZSmNaD+U
         UadeZdpU/Ajjc5jXs8G8Qz3g7XLrfqwVFZGTW30i22W/k25POmUBJ8wgznErgRqKpZkH
         NinNof08e758RKeh8U8vV9SrHYSQ8d5tIZIK1NhZAWQsvl5knWivOGP6QeOw4HmdnmtK
         GtzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712302814; x=1712907614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YJrpsii5KxAd/+yN0rzfHDl19GAcoZcZzgV5GRtFABE=;
        b=FWQBCsBXThsHZDc+b29QBAMSuWy1zYCo9IaYHueXF4R6omd/0j5o5mUH56/qfGjm7R
         8hUxyTxQz7A8kvSboYtOLLrKrgJgvV4AcGxgoNX5CMlzHFWsDCjd9zOFaruUNDuZ2vrJ
         rM8tSAeWEOX8Y0f2dQrT0XJNRXgTi5+XTH8SBfKYmQDQzfMpxYfK5Fzn8CdUzTJp3VQt
         j9QCHNGcYNzLobeGe60PRr/tYwdAYZ/8v3mWzv17z/vTyfif1PQZz6QKo0Ncjtrtxt3/
         sCdqLTZZaUIQ7s5SXsuYnd1+1pG+xz5r2sPdOY19QQztPxn+JWiAuygZ7Hi6JLoU/YDE
         QApA==
X-Gm-Message-State: AOJu0YwvcYoNjMRbjJH2aF4N6oHk2GrrJXnVqDnwY79c5jWfTaIRf9ni
	kB9A2zFy5/7+TgdQL6NleomyLTeFayPRoSox+K7sbQsNanNCaaC+
X-Google-Smtp-Source: AGHT+IEaEi2jQPgVCrw/T+VlZ/QJsDFrDO0tljJfL2LpyogJgEVc50Wraut/Somejqvdw6J/VSQQMw==
X-Received: by 2002:adf:fd91:0:b0:343:a8cb:7990 with SMTP id d17-20020adffd91000000b00343a8cb7990mr616644wrr.29.1712302814528;
        Fri, 05 Apr 2024 00:40:14 -0700 (PDT)
Received: from localhost.localdomain ([2a06:c701:737b:ef00:2bdf:f41a:ebd1:fb2c])
        by smtp.gmail.com with ESMTPSA id l10-20020adfe58a000000b003434f526cb5sm1311643wrm.95.2024.04.05.00.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 00:40:14 -0700 (PDT)
From: Shahar Avidar <ikobh7@gmail.com>
To: gregkh@linuxfoundation.org,
	hverkuil-cisco@xs4all.nl,
	andriy.shevchenko@linux.intel.com,
	robh@kernel.org,
	felixkimbu1@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/7] staging: pi433: Rename "pi433_dev" of type "dev_t" to "pi433_devt"
Date: Fri,  5 Apr 2024 10:39:57 +0300
Message-Id: <20240405074000.3481217-5-ikobh7@gmail.com>
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

