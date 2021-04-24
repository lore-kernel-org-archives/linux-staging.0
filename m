Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D00A71
	for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 09:03:08 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id f195-20020a1c1fcc0000b029012eb88126d7so2411419wmf.3
        for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 02:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YcuffsLTjuFNEp9yR3yPCxH/1v2srf0L4WVCdD7zdno=;
        b=CJ9mKAMpzy7MUH9uhgfTxXTlSCr+jWPT+/RS8UYrVxaFrtoGWas3/57aCvthmduj8Z
         F3fs2Y80I5qnx8Uenkou0srjSlZsgG6eED9UmBr4YYJF+sF8AMM924H9/mdyAM+S8Zpy
         yxBC/TPEHhoS20Lq8/KIurftk02qmSau5vnYU/nzYrWdM0vW8t2va399HW0Ezz4kF954
         ZcWp1nzOUD/FwlaqzlHF5+86b4VWJ/6/Eagj7NlzgfrWy8Dnszmbcj+tldaRdGx4APC7
         rE7/t5r/Y43sABwwu57ZbEsrgda1wB6+ln5hIccurU5g5Yva88MSW+kEo9Heho7e7I9g
         gKsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YcuffsLTjuFNEp9yR3yPCxH/1v2srf0L4WVCdD7zdno=;
        b=YYt4gVVevuZOVYc+UWUg2YFUSMpHfV+z3uD8ZGOug+DqEnJj1bjVNSrnZ/xHCK9SVf
         ulEM8b5tGuekBUd/yaXH2Yjg8zsjOJTWcDXnsnKL/1pyE2iehUdXofxbBYqGJKj0qFZv
         fsBS7oyAagUn7mRetwKZnoK4+zj/0edIQmH/LulQm1Wjt2f0SPIVSiIqStArUQPBs39K
         9IT9GUqaCxVGZ+C5ond044rhr5+4h4t2zTwI0lQjaynzB8IK+wGjZqMo/ipGUjAQK6AL
         ECP5EYVYn8ecyKhrZu6IJ/DJZDq1jm11Q7dvjBLGG8oQAvI+wJ8xDdjrPsJCV8nERbZa
         3HPg==
X-Gm-Message-State: AOAM531x+X3G6LORGNMWvldCXm4D3asEX8RDjV5ZXtNvnwSHslw7EIOt
	oFqFBcdGw9BEZzySnSO1tDc=
X-Google-Smtp-Source: ABdhPJwGFooaZC7dZCtqbqYT9pIBFRzOUYNj9wwrtCHVtcshN+4CaLYhIJQPUg+hflxdlrwt//C4+w==
X-Received: by 2002:a7b:ce09:: with SMTP id m9mr8492947wmc.150.1619254987199;
        Sat, 24 Apr 2021 02:03:07 -0700 (PDT)
Received: from agape ([5.171.80.252])
        by smtp.gmail.com with ESMTPSA id i12sm12301839wrm.77.2021.04.24.02.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 02:03:06 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 19/50] staging: rtl8723bs: remove debug macros related to os_dep/mlme_linux.c tracing
Date: Sat, 24 Apr 2021 11:02:02 +0200
Message-Id: <2528845d21764e95ab03d9245999b79acb2febd8.1619254603.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619254603.git.fabioaiuto83@gmail.com>
References: <cover.1619254603.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove debug macro definitions related to os_dep/mlme_linux.c
obsolete tracing.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_debug.h | 5 +----
 drivers/staging/rtl8723bs/os_dep/mlme_linux.c | 4 ----
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index 01d723268254..7f5b98578d60 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -7,7 +7,6 @@
 #ifndef __RTW_DEBUG_H__
 #define __RTW_DEBUG_H__
 
-#define _module_mlme_osdep_c_		BIT(5)
 #define _module_rtl871x_sta_mgt_c_		BIT(6)
 #define _module_rtl871x_cmd_c_			BIT(7)
 #define _module_cmd_osdep_c_		BIT(8)
@@ -38,9 +37,7 @@
 
 #undef _MODULE_DEFINE_
 
-#if defined _MLME_OSDEP_C_
-	#define _MODULE_DEFINE_	_module_mlme_osdep_c_
-#elif defined _RTW_MLME_EXT_C_
+#if defined _RTW_MLME_EXT_C_
 	#define _MODULE_DEFINE_ 1
 #elif defined _RTW_STA_MGT_C_
 	#define _MODULE_DEFINE_	_module_rtl871x_sta_mgt_c_
diff --git a/drivers/staging/rtl8723bs/os_dep/mlme_linux.c b/drivers/staging/rtl8723bs/os_dep/mlme_linux.c
index 0a16752f805b..a4560ba22db1 100644
--- a/drivers/staging/rtl8723bs/os_dep/mlme_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/mlme_linux.c
@@ -4,10 +4,6 @@
  * Copyright(c) 2007 - 2011 Realtek Corporation. All rights reserved.
  *
  ******************************************************************************/
-
-
-#define _MLME_OSDEP_C_
-
 #include <drv_types.h>
 #include <rtw_debug.h>
 
-- 
2.20.1

