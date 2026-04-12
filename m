Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4181E37F750
	for <linux-staging@lists.linux.dev>; Sun, 12 Apr 2026 20:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776027179; cv=none; b=Kzd6yUlSdEvYQWUAF4vKgaPHtkjrb41kMEzablEGmt3Eqpt9OewZUqPsC/Z20S70hB1OIujFRo6FQ4LSSxq8sAUx2vB8Rypo+4Bv0r1E1iy6FuYbuzdyxVpsXD1fqHNpoETCXWhXCFcNuxLVEvZIl5/7ljjc98YHM6yNuTHUdUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776027179; c=relaxed/simple;
	bh=LSwQtTxO9bgLLfvTBTPYjeif5BKeT1vGGnw0FGL9CO4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uA//frECqp3DdnGVvxxSa6hdhZEHiBldtOVVUbr9EcqqF409bbXBBC3lXDjR7N6uz4rnKNOtreY/pvrPvHjTwQhr1Zd2LOnWi0SJIbI783BCGozUvtMeC9u5F3rDke5GbGf1hP0g1Za8du6ZJ72Pp58A88zi6PETWeQ1S1JNX/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YKPUnxHT; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YKPUnxHT"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6718f336888so161314a12.1
        for <linux-staging@lists.linux.dev>; Sun, 12 Apr 2026 13:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776027177; x=1776631977; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uty9fiFuMK1NPwHipfta2OelAI5DsbnrR8419q7/lCg=;
        b=YKPUnxHT6iztM2BK0HWU0s1o0AoiNnDcylYEfaK9DK0vKTnU2WSyatj7QtEVWLzqEv
         gEWaH2UdmjPAgUHprAYwWgOBUoO7U1yb+Oqg0CXiaVfEpHwiQsWlodrIAp7NEOT4/QUf
         DqZiOp2bvFeMbv/L+e412oNjOmdAkDZaqvdatIP1+Gp386vDR4ylhuaNn/WlIhzjINoe
         tFh/Z0upfu+iH+1eAj6/YMhFVqljiVDj3MkyycXXhgO0npH05ZXtKPR4lIXk8qRUIIH0
         s4fczrMIHig3YZs2lX9caVsBSRRb3R8NrSrcDK4nh75ZpboU5WOse80qJqyq1vXrS8Vz
         GtIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776027177; x=1776631977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uty9fiFuMK1NPwHipfta2OelAI5DsbnrR8419q7/lCg=;
        b=iPD7aLEFJY6LK7inVaOJKm5MRKQJMtVuVbP8F5+fs/eVp9LM2Xpol8+chQ9GzB9VUl
         NmzIo/Kr4Xp2RlFQD2mN1AOECFASDHUXhpNoX1lwx4jrf2O2hH5+jhs+P4db2V/NVxCx
         n/8H0WSfiAz8nqocLcqHjy5XTxRzK6TVHNmJYFLZ/wsUnt1nLluSoAcwQFvI3cy8FCTX
         ycTaoV5tKsU3ObEzthRR717stInm9lKIPlpCIY63KSRcA0+/oQwff8xf69zzk8uZGvB2
         SxnhseVlvVwQaVZ4EIBhVr6KSW3TrTbKPm8zpJlcEqb/m5OkG4kXsY0DmsMSpAxMuoO7
         Eyuw==
X-Forwarded-Encrypted: i=1; AJvYcCXae4kK6QwyJRqavNbYSeoJMN+mRZSGS2Bik7G003CUIyOvEcMkYZdTE8z+OlODg7pwuKBrOEST1Vap1Spf@lists.linux.dev
X-Gm-Message-State: AOJu0YzMjxzL4R6u9a2hqfZRZYy6e+Ut9CkChSGrEUwPiigDlsj6W4+0
	0/mmZqGpKAD0ZoW7NJpvvKzPM8tx2mBJ2SbNwlIK3wUJXozyuSpOYFpB
