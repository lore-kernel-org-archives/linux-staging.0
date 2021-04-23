Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549A42FA1
	for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 14:59:22 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id c15so39765587wro.13
        for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 07:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Juwe0Gjnc+rMihuOPa254C+qnQsP361xtVqHu6bwkD0=;
        b=cilC5YmEgJWBEcFSrGf/9kWUjXxhw49oiDoI3EjCtAmU2yChXbtjNmoQ6uMhNnR8Rq
         n3aLrpj/1oVi33nYg60ypuXLCgszNOofkfDhiu+t2a/9n1F7/Uy55lyp21fQcaCtnnS1
         OtG6vsJI/3v9ZJUHO+N0kHcXXZnSNTc7SbznsFVDW/Lrb92Zb9yVqgMLw13+XSL9DMhF
         mYopVWSdBftqRn4VMVFwA5Y5XzcFMXR7Ce/9wzl4kgG+obWINEFCJCCqv3uZ2cjqsF4N
         ORFQfa5hiJFI1rqTA+++4cma0u3Vv74e2r92lTTFy/F8fHuAZKoNKBYRepEItbcjJDbt
         LtWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Juwe0Gjnc+rMihuOPa254C+qnQsP361xtVqHu6bwkD0=;
        b=ResO9sBHHExE5kBf9ho+fTjaOGq0vbPfoG1rREBj7yhmaUIREwv7MYcG6n+Fj8iud3
         RqJ9GxT1Ha4SieVS0eG60I3903g0+5zM+RDfAOB+UxXcWPwFq18yblPQF4+vANptODTi
         ARVr/705D28XklgugZeIJh7f7zjENbtK223S86XmKMBbB75qkX6419UKLNxGNLgPSDsw
         YD4yixcFNm2/onnFI+k1FWWP21hVndiW1QXsFvUJHDVb+1UnDA3/LQLWNeMvj0n8/1Eq
         x3UVkwVinoB1aI2B5MVzp/p4qb4lgV0LQssX6+ZFczegxWFP8PsjlSv11AC0+glUqI5B
         bQSw==
X-Gm-Message-State: AOAM530gnKloGAYTDodNjAhUPKN4nRt/R5kiUEF7Nn+Yc4ukUch8e/G5
	gqu0SVoIRuDtq1qzU+21FxC/BNVY3go=
X-Google-Smtp-Source: ABdhPJz9kh80zY5LPlC37x/Vv1IbCQwUqZ99lMGUtY3OmTk+nlgp25cntfeAJZzL5zlLbQmfTUZdNg==
X-Received: by 2002:a5d:47ad:: with SMTP id 13mr5342048wrb.56.1619189961030;
        Fri, 23 Apr 2021 07:59:21 -0700 (PDT)
Received: from agape ([5.171.72.99])
        by smtp.gmail.com with ESMTPSA id g1sm9301081wrd.69.2021.04.23.07.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 07:59:20 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 24/49] staging: rtl8723bs: remove debug macros related to core/rtw_io.c tracing
Date: Fri, 23 Apr 2021 16:58:15 +0200
Message-Id: <fd1b76fc795bb0752ff0de0486f996148a3d0a72.1619189489.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619189489.git.fabioaiuto83@gmail.com>
References: <cover.1619189489.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove debug macro definitions related to core/rtw_io.c
obsolete tracing.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_io.c       | 2 --
 drivers/staging/rtl8723bs/include/rtw_debug.h | 5 +----
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_io.c b/drivers/staging/rtl8723bs/core/rtw_io.c
index c860ab7d618c..ecbb679fbc16 100644
--- a/drivers/staging/rtl8723bs/core/rtw_io.c
+++ b/drivers/staging/rtl8723bs/core/rtw_io.c
@@ -25,8 +25,6 @@ jackson@realtek.com.tw
 
 */
 
-#define _RTW_IO_C_
-
 #include <drv_types.h>
 #include <rtw_debug.h>
 
diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index 6e6dea4779d9..7206fdfbe12d 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -7,7 +7,6 @@
 #ifndef __RTW_DEBUG_H__
 #define __RTW_DEBUG_H__
 
-#define _module_rtl871x_io_c_				BIT(9)
 #define _module_io_osdep_c_		BIT(10)
 #define _module_os_intfs_c_			BIT(11)
 #define _module_rtl871x_security_c_		BIT(12)
@@ -34,9 +33,7 @@
 
 #undef _MODULE_DEFINE_
 
-#if defined _RTW_IO_C_
-	#define _MODULE_DEFINE_	_module_rtl871x_io_c_
-#elif defined _IO_OSDEP_C_
+#if defined _IO_OSDEP_C_
 	#define _MODULE_DEFINE_	_module_io_osdep_c_
 #elif defined _OS_INTFS_C_
 	#define	_MODULE_DEFINE_	_module_os_intfs_c_
-- 
2.20.1

