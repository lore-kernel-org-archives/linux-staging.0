Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F93A2F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 14:45:15 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id i3so57235467edt.1
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=COla8THV9MLqgxdkc3FzpFMxvj3Sxk16di+Wdxq2A3k=;
        b=cwQJ7+myEX/mDcGBX2NZhAEoLa5qA5oqAJCVH43z8fwwFsxe9rYLtcRpZ4l4e0hJOW
         5mrl2H0i4hkec2aIvLyOgUTc7hlYxVCqn4vTrk84DMOzWe5BVJk2w3ivvOQ13bPN50Wi
         mivw49nPkFBjKnSQveqUiclF9aP4OG230NrtYzGfmBEAnnymmKoo3a3tXUu6zoldgYIt
         bk3lsdfKfUYAYS6/ZZV9DFWyAs2OsNyMgEKsSiN8F4p/8SrItaliCwwf7GV7xEHb6EKT
         9eFOWjRF34TVCZjUi6CYWLJEXHdVi9hSaGQwMS46hLAkulWPKTO81/JvL4ElyUIIwApa
         15jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=COla8THV9MLqgxdkc3FzpFMxvj3Sxk16di+Wdxq2A3k=;
        b=ckuz4i4iZuZcyEJ6fOT7Qb1UxomcAWhzWoC2x0dRoGAMRe038kL04ff1VvjRp1eK34
         USZRxkAOcX8fsuRS8W1s/YANecSDOyEzY+k/pnkV0gJrUe0uavRixgZvTDkLIyZGb1Io
         WfyCoqkAaMI3AuHrJiLwnm/nN6O0+KGQvhSinz1GfCCp2E1uydoZH5hKUn/QEjtBq44+
         sul/b1EeOMaugDmnnp+IwErNAG0IlIFY3Nji8urRmnqisUXRoTakXdHbLcxbYU95lOPY
         YmbKlZKQt/h5SRJLSRGck3UrQ450TtGmVNlpBnklP4RXgqocKcwv9S2Vc2Byxn6Gr4/K
         vY5A==
X-Gm-Message-State: AOAM533F0ZSydRMxXNk+xyQ0SXJmOaWE3LvR688jv3rsdvd809SpUE5N
	bBRd9MUmDNQ9+YfqCztCQjwfhz0Ly5k=
X-Google-Smtp-Source: ABdhPJyXGn7IvEb/JU5p4RopGS8NYgZb4aQ6RIwKpfs8wW3PwLvougaYvsBz1iENh1IqzIuRfVfASA==
X-Received: by 2002:a05:6402:b48:: with SMTP id bx8mr6279302edb.157.1619793914136;
        Fri, 30 Apr 2021 07:45:14 -0700 (PDT)
Received: from agape ([109.52.244.36])
        by smtp.gmail.com with ESMTPSA id me3sm2063843ejb.49.2021.04.30.07.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:45:13 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 40/43] staging: rtl8723bs: remove empty hal/odm_debug.c file
Date: Fri, 30 Apr 2021 16:44:10 +0200
Message-Id: <f175773c3bc4300673663bf68a6b0611d5af0901.1619793406.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619793405.git.fabioaiuto83@gmail.com>
References: <cover.1619793405.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove file left empty after function deletion.
remove related target in Makefile.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/Makefile        | 1 -
 drivers/staging/rtl8723bs/hal/odm_debug.c | 9 ---------
 2 files changed, 10 deletions(-)
 delete mode 100644 drivers/staging/rtl8723bs/hal/odm_debug.c

diff --git a/drivers/staging/rtl8723bs/Makefile b/drivers/staging/rtl8723bs/Makefile
index c40983496608..fe45200ff53c 100644
--- a/drivers/staging/rtl8723bs/Makefile
+++ b/drivers/staging/rtl8723bs/Makefile
@@ -28,7 +28,6 @@ r8723bs-y = \
 		hal/HalPwrSeqCmd.o \
 		hal/odm.o \
 		hal/odm_CfoTracking.o \
-		hal/odm_debug.o \
 		hal/odm_DIG.o \
 		hal/odm_DynamicBBPowerSaving.o \
 		hal/odm_DynamicTxPower.o \
diff --git a/drivers/staging/rtl8723bs/hal/odm_debug.c b/drivers/staging/rtl8723bs/hal/odm_debug.c
deleted file mode 100644
index 1a2e367bb306..000000000000
--- a/drivers/staging/rtl8723bs/hal/odm_debug.c
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

