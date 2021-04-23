Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2C32FA1
	for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 14:58:59 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id a4so48724837wrr.2
        for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 07:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Tik2seEPmYbG3/nfRHJhbJrnEhAl8Pv2iXQyiuLU5zQ=;
        b=hYWTE/wPgWF17hJsfe4W3w26PGMabUTFsk/YnWWG+3g/xFX512v3Aow/d8LKa61cAC
         Aci2FNhSpAIDeLggtq17b/vO42ypl2SEswOJbkuY6BnYXTSYK3+cWWuJiDmo3OvWwJGC
         dDN7BgkDQrE0XyXvhHE8yyI3lKVCHztIAVV5XBY7AQe/O7xDqurpU3RgRQnr1m2wBVVM
         NJo9VNfiDWIvlFFXMKS0rQbiYbgc9oF/82fraB6BxBQOxSdY7xHZ/crGPFdK0f6pUy5s
         uSbJzUFQDTYc0v3XmoHs9YBGPr6fcZ1B0paN0il0d+5pI/7/nMOT79Vo5Fs8ZvXSmXLY
         jh2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Tik2seEPmYbG3/nfRHJhbJrnEhAl8Pv2iXQyiuLU5zQ=;
        b=ikXYSV3NuDjeCh0cxpxu3NgJVQ62iXmmg2x1Q8AXka6zuJNjz5P9oDRyrqgH0m0nUP
         FLNwbVHG+bI05wN8iSFIu2VCiu2WjJxfrKOTekMLlQ9Hky1nlW2lVVzC/l1Unbcr5Du9
         Vd3lyjRqgCXpu7MGkNH31A3ob1yKGiRbbP8KILfhayzfYBiCwocY7w39HztwkBF2E/r2
         weFMo/IxkNTTI7EWxMWUJWjpc87DQ7l4PREGO7yqyJT33weUu4yN2354ebbBL0/JnqUk
         BEsPDY6fiO1MkfFRsecgAJqCTYbULbQoh4FXRECWcSNgsGskEPixa2m+mfVLTcNglntW
         YBqg==
X-Gm-Message-State: AOAM533McFhCw4vVMsfzT0qTuJV3I4SS8pcFJjdtgkoviLJhDyQKh9CS
	UgePU27jEhdWIcf2M+g391w=
X-Google-Smtp-Source: ABdhPJwMH2VfpOfV+fBjlbHf9rZ3hqIkkR7sFjRsDzyPasG1/94zP9a2+a+rBN0LjE168Gskoh23NQ==
X-Received: by 2002:adf:fe09:: with SMTP id n9mr5345877wrr.284.1619189938096;
        Fri, 23 Apr 2021 07:58:58 -0700 (PDT)
Received: from agape ([5.171.72.99])
        by smtp.gmail.com with ESMTPSA id u2sm10473213wmm.5.2021.04.23.07.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 07:58:57 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 10/49] staging: rtl8723bs: remove unused debug variables declarations and initialization
Date: Fri, 23 Apr 2021 16:58:01 +0200
Message-Id: <b0877682d86c83f65be4d91386c4e682f5b7aee8.1619189489.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619189489.git.fabioaiuto83@gmail.com>
References: <cover.1619189489.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused debug variables extern declarations
and containing #ifndef block.

remove initialization as well.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_debug.c    | 2 --
 drivers/staging/rtl8723bs/include/rtw_debug.h | 5 -----
 2 files changed, 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_debug.c b/drivers/staging/rtl8723bs/core/rtw_debug.c
index e6e583446626..78130e63078c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_debug.c
+++ b/drivers/staging/rtl8723bs/core/rtw_debug.c
@@ -10,8 +10,6 @@
 #include <rtw_debug.h>
 #include <hal_btcoex.h>
 
-u32 GlobalDebugLevel = _drv_err_;
-
 #include <rtw_version.h>
 
 void mac_reg_dump(struct adapter *adapter)
diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index 2232a1014528..579724e8fc2f 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -131,11 +131,6 @@
 	#define	_MODULE_DEFINE_	_module_efuse_
 #endif
 
-#ifndef _RTL871X_DEBUG_C_
-	extern u32 GlobalDebugLevel;
-	extern u64 GlobalDebugComponents;
-#endif
-
 #define DRIVER_PREFIX "RTL8723BS: "
 
 void mac_reg_dump(struct adapter *adapter);
-- 
2.20.1

