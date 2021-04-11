Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3249C70
	for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 12:58:14 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id e14so15742936ejz.11
        for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 05:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ty8azWTSp8PJc78RW7jXgfpPMbgDKQilIYgTVUhzQAw=;
        b=qb7fseIOBvKqNVNCRLnk1NmkL2/ixAI2BBnOGtVuEJ7/BE1Ar7/62ld4qTtjw40HPl
         9Nvm6tWxFDb+4x1pWcqNujV1Jkl9YKC7IEXh6au97G8G5nqsEJg6I0q+f5LoiLegs9Fa
         gXiI7E6trpyGOafjXUOrGAHe1NiCnsU4+GCtDJSdtK5WDLXRf/HZtH4WHyDFwroDFjm8
         T9mpCcT5u7Zf5THBl1QSHq3cUyB4BWyoHZVuACWsfIQ+2s3DBLUG1hQJINPPuyoLi2pe
         W0FWjYz5zhyST+0JO5e1qYQekn/8NLSw97PMvFN56rP31DLBxoqSEVjtU08RxA6e/Tio
         UFXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ty8azWTSp8PJc78RW7jXgfpPMbgDKQilIYgTVUhzQAw=;
        b=HNpKMc6V0pwn+WWhRlrVFF7LJDTVmylxjZSOe+rwr6tUexLlNdAI5A+8J9ItQH/ZLc
         6X94s2bV/wNlwEsVgJIDz24FYRIeoRCwl1z4zsJf+Rg0n2aEv5hDHG6w0HExByAhyxUr
         LU90TLg04mBeWVx6y9nQ459EMd30FSkR/Ncc9dKfRwbd2WZN1JEcMx0OFeZNwFeuY+Od
         J5osenrVOj/NrQUSAEsTkKPYgV3Beskqj9RtggWjpwJ0qt2vkWL8KCKAOFSUJZ81EV/i
         ZH8vhoa0w8CZ0RFB/z+02nKQwS9WKARrmGpQtF+ZfxQxflvEKtDT0bKA6bJ3qBZFJ+X6
         oZJA==
X-Gm-Message-State: AOAM533lsAvimWDAOkm1H+mfmJnoq5zx0UUU7HZaE+e3qq2Am4ZDxo9M
	8mfIqEFa27u9S5gq2ZHs6+Y=
X-Google-Smtp-Source: ABdhPJzwRBnAwpqYRDe0VJTVaxj2jq3OcSuTm2Bd7M0u2CkPeIx2RNsChhHxxbClGf1Hr5r7Zab81g==
X-Received: by 2002:a17:906:2e59:: with SMTP id r25mr14417503eji.268.1618145892847;
        Sun, 11 Apr 2021 05:58:12 -0700 (PDT)
Received: from agape ([5.171.72.218])
        by smtp.gmail.com with ESMTPSA id f19sm4031311ejc.54.2021.04.11.05.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Apr 2021 05:58:12 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] staging: rtl8723bs: remove unused variable 'start' in hal/sdio_halinit.c
Date: Sun, 11 Apr 2021 14:57:37 +0200
Message-Id: <ce1faa15052b519738656e11658dee93f9e91c29.1618145345.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1618145345.git.fabioaiuto83@gmail.com>
References: <cover.1618145345.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix following W=1 compiler issue:

drivers/staging/rtl8723bs/hal/sdio_halinit.c:
	In function '_ReadAdapterInfo8723BS':
drivers/staging/rtl8723bs/hal/sdio_halinit.c:1156:16:
warning: variable 'start' set but not used [-Wunused-but-set-variable]
1156 |  unsigned long start;
     |                ^~~~~

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/sdio_halinit.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index 552afbaff081..28bb4aaedc5b 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -1153,7 +1153,6 @@ static void _InitOtherVariable(struct adapter *Adapter)
 static s32 _ReadAdapterInfo8723BS(struct adapter *padapter)
 {
 	u8 val8;
-	unsigned long start;
 
 	/*  before access eFuse, make sure card enable has been called */
 	if (!padapter->hw_init_completed)
@@ -1164,9 +1163,6 @@ static s32 _ReadAdapterInfo8723BS(struct adapter *padapter)
 	val8 |= BIT(6);
 	rtw_write8(padapter, 0x4e, val8);
 
-
-	start = jiffies;
-
 	_EfuseCellSel(padapter);
 	_ReadRFType(padapter);
 	_ReadPROMContent(padapter);
-- 
2.20.1

