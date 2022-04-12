Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCCD833C0
	for <linux-staging@lists.linux.dev>; Tue, 12 Apr 2022 18:58:07 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id c64so11337144edf.11
        for <linux-staging@lists.linux.dev>; Tue, 12 Apr 2022 11:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hpa4N5vsb9gM4LzFPyO/7ve7HdAU0SOf4yN5lG8PbWY=;
        b=HgVZUoTC+gx8PCPFFLnAywUZ8CUoq5mmDC3QTucWlg1VezUrWG0GdIhCuBtFLv8tyl
         VEQDO3GSP4ox2p1SUPDaMmoPvV6L9nBPTvZEQI03+2UY4VYL62fC+Fo3VOqOzrnDJiQl
         UOwhXzAQQAtkHZzeGIAtrEfJRLZEY0aQyPa4u134U3tWNgEV1/I2JLuOjwj+y08VmnyN
         mPJpPc4wCZiIMrTOkWXj8wDZ3VEjGdYEj+upacu0akQ0ZXB3lwb1HBN9vVVqNat57DpJ
         jGEbFk9l0FA+tN3qS9x6gAb/s70vTP2j/7nKwGxhMcE/3oKzNLxWpK+Wzc8uEJFhf0k8
         vFeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hpa4N5vsb9gM4LzFPyO/7ve7HdAU0SOf4yN5lG8PbWY=;
        b=tqfz2NffUrFgLQSPmQ/xWnwcrXIhIfVIxjyBKv/X+t1P9JyWm406Aq14RVqik0155X
         BrVcFkFbBsP8Tdwh+xnsYmnn97KHYpgj0vIKV6Zm3Z+z2153Xw8Ch01O1Lund9aZceUq
         crtKdgM/GtlZi0/N6LJsDLa7Yd1LnouVb75WiEpYmWnyFrVvW0sRsHh2dqnOCw2FYSke
         eRKI4mXgj/W39hBniUxnRGL+WimpmmLCzdiI2y30LTo5PV/IDUAwhCFGAI0V1nraNzQP
         Q3coGs5RdRR91YDC7wlx88eO+a+HjRRcAxPyHwrKbc00xrYQ/e3x3m2jS1rvWIE0ALBH
         250g==
X-Gm-Message-State: AOAM531kIZZgq2wPXUUbgh8IoPOel84hXXqW2TayF1rpyA77NyMdqq5S
	UnGDzkxHe2VumWx65eAsx3k=
X-Google-Smtp-Source: ABdhPJxfSkH/23aJHVUbzKtMu+PEFUbtRkCS3kd4XoG51Dtd6o0rHViRyN1QxNgGj6jVF+kgF4Lm1Q==
X-Received: by 2002:a05:6402:cac:b0:410:a920:4e90 with SMTP id cn12-20020a0564020cac00b00410a9204e90mr39599935edb.60.1649789886129;
        Tue, 12 Apr 2022 11:58:06 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb6b.dynamic.kabel-deutschland.de. [95.90.187.107])
        by smtp.gmail.com with ESMTPSA id q22-20020a170906771600b006cf8a37ebf5sm13443482ejm.103.2022.04.12.11.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 11:58:05 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 6/6] staging: r8188eu: clean up long lines in block_write()
Date: Tue, 12 Apr 2022 20:57:54 +0200
Message-Id: <20220412185754.8695-7-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220412185754.8695-1-straube.linux@gmail.com>
References: <20220412185754.8695-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Store the address and the data pointer for calls to rtw_writeN() and
rtw_write8() in local variables. This avoids long lines and improves
readability.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_fw.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_fw.c b/drivers/staging/r8188eu/core/rtw_fw.c
index 1e930799a0b3..8620f3c92b52 100644
--- a/drivers/staging/r8188eu/core/rtw_fw.c
+++ b/drivers/staging/r8188eu/core/rtw_fw.c
@@ -75,7 +75,8 @@ static int block_write(struct adapter *padapter, u8 *buffer, u32 size)
 {
 	int ret = _SUCCESS;
 	u32 blocks, block_size, remain;
-	u32 i, offset;
+	u32 i, offset, addr;
+	u8 *data;
 
 	block_size = MAX_REG_BLOCK_SIZE;
 
@@ -83,7 +84,10 @@ static int block_write(struct adapter *padapter, u8 *buffer, u32 size)
 	remain = size % block_size;
 
 	for (i = 0; i < blocks; i++) {
-		ret = rtw_writeN(padapter, (FW_8188E_START_ADDRESS + i * block_size), block_size, (buffer + i * block_size));
+		addr = FW_8188E_START_ADDRESS + i * block_size;
+		data = buffer + i * block_size;
+
+		ret = rtw_writeN(padapter, addr, block_size, data);
 		if (ret == _FAIL)
 			goto exit;
 	}
@@ -96,7 +100,10 @@ static int block_write(struct adapter *padapter, u8 *buffer, u32 size)
 		remain = remain % block_size;
 
 		for (i = 0; i < blocks; i++) {
-			ret = rtw_writeN(padapter, (FW_8188E_START_ADDRESS + offset + i * block_size), block_size, (buffer + offset + i * block_size));
+			addr = FW_8188E_START_ADDRESS + offset + i * block_size;
+			data = buffer + offset + i * block_size;
+
+			ret = rtw_writeN(padapter, addr, block_size, data);
 			if (ret == _FAIL)
 				goto exit;
 		}
@@ -109,7 +116,10 @@ static int block_write(struct adapter *padapter, u8 *buffer, u32 size)
 		blocks = remain;
 
 		for (i = 0; i < blocks; i++) {
-			ret = rtw_write8(padapter, (FW_8188E_START_ADDRESS + offset + i), *(buffer + offset + i));
+			addr = FW_8188E_START_ADDRESS + offset + i;
+			data = buffer + offset + i;
+
+			ret = rtw_write8(padapter, addr, *data);
 			if (ret == _FAIL)
 				goto exit;
 		}
-- 
2.35.1

