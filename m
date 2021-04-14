Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9AAB71
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 12:18:56 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id y204so9103457wmg.2
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 05:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AzC9o1o0ixYi6KaDWY1ROlCOIjizjCzFaIisDwi93jA=;
        b=aWncd9Qsf6VvUPxeQFIgoPFErkVfocB1tR/M1Q9jn3nHV8M17YJqJ/lEpOnMZt9jtc
         A8JH3dlN8EO33KUR4/Tivl2+/vS+BJ2sRjWGBdasF7BRw4gI5jfGD9XiltgY++VJz1a/
         6zNQB2Dg1f88fUKBkyNReOg7G0E6bhfTZUxiwgmKabo1alJ2K/QdJHw7GQrGuh3CQM4t
         /KcE/XL9uewv2N9VyhM9tIP2ahiACeZfhORxeBiaTH4odvgeU5W7PXsYgrDOyiPp9EJk
         NCQS68ZeWjI9b8uXxDMO9p2y6A0C5OJHGL4XKSiez7Q+tv/EWQ+WE5WEP4Qh5lm+MbGm
         GsJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AzC9o1o0ixYi6KaDWY1ROlCOIjizjCzFaIisDwi93jA=;
        b=tp09DpZ/RDNcqyC7TI4vfpSjpxquPzNzvBFV3SDGJovXcXYBUb3DpP9IWU9gQC66E7
         8FPWBEVqRf88qiJQZh7K2sMibQn8NNclYIk9R7vwIdxBJh8T+o0XgJb5SolAHzxaKMTP
         iPMrI/L/XvjNwPhSPS9xVbM3VxlqWVjpYKVGgqMmg9BddUa2ieSLWtZzd02v1F1N11p/
         M84JiZcPnfiShuUn/2eLY8ZtFLn6UYLx3kE4vvkZuXAAMuAEuqp7IkPgwYLysoqx4Muq
         J2Aexh+RfX1CTIIWhbQMYDbfgFXQIJgxLVv/CRCSfSonsX85ry4qkPlyyIVB/HycTVbB
         pHVw==
X-Gm-Message-State: AOAM532WXvcmvN5KEzpVOiGtX3UqH4T/RadgBOcyyobbx8boYStr3DOC
	mU2xWmXfyw4gfdnXkMSV1vc=
X-Google-Smtp-Source: ABdhPJwrXJ0kT6waXpeEWCsburvi7kEe4k+FmeRNpLxUR9B2xrLHAx/0zaWOKec9bAkcZf5e1C05Mg==
X-Received: by 2002:a7b:cb04:: with SMTP id u4mr2741291wmj.122.1618402735563;
        Wed, 14 Apr 2021 05:18:55 -0700 (PDT)
Received: from agape ([5.171.26.216])
        by smtp.gmail.com with ESMTPSA id l4sm5125486wmh.8.2021.04.14.05.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 05:18:55 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: julia.lawall@inria.fr,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] staging: rtl8723bs: remove DBG_871X_SEL_NL macro declaration
Date: Wed, 14 Apr 2021 14:18:49 +0200
Message-Id: <8839231b53881c8bf1f8a4d70953ec8acaa2fe95.1618401896.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1618401896.git.fabioaiuto83@gmail.com>
References: <cover.1618401896.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove DBG_871X_SEL_NL obsolete macro declaration.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_debug.h | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index f1b37d511f27..12873c3d801d 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -181,15 +181,6 @@
 			seq_printf(sel, fmt, ##arg);			\
 	} while (0)
 
-/* dump message to selected 'stream' with driver-defined prefix */
-#define DBG_871X_SEL_NL(sel, fmt, arg...)				\
-	do {								\
-		if (sel == RTW_DBGDUMP)					\
-			DBG_871X_LEVEL(_drv_always_, fmt, ##arg);	\
-		else							\
-			seq_printf(sel, fmt, ##arg);			\
-	} while (0)
-
 #endif /* defined(_dbgdump) */
 
 void sd_f0_reg_dump(void *sel, struct adapter *adapter);
-- 
2.20.1