X-Gm-Gg: AeBDieuIfuwyOGB+8SUNNC97qCZ9en3VfX4lBbvtsqCFFF6/qRd34Kq9TY7d6FNj7ra
	3B6DU0BTwOp6SWYj3TotQnA4pp2pTW7X0oNbzEHqu2kgScBQP5SMhShwo7yz6HHCETFCCrd5FNa
	CcI8OiWrBZFwRKJv8KoZrfLOWMUHtLGmpo6WsnU4SiXCqwBXyHJXC4XyEJ5AqZYNmZyQkBNMfY8
	2Me1hZMJwLfz5GSbeJrkifLllAwyWcGkZpPiKXabdRmbiuSCteh01ncCs8PqC6X3QWTjkXe+Lt1
	GE85AkIzQJZpG9fmZ9CgJui3PVFz79qxwO3HhjP+zGpgHLUPXAQ/UqAIE9Cp3OGyB/qnNn5LQIa
	73D1qRG+hCD4X8VNF8vas5IkN3Yd+0IYL8t6mAQ6F5SDeZ2GuNMByXHyKIkTZ4XLEjYT3SmZ7bw
	ST7Jlp7KKfMMtEuQ8wTQ8d8hjgxIXoNLwk6jtxyWeTrR5kk9GfuIBnUgA53SDUPkIk3CCwZWCFp
	OhhBvWUVnrLFo0p/veZdyWznSNp9NzRy+mnG0dXp9D9XEtmZDuow1ndTYpPq+CmoA2VIia6dAgP
	eml32w==
X-Received: by 2002:a17:907:a804:b0:b9c:36a1:d32a with SMTP id a640c23a62f3a-b9d72796861mr597373766b.48.1776027176477;
        Sun, 12 Apr 2026 13:52:56 -0700 (PDT)
Received: from ahossu.residents.sin.openfiber.nl ([88.202.160.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6dfd77c2sm259088466b.24.2026.04.12.13.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 13:52:55 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	bingbu.cao@intel.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alexandru Hossu <hossu.alexandru@gmail.com>
Subject: [PATCH 5/5] staging: media: ipu7: fix double-free of pdata in error paths
Date: Sun, 12 Apr 2026 22:51:28 +0200
Message-ID: <20260412205128.387234-1-hossu.alexandru@gmail.com>
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

Remove the redundant kfree(pdata) calls from the two affected error
paths.

Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
 drivers/staging/media/ipu7/ipu7.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/ipu7/ipu7.c b/drivers/staging/media/ipu7/ipu7.c
index c771e763f8c5..043b67dfe19a 100644
--- a/drivers/staging/media/ipu7/ipu7.c
+++ b/drivers/staging/media/ipu7/ipu7.c
@@ -2172,7 +2172,6 @@ ipu7_isys_init(struct pci_dev *pdev, struct device *parent,
 		dev_err_probe(dev, PTR_ERR(isys_adev->mmu),
 			      "ipu7_mmu_init(isys_adev->mmu) failed\n");
 		put_device(&isys_adev->auxdev.dev);
-		kfree(pdata);
 		return ERR_CAST(isys_adev->mmu);
 	}
 
@@ -2180,10 +2179,8 @@ ipu7_isys_init(struct pci_dev *pdev, struct device *parent,
 	isys_adev->subsys = IPU_IS;
 
 	ret = ipu7_bus_add_device(isys_adev);
-	if (ret) {
-		kfree(pdata);
+	if (ret)
 		return ERR_PTR(ret);
-	}
 
 	return isys_adev;
 }
@@ -2219,7 +2216,6 @@ ipu7_psys_init(struct pci_dev *pdev, struct device *parent,
 		dev_err_probe(&pdev->dev, PTR_ERR(psys_adev->mmu),
 			      "ipu7_mmu_init(psys_adev->mmu) failed\n");
 		put_device(&psys_adev->auxdev.dev);
-		kfree(pdata);
 		return ERR_CAST(psys_adev->mmu);
 	}
 
@@ -2227,10 +2223,8 @@ ipu7_psys_init(struct pci_dev *pdev, struct device *parent,
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

