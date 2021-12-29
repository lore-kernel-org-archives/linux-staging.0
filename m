Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8393E2CA1
	for <linux-staging@lists.linux.dev>; Wed, 29 Dec 2021 20:51:36 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id d9so46677900wrb.0
        for <linux-staging@lists.linux.dev>; Wed, 29 Dec 2021 12:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3ew7F1lxhIS5r8KK5lw0J3RaoujT9aqfKyhZYEfOCx4=;
        b=o4AGJuLWx9w2v21x6J8BAv3mEbi3IazkRVq3VQJZiFT16p4jsw5TvPHWReTmVOa8E9
         6QsD8KDmbvb2Q8geHamQCNXymMoUd234OT5hZFCVvM818cSA+nTOcJJ09lA1oYOJ0OZJ
         JEC/Tj6I8f37zNop8zW3nogSOz7he+4l8sjedxJZ0izCOyej9FApP4DS8lqgj4Enh4VC
         Oxzuwe+vZzv5Fv8pF5eTDTyaHEqGOEaLFA4QquoWL+evmxmDvlMQB/gfpX7+Cux0Six9
         wmmPD/IH5aaoYNfPeMzd/czTWGjSVF+7O5de5tft28yVe8Xz9FEmSmLPdMlUeTQQUN9a
         D40A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3ew7F1lxhIS5r8KK5lw0J3RaoujT9aqfKyhZYEfOCx4=;
        b=RUs5WdM49+FK1ZH7rCgDiyTmjyG/tNuVzUTwnb2eM8cdHTuGKaNTqQ6oe1qK/YuxDd
         /mgHjDkRJwx8HXSBgYmaKFBxoxuJYKSN8nXMGq2yCip9zxTOBpl+mNskvHP6DnVJPnWx
         55Li3MDu5JDKFtexmf1jHJdJzKgCLfF425dJNPiPGsPFq4mn4BSxGF/41DmOAwvXYxnr
         0D4MTOCs7aL0h2aIZUy+jaKmkSq8kYAltPwADg9v09BMzT8jHAw+JgJD5t6wTp5/RXP3
         a73QUVhabG1ndNZMt9ai080TfEpK3qg2OatAp5SKayB8/zWPp+ymJ/v2KohtNTa+4jrs
         kVPQ==
X-Gm-Message-State: AOAM533HQNhUVLvWqMODPkoUtKt91JHQfmEu1l9n6lKCaPiK/dxvMQpP
	Oe/QI6hzR4G1Pu15oEC3wlU=
X-Google-Smtp-Source: ABdhPJwYOkerewv7gWD1pfel4pVnEesKUvd0eCbMymilZ39ogjmeuQDaj0uwlKjbp+7caUtkTtjtjA==
X-Received: by 2002:adf:efd0:: with SMTP id i16mr22452714wrp.86.1640811095013;
        Wed, 29 Dec 2021 12:51:35 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::6619])
        by smtp.gmail.com with ESMTPSA id l12sm27421989wmq.2.2021.12.29.12.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Dec 2021 12:51:34 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 12/32] staging: r8188eu: remove odm_interface
Date: Wed, 29 Dec 2021 21:50:48 +0100
Message-Id: <20211229205108.26373-13-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211229205108.26373-1-straube.linux@gmail.com>
References: <20211229205108.26373-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After previous cleanups the file odm_interface.c is emtpy now
and the header odm_interface.h just contains an unused typedef.
Remove both files.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/Makefile                |  1 -
 drivers/staging/r8188eu/hal/odm_interface.c     |  6 ------
 drivers/staging/r8188eu/include/odm_interface.h | 15 ---------------
 drivers/staging/r8188eu/include/odm_precomp.h   |  2 --
 4 files changed, 24 deletions(-)
 delete mode 100644 drivers/staging/r8188eu/hal/odm_interface.c
 delete mode 100644 drivers/staging/r8188eu/include/odm_interface.h

diff --git a/drivers/staging/r8188eu/Makefile b/drivers/staging/r8188eu/Makefile
index 5e1649491ef4..a7a486cc16dd 100644
--- a/drivers/staging/r8188eu/Makefile
+++ b/drivers/staging/r8188eu/Makefile
@@ -11,7 +11,6 @@ r8188eu-y = \
 		hal/hal_com.o \
 		hal/odm.o \
 		hal/odm_debug.o \
-		hal/odm_interface.o \
 		hal/odm_HWConfig.o \
 		hal/odm_RegConfig8188E.o \
 		hal/odm_RTL8188E.o \
diff --git a/drivers/staging/r8188eu/hal/odm_interface.c b/drivers/staging/r8188eu/hal/odm_interface.c
deleted file mode 100644
index a70fda30a24f..000000000000
--- a/drivers/staging/r8188eu/hal/odm_interface.c
+++ /dev/null
@@ -1,6 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/* Copyright(c) 2007 - 2011 Realtek Corporation. */
-
-#include "../include/odm_precomp.h"
-/*  ODM IO Relative API. */
-
diff --git a/drivers/staging/r8188eu/include/odm_interface.h b/drivers/staging/r8188eu/include/odm_interface.h
deleted file mode 100644
index ef96d577cfa5..000000000000
--- a/drivers/staging/r8188eu/include/odm_interface.h
+++ /dev/null
@@ -1,15 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
-/* Copyright(c) 2007 - 2011 Realtek Corporation. */
-
-#ifndef	__ODM_INTERFACE_H__
-#define __ODM_INTERFACE_H__
-
-/*  2012/02/17 MH For non-MP compile pass only. Linux does not support workitem. */
-/*  Suggest HW team to use thread instead of workitem. Windows also support the feature. */
-typedef void (*RT_WORKITEM_CALL_BACK)(void *pContext);
-
-/*  =========== Extern Variable ??? It should be forbidden. */
-
-/*  =========== EXtern Function Prototype */
-
-#endif	/*  __ODM_INTERFACE_H__ */
diff --git a/drivers/staging/r8188eu/include/odm_precomp.h b/drivers/staging/r8188eu/include/odm_precomp.h
index 22299f167af8..a0d5e870c11a 100644
--- a/drivers/staging/r8188eu/include/odm_precomp.h
+++ b/drivers/staging/r8188eu/include/odm_precomp.h
@@ -24,8 +24,6 @@
 #include "Hal8188ERateAdaptive.h"/* for  RA,Power training */
 #include "rtl8188e_hal.h"
 
-#include "odm_interface.h"
-
 #include "HalHWImg8188E_MAC.h"
 #include "HalHWImg8188E_RF.h"
 #include "HalHWImg8188E_BB.h"
-- 
2.34.1

