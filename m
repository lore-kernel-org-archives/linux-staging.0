Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D371D3176E8;
	Fri, 15 Aug 2025 17:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755279505; cv=none; b=M3rz8Us5glT5FwvFAE4L/UL9V9qN8GMcsOfLBTQCNi0BKtWM9SrpYrhbxWLclhrumlxx0SeNNeKIvSbyrkRtET1cnXRFjyuFXB5rzlDXJPXdPNvXJjUk88a7oHb7VXcGHpmsG+FUcn0B3pFrSegbmACw+SiYSakr68mNRa0Fx4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755279505; c=relaxed/simple;
	bh=gVkFMLfDZNAcblb5dwn0J3mL9GjMWVi400R+BI3nj1o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CPsBszQ+QLlvLUI/M7n1vkkRNjubMF2FznFd1uFAOfmJ0koHjUo3GrOnO/h6mE5tH4i5FBrlUcH/n51yn4LDuWLU5Vpo3VZo86Rb9ReLQ1pRRGetI2sZbwze6jr61sLJXRm1Kdnjh7BrMH9QnVTvBSuTJ0S86MhYsJunOuyX53o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L7yry2iG; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L7yry2iG"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3b9f22aa4fdso216018f8f.3;
        Fri, 15 Aug 2025 10:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755279502; x=1755884302; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1WgcUUdQRBquLpdf5eq5AqmAdjxeq8xvK3pQY9lcVSM=;
        b=L7yry2iGUxmEp2F4ffHbAv2judGl6+fxKe28mGFEMewqpBOu4JgAeosvgDNb3s7Zds
         3evurCnH2nvK5pDVOceXn2Y5XTV94WSe+qJcSMrVe9FoHopXIdVI3zvwwIr+Nx7KWSJQ
         Vq6iC8THAnFH5SCH9YpKUZtKIwvXC7yOahfaKLLkzwuRlZlAw53wxRns7F7YLDcjeNft
         EFJLXLe1Omf+D1VxIx472dZiqFCIoINgc3bcmEyTYDCY/n9h+5jc4SuPPM9sc92mOJAH
         AZm9zjHG5rxzNlRmdw4eUUInA/+n4cKwobQVjuUHeSzYqoDFj4iGSwBXDvAjVkoMCm6L
         WXlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755279502; x=1755884302;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1WgcUUdQRBquLpdf5eq5AqmAdjxeq8xvK3pQY9lcVSM=;
        b=KU3llrroFi1mbFGa9W5/Q5mkxLdm6OoZwDXSvNlSKnJObGfAlZQWn610dYjc/1Q4A5
         b71++3w4YYw0cEHK7ZZNUo1/8bP1+1BjPX6t8kSaV/AJDWUCFEjZzsn2UoserFOcljOF
         3EYJPWaJU7xLzhMH7qWZtbLoEcVEfbzysgqUz80togZR1bm2xWZPC3ZaFqBTk3I480PI
         xFZ8syRU4ERMrtYGXh3+thzkyLY7+5dpqYDuY2CkXoPlSJ6/+6WCI/KpsoPbM91GQJ5B
         zw2mA/239cA5LbNWtyVdyvGiQLPrzLFPosiLw7XjGLq/tw6LaM+CVc7cEIUbmGg3tblF
         2cJw==
X-Forwarded-Encrypted: i=1; AJvYcCVbDT/rRCCy/0+qH0SZfdsf93m9/v3LWBM14FDKg2eVg9ZiKgzUKl953a2nX5FkNac3nJLzYf/fSAyFiJWdWw==@lists.linux.dev, AJvYcCXmNvW8EvfkH0Tv4u6yJ619wxR58VXLm77plnRlyxbKxg1fzqZgid6ZucPHvr5RUdprlMfz479xJ3uw9K+Skji+h9pq7g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/WKJee0Bq+hs+dYDt32YdeGco4V5XDBkzxGJ2Q3sOmHm21TCO
	+UlOQi82dpknxBHjtVJQEXrT/L9gOrWZ1rKSqwHjWQRej6bj8EZSKtoouFrP4Q==
X-Gm-Gg: ASbGncthr+bglRuF4lZbcyB432mnT0ObbSuaLhwcUA26GTiQ2z3q1AAmgTEB8UBdsmr
	bG9VsjT6HEyiDXuDDDmRethB10XjbVQ8i2RoKlrNSM2QCJa44woyp9IN8cVckACYkx8CsjoDhMq
	53zJtY+0kQeMsWON+6BpOxCHDS6L/Q5oF6I6KwMXBrgiiJay1n8k+hfnI/3cJ9B2Gg5jaJI78qM
	jPFdvkHsTOSpFuGpKid9sMsRcSfTZKXbsd9ywyBlV3ZXOhk4VOsHBFugRbBEAq841B8eNFdg4PK
	ANjzAXl8JNZY+AeUmEJKWlH7M5iKdP2ZReXzHq1XbF/EbP3D5ezBd5NYl0KPAx/XwBimrUGMht8
	gSdJ7ZxPW5x+fCtADCEFYNPEG6twiArKVDf3AzO+Lnwt78yJ8ghaIEH57pWkZSQOI4/5nIBTd3t
	4mPwHipg==
X-Google-Smtp-Source: AGHT+IFj2gq8k5qF+dxuqCn3M4gO6wawzpjQxzbfBk8qGD/2kEHqMYN5fr5izKW5sZXJSKKkcDgkEA==
X-Received: by 2002:a05:6000:26d3:b0:3a4:f7d9:9617 with SMTP id ffacd0b85a97d-3bb639d4521mr1070777f8f.0.1755279501969;
        Fri, 15 Aug 2025 10:38:21 -0700 (PDT)
Received: from localhost.localdomain ([154.182.175.247])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb676c96dasm2597432f8f.43.2025.08.15.10.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 10:38:21 -0700 (PDT)
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	dan.carpenter@linaro.org,
	Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Subject: [PATCH] staging: media: atomisp: return early on hmm_bo_device_init() failure
Date: Fri, 15 Aug 2025 20:37:55 +0300
Message-Id: <20250815173755.33254-1-abdelrahmanfekry375@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hmm_init() would continue execution even if hmm_bo_device_init() failed,
potentially leading to bad behaviour when calling hmm_alloc().

- returns the error immediately if hmm_bo_device_init() fails.

Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
---
 drivers/staging/media/atomisp/pci/hmm/hmm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
index f998b57f90c4..97c7ce970aef 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
@@ -34,8 +34,10 @@ int hmm_init(void)
 
 	ret = hmm_bo_device_init(&bo_device, &sh_mmu_mrfld,
 				 ISP_VM_START, ISP_VM_SIZE);
-	if (ret)
+	if (ret) {
 		dev_err(atomisp_dev, "hmm_bo_device_init failed.\n");
+		return ret;
+	}
 
 	hmm_initialized = true;
 
@@ -48,7 +50,7 @@ int hmm_init(void)
 	 */
 	dummy_ptr = hmm_alloc(1);
 
-	return ret;
+	return 0;
 }
 
 void hmm_cleanup(void)
-- 
2.25.1

