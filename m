Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9871271
	for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 09:02:43 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id a4so50701908wrr.2
        for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 02:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DAeg4inHkDxK0M8FI/mGa+6PBLw6yGrM2ERnE7fCtjI=;
        b=FJ0LmHVp61HQB1frczRqCYs8dvGxgUeD1hHbuvptty/aH0ql8qhBg8784TWDGdIN0i
         XIXYXiOFqNEjF95GM99G1MkxTg9+0AGKjlZwEdGaq1hgXOia2M5PsTaJEKPkoAeO0ccE
         +YzBPim/dEWkECBBKq08mr6mXspvdkYZD4/ZumZrJRsX9DZCCFm1FEbQVAru+72O2cg/
         PLT7U8wwIri1E6/qlDoduq1a9OkDEnOa9HALWf3K6MCEbGI0Ak6XCc8oJpVXsIKG/ap6
         uIvnYXf+OH3vllbt6kHk96QrZtwiYfOdEXWL6H3lSICzmS/KiXzJPGCwQL2cywEwKG+m
         dFwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DAeg4inHkDxK0M8FI/mGa+6PBLw6yGrM2ERnE7fCtjI=;
        b=rFsSKzae+2DixOZjxfe1B9FF4u9RThSURpyXSALjjtWi7VvGFn90npakEFmawKAjhX
         Xx4cNapTpjBvY0Q/AVuChJ1oetTAWjxjuA+4tvl+VJ8rPaSx/JqOc1JNbinJt8xUE4vs
         JWJXsEZRkxIya3B0FyqgbaydtiRUckTzd3o0YpLvuD/uGLGjbtdmt4YJdsZNafdBE5hj
         Hrp1rcOtU6+oCu9fl4aZ+YiadSkWBr3Eos8x4m5s6LorHw+UBvh3KsCY4/UjD5ceHAUC
         KOok3a5ebImpPhcGfMGBV1Iapi1o9w06wAHQm1OZ+VGc7ZfbiBq38o36vCamYj1k6fHk
         Z53Q==
X-Gm-Message-State: AOAM5301zOJfGTRMp38XehdZ38rciA7x/kN8d47ZYwMDPPf1e9GbDUtx
	N4/PVtHvG6+8HrZF+BEj4Ps=
X-Google-Smtp-Source: ABdhPJwKoOp1mrEhDd56ZWIWP0r5t+qVFKHzcOOxf//UTIvz8e8gebk/0Oe+gg+2TyCrL8FglIrWBQ==
X-Received: by 2002:a5d:5091:: with SMTP id a17mr9780083wrt.60.1619254962245;
        Sat, 24 Apr 2021 02:02:42 -0700 (PDT)
Received: from agape ([5.171.80.252])
        by smtp.gmail.com with ESMTPSA id i9sm12674061wmg.2.2021.04.24.02.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 02:02:42 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/50] staging: rtl8723bs: remove DBG_871X_SEL macro declaration
Date: Sat, 24 Apr 2021 11:01:47 +0200
Message-Id: <1a0949adfc352d2560e9a68d340df386d94a79e8.1619254603.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619254603.git.fabioaiuto83@gmail.com>
References: <cover.1619254603.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove DBG_871X_SEL macro declaration.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_debug.h | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index ed75db1b16f8..fbae0d3b168c 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -158,15 +158,6 @@
 
 #define RTW_DBGDUMP NULL /* 'stream' for _dbgdump */
 
-/* dump message to selected 'stream' */
-#define DBG_871X_SEL(sel, fmt, arg...)					\
-	do {								\
-		if (sel == RTW_DBGDUMP)					\
-			_DBG_871X_LEVEL(_drv_always_, fmt, ##arg);	\
-		else							\
-			seq_printf(sel, fmt, ##arg);			\
-	} while (0)
-
 #endif /* defined(_dbgdump) */
 
 void mac_reg_dump(void *sel, struct adapter *adapter);
-- 
2.20.1

