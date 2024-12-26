Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14AA270827
	for <linux-staging@lists.linux.dev>; Thu, 26 Dec 2024 19:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735242566; cv=none; b=ALbgPU/GQNNSwGEdCAMq6vgcbqHoak2rQDHZsuN7tg0iIau+6zBeRvQcqFxxXKa7wUA/sw4xlBAspPALjKtg/8rOwpSEdHVsfMIJzvuVOxtmq5a3YI+kVFAbPQ+Ey7oGefCoN4Ypt5GNwamzm9N/Fi3lGGWGPXHVFNVdm4jkkkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735242566; c=relaxed/simple;
	bh=W3ZjR038WD4Bz8igH/5TljAfRXoTF0kna4HuXgpHkW8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GhJ/tR1DO8c/kCSwFisJ8uTjoANacIoXOv2PxZ6y0ySOQSm4DqQAd9dLc8ptc0nzSfXNWHol1voejb9eEVbIzTcLW4+XmXaE6nlVNfelKbKiPXOYW6RW4OQPfBT/kErg98EjuUiIMjPKjdfN9MG7v9/7Xn7hC7N2Kets66rkJ9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JvymMyVW; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JvymMyVW"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-216325f516fso8594245ad.3
        for <linux-staging@lists.linux.dev>; Thu, 26 Dec 2024 11:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735242564; x=1735847364; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wWsepmZqswshDonO9fJBx9b75dLoOUCjODKtIvCqx3A=;
        b=JvymMyVW/YnlH4RWcYRyPlI3Ugcm2xY5Ps6OeOGayo1LDjUitHiE0z3CoWamUg8FdT
         omQdjEuv+iX+7R3y5Y0HQhbIKz1/QYbzYws7/+f1OX6oi1UU9084+dKiT57fcjBsXocd
         5lYcIGRjUGnlw/uO1HMD5dGiiG1j9M+uWSRqYYXgN+yXT+3RqB3Jp/39vpMjjRPeCC5O
         JKet4Fwa7cnIkAPtlsO2BCGbYGpNsfYVrlkb7OvVuw33zzJTxpSR6rC1iRxk9HyzxpLE
         HjN49mCtJ84gogvtFNY6itAIupNZ8zKFmZ3Ar+fkyfSzZIrZT04ouW2/69qnQBZIy2Cq
         hBuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735242564; x=1735847364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wWsepmZqswshDonO9fJBx9b75dLoOUCjODKtIvCqx3A=;
        b=IH8PDXjidW5ni0/8BZNm6xXToulLP8T8xq9rG7dSqxKwn/3epyPBhH6BHCkZfQaSQG
         lVObI4KpRTr/hrh/mIb7/vk4vICIIOAjAr8XeU3zkNWFhKDT1Y/b4cdA0ZNUmf4TFGCe
         mEpulJA4m6N60KJ2YANi550u2gWcijOK9YzomdkLqNQp6tfvVEu6LNh2kSGl87bbmjHH
         +6xNQhL1XJ8JJsfdB1COaTbSpFZ+7R3k/OjvZmTH4oPDRGp40YUDFqE3AbA9gjW5GQO9
         MCtQRvwM2C6xTVAlouhYJt5DR2FtB6vwHIR0+1FTRSfiI8uSiTjUVn+mmf3y6daKnLhh
         CzBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNjBwblGc/ELZb2WPIZE/yvPIB8uQ+yDIuEWYCLh1nlFvT1r2YGTnbIciY2JTTAns1rYRSb1ZiKxAuw+Ki@lists.linux.dev
X-Gm-Message-State: AOJu0YyNN5hPi3M61ilvfrB+zj5hko5V4j4eqGD3g7aILrhKMAiBiwFb
	SfR/+M83QC5FqhToKyFVIXviQsKs4Lhk/W0a1u5MfO+ZLgzqkq4B
X-Gm-Gg: ASbGncsy61rsyGVienok47KJ2Hp4SEeufOkXQT7mELdcArr93WWws3BXj/czxx4nf5y
	9mKurLRt0/uKn0ohxQoyZNZt1Gsb8WBOt8ciG9IK+huypjSUkuN/0rLMRK3cIiCCc4DBa3yth8B
	CVYGUrAk1IaTgddfdG8r3KYja7i7G+xX27zhO2IgsphQYjj7uC5Zv1tpFI3rF0XBlEt8oqY601r
	nkOK60TM0JASkidbAs8Wfb9eLK7DhxkOhiLXjg5Xby54com7olQHVQ=
X-Google-Smtp-Source: AGHT+IFSV+pTPPC3LBKjOHrGxRxrFkz//ki2GUAWYlo0jfonnQE+N294Tc2ESohCWlGyqv3dvEcqIA==
X-Received: by 2002:a05:6a21:e8d:b0:1d9:1894:cdc4 with SMTP id adf61e73a8af0-1e5e0847032mr14245160637.11.1735242564259;
        Thu, 26 Dec 2024 11:49:24 -0800 (PST)
Received: from ice.. ([171.76.83.141])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842e35d4becsm10304580a12.79.2024.12.26.11.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 11:49:24 -0800 (PST)
From: Nihar Chaithanya <niharchaithanya@gmail.com>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	skhan@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nihar Chaithanya <niharchaithanya@gmail.com>
Subject: [PATCH v4 06/15] staging: gpib: fluke: Handle gpib_register_driver() errors
Date: Fri, 27 Dec 2024 01:06:30 +0530
Message-Id: <20241226193637.241049-7-niharchaithanya@gmail.com>
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

Unregister the previous platform driver and gpib registering
functions if subsequent gpib_register_driver() fail and return the
error value.

Signed-off-by: Nihar Chaithanya <niharchaithanya@gmail.com>
---
 drivers/staging/gpib/eastwood/fluke_gpib.c | 28 ++++++++++++++++------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/gpib/eastwood/fluke_gpib.c b/drivers/staging/gpib/eastwood/fluke_gpib.c
index 3f938ab0c84d..2efc0226ec2b 100644
--- a/drivers/staging/gpib/eastwood/fluke_gpib.c
+++ b/drivers/staging/gpib/eastwood/fluke_gpib.c
@@ -1154,17 +1154,31 @@ static int __init fluke_init_module(void)
 	int result;
 
 	result = platform_driver_register(&fluke_gpib_platform_driver);
-	if (result) {
-		pr_err("fluke_gpib: platform_driver_register failed!\n");
+	if (result)
 		return result;
-	}
 
-	gpib_register_driver(&fluke_unaccel_interface, THIS_MODULE);
-	gpib_register_driver(&fluke_hybrid_interface, THIS_MODULE);
-	gpib_register_driver(&fluke_interface, THIS_MODULE);
+	result = gpib_register_driver(&fluke_unaccel_interface, THIS_MODULE);
+	if (result)
+		goto err_unaccel;
+
+	result = gpib_register_driver(&fluke_hybrid_interface, THIS_MODULE);
+	if (result)
+		goto err_hybrid;
+
+	result = gpib_register_driver(&fluke_interface, THIS_MODULE);
+	if (result)
+		goto err_interface;
 
-	pr_info("fluke_gpib\n");
 	return 0;
+
+err_interface:
+	gpib_unregister_driver(&fluke_hybrid_interface);
+err_hybrid:
+	gpib_unregister_driver(&fluke_unaccel_interface);
+err_unaccel:
+	platform_driver_unregister(&fluke_gpib_platform_driver);
+
+	return result;
 }
 
 static void __exit fluke_exit_module(void)
-- 
2.34.1

