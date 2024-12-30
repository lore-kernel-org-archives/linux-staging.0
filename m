Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A11119D089
	for <linux-staging@lists.linux.dev>; Mon, 30 Dec 2024 19:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735585800; cv=none; b=hqL8SprVxXasYElmgkbIGw8/dkggvSMwi4xATTuiRp58gvVBYN0B9TBjlwYhtm5eU4uMsgsFVvFI0PX2LqcWUTJ9s2yDNT9OQR4mW4+PQsizCB53wI03JXbISHyWnrq9jjIqQK876/W8oX+q2TjK8m/3M6957EKBZoWzwse4ulg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735585800; c=relaxed/simple;
	bh=U0LR+ju8rwEbUYvjjB6dvQR6mgJyl8PNHTJ4E1BXUaA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=osb5WTYbuJ3bDjJODoxQJdsjqNHsajmU+uSPpWCeybwT4Nhgzl4fFhmYGNc+OyGlVdDoGOcy36bZe7iNRG9XABQq0r6x/6pOnPOytbF4Pu1gMJXz/zGRj3r7VVe6WpPrH7m0mar8SIyAx5JQ463sy2gdxoKLAAM1ts7HqAOC+uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KS2qfL+2; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KS2qfL+2"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2162f968cd7so11594405ad.1
        for <linux-staging@lists.linux.dev>; Mon, 30 Dec 2024 11:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735585797; x=1736190597; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+zv7i60pcLCEcQ9vMbRN2C0yUlcmBpSBVzEJlgDdTbc=;
        b=KS2qfL+2QmJh7+3wHIqC3qKhTgvzDwWrm7w1G2BWv8BsH7vQgUocVaqae3XxR6Ddki
         095fYCllkTQ7gTtSgKla7KF03L5M85K9lIK1/ioBOP9M8I/8pDhydoDOU8g0RFT+aJ4A
         DcoUWB4zh/7U0YC5+3lSXOccgOmnWo297G/pZfgzwPI9XFUzzfQAd2YvZlM6djuVgUls
         wDwqgrrBN2nIxbiHKx6siN1wj3CeDHv39Rh1GwIocxbKkHP5dtUXUwgb1IvzHLuiz+0J
         3CrQrNVv5efUup+F3aSM9gLd/OC8xznnDRJlwZVx4OuuMn/g+5FXiohkKlBJU5/pfIKv
         eFzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735585797; x=1736190597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+zv7i60pcLCEcQ9vMbRN2C0yUlcmBpSBVzEJlgDdTbc=;
        b=Fyl/6OwzX4vHBdrlhJybgkwIjbI9io7++sCQZ1kJLBfxJnh9p8Ew5hmrL5wdbRUZ6n
         +gyu/MH9pUj967jNE0ndx//Bcrz7QZhE8W7OzL9xz93s9WznsNf0fLT6nxNm2cDlhWUw
         7ZUc6uimLaUN7gtAj+hDe7L3/NfBTFpNJFX+h6US4y8Ps1/mBoAzVXJv1PEqu4GthMuT
         qxQlTSXVSa6+hvxdowEsLW/YrnZYIeFjhdnEcXvAdutCfwettisduwTQgbIaYJpFb6uF
         OC130mqXhF6RJF89LHx3iPRLYl/KIp0l0yqK2FHruGaisCd8Ky9UfS7tP0GHWAgKf2jg
         tLfA==
X-Forwarded-Encrypted: i=1; AJvYcCW49U3vzUR+19xikHoEeGVxfS7+GKwp/gI+GllFTLaBRxN0Meu9XD91NsR6ELMvfR4BG1rXideQkeQrVy4I@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/E+vCe0CRnQzgI7d6yh94qKJjBiQiYSKrzFVQKDKQLXMRC2mN
	AlON7Ib5YJWw6lsu+6V31k5aTXfjssGj1zzpDYuFlUUEz4/6zGZE
