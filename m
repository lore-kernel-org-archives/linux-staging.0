Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54BB5158853
	for <linux-staging@lists.linux.dev>; Sat, 28 Dec 2024 06:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735367182; cv=none; b=HZ8NT2cXLTR1HABNOlYqgbsWdfLnsG7mcjqVzITZ9L+zNFMiJUKEtvT6tJUKbtezlgMTL9WhLfAze6JBA4GaWTjp+raY4tFeaKJHl9ADPPowxh/Y9tLI3jo0lP2kikv4PZhovlv81F/tNpYKZflXx1daju5HlWt8eFko60DUF7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735367182; c=relaxed/simple;
	bh=au64Cqx/6qafw5PjD7DllligEfi2d3TPqFSMC/o7EE8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tqmPAwg09lNh15VlqOxNanWu4bF9U4g2uTlJ38EYNM8kYoDMJSXw3NCgtLr13tZLyRj2TC4vbN2Fx8BF7u4ypz7xpYheOGse6YRsA54ioj05Mh//+gu0Ku6p5/AECWkVT0UXEKBfZY8HGSsZrB8ykLlJIVjle8C5noMt1o6818A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=akBHCpRA; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="akBHCpRA"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2161a4f86a3so9162645ad.1
        for <linux-staging@lists.linux.dev>; Fri, 27 Dec 2024 22:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735367181; x=1735971981; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FYwhhUU5+JvkMdb/ARwJEzKq3VTQKIxokm8aUHTCdGc=;
        b=akBHCpRAw3L7eG4Lc8tgq5UMX+3riJCVIb5GBXVqZ3UhGoBRP/oiGJMFGjWSlKSrq7
         bsYgxQWYMtk7XfSh2yYOCON4lg9klEO5BidMjqUqz9L8vo3db+P+J6lEGfsfa6klTESw
         hBpasazN04LpKRdAv1XduZ+E8KrEK7D1rZIFlNlY2DSwMP+41VD5W1q79RbEUqkDXgN5
         Eu6/yvXjYr3HaNIek3aNBJ2AjUeVFcgOQKuqEb1r07viTs3PULHzC5LLWmNRETxLkdNe
         iBh/zbbnR1gi8Tvbb/NW0Rw/bwsNsDVO0/U0d3iQ2fs+Zs5/rge7j+llT9p6uG577b2R
         r9/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735367181; x=1735971981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FYwhhUU5+JvkMdb/ARwJEzKq3VTQKIxokm8aUHTCdGc=;
        b=jd/uuEMjtvnztopSXUrJzehJpNnghtGH4s5q7rIHg2gd61uYC9RkKjaEjM5lBnveTW
         VklYa1lYn9OPCxKcGIyjVk6PkcUw0kYYT9ONYIwuAWLdsFmZ9tXK9B21qkIZn6WEMu2D
         6hhnwmnxd/gpyDUrgD9rvs9FSo89Lc+c9BAuwYLU81A4vO62FkUzFTw3Ihm7inh9zwSt
         EcuUks5TqMyG9rQRadRa/GNU5OE5LMLhJItM6rrhU/QdUn8fOPvEl2lgTXhnYTkUp8Ll
         qUCmXLUcJhMCPo+WXhymkVx5jD98hOGQqh8WV591JubIyAcAKSfKPYPeVwDXB3xqKK4f
         rcaQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9Pi6OBDx3aTPuoOAcff/A3CdrbYU56xdKPJgNJXq7ymmRdjJm5NHNnrwKPun+paalvbhamc17bFH2OkPs@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+dj0U3HUy500kb1fmCAtrwt/TqKSSi8MCHntAOLor9rTXBXa5
	fUfV9rucjdNP557p82txK/XjLTqvcCiTA/6Q1QM9Do5fY1XsRmhE
X-Gm-Gg: ASbGncsUrjNnN/NzDd1Vj7ppfoXY/ktQxdxjIurksUbKmiL4LD+vj+vsiPeJP40mKI3
	3vml0xLBH1pe4GqQnGIQNzwLf4U2PlJkgWI18E0G9EwLvRuSCfJZ5l3uBMygVEzjm8RTr8OWMd1
	IZJQnIzQ9SwVDhrnCJ4szArqe4/fEXJNHTvvLk+xqgvCrXcdGvK6VuAl0pKTJiqVc8SfywG/vbx
	7P7XaBo00+IOrDOlyjgKU39q7OU16lmOThINscwzmJgzkycwBcTuXs=
X-Google-Smtp-Source: AGHT+IGI2ouDUS8lEVfyss0H+CtKbXC/zio4nOllHtiI2aYzRsO3rzRg7NByjNEyx5UYRJ/X9Jxd6A==
X-Received: by 2002:a17:902:ecc7:b0:20c:df08:9a78 with SMTP id d9443c01a7336-219e6f26809mr147224445ad.13.1735367180371;
        Fri, 27 Dec 2024 22:26:20 -0800 (PST)
Received: from ice.. ([171.76.83.141])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f73f6sm144479455ad.222.2024.12.27.22.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 22:26:20 -0800 (PST)
From: Nihar Chaithanya <niharchaithanya@gmail.com>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	skhan@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nihar Chaithanya <niharchaithanya@gmail.com>
Subject: [PATCH v5 15/15] staging: gpib: tnt4882: Handle gpib_register_driver() errors
Date: Sat, 28 Dec 2024 11:38:03 +0530
Message-Id: <20241228060800.107653-16-niharchaithanya@gmail.com>
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

The error value from the init_ni_gpib_cs() function is not
returned and the previous registering functions are not unregistered.

The function gpib_register_driver() can fail and similar to
pcmcia_register_driver() function failing, the previous registering
functions are not unregistered.

Unregister the gpib and pci register functions if the subsequent
gpib or pcmcia register functions fail and return the error value.

Signed-off-by: Nihar Chaithanya <niharchaithanya@gmail.com>
---
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c | 87 ++++++++++++++++++---
 1 file changed, 74 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
index e49a952fa0d8..eab7fd121f0c 100644
--- a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
+++ b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
@@ -1524,29 +1524,90 @@ static int __init tnt4882_init_module(void)
 
 	result = pci_register_driver(&tnt4882_pci_driver);
 	if (result) {
-		pr_err("tnt4882: pci_driver_register failed!\n");
+		pr_err("tnt4882_gpib: pci_driver_register failed: error = %d\n", result);
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
 
+	pr_info("tnt4882_gpib: module init is complete\n");
 	return 0;
+
+#ifdef GPIB_PCMCIA
+err_pcmcia_driver:
+	pr_err("tnt4882_gpib: pcmcia_register_driver failed: error = %d\n", result);
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
+	pr_err("tnt4882_gpib: gpib_register_driver failed\n");
+	return result;
 }
 
 static void __exit tnt4882_exit_module(void)
-- 
2.34.1

