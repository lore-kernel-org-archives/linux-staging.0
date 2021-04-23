Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF02F70
	for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 14:59:54 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id y204so24802249wmg.2
        for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 07:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DSLHJhjopzWcP47W8szCHSpkYXOdx6ZRmSWKH8NfH8Q=;
        b=P/4SuNpHsZtkzBkhjsGruXATGeJnp88z6zBpYdr6+hAX0cWkz0b0b/eiLL+OOJEYcA
         5sJHcdiB8KXaHDhOty9DgPvRVwzPSo5b5eefBWEvo3cBzDH0tZp50lyKqmKTq5TzzU3K
         BzNAAAOEoKHq/oIjhhRFrwhA0Irsj+zq266XkOUMvGmY1XNu7LPl/6jjsnnZCLsgZoWg
         YQNadi9u5YuJekZgZnq8q9wjbrbT5YL/ssPyEwUtSvWO6L2T9emM4pjE+q4RzKJPO4NM
         Va5cBCfuRYEZ7VNUj+nHGbYxNqpJdEi+Cnfkr63j8ny8CmwvMS+F7J4tURwQBxK9IXs2
         ggNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DSLHJhjopzWcP47W8szCHSpkYXOdx6ZRmSWKH8NfH8Q=;
        b=ep2zLP17aYF+JKlz3qwIgngILCsm7EVd10TfS4RWDDAfnc0jawegTbAtcrz0T0o9xG
         FCJ9L6fl7D/nTvduZYC7N3c+/bs3scyMlpMfFplFOZ8p1b12WegWHpTI9FsZUMrK1mfY
         cTep22u81crTHlRS74Y1NKA4CHVAg9VKupWXDMDlIekg5uONtowPnHHJDF5QequM3Vxy
         F5DFAMdnSw0aFAs00o3lzHqwyHZDEfCFHo0qPqENJUBzcFcTfFllXjpJEDpEUirzrvD3
         3wlnLzS4h2Rl/bKSh+4q7mWHkO4w3JMcXll3qwzFr10ApG/wxJ3mZ1wTtqo3rGreXOei
         +czg==
X-Gm-Message-State: AOAM5321mquUUchkE/Ie+TYaSNShRTEvjuPPpvM0SHLbR95z+ijgwvO5
	REuvT3iLkiMdZMF7pyp6veY=
X-Google-Smtp-Source: ABdhPJyOZza0PkYCghAHvjGwJTe0pNCXkAk+ZgtDvDd+G2iEnbmHl5p77ZlgMIDm3bDNcTQ3AkUP8g==
X-Received: by 2002:a05:600c:20d:: with SMTP id 13mr4717857wmi.29.1619189993474;
        Fri, 23 Apr 2021 07:59:53 -0700 (PDT)
Received: from agape ([5.171.72.99])
        by smtp.gmail.com with ESMTPSA id z18sm11341658wrr.9.2021.04.23.07.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 07:59:53 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 43/49] staging: rtl8723bs: remove unused macros tied to _RTL8712_CMD_C_ definition
Date: Fri, 23 Apr 2021 16:58:34 +0200
Message-Id: <17f32db57ee14170c53df113370f185d841f00c9.1619189489.git.fabioaiuto83@gmail.com>
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
_RTL8712_CMD_C_ definition.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_debug.h | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index 550cff9b1147..1a52200e525c 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -7,7 +7,6 @@
 #ifndef __RTW_DEBUG_H__
 #define __RTW_DEBUG_H__
 
-#define _module_rtl8712_cmd_c_		BIT(26)
 /* define _module_efuse_			BIT(27) */
 #define	_module_rtl8192c_xmit_c_ BIT(28)
 #define _module_hal_xmit_c_	BIT(28)
@@ -17,9 +16,7 @@
 
 #undef _MODULE_DEFINE_
 
-#if defined _RTL8712_CMD_C_
-	#define	_MODULE_DEFINE_	_module_rtl8712_cmd_c_
-#elif defined _RTL8192C_XMIT_C_
+#if defined _RTL8192C_XMIT_C_
 	#define	_MODULE_DEFINE_	1
 #elif defined _RTL8723AS_XMIT_C_
 	#define	_MODULE_DEFINE_	1
-- 
2.20.1

