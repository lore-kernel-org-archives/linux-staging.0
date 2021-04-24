Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E842671
	for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 09:03:43 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id k4-20020a7bc4040000b02901331d89fb83so2399628wmi.5
        for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 02:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s3aOjnaH0Ilrmmwqcay2E1u5CZjfj+ZVEQps+YLx+tc=;
        b=HwaKfWmvU1ok+nfu/qKLhWpMmw4sdIlUSi9Z+7a/wdVGc4Fl2o+jUD46exN8050Lvv
         9sYoXupOksLbRf6IGCSQpeB/zFyv21bRmVn2inGLkpSNL7gLzdKWk0p3x4yHtNL6eKrI
         lB5GbgLp8yea5qILTx9nTJ5/6zExQc5QDtIl85ekMs56q48LhJRINsnzcYJ1hD3/Un19
         okSXjmz3nyLVOKTsRbpPgI33Na8sSv5g0UAjqLBK/dnxluNDR95eVGwSn7wojdONfJnR
         giiyPYaXPYvkPdtC3HNpuD2WM4XXEOzE5Bfj3xtflzaGcGtTnykX+pJUXOWvKlovJ30T
         hYtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s3aOjnaH0Ilrmmwqcay2E1u5CZjfj+ZVEQps+YLx+tc=;
        b=TwG+ovF/qQ5rRRSlZgI+I0CiNgHcpPV4ym2MFZd9X98CDWx7Skde7shLFtAErUn4kF
         h2gZENj4uZrR+tw1Dk4VGRD21mhBRzBUgT+T6n8/Cbp2aSzhrJoclA9Itiv+ncWkM+Qk
         FR9yaNA/ZcWjfbf8Anb3mWtqDTxmthBmu6MY5E4ozUWPkpPZ48VgVDz/4Lv+alt+aKo0
         2jV1pjXUuuL2F97132xbKlpmyuig5u9Z304/Dd0vSlBst5NYzk25oPaKe6xh4P1Njmr5
         c/48aYUaoiIXXa/U5BFJ6Oa3jzUiPjtiMJL1c6Gq4y+XcMSrmUppANQhigxlxJ3shoGs
         DFPg==
X-Gm-Message-State: AOAM5313tY9SQIlue2SlfERubHAvRm4vk2QpuWyTeu4nI1eliQcUoTJE
	LLj0KWavbD6v84iPDh2514Wmv8k+O7is4w==
X-Google-Smtp-Source: ABdhPJxO08Fgk0qbOrE85qTxyag1yLHrqSMsnK6A1POMQ/5F7jKudUnmFFxMfI4pTfcpvkUnWuAcWw==
X-Received: by 2002:a05:600c:4fce:: with SMTP id o14mr9711931wmq.121.1619255022633;
        Sat, 24 Apr 2021 02:03:42 -0700 (PDT)
Received: from agape ([5.171.80.252])
        by smtp.gmail.com with ESMTPSA id 24sm15305938wmk.18.2021.04.24.02.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 02:03:42 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 40/50] staging: rtl8723bs: remove unused debug macros tied to os_dep/osdep_service.c debug
Date: Sat, 24 Apr 2021 11:02:23 +0200
Message-Id: <c6e1367c0cc08a06e4eefe60f1aadd25d46675c3.1619254603.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619254603.git.fabioaiuto83@gmail.com>
References: <cover.1619254603.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused debug macros tied to
os_dep/osdep_service.c debug.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_debug.h    | 5 +----
 drivers/staging/rtl8723bs/os_dep/osdep_service.c | 4 ----
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index c061d874f4e6..3e391a23ac8f 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -7,7 +7,6 @@
 #ifndef __RTW_DEBUG_H__
 #define __RTW_DEBUG_H__
 
-#define _module_osdep_service_c_			BIT(22)
 #define _module_mp_			BIT(23)
 #define _module_hci_ops_os_c_			BIT(24)
 #define _module_rtl871x_ioctl_os_c		BIT(25)
@@ -21,9 +20,7 @@
 
 #undef _MODULE_DEFINE_
 
-#if defined _OSDEP_SERVICE_C_
-	#define	_MODULE_DEFINE_	_module_osdep_service_c_
-#elif defined _HCI_OPS_OS_C_
+#if defined _HCI_OPS_OS_C_
 	#define	_MODULE_DEFINE_	_module_hci_ops_os_c_
 #elif defined _RTL871X_IOCTL_LINUX_C_
 	#define	_MODULE_DEFINE_	_module_rtl871x_ioctl_os_c
diff --git a/drivers/staging/rtl8723bs/os_dep/osdep_service.c b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
index 9c6b1666df13..c58555a4012f 100644
--- a/drivers/staging/rtl8723bs/os_dep/osdep_service.c
+++ b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
@@ -4,10 +4,6 @@
  * Copyright(c) 2007 - 2012 Realtek Corporation. All rights reserved.
  *
  ******************************************************************************/
-
-
-#define _OSDEP_SERVICE_C_
-
 #include <drv_types.h>
 #include <rtw_debug.h>
 
-- 
2.20.1

