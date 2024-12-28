Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF7986339
	for <linux-staging@lists.linux.dev>; Sat, 28 Dec 2024 06:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735367162; cv=none; b=aW8OmR5FjDdnkxteg0Wmfkr2cCyAw7docLY/g39knQMiV57/ewacwd4R9vK7m7hDI7mjRIpKqcI6lMTP8+xLoaMLQ6zDk6/7BIMjiHFU8G+qoenvZXIuOFxlbfSkqBz+2ur+PFLbBfZLbJtBit/zMdhdDHChRlUpWGrL7G4jB4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735367162; c=relaxed/simple;
	bh=AvE+ZEF1+f7iIqwQfu/zbfsAvnIPkCkHKVLb4bhyW1w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kSuNFqd/Cet9TIs3oVtPh/IINckqaFKxMSBguruyrKKQ+pMrh9B3jDewKbgFltePLTTqfQgo1iqK2v/n/J/OOG7RUfENWmpnIweaDH3j37mcQIpGywBrzCL17nDggjx+ewGNzQIr1yJeHHj+ecDYdmKEVKtop9YWDCB+qS10BUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ts/6WoND; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ts/6WoND"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2f45526dea0so1348784a91.1
        for <linux-staging@lists.linux.dev>; Fri, 27 Dec 2024 22:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735367160; x=1735971960; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i10RE9zyD7IP91+uzWcpn5RslSFQwdTnI7L0HSG2m5Q=;
        b=Ts/6WoNDJApln4crKUiplbX3vECExvPtDWLgenIgnABsSMtAkuvw1TkDxS3nJyHrqZ
         8m2WvR+ZtFAgvtKhOnX1EOXNZ74AuYRQIXMEo3V20UvHNxaYqPKcbh0U0KaaD8rC30W/
         0InTF2y8hSItnriHDjIAPK5TSdqvGVhFiwq7CGNFFm9hV+PJJNn4k57/V8fW99OQg2qk
         dJVOINsU3vTIHRKmkjQZ6rLbEhYmGzz+9roxpHe6Kbz3xtysYf4LnC0uRvGiYoTc9ErI
         MnWg7RU6sFu8aqK4WNzZM1GJI5czXoIvNngKAqiMSsYJVhv/EdI4WuTK92JDD1C/0wDI
         nH9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735367160; x=1735971960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i10RE9zyD7IP91+uzWcpn5RslSFQwdTnI7L0HSG2m5Q=;
        b=Vbk2c3tCFnDaosOpqiFICaed9xr9pYdj+EldiDmOO37dCmN8xlaihFxssvj/C2m5L3
         Tr+IcvQBhcICNFjej/SF6CgDBOniKh+FUpydUJueF4foqSk+x1lSC7cOhcn96RtIYGGd
         t7IVEJhbVbGfCnVEUxNQG+VqEzxu8FLKJCBaR2/EtMLvna+j5jUaBLFKNrG8yIO0TCki
         PijyxYsexY+uSheI0IELy3KXhc7/nK3vZV7fxatDzVWZ7J20Y28WkOQqHgAZQtjrQCXK
         zX6tWeHZO6etr6K3GOoVpw9ZR+1ONoV/XI3aF6ChBdUa/fymVw/ffiYRQkf9wtjTPIqp
         H3mw==
X-Forwarded-Encrypted: i=1; AJvYcCUFGp4l6jn8C/WUtdeBF0MXsrXzPLZJxEM45B3OBPq9H1Eo0fPKI+11TGnPOS5Y2MA+N6sXOiS+V+SEzFAb@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5hBX5qI0aKkW3zaj4v/LJd+qsA6r8ENfBIILG4KONKNkYqGiW
	37KFRJRmXnAnwMoCKpxnWLT+vt50geagXbG0gf8ee5aIKkbAAh2Y
