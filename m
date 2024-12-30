Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881C019CD17
	for <linux-staging@lists.linux.dev>; Mon, 30 Dec 2024 19:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735585796; cv=none; b=ZdDGX0LmFsYvxPa11WWum6P+euV47QWaG8cm/x+ajjxcelPnC/xWA9YoNiowZf6onxSjsuX44IoM4tpp9GvKyNxNDyDqlxnepkW45B94hJW8S4GQVV6gHj3Mp6TvLZdsJDHq9ERt2pqXTTF/Z+PowXMWbXXHUal3b6a5s9Sukr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735585796; c=relaxed/simple;
	bh=CQeDTHpEokis/9sOyp7wowTDF0BeyBtYFlHbHL8DiVM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jLQnmqEu5s8S87NqQvDypTRCzYCJxOl+YSACTB3sSTTdWnl+KYpmLaBhfGZnJu+6n9MzrwdY/1vsg5I56Mp8YN4yQtR12hQLazUVnmNPNdQkB7NlUbTTFDEKrmOrFrhKUcYMTbizJnJ0SwzRulPLoY+FbiiFvBtmvPDk0v7Hzqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SbzcDPaJ; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SbzcDPaJ"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21a0374a1fcso9936425ad.2
        for <linux-staging@lists.linux.dev>; Mon, 30 Dec 2024 11:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735585794; x=1736190594; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xsa2/8UPc8Me8x5Dx2SCikAH5NYtOL4yIBVFykWklUE=;
        b=SbzcDPaJc9IFq9dX+QEPIjKQrsHGtGKWTcZWD0RzgLJ8V4wZEz64/uJnXPL6iCPrW+
         0OIFIp2RIWkOrAD2uRMjNaGi8kl5bCWk5vRnXZyy2vFgrjgPwv5wdC0hMW9GbC0/Omcn
         kngLqtM1I3UdFslf8XMoPvOBRJXJaEp7+LZ3Gc4qDp0PAM203B8Z7OoLi7XVm+t1KHrz
         5kMsOErPUJI64RQvk3EZ2oxAG3x+dNkkpe2RaUYPSDKVNzY1H0b1kDrZKZIpD0xvmK6r
         uA1WST6CtC3nqsS9WnhzwtLW0ULUxgl7lX2gaWftYKeaZbYc691qK5EzJ/H/q956Erh2
         Znrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735585794; x=1736190594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xsa2/8UPc8Me8x5Dx2SCikAH5NYtOL4yIBVFykWklUE=;
        b=FkHxjoabIgShnYJBzVsEb606u/OBC1pMAUZ7LrcAFTTCZIJ9k+eBfrOqqR3InWU9XF
         H7C6WBXo2gIlopENqFtX+GBQUzzuyEKEXIRhaH7QMAkn5Qk7xiB6LcsFB5Pk/oVz3We4
         A6lA+q8QpWV9i3yKdNX1dXYllgtLd5vGHQACxhjS5CY9DngS1qNdL8GJIch7kcBAhZyo
         xZiVvQYpkjKwGrj0kitJi4VWjZZ7Iawc1HlVYRJkXy+tsbU6+JozDszRw+cLLr15zh3a
         PlK/sRqxgRqwqnFudFO7r7TZL9XhxuBxQ+Vxkg7gWw4YNXMZ9bX1aRaed3IzFVTuhkPB
         FffQ==
X-Forwarded-Encrypted: i=1; AJvYcCXutNb5ifXOQuKiio60Ye4oOlHC+n7iKydJkMUPy2mpqKlbCcbmcfwysJ/o7DweQu0NN4zXaEfLEtm4BAXg@lists.linux.dev
X-Gm-Message-State: AOJu0YydnPFlTIkILsBAkcCrbShdIa+WU28CGoLdICzchi+/MPUFyWrh
	oX43OWPLW+1oO5kcITV0/+ejPwd8en4D0IPpXqUCg3oQauy3gPbj
