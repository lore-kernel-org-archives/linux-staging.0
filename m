Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9442A1C3C04
	for <linux-staging@lists.linux.dev>; Thu, 26 Dec 2024 19:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735242569; cv=none; b=d/SLo2iyuJ51n85w9zYYXEzEIUFh+zaIIXY2kxq6wFm1BfqnPiHHRZypQFwGrB/MtlCzEVK3k0/pR51tHPpamsPVhlOYWQXtt0hXoqyrvANlssI1TABJNHJLes+/E5xa79DcgGohaw4z9Pcu8aE/4KpCx8FRU9R2GsazlJjfQeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735242569; c=relaxed/simple;
	bh=o5Q2vj5i6zwZGZjOwqoP1zbV9zKaCIQkqXtEblYsFK8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KCf6oFzZ6DwbWc5XXqxtQua0lowji2ZGtZ7MmD4SdXrKUEquMQ8ZItjoBefZ6uMLhVHtJB6PXGIGaDDw4n36R8rKdAkIvNoMB2CAjBQZG9/cwy0pmNen4X+rbfLe7DfXOrr3JWIeW5Ve7/BeOSOPhJNlhq/cRStEzmYDEg0XK38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I4dujtcF; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I4dujtcF"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2161d4b820bso8093765ad.1
        for <linux-staging@lists.linux.dev>; Thu, 26 Dec 2024 11:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735242567; x=1735847367; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qzmfsqIqFBfv5O/wsRIwJBpkRaSj938n7kWMDnZ1VX4=;
        b=I4dujtcFNJWIvxRICTuQEN18zBh3h0ehlvwVG//8iOMb/SJfResEShp77Dq2zSEgSH
         HggEct0hZ3J+OuQVJrvpM1hveQml9m6kqkl/yqUtmUnwJ3Guio3UBp5vxA2o7ISuRpdw
         lg2Eq56/bdq2sJovdQL2H/12lhE/VJ2BYK/+UHNqtfKyQyyjkaGsmMg5XkIWS1mZbu18
         EeCfqZ+CysVKgN0zIbECnzf4+6O5JPIwIwynPeIbQuYzf94Qx8Uofn7PlBg2EwFUOa2Y
         QgkWanEmBqJzwS9l+Psw9VJ2cMOvlCXn0FPleIe0v51ygcmL7gUyZp/3gYP2GWv0RlBZ
         WJhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735242567; x=1735847367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qzmfsqIqFBfv5O/wsRIwJBpkRaSj938n7kWMDnZ1VX4=;
        b=KOP96PlxQfZr1SkTe7bv55mIsotZ9e+Xo2vzXtK74AoIZHFfB6fpnuQEwgEa2mmt+7
         YsxVPE1TIzxWA1UI2eELeROWjP8or8CLMZSNl9P4iWpqpuT1+mbuBlPlCSUq3A1XfTu2
         bQiZbzDGMmCfInj9r0DVKU8aGcszpSRc4vtXQHr1BiRUqNphyWQj1tJUC5ZBov2lRMCm
         4JNTBzX3ubK2PyJvHWRMl0cLbylasdX+LQSTDKSV4bqWTjnj9zxr5ILIQogb+t9J4wSq
         f/+1oVIx9fsSpCAbUf27XKyOdoowSpcInhLCsgRYHUF045Y21uuN4zIgU7phJcE6QKtS
         T3Cg==
X-Forwarded-Encrypted: i=1; AJvYcCU2UMnWweYgVTtX1NN3Rag64b8kiYUk7jTxqFHEMll9mFW6w2m5P/nxX+kVWwwxeVWMVcz2eVh30Hpc+SV7@lists.linux.dev
X-Gm-Message-State: AOJu0YzcuDHKbpO8UtDxaLIElrCt43AuYx6Yxi2IAtk16HTl4unkeNb8
	L00+r0SoWASM21xXdD1rOEO3nNJPJInbkEBEAdWWQow/wGZIsWdJ