X-Gm-Gg: ASbGncsuyxe7Gj2jJCf78jG774GoMfW0/m1JQbQSg6Wmrul6EjG+/RlBSU6sbQyVroE
	b3Utw6yrngTLJyWXIHs2ou3Ln7DcBmx84rQ2qafVSOCMe8Etw9jNhyV5196ZZQ1mThysnltMXZl
	mnhEdHNMbu3wC9jHrBcE+Cbn9Qz7EgEeAyHOC7R/w4ZkCV2AWlFQaMa2U1D7T2Z29GDpOg73oaW
	HWNATiV/ZGi+4WhX4Vd9qVC9SK+tJZSiLpi5g3mZqjIiGPiAlOZSlc=
X-Google-Smtp-Source: AGHT+IEy/vLKr5CPV9VdQQEIwlzat6XJdWEUeFpDUgNsbgZcgmg+P4UVkPQNt+X6+/m7hOupwakBLA==
X-Received: by 2002:a17:902:f542:b0:215:b8b6:d2c4 with SMTP id d9443c01a7336-219e6e9a23amr150460235ad.4.1735367160439;
        Fri, 27 Dec 2024 22:26:00 -0800 (PST)
Received: from ice.. ([171.76.83.141])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f73f6sm144479455ad.222.2024.12.27.22.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 22:26:00 -0800 (PST)
From: Nihar Chaithanya <niharchaithanya@gmail.com>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	skhan@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nihar Chaithanya <niharchaithanya@gmail.com>
Subject: [PATCH v5 07/15] staging: gpib: fmh: Handle gpib_register_driver() errors
Date: Sat, 28 Dec 2024 11:37:55 +0530
Message-Id: <20241228060800.107653-8-niharchaithanya@gmail.com>
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

The function gpib_register_driver() can fail, resulting in a
semi-registered module and does not return an error value if it
fails.

Unregister the previous platform driver, pci and gpib registering
functions if subsequent gpib_register_driver() fail and return the
error value.

Signed-off-by: Nihar Chaithanya <niharchaithanya@gmail.com>
---
 drivers/staging/gpib/fmh_gpib/fmh_gpib.c | 41 +++++++++++++++++++-----
 1 file changed, 33 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/gpib/fmh_gpib/fmh_gpib.c b/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
index 62791db1c34a..dbade677391b 100644
--- a/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
+++ b/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
@@ -1691,23 +1691,48 @@ static int __init fmh_gpib_init_module(void)
 
 	result = platform_driver_register(&fmh_gpib_platform_driver);
 	if (result) {
-		pr_err("fmh_gpib: platform_driver_register failed!\n");
+		pr_err("fmh_gpib: platform_driver_register failed: error = %d\n", result);
 		return result;
 	}
 
 	result = pci_register_driver(&fmh_gpib_pci_driver);
 	if (result) {
-		pr_err("fmh_gpib: pci_driver_register failed!\n");
-		return result;
+		pr_err("fmh_gpib: pci_register_driver failed: error = %d\n", result);
+		goto err_pci_driver;
 	}
 
-	gpib_register_driver(&fmh_gpib_unaccel_interface, THIS_MODULE);
-	gpib_register_driver(&fmh_gpib_interface, THIS_MODULE);
-	gpib_register_driver(&fmh_gpib_pci_unaccel_interface, THIS_MODULE);
-	gpib_register_driver(&fmh_gpib_pci_interface, THIS_MODULE);
+	result = gpib_register_driver(&fmh_gpib_unaccel_interface, THIS_MODULE);
+	if (result)
+		goto err_unaccel;
+
+	result = gpib_register_driver(&fmh_gpib_interface, THIS_MODULE);
+	if (result)
+		goto err_interface;
+
+	result = gpib_register_driver(&fmh_gpib_pci_unaccel_interface, THIS_MODULE);
+	if (result)
+		goto err_pci_unaccel;
 
-	pr_info("fmh_gpib\n");
+	result = gpib_register_driver(&fmh_gpib_pci_interface, THIS_MODULE);
+	if (result)
+		goto err_pci;
+
+	pr_info("fmh_gpib: module init is complete\n");
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
+	pr_err("fmh_gpib: gpib_register_driver failed\n");
+	return result;
 }
 
 static void __exit fmh_gpib_exit_module(void)
-- 
2.34.1

