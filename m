Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9205578F5F
	for <linux-staging@lists.linux.dev>; Sat, 28 Dec 2024 06:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735367155; cv=none; b=o69VsMumr/LmMBKPFCKzZ98xRDqozjELY4SBfAt3WhuFfH7Jv/ARv8GZ8aWMgaZhWgO7IYDZuhAnrrbCmyv4ZCPG0REIR4Q7LnZS3O9rOeL2MhCG+8JMBjKvpxWcq62g2SrKm4cPzGlJNL6RKQ7u1adMwb8jFxBRNNsPVxrzmVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735367155; c=relaxed/simple;
	bh=Tutpev983z6EE15OjUi5XdAWR2lrO2rhXSSiQQA3rHs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=f5a2VR+6QkCmjUPNfpxVcHtmqRrjwkm/BT0Quh5r0Kxyb5Agj1YN4ptn1XnR1snIeQmij+0wsfH3bZtcIsUVqfNBWHZoztf59NPgX+Tpw4HLNiaWXMa5O0Hl9DYlLkBKcvxtftSuuYI9dcKQ3ElnEBeFRl/CC2Xp5NWuB6JIHzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IGXZT0LY; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IGXZT0LY"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2f45526dea0so1348764a91.1
        for <linux-staging@lists.linux.dev>; Fri, 27 Dec 2024 22:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735367153; x=1735971953; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tsT73hso6zzbcSoDclkqzX5laGnzjqz54vFNN1iVypE=;
        b=IGXZT0LYxiSlF4ZWwqrg39HL6zRSzngzz0NFhuz9WUFehmTIYdNscMv78fzbudLFza
         8NCHFwcdrhoQs8yb0cnjnp3Ye1/5XCdFXlEkoJBt9YdOBi1IuwzKvdvvfn76xAzyezoO
         hEv3RBmogs3ak097OnZJTIh8f5qYBUwOoYbRCxSUKMj7MRPub0ZSn7DgEghY6UDAkwkk
         YigePko/n2g8EmmNJLv8SI7L8p/jh1zYRkkrMMq6NggJGQhP8u9rQExuhlxm+DrJSvRO
         u8DcyTcSEKHJf79sFhztbLaaTp8WnbxWNQRI1QnjBBwJZuicX0te47JeDd+9PKEJmtoq
         7l0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735367153; x=1735971953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tsT73hso6zzbcSoDclkqzX5laGnzjqz54vFNN1iVypE=;
        b=hZvf5muMN96OSi4MdTyVwUTymRPRItBsZXthEoccRzsruFLiQ8QONV+M9A48jQlqMV
         d+3KDcFi263kRIz6gMcxjEYfbH6o9Qrn6uuJIBQJw2sufgTucIADV0P/c9C5rND1AgPI
         8XtCd3KLM6bdjNm3q7yivmIUJETWwsDeciFQUDspyT1cREIdiwkscDmJJeHksc+AC5ZW
         mL2+gPSiKfhpPIN2qYPKcK31UDuclO2QekNL6EzBPfBSnlszb4d3sDzFLu5W02IYF3Qv
         H2W+j1R+2uzWZw8FJ7ipHMJ6uVjv2DO8Pt327N9Gobegu7VRJj85/nxC4EDO+Aa3TfS3
         hAHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXI+b50H0SxM60L9ZP1BsTMIFpqnzqkh9gRzl2I4Kop6og8aPz8MUL7qf7FTFnV5OoPu613YgnRV7QqEHP/@lists.linux.dev
X-Gm-Message-State: AOJu0YwOpH7LEGQyy+hUR+CJ/efdqNkqMk85KRyH7ZTT+zTBjDG0xaou
	SJjbRJjxgmix/zS37ko+/18Ik2fVhQyeCSQ4Sq1sOlmKx6YIteC/MMQXVoA95Ek=
X-Gm-Gg: ASbGncuFGnXQ+AUoR1WUf+s4pVQzh80hWlARozqpFkGcAyr4mjpiWDK7RUm5vZqrbAd
	O6xLxRgRr6YUDvW54yIuzhtqOD7V2aT+JWqKqDeOCtp0/+m1XKuhv9ClbRiAI17CYpiI+IYPsWl
	93e6Xy+FnBovMLVghodDDy33Pbo45w5HxZRG8O93V80ahB9YT5OWfspWtf8uLMRevV2LsyCwBvl
	Cp2DKQXVNEw9eSMCLnA/mN/4F4kYaAS6Zv1ECKiONCjY4/mAW90dbA=
