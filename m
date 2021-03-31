Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B856F
	for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 09:34:23 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id hq27so29038632ejc.9
        for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 02:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nJLOt94s3l6Fobf6ZPtXQMWeNkPKhv/UBfAhGZDQK4c=;
        b=FM+yqdyhKqo/+jLtBo0PUMiH1tfrS9whjhQTsrwYVd6zQbGiX/8FGnZX+9B7FGcv+d
         eg0VamjlsVJFn+kVuzo7/e3j2i68Xl7NzMVgU68mqVRbcsxhoU5rJqcbBz0m50fbOJ8A
         BCngCEwkTM8RJWO8Zw/PZIxXjSYYHNqvXKKEznhi05nZOeKaLgmzNQjUEDT+Ybvcc/7f
         fXXiT0cLDL7NO0F2a7tMAiQQ0nPsqCj/1wNU1wND5LIsm9d/gqkA1J0OV843lD6jm8qq
         jYiuj1r9P7q4xsiUvnwJRlW6ADv+tNnDFVoVX7Bs/xnx3kOEpZ/KrXOCafsqzcsFNI1a
         wdWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nJLOt94s3l6Fobf6ZPtXQMWeNkPKhv/UBfAhGZDQK4c=;
        b=FLqNfdoYCzY/BhgO1R9BnFAoz8JjrRoGfM1ZsMgoO7Yfwbn7lq+dKRhOXDSMRX9QaW
         lBeUUr53b5H4cV+yDc9BWvS8nk9LJzdWP8lZFUVaHnwDVrXlZOyLRnGIvLoxZkvsSFH5
         FaJtv4/Hu9U2bl7GUb9m0xyjhORy9Ep4UfbOF970R+DFOfqFrJS2UWd25aBARXpszUYP
         I3zDMWj/fE4qWS7YKRLGmZ9wR5e0FLU8OJjVZW+TpwZ4zO8noMocv7Mnt7uVyUoJmWo8
         /9KUULsprSQjMxYvicwcJtMwCZu6qkd4IIL8OTfGFbPCu+RAaiIB2ev3tqT8pFldKMQe
         xlRg==
X-Gm-Message-State: AOAM533fs7plHVUF1W5gakTxKFJoiSlBrV4Y9CUrSOIGsCkZ4IYm9WmM
	UGAIFB62ZA4fxjujATcQkUc=
X-Google-Smtp-Source: ABdhPJxHn1CzN8QRRB1addIFq7ulFiTS5vS6eKmQJi2R3RDkXBT3AP1z5iu6oB0JyrTgUrOUaKA2+g==
X-Received: by 2002:a17:906:4117:: with SMTP id j23mr2623040ejk.10.1617183261777;
        Wed, 31 Mar 2021 02:34:21 -0700 (PDT)
Received: from agape ([5.171.73.44])
        by smtp.gmail.com with ESMTPSA id w24sm1095489edt.44.2021.03.31.02.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 02:34:21 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 2/2] staging: rtl8723bs: remove unused macro RT_PRINT_DATA
Date: Wed, 31 Mar 2021 11:34:07 +0200
Message-Id: <1367a38513774e80a3ce32947ae80506576b2e94.1617183040.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617183040.git.fabioaiuto83@gmail.com>
References: <cover.1617183040.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused macro declaration: RT_PRINT_DATA

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_debug.h | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index d1c557818305..4c0857241922 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -231,25 +231,6 @@
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

