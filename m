Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57EAE5F
	for <linux-staging@lists.linux.dev>; Thu,  1 Apr 2021 09:07:30 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id x21so1115738eds.4
        for <linux-staging@lists.linux.dev>; Thu, 01 Apr 2021 02:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Y8KbK2adWOITzic3uSCbYPwpSyouNdBB+luO12NuLOU=;
        b=i7zMwDQY5gr9rLiPrivN3dZZmP/NhvM1rEOV/q61kRrDNSnbVebx7wAhNAI0z7FTZq
         KnnsWfoScLavc0WL6XmRXYtWfib6t44RPTf6rKMNFZX4WHPFImkeLewZA/1kJR0+mi0u
         +018ECIVKCouHnrTcjiCIpy+3Vj9Kw2oK4BmJcX6/ft5dlNE9KmHYcuhs5A8u0UvG1pa
         xDGt14+7WG2i0umuQHHEG8VvDcQhR3fSA049jcqw26aIeVkq0UvjpSSkfqCZQTixDiyv
         dyMdJ1OxvEgrlywNS0VjWljdtA2noYe/TSFEvhD95Lv0A948w2fBoZY2kPatx1hD/aqD
         cEfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y8KbK2adWOITzic3uSCbYPwpSyouNdBB+luO12NuLOU=;
        b=tG0rVACfXBBWAP3YIPupZ8WUSPObwGCP5Lqhwwb2QQPNmxNjQPAON0oVuc7AIL1daF
         clyaAE1MHtezB/j8lqGCTnBwvzJNQfcqTyl6LWyV+EY0OXaDfRu8hQbHkltbdwu4pr0I
         5uqSJiU6yu6R5kPTyYP4B0NNbnrWiKq86hOrfeApxB1IbwRYbCONKG7lt+eifoym0qst
         UCcaQsxIpHDIw5lWhMS0QoDdCVfrpRRyhnoakSi3uJR1uCDlIu1+PsdZBkYOZfHtzXdS
         603auxswHrASI5tZXu2sQTCsKxI1dic1+M/CQ7Vu4qaRpD7lVuiQO+VB7B3OfWJ2jobE
         ngrQ==
X-Gm-Message-State: AOAM5310MAI9dKo+dpAIG1aWG3ZNxWCTKchgikm/YOdVhNg8w4HSm3rt
	BlVOkpv4hwrbrl3BX7IAyd0=
X-Google-Smtp-Source: ABdhPJxMjTcBO+tDVIriTELG8sJrabR5JYuN71hy5jWsEKX6qPx1Wz6Wq47LzDe7A4hfOXoPPyTjFw==
X-Received: by 2002:a05:6402:34c8:: with SMTP id w8mr9096736edc.235.1617268048964;
        Thu, 01 Apr 2021 02:07:28 -0700 (PDT)
Received: from agape ([5.171.80.247])
        by smtp.gmail.com with ESMTPSA id jx22sm2420778ejc.105.2021.04.01.02.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 02:07:28 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v2 2/2] staging: rtl8723bs: remove unused macro RT_PRINT_DATA
Date: Thu,  1 Apr 2021 11:07:22 +0200
Message-Id: <a7d11ff4f0c069fac8b66e9c50a846d004ee2a4a.1617267827.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617267827.git.fabioaiuto83@gmail.com>
References: <cover.1617267827.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused macro declaration: RT_PRINT_DATA

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_debug.h | 20 -------------------
 1 file changed, 20 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index d1c557818305..d3c77798a5eb 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -132,7 +132,6 @@
 #endif
 
 #define RT_TRACE(_Comp, _Level, Fmt) do {} while (0)
-#define RT_PRINT_DATA(_Comp, _Level, _TitleString, _HexData, _HexDataLen) do {} while (0)
 
 #define DBG_871X(x, ...) do {} while (0)
 #define MSG_8192C(x, ...) do {} while (0)
@@ -231,25 +230,6 @@
 	} while (0)
 
 #endif /* defined(_dbgdump) && defined(_MODULE_DEFINE_) */
-
-
-#if	defined(_dbgdump)
-	#undef RT_PRINT_DATA
-	#define RT_PRINT_DATA(_Comp, _Level, _TitleString, _HexData, _HexDataLen)			\
-		if (((_Comp) & GlobalDebugComponents) && (_Level <= GlobalDebugLevel))	\
-		{									\
-			int __i;								\
-			u8 *ptr = (u8 *)_HexData;				\
-			_dbgdump("%s", DRIVER_PREFIX);						\
-			_dbgdump(_TitleString);						\
-			for (__i = 0; __i < (int)_HexDataLen; __i++)				\
-			{								\
-				_dbgdump("%02X%s", ptr[__i], (((__i + 1) % 4) == 0)?"  ":" ");	\
-				if (((__i + 1) % 16) == 0)	_dbgdump("\n");			\
-			}								\
-			_dbgdump("\n");							\
-		}
-#endif /* defined(_dbgdump) */
 #endif /* DEBUG_RTL871X */
 
 void dump_drv_version(void *sel);
-- 
2.20.1

