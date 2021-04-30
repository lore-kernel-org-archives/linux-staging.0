Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F44E2F9C
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 14:44:52 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id t4so22343439ejo.0
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z2J3mDg2zWp/DiXrFZERoJKoUUydS2LszSVYaoRZjCo=;
        b=SofdKNmG4M4wWj56waA5VPE51JKS2z6vGXr7RCBdj2Jqz9sah/4l8wn875Q2jNDuuS
         Wmh386IfakectVnnxKFiRLOmrvVKiHE3E6jxuMpmH6v1M1Q/QTfYdRxcviI8USsxMNjx
         nU1Nyfvxq15+O+d9rd6a+eX2znYNCQcU3KSvrEatsSUx1j5R3jnjLLqmRqo3QZrilc5z
         jcPjmniQ61BZe6qd3c9DJ7JdKMilA7SvXoMr8cCl1Gvhc3va9Xjd4mepY3RmQlZYld6v
         /PGrgbS7x5FpfnR0vYQNrDGL3kPmz7xx1tVoFVclRl5bEK7HH9rGLdsSzewrxHM8IWpd
         XNuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z2J3mDg2zWp/DiXrFZERoJKoUUydS2LszSVYaoRZjCo=;
        b=EMa4U+Wdmej8z3h1/BFokSZiVJWGx1fN/ErfJy2DCK7+Rc2UjsNEj6Zvdgrtt4Qy2/
         ETcDX0W3aW2gwnnHs25Q2g5kYo1DIBvLPcPaWv8C2Z2Pkj501a4SiojgFnzwYL/tk6nk
         7I1XYcMVq02GQJq+lRTeJ8PjfmiSbZ+7piZ8jGbmRzoVUH9Cjjm8Eq0ESml9oO2BKYfO
         US7W68fQHmrNV48g52QGo1AkrvEVeR/J8WxRCI/gnWsHfn4mggTTZAzYyWtX3RvpXwOF
         iDNNjbmXmIPLcJW7bMN/d7bLC62sd+3eU4OQ9aHShzGDOHGZJ838zNHkJWnVY/h24H7+
         3nlQ==
X-Gm-Message-State: AOAM531pREdDSUJLgzEvsiASlgOIjr8HGe/Zdgfm0rbLOBHA9/bYxiPr
	C8+1H471e0SsybJgrgRPTL0=
X-Google-Smtp-Source: ABdhPJx08SYq7K99CdroG6JOaaUFW1jzWU0NvOjD1iWV8A+kqwGhK5NliGnXFJn9FWOpvsvnH51a6A==
X-Received: by 2002:a17:906:6544:: with SMTP id u4mr4750351ejn.455.1619793890726;
        Fri, 30 Apr 2021 07:44:50 -0700 (PDT)
Received: from agape ([109.52.244.36])
        by smtp.gmail.com with ESMTPSA id g4sm1442761edq.0.2021.04.30.07.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:44:50 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 24/43] staging: rtl8723bs: remove BTC_PRINT macro definitions
Date: Fri, 30 Apr 2021 16:43:54 +0200
Message-Id: <7bb4e54fcf8a17d71d1e8361d62a97c9cd9ebe35.1619793406.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619793405.git.fabioaiuto83@gmail.com>
References: <cover.1619793405.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused BTC_PRINT macro definitions.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h b/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
index 7b2d94a33d9c..ad19ffc2de57 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
+++ b/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
@@ -114,12 +114,6 @@ extern u32 		GLBtcDbgType[];
 
 /*  The following is for dbgview print */
 #if DBG
-#define BTC_PRINT(dbgtype, dbgflag, printstr)\
-{\
-	if (GLBtcDbgType[dbgtype] & dbgflag)\
-		DbgPrint printstr;\
-}
-
 #define BTC_PRINT_ADDR(dbgtype, dbgflag, printstr, _Ptr)\
 {\
 	if (GLBtcDbgType[dbgtype] & dbgflag) {\
@@ -149,7 +143,6 @@ extern u32 		GLBtcDbgType[];
 }
 
 #else
-#define BTC_PRINT(dbgtype, dbgflag, printstr)		 no_printk printstr
 #define BTC_PRINT_F(dbgtype, dbgflag, printstr)		 no_printk printstr
 #define BTC_PRINT_ADDR(dbgtype, dbgflag, printstr, _Ptr) no_printk printstr
 #define BTC_PRINT_DATA(dbgtype, dbgflag, _TitleString, _HexData, _HexDataLen) \
-- 
2.20.1

