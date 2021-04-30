Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68C32F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:44:17 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id j28so17487150edy.9
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 00:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=To5Vs4KwxhQBIQUiXfT+kEa1NbW/RrIHm/UCYNTGQs4=;
        b=MdREbTr7OPdVCn+5up/v1N3oaL9ScsRrcwtAtxHbFKhYl92qDmuJQQSMIpz6gwdiFD
         /fpWJz1RJANSijMaVC4CRuq3QT2Y7ZXSgw5HKCQ3mJll+L4iM3CCeo6KLev5EmnWWh5i
         ER4yW7WxHWc0RX7v2MbAKAdXaQ81JmEL/0cknsNBosEIh0iIfV6baFm3oBSsXkxBEIDV
         JFU+yj8NCVArmsm1s9pnLkGPaCUUKESFUsTzCzBuraT5F/wzD8gwrfOlFzey4mpb+eL2
         BmtEiezRrUlfbwYKWxjcw4mtb4OOJ2iY9pr5LU9ervCxQJWg86t2pfo6oBOfuP1EpT5T
         1NyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=To5Vs4KwxhQBIQUiXfT+kEa1NbW/RrIHm/UCYNTGQs4=;
        b=s2rq7LNJ6JiA39H3GoL0oLl1yEI7NgvgvBGtjzOUVcd0GSps+/SyLYkRqYz+CJhE5V
         PK3jy2E4D0PDXK15SnuhIE/qX79JhsDjlzdOkJAdcsuBmMFXwwTplLRT19BrXxdN6yyM
         4qz4RocI9VRL8Ea8fRqOO+rpvqvmdtW8fjsSgtdoEs+t6elVoVedoxEJmsz/zWFrMAsM
         kw20hmP2kR79eKHt0Zm+Z2LPdJI7GcwLEWBcZlD7pRYsSC8eZdNEYSGfLQh9aLgEMmFu
         YIeykOTVhZMF6aQ0KOHiaZaidy8jKG3fWjZVbITqe8jxMF1+spVejCqx26aOr9qdXb9A
         M3wA==
X-Gm-Message-State: AOAM530gmKPx1DPKl5yVkF/e/l2FSMtH9ADbgtpWMoCbL+j/j145ZKqP
	+GxwZLOnUlMJdVsB9ciJHSg=
X-Google-Smtp-Source: ABdhPJwyLcQf+LrVh/AemCcpVgp30CEQiz13hujARAJfo6ChhFBKu6RGnveri53YL9GIpiivOU9l0w==
X-Received: by 2002:a05:6402:26d3:: with SMTP id x19mr4114763edd.349.1619768656479;
        Fri, 30 Apr 2021 00:44:16 -0700 (PDT)
Received: from agape ([5.171.81.86])
        by smtp.gmail.com with ESMTPSA id p18sm1412702ejb.19.2021.04.30.00.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 00:44:16 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/43] staging: rtl8723bs: remove ODM_RT_TRACE* unused macro defs
Date: Fri, 30 Apr 2021 09:43:25 +0200
Message-Id: <a899c4c389c2355b8867503739e970ac107a98cb.1619768150.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619768150.git.fabioaiuto83@gmail.com>
References: <cover.1619768150.git.fabioaiuto83@gmail.com>
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

