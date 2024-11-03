Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803791A7AF6
	for <linux-staging@lists.linux.dev>; Sun,  3 Nov 2024 21:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730669209; cv=none; b=JqIj/ojFj8xSimFuI5nNHlYfW8l/W/yRsGD6EeIjuhuZGuJraI/dFCtJpuV0BFNjUYG40+qFt3YPgyYR3bymGkneVfL6w9VlxTEn15ItGYL/UjZh0D2Vt1p6zX+b7a6QacJfUBQ6buSkfV5mJqnbO4aTD0ByLCWSmsPzmFgj2VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730669209; c=relaxed/simple;
	bh=30iOY8pk90Mkg1P3Owc8Rv0t3FI95lCg1fjDGL8TU0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cfpQGni35q8pCA0bAvdNiseuUzV//dMd0FQY7Wh/r6QfsTBic5b8P1gc3/UbZnN5yjlBdab/ZHwr/5Cf9r12VuRlcMsPSef/Me8Jla6dt6S/NaPceLKRJ7b/R4bExYHncp55+O3LRrzg434xAJjNYdRNyuBbQaErku7iYUnNCXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Md4YhVSO; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Md4YhVSO"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-37d6ff1cbe1so2597794f8f.3
        for <linux-staging@lists.linux.dev>; Sun, 03 Nov 2024 13:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730669206; x=1731274006; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FqBXKF1R/xvCMIz/yq7u82w7wzd3NP6sTl+H7HvVaBA=;
        b=Md4YhVSOx9T03Gm6Zlt8S2hkxiBujFmYXhFRePnJEpEh/to0usbXCALqMpkHQt4TZZ
         ueBQzWCS3jMZ031G+etDzVhFVyILa8clS/nDxP1Lr/WQIqIPwj+yzqsKcyDkG1iIldKw
         E1povvRNvOVDnBUJ12a6y8v/y3dy2LZrP603Rq4rLfwH41FKB+9aXg910IwNU298RDte
         cDP9vWjQ2+hxMpQdWXKMTYEH10oavk8uAnvV2AVmf8MEefelKROmoVdsh4mVwHJke40t
         4MFVh0SCyox4SPENDPzSCXuoHRJARLmW/602dnrGV2QIsNvg5KG+Ki31Rjiq37WzgZf1
         vXDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730669206; x=1731274006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FqBXKF1R/xvCMIz/yq7u82w7wzd3NP6sTl+H7HvVaBA=;
        b=AfZdNm482v7WGwVyUyM7yGmfZ1pQzSPPnX2vXMDO36Z6tqOoggiS08nAP3xc8b96pO
         e0EMV4V/+46Uif6azGq+LMXaN3KkvqilVGbWZYnaVKonA/mcv/oVOp0zHP7wjzVEmBjE
         oB7b1WyWxZMMxGjGIevA9YOleSilSlzr9uoF9ieriiCK7m0I+i67UU54ggFyNMpyFrFX
         Bk2GP/W45RxmvGkTDllPkaNYf+zt228zXzBCUX4EzBfEO0Jd4LZIjfxIZSqRVtOguwYo
         nObCpgpQ+64+rFPtl5PNUKbsMozSSCoWT0zPU+YGIkauojUqD5yO4UdnbqS/vcDmp2e1
         rdUw==
X-Forwarded-Encrypted: i=1; AJvYcCVEUC3cQN42gPEeNSUAyaqSvPs/cGR8hh96AOVjQygtlE3nxQM5Ao5dJJwLk6/zyfB4/q05QBuY2P5lIjgm@lists.linux.dev
X-Gm-Message-State: AOJu0YzhXmCV+d81/9R0upb4vB7d/1sRB36LLChEjs5XWF5FNRLR/kEV
	7eae3LsdH8NNQ4YLy/69Puxh7upxT3ovXb8+egAnc/+l0zHEetr7
