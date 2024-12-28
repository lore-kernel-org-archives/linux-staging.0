Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB9C770E2
	for <linux-staging@lists.linux.dev>; Sat, 28 Dec 2024 06:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735367172; cv=none; b=ox+Hm4OWPDwSFtNL6LVbF8qWKrtaBBre90CFiiCscSSy+7qh2btNhZPDejocB0AWOcrvgOMj55PX8gUdSG6B2KgYCJrlFx5LvsuKrXc4lIsIWvmRF+MnyHnD1Q7IKYOz9OTr1CyBMjnNDQ2Ii/Q7xAVQxZSEuQpo6XbJW8ZkpPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735367172; c=relaxed/simple;
	bh=JOHR5VlRenADrfDOxP16ORU/YMBRx7TeGBJA9vYht4g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XDBroOjEUtz+WHKOOhU1WpJQDfYRBaxKb83q+DNVOn7QK2IWBtCPnq78TrZJnW92qbYa+lEjeCMrks7/DBNbcfi8uA1cAvKvFvUgaYLp+6HGU/7idSesNGuABxv/8QHN5JSjTO2yttVJSnxLqEyjDoEKUg8W6Zmuw3Vc/dM4aJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QaTzktlq; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QaTzktlq"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2f45244a81fso1246764a91.1
        for <linux-staging@lists.linux.dev>; Fri, 27 Dec 2024 22:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735367170; x=1735971970; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Lg9KnA57E9rL6FhvSGYf0hFwAPesmNxIwcx8PKMHC8=;
        b=QaTzktlqbQtVOJrOuK2I00srUR0/JJ8WHFgZX9HsFHJfCWX7J10LO7eRN5J8EgHPYh
         9mMGZ3P3Gop9trhZdTR149n0JWr7ZVNTJ3SUX3qvjS3SgwApBtT9da9Cj31nK6TKDmNI
         j7RJGNmWXA+5dhHMsCCS3D2jtA1WEjC7gfrUk8TsfLKON0S/CscH4Q4H49YfguntQwhG
         RuC0TjA1zICKvTuVWmffaAldQ1kW8W3OzoKvWorRoVRfVumMDSuvOUNGcv/b/jMTkU2L
         gSakPJe6XsSfdCVJvgmPuruacnGrgRBXqthJj9rgrBgWvS7JpP8iBc+Nysnos0S9ikdQ
         eCRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735367170; x=1735971970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Lg9KnA57E9rL6FhvSGYf0hFwAPesmNxIwcx8PKMHC8=;
        b=iNDj2zBvLlpIM0EdlgkgavaT8yAUpMR6UYalvBGvnDtoKc2AvA+9vWBtIoueXUOnH5
         hSem295ItLbqKEMeaQPuEylZDEgW10Gj3LRKe+HnsgnYQtFH9XFCpvfh5TRRQVzxranW
         e/42forl39E8kYjtfvIsW6LBBvSjTWUDsUxVQWUQBnqzo34wk5JXLL6/6Wu3TJo8BKN4
         CLhjtWzYGr+C+bUXQyGPw2sjcaZ5092AwfHf3R3MZ9Wzd5vjWdh4YRD99bTQndZw7zP8
         Zv91pNz4noRHqY1gmtTDFj4meXW/MSzU4mQXDYbcWKj81h7CK31wQfoAfJF/cdQ8V4jl
         x6Ng==
X-Forwarded-Encrypted: i=1; AJvYcCVTmmDesFhEiIdeXjW8hsZzZMVZ+VKpjYC5KNzFbXUpIo+c1HYNsSSuyzUawzqDc4UzuSKkfHFjVKFkJCqT@lists.linux.dev
X-Gm-Message-State: AOJu0YwYFstL2bKoOwF3/h6Hl7yQ/7J4aMtcOpCSB4gxpgqlsi1mJ7gd
	H9RlF2qQ1i3IdWTlQoDN0CS7QSSDHG9KgKPjaHhdbKQnUVI0pYODJJ99X3jV
X-Gm-Gg: ASbGncvQ5e2jPTo66XHHCQ21A/pAlGn8X4dK8n6oHJ5lO6fDlqvVxIzdJVAtnmPMZAy
	ggTbomSs4Y0Nmy0qUkHQR/bvzFwcRE8Cshte7EoXaMEHL+XQ0vWD/9SrIHEaYEf8TehJplOZhML
	j2L/vhJgLHGB/mFMJN64aiFmcyFJCUK9+Sb2Zk0/C1shlENFoO5eJ30M/I92+B4wU5tK/hxlXlI
	nCwzOXHDlZMY2UgN6lsxFCtxhuhKRRgpSFnypjRaJTNhM1nYJKPybs=
X-Google-Smtp-Source: AGHT+IF/QYTqVgHWD4K3RQ9tT8uBym61yV0x80BreLEu4eZVJEZeEPyv7J70tBFrC3fF60LDk2Z6jQ==
X-Received: by 2002:a17:90a:e18c:b0:2ea:5e0c:2844 with SMTP id 98e67ed59e1d1-2f452eac13fmr16865448a91.5.1735367170370;
        Fri, 27 Dec 2024 22:26:10 -0800 (PST)