X-Gm-Gg: ASbGncsXtwv2qeYpTUHeOYkLncJP9C+xMWq5ith2tm1HnbfardhYUPYIhgJVmaHJ2fA
	tioyQcX2PTq2lWf4IZSxiLI4w7ZaK6/9ic3g2PROWA/q1lvjAQMg6GaZYjQ84QyrxFTGadlW5HB
	oMlnpkwmmUYRDcBCmgeE4V6opWUUiNKku3OerhByguo0gSnGfgyN/0npR/FgZVv4a+0DX5pczwk
	+fy6znADeKSU+TbngCNQjrk/NU3x2bdie7nnkFLnW0ZNDSBt9xgZXs=
X-Google-Smtp-Source: AGHT+IEgWZ8CFGHO61/QnxIFYs8noH2nN7yjt92e7XABnMDSgY7V6wf4kSGKGXJrt4Axkvc8tI4UwQ==
X-Received: by 2002:a17:902:f542:b0:215:b8b6:d2c4 with SMTP id d9443c01a7336-219e6e9a23amr190536675ad.4.1735585792238;
        Mon, 30 Dec 2024 11:09:52 -0800 (PST)
Received: from ice.. ([171.76.81.193])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc964f09sm182886795ad.26.2024.12.30.11.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 11:09:51 -0800 (PST)
From: Nihar Chaithanya <niharchaithanya@gmail.com>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	skhan@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nihar Chaithanya <niharchaithanya@gmail.com>
Subject: [PATCH v6 04/15] staging: gpib: cb7210: Handle gpib_register_driver() errors
Date: Tue, 31 Dec 2024 00:26:24 +0530
Message-Id: <20241230185633.175690-5-niharchaithanya@gmail.com>
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

The function cb_pcmcia_init_module() can be replaced by calling
pcmcia_register_driver() directly. The error value from this
function is not returned and the previous registering functions
are not unregistered.

The function gpib_register_driver() can fail and similar to
pcmcia_register_driver() function failing, the previous registering
functions are not unregistered.

Replace cb_pcmcia_init_module() with pcmcia_register_driver().
Unregister the gpib and pci register functions if the subsequent
gpib or pcmcia register functions fail and return the error value.
Add pr_err() statements to indicate the fail and also the error
value.

Signed-off-by: Nihar Chaithanya <niharchaithanya@gmail.com>
---
 drivers/staging/gpib/cb7210/cb7210.c | 116 +++++++++++++++++++++------
 1 file changed, 90 insertions(+), 26 deletions(-)

diff --git a/drivers/staging/gpib/cb7210/cb7210.c b/drivers/staging/gpib/cb7210/cb7210.c
index 63df7f3eb3f3..45a54219ea6d 100644
--- a/drivers/staging/gpib/cb7210/cb7210.c
+++ b/drivers/staging/gpib/cb7210/cb7210.c
@@ -1351,12 +1351,6 @@ static struct pcmcia_driver cb_gpib_cs_driver = {
 	.resume		= cb_gpib_resume,
 };
 
