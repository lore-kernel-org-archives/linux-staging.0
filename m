Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845CC2F9C
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 14:44:53 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id e7so82837634edu.10
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=B/6eqAh69XdAy4D/6jUl8yPTLxQZjwsVtZ88PaKHFNA=;
        b=N35EmrJNUsZwYYKgXtBaGHeKRTkiUlExepJegpP98xvqGp5EABW5j5W615MkDcRax6
         oRsxgOfWiM4CmXxNn5fYDDq7C3j3TohQ5W+OQRKNTTJfi4rC6UTmlZL94aaRaswupuQT
         65O33CKOh7orkv+2CQTeQ3CsbvoLDav2R07tE2/7Mo69WLIxwJxClay/YKlv7F5BDV6P
         8Mf//N6FxghUPvb/uhcH6SX4GFk8Za8RNUn5OJ9m3QiLaGu2ulgnUxIYyhjvGs2b5kie
         iKkWaY6SWeXa4eVKTjB73ILuzEOgAnh+r09gazqE15BR8q/ly6hQFkgyAse/jiJgWdvv
         WANA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B/6eqAh69XdAy4D/6jUl8yPTLxQZjwsVtZ88PaKHFNA=;
        b=bKm2rMEJnnygS8maiYwqZOatcIoS4ejFsw0MxXpJVAAUkZJAjgGuaH2QwyCQDd4Ma8
         QPrF2YgmIxcvXK8YTrmzIxuWztlp5gDH79n68lU7jnudQYb66lfRYJIyoa/quPT6rOw+
         y3VG8xoexIHTqi4cIkoYuaLOHJ6+oVeBQLveLgSyv1bEREnccwZVT6oZRoyJGvHGRkpC
         UxexjnKgEL8A2bJZgrOy0JmWAOnWbEHw8812+KRdd89Wp6MgUNkkypr+eSqGVMsa7Quk
         6tRzxQevPoWEHnn66aufc2dVydfPE/5PamrMk4+cr01YjaHXpdHbLjRLBSe1/a5bOjBz
         Vtuw==
X-Gm-Message-State: AOAM530R8nfHdQid5k0+YJyyzm2C/jMfvOaJ1wziV7kG8k9DVPUnWqQt
	S//C3qxlfKj7UUO+NRR3o5LZ3HVxceQ=
X-Google-Smtp-Source: ABdhPJyLDt8GcL4l0CpVN8FTXBKy9hdMBUfmM8O/yrKBfvP0NhuFPfp8u7pele/L540lx1HDnEsUTw==
X-Received: by 2002:a05:6402:c8:: with SMTP id i8mr6555692edu.57.1619793892179;
        Fri, 30 Apr 2021 07:44:52 -0700 (PDT)
Received: from agape ([109.52.244.36])
        by smtp.gmail.com with ESMTPSA id z22sm1628440edm.57.2021.04.30.07.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:44:51 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 25/43] staging: rtl8723bs: remove BTC_PRINT_ADDR macro definitions
Date: Fri, 30 Apr 2021 16:43:55 +0200
Message-Id: <1d260281e35713a70599618ab15fdebbfe10dda5.1619793406.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619793405.git.fabioaiuto83@gmail.com>
References: <cover.1619793405.git.fabioaiuto83@gmail.com>
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

