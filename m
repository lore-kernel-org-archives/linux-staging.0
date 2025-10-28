Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76DBC201278
	for <linux-staging@lists.linux.dev>; Tue, 28 Oct 2025 09:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761644389; cv=none; b=axEDi0jIo89d0P1sVuZ6dFsdXVNS5SmyilargVvepookfeuRGGPcq6tDfSmUz18Gn12anRoHEOX55Tx/Et+uWVaE4+KxiHonCvH5xP2Hx7LIwB8Dy9bSU4NFBO3qufGDify4RSuFmVtrpg0Ke5JMSNKW9FNSRUKpTjPKhze/sEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761644389; c=relaxed/simple;
	bh=8jYaLchuY9Q0uuWUELqQHPZ7Fbc1wt2Radkdyo4Cn2E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hlCz+oEb5lKZcGheXO8iIMaTMQ730IVCn/AQD/4iviNKoWeq3qUXJRzCagi1xWgXEwd2eZd4mO33KZmvsdmNum2xk+kYHoLysFCnpHufHaHzKfszI5dNhgXfCNrmoWSGs3iMjI9cpqezYi29sBbxN9wNodCIN2jG7nV1JJrghP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VXevlLk1; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VXevlLk1"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-63c3d7e2217so10848571a12.3
        for <linux-staging@lists.linux.dev>; Tue, 28 Oct 2025 02:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761644385; x=1762249185; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=woeb0SZyZzDYLB0tIRlLIE2pN+2OLXTcWOCh78+e+7E=;
        b=VXevlLk1rW+pie6ZYR3/Bj0sXkUAYkp4/+JoBZL6nUjMeQquVefo2FdZib6xTIJqC2
         oD2vc8bl8st+2j3lDuxDXDK8NNjWTNrnakrSOA3oE9lMc+mf1E8FSyEG+g9HWZ6cBt6z
         PepxF4qNyNs6GWZpKn2oyeTd+7XI88Rxeqonyuk1hkbKlPYYGqXgKcRBsvCgUqMTLGMb
         MZMQIo96nEnEG7VK/tbNf+2O4TxEyg+k9amkriRFH55lAvskb5F6RwglwTTxByu1HfE4
         AN1ZmgQjHx2v5kSErLvVZwXnSvw3PGj3tdecCVgZNjGkWPVi0r/Zlpvoh7+NLEIqMbUU
         67Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761644385; x=1762249185;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=woeb0SZyZzDYLB0tIRlLIE2pN+2OLXTcWOCh78+e+7E=;
        b=r93YfC21EVnmSAK0p32faqAjx3nAd/hkNGTqrUziOGA4zGW/QanW6dydSqzCa3Dt2J
         gbdnvE2soet2JFPCI01TpJCRVj3DiN4WvZmHsU+jkjUkUM1ijDT9mQiQmxFqjEj8hY2A
         bcpbthtrpgeSIP4Lsdvmq7S5NHtyorybPLkE1sRCIjEpFiH9xnRgQQP7KcHxX8kelRQA
         VbRGSHAtH4ywJWA34YxhVYCub3v/fyuseB1+KArD5sj+fk5DR7GV4D0A4nhB3OsKhj6u
         4k7vGJ0Y8EB41SlFlZ8lCkHHk8d77p3jmy8W7gFxkuhveI0EEdH5Jo9NzfguByamtMF9
         YvBQ==
X-Gm-Message-State: AOJu0Yw320FWxUpbE4nxuN8QCOgjxqdqlkru3Hvn5Qp9Lks81i2kgcje
	Rj/n0un56x3IPvS2AFwPVZmzmANcK5AcwC0qfktE4rRN9HC3XffKeAD8ZwQgfA==
X-Gm-Gg: ASbGncvp8BbMvvowU0L/fZa5a0UJXPrrF2jkQOuAxMz9vytbhDsf9r+MxWpuKbTcoLr
	scszcSb9fNpNAjlPA/1jf7N5AbYndBVshEn8mJ7rtonqscjIBchU22n4JFbKfpz50Nbm9c+rICR
	Wuu/2bIEexeoGSSEMX9ERmG0HcJ6i8QrHK/iYYCfCKDFCB0HOSVzVEmMKTYIcB9TkqzEiTDZTJ8
	p2WqnMtEN32JekiLlojXK2pd0PhtnXLlcTcbWX8HK4stxeoYiKTDoxpW5HYIs8gbAMB9b7eXzi7
	VK+zLX5xQ5t4OuQ5mUot+sSDgP02HheSPL6D4yFrstEbTzTCbDQR42ejtftQ7A19c3mcc8rQZX2
	hzpA4CxlNIvr88/XSuQ5E7VLS1jB+SyBvSixbmx3V8vvaI5I26NUSo9gpIf1SZFVR82SjhUuOCO
	LWpYPada/bUIEwSXaiLf+Vafo+JygwkCFTBg==
X-Google-Smtp-Source: AGHT+IHVTSq3YUyaew5pv1PfCtYyJhg5Pk+lN9SaBEX9cDWXsYK+1aF3BZJmPTeARAeZXPiAKdzjtQ==
X-Received: by 2002:a05:6402:1471:b0:62f:5b56:423d with SMTP id 4fb4d7f45d1cf-63ed8375d4dmr2553177a12.14.1761644385449;
        Tue, 28 Oct 2025 02:39:45 -0700 (PDT)
Received: from localhost ([2a02:810d:bb0b:f200:74c9:ff82:f6fe:1064])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e7ef9a5cbsm8600402a12.23.2025.10.28.02.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 02:39:45 -0700 (PDT)
From: rafiqul713 <rafiqul713@gmail.com>
To: linux-staging@lists.linux.dev
Cc: rafiqul713@gmail.com
Subject: [PATCH v4] staging: rtl8723bs: remove unused rtw_sprintf macro
Date: Tue, 28 Oct 2025 10:39:42 +0100
Message-Id: <20251028093942.90248-1-rafiqul713@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rafiqul Islam <rafiqul713@gmail.com>

The rtw_sprintf macro is defined in osdep_service.h but has no callers
in the driver. Remove the dead code.

Changes since v3:
- Addressed review feedback to delete the macro instead of replacing it

Signed-off-by: Rafiqul Islam <rafiqul713@gmail.com>
---
 drivers/staging/rtl8723bs/include/osdep_service.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/osdep_service.h b/drivers/staging/rtl8723bs/include/osdep_service.h
index 8b1634f4091e..12369ee2ce1d 100644
--- a/drivers/staging/rtl8723bs/include/osdep_service.h
+++ b/drivers/staging/rtl8723bs/include/osdep_service.h
@@ -115,10 +115,4 @@ bool rtw_cbuf_push(struct rtw_cbuf *cbuf, void *buf);
 void *rtw_cbuf_pop(struct rtw_cbuf *cbuf);
 struct rtw_cbuf *rtw_cbuf_alloc(u32 size);
 
-/*  String handler */
-/*
- * Write formatted output to sized buffer
- */
-#define rtw_sprintf(buf, size, format, arg...)	snprintf(buf, size, format, ##arg)
-
 #endif
-- 
2.34.1

