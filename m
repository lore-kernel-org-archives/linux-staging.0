Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF10728E2
	for <linux-staging@lists.linux.dev>; Mon, 20 Jun 2022 17:20:34 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id g26so1065412ejb.5
        for <linux-staging@lists.linux.dev>; Mon, 20 Jun 2022 10:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ISO3ngQzzJ4OiP9AbNGdrSFXdCPVGHs+T2TYP1Gv8y4=;
        b=gL/K5nrO7bkVCfckZHGKWvkEiCtlD4+9JeLW20YA1eNZfFtnI/R9dfx4lSNW+sgJsT
         9r4VTHCVZNxIxE00gqLF/7URAO1Yd45Qv8RznywWuGF5JLW0+d3Zl44eTie9dTK8nFiN
         i4dJTuK5ec7Eng2zd+1xLts5kUzc2nuqWTJ+NsnrDlahohq3Ijr4V0kymerf3DiNxDWA
         3AIcDESRyCZh4Wov+MilLogWKukFmEETX9oYsCe3SUkY5d3XWpj0D5ulmzTAastmk4xL
         +LXs9rv4NJKvLlmT1X5h6nE/A0We/qxho0LSW1Bec1IunPDr3OJuLaXZjJ9VVz42Tb8g
         6bzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ISO3ngQzzJ4OiP9AbNGdrSFXdCPVGHs+T2TYP1Gv8y4=;
        b=Tk35UFmvY9CedfBOTKtvhexkpPUWypvfxHiCd5TitjV8x8FEbOw+M4yleteID5iBhH
         yrI+GACCVKBw86UsbKoGLb4nwJMqn0HAalqZ/C7QhtWmA5u7igNvYeBByTC8052ZiP1I
         iaIwB4+NEk20vNECPrAXBrhR1kXrGLt1Jp381yCTjXyjmPH0vfuvKORewZA/AJW9dckh
         DxG1DTNsJAlPVK8MBAjt38nWD9z0kbkii3R+U11wefM2j+XyBW4PS2JfuIDXOTqHfpKu
         JOjt1cG1ITfydDPrjLT2KtORqgfND4ubs67aM+2RhHm4cc6GMxuFQ7bwBUbfcBP/OT8O
         eYCQ==
X-Gm-Message-State: AJIora9ZyYJF8jxOGA84ckMEVnaH0qn2bnWPIuGIGlPo6TLRUW1j9CIL
	QK5F8oq3sohzq56f/NwhTdE=
X-Google-Smtp-Source: AGRyM1tXK7vcBCjf16rmiqeAXws/YXjlSneQHNLgna5Hyi1cjtU26yvhCMIlOEK4ryxarzyPftr7+A==
X-Received: by 2002:a17:906:604f:b0:718:e9e8:9d2a with SMTP id p15-20020a170906604f00b00718e9e89d2amr21421812ejj.315.1655745633101;
        Mon, 20 Jun 2022 10:20:33 -0700 (PDT)
Received: from nam-dell.fritz.box ([2a02:8109:afbf:ed88:9959:ca73:b489:46f5])
        by smtp.gmail.com with ESMTPSA id b9-20020a1709063ca900b0072232a898f1sm3409066ejh.103.2022.06.20.10.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 10:20:32 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	namcaov@gmail.com,
	phil@philpotter.co.uk,
	Larry.Finger@lwfinger.net,
	paskripkin@gmail.com
Subject: [PATCH 2/2] staging: r8188eu: remove basic_types.h
Date: Mon, 20 Jun 2022 19:19:34 +0200
Message-Id: <1b8200420a2a1b7276f49eb3c2768ef39d641713.1655745123.git.namcaov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655745123.git.namcaov@gmail.com>
References: <cover.1655745123.git.namcaov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove file basic_types.h because the content of this file is not used
anywhere.

Signed-off-by: Nam Cao <namcaov@gmail.com>
---
 drivers/staging/r8188eu/include/basic_types.h | 19 -------------------
 .../staging/r8188eu/include/osdep_service.h   |  1 -
 2 files changed, 20 deletions(-)
 delete mode 100644 drivers/staging/r8188eu/include/basic_types.h

diff --git a/drivers/staging/r8188eu/include/basic_types.h b/drivers/staging/r8188eu/include/basic_types.h
deleted file mode 100644
index 0b71e2c6e41a..000000000000
--- a/drivers/staging/r8188eu/include/basic_types.h
+++ /dev/null
@@ -1,19 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
-/* Copyright(c) 2007 - 2011 Realtek Corporation. */
-
-#ifndef __BASIC_TYPES_H__
-#define __BASIC_TYPES_H__
-
-#include <linux/types.h>
-#define NDIS_OID uint
-
-typedef void (*proc_t)(void *);
-
-/* port from fw */
-/*  TODO: Macros Below are Sync from SD7-Driver. It is necessary
- * to check correctness */
-
-#define	N_BYTE_ALIGMENT(__value, __aligment) ((__aligment == 1) ? \
-	(__value) : (((__value + __aligment - 1) / __aligment) * __aligment))
-
-#endif /* __BASIC_TYPES_H__ */
diff --git a/drivers/staging/r8188eu/include/osdep_service.h b/drivers/staging/r8188eu/include/osdep_service.h
index f1a703643e74..1d97d5be46d5 100644
--- a/drivers/staging/r8188eu/include/osdep_service.h
+++ b/drivers/staging/r8188eu/include/osdep_service.h
@@ -5,7 +5,6 @@
 #define __OSDEP_SERVICE_H_
 
 #include <linux/sched/signal.h>
-#include "basic_types.h"
 
 #define _FAIL		0
 #define _SUCCESS	1
-- 
2.25.1

