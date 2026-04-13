Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0E23603D2
	for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 10:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776075424; cv=none; b=vDlqIhS0ffpx5TJTJVgpVWBK+q3b6ew/5clllfnAToEkhljsvTAa1RO+bxr6/w94Oja4Hr0NmlnJE5k+KVWeJJd07dtwcva0dem6Q9mx6rZa79jAt0r0EojepBBW5nCsufzB9LZKfhkmQq4O2fj1bbHbTPm2YfyXvPwg0ysDfI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776075424; c=relaxed/simple;
	bh=akcy74XyU5d3K3sQ81gj9lOIwvVjGvvwp94SwFPj7Cc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=klMnbBMDjMfGF8gPsATIN/KdVnOpb90dQ2gpXYdjNJwAbyWIpdukxv4Y6hB8vtsnt7scjM22xfQgOJIdJKt8T+JT8iIbp3SbML2NshNoEWWtNS9KbQRYes619otCmR/LFYiNppWaHG7RCw9L/49Z+6S3GmRlU9FyBpN9MByloM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bv3RbI8U; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bv3RbI8U"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6634bb959a2so5972541a12.1
        for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 03:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776075421; x=1776680221; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P2tbEuLkkgaSm8hCLkYwPYv74ch+wx0NWHk6i91CF3s=;
        b=bv3RbI8U6slzTWJnx0OZh8AZH0djEp2DV8NUStJdKN20P47+zAaT1pihOt2LKktCU4
         Y4rAIoiDh9ye4HJ0QE7r8hEULlcMA3QTyev9o7NjoBjuxPTE7uA4sbkK4EavknhW5x1s
         sQNZF+c/ICNe0va32RPfc8s1aMnUXckiK2umHuwS/iophOgMlv8/+M2SQl4J5S1pXrqd
         X/+fo3m5D6qqUZe0wJw7e7mkI9Dlov9o8LDAqXKT8mw9koQK+42P8+z+7aMz6t63pQjM
         SQaUPHAuiKlx/gniN2OA1JndUNxh0B0YMS94AJ8NkWQKOLbCAO+Rqp+lbucHTR4h5mwm
         3CNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776075421; x=1776680221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P2tbEuLkkgaSm8hCLkYwPYv74ch+wx0NWHk6i91CF3s=;
        b=STsh95grNJv6yqr/ndABDaRHkEyWq1GrodD+c1vbRjak17LyGc0xOJ9UfoE59lkaVp
         HEatwtpoJEC4qBKGHW13m3XNhgDJ8MnhawmD4DAab5h8f0wYG+ctYoP74KiEDHKHhSJT
         w9rtZtVm/vjKSTfKIkOyWyqivjlA5ZNiWW0vEWUg/zxjFviITpij/TG2z5/LwkSN6jS0
         X8e5NquVeiBy0Grv2b/VPZxXaoyN7q0mar8O3ppHBqWvJat16vFBqA4plyKTE3PcIMmI
         bA8tn7JTOxT79OIyoKCpPs9lMQiWg8Zkh28S0umdBDmvgj4zkVn54TpnVdZ85eG0RDTs
         cNIg==
X-Forwarded-Encrypted: i=1; AFNElJ9dHLcfPvwuUGFp2erDkFkIdJ89+GYu4pn/ttCZAnB/SaXYceEipZfGWw5CR73IXn5WJRNfbmeu1O4au++G@lists.linux.dev
X-Gm-Message-State: AOJu0Yynm2tO5XQLe0KPzsftV5ARJhD0smXUtt9oeckZmylVRfOY5Hha
	yFqWaF1xOzhHEax2/mW94DugER1S8fgsN4EBCxniW+uQQrJw40n9Liio
X-Gm-Gg: AeBDiesg4Sg7LZ4nKbqG8Ainit07V/y5/o2mFCNdJazVEnW+045gnoxOXBIUAin3nF0
	4nIUnioYyADcz3rG1Zw7G2WvPsNCqmQkEAczRoZtELhU8ydFAw23aMl9EhvvvABx25Xe+8v/IlY
	HePWug4tR1nQMns9CujwZBmPwkyIkFQsyvpLTAbAlgUzRRwyJAh+OVx46YgRuiD7SMEAJneHIL+
	tXgvAoBUb+TglrHjpEI9DqasCtQ4Ri5ldpc/IIo2L5YWzopQLJSI0xMKq0HHa6mFZc7KS1FXSTd
	gySW3ENN10vdqWQRrKj/vB+4kWwTW1RwlYgY6d3GbIDkxwShpRRIXtWetkuPIXTtzlH4srlJNx3
	7goVgJXPKPnKZ2vdsr8KFC7Ekrz9GMS5QE1ikyKNvY0RnFeQRb6mzoPoJEMIZJd2YHhZqlQRBU/
	3IDVNq80DM8t7QlcJN2EWUlRPp9gCabzmAsL1shEmDVRSeB46nQo4nIJTfGhIYSQLRllo3uiJvm
	48f6cL41yXBhBbUlNT+yxJ8lmQs058YCHkV+HwQl3mq8i/qiNU7gBpAqM3ta63eNffdk7cinpIo
	r8et2A==
