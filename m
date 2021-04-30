Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826062F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 14:57:51 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id n2so105693411ejy.7
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HuRDse6cwaQ2xwrTLwG7a4zXuTLnjB8VHStZClnoZTQ=;
        b=Td6CtkVdrm7SNmosLQvuR8caw+RdEYHhtA4bbMmbJMvuPu9e9PWgPrlinYOuG8jXUD
         fLOeWEXkuToz+xOM3qM+BMA7J/hMwISChfG4YdUevbXXynDcmhHCULAamqAtQnDetSA+
         nMI6lDRdxm8eOSkBRfZZRYS6G7aMOieR8753jYgdFpqUI75DdAVYWCj8cCE8XUW5mGUt
         Zw6wzcchLnBKdgJEdUEd03vVCrrPoEtF8VTY4TU46vmW6bN0Umbs5JlmDeqQfrQfArVn
         cdnYpIDxX92eSHLR2RJFd743GlXbcZF9CDZsIalpS48tpW6f1/CSNSuOqSLyOPBfY3J5
         nzFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HuRDse6cwaQ2xwrTLwG7a4zXuTLnjB8VHStZClnoZTQ=;
        b=bYKZFrvCCvQeU/hqkea0XyMz0O8Na6CX3CFRAMFp9fwZxIkXA1ykqW0DmoHxzHXGCU
         2tbOOgx4ACSTPxSEpvUBkdSD/4ry+cHzvEqtgG3mtx/PbdH7hfepIvMw9R/Zi8+LxHIk
         A775JlMOWa7doEnZUJR1H+uxhQZi/BgXtLfjbkGzJC6JsoQ5zNVVF1f/glsJ3GT0a7aW
         lEB38bJ1PeelfQ5EJQmWoceksQqW8fwTImvT1SYG3UHEYX5HXP1lOYbaQPGs/Z9hYeBt
         dVPP2q+oQKQT4LJte8SsS7CQS9fDXHPqpy7PWNgYI2B42WO+E4j5/Vis3pqguXCMdYgF
         OsbA==
X-Gm-Message-State: AOAM5319NRVOEqRzuvV33pmTC2K4+6yfqworZlrCBE/2R08nm9fLEKZb
	Nr39Eqef+yn425HAMMvEAos=
X-Google-Smtp-Source: ABdhPJwgtyRa278HrEIQPpXV8otrCV8NrTV24x7CwBMCsONcGjG8oSAnexbb0tZHrMyPR/Oa9qKJ7A==
X-Received: by 2002:a17:907:8319:: with SMTP id mq25mr4763752ejc.441.1619794670156;
        Fri, 30 Apr 2021 07:57:50 -0700 (PDT)
Received: from agape ([109.52.244.36])
        by smtp.gmail.com with ESMTPSA id sb20sm2094012ejb.100.2021.04.30.07.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:57:49 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 26/43] staging: rtl8723bs: remove BTC_PRINT_DATA definitions
Date: Fri, 30 Apr 2021 16:56:48 +0200
Message-Id: <0b83b96133af86e73bed64d7fe35ea96b2940208.1619794331.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619794331.git.fabioaiuto83@gmail.com>
References: <cover.1619794331.git.fabioaiuto83@gmail.com>
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

