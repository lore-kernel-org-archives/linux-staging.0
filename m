Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE72188721
	for <linux-staging@lists.linux.dev>; Thu, 26 Dec 2024 19:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735242554; cv=none; b=Yy+TItS/QByv+qUXjJMF/MczfQCpmYs50yOiHZbAUsKGJ5zqBZsGo/Y1R+taY7PfcV+e2vbgq6QqJ8x/xbL38Yiua4nn16o+4IHeSf5EhcnXUQZX9aOW3ljtObxAanc1FNhwH5fvhZOgjjs3toyYRSIUB9InxSD0Sw7oAIWx8FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735242554; c=relaxed/simple;
	bh=3xK8YWYKMbM0mF8SiVUuVBtW3m5mFrfCV2KkOgyI/6g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Hgzd58FaFmdRjQ1PD8mUHi16OiedBwmiBCDf/NEP7VElmgYGeppHt1TdMK5tdSPj1mefcbtlR59sJksKMt9sqQSswk8QIr3qbsb7JUQW0pgs2UxdK20ottzOh2Ol81iymLdw8s9VEcuz8r84cKc39Pt4nyDTrP4cHvmmOF6pZ0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lLisPygI; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lLisPygI"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-21a0374a1fcso5057165ad.2
        for <linux-staging@lists.linux.dev>; Thu, 26 Dec 2024 11:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735242552; x=1735847352; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xpms6VJhoswik5SdrxdqcScRWf09VOg6bXYIyYCcg90=;
        b=lLisPygI/JYNoz7/pIVkPg2mjYU9z0Is+Ly5+AG7omKHK/W5G3FF4FUGjGqWmZVVGu
         18ruoPZvGY0GyxoHGbknfA7+MR42+U16hcU1DPi+1+aWIFcCOpaB5b6fMWBhJxqGnn/4
         9zqgMs4m+eb5sjqfZKArBhs5wWpYELbZgI3/R5E6A3sJCijE6BqPscdVjCZr1SfE7W1e
         dto4q6PT59zItK1ZseR8xibfFA+qMedazc9tKY0Ayj1/s2kdpioYho7bIRiPa+CcymcF
         SZ/GT9WBLlcfRnMxvX1CtpJHP/UbWpFgjDc2ZQmix1kOaznfInunRmUP/A3wwSxzq3DU
         ZDCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735242552; x=1735847352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xpms6VJhoswik5SdrxdqcScRWf09VOg6bXYIyYCcg90=;
        b=if8xb5yzy0QrloL9wog6PhnS3ZPlKxuhbuOf+X+yOPzvH+6Lax8cqpTwwVxerxi8X1
         QyHm5brgkm4bQ7/46Z65wr4Fl8q5BRtARpAmayB3u6DF/wHg+TifGBZJl0BnWYuo7MCq
         WSRI/CfFjWAF7zG/YiT++hEWZEBAqBGvre0e8bJ2j+BMLaZH8i6xwMk0qBTOQ4HG0Ts5
         Bq2FGUS/2yKRC5g9gD4kMN+vQ/uctRsjZkhbD6v/eKphSCJekK1nIHj9MRcYZVuSqehu
         ylyPqP2Du4BiXTS9BLugBGnVf+H3CM1injv+gUp4840hCyWa2Ik9EbyvI99CJj5z2v7c
         wQMA==
X-Forwarded-Encrypted: i=1; AJvYcCWho9XOUelFd8GiV+5kAsTMHJuJNczqKG5sSlaU4oitCBZHgwzREuPMqmguRcqCtYwSIuEfsaAPTnlnnXf7@lists.linux.dev
X-Gm-Message-State: AOJu0Yz47tNWSSu4lDDz6G8LjgAGcxf7/XTJALlFJfqOw2CGs8LZOctK
	DUT1AF6JVuqh+o8xpU7CIyOFClqWpO1akPUcRvTUST8xsCtQmvPI
X-Gm-Gg: ASbGncvZr05pNCQj0JOanvSYgS+DNDCSfaP5hvI2j38cIbfXfHxnJhqKUdVnIZibl8l
	OlOIsPGWUeytB0jNXIjs6c9DdOXUgd7XP+z+Nh6JnTfVDvI818uJ+aia7A2Mq2aN44b0CpmrrDu
	EG6x5UwCzq/S/S2BFn8JYe5vGZA6P4XyNAzRODMjQnaz2tmfFFOYs9ERRGbFyH3a9XHfplQ7vNx
	XMjRkxjHlFazImookcJSi2wnmcZt7/7YH4VAOwft4v+NsdUuXhN6sM=
X-Google-Smtp-Source: AGHT+IG+k5CT+c5AOowokzehQMPwzamNkGyp2o5D6Q6bTpSMc2HBncdJqoX+cMwtCei+Oth9PE2B7g==
X-Received: by 2002:a05:6a20:a105:b0:1cf:2be2:8dd3 with SMTP id adf61e73a8af0-1e5e080df5amr15213315637.12.1735242552466;
        Thu, 26 Dec 2024 11:49:12 -0800 (PST)
Received: from ice.. ([171.76.83.141])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842e35d4becsm10304580a12.79.2024.12.26.11.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 11:49:12 -0800 (PST)
From: Nihar Chaithanya <niharchaithanya@gmail.com>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	skhan@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nihar Chaithanya <niharchaithanya@gmail.com>
Subject: [PATCH v4 02/15] staging: gpib: agilent_82350b: Handle gpib_register_driver() errors
Date: Fri, 27 Dec 2024 01:06:26 +0530
Message-Id: <20241226193637.241049-3-niharchaithanya@gmail.com>
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

The function gpib_register_driver() can fail which can result in
semi-registered module.

In case gpib_register_driver() fails unregister the previous
gpib and pci registering functions, return the error value.

Signed-off-by: Nihar Chaithanya <niharchaithanya@gmail.com>
---
 .../gpib/agilent_82350b/agilent_82350b.c      | 21 ++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
index 53006d0cc79c..39420f2b0b32 100644
--- a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
+++ b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
@@ -909,14 +909,25 @@ static int __init agilent_82350b_init_module(void)
 	int result;
 
 	result = pci_register_driver(&agilent_82350b_pci_driver);
-	if (result) {
-		pr_err("agilent_82350b: pci_driver_register failed!\n");
+	if (result)
 		return result;
-	}
 
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
 	return 0;
+
+err_interface:
+	gpib_unregister_driver(&agilent_82350b_unaccel_interface);
+err_unaccel:
+	pci_unregister_driver(&agilent_82350b_pci_driver);
+
+	return result;
 }
 
 static void __exit agilent_82350b_exit_module(void)
-- 
2.34.1

