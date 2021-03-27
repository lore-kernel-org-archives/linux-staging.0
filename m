Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F5770
	for <linux-staging@lists.linux.dev>; Sat, 27 Mar 2021 14:25:01 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id x16so8374361wrn.4
        for <linux-staging@lists.linux.dev>; Sat, 27 Mar 2021 07:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Dvn70d7ZVR8XY9R5o5JpAomHZOvZdMCNh+kZfGyarKQ=;
        b=ln3UTy++bXXqTH+TLRHvdv6UJEaCQjlpOU0SitX1IvHqs5oXAU4CxWmRlJxPTZUNPi
         SQtJW3xlGH1pATI1tfnDKNLZ/WFZxKQ1A0nxG1wstS0PxCYY+2/59UGb43MM9TEjOg81
         5EE3sCbhqERqW0YIb/KasYeJ8bzN/MzMCrRajhW6TMXfebZkSGfo7RD/+dAr04cjh8K2
         mjEpi7bdCm6xFlpNpYmLzD2fo9qneWlIyBbJVzozludC3NpqrnKuQco31vQ1E8qipOHe
         t+op0X3o7NgmJM93yyUpeI0wMVlxrCtYIkA9zbbJfK1PTi744PZ+tkHXcc4BmxnB3+T1
         IMIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Dvn70d7ZVR8XY9R5o5JpAomHZOvZdMCNh+kZfGyarKQ=;
        b=hia+OomR2YltxMcW5BDOrBJuCv8mZ0pRcnmj1wfvRVlwZ1BsX6W+am9lnK/PF4azBl
         3FqCnn0wxowWJjPNMlUHcw1j0wh7Z1q7dIKPhvgqCWblhaU0Adyc+2jwMLbQg9f3uoXZ
         c5puunY/C2vR58a83C6m5bxF+EyXIjABARgwHAqBCujrJsnw942VL869yOZGDTY79b9c
         U3xrcVc2scDv6MpxaEVt78ViGHzU73aHT6lntFLMvjGbKfmCrv07TdzPFPpUwy1rS4Q9
         Y0q98i20dumTA09hJqLbDXyxM+J819/BwLKceoj3KQPPgovnD+0cMj8P2KUdT4PGr/7V
         3ZSw==
X-Gm-Message-State: AOAM532HW4SvmOOTT1/SnFzF6olsE+U/puuD8g/IZsn3gGdAQNla8mHF
	ApoWOPAf50FqFb5o0o0Y9Jg=
X-Google-Smtp-Source: ABdhPJwXjH5PAU13TKG1WP5GsdrMIjCGw4PJwBTktxJhm37VkaRd4v+zZA4HqH9ef3PP/uwvPsE5Yg==
X-Received: by 2002:adf:e68e:: with SMTP id r14mr19513342wrm.273.1616855100137;
        Sat, 27 Mar 2021 07:25:00 -0700 (PDT)
Received: from agape ([151.46.211.242])
        by smtp.gmail.com with ESMTPSA id x25sm18833839wmj.14.2021.03.27.07.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Mar 2021 07:24:59 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	david.laight@aculab.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v2 09/20] staging: rtl8723bs: put parentheses on macros with complex values in include/rtw_debug.h
Date: Sat, 27 Mar 2021 15:24:08 +0100
Message-Id: <f36448ddc1553a018f700983b5d436eacaef9cb3.1616854134.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1616854134.git.fabioaiuto83@gmail.com>
References: <cover.1616854134.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix the following checkpatch warning:

ERROR: Macros starting with if should be enclosed by a
do - while loop to avoid possible if/else logic defects
+	#define RT_PRINT_DATA(_Comp, _Level,
	_TitleString, _HexData, _HexDataLen)			\

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_debug.h | 28 ++++++++++---------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index d1c557818305..b00f8a6c4312 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -236,19 +236,21 @@
 #if	defined(_dbgdump)
 	#undef RT_PRINT_DATA
 	#define RT_PRINT_DATA(_Comp, _Level, _TitleString, _HexData, _HexDataLen)			\
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
+		do { \
+			if (((_Comp) & GlobalDebugComponents) && (_Level <= GlobalDebugLevel))	\
+			{									\
+				int __i;								\
+				u8 *ptr = (u8 *)_HexData;				\
+				_dbgdump("%s", DRIVER_PREFIX);						\
+				_dbgdump(_TitleString);						\
+				for (__i = 0; __i < (int)_HexDataLen; __i++)				\
+				{								\
+					_dbgdump("%02X%s", ptr[__i], (((__i + 1) % 4) == 0)?"  ":" ");	\
+					if (((__i + 1) % 16) == 0)	_dbgdump("\n");			\
+				}								\
+				_dbgdump("\n");							\
+			} \
+		} while (0)
 #endif /* defined(_dbgdump) */
 #endif /* DEBUG_RTL871X */
 
-- 
2.20.1

