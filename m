Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC825F
	for <linux-staging@lists.linux.dev>; Thu,  1 Apr 2021 09:22:44 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id b16so1154712eds.7
        for <linux-staging@lists.linux.dev>; Thu, 01 Apr 2021 02:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IKhEXT66iJIONAmAc2SJC/Db6Cavnl//qgP4+fnjAt0=;
        b=JAfsSg/xP6H1BaRfgCQtGN9xzxHBtoKk1XXrNlLAdSiom41M861yNgL9UxpS1MRmMR
         Dt+qkazwMg1dDc1w/lw79Y58FTeTMLCcG8E8PqhZMF6dnOtogUYeQHqWVrsOdaG8i7OU
         6qDEtxtCmF90kDPuQzJDkq4dAbeSupVFgQuBSIYYOMFZFzq5FhSOpxD2RwZmioCB0QTP
         CRBbg9d5Rr+gEPEhGuzt1jPrc08IBGc5pYdlMAJ9BTOrwD7hVVWMFZ1zQujX8yR3WJNs
         ZHuClfLUVEbY3rvvUDD2XNY4MvJ0RHDPFiHiXvEImZnVO/R+G4AaCnbby0ETn3+r5EYE
         kolw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IKhEXT66iJIONAmAc2SJC/Db6Cavnl//qgP4+fnjAt0=;
        b=nHNckLd8n29gxauIMIToVL4QwkUQHEJdpF/qUTcdB5vHJ2vdVZwAFjL5YLB+2Z/KIK
         1W6rsJUwe67ty6GNdhuceBYJ9z2cXKWrqyOXWzgvXisMId4ZE748f7jcVY2roMMahDpY
         Z4s51MBkgSgssD2yiAT8PDdAU1DEKMSuuV+akjVtUyq5sglC5BMHLtGsv5Bn194JCZkh
         iC3AQu9KKRrwXGpfjLIj2quComd14kxye+4eahERt0ARUZ9wUzJoSW7Z8UrxiUhj6vuu
         isGWeZpvaqcuER2Bu+Rpvddi2Wt53X47EoJ1l5QAoIFnkG5Ms0Gcd5oEL1xIrB7FAe8x
         48QQ==
X-Gm-Message-State: AOAM530ZiOHuCbyIlWPWUgc8mf9QDnytefx4B7GvB7dwoTgnWaJNncNP
	KEhz3cD/OeAyi7JKo5hdfmZ1akTaCEhU2Q==
X-Google-Smtp-Source: ABdhPJxjoF82gW4KMVWKm60oOl8v9ay5vfX9TqHcN5ipYsV9JJRquqKlivA+5y0gzNc/9JVkxyDv2Q==
X-Received: by 2002:a05:6402:1350:: with SMTP id y16mr8650792edw.309.1617268962913;
        Thu, 01 Apr 2021 02:22:42 -0700 (PDT)
Received: from agape ([5.171.80.247])
        by smtp.gmail.com with ESMTPSA id p19sm3273654edr.57.2021.04.01.02.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 02:22:42 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	dan.carpenter@oracle.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 49/49] staging: rtl8723bs: remove obsolete macro
Date: Thu,  1 Apr 2021 11:21:19 +0200
Message-Id: <1c7cdfcf488e5dc5bc5c3c29733b0d53caee71fb.1617268327.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617268327.git.fabioaiuto83@gmail.com>
References: <cover.1617268327.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove obsolete macro RT_TRACE

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_debug.h | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index d3c77798a5eb..6639d79cd7ec 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -131,8 +131,6 @@
 	#define	_MODULE_DEFINE_	_module_efuse_
 #endif
 
-#define RT_TRACE(_Comp, _Level, Fmt) do {} while (0)
-
 #define DBG_871X(x, ...) do {} while (0)
 #define MSG_8192C(x, ...) do {} while (0)
 #define DBG_8192C(x, ...) do {} while (0)
@@ -216,22 +214,6 @@
 #endif /* defined(_dbgdump) */
 #endif /* DEBUG */
 
-#ifdef DEBUG_RTL871X
-
-#if	defined(_dbgdump) && defined(_MODULE_DEFINE_)
-
-	#undef RT_TRACE
-	#define RT_TRACE(_Comp, _Level, Fmt)\
-	do {\
-		if ((_Comp & GlobalDebugComponents) && (_Level <= GlobalDebugLevel)) {\
-			_dbgdump("%s [0x%08x,%d]", DRIVER_PREFIX, (unsigned int)_Comp, _Level);\
-			_dbgdump Fmt;\
-		} \
-	} while (0)
-
-#endif /* defined(_dbgdump) && defined(_MODULE_DEFINE_) */
-#endif /* DEBUG_RTL871X */
-
 void dump_drv_version(void *sel);
 void dump_log_level(void *sel);
 
-- 
2.20.1

