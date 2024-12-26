Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031801B393B
	for <linux-staging@lists.linux.dev>; Thu, 26 Dec 2024 19:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735242563; cv=none; b=TfXsQJ90RV0k13bi/NCaEVNwUptPL1ZYAY+hMVzeYmXoRPxhaAORySvfsh9VeyEzPpVm/WMMmWz5mavcLpObj56Y41AYDUYzSDXAN+pSq5AesU+Q8rOD4Vbc6LZRUz9YIXPXdbi2HsEzQi6uhuQjo5OCeGFvhnsC86c8em6Bf4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735242563; c=relaxed/simple;
	bh=+ihw3GQCK6j9Ewtkfi1LzDB2HWpiS31z6aBWnAR32LU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KDAOmK4HdVN3CZxHfiZfWFcZEzGrgQGNZuxP0ZnLX7hh2OigqdGcWAnQxHzXMTEa7NsoDbOyQ7Z0C25Y1cgPKrUTDBvK2w8VcuxFJzmwcQa/OsKkyzVYv2Gx2lI/8gcfnF/kHDqtWcfJt+pZJ/J90k1aMiQtulpO3hXKCWIblLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hEg087d1; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hEg087d1"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2ef79243680so1289022a91.2
        for <linux-staging@lists.linux.dev>; Thu, 26 Dec 2024 11:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735242559; x=1735847359; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8CFtqKpL2xT789qBVaHSwRjKXZVp5JYOteyLFbQy5ho=;
        b=hEg087d1LFvi3rd3CIprfFPJWrs2y1LGF9GZG6FdaJVUZW7p3YOZgsgpOAeau1fqMc
         Gm1PPxu3xqDqWOIosYrYN71nq7F8xw0Yq5DQgIDVXhVtkK4iWaLqmFvJgSaEwZaogUw4
         SCr7896PE7kBqHBJR1iphtUv1XDQTJdsdaUx1wq9xwPGGp9tpgUyTNw+JS1VGnnLLC8d
         ZQPGfLYhTSpX/LGVWWGEPM01u/4v0Mbw1cfq5mEoV1mE8SJBAy0Uyy7ZzYWLM0ogwyl0
         l3OICHM0V13F22eXZOTGCVsfl+be2gYh8yAkNl+Lf1qY6yygwJL7MzM0r//0Hnod28g5
         +pAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735242559; x=1735847359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8CFtqKpL2xT789qBVaHSwRjKXZVp5JYOteyLFbQy5ho=;
        b=vUuPR6iCMgNy0fDVu929PXcrvpGOQHMSVe9f+vO8v/x/yBZRCCa0aW/5qPyWVuCEVx
         +NnLveZ1Auy7TYMEDzwV/A2rhllcqVelgivAREjKaQcO6V/qpDhHZPA58bquIp1TJeR0
         PUHFOZAwvoPsAsVaBbSkX2YjJHRR/7gLAE48VBRYKZseZxMd8KlyvPFfA71CIWYkeiJl
         VRkuwfjU0S5VVO2np7JbaQc4jsMqHWLhcZYQyocnvKCKftdZPOaoBTuritl00fx4fKM2
         od3E5/5wCtbEXVKS7OgGrYIbBIOt0D7105a35mjgRhCc9RPsMnfvGXEvXVUzecec1YWb
         fqLA==
X-Forwarded-Encrypted: i=1; AJvYcCUaWvWypnpzFOODjYv+B9lEXYsyMvnZHUjxb4NCo0jjKg0fxcLpKaMA3jhbyzrRDghZEdDCEgEWl060c1Lz@lists.linux.dev
X-Gm-Message-State: AOJu0YyZXBh7IicKpkdKXHJ63ly0nvA5aAZB3sZ5FKav8ZXcDAoKyvPX
	5KspHB/wOh8MrzPHTpniBZKP9TGjcWjrj7dwRuyeorKahG7mWyYM
X-Gm-Gg: ASbGncu6twlIkaN7HD2ELvqXgDH80vK5ITwwRTorxv2dg66nYjonGv2i0KpVWgD4uP6
	ZyPED8Zx6KrkgJwN4P23bBpYCixvfSS1flxVRLUyC1FVmtQy3afOyPKsF0aJYzCNYBf1AWGQpXx
	Ps91jqOyLqeT9kd0DAkZ0oLaJHbpq0ffNakIcKTWLN34kJQLFrhKaK25wcsxZ9Ws868iPlDvrlZ
	kHNlT+chZ1FETHREVHtNDspzogN+LEVrBQ9JjBgbE6bjjcVSNbp9Ig=
X-Google-Smtp-Source: AGHT+IFKmz/sisepMc8kR9hLoE13n/o2Jq2Jywmwrtud0r0I/5KQYcu5HoEF6ZT1XonOYEYFApW3wQ==
X-Received: by 2002:a05:6a21:178a:b0:1d8:a203:95a4 with SMTP id adf61e73a8af0-1e5e0481626mr15627422637.5.1735242559217;
        Thu, 26 Dec 2024 11:49:19 -0800 (PST)
Received: from ice.. ([171.76.83.141])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842e35d4becsm10304580a12.79.2024.12.26.11.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 11:49:18 -0800 (PST)
From: Nihar Chaithanya <niharchaithanya@gmail.com>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	skhan@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nihar Chaithanya <niharchaithanya@gmail.com>
Subject: [PATCH v4 04/15] staging: gpib: cb7210: Handle gpib_register_driver() errors
Date: Fri, 27 Dec 2024 01:06:28 +0530
Message-Id: <20241226193637.241049-5-niharchaithanya@gmail.com>
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
 drivers/staging/gpib/cb7210/cb7210.c | 96 ++++++++++++++++++++--------
 1 file changed, 69 insertions(+), 27 deletions(-)

diff --git a/drivers/staging/gpib/cb7210/cb7210.c b/drivers/staging/gpib/cb7210/cb7210.c
index 63df7f3eb3f3..1b7eb9cabcbd 100644
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
@@ -1506,32 +1500,80 @@ void cb_pcmcia_detach(gpib_board_t *board)
 
 static int __init cb7210_init_module(void)
 {
-	int err = 0;
-	int result;
+	int ret;
 
-	result = pci_register_driver(&cb7210_pci_driver);
-	if (result) {
-		pr_err("cb7210: pci_driver_register failed!\n");
-		return result;
-	}
+	ret = pci_register_driver(&cb7210_pci_driver);
+	if (ret)
+		return ret;
+
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
+	ret = pcmcia_register_driver(&cb_gpib_cs_driver);
+	if (ret)
+		goto err_pcmcia_driver;
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

