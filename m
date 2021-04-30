Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC532F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:44:16 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id y26so1879380eds.4
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 00:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FleOPJ3gtiTATKAeonx+PuxFi1VSxS1weEi5bkXodsY=;
        b=V/YZ/XGtqW/bOPTBNDpeh1HXpc6qYK8P1gPxPtwvqW2yK6Pw67OO/KJfi3ByTZ7Xac
         Y7RrE77hpN9sXZZpxAB8X+k70NWFJgFQc0WQZRToHbn7Nf6aCn7PsvH6Ty3fAH+KBzJf
         eNoaXhf4MyLuDIaQ8p36MPapwBisgLgV8cuyNB/vuu9KyttT9HgVXyuS/yWyJxYZ8lfL
         g9zrK519s71i7xej4Gv86hcyse7wAPwmulmOa6HHBjWNuZvCNWTAu5dWSe19/HOetn/K
         T8fa0ZP/35/0+wCmlyJiMHEHpbNZPo/szDNEW2cfhsn9oozOgCw8a7P7hRxt83Pz8zA1
         ayRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FleOPJ3gtiTATKAeonx+PuxFi1VSxS1weEi5bkXodsY=;
        b=fkk/d8QoCRpL1/xmS5+5F3fJw2Vw0sg2AffqzUqbxjrsH7rvFRfjQtgUQ66U3P7Qug
         GFoMnKy9pLfGypvLX7lbufLtk6/6QCV3/lOj7iRaz+ib7hXItwSdURhh0Ckp1jzZOu7s
         EQdJKm+5QdNs0lDfcxHQDTW8yAsMWSUJ6i+xcwPiTBKL3mJPGonzB3Mau3SD3Njw3NNW
         mRkPKu8F/WZIQUtWidRl58zjJfV3vn7mIM+xy1fxjwP08haPn5nsLOAgLf5iMB0WqEok
         ld+/YBpruDurHb2UksVY9jpl1dtlp22k4SgGZSzyX73rXvjretlYUk83mHoOl8eYI40i
         RNeg==
X-Gm-Message-State: AOAM532TwNr1VEaz5VXFX6aZ2FZwCNxk97+01vD/zh0YABn11ML0KFoo
	Py0IITHmP51hLJWJam344Wc=
X-Google-Smtp-Source: ABdhPJzEERBtrwZa0o1YQKTkoVGXIdB+5vZaz24vJFIBLiZhoEhj1lpTA61rM8Iy6aYlJxAcQNb4Vw==
X-Received: by 2002:aa7:c7d5:: with SMTP id o21mr4217214eds.166.1619768654795;
        Fri, 30 Apr 2021 00:44:14 -0700 (PDT)
Received: from agape ([5.171.81.86])
        by smtp.gmail.com with ESMTPSA id e4sm1426179ejh.98.2021.04.30.00.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 00:44:14 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/43] staging: rtl8723bs: remove empty header file
Date: Fri, 30 Apr 2021 09:43:24 +0200
Message-Id: <ed2e1d94727c7d2403b5b6c9f265ced934b3c611.1619768150.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619768150.git.fabioaiuto83@gmail.com>
References: <cover.1619768150.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove empty header file.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm.h         |  1 -
 drivers/staging/rtl8723bs/hal/odm_PathDiv.h | 11 -----------
 drivers/staging/rtl8723bs/hal/odm_precomp.h |  1 -
 3 files changed, 13 deletions(-)
 delete mode 100644 drivers/staging/rtl8723bs/hal/odm_PathDiv.h

diff --git a/drivers/staging/rtl8723bs/hal/odm.h b/drivers/staging/rtl8723bs/hal/odm.h
index ff21343fbe0b..ba723ed7aa96 100644
--- a/drivers/staging/rtl8723bs/hal/odm.h
+++ b/drivers/staging/rtl8723bs/hal/odm.h
@@ -11,7 +11,6 @@
 
 #include "odm_EdcaTurboCheck.h"
 #include "odm_DIG.h"
-#include "odm_PathDiv.h"
 #include "odm_DynamicBBPowerSaving.h"
 #include "odm_DynamicTxPower.h"
 #include "odm_CfoTracking.h"
diff --git a/drivers/staging/rtl8723bs/hal/odm_PathDiv.h b/drivers/staging/rtl8723bs/hal/odm_PathDiv.h
deleted file mode 100644
index de69d5ea6ffd..000000000000
--- a/drivers/staging/rtl8723bs/hal/odm_PathDiv.h
+++ /dev/null
@@ -1,11 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/******************************************************************************
- *
- * Copyright(c) 2007 - 2011 Realtek Corporation. All rights reserved.
- *
- ******************************************************************************/
-
-#ifndef	__ODMPATHDIV_H__
-#define    __ODMPATHDIV_H__
-
- #endif		 /* ifndef  __ODMPATHDIV_H__ */
diff --git a/drivers/staging/rtl8723bs/hal/odm_precomp.h b/drivers/staging/rtl8723bs/hal/odm_precomp.h
index d48d681472d5..440a549bffc7 100644
--- a/drivers/staging/rtl8723bs/hal/odm_precomp.h
+++ b/drivers/staging/rtl8723bs/hal/odm_precomp.h
@@ -31,7 +31,6 @@
 #include "odm_RegDefine11N.h"
 #include "odm_EdcaTurboCheck.h"
 #include "odm_DIG.h"
-#include "odm_PathDiv.h"
 #include "odm_DynamicBBPowerSaving.h"
 #include "odm_DynamicTxPower.h"
 #include "odm_CfoTracking.h"
-- 
2.20.1