-int cb_pcmcia_init_module(void)
-{
-	pcmcia_register_driver(&cb_gpib_cs_driver);
-	return 0;
-}
-
 void cb_pcmcia_cleanup_module(void)
 {
 	DEBUG(0, "cb_gpib_cs: unloading\n");
@@ -1506,32 +1500,102 @@ void cb_pcmcia_detach(gpib_board_t *board)
 
 static int __init cb7210_init_module(void)
 {
-	int err = 0;
-	int result;
+	int ret;
+
+	ret = pci_register_driver(&cb7210_pci_driver);
+	if (ret) {
+		pr_err("cb7210: pci_register_driver failed: error = %d\n", ret);
+		return ret;
+	}
+
+	ret = gpib_register_driver(&cb_pci_interface, THIS_MODULE);
+	if (ret) {
+		pr_err("cb7210: gpib_register_driver failed: error = %d\n", ret);
+		goto err_pci;
+	}
+
+	ret = gpib_register_driver(&cb_isa_interface, THIS_MODULE);
+	if (ret) {
+		pr_err("cb7210: gpib_register_driver failed: error = %d\n", ret);
+		goto err_isa;
+	}
 
-	result = pci_register_driver(&cb7210_pci_driver);
-	if (result) {
-		pr_err("cb7210: pci_driver_register failed!\n");
-		return result;
+	ret = gpib_register_driver(&cb_pci_accel_interface, THIS_MODULE);
+	if (ret) {
+		pr_err("cb7210: gpib_register_driver failed: error = %d\n", ret);
+		goto err_pci_accel;
 	}
 
-	gpib_register_driver(&cb_pci_interface, THIS_MODULE);
-	gpib_register_driver(&cb_isa_interface, THIS_MODULE);
-	gpib_register_driver(&cb_pci_accel_interface, THIS_MODULE);
-	gpib_register_driver(&cb_pci_unaccel_interface, THIS_MODULE);
-	gpib_register_driver(&cb_isa_accel_interface, THIS_MODULE);
-	gpib_register_driver(&cb_isa_unaccel_interface, THIS_MODULE);
-
-#ifdef GPIB__PCMCIA
-	gpib_register_driver(&cb_pcmcia_interface, THIS_MODULE);
-	gpib_register_driver(&cb_pcmcia_accel_interface, THIS_MODULE);
-	gpib_register_driver(&cb_pcmcia_unaccel_interface, THIS_MODULE);
-	err += cb_pcmcia_init_module();
+	ret = gpib_register_driver(&cb_pci_unaccel_interface, THIS_MODULE);
+	if (ret) {
+		pr_err("cb7210: gpib_register_driver failed: error = %d\n", ret);
+		goto err_pci_unaccel;
+	}
+
+	ret = gpib_register_driver(&cb_isa_accel_interface, THIS_MODULE);
+	if (ret) {
+		pr_err("cb7210: gpib_register_driver failed: error = %d\n", ret);
+		goto err_isa_accel;
+	}
+
+	ret = gpib_register_driver(&cb_isa_unaccel_interface, THIS_MODULE);
+	if (ret) {
+		pr_err("cb7210: gpib_register_driver failed: error = %d\n", ret);
+		goto err_isa_unaccel;
+	}
+
+#ifdef GPIB_PCMCIA
+	ret = gpib_register_driver(&cb_pcmcia_interface, THIS_MODULE);
+	if (ret) {
+		pr_err("cb7210: gpib_register_driver failed: error = %d\n", ret);
+		goto err_pcmcia;
+	}
+
+	ret = gpib_register_driver(&cb_pcmcia_accel_interface, THIS_MODULE);
+	if (ret) {
+		pr_err("cb7210: gpib_register_driver failed: error = %d\n", ret);
+		goto err_pcmcia_accel;
+	}
+
+	ret = gpib_register_driver(&cb_pcmcia_unaccel_interface, THIS_MODULE);
+	if (ret) {
+		pr_err("cb7210: gpib_register_driver failed: error = %d\n", ret);
+		goto err_pcmcia_unaccel;
+	}
+
+	ret = pcmcia_register_driver(&cb_gpib_cs_driver);
+	if (ret) {
+		pr_err("cb7210: pcmcia_register_driver failed: error = %d\n", ret);
+		goto err_pcmcia_driver;
+	}
 #endif
-	if (err)
-		return -1;
 
 	return 0;
+
+#ifdef GPIB_PCMCIA
+err_pcmcia_driver:
+	gpib_unregister_driver(&cb_pcmcia_unaccel_interface);
+err_pcmcia_unaccel:
+	gpib_unregister_driver(&cb_pcmcia_accel_interface);
+err_pcmcia_accel:
+	gpib_unregister_driver(&cb_pcmcia_interface);
+err_pcmcia:
+#endif
+	gpib_unregister_driver(&cb_isa_unaccel_interface);
+err_isa_unaccel:
+	gpib_unregister_driver(&cb_isa_accel_interface);
+err_isa_accel:
+	gpib_unregister_driver(&cb_pci_unaccel_interface);
+err_pci_unaccel:
+	gpib_unregister_driver(&cb_pci_accel_interface);
+err_pci_accel:
+	gpib_unregister_driver(&cb_isa_interface);
+err_isa:
+	gpib_unregister_driver(&cb_pci_interface);
+err_pci:
+	pci_unregister_driver(&cb7210_pci_driver);
+
+	return ret;
 }
 
 static void __exit cb7210_exit_module(void)
-- 
2.34.1

