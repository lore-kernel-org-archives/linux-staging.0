Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D2E2E3385;
	Tue,  8 Jul 2025 16:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751993100; cv=none; b=CYz6PB/6Z0/lgusV1lhV9wbhSR4+Bl1eWCKrzjWSNjdoG8q8YA9bw0XohVa8fVJwAgJ3f8ahCvOVakJxbxXGBRdenyMIzvdPo6mVQ/Hk9wWEXWQ5zx6Xw2hVFd8x5dj2CO8BuL00b9Qm8X8BZwyAWqxjPYu79+LG+K49YBk/xKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751993100; c=relaxed/simple;
	bh=2qlDEyFAGz06h5bAsvaaZmniCKqNsSeizj0Fh5XlviE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MJA1L4GJj3mNTTC+RNExOrdqXTHuT884LJ7eO+OhkrxpPxAWzSpzYOjQojjuESBIaWvBnT5L62IW+vcCdO5Pvw9InB147fZa8PB4SCMBvaACKRxj+Yzi1HiyYQW0t8+60cg5bkLNeaWdpVqxo6lBfeMtHo+9QjbJG8LhyKFXRKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UWLxaMT3; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UWLxaMT3"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a524caf77eso644217f8f.3;
        Tue, 08 Jul 2025 09:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751993097; x=1752597897; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g2HnDWqyfDRxi2RCwBhlO2r9sxygmtugxTgL2uqFKsQ=;
        b=UWLxaMT381H2/hk2buGFv+i+wNA1KqMEA/fPCp7FHGHM1nKAjtloJb1WHqsEYfnVaL
         jx1hLFOrpJBkZ/7Xr2ELxvd4hzuMU+cAb9Gfc6HzwOSTOgOO7BB/02WBPRKTlRT8TbwV
         fmBqEndxm3aewl9iuSV/EuA5E6m4QLVZk1khbu9/DMq7M1umPovnnJ0gPJDx1NGmrMyf
         g37vyRF216PKc/WHjm4uX1GKLQtjYnn3K7Yap2I80LvSqgCgd5nilv7mG1urnj0XEwDf
         2zI6by8fDxPfG6UknYAbA4326RgpLqjhyI67RbBHGdyxBnxEMrYDI/Bepr0ikRIVi0HV
         m59g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751993097; x=1752597897;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g2HnDWqyfDRxi2RCwBhlO2r9sxygmtugxTgL2uqFKsQ=;
        b=YBiBwBo7VKA5DLeAPR5JEEm83gANX0IL771FMvssQy5iOuRQVC6XtG5rjAM5SXK0gE
         zPAuRDopay+y6SwXGrWzADOXn9jMonQMnJFZg21PKwFRD34B8GzKvHWqYDhGjjR7I41f
         TKbNbJX/YDcfcLe9tfMI3Q7MHHZWdV7cijBdAUMmUO+dBZEYuIuwDeTzdO0bMS6Rk1x1
         t7ysCGMOZhIjn2/f1AqX4Z6NFos4Zsd7QmsnaQquQLubY8mzbhPzQbqIulqTwrteUh82
         zMvTSHKYnCVVDMmnCa3YlLHyV9OCt2WIlHrQwHiBp7NvNhqUSX5V0lOMg9HToYLRGkv7
         6oyw==
X-Forwarded-Encrypted: i=1; AJvYcCVeGHsl9drFlIPqbpGCxF3y0oYmlCdnRZCD0V1d+Jji8F3Zir00f6oFfd11i150+CwWKr0IPQPyfuAq5cMu55eKuhQ9Og==@lists.linux.dev, AJvYcCWGHouQLZpabOUNQEQuDVxBX+1dDRfTE4kkuAc3ayevX2nfg2CLMtRHgcnwmadNdu/2t3cbuyO+LUdTwdnGww==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz90D/aEgBSBF/SeaaGBmSAoROC2csyn7JpCa8Uk1jAvfMHkVBX
	/IHVU2VvJ4MBzghSiGqNbcaWg1YxczZ5uSkwrz2oP5heCz5aKJ/7E8j0
X-Gm-Gg: ASbGnctBkCoNhNs41izlkgNBcLcSrcuUPQmQT5PzRnmFiDX2yj+svsXCVpZsylu739X
	DMVStT0HM/uHyq2Dw+jmFtppkJwEHIIbunYa96fU+DTWU2yw/JaetdrN1UpILpPux5/6KZP4oAT
	fNblIWQ/v6/10DoaNhOIBmmczVOQ4CxNFOD+0RVliSlr+RiO5w8/toXpkPoyPjK6nSbl1caPHcw
	BgDhAuN06geVxjpmS3FcI2zr/t4JycnMtMQ6LmHjt4fhwZBpa2pC/SPZ+EqjPi1Y0XebaAmc1R3
	mmJpBQk/8zOyvgq6zA5nNYEJU6BUhp5frsswcO39cwlIM1snlJH5Cg0VBj6QGoW6T0EYk0b50ji
	RVNWiWwW0ZW6jJIDhCX5V0A==
X-Google-Smtp-Source: AGHT+IHZTbKVb8PLWEN7pGyYFCbChkvmnPSm5GR4cp+8geTvUxYjlQXs8GquqISkwXm+J3CEJJlEmA==
X-Received: by 2002:a05:600c:a06:b0:439:9a40:aa27 with SMTP id 5b1f17b1804b1-454bc6af52emr43110395e9.5.1751993096480;
        Tue, 08 Jul 2025 09:44:56 -0700 (PDT)
Received: from localhost.localdomain ([156.208.8.236])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47030bd42sm13184563f8f.5.2025.07.08.09.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 09:44:56 -0700 (PDT)
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
Subject: [PATCH v2 1/2] staging: media: atomisp: return early on hmm_bo_device_init() failure
Date: Tue,  8 Jul 2025 19:44:07 +0300
Message-Id: <20250708164408.79863-1-abdelrahmanfekry375@gmail.com>
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

Tested by:
- Building the Driver.
- Applying to media-committers [1] tree.

Link: https://gitlab.freedesktop.org/linux-media/media-committers.git [1]
Suggested-by: Hans de Goede <hansg@kernel.org>
Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
---
v2:
- put brackets around block code.

v1: https://lore.kernel.org/all/20250707140923.58935-2-abdelrahmanfekry375@gmail.com/
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