X-Google-Smtp-Source: AGHT+IHC3CcsBdgIYL8zNBp6LoDVitIvPZK1ghXQGkZE9j+h2UaZlRuaPPhxVjULi/irhMkxC0ZVHw==
X-Received: by 2002:a05:6000:1867:b0:37d:4d80:34ae with SMTP id ffacd0b85a97d-381be7adff4mr11841424f8f.4.1730669205634;
        Sun, 03 Nov 2024 13:26:45 -0800 (PST)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd910718sm166150385e9.12.2024.11.03.13.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 13:26:43 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: skhan@linuxfoundation.org,
	arnd@arndb.de,
	dan.carpenter@linaro.org,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 11/11] staging: gpib: Correct check for max secondary address
Date: Sun,  3 Nov 2024 22:26:17 +0100
Message-ID: <20241103212617.13076-12-dpenkler@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241103212617.13076-1-dpenkler@gmail.com>
References: <20241103212617.13076-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GPIB secondary addresses can be between 0 and 31 inclusive
unlike primary addresses where address 31 is not a valid device
address.  When 31 is used as a primary talk address it
forms the UNT (Untalk) command and when used as a listener address it
forms the UNL (Unlisten) commmand.
The library was incorrectly not allowing a secondary address
with a value of 31 to be used.

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/common/gpib_os.c | 4 +---
 drivers/staging/gpib/common/iblib.c   | 6 +++---
 drivers/staging/gpib/common/ibsys.h   | 3 +++
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index e84097ac8f69..0285180ae1f0 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -525,8 +525,6 @@ int serial_poll_all(gpib_board_t *board, unsigned int usec_timeout)
  * SPD and UNT are sent at the completion of the poll.
  */
 
-static const int gpib_addr_max = 30;	/* max address for primary/secondary gpib addresses */
-
 int dvrsp(gpib_board_t *board, unsigned int pad, int sad,
 	  unsigned int usec_timeout, uint8_t *result)
 {
@@ -538,7 +536,7 @@ int dvrsp(gpib_board_t *board, unsigned int pad, int sad,
 		return -1;
 	}
 
-	if (pad > gpib_addr_max || sad > gpib_addr_max) {
+	if (pad > MAX_GPIB_PRIMARY_ADDRESS || sad > MAX_GPIB_SECONDARY_ADDRESS) {
 		pr_err("gpib: bad address for serial poll");
 		return -1;
 	}
diff --git a/drivers/staging/gpib/common/iblib.c b/drivers/staging/gpib/common/iblib.c
index fc57e760c144..db1911cc1b26 100644
--- a/drivers/staging/gpib/common/iblib.c
+++ b/drivers/staging/gpib/common/iblib.c
@@ -479,7 +479,7 @@ int ibsre(gpib_board_t *board, int enable)
  */
 int ibpad(gpib_board_t *board, unsigned int addr)
 {
-	if (addr > 30) {
+	if (addr > MAX_GPIB_PRIMARY_ADDRESS) {
 		pr_err("gpib: invalid primary address %u\n", addr);
 		return -1;
 	}
@@ -498,8 +498,8 @@ int ibpad(gpib_board_t *board, unsigned int addr)
  */
 int ibsad(gpib_board_t *board, int addr)
 {
-	if (addr > 30) {
-		pr_err("gpib: invalid secondary address %i, must be 0-30\n", addr);
+	if (addr > MAX_GPIB_SECONDARY_ADDRESS) {
+		pr_err("gpib: invalid secondary address %i\n", addr);
 		return -1;
 	}
 	board->sad = addr;
diff --git a/drivers/staging/gpib/common/ibsys.h b/drivers/staging/gpib/common/ibsys.h
index b78ca5ea4da1..da20971e9c7e 100644
--- a/drivers/staging/gpib/common/ibsys.h
+++ b/drivers/staging/gpib/common/ibsys.h
@@ -16,6 +16,9 @@
 #include <asm/irq.h>
 #include <asm/dma.h>
 
+#define MAX_GPIB_PRIMARY_ADDRESS 30
+#define MAX_GPIB_SECONDARY_ADDRESS 31
+
 int gpib_allocate_board(gpib_board_t *board);
 void gpib_deallocate_board(gpib_board_t *board);
 
-- 
2.46.2

