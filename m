Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B656C8635D
	for <linux-staging@lists.linux.dev>; Sat, 28 Dec 2024 06:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735367160; cv=none; b=ZlxJ6I1/TthnUQU0JKAy0JUf/McACsYZt/MXFXVLh0qdg86jDKDr6aiiU88eoKrs78jcmNiOKjHboqTdS/Tce6OrZbD7J34bNPgYDFs0v/eWO4pIRZZ/w2255nxHeNcnK5odLuKZ9kPjYk/d5MlJ6gr2ebPyB5E/usEzaptOzRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735367160; c=relaxed/simple;
	bh=yVPqatTm3nb3lo+4PPx7gew+RP/CMLCG+wiwCrOc8lk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=q32h3IUZ4DAJg3gkBXWVhfMfdkJKetiphKuGfKa+0FigQ/5QqQHCJnq7gdmw7p9R5UhELPrC46jjDAnuEoNauGJhuGhyouKutd9/BIwjnbU/DbuZ8U2vUNmRjRHoxlZoBi+lrlJ3XJCB1EyO78xCJ2eimXy6faFqwmtUWsAF8Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=njOUEaTh; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="njOUEaTh"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2ef05d0ef18so1546423a91.0
        for <linux-staging@lists.linux.dev>; Fri, 27 Dec 2024 22:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735367158; x=1735971958; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/YrRCMJSbvS2nUHLdxpix76PU/tvLZmPtwFzSlFjSwc=;
        b=njOUEaTho0a5yYoqSBobPnJV8grrs2osajiPcJrIULjrUvUP8eO45HFg0saJrxAvx8
         bs9aNhNsHfOjvT43PE0I1fOz+nHOGWFsIEfqsYukeTNGNlEnkx4I+Tr/nliAG1zA/LaG
         /TbRJCdUlRG8MrdVRSC8Klfb+sBgbWZ3LtIL6lx9yhCfc0YbNWiBXq6dp7H53bpDuDPI
         yDRmnDHpqbSBfkujppkGH/zy6zzLiWP25F3jdvnsKGwRgd5ArSwUoYmCAKhQcF+qHLHM
         anaiYDDngORHZ49uKjLFATCZhrk8A6/12RJ1QJbDd3deWBxWF9dItNWzsK0Auffklh+J
         NXCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735367158; x=1735971958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/YrRCMJSbvS2nUHLdxpix76PU/tvLZmPtwFzSlFjSwc=;
        b=LjhzM2PT5ovb7RbAuXxSR6CcnQi8ExpHU8yxxHbY/Ve9l1Sh//RAvln/K96/wT1oeq
         H6rC7wbCcaGOWF4Y53x8IoD2upVwmkGPK4da4CJoebzzeqaQvN3r+RezWOH0ga9HZBCW
         p6XhS5UqAW4pGbe/HyoiKMEDpt/cP3QahgPB1KJeFepwTcDkWphbAlbzSE8OklcIQ77V
         GcrHh9N5wMhQUq+0b0qereVS8kqoTHnqzhZp2QqBSXJcub09s7SW3GtHTgwsniZ9wVEG
         K+4QQtK4caH+lmPcJMx+TmvOPsUxkA3BUGnQdTtcuLZ1SUpa3zgakliEiHHp3WJ3jAVp
         cedA==
X-Forwarded-Encrypted: i=1; AJvYcCWbkgwT/LbOBo9KpfsLJ4lsyyzJoAJbsfIBY6crp4xHD6iuzbtPxKl9hm89qq9gL9147feIt2DB0tMbutPk@lists.linux.dev
X-Gm-Message-State: AOJu0YygctAB4F84e2WzSK2jvhe/o73lnv06aSbzL70EN0O2VGvWIZfx
	IJSD1HtL5AWKd4JjjLtWHaYTPmS4r1/xW6RyY2U49ziSzn/xd964
X-Gm-Gg: ASbGnctec3YV7DzdWK3eRLCSpNFV4vfbnlP2POKn91ulZuiZa2442FBiOPkuhoP+qjG
	H2n1Mxh3Si7iJcCS0nKmkwdj4MtQLZb1jh6tI96azM/P//JLtZZmZe3gsr2GK+anIXlNgdxNfTW
	jtthZVBilr4qjC5Dy8+0ebdfxXFFLAuXp8l7QNeHQ/A63tm5AHbEUd8eTyxu8ZMGzmkLk8eBY/q
	KvuqnNvCxRu1oZ6svNpT37shdZfNjzcrxd2OVdwrUlu0NWbABG4nzU=
X-Google-Smtp-Source: AGHT+IHvsTPt3/kXcw4a+tj+/Rbl7RKdJWqzN+oAhYNcuJgjtQAGJULbfP6A4n6S3/5pqDlht54PLg==
X-Received: by 2002:a17:902:db08:b0:215:5926:2db2 with SMTP id d9443c01a7336-219e6eadeedmr149427275ad.7.1735367157923;
        Fri, 27 Dec 2024 22:25:57 -0800 (PST)
Received: from ice.. ([171.76.83.141])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f73f6sm144479455ad.222.2024.12.27.22.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 22:25:57 -0800 (PST)
From: Nihar Chaithanya <niharchaithanya@gmail.com>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	skhan@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nihar Chaithanya <niharchaithanya@gmail.com>
Subject: [PATCH v5 06/15] staging: gpib: fluke: Handle gpib_register_driver() errors
Date: Sat, 28 Dec 2024 11:37:54 +0530
Message-Id: <20241228060800.107653-7-niharchaithanya@gmail.com>
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

Unregister the previous platform driver and gpib registering
functions if subsequent gpib_register_driver() fail and return the
error value.

Signed-off-by: Nihar Chaithanya <niharchaithanya@gmail.com>
---
 drivers/staging/gpib/eastwood/fluke_gpib.c | 28 ++++++++++++++++++----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/gpib/eastwood/fluke_gpib.c b/drivers/staging/gpib/eastwood/fluke_gpib.c
index 3f938ab0c84d..285dd5e5ebfc 100644
--- a/drivers/staging/gpib/eastwood/fluke_gpib.c
+++ b/drivers/staging/gpib/eastwood/fluke_gpib.c
@@ -1155,16 +1155,34 @@ static int __init fluke_init_module(void)
 
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
+	if (result)
+		goto err_unaccel;
 
-	pr_info("fluke_gpib\n");
+	result = gpib_register_driver(&fluke_hybrid_interface, THIS_MODULE);
+	if (result)
+		goto err_hybrid;
+
+	result = gpib_register_driver(&fluke_interface, THIS_MODULE);
+	if (result)
+		goto err_interface;
+
+	pr_info("fluke_gpib: module init is complete\n");
 	return 0;
+
+err_interface:
+	gpib_unregister_driver(&fluke_hybrid_interface);
+err_hybrid:
+	gpib_unregister_driver(&fluke_unaccel_interface);
+err_unaccel:
+	platform_driver_unregister(&fluke_gpib_platform_driver);
+
+	pr_err("fluke_gpib: gpib_register_driver failed!\n");
+	return result;
 }
 
 static void __exit fluke_exit_module(void)
-- 
2.34.1

