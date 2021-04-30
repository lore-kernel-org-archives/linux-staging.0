Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C792F9C
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 14:58:13 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id g14so23293642edy.6
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=COla8THV9MLqgxdkc3FzpFMxvj3Sxk16di+Wdxq2A3k=;
        b=vfyMn8NrfMAGI7+JQqgX5mLUxEs2WdoFuKJw5iEFBeq949/rxWaVKAZZOhuhu/DmUz
         hkhE+2ywdIM0muE+AtsRgybLPGfAJUltWCkL8CDg54tbQDmiQUizxH7ZRakWFirouME7
         YcRDom/hZS9kund6s/lrK9Ec2MblQ/XIrLBxilM2xOiwAKPfmkd/YOIkoM6ar3J6e173
         CLAekfNBv3kZ0GPRekauWt956HGsT3B5ctOr8iM7KWvCCrDBwZWGqu8ibo/y22xuhT1z
         WZMQQZJ6XW4QlL3IGJHvv6iareAfcfU0KH9iwBPKqDGRt8MgHv/A6TCU6Xb5yPUKX4VR
         kbBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=COla8THV9MLqgxdkc3FzpFMxvj3Sxk16di+Wdxq2A3k=;
        b=k3gXPTJXQ/aDGeupUpfchZx7wny6bp+0wWmuITPO7vktWdkTrFsF4Serw9WYyuhxZZ
         XdKCSOX2Fr5PcOmcFYDM2/ZzEpd1LtJ7JABLioGcqfo6B41jdZ49HW9SOzbdwqBo3WvR
         DIzgCXyyVHM5bD9YXs1dWQD7L2nnEoZSLfYTWi/33rtSWkOpABJLc98AYO3E7pZVS9rD
         fClgow1qluAZVg/R53hAnbTS+7wayGydosLTsz7X1DFNt/9GcaCYUvrdkHAn2346bJKb
         FUNLteatmNv25YgMamAGXPGURAO4zZxIdmRZikjem5LdbRbdEznYMWTtoLZ5pn3VTb67
         qIDQ==
X-Gm-Message-State: AOAM531yNNuXbvrxLe5qoJnP0WBt1jTm8fVXPYgGiGio5Qrxt/7NcSi1
	QxSebbvCez12YEvHnTARZn0=
X-Google-Smtp-Source: ABdhPJykYYMOTuoCwSZeNKy9UqcoH0ZqAeevkuiWANoHm5o1e4hesuTDnCctIFzWkIW2PyLhydsuew==
X-Received: by 2002:a05:6402:1ed:: with SMTP id i13mr4135328edy.27.1619794691978;
        Fri, 30 Apr 2021 07:58:11 -0700 (PDT)
Received: from agape ([109.52.244.36])
        by smtp.gmail.com with ESMTPSA id f19sm1497788edu.12.2021.04.30.07.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:58:11 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 40/43] staging: rtl8723bs: remove empty hal/odm_debug.c file
Date: Fri, 30 Apr 2021 16:57:02 +0200
Message-Id: <0bd6ce2da09a5e2a671dc4a53f1c2e7ba1a64066.1619794331.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619794331.git.fabioaiuto83@gmail.com>
References: <cover.1619794331.git.fabioaiuto83@gmail.com>
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

