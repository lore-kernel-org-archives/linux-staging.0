Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD577FBA5
	for <linux-staging@lists.linux.dev>; Thu, 28 Mar 2024 12:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711627981; cv=none; b=RcdY3MA/mzu8BEcHMdVM4i4HuikbXurMU61qdUtJE9mUM6gVvpmWM9Ru2WZ6Mc88us3ggV/F1Bm1S7Ro35yJ946wKu0IfD3QMM3P6wW7cip2r9YuRr/zwyv0rKw/F1itW9obAMmKr/MdkoPasN+AEwZ6HXWb0yGbglBTGCEcrtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711627981; c=relaxed/simple;
	bh=rduB/RDRA5RPBB7h21AIh+xd67gq//w9BJQsmLy4FtA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bss2CWVDFB+kqbk0not/HGXm07hIYJcr+g6h94N9OZquIWgiDDxR/ZAH3etmrZfiPoadzJEtG3adIYB0AM3ySNEALKiErjWpl6G5Rfga64pe84u0i0AEZL0sig831j4rjNEBlBLA/0jIK2TK2iHMjYx2biyWu5zLmFstAM/ltDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P7kGxDcT; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P7kGxDcT"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2d687da75c4so8661531fa.0
        for <linux-staging@lists.linux.dev>; Thu, 28 Mar 2024 05:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711627978; x=1712232778; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z9w3iqi8v6g1Qg2xrkzZI49jeraryi4PMJn7xcz2yLU=;
        b=P7kGxDcT7T2RSJ4tFbJmWAZhlOCY2ufwLxL5O5nRbz7bLsZ4Btd8VMwCFJXtH7Jir1
         CsxAxGeyLTWPxedFXLEpcy6Pa77NK88mg0FjuRjvT08sStuLLMXM12+LL1inrXI+mu/F
         81mnNfjjRZ2wMTxjd5a4OePU0Z7zTbycVf4egbBGKo+x9m1Ig/64u3mSXlt4MBEnF0Sm
         iumd3Xyiiv2dr27nZdodUDfcFScPxG1f/S8WGYjm0MPlfoLmalgnDXp4HDesvxEpDVc0
         a5xgGxjsT4fP4Bx80qA/nt7F1fYBZgVBO+lnGLf5LjhfrGg/pstVbLakZyNx6rcb0l7K
         GDLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711627978; x=1712232778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z9w3iqi8v6g1Qg2xrkzZI49jeraryi4PMJn7xcz2yLU=;
        b=QfwL7iSHSkSErtlRv1jeVevTYOhoX72HzpAL7ubWlP9uKz5QIPHQpB5UKMSriPkzjk
         UkNxGRbq2Zk6sR8NUDMBvI+Jcr2qnKLBvLefqepRwjJdu+IUlS6tZvHsmGl9xEyeb1Sx
         3SKvn+DRTt/isqXHMqrhmlYRSXhp+F1aJDOEJ64/okBd62BZi6jPLC5Whc6DWGVPImCd
         Mj21wfRHgtGZB4/WKHQGBMiAobe+lLiYxUCMKUE4wphn71UpQnGMmgjQtepXvsCgKDV7
         kz6oWk824UO0+8WVi7I8WwqSGXJDNlSl7DE/nLyJ/HdJh0rf+pk4p0ikQbmJfk1Q7FAd
         RogQ==
X-Gm-Message-State: AOJu0YzKjCWvYQpIg2Fu7cK6i2oNhgG80ZPbfDcaHxt2pbucpmM76/1b
	Lz1XyejxGkgBytgdQIYQItsXr5E0j8dZ+HtVp14S9giqBBVlQQag
X-Google-Smtp-Source: AGHT+IFXNzbhuclNbfEZdBE4eJZUSweezFj6xP8a2IZt/uTSmSn8t2yUDd3leLfO3tyGlIvwJiYWXg==
X-Received: by 2002:a2e:93c2:0:b0:2d6:dbf2:bb19 with SMTP id p2-20020a2e93c2000000b002d6dbf2bb19mr1503100ljh.50.1711627978242;
        Thu, 28 Mar 2024 05:12:58 -0700 (PDT)
Received: from YOGA.local ([2a06:c701:736b:f200:125e:963c:4e4b:b7c5])
        by smtp.gmail.com with ESMTPSA id bd11-20020a05600c1f0b00b00415460a63ebsm1416456wmb.29.2024.03.28.05.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 05:12:57 -0700 (PDT)
From: Shahar Avidar <ikobh7@gmail.com>
To: gregkh@linuxfoundation.org,
	hverkuil-cisco@xs4all.nl,
	andriy.shevchenko@linux.intel.com,
	robh@kernel.org,
	felixkimbu1@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] staging: pi433: Remove duplicated code using the "goto" error recovery scheme.
Date: Thu, 28 Mar 2024 14:12:44 +0200
Message-Id: <20240328121244.1244719-7-ikobh7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240328121244.1244719-1-ikobh7@gmail.com>
References: <20240328121244.1244719-1-ikobh7@gmail.com>
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
 drivers/staging/pi433/pi433_if.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/pi433/pi433_if.c b/drivers/staging/pi433/pi433_if.c
index 62ce75b07bf0..e538f1d4e787 100644
--- a/drivers/staging/pi433/pi433_if.c
+++ b/drivers/staging/pi433/pi433_if.c
@@ -1400,24 +1400,25 @@ static int __init pi433_init(void)
 	 */
 	status = alloc_chrdev_region(&pi433_devt, 0, N_PI433_MINORS, "pi433");
 	if (status < 0)
-		return status;
+		goto fail;
 
 	status = class_register(&pi433_class);
-	if (status) {
-		unregister_chrdev(MAJOR(pi433_devt),
-				  pi433_spi_driver.driver.name);
-		return status;
-	}
+	if (status)
+		goto unreg_chrdev;
 
 	root_dir = debugfs_create_dir(KBUILD_MODNAME, NULL);
 
 	status = spi_register_driver(&pi433_spi_driver);
-	if (status < 0) {
-		class_unregister(&pi433_class);
-		unregister_chrdev(MAJOR(pi433_devt),
-				  pi433_spi_driver.driver.name);
-	}
+	if (status < 0)
+		goto unreg_class;
 
+	return 0;
+
+unreg_class:
+	class_unregister(&pi433_class);
+unreg_chrdev:
+	unregister_chrdev(MAJOR(pi433_devt), pi433_spi_driver.driver.name);
+fail:
 	return status;
 }
 
-- 
2.34.1

