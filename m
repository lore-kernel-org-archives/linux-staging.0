Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FED571
	for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 09:03:57 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id l189-20020a1cbbc60000b0290140319ad207so5963wmf.2
        for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 02:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W/TJrGDj05Z5uJLXQBzCdRgNPqtzRz59d+0oYJlq47g=;
        b=WyKQ/elQXjGPgyqgPW5jZuS4l9bgmDHu0kpIEfZGNyOaK6azDr57ES2esfCGmSe6M/
         iO0P/K6wWcz9BVkV1U0Dt045hKlCmrUI2E/k/G/fZpiIwn1GLZ+Oz7viI7sQhznTnlSP
         fei+xWVz6vCBhrxwipRUHoQwBXHiCARqdxYODnPx18jEKJfv+ECU9VFxaEXCHsjq6j3n
         nBWr8Suyiuwbnpmpk3/A5njkSJnwzz1hTZCBbVJrdC3IotiUPvku1lRBqzzSlx0ULRRv
         A0U6tQQ8vGm6KtTif9ayC6BKaKqspADe5UK5Gat3o17rzMx7y6o4iiU1drTXlfKIs6Te
         KNRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W/TJrGDj05Z5uJLXQBzCdRgNPqtzRz59d+0oYJlq47g=;
        b=fNv1hSGwIdKBkXoC7BbGIWT98EIgCccjqnvylcUalIUAGaU/ts//MZrxlXo0y1FQdn
         TUArMsLGc/zkyAHVQFUhecsnu8pQIpenyi+bdCHZ/nSdA3zyDIVD4O08aGyyu+pgn69G
         hY3V7x0e4hS2DPh+05TFZkUty/6lRdxHnA7D9AKn7CAnK3gUQY+hQavMPAfJ1G+yhyZa
         vn/tcyZULrL6eTt5evQAT1Y/IRLDYAd5dCGseaK17PbUhvJz1lfBqx1IdpXwJVXyIYeK
         ZQRRpxbpkKBHcIhJbHdgbHRqp0RHxX+uLAM6Nyqbh0at/JNLC3+VFWMogX5boHmRNmwm
         MPyw==
X-Gm-Message-State: AOAM533OGla36+kxzbufyudy1XBMewRBfFuvFF7m/odem/cehecuEBVa
	/TPQvPHgsYw/H6RU7mVOnyQZYbyhsg7lsg==
X-Google-Smtp-Source: ABdhPJxdOi8DVozRx/En8m8adE3yM9HeDzGwAHRv89n/l3GZQINsgOQQ2TlgW2xvcmf+lJIZ9ZruTQ==
X-Received: by 2002:a1c:2041:: with SMTP id g62mr6123060wmg.145.1619255036082;
        Sat, 24 Apr 2021 02:03:56 -0700 (PDT)
Received: from agape ([5.171.80.252])
        by smtp.gmail.com with ESMTPSA id q20sm39471477wmq.2.2021.04.24.02.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 02:03:55 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 48/50] staging: rtl8723bs: remove unsed debug macros tied to no particular code debug
Date: Sat, 24 Apr 2021 11:02:31 +0200
Message-Id: <a16431ce89e313029c09381f78bb0f58c23fd7e2.1619254603.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619254603.git.fabioaiuto83@gmail.com>
References: <cover.1619254603.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused debug macros tied to no particular code debug

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_debug.h | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index 6b657190b124..c9f53c08efbb 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -11,11 +11,7 @@
 
 #undef _MODULE_DEFINE_
 
-#if defined _RTL8192C_XMIT_C_
-	#define	_MODULE_DEFINE_	1
-#elif defined _RTL8723AS_XMIT_C_
-	#define	_MODULE_DEFINE_	1
-#elif defined _RTL8712_RECV_C_
+#if defined _RTL8712_RECV_C_
 	#define	_MODULE_DEFINE_	_module_rtl8712_recv_c_
 #elif defined _RTL8192CU_RECV_C_
 	#define	_MODULE_DEFINE_	_module_rtl8712_recv_c_
-- 
2.20.1

