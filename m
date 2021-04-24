Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB65071
	for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 09:03:16 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id e7so41702864wrs.11
        for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 02:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xT7xLGR/u98oUeFxtP8FIkbPXzcjRalBgVrGk8h35HY=;
        b=d9MevJG2/aebTxNaGiOyJJK7rFBaJLuONbjKrAYL1Skc5WEHZsjoZITH7VHA7UIhfJ
         XwQkAbeARR9v7Ckbszujxb8VMoKaNfvr9Jir8IA6Dvu5MAHvFSdYsXNCkgfdprphfe6H
         WhloNFzR60L0Fc0NmnUmRkBRwlGGkr20g6rC00tLzbWoc6TP1uRLI3I4NyUrK36jApQA
         Jl8Dva5hPxlC/aahgdgDfDHhy+63w90zqTby/QGoeXejf8+nXF2nZpW/rD0Du1u9LEJC
         0rqpRoUviE5DK2TAuC/NANFY33ulxY/aEMLrE7OisvX7syetPq5aCrsLEhw+DIBTcj9V
         J2hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xT7xLGR/u98oUeFxtP8FIkbPXzcjRalBgVrGk8h35HY=;
        b=P5aT/hlvQ6dUqVMae05fkM0x2m1OuTwc8GVV6cHL23I8sZEmIah8mSyW7jorY51rOh
         Tbb6/66jeUxSOfHizk1pK0JOqVYCISTvl3k/H9dNEqsBFcujRxrO4Sfx1xYz6bodWhOP
         owln8LPAhJZVdI+Yhqpo9nCk/GYHbPmJbE8LqZHEzGAmR1M4ZPEEVplNSilZjk/gZ/jE
         M3QZ+3m894Wf8Bl8bNyj5umXTd8aLjU/blxKXv33xRe2H0PVfXp8J9P028yGfAYcw9pS
         JPQC8lcfB4gfz/Fl+e4QpNYEDhvOllod8gBZUH4TZxY/JHHj2TUPPhGsx+EuQZ1tkkUx
         hSmA==
X-Gm-Message-State: AOAM531pnsJBSZrLKeHmXMghEyUT8tbpxavKQSB8EZDaGfbRTNmJG6fH
	s24UXi41YEjPCVkxJq19Q/Y=
X-Google-Smtp-Source: ABdhPJxR/z5NN7Kl8/Afei+r6SQXt+heg1jRd4xQ1a0QKGbNJk9bpZsifcdTPWcrphTeV0w0Nv53hw==
X-Received: by 2002:a5d:67c8:: with SMTP id n8mr10096516wrw.200.1619254995642;
        Sat, 24 Apr 2021 02:03:15 -0700 (PDT)
Received: from agape ([5.171.80.252])
        by smtp.gmail.com with ESMTPSA id f6sm10002406wmf.28.2021.04.24.02.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 02:03:15 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 24/50] staging: rtl8723bs: remove obsolete debug macro definitions
Date: Sat, 24 Apr 2021 11:02:07 +0200
Message-Id: <5bc9e69d8ba03d2bd8031bcff73b22aeed5c0912.1619254603.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619254603.git.fabioaiuto83@gmail.com>
References: <cover.1619254603.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove debug macro definition untied to any tracing component.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_debug.h | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index bb56d38e6b7a..6e6dea4779d9 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -7,7 +7,6 @@
 #ifndef __RTW_DEBUG_H__
 #define __RTW_DEBUG_H__
 
-#define _module_cmd_osdep_c_		BIT(8)
 #define _module_rtl871x_io_c_				BIT(9)
 #define _module_io_osdep_c_		BIT(10)
 #define _module_os_intfs_c_			BIT(11)
@@ -35,9 +34,7 @@
 
 #undef _MODULE_DEFINE_
 
-#if defined _CMD_OSDEP_C_
-	#define _MODULE_DEFINE_	_module_cmd_osdep_c_
-#elif defined _RTW_IO_C_
+#if defined _RTW_IO_C_
 	#define _MODULE_DEFINE_	_module_rtl871x_io_c_
 #elif defined _IO_OSDEP_C_
 	#define _MODULE_DEFINE_	_module_io_osdep_c_
-- 
2.20.1

