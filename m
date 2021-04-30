Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F992F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 14:57:49 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id h10so82959882edt.13
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=B/6eqAh69XdAy4D/6jUl8yPTLxQZjwsVtZ88PaKHFNA=;
        b=jkwe0a9qQTg7k85Rlf+D2O/4MhuWnmhToVspBzxeJb09vmXa/5QQ68q8nI/OwhygtJ
         Nh2diNlPv/WjMndnyryJtoGQdZg8BFLrlwYKZpNlI2Imy6tYbezjJabBIfA97EfhZIoe
         IqNGgq0pL3l3D2qvGS/yWowEHEacivQ96EGtej8N28OBi/93MTtqPudBAcYo15SqLlyV
         JbO8rdjB2hNQB7XnmyUsWeKjOh1RDsPr4G6rt//8ZVWaQ4kB9B2cJ/t3orbxoRFSX+ms
         F5d2zv5IZAtyWZxSJMiAoWm2bv2MNJChj1OQoOTIz67K48y6l31z9SBQUHDTClFoG2VE
         OOcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B/6eqAh69XdAy4D/6jUl8yPTLxQZjwsVtZ88PaKHFNA=;
        b=swPubYc4604H/dbXYf6vPkNurxOhSsHOKTbsmejRNx22Ma71lyYAZL0JfV9Ly569Fp
         ZWPQLTuF5nYO72MH8+VsIzdW+jcNmwTK41qu/2jCfyEK4jo/X/mSyvElDYX7xxml4mPn
         wAP9uHQH1fDd0Uye/kzKrAkyt3566KCWXKCLeK7EWKbOEHN7bOmuU8lXOo+/MExD1goV
         B3mDWzYETuqZ3qDf7ZwsnXCTASqK1oQCnvwjelBZYRIVI084/kT3VyafZaxfUy8FnvMd
         z+2ab+qX+eMaIoOX3lrax8A2oIKtyKQ1Jh8FWBIbt0oGJOW067xwi6g/SfGMwgA7kd5J
         HC8g==
X-Gm-Message-State: AOAM5323hw1R4E50vAdKkvoV9fm1F7qr0yHvnC9cNfs89N6gc31vjwMG
	vJHykJuuCoyKBO+76sp7IXitYElH8ic=
X-Google-Smtp-Source: ABdhPJz9oARWD4kOpHtbyNBKJLisXjlNtoSQJ9KcxHi7TQvw09yg5wj0tDI2ukwjAkglGuDo3/KsHQ==
X-Received: by 2002:a05:6402:1013:: with SMTP id c19mr6491946edu.213.1619794668608;
        Fri, 30 Apr 2021 07:57:48 -0700 (PDT)
Received: from agape ([109.52.244.36])
        by smtp.gmail.com with ESMTPSA id z4sm2112850ejf.23.2021.04.30.07.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:57:48 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 25/43] staging: rtl8723bs: remove BTC_PRINT_ADDR macro definitions
Date: Fri, 30 Apr 2021 16:56:47 +0200
Message-Id: <31af3e56cfd52f2797499d3beb38741bddaff65d.1619794331.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619794331.git.fabioaiuto83@gmail.com>
References: <cover.1619794331.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused BTC_PRINT_ADDR macro definitions.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h b/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
index ad19ffc2de57..00705305305b 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
+++ b/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
@@ -114,19 +114,6 @@ extern u32 		GLBtcDbgType[];
 
 /*  The following is for dbgview print */
 #if DBG
-#define BTC_PRINT_ADDR(dbgtype, dbgflag, printstr, _Ptr)\
-{\
-	if (GLBtcDbgType[dbgtype] & dbgflag) {\
-		int __i;\
-		u8 *ptr = (u8 *)_Ptr;\
-		DbgPrint printstr;\
-		DbgPrint(" ");\
-		for (__i = 0; __i < 6; __i++)\
-			DbgPrint("%02X%s", ptr[__i], (__i == 5) ? "" : "-");\
-		DbgPrint("\n");\
-	} \
-}
-
 #define BTC_PRINT_DATA(dbgtype, dbgflag, _TitleString, _HexData, _HexDataLen)\
 {\
 	if (GLBtcDbgType[dbgtype] & dbgflag) {\
@@ -144,7 +131,6 @@ extern u32 		GLBtcDbgType[];
 
 #else
 #define BTC_PRINT_F(dbgtype, dbgflag, printstr)		 no_printk printstr
-#define BTC_PRINT_ADDR(dbgtype, dbgflag, printstr, _Ptr) no_printk printstr
 #define BTC_PRINT_DATA(dbgtype, dbgflag, _TitleString, _HexData, _HexDataLen) \
 			no_printk("%s %p %zu", _TitleString, _HexData, _HexDataLen)
 #endif
-- 
2.20.1

