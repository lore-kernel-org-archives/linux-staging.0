Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C4D19CC28
	for <linux-staging@lists.linux.dev>; Mon, 30 Dec 2024 19:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735585820; cv=none; b=YA7bmXO9ogflcLt2OXhBFErn3CL5wBTeEPcXssoi/cxaDBr5dGyuLF8g5zZt4WsgxW8eWAOjI1pje6CZqRjfXh1exlkm49jtPDATa7NNLsvKnLohV1WMbq7O/mHBdjA1Ovc7c7RhAOdAYFtBgrVESqdWCrBY1i25upuBpdMr1KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735585820; c=relaxed/simple;
	bh=KPXSXRlBPRMJiHBCXI6kuUDpKB9leNo+bj39A4iYM/M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dRHNYzXklAZ2itTCNQOelHEWJ5uEOHeOvZJXYRyowssrFb9dTlgFLsA+fevnX5qa4OlIxt/QjiabUNY5lxur/Z5TqCNGyLzFEQC+ADNEWEFdnvHmY82P6M3+455qjzp7Q9Y8J3XDkypI5vl2jKInUSR3Sg8auc9aC4xg3k87v+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RbU3wcHV; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RbU3wcHV"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2162b5d2e1fso15351435ad.3
        for <linux-staging@lists.linux.dev>; Mon, 30 Dec 2024 11:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735585818; x=1736190618; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i+RtJVGqmy9jZtYoNReryShDgdjIDGmle0Bm8XSJeeM=;
        b=RbU3wcHVIWgB8gg7Y3Xid/k9F3la72ujCU/82ym2qxYc+iWFQkmuJ1LRmrWp0STHT9
         zUOdobhZU8VsC3Sw5nlozxmuYAEvArrMdygbCdtt2LVsapHRHFmW3ko9tg276hdcQX9R
         lm9EEwWVfT6tkoEjSqzAIrL4WReg1tyNP9w74hP5t6FX3tQG91NXo1/kdIM5YhIBljlF
         VQXbQ6TRUR+WfTkpN1mB0QXZ3Xoax4sUK+KkUN37RFQpZhTpy0MPTQQ1qLDk/Bk1OM8K
         tC9mlh9RRVbrIdIhETSAc5ZANhhONDtQSDtDgb6R99Pzj5di0Zokzw/0atuOpj4zae8/
         jKXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735585818; x=1736190618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i+RtJVGqmy9jZtYoNReryShDgdjIDGmle0Bm8XSJeeM=;
        b=wNhLsCbffwTelpZZ0rXdKQg7sfOTvBGjPYt9pZ/hRPS446uSBQSwsCVNQllKJLgsCx
         OjIW3FyLldfyMy5Ma5iCoPSm83Gl+UoOLvCXRe3OKlO9ANvIyT5kA8qkLLWHMBp/r4ei
         pNQCwKMDz9b46uTuFKzUdFCIfovuarqi05NfvOiwkxIiigxK7ktQFQu1x1p3o6EUesa+
         Lc2QF+I0QNj5VriS6xVEqrov8/B9nZGbIHvpgvMv75lTudpLSbJ6rUGahmbsnt7PvFIG
         dk+nF5aDqe92RPjDuiPFrG5/G1IxSiaH5D8PHHCm+QcYzVAxyvHCT6/teuIADC/OkpbU
         +eJA==
X-Forwarded-Encrypted: i=1; AJvYcCUhSnt4GlJ6TiN0JGvYEh+sspSU1ql6ziE3L6XSLdeKaY17LDdOVCRXBJPTdCo6fQyycoQ8PXd1UTVyj+Z0@lists.linux.dev
X-Gm-Message-State: AOJu0YyuyIKN+gprgYXcTa045ePcPBf1TxZEf9SsgN2GWEBJiBwMdOYj
	wQhxiU3lwJqO4nFaQ4zyOItfWru1gjn7Kfo/Blx8UrCPobDWMGZbjtptGg==
