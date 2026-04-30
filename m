Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D89334405B
	for <linux-staging@lists.linux.dev>; Thu, 30 Apr 2026 05:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777527656; cv=none; b=tz0gb2U5tfneiisMOtB4EVtSZxcxeydea3K2ge4ugr07J1ftFtmvmo5CLLthIz1iaCVI3mDA/YPVxy40ZgNs3SN372LVsrx4i0/SXvuXGOVJ1x9yuCWAonXUZ7vtG7bs+U30YNKE8QqKLiDSiFVR8th+MXwNHg78lyQe8mWK2CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777527656; c=relaxed/simple;
	bh=sZvheAZoRjvdKOT6LW/gjyVxmpfa0CA+ZSeMbibVNSg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EFSMTozRYCq4ttgy9bCqXdh4vs0VpEOPIvi5qbu5pbQwQkMBpzD8wRxj77HAel4OH2t2TVcPsMWlufeKzrPslcmBldcB6NQMDDCI1jlVdS/wA9NlSpGjsugLeITVSWI7E9llSl9dYahaHsHa4ZoaUUdLUYrG+nh5tpndmBEkIrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GaRwa/op; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GaRwa/op"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-82418b0178cso295989b3a.1
        for <linux-staging@lists.linux.dev>; Wed, 29 Apr 2026 22:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777527655; x=1778132455; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1+zXDwYkscXkwwf38XELFgWIvVjVJaXVdUr9CcmySjw=;
        b=GaRwa/ops7kdH8pTXu4CndxUOLNF00P2Y4rrz71O6ZHk5WihwxuiTYeTseGi6vlktE
         DBIAiFEiWFdK4YM66sMA6iDdQ1LrzB2geno/rmrVrRfvSwUrT8H4lqRyTA5RPCw+7wKp
         Bkvb5MzRymczWOBp4QT2BesN6/3/Ntd7Oq/6hZsZvrCp7JQoqqe0AiciNHl3ApC/ORkV
         uS140WSZBnYxrq/U5Au2d3cDySiNDAvzudJayLZhfskhrvKlFM3v8e6ZPmKaRSRcZ0z4
         berWcx5m1i/1SEvorcFUnC7kRELHQsV9vO0vztAhYR4eB6DdNYJnrBD0Y6n3OihnYiwH
         kixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777527655; x=1778132455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1+zXDwYkscXkwwf38XELFgWIvVjVJaXVdUr9CcmySjw=;
        b=jo9iiMW4SmhfKIX0wPMwTK9GG4okw+jYJfU9HnfFq7LFl2H7HQ24F06rKmbsxj30F0
         0cxahdfeCNigoX46Y7OMLhNJOKgQlz0BirPXOSmY2S+YcHT24DgOjOpyKX1mu/1/truE
         o0XclfkTdhw/TSl7JsiTkEbDswUTR2dVmjaHxp/NEk3ranjaX/knO5BF1l+WL/0ooiwF
         pfmdZ+4iPLJqnq4OPUjvynrSIZ9yH+KbYyVXIo+E226NZeGlV0hm50fTbKOGn9BB1STG
         yPyOHgiWU76QRohElH7x4aLkuzw0P99c3vqozSEwZsDq0XbLDg7M3sAcNnQ4ol3MNnLu
         DrLQ==
X-Forwarded-Encrypted: i=1; AFNElJ9sqEy0KaeOf7g5wwU1kkDTU+6IMGfnr7h7nRLvRYCpbydue6g1/JppofbtzmMdbvWfeQ1JMt0NK1rl6oWE@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4ngz+GWzSDx/DnHKBwUJ1IUSbxPNKqDyGEkRREcCuujKF9qX7
	UPeA8UOauhgjb9sNidUkFPENN9Nh7UD7vDsFZyu1xxPMdQ2rbLVXtPqB6u4xMoQ45OlBHw==
X-Gm-Gg: AeBDiesolqCzbWzmaUVPk3PNg62EVNmRGuSHg8I4Ws94BK8vkc1jeC/D7IwYijxAC2/
	REGS6G8WEuGPImEvdvjx7imhgCvEArefKpnOy33u39AkaeeMAIzmYNdrPDQatPMeq3+VtDgZ7by
	tVSahjtdaPGuVA0KZZ5s7CY3/1Fpg5tUZ8nCoFrSQ1IdEpmP1rpKpR32mzhEQNX++EmirfGdbY9
	pltbBcUOaxWEGC7/A29Au6XqZ+TwZh8qqqOTCCk8RkD7WT15ZkI8Y74vW3sLX9wWfeKa+eKDrMQ
	xaaP2VBIqWCvH7kgQEx7JGBqB2Q+tAe+zTm1GYPxLBIlASBFHt1GuZU2jIlMybzQupElsWKrySa
	DGknvRcC1PfZwhWv1EsEStDLfsJgfcp2iaXBD45akz36ron+JdgeUb6m6Wnlefs8LCOMzti4tdu
	MCirzrojJyF7F+Bmiz
X-Received: by 2002:a05:6a00:302a:b0:82f:4386:7989 with SMTP id d2e1a72fcca58-834fdc0daabmr1792231b3a.24.1777527654799;
        Wed, 29 Apr 2026 22:40:54 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::5a26])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7eb090sm3858242b3a.43.2026.04.29.22.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 22:40:54 -0700 (PDT)
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
Subject: [PATCH] media: staging/ipu7: Fix pdata double free in init error paths
Date: Thu, 30 Apr 2026 13:38:20 +0800
Message-ID: <20260430053820.446080-1-lgs201920130244@gmail.com>
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
 drivers/staging/media/ipu7/ipu7.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/media/ipu7/ipu7.c b/drivers/staging/media/ipu7/ipu7.c
index c771e763f8c5..069f0238c8cf 100644
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
+		return ERR_CAST(ret);
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
+		return ERR_CAST(ret);
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

