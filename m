Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737AF1B4223
	for <linux-staging@lists.linux.dev>; Mon, 30 Dec 2024 19:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735585822; cv=none; b=HUs9R6Oj9dFUnTdUVat5wlzdm/ZJVzQ566dOnNcTXflFI8pPoeSTdRFprCMhKvDtqP9XyhdePZlW8i41RDtYGKWTdeq60a17n1ybGkMCjdJLP2thCmKbvtFgKZwttKyt/K5p3DZit97zx562hszYb08pROuhRSA65HxLGYPhHjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735585822; c=relaxed/simple;
	bh=FdOBvm07WRhrc8V9WZ8IHPlwLxj3SskqRFpD13/zpOI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ujUJ++cwdWcUbl8CTCGelb/QiU8C22UzgKo0QZzFvesxFSO0A/eYbtWcnKAPS5+6h6A8ZytXDk0T2f0jPV3Z9j3YxyWwG4I4l8TNkoC/ma6fm9bA+fyZTMmfRVmP4cULvkJMae+LcApY3ZDgkETJTRU20XmhBJAST00vKV2QwNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HL9n62h8; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HL9n62h8"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-216513f8104so12317705ad.2
        for <linux-staging@lists.linux.dev>; Mon, 30 Dec 2024 11:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735585821; x=1736190621; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FuC1Eh4GEIAGfeAVn4Tmrg5GI4z8tK+6QbisFE+dYUM=;
        b=HL9n62h8Hl3NUJN5bPtUuwaAq6MoQNZmW8gwhv/bTtTNxTNGRSyODKgGrCixaSjdHw
         IqX66dcfrW8KDEbpP7aqT+aSQv+fgdFtdDolOAoivEhyf0UMwJoUsDwV+875OZxRyuUT
         dlSgpaBexpaZMtwtYMyIzIRJobmb+qUkMnt0DO6IkUKMfr9yGQ5ah5AYXVkWgFYiXWgJ
         dVGPwBR8MYQ88lVBVu2PuHigbc3KYitLEgoK1u95aNDmlzxYUw2ul+1NJ9BCfx7CZ3FF
         k+kbkXUqDClg6+eUfFh4mQRQImD5T5MwPccHQ13qKeJ+dJrmGeeM1g4c3GPms2D7ax1u
         VDWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735585821; x=1736190621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FuC1Eh4GEIAGfeAVn4Tmrg5GI4z8tK+6QbisFE+dYUM=;
        b=ux0WN86qRe/citguOEM/QDtPNDUfNT5db+l8b3XBFzjtJQOjCXfH3A+iw/NMQ5r7vP
         fs8rF3iCcLPo7UcQ/JSdtsm6zz25b7bALf9ZB1wUsnglrUgaFHcYwKdKBYXc5Sxr7Buq
         O1w1EYO4lw2rof+ZylVN3mxQRdB2nlcM0tHIBKR/bRW5v4C3L6EZBO0uAEFpY9+hs/JH
         t/bAFJWU4WDIQgViyQKUxOgKlD5cWXwNUgq05jn4XEr9p+Q3fL1QY6X6MOQslvGHnNCK
         FFK3dEqS6TnJYrU1/b0+e7+GvABUBP9GDienl9Ss3Pd+iQRe3W1SGKDtbzI8LzF4zndo
         +Snw==
X-Forwarded-Encrypted: i=1; AJvYcCWSrLlfUZG1PAybQhUgs1esbOR5RuZPm8N0rFOmoqs+uq2aIwXle4D6KPkzcygOWZ2UunpALXhBaE4EhpAn@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9G3RDxi61Jz30pqLOcmDu73WzEtmOysg06yTlpDkxy0EOA7sJ
	FI2PW7t+A8LDHaHChtBWsdbaSlm/3YrR1xwVV9UBjwQ7/TWiw3pz
X-Gm-Gg: ASbGncuZXKJSA4vY4GPBQb0uOXlC4+A+xvo3U9OAql6Kn82ML4w+RwMSLehsu2UG0rD
	CIdz2OBu/8BDp/sq8uQJxqVRXr6mt3M68oDaxLK0TtFfQPoYkAw//+lAKtKvEBaDmmN/uotlKfc
	yX8S78VDuG0LjvAyOVdK73MUWpb2XjSvH0cgy5cOD99Tj14jjPn6GVN/i40bgN3IGBMckQoT4n+
	vriodxFSnNWQklG2D7m5kb4nrLdoloP64Ur176vECzPyOZuxW7W1fk=
X-Google-Smtp-Source: AGHT+IGfpqExbRHhT2oGTBmtIB59layh645hggslp/7+X7S0rB9BspfBOlWo2UqWWUp2+bSyttdBJQ==
X-Received: by 2002:a17:902:e810:b0:216:69ca:772f with SMTP id d9443c01a7336-219e6f1db82mr190732765ad.14.1735585820739;
        Mon, 30 Dec 2024 11:10:20 -0800 (PST)
