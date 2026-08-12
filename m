Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021AB3B8D41
	for <linux-staging@lists.linux.dev>; Wed, 12 Aug 2026 20:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786568149; cv=none; b=KrpMIRIpUPhLTFzsR/xsdzsgP+xFDGSln03gNxeG2zkEoPkwkkg4qn5OT+yhK5kqfSU5LLH+3/RdTByBffsn7Q95oz/kNQIWUhCKdi0dm3osMAOrUZzGzVxmmiMezlLXXeUiBdx3MZYT+lF8e94OKPv6uNIEOzwQC2MmRPFGqAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786568149; c=relaxed/simple;
	bh=pc5UESD6EDwQLGI9fUxjkSsSLs86VJEfjdxtMK0USzs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FJsQVXt/uBnfJ5Vl+X2J00qFOGlSnMYv8B7rpC8xON9vGUFL+G/2IPAEUFbnkfzqdakwKACzOYRaYgvaPvWCXtNXoh3Avm6z+onTcY4rCGS+e8MYK2zdjCJAeyJGnRgwNKhEN6ob29aHLEvtHLqFN886PQ4p9EygNdRN9pCrMxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jTxgotCd; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jTxgotCd"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5b2a22c52c1so15136e87.3
        for <linux-staging@lists.linux.dev>; Wed, 12 Aug 2026 13:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786568132; x=1787172932; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EYpha9QcagCXp8KuwiP/ovEe90DQEndNvsYkBOdtUDs=;
        b=jTxgotCdjR9aHffylw+mmc+rOuEE+s5Fe5TJZwOUhD539Wv1SLWuwrMz66i/dvn5T5
         3UVggHVhbPM/08FUfxKiW7RPj1IvnDeKATVXEXJSg/Yo5djlbUBN+KruIM5BZO+omZEJ
         ko550wm+7w3Yvfwow6whUCAEcXrg2fCje/F9tA0u/YRldpOeYDL+b6psEozR6J2hdcTt
         HRVbHVTKmc4bSBvjqHw8URkJVSMLUzjmnTPcUu5jPSjEBFiexzk9t/m4RUAXElXOVagM
         hYIqE7GnHsdUyVIUdCSN+VrjvfmcGNN65StV1UvfLuVDwhto3+bwwrleYbjmDJYkVpBc
         s+vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786568132; x=1787172932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EYpha9QcagCXp8KuwiP/ovEe90DQEndNvsYkBOdtUDs=;
        b=Qmn4TbvoFvja+KIOzcH32v0O5Vz/nCLtdZNn0DV7FUoUV7DmN8fM3QbkJB0OMXLAq/
         xfhZhukd4yVLvuOj2pxsxPybm1ZGPintXZNt/p+sRFsiyebhadimq9NAtY6rVLEuFYTH
         SrMQDJlaBA9mctxOWPeppr4ufUTrDre39+pL3oAh8n6T6UjG5/rzByvWbK3lu1gxRmJu
         HYamJNp1Zvf+eCRIIO6BYxXq3SsdBfMRLJ1ezB8N0S2jq8VKWqeTTVzIsoeUQTX84j1J
         sCIWY3qEUKOeI7eP53kwwcfOsoO6fnwN3e5lCzn9F2LztItZCz+VFLt8qEf2ql+f/SUT
         g4Xg==
X-Forwarded-Encrypted: i=1; AHgh+RoTMay1ird3YzsCbKmNVgMHbWoV9P/Zod+7mBlZN97wi9acDKDnLAH8UgjAejpdIgxPPLieUTzta2ibIHq0@lists.linux.dev
X-Gm-Message-State: AOJu0YxeWltg/Vc4fMOrRye0iCGLfl7Xgcn694dTcc41F6UbQbGlmeSC
	kb5X5pJ6t77OI4OVCHChckEauTOdFRYtSUgiUTHSdT8lemTRdxNn7738
