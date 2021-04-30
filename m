Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3862F9C
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 14:44:22 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id u17so105744506ejk.2
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3tIIreTX1B9CMYOHSzNQF8ZG+/YV3WWYfSInXojnLbE=;
        b=kY2fuWFzZBQPYrKQUvmoawyPfZ8i88hcoDHVmSaEqx9xQK8WaBtIQ2TkUxLeOWayKD
         b67AcQkhOKkhIvABqfdbVxVLHos2bnBtSQbOC7zFTB86+D8X2F2+QVzhnHuTSgomAgue
         aW4f2N+390budIEDSoOua9ce/myMycUpRdpGPlE9HpHX1WoVq2Y+DGg7Acq7WCiefLl3
         P4vPbGOlfztXK214RPiQNLsPLEHdp9vO+ihrz8BtScLZP6wMPqJkDpUsmAV9tvUK5Rha
         wQGOkMCCyavqDjaB0hoSi5gsmJl6L9T8haKN6mBZZgp4SMAe0WsY5Jc0knbl5iEqqsYz
         LIqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3tIIreTX1B9CMYOHSzNQF8ZG+/YV3WWYfSInXojnLbE=;
        b=l4YQJAxK0EeeJ7VXj5K2lxu9GGvycUzPoQ5ro9Abl2GbNpG9VilA3XRo5a62vE/g3W
         YIiAZ1C8Kk0elgnJYyJr4LOdvkxQmhpNBO/UfSSYEabJ5P/s6deLZrCr5mpDcdn0SLgd
         ZYllBsnG9yaiEsTAscHNNFAO089DlZnkrewwhUDhI8ckpkdN7HIPfx3DoFCYjklnNo8S
         089TM3eCkZght/ywzAI71yGPnmZMcU0lp/J4vxhaxEnur6P6Bgn3+qQ5QkXHNVdX5bVI
         VCPR5r5+I7+tTEm0utZHdPJFo4hcc8GdqnaeJ1FEku3BcER0I6andODCjsnU1LZBDapC
         wLeQ==
X-Gm-Message-State: AOAM530I+ocSWhXEO0LdgujvWLFqU58euSkHXtJFgztmiC1AOai88tse
	YT0AD6RdYYuiJD/mkCMyuFI=
X-Google-Smtp-Source: ABdhPJx6Mg50k2nUqbrwHIZ9haYq2cUe72jmceQ346gKUj9Y2MfcEeHNWbDM3ywDB9J0DNxLXYl63g==
X-Received: by 2002:a17:906:cd27:: with SMTP id oz39mr1098247ejb.129.1619793861245;
        Fri, 30 Apr 2021 07:44:21 -0700 (PDT)
Received: from agape ([109.52.244.36])
        by smtp.gmail.com with ESMTPSA id rs28sm2047845ejb.35.2021.04.30.07.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:44:20 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v2 04/43] staging: rtl8723bs: remove empty hal/odm_PathDiv.c source file
Date: Fri, 30 Apr 2021 16:43:34 +0200
Message-Id: <508498001a7c0665c2b4ff1c09385018e4a72655.1619793405.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619793405.git.fabioaiuto83@gmail.com>
References: <cover.1619793405.git.fabioaiuto83@gmail.com>
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

