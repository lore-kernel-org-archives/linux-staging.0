Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2AAA2F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 14:57:19 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id q6so23707539edr.3
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=To5Vs4KwxhQBIQUiXfT+kEa1NbW/RrIHm/UCYNTGQs4=;
        b=FkW2n5uhRVS/tbvwwiD8+p/OMOIVy0D0hwSVIFuuzueBZfBLWbIDJvrVq/SUOztFIj
         bVRwXAap3Li/3uq9pPcSuwUXQevRCvJvs8NxeHC4+LWEZioFOZ29Qy0B9W9kfy5HoDiC
         3Uk8HzVIhCKtKSFAZ6Uk1RjEG5DPsejS6zVtZ1VWafrOXuSPTDWnVfJ9CFqXn+LQBDT1
         CVet7VlAy32dKOyRGkuFKawpII1TM/BbhO4LYakcI2mhgNcUeCDHEzDiqgkVpLvj9vzz
         +R/poNaF1z+D0lAFzcLdj8R7oxLpIsTXWRuVgDKBS0kfWKB9dQMB5JhW9r1bJPtyhjfk
         NPeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=To5Vs4KwxhQBIQUiXfT+kEa1NbW/RrIHm/UCYNTGQs4=;
        b=ILLuaHLa66d2OgV3RbZVIsEOn2XLRU6GhxPn5s/HKCw5FFsbXqXhI07vluYNM6dMqS
         VYyToKYBsJk2krtG41lIhCUNwHefGg44YaeKDareM15RBZrLvvkldxjG3874Sd00la4+
         apUxIE3SSnYGPGT6eY5rexy6Hxt6QE1qzqBNdmKuHEM3AdKsjNXDbO6PxlYNdCJNMffy
         96A98U8IFJMIplZMurCdKMKf9gFXOQ+5QZn9Dj4I6dCi+Eqxqf1ov7sRZvi8AUayTVjX
         R2HDvn3ZTUutoJHiNY652S0iXmLpSpiRAVzA5kjX/QmAXHKEcMosQ/R+RzdUj5mVRETQ
         ZuoQ==
X-Gm-Message-State: AOAM5309hisA17FslCDa37qxxVOxKZvJWSoKlo7tjgAslO1mCQWWODcA
	SP/lVdQT/8zJVR00xf+errE=
X-Google-Smtp-Source: ABdhPJxczERZnNHtsul7hOhkaQLuitz+UTPnft/C3X1DL0/21XZlcjrynzOgzmLId6+KXKdP05mKsw==
X-Received: by 2002:aa7:c412:: with SMTP id j18mr6505470edq.163.1619794638510;
        Fri, 30 Apr 2021 07:57:18 -0700 (PDT)
Received: from agape ([109.52.244.36])
        by smtp.gmail.com with ESMTPSA id m2sm1529162edc.10.2021.04.30.07.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:57:18 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 07/43] staging: rtl8723bs: remove ODM_RT_TRACE* unused macro defs
Date: Fri, 30 Apr 2021 16:56:29 +0200
Message-Id: <f0feec848702a12594bb67acceb42f4be647088e.1619794331.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619794331.git.fabioaiuto83@gmail.com>
References: <cover.1619794331.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused ODM_RT_TRACE* macro defs.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_debug.h | 23 -----------------------
 1 file changed, 23 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_debug.h b/drivers/staging/rtl8723bs/hal/odm_debug.h
index be0d4c49a747..09e8bfec7664 100644
--- a/drivers/staging/rtl8723bs/hal/odm_debug.h
+++ b/drivers/staging/rtl8723bs/hal/odm_debug.h
@@ -96,27 +96,6 @@
 #endif
 
 #if DBG
-#define ODM_RT_TRACE(pDM_Odm, comp, level, fmt)\
-	do {\
-		if (\
-			(comp & pDM_Odm->DebugComponents) &&\
-			(level <= pDM_Odm->DebugLevel ||\
-			 level == ODM_DBG_SERIOUS)\
-		) {\
-			RT_PRINTK fmt;\
-		} \
-	} while (0)
-
-#define ODM_RT_TRACE_F(pDM_Odm, comp, level, fmt)\
-	do {\
-		if (\
-			(comp & pDM_Odm->DebugComponents) &&\
-			(level <= pDM_Odm->DebugLevel)\
-		) {\
-			RT_PRINTK fmt;\
-		} \
-	} while (0)
-
 #define ODM_RT_ASSERT(pDM_Odm, expr, fmt)\
 	do {\
 		if (!expr) {\
@@ -150,8 +129,6 @@
 		} \
 	} while (0)
 #else
-#define ODM_RT_TRACE(pDM_Odm, comp, level, fmt)		no_printk fmt
-#define ODM_RT_TRACE_F(pDM_Odm, comp, level, fmt)	no_printk fmt
 #define ODM_RT_ASSERT(pDM_Odm, expr, fmt)		no_printk fmt
 #define ODM_dbg_enter()					do {} while (0)
 #define ODM_dbg_exit()					do {} while (0)
-- 
2.20.1

