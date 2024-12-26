Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCC11D5AD4
	for <linux-staging@lists.linux.dev>; Thu, 26 Dec 2024 19:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735242595; cv=none; b=q+PZhJ5P2SUVwFJne+tsdHq1E807G1ns9Rz70EUlrhSQA6ZoU0qARq/JZZ+iixP8P7ajDDg6pYNteAzMmKqpWqCap0cV3tcOM8JDzDg8EGGDeqbp3JZ3hKS3zhagSIV4XFlnSaL1qS7+pNrM+3XMrXV1ikiuoB5ZGwg5WwtGYPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735242595; c=relaxed/simple;
	bh=jMiBs8Zgo5YGTHOQOrp9o+SytXIc88kul1rGnthOYqQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NFs2pWRQLbYWHEXVYhCveYtvAK32D+2zm9HYGxgMnc89WqTVm8LpNAUvMyCdewJgK9Wq5Jr23Vcdir4h5D9r9F8QUDEhuaWU8vFFj9uvbCeGjVUBhuwWkSoKTIuEBJNIX/Qv0o3K1eWSDWPZLdUQ0sLUnUgQBUnnMZ75600HDck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fll0e8+2; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fll0e8+2"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-215607278acso7770245ad.1
        for <linux-staging@lists.linux.dev>; Thu, 26 Dec 2024 11:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735242593; x=1735847393; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TznYTabiEz88B+6m8vXWxYzFmFYHHBYjakt0e1+7PRs=;
        b=fll0e8+2DXYcnwwKmn954g7kTGZ3gSysArsN7JCvvdq4rvnoWnDznWcuL/6J1gUoft
         vzWB/JhghHY7VVR8gHChqMkESY7+tZEkvxpxNZf0O0bd5sHNWFyNw0GwGW+lD2Bq0+9s
         xu6D9/DlSQDFQsAgY886tfMZ+2/hg9MijRpHu3UlBdN8xQcCgIejtRF9S+PyKOb4MMXv
         bjVu3TwwgA+zyqBdi+J3EwxjwqVWey3viAN9Xucv8i3ZSQXt7xB77vpfpkEpqt5yZj3g
         DGQYd7Lj2UeD7f4PHR6+Y/W53A/e2eA02ydznVDvZYk6LoJYGhZ3rMjGs81CigUCLr3V
         K8sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735242593; x=1735847393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TznYTabiEz88B+6m8vXWxYzFmFYHHBYjakt0e1+7PRs=;
        b=gjm7maONXaUYiZYERGLSF7UXrV241BT0+0gS0BXuSVy0OG51CQRn5IoeMPSAg5xDDw
         kyooxWlexdDWJBNVfeiP3NLNrxY/xRqp9q6ZxDNI2ArBCuqXiVx/QoV64aKthceox70J
         lTPvrgCV1HnC1wiHbLDj6PQIUe4EZ0xEqLifFHPLZ1vZh8KtFx9SP8thzOzmBeMZKAOO
         fRQNRy8a72dVSfuMXRtpKGXIahZ6+naapPIHCbUAvqLPsRH0i+l9HK8CopsM6nzCIh/m
         OyN0UrLeuRY45JNj5jrRwhAJ41klRokBEVG2Yn4FcRi39rtapCiJYsLwdsQVBwGUZyiy
         NMzg==
X-Forwarded-Encrypted: i=1; AJvYcCWZFTyx7W16kcwXfvn7k9mMl3EBKCHzWgHWq51jhzzF5eoZXS1Hp/FaU1NI79PTM24bYmanaHNMkYor3f6p@lists.linux.dev
X-Gm-Message-State: AOJu0YyHoVCxmVfyzKzSxThuEIEdS7G4c9ALVG7/nW7Hx715ItnoBoWr
	Wlj+qDTJfK1tVM+G+0XZbtmpvAzJ0xlmZtAAkks4QNPJQLf6dh5r
X-Gm-Gg: ASbGncvIX0kDznnr7Izm4c0vpDQq8jZgjHWgFxiwYxTmM96uj3IkXE69szciMpn70sz
	ct4pzZWWOeTjjXoTSMi0kCzC4/58QQBeEjcdEAKMcDi6fLMP6r4ba5j0aHRwklsW9sSzsXdwZn+
	jLvleZ9yOXkWAvKBiads2kx1jUSldv9f2mcw7RDi2mMAFm+g+rWBNupia0fhGXWfSM/LGRtkk6K
	sVv9+meXAJM4SFfOu64vMAcuSbaRBJ4TR+E9mFrED6EJcfKBbqu4MA=
X-Google-Smtp-Source: AGHT+IGVQ1GV579fliUueCO8/2rXvmGwAYSEBRixGbdMRH6zyr2YWj1JDjubZFf5hRUy/jJrfRJn2Q==
X-Received: by 2002:a17:902:f681:b0:215:5f17:4296 with SMTP id d9443c01a7336-219e6eb3ac4mr119249375ad.8.1735242593286;
        Thu, 26 Dec 2024 11:49:53 -0800 (PST)
