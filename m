Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6028B2F9D
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 14:57:15 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id u3so27004645eja.12
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3tIIreTX1B9CMYOHSzNQF8ZG+/YV3WWYfSInXojnLbE=;
        b=RdJbPgZDSCfM2XhsOV2nzj424rJzDJW5lq4ZfnXn3f/9oRks5QwjhtAb7STj+60M4x
         gUvc6rYkS0emf8qc5Q46ls36trL25hSksB0vmpDmZo/Jpeo8Wrni1lu7bN/Vu2dRcJsw
         yrkbCXFwtqouR9EB4wMVGzlHY26Ae0Fq4HOqgwICkvJnwnIV44W8126jGBNwx0RTD/F+
         7SGacmddfXsL+uP8rCJTQYFu+ptlLCxtEm7K+t0nt2pHw2lcP7RnkbnfAdgjPWH0XSh0
         cMAMuxNMh/4QQGccVEX/IbKezG7gPg/ep3YcmKbRle5TzhnLYm8oiUE07B/f+4LitnUz
         fNGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3tIIreTX1B9CMYOHSzNQF8ZG+/YV3WWYfSInXojnLbE=;
        b=pjeOcGdGyrElRw6ndoyxv+G4s9rxwlwRKjZIOpPPBrUe/31umnK9r0ckYcgRZ0aC6P
         fCoh8g/v7HTKiEA477aQy3Re+aY3kaq48BSQ+LTTtEwiPN4pAarprjoABimuS6qiYS4X
         B9zbOZMBuzK1Q/jwOjUPIqo9USu0VFgPoEMaPdNoXy04O/511WaMKikpQb89QbLWLLMr
         reCTJA+Ms+Qfn83x2Grbfo7R4qkCbE7cbgQlBINPOj60HPnY0R1ZB4+fXeew9Q+TY3tn
         jnasaPKE1Rjn1AQx2BzbGCzsGnO3P039zf1lzs9AUs1Ow5JiHfBg4Zt1C8Qaj684F0fo
         ElPA==
X-Gm-Message-State: AOAM530NuJ6s+c1G0fRM7tKu2nEUmM2+HTbMoRQCGIhl8YEBxtZu1eU8
	rEMJRbRIVvyPbox562YtHto=
X-Google-Smtp-Source: ABdhPJzywSMbF7Ja+SNGHhApyNWR2SMA6v53KvwW0xHy9HG+XH9ZxDxdBn+9tM4F5GTTtiwSl705cg==
X-Received: by 2002:a17:906:5495:: with SMTP id r21mr4871192ejo.471.1619794633933;
        Fri, 30 Apr 2021 07:57:13 -0700 (PDT)
Received: from agape ([109.52.244.36])
        by smtp.gmail.com with ESMTPSA id ks10sm2092672ejb.41.2021.04.30.07.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:57:13 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v3 04/43] staging: rtl8723bs: remove empty hal/odm_PathDiv.c source file
Date: Fri, 30 Apr 2021 16:56:26 +0200
Message-Id: <90ebcf46a58375ae25d51638ae91fa40521c6c06.1619794331.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619794331.git.fabioaiuto83@gmail.com>
References: <cover.1619794331.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove empty hal/odm_PathDiv.c source file.
remove related target in Makefile.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/Makefile          | 1 -
 drivers/staging/rtl8723bs/hal/odm_PathDiv.c | 9 ---------
 2 files changed, 10 deletions(-)
 delete mode 100644 drivers/staging/rtl8723bs/hal/odm_PathDiv.c

diff --git a/drivers/staging/rtl8723bs/Makefile b/drivers/staging/rtl8723bs/Makefile
index dfe410283ca0..c40983496608 100644
--- a/drivers/staging/rtl8723bs/Makefile
+++ b/drivers/staging/rtl8723bs/Makefile
@@ -35,7 +35,6 @@ r8723bs-y = \
 		hal/odm_EdcaTurboCheck.o \
 		hal/odm_HWConfig.o \
 		hal/odm_NoiseMonitor.o \
-		hal/odm_PathDiv.o \
 		hal/odm_RegConfig8723B.o \
 		hal/odm_RTL8723B.o \
 		hal/rtl8723b_cmd.o \
diff --git a/drivers/staging/rtl8723bs/hal/odm_PathDiv.c b/drivers/staging/rtl8723bs/hal/odm_PathDiv.c
deleted file mode 100644
index 1a2e367bb306..000000000000
--- a/drivers/staging/rtl8723bs/hal/odm_PathDiv.c
+++ /dev/null
@@ -1,9 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/******************************************************************************
- *
- * Copyright(c) 2007 - 2011 Realtek Corporation. All rights reserved.
- *
- ******************************************************************************/
-
-#include "odm_precomp.h"
-
-- 
2.20.1

