Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBD270
	for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 14:59:53 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id w7-20020a1cdf070000b0290125f388fb34so1425050wmg.0
        for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 07:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qN9q3YqqahsKFdZjoFQK7gigKnmNtZ3S2NITUyAA5T8=;
        b=Z6BDBr6dS5da9xwSSivzLrMPYrLrS5q2H3C+QkjR7jmqzIjTq4OWiY53IdLbjoko/m
         neBEQOasHg4a2aMnOY93NZYd94KNhf5PcL+pfVzG490gqkhFQ9xAah0oOE0mYntN3XQu
         7362UgO0IYisD02sQReW/P8nfV/oX4kbHbM9049XM7Lt7cHm1uXQZ404HQ3c9ppwEsOb
         q4qskTzwZJqp+6vwxMZ5vHZH9jElZNmAAPP0BpZo0l0CyEBSF6DLwQMaR3gdoO7/k3Jp
         j738DQr3S+mOz29fZP6A3CROffSx3Goc4eZIjdWA9kvJeiPn3ppZLyucoq/ssdG1q3lR
         inPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qN9q3YqqahsKFdZjoFQK7gigKnmNtZ3S2NITUyAA5T8=;
        b=i3G0GMm1oG51rei77Ow9wtNdUYsM8wghC6mnmgjIR9AjX2IGA0AnqLkb+9QiKe5RsB
         FLzxwNE8D4V6sVm8l2oP/l5wFSMnwcuG3nUqFb14VHrSPPn1qLebnH2y4+I4IFPElGGh
         LtrN6CQUIE+t1Dr0s9KRX540RsprBQLJQULFtM5nyxdgBDVFng8n0T7yKFjTePzflwKn
         ptNtJc9lmjCJJnFGZwnCy0epVUrmnT9uyn3PRO0hFDHVB6h6m3pzcY8VdQQGOOIT8lNc
         W3uaYufNzK7yBC9j4OHUqIfudbCcpsxegJSed6JtLbOp5xbuZVoE9/op/Ba1zh1bmcw0
         2SQg==
X-Gm-Message-State: AOAM532zvJJJ22LN8soZzr8G7WV9DCQUzKZtK9D7XnBCt51Fynp/1boz
	PtMURLYvRoQuxLtBN3Y8R7k=
X-Google-Smtp-Source: ABdhPJxnNN6SxX1zS8aS0ZDxmiYxqGewL1l6jaZ5ChjtD5AnemZQux5nlo2dV9l75ovQBmbcYPjcTQ==
X-Received: by 2002:a1c:2c85:: with SMTP id s127mr4637079wms.83.1619189991951;
        Fri, 23 Apr 2021 07:59:51 -0700 (PDT)
Received: from agape ([5.171.72.99])
        by smtp.gmail.com with ESMTPSA id u3sm8145835wmg.48.2021.04.23.07.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 07:59:51 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 42/49] staging: rtl8723bs: remove unused macros tied to _RTL871X_IOCTL_LINUX_C definition
Date: Fri, 23 Apr 2021 16:58:33 +0200
Message-Id: <43868b841442c9e49a9bc77ed7a0e72805b976bb.1619189489.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619189489.git.fabioaiuto83@gmail.com>
References: <cover.1619189489.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused macros tied to
_RTL871X_IOCTL_LINUX_C_ definition.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_debug.h | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index a6c2956133ed..550cff9b1147 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -7,7 +7,6 @@
 #ifndef __RTW_DEBUG_H__
 #define __RTW_DEBUG_H__
 
-#define _module_rtl871x_ioctl_os_c		BIT(25)
 #define _module_rtl8712_cmd_c_		BIT(26)
 /* define _module_efuse_			BIT(27) */
 #define	_module_rtl8192c_xmit_c_ BIT(28)
@@ -18,9 +17,7 @@
 
 #undef _MODULE_DEFINE_
 
-#if defined _RTL871X_IOCTL_LINUX_C_
-	#define	_MODULE_DEFINE_	_module_rtl871x_ioctl_os_c
-#elif defined _RTL8712_CMD_C_
+#if defined _RTL8712_CMD_C_
 	#define	_MODULE_DEFINE_	_module_rtl8712_cmd_c_
 #elif defined _RTL8192C_XMIT_C_
 	#define	_MODULE_DEFINE_	1
-- 
2.20.1