Received: from ice.. ([171.76.83.141])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842e35d4becsm10304580a12.79.2024.12.26.11.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 11:49:53 -0800 (PST)
From: Nihar Chaithanya <niharchaithanya@gmail.com>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	skhan@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nihar Chaithanya <niharchaithanya@gmail.com>
Subject: [PATCH v4 15/15] staging: gpib: tnt4882: Handle gpib_register_driver() errors
Date: Fri, 27 Dec 2024 01:06:39 +0530
Message-Id: <20241226193637.241049-16-niharchaithanya@gmail.com>
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

The error value from the init_ni_gpib_cs() function is not
returned and the previous registering functions are not unregistered.

The function gpib_register_driver() can fail and similar to
pcmcia_register_driver() function failing, the previous registering
functions are not unregistered.

Unregister the gpib and pci register functions if the subsequent
gpib or pcmcia register functions fail and return the error value.

Signed-off-by: Nihar Chaithanya <niharchaithanya@gmail.com>
---
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c | 87 +++++++++++++++++----
 1 file changed, 71 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
index e49a952fa0d8..573544e86598 100644
--- a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
+++ b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
@@ -1523,30 +1523,85 @@ static int __init tnt4882_init_module(void)
 	int result;
 
 	result = pci_register_driver(&tnt4882_pci_driver);
-	if (result) {
-		pr_err("tnt4882: pci_driver_register failed!\n");
+	if (result)
 		return result;
-	}
 
-	gpib_register_driver(&ni_isa_interface, THIS_MODULE);
-	gpib_register_driver(&ni_isa_accel_interface, THIS_MODULE);
-	gpib_register_driver(&ni_nat4882_isa_interface, THIS_MODULE);
-	gpib_register_driver(&ni_nat4882_isa_accel_interface, THIS_MODULE);
-	gpib_register_driver(&ni_nec_isa_interface, THIS_MODULE);
-	gpib_register_driver(&ni_nec_isa_accel_interface, THIS_MODULE);
-	gpib_register_driver(&ni_pci_interface, THIS_MODULE);
-	gpib_register_driver(&ni_pci_accel_interface, THIS_MODULE);
+	result = gpib_register_driver(&ni_isa_interface, THIS_MODULE);
+	if (result)
+		goto err_isa;
+
+	result = gpib_register_driver(&ni_isa_accel_interface, THIS_MODULE);
+	if (result)
+		goto err_isa_accel;
+
+	result = gpib_register_driver(&ni_nat4882_isa_interface, THIS_MODULE);
+	if (result)
+		goto err_nat4882_isa;
+
+	result = gpib_register_driver(&ni_nat4882_isa_accel_interface, THIS_MODULE);
+	if (result)
+		goto err_nat4882_isa_accel;
+
+	result = gpib_register_driver(&ni_nec_isa_interface, THIS_MODULE);
+	if (result)
+		goto err_nec_isa;
+
+	result = gpib_register_driver(&ni_nec_isa_accel_interface, THIS_MODULE);
+	if (result)
+		goto err_nec_isa_accel;
+
+	result = gpib_register_driver(&ni_pci_interface, THIS_MODULE);
+	if (result)
+		goto err_pci;
+
+	result = gpib_register_driver(&ni_pci_accel_interface, THIS_MODULE);
+	if (result)
+		goto err_pci_accel;
+
 #ifdef GPIB_PCMCIA
-	gpib_register_driver(&ni_pcmcia_interface, THIS_MODULE);
-	gpib_register_driver(&ni_pcmcia_accel_interface, THIS_MODULE);
-	if (init_ni_gpib_cs() < 0)
-		return -1;
+	result = gpib_register_driver(&ni_pcmcia_interface, THIS_MODULE);
+	if (result)
+		goto err_pcmcia;
+
+	result = gpib_register_driver(&ni_pcmcia_accel_interface, THIS_MODULE);
+	if (result)
+		goto err_pcmcia_accel;
+
+	result = init_ni_gpib_cs();
+	if (result)
+		goto err_pcmcia_driver;
 #endif
 
 	mite_init();
 	mite_list_devices();
-
 	return 0;
+
+#ifdef GPIB_PCMCIA
+err_pcmcia_driver:
+	gpib_unregister_driver(&ni_pcmcia_accel_interface);
+err_pcmcia_accel:
+	gpib_unregister_driver(&ni_pcmcia_interface);
+err_pcmcia:
+#endif
+	gpib_unregister_driver(&ni_pci_accel_interface);
+err_pci_accel:
+	gpib_unregister_driver(&ni_pci_interface);
+err_pci:
+	gpib_unregister_driver(&ni_nec_isa_accel_interface);
+err_nec_isa_accel:
+	gpib_unregister_driver(&ni_nec_isa_interface);
+err_nec_isa:
+	gpib_unregister_driver(&ni_nat4882_isa_accel_interface);
+err_nat4882_isa_accel:
+	gpib_unregister_driver(&ni_nat4882_isa_interface);
+err_nat4882_isa:
+	gpib_unregister_driver(&ni_isa_accel_interface);
+err_isa_accel:
+	gpib_unregister_driver(&ni_isa_interface);
+err_isa:
+	pci_unregister_driver(&tnt4882_pci_driver);
+
+	return result;
 }
 
 static void __exit tnt4882_exit_module(void)
-- 
2.34.1