X-Gm-Gg: AR+sD10QorYWeloICdD771zkk07PxI2cXUxaPoK0I5BPX32Q6h4ZWQCgZmnS8aS7XKS
	Qclm7FS45GU1Xl1iN8twHoSm1hPkqX/cOBF+77kuUO7PIM/mUAMzQ3hal+VJHTdSpaRbEpQPGRO
	eeubvUA1nPJZx5nO1s4JaSUofMifJaMl+VN8NKgFXNuUYIqq0oFTRipszjDBa38IfYZewNkHowS
	Vpb5MSNPrMqcGN2TPCn5owNyZ6XHXpKxyjyhILlUBT6m3P6T3FSf8Ly64kfS9ahjF/DaUWcyRTz
	WZlzW2ha7Y8Q23ZMp5DA/BolfGiKfbILvgiGbPwZLY0PTY+Kg1mx9Y7D4tTAMigxdmrKsFgrGPW
	Pfc+1AVCm5ojVFz5lOHGZgNv9kWQNLbXbqSDOeap4mN1/x4uhvYD8IqsGoS+PS27vxtpFQoqyvd
	3oMtah8r81T1HCBSzpmQ0thCVC0bEB/UacOYFkC5rHus7QBMoGL/mAXLc73vpB
X-Received: by 2002:a05:6512:3196:b0:5ae:b260:cf47 with SMTP id 2adb3069b0e04-5b453f317f1mr52261e87.10.1786568132298;
        Wed, 12 Aug 2026 13:55:32 -0700 (PDT)
Received: from archlinux ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b4539e9605sm60999e87.22.2026.08.12.13.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 13:55:31 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH v3 5/5] staging: media: atomisp: remove hmm/hmm_common.h file
Date: Wed, 12 Aug 2026 23:51:38 +0300
Message-ID: <20260812205429.39181-6-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260812205429.39181-1-nikolayof23@gmail.com>
References: <20260812205429.39181-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now this file contains nothing, and we can remove it and all the
"#include" directives.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/media/atomisp/include/hmm/hmm.h  |  1 -
 .../staging/media/atomisp/include/hmm/hmm_bo.h   |  1 -
 .../media/atomisp/include/hmm/hmm_common.h       | 16 ----------------
 drivers/staging/media/atomisp/pci/hmm/hmm_bo.c   |  1 -
 4 files changed, 19 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/include/hmm/hmm_common.h

diff --git a/drivers/staging/media/atomisp/include/hmm/hmm.h b/drivers/staging/media/atomisp/include/hmm/hmm.h
index 6bda02b9ff85..be92a9c9046f 100644
--- a/drivers/staging/media/atomisp/include/hmm/hmm.h
+++ b/drivers/staging/media/atomisp/include/hmm/hmm.h
@@ -15,7 +15,6 @@
 #include <linux/slab.h>
 #include <linux/mm.h>
 
-#include "hmm_common.h"
 #include "hmm/hmm_bo.h"
 #include "ia_css_types.h"
 
diff --git a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
index 69cf490bd88c..2a19e3b2c1f9 100644
--- a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
+++ b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
@@ -16,7 +16,6 @@
 #include <linux/spinlock.h>
 #include <linux/mutex.h>
 #include "mmu/isp_mmu.h"
-#include "hmm/hmm_common.h"
 #include "ia_css_types.h"
 
 #define rbtree_node_to_hmm_bo(root_node)	\
diff --git a/drivers/staging/media/atomisp/include/hmm/hmm_common.h b/drivers/staging/media/atomisp/include/hmm/hmm_common.h
deleted file mode 100644
index 029620347302..000000000000
--- a/drivers/staging/media/atomisp/include/hmm/hmm_common.h
+++ /dev/null
@@ -1,16 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Support for Medifield PNW Camera Imaging ISP subsystem.
- *
- * Copyright (c) 2010 Intel Corporation. All Rights Reserved.
- *
- * Copyright (c) 2010 Silicon Hive www.siliconhive.com.
- */
-
-#ifndef	__HMM_BO_COMMON_H__
-#define	__HMM_BO_COMMON_H__
-
-#define	HMM_BO_NAME	"HMM"
-
-
-#endif
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
index 89e56ce07444..ce0c8b2717a4 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
@@ -30,7 +30,6 @@
 #include <asm/set_memory.h>
 
 #include "atomisp_internal.h"
-#include "hmm/hmm_common.h"
 #include "hmm/hmm_bo.h"
 
 static int __bo_init(struct hmm_bo_device *bdev, struct hmm_buffer_object *bo,
-- 
2.55.0