X-Google-Smtp-Source: AGHT+IF0Pe30NOhHyAAIhuU6W6LxnWszRwVxuCpdG8J1K9xDRtKCOXb/KZKzensDsAwu0MMfuXptFQ==
X-Received: by 2002:a17:903:2a8c:b0:215:9a73:6c4f with SMTP id d9443c01a7336-219e6e9de89mr155301085ad.6.1735367152936;
        Fri, 27 Dec 2024 22:25:52 -0800 (PST)
Received: from ice.. ([171.76.83.141])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f73f6sm144479455ad.222.2024.12.27.22.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 22:25:52 -0800 (PST)
From: Nihar Chaithanya <niharchaithanya@gmail.com>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	skhan@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nihar Chaithanya <niharchaithanya@gmail.com>
Subject: [PATCH v5 04/15] staging: gpib: cb7210: Handle gpib_register_driver() errors
Date: Sat, 28 Dec 2024 11:37:52 +0530
Message-Id: <20241228060800.107653-5-niharchaithanya@gmail.com>
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

Signed-off-by: Nihar Chaithanya <niharchaithanya@gmail.com>
---
 drivers/staging/gpib/cb7210/cb7210.c | 99 ++++++++++++++++++++--------
 1 file changed, 73 insertions(+), 26 deletions(-)

diff --git a/drivers/staging/gpib/cb7210/cb7210.c b/drivers/staging/gpib/cb7210/cb7210.c
index 63df7f3eb3f3..99041ee007bb 100644
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
@@ -1506,32 +1500,85 @@ void cb_pcmcia_detach(gpib_board_t *board)
 
 static int __init cb7210_init_module(void)
 {
-	int err = 0;
-	int result;
+	int ret;
 
-	result = pci_register_driver(&cb7210_pci_driver);
-	if (result) {
-		pr_err("cb7210: pci_driver_register failed!\n");
-		return result;
+	ret = pci_register_driver(&cb7210_pci_driver);
+	if (ret) {
+		pr_err("cb7210: pci_driver_register failed: error = %d\n", ret);
+		return ret;
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
+	ret = gpib_register_driver(&cb_pci_interface, THIS_MODULE);
+	if (ret)
+		goto err_pci;
+
+	ret = gpib_register_driver(&cb_isa_interface, THIS_MODULE);
+	if (ret)
+		goto err_isa;
+
+	ret = gpib_register_driver(&cb_pci_accel_interface, THIS_MODULE);
+	if (ret)
+		goto err_pci_accel;
+
+	ret = gpib_register_driver(&cb_pci_unaccel_interface, THIS_MODULE);
+	if (ret)
+		goto err_pci_unaccel;
+
+	ret = gpib_register_driver(&cb_isa_accel_interface, THIS_MODULE);
+	if (ret)
+		goto err_isa_accel;
+
+	ret = gpib_register_driver(&cb_isa_unaccel_interface, THIS_MODULE);
+	if (ret)
+		goto err_isa_unaccel;
+
+#ifdef GPIB_PCMCIA
+	ret = gpib_register_driver(&cb_pcmcia_interface, THIS_MODULE);
+	if (ret)
+		goto err_pcmcia;
+
+	ret = gpib_register_driver(&cb_pcmcia_accel_interface, THIS_MODULE);
+	if (ret)
+		goto err_pcmcia_accel;
+
+	ret = gpib_register_driver(&cb_pcmcia_unaccel_interface, THIS_MODULE);
+	if (ret)
+		goto err_pcmcia_unaccel;
+
+	ret = pcmcia_register_driver(&cb_gpib_cs_driver);
+	if (ret)
+		goto err_pcmcia_driver;
 #endif
-	if (err)
-		return -1;
 
+	pr_info("cb7210: module init is complete\n");
 	return 0;
+
+#ifdef GPIB_PCMCIA
+err_pcmcia_driver:
+	pr_err("ines: pcmcia_register_driver failed: error = %d\n", ret);
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
+	pr_err("cb7210: gpib_register_driver failed!\n");
+	return ret;
 }
 
 static void __exit cb7210_exit_module(void)
-- 
2.34.1

