Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EEF3590B9
	for <linux-staging@lists.linux.dev>; Fri,  9 Jan 2026 09:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767951494; cv=none; b=mcRe6PNBAgKU5QPXmSXQoIbnN6mebXoLjoV634YnjAyBG8R5EN0nWLm+Z6edmU5QYcNsAu/tLNgJOUVYkAGbyZ5dr8NRTH/X4/fvqVR2PREngyuRGnHac8RX3aeZJXhNg2fKWP8QdS0EqYFNARz9+9o8ef9SNWIbY7FMjKE96Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767951494; c=relaxed/simple;
	bh=0YbHs99sJJdE4Cm+UM+6E8X0ZKSgh9Tmp9dEwxBYl8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RTDod17Ye/gRG8ZMQQqpT8buqr540xJWzQ3QRvhrFD6vJ/nTUHaGXURGVO0lu5gvqF6Gw2GBaXf8XYOKOCpVoIITYHxUkmCECH9aVYe51Xlf/WYgv0kLeetw2hpKM7uIQ+tT3Q1FQhrsAs9SNxCZ32wnLiwVL1TUIBZMkRjQ7wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VGTfRmlY; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VGTfRmlY"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-bc0d7255434so1912214a12.0
        for <linux-staging@lists.linux.dev>; Fri, 09 Jan 2026 01:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767951492; x=1768556292; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iMOqvR42uyFXbDReCZqGv/iiun3O+UFDbaylwrdJ7r0=;
        b=VGTfRmlYks5Ab/rw1UHqs2MQeDRQOIh6ZI5b6BbBPrX4aBNVHOJTuCitomOgh7Insh
         TnCty3Y+uSfA8XkxC9/50MLAjV3KtC6P+gtn1yfu5LRseui5A2zo6SBQRui+iicBPlED
         016NSbrmpSPNF6mDfDCJgE2cBq1ZgBAlGlnJbFiAPlXsJG6oLbvCsKHWdxZqssSKD1lj
         3zId2WyKB4w3Guy7kXqDB3jzbIjcwlTCAhARj2DjT6BM/6Oacu/uOzdZTKjVerxq0R3c
         P6pMMFTahjtMN8F8xvNT7AwQ8mP5hJxG9dtGkonie+3/Wz7hgLjexx+HXz9kJ6XAZiyy
         hZWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767951492; x=1768556292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iMOqvR42uyFXbDReCZqGv/iiun3O+UFDbaylwrdJ7r0=;
        b=jcgBSi0zpKDIOSOKTy6GG9VTo/TfRvCWflNdlDKa3LfM8fmpC5khEdaB1aUp/JAfkW
         R7Ytf52XtlThINx0LK5oN9e9FcfUPUK8gwayh0ojsDSyfnVcT6+3Vj6c2Jm45mRoTfMt
         yFX7xMCpQ+Ao6+F1Rb82gffW7v3RU2jVvFnL7PitB/3JfUiTavhq5ulLDjcnVObEA1C2
         xQ2syOTquVzoobToFQC8ZlAFaN7qKCIngwwqnf+23l6UCBrRm60JgOyo0iE5BruT8BOW
         PZ4KxAQ70x86bGCU/V8y8/eDkyLqamnl40hiB/+s9kzoESYoCYsMcGOCrs6h+XPoWNfr
         U7AQ==
X-Gm-Message-State: AOJu0YyExRlml5H64R0U69dYPW/+jfSVp3J7y1HzO+ih0qvG8WPfim6w
	zc88gCw42gj3829Q0FvWlD80JbsLkQlntt1qlm0AqtaIzEiHViq6T+drFglmxw==
X-Gm-Gg: AY/fxX6PHQsqFsI5g0HTWMIwd5nyeOpt+L+iWnajqDKO/muHI+kns2L9fOYIWiNwyUl
	GgBwxkuqhqg3JZ7P4XUaVEMiaNHwjT5Ew7Aozsjb+dNOGGaotT9OlZaEguECYECuClvC7mp+jpi
	VZ58smS5F38A3AoZ8H9PoGUz8YC/err1VwwamSI9H6pdcJShBeInVWzQHO06ybQPxx+od+QWP81
	b+sOijiBAD97vmaAEUdfsWsIhBdQDCt8fPxiZytDwKOaA5/1UkNn9ZgnzdXD+0sgYTnrCZpmT/n
	v2JVfqZECu+FyMggK/yhIcdPbY5roTELlf3y8B5upoqBu3Me5LhVxbVtqP1VOgvKNaMuldM8yq0
	dBgBpVPffmkMAsEOwvEAJI8HoXrgzX2ftMjYmQ47MdqKHHGVzKM73h2EiTXvoGcaa69GboQfse4
	6BycDlfeAJFzXG/RASTzvY
X-Google-Smtp-Source: AGHT+IGuCOAS9XnR27SMptxjPFyCEpHFKgTb4RTnuDxJsMBkxQfminm5BKEpjJuJkoimi8IxyzJ7FA==
X-Received: by 2002:a17:90b:2642:b0:32b:9774:d340 with SMTP id 98e67ed59e1d1-34f68c47f38mr8054021a91.33.1767951492357;
        Fri, 09 Jan 2026 01:38:12 -0800 (PST)
Received: from UbuntuDevVM.. ([103.171.99.41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5f7b1d81sm10173239a91.1.2026.01.09.01.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 01:38:11 -0800 (PST)
From: Nayana Mariyappa <nayana.mariyappa@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nayana Mariyappa <nayana.mariyappa@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix coding style issues in osdep_service.c
Date: Fri,  9 Jan 2026 09:38:01 +0000
Message-ID: <20260109093801.15334-1-nayana.mariyappa@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix block comment alignment, remove extra blank lines, add a blank
line after declarations, and avoid multiple assignments to comply
with kernel coding style.

No functional changes.

Signed-off-by: Nayana Mariyappa <nayana.mariyappa@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/osdep_service.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/osdep_service.c b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
index a00f9f0c85c5..c082a0359064 100644
--- a/drivers/staging/rtl8723bs/os_dep/osdep_service.c
+++ b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
@@ -6,10 +6,10 @@
  ******************************************************************************/
 #include <drv_types.h>
 
-/*
-* Translate the OS dependent @param error_code to OS independent RTW_STATUS_CODE
-* @return: one of RTW_STATUS_CODE
-*/
+/**
+ * Translate the OS dependent @param error_code to OS independent RTW_STATUS_CODE
+ * @return: one of RTW_STATUS_CODE
+ */
 inline int RTW_STATUS_CODE(int error_code)
 {
 	if (error_code >= 0)
@@ -152,7 +152,6 @@ void rtw_buf_update(u8 **buf, u32 *buf_len, u8 *src, u32 src_len)
 		kfree(ori);
 }
 
-
 /**
  * rtw_cbuf_full - test if cbuf is full
  * @cbuf: pointer of struct rtw_cbuf
@@ -204,6 +203,7 @@ bool rtw_cbuf_push(struct rtw_cbuf *cbuf, void *buf)
 void *rtw_cbuf_pop(struct rtw_cbuf *cbuf)
 {
 	void *buf;
+
 	if (rtw_cbuf_empty(cbuf))
 		return NULL;
 
@@ -226,7 +226,8 @@ struct rtw_cbuf *rtw_cbuf_alloc(u32 size)
 	cbuf = rtw_malloc(struct_size(cbuf, bufs, size));
 
 	if (cbuf) {
-		cbuf->write = cbuf->read = 0;
+		cbuf->write = 0;
+		cbuf->read = 0;
 		cbuf->size = size;
 	}
 
-- 
2.43.0