Received: from ice.. ([171.76.83.141])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f73f6sm144479455ad.222.2024.12.27.22.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 22:26:10 -0800 (PST)
From: Nihar Chaithanya <niharchaithanya@gmail.com>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	skhan@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nihar Chaithanya <niharchaithanya@gmail.com>
Subject: [PATCH v5 11/15] staging: gpib: ines: Handle gpib_register_driver() errors
Date: Sat, 28 Dec 2024 11:37:59 +0530
Message-Id: <20241228060800.107653-12-niharchaithanya@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241228060800.107653-1-niharchaithanya@gmail.com>
References: <20241228060800.107653-1-niharchaithanya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function ines_pcmcia_init_module() can be replaced by calling
pcmcia_register_driver() directly. The error value from this
function is not returned and the previous registering functions
are not unregistered.

The function gpib_register_driver() can fail and similar to
pcmcia_register_driver() function failing, the previous registering
functions are not unregistered.

Replace cb_pcmcia_init_module() with pcmcia_register_driver().
Unregister the gpib and pci register functions if the subsequent
gpib or pcmcia register functions fail and return the error value.

Signed-off-by: Nihar Chaithanya <niharchaithanya@gmail.com>
---
 drivers/staging/gpib/ines/ines_gpib.c | 81 ++++++++++++++++++++-------
 1 file changed, 60 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/gpib/ines/ines_gpib.c b/drivers/staging/gpib/ines/ines_gpib.c
index 9d8387c3bf01..73df4cd16926 100644
--- a/drivers/staging/gpib/ines/ines_gpib.c
+++ b/drivers/staging/gpib/ines/ines_gpib.c
@@ -1227,12 +1227,6 @@ static struct pcmcia_driver ines_gpib_cs_driver = {
 	.resume		= ines_gpib_resume,
 };
 
-int ines_pcmcia_init_module(void)
-{
-	pcmcia_register_driver(&ines_gpib_cs_driver);
-	return 0;
-}
-
 void ines_pcmcia_cleanup_module(void)
 {
 	DEBUG(0, "ines_cs: unloading\n");
@@ -1420,28 +1414,73 @@ void ines_pcmcia_detach(gpib_board_t *board)
 
 static int __init ines_init_module(void)
 {
-	int err = 0;
+	int ret;
 
-	err = pci_register_driver(&ines_pci_driver);
-	if (err) {
-		pr_err("ines_gpib: pci_driver_register failed!\n");
-		return err;
+	ret = pci_register_driver(&ines_pci_driver);
+	if (ret) {
+		pr_err("ines_gpib: pci_driver_register failed: error = %d\n", ret);
+		return ret;
 	}
 
-	gpib_register_driver(&ines_pci_interface, THIS_MODULE);
-	gpib_register_driver(&ines_pci_unaccel_interface, THIS_MODULE);
-	gpib_register_driver(&ines_pci_accel_interface, THIS_MODULE);
-	gpib_register_driver(&ines_isa_interface, THIS_MODULE);
+	ret = gpib_register_driver(&ines_pci_interface, THIS_MODULE);
+	if (ret)
+		goto err_pci;
+
+	ret = gpib_register_driver(&ines_pci_unaccel_interface, THIS_MODULE);
+	if (ret)
+		goto err_pci_unaccel;
+
+	ret = gpib_register_driver(&ines_pci_accel_interface, THIS_MODULE);
+	if (ret)
+		goto err_pci_accel;
+
+	ret = gpib_register_driver(&ines_isa_interface, THIS_MODULE);
+	if (ret)
+		goto err_isa;
+
 #ifdef GPIB_PCMCIA
-	gpib_register_driver(&ines_pcmcia_interface, THIS_MODULE);
-	gpib_register_driver(&ines_pcmcia_unaccel_interface, THIS_MODULE);
-	gpib_register_driver(&ines_pcmcia_accel_interface, THIS_MODULE);
-	err += ines_pcmcia_init_module();
+	ret = gpib_register_driver(&ines_pcmcia_interface, THIS_MODULE);
+	if (ret)
+		goto err_pcmcia;
+
+	ret = gpib_register_driver(&ines_pcmcia_unaccel_interface, THIS_MODULE);
+	if (ret)
+		goto err_pcmcia_unaccel;
+
+	ret = gpib_register_driver(&ines_pcmcia_accel_interface, THIS_MODULE);
+	if (ret)
+		goto err_pcmcia_accel;
+
+	ret = pcmcia_register_driver(&ines_gpib_cs_driver);
+	if (ret)
+		goto err_pcmcia_driver;
 #endif
-	if (err)
-		return -1;
 
+	pr_info("ines_gpib: module init is complete\n");
 	return 0;
+
+#ifdef GPIB_PCMCIA
+err_pcmcia_driver:
+	pr_err("ines_gpib: pcmcia_register_driver failed: error = %d\n", ret);
+	gpib_unregister_driver(&ines_pcmcia_accel_interface);
+err_pcmcia_accel:
+	gpib_unregister_driver(&ines_pcmcia_unaccel_interface);
+err_pcmcia_unaccel:
+	gpib_unregister_driver(&ines_pcmcia_interface);
+err_pcmcia:
+#endif
+	gpib_unregister_driver(&ines_isa_interface);
+err_isa:
+	gpib_unregister_driver(&ines_pci_accel_interface);
+err_pci_accel:
+	gpib_unregister_driver(&ines_pci_unaccel_interface);
+err_pci_unaccel:
+	gpib_unregister_driver(&ines_pci_interface);
+err_pci:
+	pci_unregister_driver(&ines_pci_driver);
+
+	pr_err("ines_gpib: gpib_register_driver failed!\n");
+	return ret;
 }
 
 static void __exit ines_exit_module(void)
-- 
2.34.1

