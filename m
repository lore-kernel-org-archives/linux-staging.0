Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F9E6F
	for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 09:41:27 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id e7so21490921edu.10
        for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 02:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R92z1YtOtroE0DR69RZMhwatu8EFWjP4tLoowms2g08=;
        b=gBZNY4YKRRuvskSqEayIahyoYNLYK8aoMeKElt6WCjc5rTANKUF9847pdb4nKv7Soo
         YzphHEDWJfJ9XQgaQwZqAa94pJSJ11xJmB9EsJLItH7V4NarLMWH9aaY+CBqeu0WnZEN
         kfzlVxjV2p3QNjxR8FYXFKr0BmuxK2JkBIssEgnrVT5nYs/hlhKub4b2eiXIP6i9Q50N
         MekMtYG8YkCc0wmnH+yyQvux6lVxpWzEyyV57QbTo4ZRrn54XLFNaKeoa/M9H3GrTnXO
         LnKFyTKNH4QZRYnjiXtIu9WQtPaMexxj+g9yRLej9YDYF8wcrCD0wueFgJoletXgbqew
         OjMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R92z1YtOtroE0DR69RZMhwatu8EFWjP4tLoowms2g08=;
        b=ldgcHKhlRy1t2stnEdno6ZUQb9yyJqLom9pyKmK0bH1x8uF7qzxtyNeDC9Xxowwu8E
         BdZGj6nG78b9QCNj2EOftZsYMh1d13uKfGxZgImjSK7Dsn+KJKD5xizWmJQA/PswlLWq
         3L6SXtYyHoGqmIy9+fVMyqc8/mUUDgKjqhkd6bND1AQA8GYyk8fCIOANZFCa6947DneT
         TbiRHjx7s1eu4oEI9ph3tRmapeHsKAXVlJ3u4lo3sSkWVnAP5nuReNswmLiVGdL4SkvD
         ifjIhi4kC2P8ru6UgAfCUYH0NEET8qk+0ahzMMs6Kx3Fg7I2d9dG4XLfUhYCyHHuVH1C
         V9Kg==
X-Gm-Message-State: AOAM532932OA5pXJBnTFIUTYZmf24j8YhPUGWDRcY4JEA87VjtwT+QCB
	tI2n2blvP/4SQyCi2ShDI9s=
X-Google-Smtp-Source: ABdhPJw/jeP3mYmws/qzK6LoY4wmoibgF3/xIMSivGZCyAWnXo1cyfmlnKW1L7iFllZxVqYTq5WMzQ==
X-Received: by 2002:a05:6402:14cc:: with SMTP id f12mr2692072edx.19.1617183686047;
        Wed, 31 Mar 2021 02:41:26 -0700 (PDT)
Received: from agape ([5.171.73.44])
        by smtp.gmail.com with ESMTPSA id f9sm1145767edq.43.2021.03.31.02.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 02:41:25 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 40/40] staging: rtl8723bs: remove obsolete debug macro
Date: Wed, 31 Mar 2021 11:40:08 +0200
Message-Id: <bbfc64dfd0da03d38c7b0121e7e04e31bb9ba9eb.1617183374.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617183374.git.fabioaiuto83@gmail.com>
References: <cover.1617183374.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove obsolete debug macro RT_TRACE

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_debug.h | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index 4c0857241922..f539d8e7f89f 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -131,7 +131,6 @@
 	#define	_MODULE_DEFINE_	_module_efuse_
 #endif
 
-#define RT_TRACE(_Comp, _Level, Fmt) do {} while (0)
 #define RT_PRINT_DATA(_Comp, _Level, _TitleString, _HexData, _HexDataLen) do {} while (0)
 
 #define DBG_871X(x, ...) do {} while (0)
@@ -217,22 +216,6 @@
 #endif /* defined(_dbgdump) */
 #endif /* DEBUG */
 
-#ifdef DEBUG_RTL871X
-
-#if	defined(_dbgdump) && defined(_MODULE_DEFINE_)
-
-	#undef RT_TRACE
-	#define RT_TRACE(_Comp, _Level, Fmt)\
-	do {\
-		if ((_Comp & GlobalDebugComponents) && (_Level <= GlobalDebugLevel)) {\
-			_dbgdump("%s [0x%08x,%d]", DRIVER_PREFIX, (unsigned int)_Comp, _Level);\
-			_dbgdump Fmt;\
-		} \
-	} while (0)
-
-#endif /* defined(_dbgdump) && defined(_MODULE_DEFINE_) */
-#endif /* DEBUG_RTL871X */
-
 void dump_drv_version(void *sel);
 void dump_log_level(void *sel);
 
-- 
2.20.1

