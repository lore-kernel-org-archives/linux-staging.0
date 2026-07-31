Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648D02BCF4C
	for <linux-staging@lists.linux.dev>; Fri, 31 Jul 2026 03:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785469457; cv=none; b=l1Jt0PoilGFLjpky7bXysrvp3kU26jpTd7TFLQwJ7MWJeyuPw72pZIlnNrwz8QAVxuGWWVlsJtg0IZDI+MdRf1a4KCapa/Igd+UbJcltJo913CRIfyd4zY098f7A0tbULujpyRtzSNEZbFonRv3qjaJU49FuWeFoqdl7fN+JVNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785469457; c=relaxed/simple;
	bh=LP4duEAhI5o2sdVGefD0dieYXU120kz0oRk944A/6yA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ATUAiRo96oAfGwOu16woE+NOocmbdcYe78PVJ+WdkYWwNKR6UuLwThxOJ1XNsHMb2lJ3M79l5xaEpA37XGeE4PJMT8hSxh9WeUGy0WBolh3GZUY8o2eitC9piIW8xByu+xiarptC90M0WqBiYs2feB2uKffnZ/IrKg+W4c1BokU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EuHKWiUB; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EuHKWiUB"
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-74ab99038afso338340137.3
        for <linux-staging@lists.linux.dev>; Thu, 30 Jul 2026 20:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785469455; x=1786074255; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=69VevUWBUpIToUGta4+7KVa1gnk3nRn51z8QnDQoo8Q=;
        b=EuHKWiUBycROfmNbSld0J3U7xhZQuj/MxprRcpv/CLjF/+gRKbL0LY2/vYaxbZ0zEl
         IBl316ADgoRdPdqwslg+kVImP1yq/Sdvh29d7p9Un1d39c6qJPkGY7e+iIGcqdk0vQDn
         xwyvDonWfjL7judvJ7/r+c1LMZnkGZ4xEX9K3pj7nM5RiAM4CgV5O82mURPbxknYxR2v
         G4WlB8oQgzrk0GwiCo1MUyMhxb3Qa5ifddbqYZV+ZtQsUSNfD0iNiPH/RcW6qiFn5M8T
         QzG9AOgdAXzByihuPlh7lDNj2Fm8an+G76Mmwe92IdcDgxzNsV8r5XH0GNQGLLWPvPa5
         XDew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785469455; x=1786074255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=69VevUWBUpIToUGta4+7KVa1gnk3nRn51z8QnDQoo8Q=;
        b=cYisjcqbq3vVLdWxqJCfiit2dSs3xGW9LZuiSDwdQ7IPOIaZ2EwZL5IksYWhGSriM1
         1OS7GMFBSOMZOLyMmS0+cL0gDIYgDZeAaCFPQeqynEf/fWeNr4u+Cnn3Q2B0dKuRjG4V
         ZhW+E6SMsJ6rhodiIpmoxEfyv7H/6CAWMKE254zC82rSwh0B7EmbAuQ+0o3M1S2Cdw5h
         +qpgB0rAIDujAV9WmDkpG0717R/xluSu5mHJsb2xShSFoboEOCFsl5i4D4PBAoIhk0NN
         BFbhc2tLTmFkbN0B3NwudhsaS3kpak755sr/CBe/sG4LTQoJRsTa7s3ZQfrGZHKyiswG
         15mg==
X-Forwarded-Encrypted: i=1; AHgh+RqMGtz323zsws2kQ2LJW7heZjIXf0+d72ynkWJiwlUnDDIrHbbLDoCajsNaG334OseDLLjuNtyDU6NzuLJH@lists.linux.dev
X-Gm-Message-State: AOJu0YzLhQNI0ToFPIw1Igp7SxwprtWNLVi3RMKn8X4kt5oKZYWIB/NE
	1xlq4F523msQ3rCvvauwllkbn1/Fx5o/R+zG9eyn8R8BNczmA28KTeD+
X-Gm-Gg: AR+sD12nekstdh3ZZVTBsvhK6WKUIyXaYS086YVD8GN/gcsaCzLRdr0xbcG4NzoqhAi
	WtB3XIqzqgY4A2ZozEjKv0kvqnusGxMMRSfRu397NnK/CDc4CszlBLNt4ww68wVitm++w5VknIc
	Y3QMQVCznFl14rxkMSDzr1L3vRWu87npfXJq3K6zlQYhEWH2PHhYuuhe+x0I7ggd0koOzlVWaZL
	x/Ldl6AdXUsSSq0CC801BWpTEF9sJhyigTz2FQccvAvJbtLhW+pHy/EnG6xLbZBLk0liip39bsF
	FRqKDBKevt5SuRgXWe/eYXDBtYyZOA6Z54dp1XW6H1l7OCKk+X751++t7ANCTW/HW08KEyGHfbf
	DEei1pGS8TYFrFg3Trt6svuUrwqM4VT+YAuwDMOaQN8tlNbJZLJw6ebL4RG4wtY5tEHampguoXA
	1BMv3ydTi27szExUgAu5at1Aa4+WnM30eodZToBadcYqzYJCIMOdajJlZ/WQTNAZfxke9E98rpE
	rEz0cMHeh+zZ4lVNjyoG7ao4Erj6Tp6XoDC7Hj3/Gs=
X-Received: by 2002:a05:6102:80aa:b0:74f:4162:3f58 with SMTP id ada2fe7eead31-758f9494084mr93251137.6.1785469455309;
        Thu, 30 Jul 2026 20:44:15 -0700 (PDT)
Received: from lucas-inspiron153525.. (host110.181-12-179.telecom.net.ar. [181.12.179.110])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-977cdb07f36sm2524239241.4.2026.07.30.20.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 20:44:14 -0700 (PDT)
From: Lucas Jeffrey <luquijeffrey@gmail.com>
To: gregkh@linuxfoundation.org
Cc: ovidiu.panait.oss@gmail.com,
	gustavopiazdasilva2102@gmail.com,
	error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Lucas Jeffrey <luquijeffrey@gmail.com>
Subject: [PATCH] axis-fifo: use size_t for write size calculations
Date: Fri, 31 Jul 2026 00:43:07 -0300
Message-ID: <20260731034307.327377-1-luquijeffrey@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The write length is provided as size_t, but words_to_write and the
return value storage used narrower types. Use size_t for the word count
and ssize_t for the return value to keep the types consistent with the
write interface.

This avoids relying on implicit size limits when handling write sizes.

Signed-off-by: Lucas Jeffrey <luquijeffrey@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 3aa2aa870ea9..d2b30b7b6845 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -214,9 +214,9 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
 			       size_t len, loff_t *off)
 {
 	struct axis_fifo *fifo = f->private_data;
-	unsigned int words_to_write;
+	size_t words_to_write;
 	u32 *txbuf;
-	int ret;
+	ssize_t ret;
 
 	words_to_write = len / sizeof(u32);
 
@@ -257,7 +257,7 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
 		goto end_unlock;
 	}
 
-	for (int i = 0; i < words_to_write; ++i)
+	for (size_t i = 0; i < words_to_write; ++i)
 		iowrite32(txbuf[i], fifo->base_addr + XLLF_TDFD_OFFSET);
 
 	iowrite32(len, fifo->base_addr + XLLF_TLR_OFFSET);
-- 
2.43.0

