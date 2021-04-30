Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85E52F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 14:44:32 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id g14so23241396edy.6
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5KtDzlglqZBamkEg3baS39llf/wufOaHK1MWrZxa8uQ=;
        b=Din4203pEgVpqjQKJGQkaXfTU30nqSKvYezRNXIoPMnpMevN7Vw87VJu9GfJRSJHB1
         7OXoQyZh24fRxvijirNtacRDtxBQOdJGHkx/nBbZXUqdraGYaUlikVPK6LUTP4rDkU4p
         b2lIuhxGjAO4ZXhxM+bClhUrX6pWq4kDNZHX5IbMokSr9kXkto7T4seWdcNrWuDnXcPl
         1D9EjBZin40AjSyzwTet37R4Z1G1HQ0BrRfc+9OgbPJ5YyVzPQXzIpzaEYzISdgzqtTY
         OKCi271mW6G0di3vGY8XIpUND9m47SgGFfeTtCObsYp9pHT/AlJIYtoYEERQoQ+5wlMD
         6eyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5KtDzlglqZBamkEg3baS39llf/wufOaHK1MWrZxa8uQ=;
        b=B90XZAPr8cbDszPDCJzQxk51F00TxBgomWRPuqgEem26izsQE+8LroCQbobkh15dHj
         8WLVm5c0ouf8OP4/YHZteOqQH2Y6n7s8P0a9mMblpiHnCCCgN4m7O5Qm2QvMnE360NzQ
         t2rj6bELr3xFElY9COL+U3Nuyi7TuJYpjWSDnusz16ywwvj90+7fQEYgxT1eKp+0DXCW
         RcL8RFl6Hl2n7bUQ64Y0cCOTCOHB3QSxex+iscWxaSXJSMatmGlL54eFwcr8rbnFEDg8
         q84KYZxtu0n0DN5Fu35uNV8ZsKLJYr8fbjnCxIHkB+ZGKXgTqBu2Hbl69hh7ZLJfUsWO
         7wPw==
X-Gm-Message-State: AOAM531kwLbDsn54ft3dksyoE3tQ88eCPidLqJ5NL9JHEVa0Ceeqx8xd
	dLoFvd5oLPFzyuHsq/FQ4c8=
X-Google-Smtp-Source: ABdhPJxOcVrMm3JvgAQV/iZfdDLo9lSHg+RYcGzEih4tDBOoPFcgoNXhe2P63S9BHCEmhP6sJWgvcQ==
X-Received: by 2002:a05:6402:341:: with SMTP id r1mr6316402edw.113.1619793871368;
        Fri, 30 Apr 2021 07:44:31 -0700 (PDT)
Received: from agape ([109.52.244.36])
        by smtp.gmail.com with ESMTPSA id c19sm1466194edu.20.2021.04.30.07.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:44:31 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 11/43] staging: rtl8723bs: remove unused ODM_PRINT_ADDR macro
Date: Fri, 30 Apr 2021 16:43:41 +0200
Message-Id: <b4ecd3b4481f5ef4a526b7ca62d6389b8d097bd4.1619793405.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619793405.git.fabioaiuto83@gmail.com>
References: <cover.1619793405.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused ODM_PRINT_ADDR macro definitions.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_debug.h | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_debug.h b/drivers/staging/rtl8723bs/hal/odm_debug.h
index b4fc247242fe..58de4d16335e 100644
--- a/drivers/staging/rtl8723bs/hal/odm_debug.h
+++ b/drivers/staging/rtl8723bs/hal/odm_debug.h
@@ -97,29 +97,10 @@
 
 #if DBG
 #define ODM_dbg_trace(str) { DbgPrint("%s:%s\n", __func__, str); }
-
-#define ODM_PRINT_ADDR(pDM_Odm, comp, level, title_str, ptr)\
-	do {\
-		if (\
-			(comp & pDM_Odm->DebugComponents) &&\
-			(level <= pDM_Odm->DebugLevel)\
-		) {\
-			int __i;\
-			u8 *__ptr = (u8 *)ptr;\
-			DbgPrint("[ODM] ");\
-			DbgPrint(title_str);\
-			DbgPrint(" ");\
-			for (__i = 0; __i < 6; __i++)\
-				DbgPrint("%02X%s", __ptr[__i], (__i == 5) ? "" : "-");\
-			DbgPrint("\n");\
-		} \
-	} while (0)
 #else
 #define ODM_dbg_enter()					do {} while (0)
 #define ODM_dbg_exit()					do {} while (0)
 #define ODM_dbg_trace(str)				no_printk("%s", str)
-#define ODM_PRINT_ADDR(pDM_Odm, comp, level, title_str, ptr) \
-	no_printk("%s %p", title_str, ptr)
 #endif
 
 void ODM_InitDebugSetting(struct dm_odm_t *pDM_Odm);
-- 
2.20.1

