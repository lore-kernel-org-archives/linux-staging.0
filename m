Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B201E2FA1
	for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 14:59:47 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id t14-20020a05600c198eb029012eeb3edfaeso1404751wmq.2
        for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 07:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s3aOjnaH0Ilrmmwqcay2E1u5CZjfj+ZVEQps+YLx+tc=;
        b=AQYqASXOLdUk14/Ym3YL9Gi66w1svfIt+913AKyxEZOUziuFxKLTg0NRCrq1LRV8pn
         rNWzNuV1hssvTOexOADvFWnBBc4+eay6is7YacCU+Bd3+moFUdL5fjl5/6nOW03BEgYO
         UFnLv+MY6Xl8Avaga33Zh509BAGfJ6FuA0LXFuzacx2xbbtYHqNJSlN5+Td2oNez4sBj
         RrtXQncwYAIMMG15BSpIJpl9AT/u1T7QLlUGn7YjZ0VxUEQ4nMCgdZ6Pi3HAXERz/W3c
         vPPH1g4ByZT0qCOiyH3zNrbyw1PxuMOfEk081+Cff2KOKfR0RTWEOEnMkaDm7M73pDF2
         SURQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s3aOjnaH0Ilrmmwqcay2E1u5CZjfj+ZVEQps+YLx+tc=;
        b=gr1zbT1ZUH7wXEI5mCbNQmSVpwWhrBJOrfXAP3DrJ69YD5g+V5vIJJfBGwcWJXe0Sb
         fLaCqlWEZmTHXBVxW8bh+kXCo7n4OMxSWthHtTr4YGplGD1pY9wYAgVlNEic1sPhlM4z
         DklwxjCjSvqB8iyuiyeeKAJcE9QFdbH5fgb6eRuuJi3bH0heTaeIuNLKtIgyJ59SqZYx
         W/KuOO+21Q6LbodhU/E0PUf7S1iaCivp9qQ407fxJPa91jE7vSOoGFHeraCtVFwoXPdg
         Gd6pcvvlFDXr7ookZlvkpS0wyT3X9XJkv1qlVpOcFml+R9crPaQuagxg/oFDt6708kd2
         a7Lg==
X-Gm-Message-State: AOAM531HZgswtyMJTiXwGQfUqV0Y+ZQkbSvqelp+czgBQfN0qggXOQc6
	A0kWSubyg7kpS/fZWhVFMIo=
X-Google-Smtp-Source: ABdhPJxUmXAPOTNkCFPDE3q+IM1Xe/qQQbyN2pCxmh/3D12oocB1VnS6shyrd308VW4Ql3XvEKPjpQ==
X-Received: by 2002:a1c:f20f:: with SMTP id s15mr6195750wmc.61.1619189986373;
        Fri, 23 Apr 2021 07:59:46 -0700 (PDT)
Received: from agape ([5.171.72.99])
        by smtp.gmail.com with ESMTPSA id f24sm10996312wmb.32.2021.04.23.07.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 07:59:46 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 39/49] staging: rtl8723bs: remove unused debug macros tied to os_dep/osdep_service.c debug
Date: Fri, 23 Apr 2021 16:58:30 +0200
Message-Id: <d65e708935a08e37c6001a90c108f8234aa28e54.1619189489.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619189489.git.fabioaiuto83@gmail.com>
References: <cover.1619189489.git.fabioaiuto83@gmail.com>
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

