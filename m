Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77961E5724
	for <linux-staging@lists.linux.dev>; Wed, 22 Apr 2026 11:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776856147; cv=none; b=uUOQjJSAyrs30wkfpNIhmLiaL4KJjvFHQ599ZNrESITUVENUeW/sDwqGdWyDkcovyj3ON+/CI0VPeLStUBaYIOo0BEnxY4+WOcbi1IMXZb+LN0KNBSpk2cWZ21thO+LNNMHsbj3yzA7838sA56hCPXjELNEBUZVbDS4x9tKe6AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776856147; c=relaxed/simple;
	bh=WLhomcJ47lhXc7vi1d+uj1NjiqK4HfKluR7QElRNC2I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kjlwvYXpXmvQ3E4jdVa72FcbhxnLW2Rm7JfChQdap3WEzUV0/E1GXf5sXtTuEgLWSGbaB7F5U3DYwapSxjmzNNEVrRLpcWVenorLfZFk0We6KTMZJ8uJxg1d+HnDRzJ0XCfwLE3v4UQwCEERfWIrSwAg2PMZbjY/3YjyiTbeOG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ShzrEupR; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ShzrEupR"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43fe7c6f61fso421909f8f.2
        for <linux-staging@lists.linux.dev>; Wed, 22 Apr 2026 04:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776856144; x=1777460944; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EWqXFYgL5sX+faP6fM4eB9p7ItktzxFiQAW1mbcYgZk=;
        b=ShzrEupRwR4wI5Ke7l0yKjGGHnGEMtOwacTv7xbh8RVXQgZw0FjGOYJGLLW03SqPlq
         5G/bRo3sT+Hwicpp2ZCrwA+3JrV8Z+dgHCJ2e/VHLwSTgZ3FpOTm0maOUFEa0y2OzT7N
         shDF0H8T954Zb9QjRMgPp7cu8RHUcKfmBKSwJKyPSDjptLDAmVZBBX12CHRfI+GzZLIg
         WAZ7IvxZocjN+Eo2QNw7tje3npSIw9sE+8VHtiPftrucsOglrujnzeOLx3jPkLPwn4Db
         bqdJI1kaCY9dvJXjj5wepSZMKQhGnRdwL4hNPgUcMuWVkONpi1s6Mf4bkwvSw4kULoxJ
         gpgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776856144; x=1777460944;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EWqXFYgL5sX+faP6fM4eB9p7ItktzxFiQAW1mbcYgZk=;
        b=hTCKlZJUsjByQgRSkQ7dwX0WC20uFkBacK/boSWQ2s90A3M9+IWHbuyccp5CC1P4H5
         bIit2Mrn3wxofsWd15OEEPvPADsePOsqH3lCuKQ0ABn7qW24lauh3eNCsIP2j31OyBTx
         KIKS0j5N6pUwdk+AzhikPMkXXThH/d6dqgTJEoXd5wxfxZPE/ykAbIRbqfMhmxIqkO/8
         sTxxKpq+8aeqb5pFXlMuFPTc7tJnXxJLt+LkGQwAeEbLtC5cGXTavacE1XoldFm6WPrh
         qg36GLrYT6uLjXGAzBSSFE5vrujLrC9Ht1vQsHO3VGa3aC6U+05GWl0rumUEilevEmy+
         Yt6w==
X-Gm-Message-State: AOJu0YyqttsLrnt5qTFt5IQwGnDDd0lC9n2RkT14eef2BACajWAC/+D3
	aETA80471mgrM7Jc/VXzXfLaY80lWz+6XWJs45Yi3GYjHR5+0pOrbE1U
X-Gm-Gg: AeBDiesbU8tuBwi7GnpfJWM2BRDOoYfMhXb+YP62KH1+b6bdnDeSH8HCTWHeZHdMNxt
	eJyfe/aG/ko87IGUdNabMNMynWafanhJmPiffD2v1TTASA1dKVYQYDIKAEwmAfkrH3hsCzKJSyQ
	nMX0xG/9mCY0kWir0NAno5X3KoE9DMofpfDnrslkkrC0Si6BxssNBJ+yEEr11ok3WOPKIyFjRhF
	lxFZj3ZQGperEvzOo0JeuuXUV2ZZ7qs3OZbCR2YJZykCHqFfZX5wvyg+scymghoFQPt002fmx8g
	QZN59W1xKgFSIpxB5XqMfq8rLc8hRkHnkItb9NkABpRSxSfFfoHauXZXvS2ZPmID7QgGpkG5dKH
	XJIC1ZCXSWhQwR0aORm8D4NA/Ji4OsyxqxYJf5+HJWROrw7AQU+Rf7PQWsjBMSyexMI5W4Ov/xa
	px7PNCZRhGQ5djR3u5YULdX4hR0qYybQ1KKGq8XoPkmpPkbSORZb5OEObsJpuIwhamRQHrE88gr
	1WAd1pEJ+435HZ6xkGRhKxiwc7shGysXlXdacdbHRyBBz2ITIJ9GxMSwoy/6XI=
X-Received: by 2002:a05:600c:4746:b0:488:ac4b:59d1 with SMTP id 5b1f17b1804b1-488fb7ab49cmr153476525e9.8.1776856143975;
        Wed, 22 Apr 2026 04:09:03 -0700 (PDT)
Received: from fedora ([149.3.87.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488ffad20f2sm197836035e9.0.2026.04.22.04.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 04:09:03 -0700 (PDT)
From: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Subject: [PATCH] staging: media: atomisp: mmu: Fix leading space indentation
Date: Wed, 22 Apr 2026 15:07:12 +0400
Message-ID: <20260422110710.57787-3-giorgitchankvetadze1997@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix lines starting with spaces instead of tabs to comply with
kernel coding style.

No functional change.

Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
---
 .../media/atomisp/pci/hive_isp_css_common/host/mmu.c      | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/mmu.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/mmu.c
index 064e88a5e064..82bd453d6f78 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/mmu.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/mmu.c
@@ -8,21 +8,21 @@
 #include "mmu_device.h"
 
 void mmu_set_page_table_base_index(
-    const mmu_ID_t		ID,
-    const hrt_data		base_index)
+	const mmu_ID_t		ID,
+	const hrt_data		base_index)
 {
 	mmu_reg_store(ID, _HRT_MMU_PAGE_TABLE_BASE_ADDRESS_REG_IDX, base_index);
 	return;
 }
 
 hrt_data mmu_get_page_table_base_index(
-    const mmu_ID_t		ID)
+	const mmu_ID_t		ID)
 {
 	return mmu_reg_load(ID, _HRT_MMU_PAGE_TABLE_BASE_ADDRESS_REG_IDX);
 }
 
 void mmu_invalidate_cache(
-    const mmu_ID_t		ID)
+	const mmu_ID_t		ID)
 {
 	mmu_reg_store(ID, _HRT_MMU_INVALIDATE_TLB_REG_IDX, 1);
 	return;
-- 
2.52.0

