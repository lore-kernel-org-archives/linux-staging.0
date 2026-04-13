Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0105D3C2763
	for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 15:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776093256; cv=none; b=hpp9sK/xENeh+iUhJ7JpnkIASwlnyr4lvaPbFTVjcyJHlicf3DK/IWwedC1HG55p8Q5gXhxaEUuux/FY9jtFX0mJBfPJVGTVj4KuIgU5zS4DTATIjPeNdBab4ZMB42JEbRJfhx29xaft6VzixXwoy/PTiXh3RUdz+SkpYnxDg7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776093256; c=relaxed/simple;
	bh=wLnKz0lTNl3u6Hc5SEDvuWJmbFpREBwXZsvmW+L1huQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iVLDKWiLw0+r3x7seP5T/lGyp5MRcXWRO25vhH9OxAze04IaOR5Q9g/hafN+y3MCGRBLKY/aFLybdbKK+1T24Odwrn4zUcB9T6Rrk8JK8OdA/qt03Jkp2JPTV7jIW0nLTgACWVD2W5EmA322zwvQktl5USGEhnoB7itKhe9pwhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SPMrJJNU; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SPMrJJNU"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b9c6680aaf8so757522766b.3
        for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 08:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776093252; x=1776698052; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=siLykDQuPSI0K3YOTzdJt9UJ6NmzQ8lrmgay3bCveqg=;
        b=SPMrJJNUSUaXH7on50qVXjWUZAW3d6z2RiBwwa2YC5KYXMNLPLbMUr2DoM/nZ/pa6F
         S8by3jA2NXcfQi4NRWqQDs+0G8TSG5Jx4nZoOeHLB5mfAsegy7simtQ64nO0MxZN8O5k
         CVnYyBIQ7rL34rsrty1PlVefzdRJuzbdzxslyvZkHpwpsZvLF9+9p2KaajKWvpE8pL8L
         4sJr6iohOWg23lDG3PoAnuRBe4aD015BOYBVqD/+j1crcU3I4NNvFd75oX557UPnvIEM
         +npOFY8ToUxCntqzU+D8sdj6yJtPVADdkFacfdk/KjYYhx+AF3X2lQkWRXyPvLkrEgdN
         zmsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776093252; x=1776698052;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=siLykDQuPSI0K3YOTzdJt9UJ6NmzQ8lrmgay3bCveqg=;
        b=Uo4b5zKCmnafTrHAyOimHJdqNhmJ3rrk17XlHWcGaCgV2NB5vZ8/8sHsF5S0OPlZt3
         fCPD8M7/twjcqg/FFzzoNb2K0FeeCO0QjjoN/ao5NT8eurxNK6A+jGzO9+J8+hAQc/CH
         f67P5ORHz/sEFEqCY9CdYQ8PWkVdRJtJNMqpPI0+106IxD5yWn2NdiE2cw+08hOPUmJz
         /wUwqeAz6JQDUjAMcN1RBB6YVhDXBiRtSOvyobiNnPc5Gr4gwXIdEPDe9krXJ/92oLmz
         Z9iHBOXgJ89RA5drKfy3Ge/hLi3I9/j9Mdgzzvr4aVvNwb24lYr1vHcKvDgj2GB0qd2k
         RX9A==
X-Forwarded-Encrypted: i=1; AFNElJ8fxOxgkG3uoKDOG+862/fOMa/bmsi9vnaLgyrVjgdfXLeXIaNIJEBOCypaKwb652nCfH9X1///O1PJjGQ7@lists.linux.dev
X-Gm-Message-State: AOJu0YwvZEyk+TlnDeECPoPMmlNvcCzndxgTXbLiEe5ltTrwAiaZ57q/
	9enrIdjWz2xid2q9TsbQ6r8sQxoVFqK5f9mgQe0S73fNr8YNv1Fbomn3
X-Gm-Gg: AeBDievzUNgualObJLdB3K+ak0sDuHudXGRB5bD/NH1YFLWk4K+me24zAnAGkrfFyFH
	fh8VbmYWUFJODuFFmAJ9etxdjcJARqoVngLunSOLUOdG33iH6jY9Chy5+IGurZInWjT23Ok0Tro
	5xzP8IFs+9DBNlox56ei1JeZT8AyRem+kICzQfj5zrQxStTcEaPx9bPPlEGLqjFQst2OF+N+l2m
	ABoeaT+TW9BfvVpIwjiy2MxQwbpzx2ypDXvbyf5VLoQGMNOqslbiNsTfNd0C6rmloJIWmKqrTEY
	w/J197xCmWaUAaACaiIrtIapAWuZjCZh09YrGt62NqmgzriKgf0v9wJ/E/6UjghEzYoe+1cU5kT
	m9DHWgZmsPpy3HcDjIolRKuqQaVo6D42uqdV6wlg4MXau9mVFy83nKXzkw/6u1ejDGTF0zI5X3p
	sqSlQWiBNzVw68WU00kvCgeI+PAc5+AFnR3kI1WPN1d8qsdG8/OOp5ll386Vx5scLmVkZNUs7c+
	k6oEkrV7IoKh146HgB7ePimOwS/6Pzz61iKepR8sBEPqU4oY0Rfe2lZjD78fJkgem/73EhdHcJI
	cScZvEuWE+fpUMnA
X-Received: by 2002:a17:907:8e16:b0:b9d:6cef:95fc with SMTP id a640c23a62f3a-b9d7267e295mr773185066b.35.1776093252053;
        Mon, 13 Apr 2026 08:14:12 -0700 (PDT)
Received: from ahossu.residents.sin.openfiber.nl ([88.202.160.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6dfd77dfsm323472966b.18.2026.04.13.08.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 08:14:11 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	bingbu.cao@intel.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	error27@gmail.com,
	Alexandru Hossu <hossu.alexandru@gmail.com>
Subject: [PATCH v3] staging: media: ipu7: fix double-free and use-after-free in error paths
Date: Mon, 13 Apr 2026 17:12:44 +0200
Message-ID: <20260413151244.612492-1-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
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
Cc: stable@vger.kernel.org
Reviewed-by: Dan Carpenter <error27@gmail.com>
Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
v3:
 - Add Cc: stable@vger.kernel.org (Media CI)

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

