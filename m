Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804631C9B9B
	for <linux-staging@lists.linux.dev>; Thu, 26 Dec 2024 19:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735242578; cv=none; b=ilx6TrFo81Eevb3dIDIJ5FJjrwkly1jwMpMTqgPFNCpIER8vLjVqge0SaWyRTkotm/58uW6TFy02KJlB/OOmMMBS4Hqh0krGJjpcYUC9S3xHN6Ydf+1So/+HrZujahDVRAAJEf2hRmCZi3GRCX/mwiK06VV8zPiN6pL+2IdOSAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735242578; c=relaxed/simple;
	bh=4wP+yrbQKdqe7qTF88p0m3AcYeGmFMMgogAzdvOtUzc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TTbz3CWDdF5HnyTEuvXz28bKlTKXCGnk8k+Wuo0VnxL+oVZ7r+mnxmQUNaVQEBKthBpDRNspg/QL6EZ4jeW7VF//acvXDuX8bGqtrDA6G6ucob32QWEQhpeuTh5qhOyjsOKoJvOT1E+Nb6OD3rbAsfxelkHL8Xhwbp2BuhdUZtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R8ozkRPD; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R8ozkRPD"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-216513f8104so8882815ad.2
        for <linux-staging@lists.linux.dev>; Thu, 26 Dec 2024 11:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735242577; x=1735847377; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OuuMFLa1FGsu6aUaZ3Bcceiqnb07JBfGbEvGz7MoD9g=;
        b=R8ozkRPDX4TWz4ZtQvrmFU+j0SJ6n3tBuWI3hUOnqWyAB+mFDGuqcQYXtwl6Ds7Jeh
         JjSomPomF9xsEgrQaaEnP6e75k4n6GO1kzcTb5xtoXVSD01BsEf+LsBXn073tf1GZOdA
         mJUiD021V2UNXgyQ4ekJLnDm30TFW4fzpMQmW2v0hqHjj0dE+VPew1Na80N25IZLm9MY
         Y0Nrpo9CmCbKrgRBDpQ3QFe01/999EX2UWwL/+9znvJDbpOfQfQGZsKE07/RgEUwVqGe
         aVbPAyPmLbbiayWkTqRnifeYhOhY0KdIkHKDV2RxgkwjXFZPLlSWLMufEr4T+299H0UM
         ku4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735242577; x=1735847377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OuuMFLa1FGsu6aUaZ3Bcceiqnb07JBfGbEvGz7MoD9g=;
        b=QnwP4iduK3xbhbUtbW4kPT+eyy5JZQXY7mc/L9qy6mrpjDexsUF+2nXTD+FFzb8oeU
         NhUzvsKdJJsm3coIugKF8AWggKAitPq5bozWJzdiQGJJSZAR16LQiyBmX8YrIryn6TMO
         c3wezGmvwVlXPfy3EEY/HDIHgXB2jG9o8VHSKhhGSyNIuzopu1csHCpECavFamtJlK0U
         T65iHm2/iQ73MUYUqi0eTozoB2XvEOkyjXM2aNxAay3P65DJf5JK1DQWuHR6w7UA7NMO
         h7lYvlK7zaBqLO4C9/SNvQzMqsMd4SX7SKg02P+cjc5aPFlXCjX9Vae0n6BGLBSVfA+m
         3YJg==
X-Forwarded-Encrypted: i=1; AJvYcCXlCyVtEDunDM1zvuG/IMOjk0OoyhOAy7MdC4fldb1J3wLd/2dfVCiyGYrxFYtgEqZLAwqyP5HeB1lvhOqt@lists.linux.dev
X-Gm-Message-State: AOJu0YyrwnuGm47N3Q2kWS6wBMK3e/SIZ0ux69i0ncIoOHdUNzIyWlOD
	62cl7eLVXsbxYt0Ft24/Dx7nJykQ8NPeXUE46/S3Zu3eK8YkWY0o
X-Gm-Gg: ASbGncvoiHy+uT/KWupH9ZXGp6XGTACRsH2v3Lzr+AcYJ3HqA/mT739lH+1tnoDKT7R
	OicK1kPCXKn++l5Al3tW47Z09QvML96GSOakmzyh6c82DDjHK1qxmAcqvTkrLlyRXepupDL3iW8
	JErtq/KXwPlgizCRqj1DQE7ktH186UNMXt/OYbfNq1ThY1vXJsI7cpMQqBFvku53BHQkycgEbnX
	InW/1DvLIjovZZu8Ljk3QBMyylgZ/f5mDMMDjOnbPdu7OT1ngk+nI8=
X-Google-Smtp-Source: AGHT+IFgeglFpXFOFkkqQVGIgyPBR0JhX/cLzwgARcPCkBLAZt6ScP+DQGnHBOfy7m0VonZ5DXqjZw==
X-Received: by 2002:a17:902:d48e:b0:215:8698:fb02 with SMTP id d9443c01a7336-219e6f05e39mr129712775ad.11.1735242576769;
        Thu, 26 Dec 2024 11:49:36 -0800 (PST)
Received: from ice.. ([171.76.83.141])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842e35d4becsm10304580a12.79.2024.12.26.11.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 11:49:36 -0800 (PST)
From: Nihar Chaithanya <niharchaithanya@gmail.com>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	skhan@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nihar Chaithanya <niharchaithanya@gmail.com>
Subject: [PATCH v4 10/15] staging: gpib: hp_82341: Handle gpib_register_driver() errors
Date: Fri, 27 Dec 2024 01:06:34 +0530
Message-Id: <20241226193637.241049-11-niharchaithanya@gmail.com>
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

Return the error value if the first gpib_register_driver() fails
and if the second gpib_register_driver() fails unregister the first
gpib_register_driver() and return the error value.

Signed-off-by: Nihar Chaithanya <niharchaithanya@gmail.com>
---
 drivers/staging/gpib/hp_82341/hp_82341.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/gpib/hp_82341/hp_82341.c b/drivers/staging/gpib/hp_82341/hp_82341.c
index 8ad1c885a9fb..daf5f6e02bd5 100644
--- a/drivers/staging/gpib/hp_82341/hp_82341.c
+++ b/drivers/staging/gpib/hp_82341/hp_82341.c
@@ -807,9 +807,17 @@ MODULE_DEVICE_TABLE(pnp, hp_82341_pnp_table);
 
 static int __init hp_82341_init_module(void)
 {
-	gpib_register_driver(&hp_82341_unaccel_interface, THIS_MODULE);
-	gpib_register_driver(&hp_82341_interface, THIS_MODULE);
-	return 0;
+	int ret = 0;
+
+	ret = gpib_register_driver(&hp_82341_unaccel_interface, THIS_MODULE);
+	if (ret)
+		return ret;
+
+	ret = gpib_register_driver(&hp_82341_interface, THIS_MODULE);
+	if (ret)
+		gpib_unregister_driver(&hp_82341_unaccel_interface);
+
+	return ret;
 }
 
 static void __exit hp_82341_exit_module(void)
-- 
2.34.1

