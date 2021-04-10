Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2166D6D0E
	for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 14:20:47 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id x4so9821182edd.2
        for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 07:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7Ihlf6EeNR0Ofy/7hSQfm/MbRWgreKGnDKnK62NK7Uo=;
        b=De7eaLb73QaNAFXdzKrrurzhdbblg1ANXUUNY6GK5QDY2uitlAKmxthg1gbRnvkA+r
         E+phag5oZhzde7J6Fr+r0oRaPAr0y0XtJdKkajUPJUpYm9dXbBa4IesXxxhga0ezn1Cu
         Eq7syHLMXa2ShtjsqailmdJwDNnNZ+iiVscTi4sXDryPqLnZ2x+thz34RCCXU2Iej2uk
         E7lYTJ83Fo3T0v7MDd9+m8FWek4sQalv7/YbKt/KOfshwRGktVJnn1H3j2jaCPwxVMBj
         TppB8A++uvewUDF4r96qyIccwH7aOGjiPNVRJJgr0m/Ym5HFPmzeq6Ps/d8xkT0ZGqDn
         S5Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7Ihlf6EeNR0Ofy/7hSQfm/MbRWgreKGnDKnK62NK7Uo=;
        b=fQ2S48t28h2kOOoAt4LpgDS3Uj+QnRWDJOp39AzN4nIRxM/Mqq/zXW4lee9rBzAUL1
         u7Pe2cCMMHnJ366beftL6SqaNKhtZm1Zbluh4x5yT4sYQoWzUrf1bdFabdukCLJZD1Cf
         VJmsVNnz5mUMvT6onSeLjViV3x6qtsblFQZqQRP8S46L82vT//EKNTj9YnST5P9hV8Lh
         CCadAqhRme80Gu/YqXAGs57486Cx2Gym7P+Y2AZNf9A3dhF6scO6CP5MAI+EFuIIhAnA
         osp2skokGFtwAnNoouvPmPPdcRJDcDb4yzXx+Gb8zOhvP5nmkzCNw6oQEO4PbUOImNdn
         +AWg==
X-Gm-Message-State: AOAM532ovmZvEIQTk/05Hj7kBIkHVWKf5F75ad6JgRgP25BB2RbN6d9B
	EmtZcRitoDvm3PkYtzGSglA=
X-Google-Smtp-Source: ABdhPJz3qI31piMzN/172lSxyB86SDdbkXGNuWnJML4z0NDfxvNYM5y6iT5JN+r2j9WAWJD4mg7vJA==
X-Received: by 2002:a05:6402:104c:: with SMTP id e12mr21390495edu.108.1618064445712;
        Sat, 10 Apr 2021 07:20:45 -0700 (PDT)
Received: from agape ([5.171.81.28])
        by smtp.gmail.com with ESMTPSA id p4sm2560398edr.43.2021.04.10.07.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 07:20:45 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/25] staging: rtl8723bs: remove DBG_8192C macro definitions
Date: Sat, 10 Apr 2021 16:20:16 +0200
Message-Id: <e7259eeb5927d48a2920548b92dc507befa5e6af.1618064274.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1618064274.git.fabioaiuto83@gmail.com>
References: <cover.1618064274.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove all DBG_8192C macro definitions.

Macro DBG_8192C belongs to a family of verbose
private tracing macros.

The default behaviour is _do nothing_, to activate
it one should define DEBUG symbol by hand.

So just remove it

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_debug.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index 65e1d9bd7099..7747e90bd1cc 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -131,7 +131,6 @@
 	#define	_MODULE_DEFINE_	_module_efuse_
 #endif
 
-#define DBG_8192C(x, ...) do {} while (0)
 #define DBG_871X_LEVEL(x, ...) do {} while (0)
 
 #undef _dbgdump
@@ -193,15 +192,6 @@
 
 #endif /* defined(_dbgdump) */
 
-#ifdef DEBUG
-#if	defined(_dbgdump)
-	#undef DBG_8192C
-	#define DBG_8192C(...)     do {\
-		_dbgdump(DRIVER_PREFIX __VA_ARGS__);\
-	} while (0)
-#endif /* defined(_dbgdump) */
-#endif /* DEBUG */
-
 void dump_drv_version(void *sel);
 void dump_log_level(void *sel);
 
-- 
2.20.1

