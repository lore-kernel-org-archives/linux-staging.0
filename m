Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8A170
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 14:56:42 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id s7so16659874wru.6
        for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 07:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XByxU8I0VSid+b/yMvMswXSnRy3WRcAQkZMoMz7IPUE=;
        b=sBsHmGLLkKiPF8RR/fdnmar/PgKLrUUkbINtjtoW25zBRg9tWDwee4Gk6ESJsKfhMU
         avdW3RoT2x/3mk9RfW7Zy/KSPnJC933HrBRBxZqVcKIc+t9urbu7SSUIo2ga/S50LF3v
         GtF/VaIKGpp/n7HiGeMUCE0wlqlz9eCyS3fZjJqhfGIOYhE4m8s3Ponfzj/noGULliEo
         hS2w8zrFVJAigCQMAzhCUd/5qJAOGA3W7+uCKF/uFbHtpszUduHkfohrfYdkIzIzR5ew
         nkuRhUsV9wsM7KqQqNBGl7smintqjXsOz0FhwXyUmCyoPS1mrLrQQ63qSw1RFfW4rfcn
         AYLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XByxU8I0VSid+b/yMvMswXSnRy3WRcAQkZMoMz7IPUE=;
        b=Uf5pUxirfXgXkjAp1S7OWNt1wHyltkQH4+pKh/CszEnb3OazkL9W2BaY6xUijrxxOU
         vBO4elj1wzDon+2ewdV5urynOP3q+lahJcth66ZmIuw0qCqd91NyW0M3l7UNVoPZklCR
         m9oDWzsa86ZG1ikY1Ci4H2GH18QxtV6GvOZ2gi+AWl0+nToeUKHDVTWXEeInqfYhlZel
         +54qYS36ldDOCYF3diAl8S/EFZtubhI1Bfpy373dy9c3MJaA26hOKpoCC7VChgkV59Ge
         QTZ5l3mUge726IMcoJkC/b/7+MK4DCjsXdU9+2UCRL1ebQIiRn/BnwZ1ZTk3qwT195c/
         g3hQ==
X-Gm-Message-State: AOAM532HH74+TI6nvySMvGzGccO5Bk2tf+p/iXs1/BM8b0K3xnbsfNyQ
	x2mpLV58wqCPsic6hDYfDaLLr1AknmMoWA==
X-Google-Smtp-Source: ABdhPJwtAm6v65tnf2gqzGZC8vcNMx0cHNT4IvzAIDHPG9e/baacf2AeZ5Hz0CyCUuhUJuerIHnyBg==
X-Received: by 2002:adf:a294:: with SMTP id s20mr21462232wra.54.1618325801589;
        Tue, 13 Apr 2021 07:56:41 -0700 (PDT)
Received: from agape ([5.171.81.171])
        by smtp.gmail.com with ESMTPSA id d133sm2749168wmf.9.2021.04.13.07.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 07:56:41 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: julia.lawall@inria.fr,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] staging: rtl8723bs: remove two unused functions
Date: Tue, 13 Apr 2021 16:56:31 +0200
Message-Id: <2e8dd88c053735daed95701140b2f03b4cfe2a2e.1618325614.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1618325614.git.fabioaiuto83@gmail.com>
References: <cover.1618325614.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove dump_drv_version() and dump_log_level() function
definitions and prototypes. Those functions are unused,
and add unnecessary wrap level to log calls.

They wrap DBG_871X_SEL_NL which will be replaced by
netdev_dbg() with coccinelle script application.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_debug.c    | 10 ----------
 drivers/staging/rtl8723bs/include/rtw_debug.h |  3 ---
 2 files changed, 13 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_debug.c b/drivers/staging/rtl8723bs/core/rtw_debug.c
index d3ee7b7f6fde..324c7e5248f8 100644
--- a/drivers/staging/rtl8723bs/core/rtw_debug.c
+++ b/drivers/staging/rtl8723bs/core/rtw_debug.c
@@ -14,16 +14,6 @@ u32 GlobalDebugLevel = _drv_err_;
 
 #include <rtw_version.h>
 
-void dump_drv_version(void *sel)
-{
-	DBG_871X_SEL_NL(sel, "%s %s\n", "rtl8723bs", DRIVERVERSION);
-}
-
-void dump_log_level(void *sel)
-{
-	DBG_871X_SEL_NL(sel, "log_level:%d\n", GlobalDebugLevel);
-}
-
 void sd_f0_reg_dump(void *sel, struct adapter *adapter)
 {
 	int i;
diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index 7747e90bd1cc..f1b37d511f27 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -192,9 +192,6 @@
 
 #endif /* defined(_dbgdump) */
 
-void dump_drv_version(void *sel);
-void dump_log_level(void *sel);
-
 void sd_f0_reg_dump(void *sel, struct adapter *adapter);
 
 void mac_reg_dump(void *sel, struct adapter *adapter);
-- 
2.20.1

