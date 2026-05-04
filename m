Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276D93D412E
	for <linux-staging@lists.linux.dev>; Mon,  4 May 2026 12:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777899578; cv=none; b=pasQS99iLXABnoTdmtRGkkTQV6o8hUYcRNJs6Sr+d4cS8o1PwZX2SwKrn295YG2Wt1x4WdXnIppgGWnK/SWk94n62uWHrVaLne8ZwtM2xkrqTUCU9hlZ0G6mjjVpc85fNCEsaArsLyaMvuaEgQNDP/qKpbppxLGc32qV53XAq68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777899578; c=relaxed/simple;
	bh=C3Kz5qTzZkB+SC+9hZnM3gfu9srJJQ7bGN4QKH1fps8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qb2hluMtFEqTDi3EniBHqIDGFZ4CEMMcTCniynJChU0Ob6BRS19+UmV4cb63KoSWNGxSCJZDqkbpi7pGQkBymMFB0qHcZx6egARHiuUCFGHIie4LN9US+tBC0p4+2M6lBsE5tMh+ifgSR5YZ4Trol3xO9F08NubrLQjARGhf1jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QQpVbNAn; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QQpVbNAn"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c7b9f54d3deso2488443a12.1
        for <linux-staging@lists.linux.dev>; Mon, 04 May 2026 05:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777899576; x=1778504376; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eKZVhHxD7xRzXNoGtRypXUUEsdwehShk5FlRxtbxB7o=;
        b=QQpVbNAnNImg1kBoiJlsINM5Mv95osePUBEH7bGuXgpBFIdAb+156zqGwTcQYGa4S0
         Hg0JD5CYB7FWodIeZV/fluXF8XAWcHzB63FWpthPX5XrZWvfSOp3gQbiicWWTYewqyS1
         0eMvac0XKgKRx7zZtVH36E+ihAWs1io5M/hZ8a9q8VH9YiejoySukPTQjkE+GtkNoTRc
         1/d4XwNyqEs/qsubWXLlaI7+N5xASp5oLG2cAZUXGzlZ6v9tkrKp3P+Em7404NHIGKje
         ON8qrrAI8k62jn5QW0H/czn2ko4wz4W1D4bu9ukXj9sKiP+7M7nJHLflOxnte/uo3ef4
         4nsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777899576; x=1778504376;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eKZVhHxD7xRzXNoGtRypXUUEsdwehShk5FlRxtbxB7o=;
        b=G7HzIlRkuN4kTk5NZEV4/GOUYuplYFa0g8vnsP8mLXi7l5YF3ZA8ElqwnZZ5bY8Ny0
         HXwvU6nGQDyUp1XA6nT/bFAuKKiFBBqHZo+ges7ymJH/MOQjgXISyZsj1lbAxuUleqal
         BSsB0mQQsq9cMQeHsC4VMRtsL5vHtOD56QSA2V+pOiZDZyeXiC1PBgsKOiq7uksq26Gu
         OfdakO7h1IUbT5tqcta7WlM4F2zBDPRIkbnN8MUT4j3aW9cEB3RdT8dcs9a+SoYjV6pk
         p5VKB/odrFw7LqISo8QW8hWy/AM/jBAXdMWEIowQl0sQ5FpGEU4xnzwzR6kMiNNmj6Lt
         K+/g==
X-Forwarded-Encrypted: i=1; AFNElJ8/uDnDnYei4OKhHbYj6TNv5YdvmYYOghQqI7HLNp/z3nMqu9lN5vsPaf+9KmkQSy38oYr6/mZ9g+hL9Jqr@lists.linux.dev
X-Gm-Message-State: AOJu0YzLq4Ez3pyt8DL/vm66TUPJcuk87Cu0o45Jp3d7ZGTaE1030CJz
	LuHUdp4RRxIobZOJm/5dMdKB8qiiX9DmDiuOa329Tx//dvNhPlf8ydfW/nUpQr7E0gM=