X-Gm-Gg: ASbGncvOrEPuR6KJiZYmLVywyLnSEBwW7TZ3vE2K+xfD68iqnPxP56R2risEvjp8eoz
	wNyrrqunLGa1G0S86TAWkpXK/VAWvXRQ6/82Ok6F73urD8Xx+jAORivM6Wuhu73yUx1sYrXrbOV
	ObLWF3uAvWz83KX8W93qKirtI4+c3rF4g1NsU5avLW18UQwQKIScWwOGcvOJT0pJWk/9HdEmWnz
	Pf7XkGRCsZvHdk090WPrQkpDmR3tdS37yAImMDi94tsY7UL1CeK2qc=
X-Google-Smtp-Source: AGHT+IGBiIZXCO3lxy5cPikGgYE0wWN5YV97YMPv75GMxPeGW6irlOBjjMtZCu94t81s0U0kQ9b5xw==
X-Received: by 2002:a17:902:e848:b0:215:740b:d3ec with SMTP id d9443c01a7336-219e6f1db38mr191724365ad.14.1735585818107;
        Mon, 30 Dec 2024 11:10:18 -0800 (PST)
Received: from ice.. ([171.76.81.193])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc964f09sm182886795ad.26.2024.12.30.11.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 11:10:17 -0800 (PST)
From: Nihar Chaithanya <niharchaithanya@gmail.com>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	skhan@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nihar Chaithanya <niharchaithanya@gmail.com>
Subject: [PATCH v6 14/15] staging: gpib: pc2: Handle gpib_register_driver() errors
Date: Tue, 31 Dec 2024 00:26:34 +0530
Message-Id: <20241230185633.175690-15-niharchaithanya@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241230185633.175690-1-niharchaithanya@gmail.com>
References: <20241230185633.175690-1-niharchaithanya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function gpib_register_driver() can fail, resulting in a
semi-registered module and does not return an error value if it
fails.

Unregister the previous gpib registering functions if subsequent
gpib_register_driver() fail and return the error value. Add pr_err()
statements indicating the fail and error value.

Signed-off-by: Nihar Chaithanya <niharchaithanya@gmail.com>
---
 drivers/staging/gpib/pc2/pc2_gpib.c | 38 ++++++++++++++++++++++++++---
 1 file changed, 34 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/gpib/pc2/pc2_gpib.c b/drivers/staging/gpib/pc2/pc2_gpib.c
index 7b3b34f47341..a9aae563f60a 100644
--- a/drivers/staging/gpib/pc2/pc2_gpib.c
+++ b/drivers/staging/gpib/pc2/pc2_gpib.c
@@ -635,12 +635,42 @@ void pc2_2a_detach(gpib_board_t *board)
 
 static int __init pc2_init_module(void)
 {
-	gpib_register_driver(&pc2_interface, THIS_MODULE);
-	gpib_register_driver(&pc2a_interface, THIS_MODULE);
-	gpib_register_driver(&pc2a_cb7210_interface, THIS_MODULE);
-	gpib_register_driver(&pc2_2a_interface, THIS_MODULE);
+	int ret;
+
+	ret = gpib_register_driver(&pc2_interface, THIS_MODULE);
+	if (ret) {
+		pr_err("pc2_gpib: gpib_register_driver failed: error = %d\n", ret);
+		return ret;
+	}
+
+	ret = gpib_register_driver(&pc2a_interface, THIS_MODULE);
+	if (ret) {
+		pr_err("pc2_gpib: gpib_register_driver failed: error = %d\n", ret);
+		goto err_pc2a;
+	}
+
+	ret = gpib_register_driver(&pc2a_cb7210_interface, THIS_MODULE);
+	if (ret) {
+		pr_err("pc2_gpib: gpib_register_driver failed: error = %d\n", ret);
+		goto err_cb7210;
+	}
+
+	ret = gpib_register_driver(&pc2_2a_interface, THIS_MODULE);
+	if (ret) {
+		pr_err("pc2_gpib: gpib_register_driver failed: error = %d\n", ret);
+		goto err_pc2_2a;
+	}
 
 	return 0;
+
+err_pc2_2a:
+	gpib_unregister_driver(&pc2a_cb7210_interface);
+err_cb7210:
+	gpib_unregister_driver(&pc2a_interface);
+err_pc2a:
+	gpib_unregister_driver(&pc2_interface);
+
+	return ret;
 }
 
 static void __exit pc2_exit_module(void)
-- 
2.34.1

