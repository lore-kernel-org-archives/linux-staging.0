Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F1B3FC8
	for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 20:05:31 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id q11so10343191wrr.9
        for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 13:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BkAToHqLGpWrzCltyYAF8Ew2duh76wBIPHOKBuRHsZ8=;
        b=Pyw+mwRk9oZccY7vZ1KvEhNAES3zQr/prXdceE5edF8q6oW0v6I7sw5MU++MVrDbWx
         FzlRExezzPfvvpataWU5xVtbEfPPeqzv/Z1g0dxM/kjJmsH8rpE0H0N98qe0qCsh5nRJ
         VtNk3mpJ6yQI+fpEJLhIKCZTdfUE2FePkO/diJcvnbfSMnPKWyMFIV8ahnswMW9ev1DR
         oA+USaElkcutqj/idEF7B2zGO3pa1jBlpsqQz2TsPSv58s6WTy7DKxHz1/yjAmqPo12u
         kJYQRdfoyxaCRc9gjO/SFIa5HptVRQOyULqWLwNT6TJFfk5m76R9wr6Wjcnv8T5YapNF
         kkjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BkAToHqLGpWrzCltyYAF8Ew2duh76wBIPHOKBuRHsZ8=;
        b=65O7MWvQ0m3iMrp27U2QvYI3uU0yyfkBYOxU4y84dZdD1rhhGMkAmYooTXlsVFvCkU
         Ztq79p0tNZpaQBU+KLTN7EvjtUboa3syTCJIRnOKoi3ZIcZqIWHf1BFdt/FePxCR8aHk
         9nPnu4adiWHLuYITW/6HXYdaDuTCbWHlHYEEPaw1dS9uV9aWDc4XzB0bAjYMD6NKUzR7
         II3HT79EIPiAiUJTzNj7gsEnUqE+DQj2IDNR1fabxNY/e/kPbXCRS91JrH9J6RpGTK8e
         XF3TcdxZmKxe20ZzLQTTa423huxoE1IKzr1wSMGRMM6rjCMlKV9zynK0W32CAiwiabeL
         w+Rw==
X-Gm-Message-State: AOAM5310BWoQ73br8ksQ1ZDFSeSJs1X9diWEy8zVWKpmGz/gHfF45pR8
	u/Cb88M9Bkdi7rhxNv9EAUcmqiN+TnJc1Q==
X-Google-Smtp-Source: ABdhPJzsRJLkCkJauQqWK2PmMv+vMEa9Q+yJn+0S8Sg1imA8bBGz0zVqqCI/RCnWRgbQdC1VMEofEw==
X-Received: by 2002:a5d:6846:: with SMTP id o6mr871775wrw.327.1632341129813;
        Wed, 22 Sep 2021 13:05:29 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cde])
        by smtp.gmail.com with ESMTPSA id e2sm3219761wra.40.2021.09.22.13.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 13:05:29 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 05/47] staging: r8188eu: remove rtw_efuse_access()
Date: Wed, 22 Sep 2021 22:03:38 +0200
Message-Id: <20210922200420.9693-6-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922200420.9693-1-straube.linux@gmail.com>
References: <20210922200420.9693-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function rtw_efuse_access() is not used, remove it. It is the only
user of the functions efuse_{read,write}8, remove these as well.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_efuse.c    | 53 ---------------------
 drivers/staging/r8188eu/include/rtw_efuse.h |  2 -
 2 files changed, 55 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_efuse.c b/drivers/staging/r8188eu/core/rtw_efuse.c
index 010740d035ea..893287e50d9c 100644
--- a/drivers/staging/r8188eu/core/rtw_efuse.c
+++ b/drivers/staging/r8188eu/core/rtw_efuse.c
@@ -226,59 +226,6 @@ void efuse_WordEnableDataRead(u8 word_en, u8 *sourdata, u8 *targetdata)
 	}
 }
 
-static u8 efuse_read8(struct adapter *padapter, u16 address, u8 *value)
-{
-	return efuse_OneByteRead(padapter, address, value, false);
-}
-
-static u8 efuse_write8(struct adapter *padapter, u16 address, u8 *value)
-{
-	return efuse_OneByteWrite(padapter, address, *value, false);
-}
-
-/*
- * read/wirte raw efuse data
- */
-u8 rtw_efuse_access(struct adapter *padapter, u8 write, u16 start_addr, u16 cnts, u8 *data)
-{
-	int i = 0;
-	u16 real_content_len = 0, max_available_size = 0;
-	u8 res = _FAIL;
-	u8 (*rw8)(struct adapter *, u16, u8*);
-
-	rtl8188e_EFUSE_GetEfuseDefinition(padapter, EFUSE_WIFI, TYPE_EFUSE_REAL_CONTENT_LEN, (void *)&real_content_len, false);
-	rtl8188e_EFUSE_GetEfuseDefinition(padapter, EFUSE_WIFI, TYPE_AVAILABLE_EFUSE_BYTES_TOTAL, (void *)&max_available_size, false);
-
-	if (start_addr > real_content_len)
-		return _FAIL;
-
-	if (write) {
-		if ((start_addr + cnts) > max_available_size)
-			return _FAIL;
-		rw8 = &efuse_write8;
-	} else {
-		rw8 = &efuse_read8;
-	}
-
-	rtl8188e_EfusePowerSwitch(padapter, write, true);
-
-	/*  e-fuse one byte read / write */
-	for (i = 0; i < cnts; i++) {
-		if (start_addr >= real_content_len) {
-			res = _FAIL;
-			break;
-		}
-
-		res = rw8(padapter, start_addr++, data++);
-		if (_FAIL == res)
-			break;
-	}
-
-	rtl8188e_EfusePowerSwitch(padapter, write, false);
-
-	return res;
-}
-
 u8 rtw_efuse_map_read(struct adapter *padapter, u16 addr, u16 cnts, u8 *data)
 {
 	u16 mapLen = 0;
diff --git a/drivers/staging/r8188eu/include/rtw_efuse.h b/drivers/staging/r8188eu/include/rtw_efuse.h
index 02cbadb2ec2b..f0236a89d731 100644
--- a/drivers/staging/r8188eu/include/rtw_efuse.h
+++ b/drivers/staging/r8188eu/include/rtw_efuse.h
@@ -101,8 +101,6 @@ extern u8 fakeBTEfuseInitMap[];
 extern u8 fakeBTEfuseModifiedMap[];
 /*------------------------Export global variable----------------------------*/
 
-u8 rtw_efuse_access(struct adapter *adapter, u8 read, u16 start_addr,
-		    u16 cnts, u8 *data);
 u8 rtw_efuse_map_read(struct adapter *adapter, u16 addr, u16 cnts, u8 *data);
 u8 rtw_efuse_map_write(struct adapter *adapter, u16 addr, u16 cnts, u8 *data);
 u8 rtw_BT_efuse_map_read(struct adapter *adapter, u16 addr,
-- 
2.33.0

