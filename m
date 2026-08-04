Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76347456DF2
	for <linux-staging@lists.linux.dev>; Tue,  4 Aug 2026 11:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785842098; cv=none; b=dGY1qLj8aKqU9FHig18mQnJe63SgnJniq7n7XVIE5PejssO7fRFaViZlh470v7qFsjLdfJke1MDKvUZq1XasAxqf64GnkG3dYj73vkTJLLgOGCYAtIaraqJjHpgaFRrLVsonVUx1OOyjiCDlnT/WwinwEmZ4eh00QgCVGM3Nf1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785842098; c=relaxed/simple;
	bh=NasySpUEUqyZoJ29V/kOBVlY+85hRsteM1l1s9K5wvI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t6piC32uWTtwS2uLaYCD3QH5DYLE1s+HOIiWs1G0Zrm49m7Rf1gbqZuC5pC0zCMwdfONEruVk6Ux721Fs0nKwMgG36KvxUPZncZ/Q1cJJ4mkYOacUWTutysK3MhneJGZJzDzoz9MN6j1nbJJgozgzU1vY+Z1leunJl13Ct5LBL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d4MiPb2P; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d4MiPb2P"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84862b0d5aeso5302419b3a.2
        for <linux-staging@lists.linux.dev>; Tue, 04 Aug 2026 04:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785842097; x=1786446897; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TtK6rzOXgnddUnE4LDkxnUN6UrbQbFiFvgHnJHBn6OE=;
        b=d4MiPb2PLGt5qtCznjcvqHZmWfSsgMadYZ9RT/kaAK3khvhOi4rHr+yRjhh6X1F1Tc
         ywkr9zi6y+G1spz3AP8prEaj8pxGF9A5SDUbQJ2I3c+KwlBY64GTMUM+dS1Rv+b0F/L6
         a0q1/q2A6vtJpjA7e/F84bGHbHDzZZxK1pDfBvNEBAxXSQeM8Z1oh4jfmE8tieKdUCRv
         1zTc3NTbvTuR97b0JDI394KTqv7kZQMyaV/uzc2jX7+n3FQlDCvYijx2PgPC4rj+jZsS
         CBr+L17ny2gRfIK+uQoCBm0dH6rgFQhsirmf2QcDWWCd1WM5fQr1lGsGHu6ukLfOORiC
         fTdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785842097; x=1786446897;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TtK6rzOXgnddUnE4LDkxnUN6UrbQbFiFvgHnJHBn6OE=;
        b=IZgk9oPHYl5SeIhUfmHZ+WfG/quSiEJrXDPlMj6nDpKf81AiIiRIHaF7g9YpFJlIj6
         tUgMvGzfB5Q9Rb9rPLnXFXf8rGumc8BbjCy4Z1osfQeL57nX9yhEJ8QLI+I2thRsIq15
         Pi8AhQDs+BI/Zllzb+aJLzCC/gYblZ55eenYKTGg8Y1HA/lyzCpkYeup+wrP3jEPDQwo
         fpb2Pu3S34YRo4YhNRPZXYPcz8zzOLMOspHerimb52yplOeJ81SahvuBl8sVMLLor2cu
         yI+hd+3i92ondR/Sh5YQJKAAQTkU150kddUHtWnqZSZTj9icbOSogVaKuaLlHx98kPE7
         qGqA==
X-Gm-Message-State: AOJu0Yw5nW9nrKBlTmvSr9a4UcrHRJMS1vObN8yi/kifNhJYdbxRkiL9
	sEH+X/R5A2XQ54r1WlrVJrQYAL9BR//8gkEK4xmLPsudgJRjPXdJkaZQ
X-Gm-Gg: AR+sD12Aq5HXEpXiR3OyBLG3h3qSdehaWnX0bLP/MaY2s4RoLcrHG9Lm/GEV0742nEo
	5o8UXsKa8fcs7OH8VwC+JYbU3rJFhgaAxJkTKwUeaXqUA92Y5u+p4alHzEDI7L9R5zZHl5Wf/K5
	VW6X2u2WS1kvoOYBKESdf6s2cQ4jEr7nxd+AiIIajX4wJczqSvjCxukj7X/JvBEqmUpJGpd9zXO
	DxjYdGlnjMBEha+KJPZFrU313WCmLqTciUzeIhbIZ37MCzI4QkudHWuUxDGB9fNXesy03jjqLZm
	0yCd37B+P5iCQ4YWHMB7++kfzceVAZyXPz0lx0671GHRpr6rE5DdIYC2cEUtin+hQYBAjStAOe0
	TaK6ed1HcNrCu0h3r5gi8Mbn8lzt7wSJtGqW10U+ZDc3ms7yCo4zXKZQh1igxboVRvj5v08VQxv
	j9BGGB+DI3VOl4rxaB1FJ6wXkIh0dDR+rbWZG3qDcJ/H7pXU/pTGjulHaIDk9ygjt4t3jr7s2Yk
	MGIXx3i
X-Received: by 2002:a05:6a20:3ca2:b0:3c3:9aff:7a46 with SMTP id adf61e73a8af0-3c92a5d35b9mr16144553637.32.1785842096682;
        Tue, 04 Aug 2026 04:14:56 -0700 (PDT)
Received: from Vicious.localdomain ([103.37.82.147])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315863fb350sm4074094eec.8.2026.08.04.04.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 04:14:56 -0700 (PDT)
From: Ashmit Kumar <work.ashmitkumar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ashmit Kumar <work.ashmitkumar@gmail.com>
Subject: [PATCH v3] staging: rtl8723bs: remove redundant ternary operators from return
Date: Tue,  4 Aug 2026 11:14:43 +0000
Message-ID: <20260804111443.21758-1-work.ashmitkumar@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Linux kernel coding style specifies that boolean expressions
do not need a redundant `? true : false` ternary operator.
Additionally, return is not a function and therefore parentheses
are not required.

Signed-off-by: Ashmit Kumar <work.ashmitkumar@gmail.com>
---
Changes in v3:
- Formatted as a standalone patch (removed 1/3 series numbering).

 drivers/staging/rtl8723bs/os_dep/osdep_service.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/osdep_service.c b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
index 4cfdf7c6234..214c1fd9b3e 100644
--- a/drivers/staging/rtl8723bs/os_dep/osdep_service.c
+++ b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
@@ -130,7 +130,7 @@ void rtw_buf_update(u8 **buf, u32 *buf_len, u8 *src, u32 src_len)
  */
 inline bool rtw_cbuf_full(struct rtw_cbuf *cbuf)
 {
-	return (cbuf->write == cbuf->read - 1) ? true : false;
+	return cbuf->write == cbuf->read - 1;
 }
 
 /**
@@ -141,7 +141,7 @@ inline bool rtw_cbuf_full(struct rtw_cbuf *cbuf)
  */
 inline bool rtw_cbuf_empty(struct rtw_cbuf *cbuf)
 {
-	return (cbuf->write == cbuf->read) ? true : false;
+	return cbuf->write == cbuf->read;
 }
 
 /**
-- 
2.51.0.windows.1

