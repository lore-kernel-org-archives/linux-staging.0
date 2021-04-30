Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65622F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:44:49 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id gx5so11748669ejb.11
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 00:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HuRDse6cwaQ2xwrTLwG7a4zXuTLnjB8VHStZClnoZTQ=;
        b=cJn8v7kdVGCUzTJ4D6WpbaBz+uN8JYnB/Cj219Amr7XcKpgHTNcFtBncHLs+AijoLm
         s8aMX30SeG1pmTO9TLvSuesYIQBCf4v/lacIQvgbPRShiQynUf+fcqLK839CgPAzlP3e
         Ewu7rwqToOT0mr6yIwuCcrgD5Dr8ndVQotURWzsisgQG5oKFJbp3bDtsS6OQYmOc/uaH
         LTfcfI2haoA0YsjXNXeGAweaF+zR5hCjyJ3dzaAVQBeaERMtHoxX5/7K35vEWDq0hdM5
         ZaBAD7FOto7RihC7XY2e6yZXyyj8EiSBv+mZh5/fdrwMgLoOzaO21Cg8QQnb+BigApIH
         4nxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HuRDse6cwaQ2xwrTLwG7a4zXuTLnjB8VHStZClnoZTQ=;
        b=HsM3shpQ5D3Pxdgt2yVA4kFuFkTlX10jPfC2p/ltOMctU/K8udqENujaw6yHC2p3QQ
         ziyQuqMFbCYnBYYQF0EVj0edw11fsTckLF2vsk+H3WG8gwhKohC6xZSZgG+EIrW1iR+6
         okp9mltm1m4hHfeh7jwfe1NA+c+VPzTrkAeBxwY69VeMlKVMBQMIpiwFubRgMm9AtVMg
         7MvNz3FxutnggIavnbz+CTzuFjRnLelYzgg9OobOFTumgXMV+xhwSGWwjWe0iedEAdpp
         AO+V3GPnz0DiiVXJbJREZ1vBbb3HpRrl1jR7aREHj307+yAnnax0clmxFW+TqbxBWOCU
         Q6mw==
X-Gm-Message-State: AOAM532cHW9oiJTcDa8DUmFxUWvIEczrv2gYi5AEHrBNEQEV6TyKNKF7
	zlBZBlrioEvvMcCTmoM4oUUGVfsF+WRDVA==
X-Google-Smtp-Source: ABdhPJxfjVTyddW7ze4xAH4ra8e5UaekqloXafHmT+wSOYrkPJ+UhG+bYB012NhwNOb4tubVlS7yKQ==
X-Received: by 2002:a17:906:8390:: with SMTP id p16mr2728409ejx.430.1619768688311;
        Fri, 30 Apr 2021 00:44:48 -0700 (PDT)
Received: from agape ([5.171.81.86])
        by smtp.gmail.com with ESMTPSA id v19sm1416152ejy.78.2021.04.30.00.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 00:44:48 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 26/43] staging: rtl8723bs: remove BTC_PRINT_DATA definitions
Date: Fri, 30 Apr 2021 09:43:44 +0200
Message-Id: <8420804720d6b5711b75265bc65cdec97742c3ec.1619768150.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619768150.git.fabioaiuto83@gmail.com>
References: <cover.1619768150.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused BTC_PRINT_DATA definitions.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h b/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
index 00705305305b..36636ad62aac 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
+++ b/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
@@ -114,25 +114,8 @@ extern u32 		GLBtcDbgType[];
 
 /*  The following is for dbgview print */
 #if DBG
-#define BTC_PRINT_DATA(dbgtype, dbgflag, _TitleString, _HexData, _HexDataLen)\
-{\
-	if (GLBtcDbgType[dbgtype] & dbgflag) {\
-		int __i;\
-		u8 *ptr = (u8 *)_HexData;\
-		DbgPrint(_TitleString);\
-		for (__i = 0; __i < (int)_HexDataLen; __i++) {\
-			DbgPrint("%02X%s", ptr[__i], (((__i + 1) % 4) == 0) ? "  " : " ");\
-			if (((__i + 1) % 16) == 0)\
-				DbgPrint("\n");\
-		} \
-		DbgPrint("\n");\
-	} \
-}
-
 #else
 #define BTC_PRINT_F(dbgtype, dbgflag, printstr)		 no_printk printstr
-#define BTC_PRINT_DATA(dbgtype, dbgflag, _TitleString, _HexData, _HexDataLen) \
-			no_printk("%s %p %zu", _TitleString, _HexData, _HexDataLen)
 #endif
 
 struct btc_board_info {
-- 
2.20.1

