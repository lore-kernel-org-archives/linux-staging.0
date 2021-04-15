Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C2B6D32
	for <linux-staging@lists.linux.dev>; Thu, 15 Apr 2021 10:07:43 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id y20-20020a1c4b140000b029011f294095d3so14263642wma.3
        for <linux-staging@lists.linux.dev>; Thu, 15 Apr 2021 03:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=873gk6pELNZLFerjSZqmlNlTvV/hjDYlASHgozHzVZ0=;
        b=n0oaecMjObdX0MGX9l3Q7lO0EHAoDhTwFPyj9xJhVjpEh5hulNm8WvA06vxCS68nzP
         xIThcU369Y17gZNQOX/7ZpQ+JI3zjR1MLdqT5NwFZKimsHgwFK7Tovj6WPQQi55UrWoB
         PU8KJUPuRkRvbIh1GhGJJDzQi+SJE0EXjKGayOt7M8XSH9Iv5y4YjUq3q9AgmJneFrUg
         nS1VE1k80xmSmTJHwEBCkeDr9rmpW71jqQ8qqH9vSrjj/np/LncAFEw8+lD9L8xJ0jn+
         EyCVmSgZv3g4Y3tx6Kyeb2K8plaKFyrC/4QuOTFS8IXRGfSslw3Prz8pwUDdGZrTY1hi
         1StQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=873gk6pELNZLFerjSZqmlNlTvV/hjDYlASHgozHzVZ0=;
        b=XxBRFitHULnh634OTU3HlteEegTS+dv53X14vMOYOEUTLUev7JKf2fYQFVN2PgIcHw
         8eUk/xPtSNwpQ6Pbx3Zvd/FdfzpIO4+h4I40Eso5raKTf/R7b2wTSSZGueMAUztOHufN
         JsvvDOZdk3SNPJqbJOG7it11Ww1hrIi9/AQwc4lM+OLCS7SsXUEB0h/fTAamVuQ+yoNJ
         reTafd9+kSCvsjLD1tWNEmS0XNEhekfpnNah/E3S+BNRTDH/1S3G3GqGKH1wBaAxhXlu
         fs6YKgWiv2DgK5/UqXEpVEW0F/kOMIoxjKzeJ+vifA2386N3sg7MG63cW5a8/5xZRf8i
         kuAg==
X-Gm-Message-State: AOAM533ZNOIOpiXPpyx1f01eZkZpgSs22lr74pBoswGs/OnY5xJpwxvl
	LJ8GNwagYUVEReuTaiB4CvA=
X-Google-Smtp-Source: ABdhPJwjwjgBnAt8qFrrT1F9oBmScy3DlpE4Yjnafd/HxxgUyHhJicBN5T638mFNMLI9gHQM2GSXRQ==
X-Received: by 2002:a7b:c769:: with SMTP id x9mr2368517wmk.124.1618481261936;
        Thu, 15 Apr 2021 03:07:41 -0700 (PDT)
Received: from agape ([5.171.72.223])
        by smtp.gmail.com with ESMTPSA id n2sm2181383wmb.32.2021.04.15.03.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 03:07:41 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] staging: rtl8723bs: remove unused DBG_871X_LEVEL macro declarations
Date: Thu, 15 Apr 2021 12:07:23 +0200
Message-Id: <ec371fd8a4e53b4730b45f0a1c9210106b2914f2.1618480688.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1618480688.git.fabioaiuto83@gmail.com>
References: <cover.1618480688.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused DBG_871X_LEVEL macro declarations.

DBG_871X_LEVEL macro wraps a raw printk call which is not
recommended in a device driver context, prefer using
netdev_*() log functions.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_debug.h | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index 12873c3d801d..23f4cb4711d4 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -131,8 +131,6 @@
 	#define	_MODULE_DEFINE_	_module_efuse_
 #endif
 
-#define DBG_871X_LEVEL(x, ...) do {} while (0)
-
 #undef _dbgdump
 
 #ifndef _RTL871X_DEBUG_C_
@@ -146,18 +144,6 @@
 
 #if defined(_dbgdump)
 
-/* with driver-defined prefix */
-#undef DBG_871X_LEVEL
-#define DBG_871X_LEVEL(level, fmt, arg...)     \
-	do {\
-		if (level <= GlobalDebugLevel) {\
-			if (level <= _drv_err_ && level > _drv_always_) \
-				_dbgdump(DRIVER_PREFIX"ERROR " fmt, ##arg);\
-			else \
-				_dbgdump(DRIVER_PREFIX fmt, ##arg);\
-		} \
-	} while (0)
-
 /* without driver-defined prefix */
 #undef _DBG_871X_LEVEL
 #define _DBG_871X_LEVEL(level, fmt, arg...)	   \
-- 
2.20.1

