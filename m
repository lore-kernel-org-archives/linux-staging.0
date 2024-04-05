Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF1113C834
	for <linux-staging@lists.linux.dev>; Fri,  5 Apr 2024 07:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712302819; cv=none; b=AFvuueq+U18qu6AFVjrSwDWNZH6e8/hnt8jWz47No1fmKks4W60KcXquSGmorBwyA4LruuSpsW5ZoLgkHEvnY9VvbQj9eGz0wRXuRPp/4JdbgLQXNqX3MXemi/4tetVcMJwf5lxxbi+/KyKW8UQl3hy/QeOWFpQBvRWvAdCpeJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712302819; c=relaxed/simple;
	bh=t9HJqxPdA5XNwvqxEEAAekCfSRdNt7vbuUaJ67rE5xE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Hnrf5EzcK9haDOGs4DWFv/gH0VhTu7DrSZQ4yE1oEXdovLD/tABtzuSQ1oQRLs4h21XX/B43bmimGmkno3M/f5LM+Sr55/pitZK7QwQ/mKxyj6rVeZ8amwWtlINihCmUX7zbQZ3A9n2rmVfp68O13Ri1R+LEggjrqhfcTdq/MeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fnxSSph2; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fnxSSph2"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4162c2109a5so7955005e9.1
        for <linux-staging@lists.linux.dev>; Fri, 05 Apr 2024 00:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712302816; x=1712907616; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sfMYrnadCJ5fGBi6dgXMCcmaOaqurwY7DOo3APmaJ9E=;
        b=fnxSSph2wwpyArJTGKKn/xnzN9bTPtIIhQjQ9RDpLEEQGikCwBhh6/fQ/u57bAFa7Y
         z6A3m4C/2gwhUGL72TlA4BV44N4jI/33yR42gVYsh8sLsDyqBR1KB2PZ0PNOWRkwqs0P
         NSWxOg6OlQAd4r80NfMuron9oHKYriLCR5uM5lGYcYvxMZBlGzc53Vjw/cLH39i6u3if
         WvaFcH0IT5BYBZqUCg0B8NLVf9xgxr+ujWdxyXrNxR7rrJ1+ktHV8m+Ku1zQzvMcLDBr
         70oajI8sn009kHnSLIyJUaQB49M/iLD2gD2Lu/xL/z+UYn79bqRbGsq/MG/EUGJu7uV2
         KKyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712302816; x=1712907616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sfMYrnadCJ5fGBi6dgXMCcmaOaqurwY7DOo3APmaJ9E=;
        b=jlfx68UjOi5XI7yIT8HLlG7bMkcvOeEh0ZXcrAgZ1/QxxZOb0Cd7LnTDmv+Ow7hW4U
         XHO7RpP2taU+Xm7hQFgSZT0nd+6mdrxNm1KZXTpvU61hwUt6PwCHwA7uEC7310R5W4KG
         gjfUmBqN/xmUIBppxx4Z0Lbc62fLsUj6FHQgMhAVbTWDwScniF2hABJRL+Q56VmeEcQT
         XtVxvXEhHzhpoRPficK1+n381awd9IolYNm27t1rD20YW76MpIqM4iSKR+F6PaWB5oG+
         B+4Op0jAoeAtF6uNWDuG8DXJNRqNTTE4TZjO+bIry5Do9IEaQypU4Y5XB54uxkmjoNQf
         jcAA==
X-Gm-Message-State: AOJu0YxzcYNqo/VEUA1ognvbeGhF+FjfsLC/StCxPM0JNRpeoBsZ5h3e
	lprp4cu8BAXVZgiy368aTFzRWDb2HZrLxJxI8Iu7GMSZqd7xdodV
X-Google-Smtp-Source: AGHT+IF1lzcGczrfopACd2bNaeA2KFZKHgaZLXDgXTnFS30ViuvSTtE/WdMepCeKM5nHgE7NKp1zzg==
X-Received: by 2002:a05:600c:19d1:b0:412:dcab:7c79 with SMTP id u17-20020a05600c19d100b00412dcab7c79mr519544wmq.10.1712302815994;
        Fri, 05 Apr 2024 00:40:15 -0700 (PDT)
Received: from localhost.localdomain ([2a06:c701:737b:ef00:2bdf:f41a:ebd1:fb2c])
        by smtp.gmail.com with ESMTPSA id l10-20020adfe58a000000b003434f526cb5sm1311643wrm.95.2024.04.05.00.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 00:40:15 -0700 (PDT)
From: Shahar Avidar <ikobh7@gmail.com>
To: gregkh@linuxfoundation.org,
	hverkuil-cisco@xs4all.nl,
	andriy.shevchenko@linux.intel.com,
	robh@kernel.org,
	felixkimbu1@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/7] staging: pi433: Remove duplicated code using the "goto" error recovery scheme.
Date: Fri,  5 Apr 2024 10:39:58 +0300
Message-Id: <20240405074000.3481217-6-ikobh7@gmail.com>
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
v2->v3:
        - Undo pi433 init & exit calls reordering. Reorder exit calls in
          a seperate patch.
        - Remove "unreg_spi_drv" tag.
        - Undo return value checking for "debugfs_create_dir".
        - Undo "if" statements update.

 drivers/staging/pi433/pi433_if.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/pi433/pi433_if.c b/drivers/staging/pi433/pi433_if.c
index 62ce75b07bf0..b01ee145ff3c 100644
--- a/drivers/staging/pi433/pi433_if.c
+++ b/drivers/staging/pi433/pi433_if.c
@@ -1403,21 +1403,21 @@ static int __init pi433_init(void)
 		return status;
 
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
+		goto unreg_class_and_remove_dbfs;
 
+	return 0;
+
+unreg_class_and_remove_dbfs:
+	class_unregister(&pi433_class);
+unreg_chrdev:
+	unregister_chrdev(MAJOR(pi433_devt), pi433_spi_driver.driver.name);
 	return status;
 }
 
-- 
2.34.1

