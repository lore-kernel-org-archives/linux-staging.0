Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8B22FA1
	for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 14:59:15 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id c4so9801535wrt.8
        for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 07:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cKfjBv5oTcSk6L5J12Sz3Xed8IildkiInI8JvUMXG+I=;
        b=YD0iX7xf3ZZPky20crmJiWB3Z6+0Ihi9hgAVN9nZqz+bCNQhoS7f+1zgI2iywdcvRT
         4Zwt5AaxzxqQvcrqdsjJTMUuTJVPaXsC50e/ap2NLNLr5h2FkE49t7iLHnULW7tjMHAN
         NQbqevX1erWcVSHaiU2MFoL7A+NYBcFoJPCdmqBup0qQ+Y/LC3TtkW70lPxZrBGw0juY
         JEuWznfhxjCaI+iRaDhk8ZT14o82gHK4L/zozWNPsbha22v4q+CnH1dGFkj3M4Xbpmib
         KyYu1SEvaakA+XvL7qoDrPEjsn4IJbO+mrGzICrStAYmsJm3wyhQP3NcWLpUjdIm7t2m
         O/2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cKfjBv5oTcSk6L5J12Sz3Xed8IildkiInI8JvUMXG+I=;
        b=fSd4ZAaGhw288La/SzIf7g2+TZBt6Ed1qR5aeu+LhRRRGi0+1cSQfLqxxTCdyaMAe7
         0+ywDFQeP6Cx3kzdKsmHpB41Fhs7jONczfxBa0Q/Erj6/B2C48UkFH99/uIFG7ctGSqt
         r3Bp6W08vXpZS9Yq2F5INs/yY6Ui9+odmyFQEjiGQlH5XQkVY22Q1I0l4Gd70JPl639z
         uyaBj4iWeob4d/Y2TcfTa3TdEfyFfwSrF4S2O4OF5bJ079RpovqBj4XwT261DgupTmmO
         USTXuQJgtGmcyWYx1LFIsYz+VafAQqDLd/KG1jPe/Jaod1Pde5FGxIs84DzDBzH2LQx6
         I3xQ==
X-Gm-Message-State: AOAM531n0LNSeomUhf/JqR5S/HWPoKo2TBNqa4cpGKJFmb25ZWkkg6tI
	4ZSvtOe+bcOGZZzHQfiW7ZY=
X-Google-Smtp-Source: ABdhPJxQSxhvtdHrqJxFZgaMiYq71UFU1Tuh2VJ1VyyaSRu8fjdiipE4IvSHmWHGxvGd8es2WrSzxQ==
X-Received: by 2002:adf:e2cc:: with SMTP id d12mr5258654wrj.90.1619189954574;
        Fri, 23 Apr 2021 07:59:14 -0700 (PDT)
Received: from agape ([5.171.72.99])
        by smtp.gmail.com with ESMTPSA id o17sm7440385wmq.47.2021.04.23.07.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 07:59:14 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 20/49] staging: rtl8723bs: remove debug macros related to core/rtw_mlme_ext.c tracing
Date: Fri, 23 Apr 2021 16:58:11 +0200
Message-Id: <5b05bbb97c433f6e4b169dd9dd4da4dabf3b1bd9.1619189489.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619189489.git.fabioaiuto83@gmail.com>
References: <cover.1619189489.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove debug macro definitions related to core/rtw_mlme_ext.c
obsolete tracing.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 2 --
 drivers/staging/rtl8723bs/include/rtw_debug.h | 4 +---
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 1ff2b3a28bab..3e4dc44c8599 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -4,8 +4,6 @@
  * Copyright(c) 2007 - 2012 Realtek Corporation. All rights reserved.
  *
  ******************************************************************************/
-#define _RTW_MLME_EXT_C_
-
 #include <drv_types.h>
 #include <rtw_debug.h>
 #include <rtw_wifi_regd.h>
diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index 7f5b98578d60..d51e22ee1328 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -37,9 +37,7 @@
 
 #undef _MODULE_DEFINE_
 
-#if defined _RTW_MLME_EXT_C_
-	#define _MODULE_DEFINE_ 1
-#elif defined _RTW_STA_MGT_C_
+#if defined _RTW_STA_MGT_C_
 	#define _MODULE_DEFINE_	_module_rtl871x_sta_mgt_c_
 #elif defined _RTW_CMD_C_
 	#define _MODULE_DEFINE_	_module_rtl871x_cmd_c_
-- 
2.20.1