X-Gm-Gg: AeBDietJszmoI/5/ri8uP9fHee0hGN+4jM2GqGiuD28aC6T4+uh5IEyzifhiU2RKerx
	rB25xHt4xJvBgNv2V4acQzA07PSe7Wa5Il2g7Vh+0aj1NtVqeCjI3m9adkuwlXy1vnGNilS3ZVc
	if3TUzWDrUpBcjYKbC2mP7ccKKBVbVZ672F7LcLivj874vmLB1vGLMN7yL2rbOb7oC3i2dm0K4o
	/3unLdWvaEeK90awe2BwXxffPWWj2QUJER+rMOPAmK50F7snK/DPjxp02uoWcGXOj1A6k+OaVE8
	6HRPE8ZfxqAExyPmCYAWk+ocm+uyHwTJLuhggW+WSrMLOeGZ9ooury18MjhikRvD15zwzm0Vono
	iClsrb1kk9nXeesUX2xyaNRUsD5V6KZTMKVdStTrqyQJSQ6tJKA/kS09OVDsPic2foDnJNHJv1P
	BQ67khLzs0idUexUWJQT69RSklSObINB8=
X-Received: by 2002:a05:6a20:7491:b0:3a2:dabf:fef9 with SMTP id adf61e73a8af0-3a7f1c97a99mr9968814637.27.1777899576509;
        Mon, 04 May 2026 05:59:36 -0700 (PDT)
Received: from lgs.. ([223.99.13.245])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbc6f84asm9192517a12.19.2026.05.04.05.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 05:59:36 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH v2] media: staging/ipu7: Fix pdata double free in init error paths
Date: Mon,  4 May 2026 20:59:05 +0800
Message-ID: <20260504125905.580124-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ipu7_bus_initialize_device() stores the caller allocated pdata pointer in
adev->pdata and installs ipu7_bus_release() as the device release callback.
After auxiliary_device_init() succeeds, pdata is released by
ipu7_bus_release().

The isys and psys init error paths still call kfree(pdata) after
put_device() or after ipu7_bus_add_device() fails. In both cases the
auxiliary device release callback has already been invoked, so pdata has
already been freed through adev->pdata.

Remove the duplicate kfree(pdata) calls. Also cache the MMU init error
before calling put_device(), since put_device() may release the auxiliary
device container.

This issue was found by a static analysis tool I am developing.

Fixes: b7fe4c0019b1 ("media: staging/ipu7: add Intel IPU7 PCI device driver")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
v2:
  - Use ERR_PTR(ret) instead of ERR_CAST(ret) after caching PTR_ERR(),
    fixing the build errors reported by kernel test robot.

 drivers/staging/media/ipu7/ipu7.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/media/ipu7/ipu7.c b/drivers/staging/media/ipu7/ipu7.c
index c771e763f8c5..21746752a2b0 100644
--- a/drivers/staging/media/ipu7/ipu7.c
+++ b/drivers/staging/media/ipu7/ipu7.c
@@ -2169,21 +2169,19 @@ ipu7_isys_init(struct pci_dev *pdev, struct device *parent,
 	isys_adev->mmu = ipu7_mmu_init(dev, base, ISYS_MMID,
 				       &ipdata->hw_variant);
 	if (IS_ERR(isys_adev->mmu)) {
-		dev_err_probe(dev, PTR_ERR(isys_adev->mmu),
+		ret = PTR_ERR(isys_adev->mmu);
+		dev_err_probe(dev, ret,
 			      "ipu7_mmu_init(isys_adev->mmu) failed\n");
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
@@ -2216,21 +2214,19 @@ ipu7_psys_init(struct pci_dev *pdev, struct device *parent,
 	psys_adev->mmu = ipu7_mmu_init(&pdev->dev, base, PSYS_MMID,
 				       &ipdata->hw_variant);
 	if (IS_ERR(psys_adev->mmu)) {
-		dev_err_probe(&pdev->dev, PTR_ERR(psys_adev->mmu),
+		ret = PTR_ERR(psys_adev->mmu);
+		dev_err_probe(&pdev->dev, ret,
 			      "ipu7_mmu_init(psys_adev->mmu) failed\n");
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
2.43.0

