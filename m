Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBE3481A9C
	for <linux-staging@lists.linux.dev>; Fri, 14 Aug 2026 15:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786720296; cv=none; b=dV1r3Rzyw/HmbC5Yhj5+nh0vgWPfVlQbFkWiXBsYOeLsynCPr6xJX9IZuOD/MWsxzjGYoWZXOCmPgTPOjGrlHYg2YMsmGqYTyBbTTEm/q8E/gmL/Gos5e2EB/lXTaEO+9EXBbVG9Py/hTW9uIyNriGqu8xDbWrz++gFme1L78Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786720296; c=relaxed/simple;
	bh=XsU4KkXrbGzK0QK8y3CwxsLorSCvlWH6WhdpqA7lSP4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YmLbGIHYT8kild4EzMozdXD1V/uObsAq/jw6fmcWXw5qXI5nbXkQCC+0pR/O4CGiBR56/zVdpTQH0b4xuRThMJJ4IbbIhT2r/yVsk/9iykTWRhNjhqYtU7/XVQteB7HR8pgSDJ5HwvFmEkzEaCcRz1lthSzqoNYAtHJ4mzbnnS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OmlrPdyd; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OmlrPdyd"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3a115c08b0bso9613421fa.0
        for <linux-staging@lists.linux.dev>; Fri, 14 Aug 2026 08:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786720293; x=1787325093; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=74afaLSqgvu8r2wfuVQY2p6CPs0wjD5M9FZY2Wu7Cjg=;
        b=OmlrPdyd03+cVeW3WPivGL6yQhoiR1kyozL7v/+9A/BixDtUTFOOkxwzPD/DHofWon
         zDP7V+F5Ql8t2kvdBZRHiN8EYJtEjvG/GDE5hg/sebejoRX+W3CVwH73k/lpW5L02PgB
         22QS/YfzwmJtzr9OJagTDPTqQ5fcNSEDK7xP55+pIstC5fWJXO7OWJKtvMc0Qvq53arC
         ixPRUEB0xgn65pxNaSDz0TCiVNh7s+qoWLiYSDbC3VOrZG+GY4BZ2ygEgUT1wj/FyBeQ
         pbPQrG1UNfq5TX5mFAs/Ss/EcNd+yMLeFQQDNyF/ZdsgYrckJdPxY6Ss4VR6cUKWkRfh
         VTpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786720293; x=1787325093;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=74afaLSqgvu8r2wfuVQY2p6CPs0wjD5M9FZY2Wu7Cjg=;
        b=q0EodyXTmV+3fMsTPbbQboUNAl3EFY38h+5H47axdjfxX9XI2CttgwVc3pAbKij2p+
         2HRgOGCMCYjGnEvNoHJ7wQg1Nj/m0GbJbNKLru8kqu0cpD+hg1ZqGao8MjgG5Rz1S2lN
         m8AN9sT8c1kUzMZATONV0REaAQcA2fFPxC22dybmeo+rL7abWQCRrOYEZU40AH85UIU0
         AAT282rddkNu66XroZCyCOIBcVu3hErcbhQV8UyTYVWAQPGkO1JHnCFgjAFuROfc73Ng
         nD8sPVwX25phuxLCnnBmCLJsoHTaiKVq3JZkT2wgSouAIZr6SDzDF5NUhcFEwPHGc9FR
         vhgQ==
X-Forwarded-Encrypted: i=1; AHgh+RpjLQ2ZidGmCBu5UZrmKA0R6BLeFIlg/Z2c/uWg2rnaNhVI/wMpwRhbq7XAqrexPA6UcfjoQIcXo+LDYrE7@lists.linux.dev
X-Gm-Message-State: AOJu0YxJoZeqfmVDYAjgvrJU94s9U+lpFeJ+0/YaoaI3umwwEFAqzbF7
	Lt3oFt9PUTf8mte2wELwImUmcq9qz4LhJjIow2VdOxkYHtZHyd9VTx3E
X-Gm-Gg: AR+sD12QtfUOnsrgqelOhABlIZBvBfR+Wqtn+L5P0Q6XdnhYKjGcGzMBFZWszxbKDKY
	hMaf/sHSpDIWEJ6Q59H8k0XO7oOsG1a/OWzyBMCVeX3mKXU+43Nwn9SEaibkMG2QkNeOQWuf3Ce
	1wRqTzIYm1mWoLkM2un8n//WuGEyohVmXi7A3m4pOIDf/objmwNXDhxVO8fJ7641aGzb7EwS2kD
	ZJtV2/QtQWznoXGXFze9lupcHppA0QP/iAi/7gZtGlHqZSmHt/2aUcFhqtu2S7EGz9KSKXkq1sC
	9stPevh/NywLNDkEO6r8/dDaAykBqbANJYmyayod4py3785ZJS0gm3+BhX2S3La5rCpMIbrauKT
	Fi7RkAQqFuGdcwB0yoAVAQtA01EfX/T14XBViMlCxFRVS1Iaxci12guZrdVL5JdAqG5C5FK2sqU
	dyzfMPaTAb0kMSdg6P08qjHHupe6az9KaCOTrSipMlddfN0DGHKGM+cfNylxU+ZxQZ9Qx6tg==
X-Received: by 2002:a2e:a986:0:b0:39c:8c37:bfa8 with SMTP id 38308e7fff4ca-3a1327dffdbmr6928051fa.29.1786720292737;
        Fri, 14 Aug 2026 08:11:32 -0700 (PDT)
Received: from [192.168.243.250] ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a130d204b2sm7138251fa.41.2026.08.14.08.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 08:11:32 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
Date: Fri, 14 Aug 2026 18:10:12 +0300
Subject: [PATCH v4 5/5] staging: media: atomisp: remove hmm/hmm_common.h
 file
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-atomisp_remove_hmm-v4-5-c3c954a12b51@gmail.com>
References: <20260814-atomisp_remove_hmm-v4-0-c3c954a12b51@gmail.com>
In-Reply-To: <20260814-atomisp_remove_hmm-v4-0-c3c954a12b51@gmail.com>
To: Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-staging@lists.linux.dev, Nikolay Kulikov <nikolayof23@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786720280; l=2496;
 i=nikolayof23@gmail.com; s=20260402; h=from:subject:message-id;
 bh=XsU4KkXrbGzK0QK8y3CwxsLorSCvlWH6WhdpqA7lSP4=;
 b=2LUmSBJW769o+AgUiECvrtfLA+q+wU99S8oMeQTRu+HwABsH6lGWQxnlolf168u87nviYhmFv
 RA/PMbCUK3YA24f6AF9R7gOHbKh9vHta4oTqV7OWnE8MmjEfpJ5kYap
X-Developer-Key: i=nikolayof23@gmail.com; a=ed25519;
 pk=2GWUU1isl5NJpkwSCQ4OG80EinZ3EUZXlrgAg6Pz5zI=

Now this file contains nothing, and we can remove it and all the
"#include" directives.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/media/atomisp/include/hmm/hmm.h        |  1 -
 drivers/staging/media/atomisp/include/hmm/hmm_bo.h     |  1 -
 drivers/staging/media/atomisp/include/hmm/hmm_common.h | 16 ----------------
 drivers/staging/media/atomisp/pci/hmm/hmm_bo.c         |  1 -
 4 files changed, 19 deletions(-)

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
index 7d0ef0f9eec8..c26038be76b6 100644
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

