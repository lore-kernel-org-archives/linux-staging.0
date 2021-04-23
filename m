Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B9F2FA1
	for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 14:59:04 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id n10-20020a05600c4f8ab0290130f0d3cba3so5932939wmq.1
        for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 07:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uebmfgQMAfcpGhNA6iUMcWPD2SCRSOhYjmZfyYN/7+o=;
        b=gUVoNI3QzIrKEoL4wiR3MV+iNT+s6utTeneE6mkLIB/Vioti39Tmslp4E/LQLpoc/7
         Q2svVBD9z3bMi35AP3Eh52loa2vCsL7uiQ93esRApwLmm9N4LukcYenbMJeuVLMHARR5
         ooxtPZnJisZZbBE9A+tcKIX5aQw1BxRwjXqIr8gSX5ci1e4+4Tp7Rxvc+J0RvgKbxwH4
         AewOc4T6VIKH3rG/xlaeiScAWRYSGtUsn+j5VwSfCwCk/93EirP4BqbS44Sv/fAXIAPA
         whVtcLPbifOtj/tggyC7QVtXgO+fWAEA3QJQRYMH5cSms9IKibjf4ZsKWz6cp5eFz9c4
         YtNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uebmfgQMAfcpGhNA6iUMcWPD2SCRSOhYjmZfyYN/7+o=;
        b=ZajiSCQcBqPi6PvQ5aWjkwlRXYSABXLRzxwEDgrTkAf7FEd1yrAxD4LoNRxCxXvZPr
         O6R8cFNyyY9pn9sqMXGsVP7HudQS6w/0M1G419BzZPabu3afdJJp1eBaw9kx7czIVE04
         lyZpkRHFUUV+wGQ8JGFaCKmEbCUgHZsUd94LJEgDBR9ZIJUQKO9KFnIvOwyAeqjxbKWz
         pGo9kdlgmprWs20/U7bJNuQmhDTwUQ9X42NyxJi5PufO4UbV7lboRpRFVh+btFxBWx6R
         D13ni+gtaojbUBbUcI/QgWcETeaJXy/FBmJx6fAM6aEuIRIvqXhVMNHwWB/19hEO6qWd
         7k1w==
X-Gm-Message-State: AOAM531PluvmtstZiKALVIjF6OhtI5C5bbjT0sWFNBBw80UF3c4/AN4V
	qQKmJaCxDmKJTuTAVyI01BU=
X-Google-Smtp-Source: ABdhPJzo7CP8XyNaTXltIiOJrsYsW1E01EHQVSJqOcpCGTEjxBEmQrmXFz+ut6Z8/2oQqrpsub6DEg==
X-Received: by 2002:a1c:f618:: with SMTP id w24mr4680983wmc.93.1619189943167;
        Fri, 23 Apr 2021 07:59:03 -0700 (PDT)
Received: from agape ([5.171.72.99])
        by smtp.gmail.com with ESMTPSA id t206sm8149950wmb.11.2021.04.23.07.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 07:59:02 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 13/49] staging: rtl8723bs: remove debug macros related to core/rtw_xmit.c tracing
Date: Fri, 23 Apr 2021 16:58:04 +0200
Message-Id: <6099079cd0e4d0e56c1b0a3e879824f42376a816.1619189489.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619189489.git.fabioaiuto83@gmail.com>
References: <cover.1619189489.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove debug macros definitions related to core/rtw_xmit.c
obsolete tracing.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c     | 2 --
 drivers/staging/rtl8723bs/include/rtw_debug.h | 5 +----
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index bd3acdd7d75f..03d036bd2ac6 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -4,8 +4,6 @@
  * Copyright(c) 2007 - 2012 Realtek Corporation. All rights reserved.
  *
  ******************************************************************************/
-#define _RTW_XMIT_C_
-
 #include <drv_types.h>
 #include <rtw_debug.h>
 
diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index 8f56d1e7e644..ea4d34678b9c 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -7,7 +7,6 @@
 #ifndef __RTW_DEBUG_H__
 #define __RTW_DEBUG_H__
 
-#define _module_rtl871x_xmit_c_		BIT(0)
 #define _module_xmit_osdep_c_		BIT(1)
 #define _module_rtl871x_recv_c_		BIT(2)
 #define _module_recv_osdep_c_		BIT(3)
@@ -43,9 +42,7 @@
 
 #undef _MODULE_DEFINE_
 
-#if defined _RTW_XMIT_C_
-	#define _MODULE_DEFINE_	_module_rtl871x_xmit_c_
-#elif defined _XMIT_OSDEP_C_
+#if defined _XMIT_OSDEP_C_
 	#define _MODULE_DEFINE_	_module_xmit_osdep_c_
 #elif defined _RTW_RECV_C_
 	#define _MODULE_DEFINE_	_module_rtl871x_recv_c_
-- 
2.20.1