X-Gm-Gg: ASbGncsrpmFThjp2E2wk5wpVUKL33tWQSt5+6lit11TZ7ZDpd9Ftsp26Ia15P/diJM4
	+T/8pl5npPhU/5EIMboZEQ3YhU5djOJEHlXDSGYOmui0qHFyoqtmoxqu2NmEqoXPHNjnFrfpGQn
	Q76gp8DoeFQHhA0mntkUArN5WVEjAypakZ3Ta8jhCGem68+3sk5nZ60v82rYFruFNOScYd4xBVd
	EKA8gLhvlGkNfk7srULtOOqa1L2PmT1DOECaveQQfz0rVyzu2Y0+GQ=
X-Google-Smtp-Source: AGHT+IFj7MMCkHOLs6KYvDs7vYIZq9uzlP6PD6aH+BBdTWes7047Hhy+pbDfyeW8aWuh5QdCAG0OiQ==
X-Received: by 2002:a17:902:e848:b0:215:740b:d3ec with SMTP id d9443c01a7336-219e6f1db38mr125009825ad.14.1735242566819;
        Thu, 26 Dec 2024 11:49:26 -0800 (PST)
Received: from ice.. ([171.76.83.141])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842e35d4becsm10304580a12.79.2024.12.26.11.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 11:49:26 -0800 (PST)
From: Nihar Chaithanya <niharchaithanya@gmail.com>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	skhan@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nihar Chaithanya <niharchaithanya@gmail.com>
Subject: [PATCH v4 07/15] staging: gpib: fmh: Handle gpib_register_driver() errors
Date: Fri, 27 Dec 2024 01:06:31 +0530
Message-Id: <20241226193637.241049-8-niharchaithanya@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241226193637.241049-1-niharchaithanya@gmail.com>
References: <20241226193637.241049-1-niharchaithanya@gmail.com>
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

Unregister the previous platform driver, pci and gpib registering
functions if subsequent gpib_register_driver() fail and return the
error value.

Signed-off-by: Nihar Chaithanya <niharchaithanya@gmail.com>
---
 drivers/staging/gpib/fmh_gpib/fmh_gpib.c | 43 +++++++++++++++++-------
 1 file changed, 31 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/gpib/fmh_gpib/fmh_gpib.c b/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
index 62791db1c34a..30676f139a61 100644
--- a/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
+++ b/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
@@ -1690,24 +1690,43 @@ static int __init fmh_gpib_init_module(void)
 	int result;
 
 	result = platform_driver_register(&fmh_gpib_platform_driver);
-	if (result) {
-		pr_err("fmh_gpib: platform_driver_register failed!\n");
+	if (result)
 		return result;
-	}
 
 	result = pci_register_driver(&fmh_gpib_pci_driver);
-	if (result) {
-		pr_err("fmh_gpib: pci_driver_register failed!\n");
-		return result;
-	}
+	if (result)
+		goto err_pci_driver;
+
+	result = gpib_register_driver(&fmh_gpib_unaccel_interface, THIS_MODULE);
+	if (result)
+		goto err_unaccel;
 
-	gpib_register_driver(&fmh_gpib_unaccel_interface, THIS_MODULE);
-	gpib_register_driver(&fmh_gpib_interface, THIS_MODULE);
-	gpib_register_driver(&fmh_gpib_pci_unaccel_interface, THIS_MODULE);
-	gpib_register_driver(&fmh_gpib_pci_interface, THIS_MODULE);
+	result = gpib_register_driver(&fmh_gpib_interface, THIS_MODULE);
+	if (result)
+		goto err_interface;
+
+	result = gpib_register_driver(&fmh_gpib_pci_unaccel_interface, THIS_MODULE);
+	if (result)
+		goto err_pci_unaccel;
+
+	result = gpib_register_driver(&fmh_gpib_pci_interface, THIS_MODULE);
+	if (result)
+		goto err_pci;
 
-	pr_info("fmh_gpib\n");
 	return 0;
+
+err_pci:
+	gpib_unregister_driver(&fmh_gpib_pci_unaccel_interface);
+err_pci_unaccel:
+	gpib_unregister_driver(&fmh_gpib_interface);
+err_interface:
+	gpib_unregister_driver(&fmh_gpib_unaccel_interface);
+err_unaccel:
+	pci_unregister_driver(&fmh_gpib_pci_driver);
+err_pci_driver:
+	platform_driver_unregister(&fmh_gpib_platform_driver);
+
+	return result;
 }
 
 static void __exit fmh_gpib_exit_module(void)
-- 
2.34.1