Received: from ice.. ([171.76.81.193])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc964f09sm182886795ad.26.2024.12.30.11.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 11:10:20 -0800 (PST)
From: Nihar Chaithanya <niharchaithanya@gmail.com>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	skhan@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nihar Chaithanya <niharchaithanya@gmail.com>
Subject: [PATCH v6 15/15] staging: gpib: tnt4882: Handle gpib_register_driver() errors
Date: Tue, 31 Dec 2024 00:26:35 +0530
Message-Id: <20241230185633.175690-16-niharchaithanya@gmail.com>
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

The error value from the init_ni_gpib_cs() function is not
returned and the previous registering functions are not unregistered.

The function gpib_register_driver() can fail and similar to
pcmcia_register_driver() function failing, the previous registering
functions are not unregistered.

Unregister the gpib and pci register functions if the subsequent
gpib or pcmcia register functions fail and return the error value. Add
pr_err() statements indicating the fail and the error value.

Signed-off-by: Nihar Chaithanya <niharchaithanya@gmail.com>
---
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c | 106 +++++++++++++++++---
 1 file changed, 93 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
index e49a952fa0d8..a2549231525b 100644
--- a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
+++ b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
@@ -1524,29 +1524,109 @@ static int __init tnt4882_init_module(void)
 
 	result = pci_register_driver(&tnt4882_pci_driver);
 	if (result) {
-		pr_err("tnt4882: pci_driver_register failed!\n");
+		pr_err("tnt4882_gpib: pci_register_driver failed: error = %d\n", result);
 		return result;
 	}
 
-	gpib_register_driver(&ni_isa_interface, THIS_MODULE);
-	gpib_register_driver(&ni_isa_accel_interface, THIS_MODULE);
-	gpib_register_driver(&ni_nat4882_isa_interface, THIS_MODULE);
-	gpib_register_driver(&ni_nat4882_isa_accel_interface, THIS_MODULE);
-	gpib_register_driver(&ni_nec_isa_interface, THIS_MODULE);
-	gpib_register_driver(&ni_nec_isa_accel_interface, THIS_MODULE);
-	gpib_register_driver(&ni_pci_interface, THIS_MODULE);
-	gpib_register_driver(&ni_pci_accel_interface, THIS_MODULE);
+	result = gpib_register_driver(&ni_isa_interface, THIS_MODULE);
+	if (result) {
+		pr_err("tnt4882_gpib: gpib_register_driver failed: error = %d\n", result);
+		goto err_isa;
+	}
+
+	result = gpib_register_driver(&ni_isa_accel_interface, THIS_MODULE);
+	if (result) {
+		pr_err("tnt4882_gpib: gpib_register_driver failed: error = %d\n", result);
+		goto err_isa_accel;
+	}
+
+	result = gpib_register_driver(&ni_nat4882_isa_interface, THIS_MODULE);
+	if (result) {
+		pr_err("tnt4882_gpib: gpib_register_driver failed: error = %d\n", result);
+		goto err_nat4882_isa;
+	}
+
+	result = gpib_register_driver(&ni_nat4882_isa_accel_interface, THIS_MODULE);
+	if (result) {
+		pr_err("tnt4882_gpib: gpib_register_driver failed: error = %d\n", result);
+		goto err_nat4882_isa_accel;
+	}
+
+	result = gpib_register_driver(&ni_nec_isa_interface, THIS_MODULE);
+	if (result) {
+		pr_err("tnt4882_gpib: gpib_register_driver failed: error = %d\n", result);
+		goto err_nec_isa;
+	}
+
+	result = gpib_register_driver(&ni_nec_isa_accel_interface, THIS_MODULE);
+	if (result) {
+		pr_err("tnt4882_gpib: gpib_register_driver failed: error = %d\n", result);
+		goto err_nec_isa_accel;
+	}
+
+	result = gpib_register_driver(&ni_pci_interface, THIS_MODULE);
+	if (result) {
+		pr_err("tnt4882_gpib: gpib_register_driver failed: error = %d\n", result);
+		goto err_pci;
+	}
+
+	result = gpib_register_driver(&ni_pci_accel_interface, THIS_MODULE);
+	if (result) {
+		pr_err("tnt4882_gpib: gpib_register_driver failed: error = %d\n", result);
+		goto err_pci_accel;
+	}
+
 #ifdef GPIB_PCMCIA
-	gpib_register_driver(&ni_pcmcia_interface, THIS_MODULE);
-	gpib_register_driver(&ni_pcmcia_accel_interface, THIS_MODULE);
-	if (init_ni_gpib_cs() < 0)
-		return -1;
+	result = gpib_register_driver(&ni_pcmcia_interface, THIS_MODULE);
+	if (result) {
+		pr_err("tnt4882_gpib: gpib_register_driver failed: error = %d\n", result);
+		goto err_pcmcia;
+	}
+
+	result = gpib_register_driver(&ni_pcmcia_accel_interface, THIS_MODULE);
+	if (result) {
+		pr_err("tnt4882_gpib: gpib_register_driver failed: error = %d\n", result);
+		goto err_pcmcia_accel;
+	}
+
+	result = init_ni_gpib_cs();
+	if (result) {
+		pr_err("tnt4882_gpib: pcmcia_register_driver failed: error = %d\n", result);
+		goto err_pcmcia_driver;
+	}
 #endif
 
 	mite_init();
 	mite_list_devices();
 
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