X-Received: by 2002:a17:907:e10d:b0:b97:eae9:d45e with SMTP id a640c23a62f3a-b9d7279f3d4mr388494066b.50.1776075420885;
        Mon, 13 Apr 2026 03:17:00 -0700 (PDT)
Received: from ahossu.residents.sin.openfiber.nl ([88.202.160.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6dfd88c9sm307755666b.23.2026.04.13.03.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 03:17:00 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: linux-media@vger.kernel.org
Cc: error27@gmail.com,
	sakari.ailus@linux.intel.com,
	bingbu.cao@intel.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	hossu.alexandru@gmail.com
Subject: [PATCH v2] staging: media: ipu7: fix double-free and use-after-free in error paths
Date: Mon, 13 Apr 2026 12:15:33 +0200
Message-ID: <20260413101533.496090-1-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260412205057.386856-5-hossu.alexandru@gmail.com>
References: <20260412205057.386856-5-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In both ipu7_isys_init() and ipu7_psys_init(), pdata is allocated and
then passed to ipu7_bus_initialize_device(), which stores it in
adev->pdata. The ipu7_bus_release() function frees adev->pdata when the
device's reference count drops to zero.

Two error paths incorrectly call kfree(pdata) after the device teardown
has already freed it:

1. When ipu7_mmu_init() fails: put_device() is called, which drops the
   reference count to zero and triggers ipu7_bus_release() ->
   kfree(pdata). The subsequent kfree(pdata) is a double-free.

2. When ipu7_bus_add_device() fails: it calls auxiliary_device_uninit()
   internally, which calls put_device() -> ipu7_bus_release() ->
   kfree(pdata). The subsequent kfree(pdata) is again a double-free.

Note that the kfree(pdata) when ipu7_bus_initialize_device() itself
fails is correct, because in that case auxiliary_device_init() failed
and the release function was never set up, so pdata must be freed
manually.

Additionally, the error code was not saved before calling put_device(),
causing ERR_CAST() to dereference the already-freed adev pointer when
constructing the return value. Fix this by saving the error from
dev_err_probe() before put_device() and returning ERR_PTR() instead.

Remove the redundant kfree(pdata) calls and fix the use-after-free in
the return values of the two affected error paths.

Fixes: b7fe4c0019b1 ("media: staging/ipu7: add Intel IPU7 PCI device driver")
Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
v2:
 - Add Fixes tag (Dan Carpenter)
 - Save error before put_device() to avoid use-after-free in ERR_CAST()
   return value; use ERR_PTR(ret) instead (Dan Carpenter)
 - Apply same fix to ipu7_psys_init() (Dan Carpenter)

 drivers/staging/media/ipu7/ipu7.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/media/ipu7/ipu7.c b/drivers/staging/media/ipu7/ipu7.c
index c771e763f8c5..310e3f24e571 100644
--- a/drivers/staging/media/ipu7/ipu7.c
+++ b/drivers/staging/media/ipu7/ipu7.c
@@ -2169,21 +2169,18 @@ ipu7_isys_init(struct pci_dev *pdev, struct device *parent,
 	isys_adev->mmu = ipu7_mmu_init(dev, base, ISYS_MMID,
 				       &ipdata->hw_variant);
 	if (IS_ERR(isys_adev->mmu)) {
-		dev_err_probe(dev, PTR_ERR(isys_adev->mmu),
-			      "ipu7_mmu_init(isys_adev->mmu) failed\n");
+		ret = dev_err_probe(dev, PTR_ERR(isys_adev->mmu),
+				    "ipu7_mmu_init(isys_adev->mmu) failed\n");
 		put_device(&isys_adev->auxdev.dev);
-		kfree(pdata);
-		return ERR_CAST(isys_adev->mmu);
+		return ERR_PTR(ret);
 	}
 
 	isys_adev->mmu->dev = &isys_adev->auxdev.dev;
 	isys_adev->subsys = IPU_IS;
 
 	ret = ipu7_bus_add_device(isys_adev);
-	if (ret) {
-		kfree(pdata);
+	if (ret)
 		return ERR_PTR(ret);
-	}
 
 	return isys_adev;
 }
@@ -2216,21 +2213,18 @@ ipu7_psys_init(struct pci_dev *pdev, struct device *parent,
 	psys_adev->mmu = ipu7_mmu_init(&pdev->dev, base, PSYS_MMID,
 				       &ipdata->hw_variant);
 	if (IS_ERR(psys_adev->mmu)) {
-		dev_err_probe(&pdev->dev, PTR_ERR(psys_adev->mmu),
-			      "ipu7_mmu_init(psys_adev->mmu) failed\n");
+		ret = dev_err_probe(&pdev->dev, PTR_ERR(psys_adev->mmu),
+				    "ipu7_mmu_init(psys_adev->mmu) failed\n");
 		put_device(&psys_adev->auxdev.dev);
-		kfree(pdata);
-		return ERR_CAST(psys_adev->mmu);
+		return ERR_PTR(ret);
 	}
 
 	psys_adev->mmu->dev = &psys_adev->auxdev.dev;
 	psys_adev->subsys = IPU_PS;
 
 	ret = ipu7_bus_add_device(psys_adev);
-	if (ret) {
-		kfree(pdata);
+	if (ret)
 		return ERR_PTR(ret);
-	}
 
 	return psys_adev;
 }
-- 
2.53.0

