Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C3578F2D
	for <linux-staging@lists.linux.dev>; Sat, 28 Dec 2024 06:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735367150; cv=none; b=LMNg1+GfGkmRt9KgWpoWctKbyEe3/t2phMmjjy2wsQOiIQrnkc6fVJw8efSssk8sU0aP+n4COvZRN+T66dsY1zSWxBGlSASejv2xKUlroaKnfNfeczI5En7i9wxyYXvSNNsVJMyK7QFfBbSTTC7EhD3Uzk7NGcN65cft4O16OGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735367150; c=relaxed/simple;
	bh=Nq61v8RMzyneNeymEZ1NLFy0QiAXyCgfX0BhdnsRW6E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kVvftWTU7AsguUgqpeJDjtx3/LONoIO4wsAhy4uIRhHJX50SX47ji5Er5TwhCj+uugEUOQGi9k+eATMz30p59OZSn+mX64reBjzCVDbW4Wo3N43EyESU4IMyHJIjjYGy6/VX2l8IHw6HifrUQCjz1AkZFXbIaw3N+fOph+gueG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Za92+4mW; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Za92+4mW"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ef79243680so1544830a91.2
        for <linux-staging@lists.linux.dev>; Fri, 27 Dec 2024 22:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735367148; x=1735971948; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wGrBqX+xpxpxBlqNE5E6JAoQcVz1pBQLxYqkf+Ez3Qg=;
        b=Za92+4mWt0BvKsD68kK+aTxlwvJBXnkPjhB/77UCasiPLVzco6S53KxHfd8e7Xu8XE
         SH7qqLK3OgwfWpNIHy/20JopjOheWex8pupfxhnMPvD1H0oVXmzCNH/TvKhRQwDRUNrc
         cQRItlg0HIuR3qvohR4nnS1GthcA2cEry79Z2N+K/nUo3kTqsFgzqO9yewnXvxtNtiMN
         vqHTa1V7XzGYJBIhcmvN+V5ZTWaYyCO1I2CaO9hC+Gqk5xLoZn/WyUjaX9BWL3DAXpNa
         H1/MUyfdoUtuwQeZ+zOjnsew5Bs4BHmfO58uo/36VTRgMppITsAL8zY2CdBfIfcFGIO0
         ntWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735367148; x=1735971948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wGrBqX+xpxpxBlqNE5E6JAoQcVz1pBQLxYqkf+Ez3Qg=;
        b=YV/V7+CejfRxFSAXbivOdI8+G7Zixdc0dUaIQIHeFMAujrv5mf1OGlbIkrejrYSsmx
         lpF9JqRaVQz5lJ+RTw17JcBwWGXE+iyCdzQNzKtwvYim/3a6yG+J4wUVV45h5RWseGIN
         DgMeO9uGxnU0cvZatNOlnRhE+4t7YLENgb7gyt02H2UeGVK4hVPXx0haHMx4USIb7Vd1
         0GyDWE5BzzLU0HPsT+LXV+Sz68gLJLs4hIyG3jKviV3IpSQhEGcWwz5zi0WuCrsJvb6w
         RyP+7ogwdC4OHhJkGZXDg+HmvMaFdhcmVV3Ezm+oPlZeaukA1hqIR2c7TM9EmjFRXawU
         3/rQ==
X-Forwarded-Encrypted: i=1; AJvYcCWr4BpIgt5zEMfky5It2PcPhxUk1Rf5XRW0FXB2+y551Z9hyQpnbtuc0S9TyDNmftPJzWgCEF8MnqDiGUJq@lists.linux.dev
X-Gm-Message-State: AOJu0YzXKb+UlMVKZcJoBpsr9CEIO4tQ93Am5OPI8mNrvy2w8CiYnAyg
	f308/7B85X/REFqO4cpIZc4tWJTlkjUsmbMNKtrqfgz0oeIUELjI
X-Gm-Gg: ASbGncuzW21gaAnK278uW7+zhQdXKpnE5gTXIDfU7B8w0HYzXgNaJePmmMf73gcnlyp
	AwBDgPfbIvg3K1YTghjTfNt3SlVln55Gkx6SwlAtPZqB8JspjCYHH2cF8khO6oOvepSXbSE72WZ
	Q0m9HLV5mJPQRmCBxLJsk3QsuLHI0vvXqQnPzIFXC/SQHcTW65b+xKJlwDz23s0vAYgCV0Fd9lc
	gM6YK1TdXcuF5zXYT3d4wDTjYleGCQlTiawmEiO3aS1fPDDRr8KbxU=
X-Google-Smtp-Source: AGHT+IE34WJugC6jURtwoi13oo0OTuvDFgEtZV4kGJozVg9xwI731BZFEIKt0xrgOXddLKrN/0DlYw==
X-Received: by 2002:a17:902:da8d:b0:215:a3fd:61f9 with SMTP id d9443c01a7336-219e6f23908mr149428545ad.15.1735367147931;
        Fri, 27 Dec 2024 22:25:47 -0800 (PST)
Received: from ice.. ([171.76.83.141])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f73f6sm144479455ad.222.2024.12.27.22.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 22:25:47 -0800 (PST)
From: Nihar Chaithanya <niharchaithanya@gmail.com>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	skhan@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nihar Chaithanya <niharchaithanya@gmail.com>
Subject: [PATCH v5 02/15] staging: gpib: agilent_82350b: Handle gpib_register_driver() errors
Date: Sat, 28 Dec 2024 11:37:50 +0530
Message-Id: <20241228060800.107653-3-niharchaithanya@gmail.com>
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

The function gpib_register_driver() can fail which can result in
semi-registered module.

In case gpib_register_driver() fails unregister the previous
gpib and pci registering functions, return the error value.

Signed-off-by: Nihar Chaithanya <niharchaithanya@gmail.com>
---
 .../gpib/agilent_82350b/agilent_82350b.c      | 21 ++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
index 53006d0cc79c..6f077ede86a6 100644
--- a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
+++ b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
@@ -910,13 +910,28 @@ static int __init agilent_82350b_init_module(void)
 
 	result = pci_register_driver(&agilent_82350b_pci_driver);
 	if (result) {
-		pr_err("agilent_82350b: pci_driver_register failed!\n");
+		pr_err("agilent_82350b: pci_driver_register failed: error = %d\n", result);
 		return result;
 	}
 
-	gpib_register_driver(&agilent_82350b_unaccel_interface, THIS_MODULE);
-	gpib_register_driver(&agilent_82350b_interface, THIS_MODULE);
+	result = gpib_register_driver(&agilent_82350b_unaccel_interface, THIS_MODULE);
+	if (result)
+		goto err_unaccel;
+
+	result = gpib_register_driver(&agilent_82350b_interface, THIS_MODULE);
+	if (result)
+		goto err_interface;
+
+	pr_info("agilent_82350b: module init is complete\n");
 	return 0;
+
+err_interface:
+	gpib_unregister_driver(&agilent_82350b_unaccel_interface);
+err_unaccel:
+	pci_unregister_driver(&agilent_82350b_pci_driver);
+
+	pr_err("agilent_82350b: gpib_register_driver failed!\n");
+	return result;
 }
 
 static void __exit agilent_82350b_exit_module(void)
-- 
2.34.1

