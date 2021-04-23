Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422992FA1
	for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 14:59:11 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id y204so24800867wmg.2
        for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 07:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3ASz4YhECpEaBfGtt4tRNIDu5bRVVnAa9AjlX4YDm8o=;
        b=j8ixrypmhFUbl3uQWnYCR/9g08NrSdnaS9mMtRmwJStnJ13S6tWfZZtTih/HCY/qns
         3RraMknghvBTfesK+aXVebpkG1MmSyFpUNlWNnE4byqK6icef0z/hNoLNOZmiRkz+Arw
         Vmz2O07Nfgg8S47OjhjUGoDYi3lMFDcmun6Z1Hmro7f/fOQZWWxrXgPShwMH9c2JWVHG
         3mmCqTQ/8OU5gq4r9s46ZpUPuoN9ZgBsybt8ANFfhzODRsUVJwmWZ+8k+0Py1cJ8E8vh
         10R3Sv50++/y30PEVp5FmAQHbQtO98OVfMl+AnHBgh6QVJOxa4bl5QfQ8kRjnES53p6I
         RzrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3ASz4YhECpEaBfGtt4tRNIDu5bRVVnAa9AjlX4YDm8o=;
        b=IcdHeDKOT90MudFQJDU9boq2Tzqb/xVShlrVE3Q28Q6hiVMSyHy5SSPilSEVgJzUnc
         KPHRbLaxk3FJZrxS2kt9pP9oPWYSBye+S/pL2IvKgC5bm2JWunaSRoprTFtSi8w4k4qH
         cxBbtYMOnXeTLjuSCL1qGJmXFc6jVg8E2kjebW72NzCENGZZ0378Gd1OiF2EjRx93+iY
         5n30el2nd7me6vrzEQvynPDsZxT67ne+QBaOKcpy+SBFX85ugnaPgjXwJwXuyegnxEU3
         OiARrXv+/0NKZp5PBM+t47y0vnPoN4LCBE+6g1qJxRcvOEfOIU+XrFdmZzBZ+Btm8w8t
         P4CQ==
X-Gm-Message-State: AOAM530tty5GlNcC2NRLL7bzIxfs9941YKQVO8HBheHZzLsLSVgsf7KN
	vLBlvSpKGL5WKddxLXJASxLzpOvX4rM=
X-Google-Smtp-Source: ABdhPJyd7QIqAGfJX0cCaDqlP6IdYLJjfiP/T9LLNsQzPfV8S9k+EK4I7a84K7AcxyoNeZ/UHt6jhQ==
X-Received: by 2002:a05:600c:3544:: with SMTP id i4mr4601542wmq.38.1619189949941;
        Fri, 23 Apr 2021 07:59:09 -0700 (PDT)
Received: from agape ([5.171.72.99])
        by smtp.gmail.com with ESMTPSA id b12sm37942782wmj.1.2021.04.23.07.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 07:59:09 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 17/49] staging: rtl8723bs: remove debug macros related to core/rtw_mlme.c tracing
Date: Fri, 23 Apr 2021 16:58:08 +0200
Message-Id: <dcb7fe18b687fe809cf77265046ab85789c3e019.1619189489.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619189489.git.fabioaiuto83@gmail.com>
References: <cover.1619189489.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove debug macro definitions related to core/rtw_mlme.c
obsolete tracing.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c     | 2 --
 drivers/staging/rtl8723bs/include/rtw_debug.h | 5 +----
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 4707dba90397..569943a09848 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -4,8 +4,6 @@
  * Copyright(c) 2007 - 2011 Realtek Corporation. All rights reserved.
  *
  ******************************************************************************/
-#define _RTW_MLME_C_
-
 #include <linux/etherdevice.h>
 #include <drv_types.h>
 #include <rtw_debug.h>
diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index d04f116bc9a4..01d723268254 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -7,7 +7,6 @@
 #ifndef __RTW_DEBUG_H__
 #define __RTW_DEBUG_H__
 
-#define _module_rtl871x_mlme_c_		BIT(4)
 #define _module_mlme_osdep_c_		BIT(5)
 #define _module_rtl871x_sta_mgt_c_		BIT(6)
 #define _module_rtl871x_cmd_c_			BIT(7)
@@ -39,9 +38,7 @@
 
 #undef _MODULE_DEFINE_
 
-#if defined _RTW_MLME_C_
-	#define _MODULE_DEFINE_	_module_rtl871x_mlme_c_
-#elif defined _MLME_OSDEP_C_
+#if defined _MLME_OSDEP_C_
 	#define _MODULE_DEFINE_	_module_mlme_osdep_c_
 #elif defined _RTW_MLME_EXT_C_
 	#define _MODULE_DEFINE_ 1
-- 
2.20.1

