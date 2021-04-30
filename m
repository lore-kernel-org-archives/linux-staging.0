Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2AA2F9C
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 14:44:59 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id q6so23659907edr.3
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h0VrDyabi3mV4M4fhUFp6n3KhHlZMOtcz1Nzpn72r40=;
        b=eX2FTUUqCF9IJcSgsL2f0pytSl95/5JIUnBu1KYeeE9BF8lc2nor+zv5dnlXJF0MCb
         EMePxEZ1jOC/G9wnIk92xoKa1yLVzcPPJ1imFcfjoo6OVrIjMked7IVqamvR+Wehc2H0
         NaAVp6PIYITypPiJ2MM/3QgR2H825B5F0b0ZSXi5LoKsAZp0Ks830wRm36350MHGQELE
         wKmzLZpQqV3L54OMvXQfth+uGK3Q8Gk7YUlvvSmiQRjHd1IDqNFNlQ/51X9lbzKZgdnZ
         qTdMYEgEUxXE7kqeZbymyKzzMbBrNcZYd+Up4GL0HpoAfeDkldwDcv/p3xhuORWYk7o2
         HD9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h0VrDyabi3mV4M4fhUFp6n3KhHlZMOtcz1Nzpn72r40=;
        b=RLe5Qxlnn0WjAma+gt5btUnvWg7OISAvfP2R8nbYBzcU7H0mfSNkV8p49MrHOKKRNF
         QM5hbHErf1/0MOkwKorniX/M5hFIiltrM+1dI+AaU7TdHu2nSWpt8I4ficBX+W4SejZr
         22phX6PvKKNnwmfWuLQ4fuw31WM24fKor5nyaE36+/x3vjuCPmQ3r9yHODo0I7zJhDOl
         FV53FjMp+TOsEdGlPuRrtDXeVYycL1nPOpHLCn7EbSXj2cJ34GuRNu6OPx5y8VAeSvTL
         y7L9uNEGr6OHidHhBymRVpu8Y/JkQSV5hCaX+LCfy66D+8WRCZ5m2lBcUnt8KnBUmZh6
         GcoQ==
X-Gm-Message-State: AOAM531cwQ7t+hH4SknlarcdYD41kGEmvFAohf8AjjRSwB3fK4CbX/dl
	e+C7YFYQj2dJXcWhmB06uPU=
X-Google-Smtp-Source: ABdhPJxuRNHKC615TCh2qI2M9ZeHFvHxYNv1so7Sz8ft1jWVy0jWMdYEbLc/JfcnrQe79VCEgE0niw==
X-Received: by 2002:a50:82e2:: with SMTP id 89mr6409983edg.0.1619793897987;
        Fri, 30 Apr 2021 07:44:57 -0700 (PDT)
Received: from agape ([109.52.244.36])
        by smtp.gmail.com with ESMTPSA id dk13sm1522287edb.34.2021.04.30.07.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:44:57 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 29/43] staging: rtl8723bs: remove unsed hal_btcoex_SetDBG() function
Date: Fri, 30 Apr 2021 16:43:59 +0200
Message-Id: <c0e39a96c48a62fa79609f51de1d15abfee92061.1619793406.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619793405.git.fabioaiuto83@gmail.com>
References: <cover.1619793405.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused hal_btcoex_SetDBG() function definition and
prototype.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_btcoex.c     | 12 ------------
 drivers/staging/rtl8723bs/include/hal_btcoex.h |  1 -
 2 files changed, 13 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_btcoex.c b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
index 30d763b48349..cac2d6077403 100644
--- a/drivers/staging/rtl8723bs/hal/hal_btcoex.c
+++ b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
@@ -1492,18 +1492,6 @@ void hal_btcoex_DisplayBtCoexInfo(struct adapter *padapter, u8 *pbuf, u32 bufsiz
 	DBG_BT_INFO_INIT(pinfo, NULL, 0);
 }
 
-void hal_btcoex_SetDBG(struct adapter *padapter, u32 *pDbgModule)
-{
-	u32 i;
-
-
-	if (!pDbgModule)
-		return;
-
-	for (i = 0; i < BTC_MSG_MAX; i++)
-		GLBtcDbgType[i] = pDbgModule[i];
-}
-
 u32 hal_btcoex_GetDBG(struct adapter *padapter, u8 *pStrBuf, u32 bufSize)
 {
 	s32 count;
diff --git a/drivers/staging/rtl8723bs/include/hal_btcoex.h b/drivers/staging/rtl8723bs/include/hal_btcoex.h
index 3c03be210d87..9048499e756a 100644
--- a/drivers/staging/rtl8723bs/include/hal_btcoex.h
+++ b/drivers/staging/rtl8723bs/include/hal_btcoex.h
@@ -53,7 +53,6 @@ u8 hal_btcoex_LpsVal(struct adapter *);
 u32 hal_btcoex_GetRaMask(struct adapter *);
 void hal_btcoex_RecordPwrMode(struct adapter *padapter, u8 *pCmdBuf, u8 cmdLen);
 void hal_btcoex_DisplayBtCoexInfo(struct adapter *, u8 *pbuf, u32 bufsize);
-void hal_btcoex_SetDBG(struct adapter *, u32 *pDbgModule);
 u32 hal_btcoex_GetDBG(struct adapter *, u8 *pStrBuf, u32 bufSize);
 
 #endif /*  !__HAL_BTCOEX_H__ */
-- 
2.20.1

