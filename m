Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8342A2AE6D
	for <linux-staging@lists.linux.dev>; Sun, 20 Jul 2025 14:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753023385; cv=none; b=aaO17VXHpytqMqDHnb79VPdB8aojQv2AcgIyoUlUvebCtEu1jd3vUhj+gtfP/66ZDuRd2nkzudFnp/i4sakQT9RdQ/jNqZdAleVFPb+KBxKEZtb9QmNO8jDj5hu1LintaLzj0tasrJgVwlId1BeOGhyZtRTLFoiRDqPbEjbKZCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753023385; c=relaxed/simple;
	bh=5WIpg8M4OZIHbRgfpFIrvs+X9wtAwRb/9qKnD4fRiXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ew9w9NdIiZweRmCc8E7+ZHHUmf8qqMCNO9S3hD+/Xh2IkTTCVeSmPdEe2s3xbmqWTg1nhSjCrammIftqVN5CiYjJlGcyMZhAqMJSkEx9Hw1E3r1shsxFV3gfqWe+Ek8YIl49jppuG6SLIIP2Xw5UkmfJND9xgEtl5hq2rccT0PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SNxj86k4; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SNxj86k4"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4563cfac19cso23668185e9.2
        for <linux-staging@lists.linux.dev>; Sun, 20 Jul 2025 07:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753023382; x=1753628182; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CSzJbfBxGlFQhYe06l+5g3yW+X7vjXzZyyKhKql0gbI=;
        b=SNxj86k4WQg+KMlbtP0fDDAFwdsWfYw9xZ8m97Qex6NvwpYOMlePzY7in4KxRi+AF6
         MvHyGGTvW2z+coXaXvuO46dGJNKZLpNtY0n7qwUTs06+eemMrfr636jt47gtio/Vu8ex
         LI2rT5LrjW5HHw35i5UQZDaSZK0JbdnwAAOgdq4eLhNT9gpRtFA+YZrhZg9R9l5cQXpt
         NNPTDqElgDVr4cZSex3mDMSqCQQpCBr2fOR61ncBanYBLKSVzw1WnCP8G4DwksYU6pXR
         ehGge02IOrac37QHI3TIQeucEu1Tj5XMZt/2pe0hENii5bvCeFHNj2mT2Dt3TCWtMBcc
         eVAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753023382; x=1753628182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CSzJbfBxGlFQhYe06l+5g3yW+X7vjXzZyyKhKql0gbI=;
        b=kJ0U7qtxqtKGGCS9J0EsCc1UM/xRixBPz0DZsubly8tZM9Z36ThilyIw5Q9mKDxeJp
         iLOPGlapxbzZxXjst4ByizF08BP+V+cwRzRj4SZFUHHgAvDI0o2FtVvHTtQpBa6wuvyf
         gMCNDzBwMjZ2lY1H1QjrwX9HGBQkEOZ9FpTjKOvKr+Nakjsuul4eAWDkQhSCi37/I/b9
         2tQK4RvqMwtAzsHAVls+ZkOHV2KoDw8SOK3ecPv7Jrwfqgx5irTtt3oWUIqk7uCIrFaU
         Cu+LcHkhk3B3C7vRRSM2vOi9Vbjt9b3o2uWESzil6M4He8V9KIuopFqEpN8/9d6EuG1v
         8j+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUiyTiejIM8w24LpIcMByN94spRbmOe0Ut5OPvDxluIs4KoOGB9ejjQsUVYP/40E0jbu5Jgmn0np2NwwXMJ@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2fj1krotOsQXRf6ctPR5XOXSxsK+a5RkP6UM9G2S8WdBBtvpc
	OcZ8ElaRcghHHQyfExLbqGwiJgi+NXfxA6tj0b3fvNR6B1MovvfKpP6v
X-Gm-Gg: ASbGncvUYDA9aOvutPhiKzVczQ74nuaVegdy/L0qumyRu8N4RIHxNyawhfrAnPCAi1f
	VqJ4PvJ985NhdbS+bc0LqCjYZ/BjYScLwQ1cEBR+E58KnV+iNLZi0jB69wVzbaSZiqNpwB/k8KS
	gNs0K9eoekJPh2UweEm3uBhe3OnfuYXz50HOvvuh7E7TjI3bH8Hg9fDPnAAMr82oX/o+n96Z9Yr
	Ov4DhP8S4wHcpCTshgxn6uCOxzRyG3uavkuruObhswhkKX7zKCksk1Hocfa8MJIpuHsnLwGrnu7
	0D2Tv9zsCnd31LvgpCaCS44sREq+vntb00NDjVDHOzNEQVaADygNMoSmLP8Sb8HASm9+2v1MjB5
	QdowCVGzvFvDoKiNqOdpe
X-Google-Smtp-Source: AGHT+IGZczZVkPif0Pk8IFfldzizZ942+bXzIwRE7N2C07sn03JovOeIbpAhMuvwF7KBmood5j/VdA==
X-Received: by 2002:a05:600c:3b86:b0:456:fd4:5322 with SMTP id 5b1f17b1804b1-4562e04538bmr170383705e9.11.1753023381726;
        Sun, 20 Jul 2025 07:56:21 -0700 (PDT)
Received: from zephyr ([77.237.185.246])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b61ca4c754sm7770550f8f.59.2025.07.20.07.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 07:56:21 -0700 (PDT)
From: Ali Nasrolahi <a.nasrolahi01@gmail.com>
X-Google-Original-From: Ali Nasrolahi <A.Nasrolahi01@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Ali Nasrolahi <A.Nasrolahi01@gmail.com>
Subject: [PATCH v2 1/3] staging: rtl8723bs: fix comment style and formatting in osdep_service.c
Date: Sun, 20 Jul 2025 18:25:22 +0330
Message-ID: <20250720145524.9733-2-A.Nasrolahi01@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250720145524.9733-1-A.Nasrolahi01@gmail.com>
References: <20250720145524.9733-1-A.Nasrolahi01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes minor coding style issues reported by checkpatch:
- Corrected comment block formatting
- Removed redundant blank line
- Improved variable assignment readability

Signed-off-by: Ali Nasrolahi <A.Nasrolahi01@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/osdep_service.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/osdep_service.c b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
index a00f9f0c85c..60c3da009a5 100644
--- a/drivers/staging/rtl8723bs/os_dep/osdep_service.c
+++ b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
@@ -7,9 +7,9 @@
 #include <drv_types.h>
 
 /*
-* Translate the OS dependent @param error_code to OS independent RTW_STATUS_CODE
-* @return: one of RTW_STATUS_CODE
-*/
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
+		cbuf->read = 0;
+		cbuf->write = 0;
 		cbuf->size = size;
 	}
 
-- 
2.50.1

