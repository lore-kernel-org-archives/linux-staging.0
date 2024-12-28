Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D56578F39
	for <linux-staging@lists.linux.dev>; Sat, 28 Dec 2024 06:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735367152; cv=none; b=te8zc5j9gVGB3JggbfjpkdaY+GNe0NwnV7NS2kEckaZNWffdAPuF9tkW81trHAjTas+RxZiCywQRSzgR5hdBJP+ZgWLV8FLiLE1QeA8ypBfDQNuARxL1uukKwoM3PMcep8I1S2tnPujvgekuMYM5spylUL7JeQPG1UJuUbK6wik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735367152; c=relaxed/simple;
	bh=HknnVdrAoIn+nJlztFHyKmtb+blYdrE12/Hfb7B4Ry0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GiNonCFwbnaCSTcpKwLJwHhs/qEhcln5VYdPY7qY7Fu3C+nz9L+/b0DVf5Sgpz1X24L9xODUbTWrLqTyVkSf346anzFygabOqQ6vwkPuSaxjVR+185Qslr9ZV/vwF1UR34SRm1JzfYbi8ozSdsKdSjlrP1FS1w1GcLQ1RXBA2M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cqNHOBN2; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cqNHOBN2"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2ef79243680so1544836a91.2
        for <linux-staging@lists.linux.dev>; Fri, 27 Dec 2024 22:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735367150; x=1735971950; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wSh3xNoLQFQmdQLzK1pTKKth0n6UyT1o++fQHR1qDiU=;
        b=cqNHOBN2w9KX10jKs0HEq0D9UBsnNmfGHIK337Y6Pe/xByWsW2Vvt5vcLVUFiIXidL
         R7K6KMi+AGbFUOJkTYaLfGv14g6DiU3uIIb1PqTik+2qS6KWSFYqZk96PSyWYXwGCYBm
         qwcG4cZRygBoE7UP3J50cKu055+yBHshjsZEt8dKoJy+u9EE7ygP6ujTNlIbiKikx9Mv
         QdmgXh3xJ2o8R8gtBM+kKr6e9C+PYG3rAuHsnediXL8Wz9JNrzBNTTHD6A11V2Yus7Ba
         OQPRItQYpyazNgamGySyXE2/jbCd4uZEEh2xBOdvy1tUp47zHzwdIeBkYFlWVJQ6cYpt
         3g8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735367150; x=1735971950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wSh3xNoLQFQmdQLzK1pTKKth0n6UyT1o++fQHR1qDiU=;
        b=LweYhsj+DqWRVwKb2NFVj9AMfK8rFLfiEeOO9wG1XUiRKVWu0EfBy4D8OSoaSvU/jl
         LEgNrq46NKxgOVOpYxRGyUVaZP1FdQcB4TJHUT6EV3lIvExyL2jIsDqXm1EjfeyxFhuE
         0Ejywv5jFUZtZkQgHYdKaDJuGg6AVq9gXILrX5R3VkL9BeOnFh0PMzGwPlzcK5CmMHvj
         itrvrlqj+fDsgW4biLqno+gA+HNVMT9sZpxRJ1l3ENd/dgAdVTizCqrorWP0RU5vDHtI
         1nXd7kfvbnDKkpAVjEm0u+q+iSi1kdTjfAZdA0INJi8SBOz4x1s6hbX9dNAerofmceXv
         TxNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXX3eqG9b8uK/jD5XXkeosBDN4DTcMxFQgCh5rQvuOfSSFX/3rrkB28OJ8+OhCkjIlfb2BLTz0UAzGxD1sL@lists.linux.dev
X-Gm-Message-State: AOJu0YwDV8YTQa6njK3GhQMvvyObh/1JATuLo5oao/PBW92AkoQ523Gt
	RxdtSjzjVD6WL9wvDZFz6H7T+oAub64HvbReqN4U0ZG7HYE96J1/
X-Gm-Gg: ASbGncv6hW2Kj5UEU+ZriqKJlHJ2kSx78UHGM+IIgNfNVReMI/hIngO+vbTznCsfGxZ
	g6J93jGZ5EvZ6cMYfNcBS4Vq1Yjyqadp1dmTsBtxFRG3Z6ZZzaVk4RL/HfPnMJ6t0rxVdOWhM6F
	fW0MlGs6MTUVROY2xJGaNxWQIgYTY+/yPzr4XUqL+MAM2EI/DTsUNBjJG8qMiJjQRuBT2nNz6Vk
	x2+SVK8za9boS3cZkFgCmQX9JNjoLdhDKmGJl2IGzqZCTkNbOqOAuA=
X-Google-Smtp-Source: AGHT+IEEWV0KnOro+hzZZLFsGmGRJxKNa/TIO39gqgWa2GS8AeZDpp8NzAXVKLfkRDP6jBl2qldaXQ==
X-Received: by 2002:a17:902:e845:b0:215:3862:603a with SMTP id d9443c01a7336-219e6f08c61mr149054125ad.10.1735367150450;
        Fri, 27 Dec 2024 22:25:50 -0800 (PST)
Received: from ice.. ([171.76.83.141])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f73f6sm144479455ad.222.2024.12.27.22.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 22:25:50 -0800 (PST)
From: Nihar Chaithanya <niharchaithanya@gmail.com>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	skhan@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nihar Chaithanya <niharchaithanya@gmail.com>
Subject: [PATCH v5 03/15] staging: gpib: agilent_82357a: Handle gpib_register_driver() errors
Date: Sat, 28 Dec 2024 11:37:51 +0530
Message-Id: <20241228060800.107653-4-niharchaithanya@gmail.com>
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

The usb_register() function can fail and returns an error value which
is not returned. The function gpib_register_driver() can also fail
which can result in semi-registered module.

In case gpib_register_driver() fails unregister the previous usb driver
registering function. Return the error value if gpib_register_driver()
or usb_register() functions fail.

Signed-off-by: Nihar Chaithanya <niharchaithanya@gmail.com>
---
 .../gpib/agilent_82357a/agilent_82357a.c       | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
index bf05fb4a736b..4bdf6ce54622 100644
--- a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
+++ b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
@@ -1691,13 +1691,25 @@ static struct usb_driver agilent_82357a_bus_driver = {
 static int __init agilent_82357a_init_module(void)
 {
 	int i;
+	int ret;
 
-	pr_info("agilent_82357a_gpib driver loading");
 	for (i = 0; i < MAX_NUM_82357A_INTERFACES; ++i)
 		agilent_82357a_driver_interfaces[i] = NULL;
-	usb_register(&agilent_82357a_bus_driver);
-	gpib_register_driver(&agilent_82357a_gpib_interface, THIS_MODULE);
 
+	ret = usb_register(&agilent_82357a_bus_driver);
+	if (ret) {
+		pr_err("agilent_82357a: usb_register failed: error = %d\n", ret);
+		return ret;
+	}
+
+	ret = gpib_register_driver(&agilent_82357a_gpib_interface, THIS_MODULE);
+	if (ret) {
+		pr_err("agilent_82357a: gpib_register_driver failed!\n");
+		usb_deregister(&agilent_82357a_bus_driver);
+		return ret;
+	}
+
+	pr_info("agilent_82357a: module init is complete\n");
 	return 0;
 }
 
-- 
2.34.1

