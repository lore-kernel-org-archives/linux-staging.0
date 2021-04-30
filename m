Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A862F9C
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 14:44:26 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id di13so672363edb.2
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=To5Vs4KwxhQBIQUiXfT+kEa1NbW/RrIHm/UCYNTGQs4=;
        b=d3GVzqh3cIJ2kTDbiFmWkIxu0xae8TF50ikxxDLwKh20iUeyObjynelbULg/cNaGg/
         iFjbvcDpaN0jkSXYte0or8ZMVdZCYuftG0Hw7FMcADdyZ7KwuXhwmqBXP98on09Qxgrl
         HOsHIp71figOvAnRwRRCc6jVzV9AwyxVW10PH1WF4LaokpwzaSH4z0GrMkTNsEBnSxm0
         tIyt98mhsocFiqaY6A/TAie5CDM0TcLnFqvo3CjkjkRdbvGKT3DOb/gF18nNtSbTxW2R
         EJcHaDf/KzxB5axT2FjHmXXMzgdH6xMsZIkB3dXDnn8gSFkEqi63cAc2wEpqstxaV79U
         q3ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=To5Vs4KwxhQBIQUiXfT+kEa1NbW/RrIHm/UCYNTGQs4=;
        b=jMQjMvgi/yg0aAdwD2mh5bFJy+fpU+7ydjFe/xEaLZgHIwpAM51CTttGaeTC4PjTn2
         3NHlOKj33F2fwig5EgOOx+RYicN5XJkIgpUwJoScOMDBA0cJilscliBpVUM9gekoIV/m
         15DWGR1JiITi7+285fyQABoxoy66y+vfsBivqImS9Kb314R21q9DHOE9EoD8kGgwpZ6j
         6B8K7MPpJQrpKVhgmFJ6Yu0ZPoXt9jicCO2H74T1rRcO6iw7hX+2YJPdxClFEh6uZnnm
         onf1MRPvTRITDsXju88iDVO6K2d4YYIzlo6J9cu5ugtnJJ/8xQKG7Kv2yQCQOEQxddiY
         BqIw==
X-Gm-Message-State: AOAM532IM0rHZgiFEZCSQ8VRkWFD0fIKOwfxgZCb0sBrAz9dXEb4LxvQ
	TLB0MpDiCFE63PC/Df/WIKWBctxvzNM=
X-Google-Smtp-Source: ABdhPJz1Rfs7uU1+aRUA3Nj7Mijwp2I2I6Hx3L+G+bdFHtuu1Wj85wJZBKoETBhbF3J6GKPYanUQQw==
X-Received: by 2002:aa7:d513:: with SMTP id y19mr6287666edq.9.1619793865431;
        Fri, 30 Apr 2021 07:44:25 -0700 (PDT)
Received: from agape ([109.52.244.36])
        by smtp.gmail.com with ESMTPSA id w1sm1487670edt.89.2021.04.30.07.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:44:25 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/43] staging: rtl8723bs: remove ODM_RT_TRACE* unused macro defs
Date: Fri, 30 Apr 2021 16:43:37 +0200
Message-Id: <c3e116d07fadbba86e61eafe77dd5f3faae66c26.1619793405.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619793405.git.fabioaiuto83@gmail.com>
References: <cover.1619793405.git.fabioaiuto83@gmail.com>
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