X-Gm-Gg: ASbGncsdIJ/fHBPrD+7pINarl0abLNiqS7CGlQr/1HJ+Acws9sLRwwUtY2PpRx8t4aA
	Scc703MmV9gTJAwn9HbYWBLxFikMyB/jupy2tju2kMXO0E7/qMX4L9Z8pphncrVnNMJNuaj4vx0
	wY8tIpWnmr+Guue+ylIaqBN1sNbTjpY7xm2i1g/QsQ0icMZQTmrKWRT1bzyE/bM3m6UCRN5PDwx
	+ZwIUpYGptRv3TfRNEdcVqh0+8j0UBEaeIXCHpVzD9PTz/Cwy+JzDQ=
X-Google-Smtp-Source: AGHT+IESURIwhmTQzoLDKjU6WGUghIO19RfXoTDwFuDIcqeb8wizB7GqrbdJmywOf0ZpuK58FeSNZg==
X-Received: by 2002:a17:902:ebc2:b0:215:9137:32f8 with SMTP id d9443c01a7336-219e6f27555mr190945685ad.15.1735585797408;
        Mon, 30 Dec 2024 11:09:57 -0800 (PST)
Received: from ice.. ([171.76.81.193])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc964f09sm182886795ad.26.2024.12.30.11.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 11:09:57 -0800 (PST)
From: Nihar Chaithanya <niharchaithanya@gmail.com>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	skhan@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nihar Chaithanya <niharchaithanya@gmail.com>
Subject: [PATCH v6 06/15] staging: gpib: fluke: Handle gpib_register_driver() errors
Date: Tue, 31 Dec 2024 00:26:26 +0530
Message-Id: <20241230185633.175690-7-niharchaithanya@gmail.com>
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

The function gpib_register_driver() can fail, resulting in a
semi-registered module and does not return an error value if it
fails.

Unregister the previous platform driver and gpib registering
functions if subsequent gpib_register_driver() fail and return the
error value. Add pr_err() statements indicating the fail and the error
value.

Signed-off-by: Nihar Chaithanya <niharchaithanya@gmail.com>
---
 drivers/staging/gpib/eastwood/fluke_gpib.c | 32 ++++++++++++++++++----
 1 file changed, 27 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/gpib/eastwood/fluke_gpib.c b/drivers/staging/gpib/eastwood/fluke_gpib.c
index 3f938ab0c84d..875b3adcb584 100644
--- a/drivers/staging/gpib/eastwood/fluke_gpib.c
+++ b/drivers/staging/gpib/eastwood/fluke_gpib.c
@@ -1155,16 +1155,38 @@ static int __init fluke_init_module(void)
 
 	result = platform_driver_register(&fluke_gpib_platform_driver);
 	if (result) {
-		pr_err("fluke_gpib: platform_driver_register failed!\n");
+		pr_err("fluke_gpib: platform_driver_register failed: error = %d\n", result);
 		return result;
 	}
 
-	gpib_register_driver(&fluke_unaccel_interface, THIS_MODULE);
-	gpib_register_driver(&fluke_hybrid_interface, THIS_MODULE);
-	gpib_register_driver(&fluke_interface, THIS_MODULE);
+	result = gpib_register_driver(&fluke_unaccel_interface, THIS_MODULE);
+	if (result) {
+		pr_err("fluke_gpib: gpib_register_driver failed: error = %d\n", result);
+		goto err_unaccel;
+	}
+
+	result = gpib_register_driver(&fluke_hybrid_interface, THIS_MODULE);
+	if (result) {
+		pr_err("fluke_gpib: gpib_register_driver failed: error = %d\n", result);
+		goto err_hybrid;
+	}
+
+	result = gpib_register_driver(&fluke_interface, THIS_MODULE);
+	if (result) {
+		pr_err("fluke_gpib: gpib_register_driver failed: error = %d\n", result);
+		goto err_interface;
+	}
 
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

