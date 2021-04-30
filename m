Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9C62F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 14:57:18 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id zg3so24102971ejb.8
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FleOPJ3gtiTATKAeonx+PuxFi1VSxS1weEi5bkXodsY=;
        b=sNERTVIWUOxiu/H67r7IdYKO2yzVdXb+QfoevZdgwBwpNWmEFv+PmYdSGeaYfaG5CG
         rBPPJnkj5bBkQ58Yc3pmg5qdwxDQioDsV3wOqJg/MzHTV20fL2iO5E7UyVeO14onV8DC
         KCRIzz7Cwqm3zS5Umq68JelbfJ+JSGvbIz/NhEPGmHpYgLunhc9qQbzXLdNOqM6AMEQL
         jhe5LM9O/4EyiCwdQEpEKNeWCCMGhEqMm3GHE1/qz6FeD1Y/5+7GoX1COQb+Zd7VUmEk
         QXYYMziPhHwPI30EgaiTvFqwmwrNau/Hs3huKEB6B9vXKkKZeakmm2J10ZW9TfvIhrbB
         lZjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FleOPJ3gtiTATKAeonx+PuxFi1VSxS1weEi5bkXodsY=;
        b=jZUOV/EZPZ7TwosvHnJ9E7pXM02W47dLr4nmp1T2CXCdTZXjKLZOlMjkAkpNNaj31Y
         q8tbDiuH7z0oJjpbxZKbJvQFzmc4BZoNCT6EuXUngwVIDqx26BDZZpkGFFjRpynOMJI3
         2NJIdsPGk/UGs+HxWGSLM066C+edukubfEG11QLVaqLn65rXY9c139euAM1FJ4F43ezT
         4HRltqe9JeTGjZJtDeS81hPvLRxMLPEADoVBpE2R/EpK2K04oBVIXSNsTBHZptT7JzXx
         kIEfmB6IVANoyRCn1p5/TGvLKxsC2zmo4jymHCvh7zRJhJ8xeZznyt99SvTq95OG+2Bp
         WVkg==
X-Gm-Message-State: AOAM530AvKRseBUKZyPTvFF3VBuumV3O3C43yn8fkzTWVXTeGAUVgB7n
	bmV2mOh0MrIcxZg6E69HYJslIkHH3JM=
X-Google-Smtp-Source: ABdhPJx/T0So/ozQ3dUvMaWs+/kR1qIb+BjxlMenrToFic6gbbGwW/9Zwqfex62wrqNdcqaJoQqNPQ==
X-Received: by 2002:a17:906:7842:: with SMTP id p2mr5003301ejm.87.1619794636894;
        Fri, 30 Apr 2021 07:57:16 -0700 (PDT)
Received: from agape ([109.52.244.36])
        by smtp.gmail.com with ESMTPSA id f30sm2109977ejl.62.2021.04.30.07.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:57:16 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 06/43] staging: rtl8723bs: remove empty header file
Date: Fri, 30 Apr 2021 16:56:28 +0200
Message-Id: <5f38543b96f491cf9a11bb8cda17e5be754a3636.1619794331.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619794331.git.fabioaiuto83@gmail.com>
References: <cover.1619794331.git.fabioaiuto83@gmail.com>
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

