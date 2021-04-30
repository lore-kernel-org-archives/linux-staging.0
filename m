Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D062F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 14:57:48 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id n2so105693131ejy.7
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z2J3mDg2zWp/DiXrFZERoJKoUUydS2LszSVYaoRZjCo=;
        b=ZPB4wZ6lysBCbaEVht0bMDG9fYfJVLr3zWFSFNgq53TxBbUmookiiGKutxaOOaUux5
         IY3M0P8l/sR7EbVrgfzYrCPv+6Lq7i/ukJFT+aZRPQ5WbYpG6rRKlf//x/fRKPKZErck
         TnMKTqYs7DC9hrUud3btX1aU9Si/z/Sx80dZsvTNRBayBRlGgCaBfcBHVyo9sKQhb0FU
         JkEV7kyvrgP4fif8iTRs2+Ptzx7ji2H2r5W6bbadaKiCZKcHEUd+iuCfOKa8DJZAVYnH
         un7rqXLjK+VkNp9LW8bexwuPGZudtcZU44sc31UeMn1luaovcWgTj54UvwlBXs5zFt6/
         gcRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z2J3mDg2zWp/DiXrFZERoJKoUUydS2LszSVYaoRZjCo=;
        b=IrpRVGm9I7MPnGEGTVbMP//M8yd0YxV6lvmjRt8Ydqj9XJqwtjGqUVqsDzKoDfl70u
         OiyT/fO3xlmiQsZpTqY81YZxU9ldsC+NDJDCFlnAgztxjWrWFc7gqcDnqOrpXSdlKP4x
         th0Te3MqvO/EqDYFlyc0ZmLnMeHcJ4j046RvDHJqJEQInJ2UfyQHLFUKWtmFRW3Qw8Fd
         +wWnfac6xPiQyNHGd14RLe/4WGL/YBcPR99fD243wF/LcavDIeUtaoNRX5bMG37gIUDB
         c8WLbYiMELEGAMH34Zfr0oRc4IUlyHbl5tqogPqYaHsPNeOiTlrM334XYZSzwWMWICfz
         oP4g==
X-Gm-Message-State: AOAM5308uHbDF7l4O6KILFCA7SNBmaRlguq/5z+hL81803jx8nj7kSoF
	eeWmeCnVpPaPKLujWAkr0gI=
X-Google-Smtp-Source: ABdhPJwbAvG/z9MWIbuF2UmFkvgNwpD5pxrSgbmdUFyZVrkdImBK93sHvXyxNbRM7jJjvisbLwqYMw==
X-Received: by 2002:a17:906:a20b:: with SMTP id r11mr4847600ejy.323.1619794666944;
        Fri, 30 Apr 2021 07:57:46 -0700 (PDT)
Received: from agape ([109.52.244.36])
        by smtp.gmail.com with ESMTPSA id g11sm1452501edw.37.2021.04.30.07.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:57:46 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 24/43] staging: rtl8723bs: remove BTC_PRINT macro definitions
Date: Fri, 30 Apr 2021 16:56:46 +0200
Message-Id: <0f0129063880553001a2c1d8272d10079abc7132.1619794331.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619794331.git.fabioaiuto83@gmail.com>
References: <cover.1619794331.git.fabioaiuto83@gmail.com>
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

