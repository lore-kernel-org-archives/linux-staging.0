Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18ED05F
	for <linux-staging@lists.linux.dev>; Mon,  5 Apr 2021 16:50:17 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id v11so11428298wro.7
        for <linux-staging@lists.linux.dev>; Mon, 05 Apr 2021 09:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BCYHSEy1io8xFVxyrWex3dyAIrjV7+IJ4+JqgLgs0zw=;
        b=qQSyg2q01F6yDrjYTle1Kdz1JwLwHSzOH2mg1gKfm4peiSbjIz8afnseqJsgJ6Jalp
         ziN05anLcYWqatdTTRQKhcVjkX8Yn1bUqsxfFll/bViuuUFYLurJ2jaHUXzoUtKemEpe
         0NfgIJRghUUWi28IoE3DgpDPXGikdNMUIY9HEQ4IXqf98r9uzAOAGCINdykQRA3RpIHJ
         BMsDBJTt/rZiE2QV3Q0nPqJfifv66+w2PK0RAxAFiQfqYe+mmhWxrMsLZn9s0fFS0XTb
         E9orE8CIF8jbfDYRYSRJ8V9HIqMv8JFKNhd8D6vrpV+Ul9S0H2ovDIBIbmjDdlI6Z8YE
         udxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BCYHSEy1io8xFVxyrWex3dyAIrjV7+IJ4+JqgLgs0zw=;
        b=YMPcgI0qtTfuCZjIuVDPQmz/f6NKu/JXjjoJ8dxfcEH0WD8b87d1P75O110HOFvJaf
         wuIcx7X2F70Jve2P6B0sOKZX6/B2WKdSu87R4vVZ4/+2eQArnMwq94UlFpYA58zuEfgr
         /UzE6I6LnCEWNI527TQS1welSxDiKYWEB8AOqeVnGalnt77x+DCJ9rREseaAfpwSpTeC
         PSZWvQOZB0JWjhbAl+DKr0BplCa92FYQZmUB0ybttw7fK1MnUOIlmIet2ROuRi0GX/kg
         ix8Dv6jIDg+bx7vnbYy4pxARRpfoPcJB3G1j6vPVzdkqUOupERwF+5YwC3pFDVcNU23A
         LWgA==
X-Gm-Message-State: AOAM532B9D+3iFdYiPZUiu37y+7m+L4lvN41BbEA46kLemftRX2yrxr7
	mqNqnYj46/mRah4YdcYYB/s2KLqvfLc=
X-Google-Smtp-Source: ABdhPJxsOuSp62aYgTRm2QTuMAgH1WxIjLBgEOoD5ORPkqaadoRcfR9lEn65jtqmUMfMuFbxceX9GA==
X-Received: by 2002:adf:ea86:: with SMTP id s6mr6737473wrm.222.1617641416610;
        Mon, 05 Apr 2021 09:50:16 -0700 (PDT)
Received: from agape ([5.171.72.58])
        by smtp.gmail.com with ESMTPSA id h14sm34304597wrq.45.2021.04.05.09.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 09:50:16 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 03/10] staging: rtl8723bs: remove RT_TRACE log definitions
Date: Mon,  5 Apr 2021 18:49:50 +0200
Message-Id: <163c0f17c88dc8977103a0971c50f4769ad78173.1617640221.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617640221.git.fabioaiuto83@gmail.com>
References: <cover.1617640221.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove RT_TRACE log definitions.

Remove all of the RT_TRACE logs in hal/ and os_dep/ file as they
currently do nothing as they require the code to be modified by
hand in order to be turned on. This obviously has not happened
since the code was merged. Moreover it relies on an unneeded
private log level tracing which overrides the in-kernel public one,
so just remove them as they are unused.

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_debug.h | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index d3c77798a5eb..6639d79cd7ec 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -131,8 +131,6 @@
 	#define	_MODULE_DEFINE_	_module_efuse_
 #endif
 
-#define RT_TRACE(_Comp, _Level, Fmt) do {} while (0)
-
 #define DBG_871X(x, ...) do {} while (0)
 #define MSG_8192C(x, ...) do {} while (0)
 #define DBG_8192C(x, ...) do {} while (0)
@@ -216,22 +214,6 @@
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

