Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8ACC215F7D
	for <linux-staging@lists.linux.dev>; Wed, 11 Mar 2026 19:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773258147; cv=none; b=p0y7dEF5hBqI2HE7ue0CkKDJ9sWgfrl5lCchjy9ZRsz9JZIctEux5aSutfnzDgJ/B6jPMcpBlXGbBYOB5nPrtLyG4zN+czoSvbZagB/Y/mq08IuYPaaElTU/jEsYvWTHhARD1dbHN1ppDoem39I8TDQFhhaDotL/olZQMmveu1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773258147; c=relaxed/simple;
	bh=oZhls62WECpH5MCJqF5x1CqtMXJP+dTn5pvyw5oC/N8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=S5MsagKWdEvtrk0ca3BMhYbNekKg3gpnK+gQVxmz4cnDUqkb1ICERsvWY14XINmD/7o2XAukckh9hQ/00FqjSbI33FIyrjysHBEGTPYIX9AH3KGOithI1OuHSZ8WkfDz+qKcR3jwXUCXa5/A/gLdtaU7Aax9gCJ7wX6MlrWRQ6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Td9ngHyl; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Td9ngHyl"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-35a08ce49dcso174152a91.2
        for <linux-staging@lists.linux.dev>; Wed, 11 Mar 2026 12:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773258145; x=1773862945; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MIt/lxrkvODN0l6RiEURES04wifHtipdKzjIGMWChwE=;
        b=Td9ngHyl38bXIT9igoi4sgm0DJdK8LclyFt1EYiUIWArrNh0Xv9aERNrq9luSvWtQk
         pZjPZ5T7UGeYucfly2FThBEXKmWEtOW+Q2BBP/f/korGJqF3g5wbTQEnU52sU4IKnK9r
         Nzx3+bAyGiAWamcedjYuAcr6vqAG8yMP5oaQke6mdlCjm/3/Qa6hyQx9aWVJa2lSfurZ
         YtlMAxOwUyhbmiWPNm+FEnWPEiw8BKZWrVmf6eiJ04ZI6OuJLOlmSPn1zX3oZymv1fcf
         BfJ1bs240bMhD+Ga+0Aago5c+V9YFiXZ9GNNjfjELJvnCJHN2GsMb9Dg1G+/uZLdLsOr
         vQQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773258145; x=1773862945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MIt/lxrkvODN0l6RiEURES04wifHtipdKzjIGMWChwE=;
        b=gIDWJHC7xV+3areJkdtM2GVnq3hcHjmiVGh8zBfaDr+gIagJf6Cd/Gu62sRp9DsMmc
         Rwm/nizjpBKDopQ/yp7R6zjZIMtJKir9Cd6z/xj/sLjZnYDxND2vPAadv/YJChVFrUii
         vMjBUD+Ip0oy10zMVCquvOYOAmV1viKvvLI9Y2mKxXVgzDuYqWm/26LFzcliO9S3Ro9G
         BSJg2QbEh4bNFcZQ9/HXHcEuUpGTBgMTTBXtYfr0Fo5U1lkq7/cV2INhuEacdXDpg/1c
         DjiAKJ8THjl84MxSN0Dj8hHe+DzlkTNJ9O4Ngx1WD5elyZrh3ENAGnED+FWDtpkAYMUh
         DZ8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVhFvAUoWOkHU8BTz2g2UISX9f1TSO8AlobyqE2tPHqMpqoSrynsr0mNPrtryx6WRt/UjLMbZ1q2Da4Ay4R@lists.linux.dev
X-Gm-Message-State: AOJu0YwJrQW3x7E6497KOmZxj8D0JA7Hr5IKkmHMx2H2eOm8uIf57CrC
	cW+vIMrjbwBKD+4vL7reckWBoFwfzXzf5cLcVWzHj7ZGkpKOgxtGdetS
X-Gm-Gg: ATEYQzyZ8tNHFpHh47xVlZ3cN5ZcHY/apNCIIjYpr3LVNcFAQvR2UEU2ZPzzKi4q5dB
	0HsBg9s/T9H9xWcKkavLB3I4iOw8uvjbOxd1G9f2obGMR0nCTVjWoW8dE0WjPJNN4ibUTu8p4zO
	neHL7Y65RwwE2fA2vbG4ckA6bv42G/XAdooRaBhk42QnX0+rPVkU6DVK7l4PE9PHq74UoGBCbXc
	gLTrprO/HLKhUtsjZA/mtY0MigHRvU4z4C9QjLzxBQF/tYXhwC9AkhTB1P3L0VsbhfKNM+2TZis
	mGTXNUvaUaXz/kAd3MNR8nIccieJvAJgusP0bdgiGWa2EMJBeJoSqOjUuOGkugs0HUtkPnA4p9k
	4xjsawTr0TV5ttcOnsWvgfJwgYV1C6D41F5ivTThFycq3bm6sc67ygHBmwB528lPlmEsPAYk+Yq
	hdPUeMyt1itNmpaZiU48ob1qYCJUQQhFLQtjGvzPWSn1gx
X-Received: by 2002:a17:90b:28c4:b0:359:409:49bf with SMTP id 98e67ed59e1d1-35a0129e642mr3487580a91.21.1773258145140;
        Wed, 11 Mar 2026 12:42:25 -0700 (PDT)
Received: from hyd-e160-a08-1-06.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a02ba23adsm2965131a91.0.2026.03.11.12.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 12:42:24 -0700 (PDT)
From: Rahul Joshi <rj5547884@gmail.com>
To: dtwlin@gmail.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rahul Joshi <rj5547884@gmail.com>
Subject: [PATCH] staging: greybus: uart: replace DEFINE_IDR with DEFINE_XARRAY_ALLOC
Date: Thu, 12 Mar 2026 01:12:00 +0530
Message-Id: <20260311194200.542783-1-rj5547884@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DEFINE_IDR is deprecated in favour of DEFINE_XARRAY_ALLOC. Replace the
tty_minors IDR with an XArray and update all call sites:

  idr_alloc()  -> xa_alloc()
  idr_find()   -> xa_load()
  idr_remove() -> xa_erase()
  idr_destroy() -> xa_destroy()

Also remove the now-unused <linux/idr.h> include and add
<linux/xarray.h>.

Signed-off-by: Rahul Joshi <rj5547884@gmail.com>
---
 drivers/staging/greybus/uart.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index 7d060b4cd33d..bed3f35a6ec2 100644
--- a/drivers/staging/greybus/uart.c
+++ b/drivers/staging/greybus/uart.c
@@ -22,7 +22,7 @@
 #include <linux/serial.h>
 #include <linux/tty_driver.h>
 #include <linux/tty_flip.h>
-#include <linux/idr.h>
+#include <linux/xarray.h>
 #include <linux/fs.h>
 #include <linux/kdev_t.h>
 #include <linux/kfifo.h>
@@ -67,7 +67,7 @@ struct gb_tty {
 };
 
 static struct tty_driver *gb_tty_driver;
-static DEFINE_IDR(tty_minors);
+static DEFINE_XARRAY_ALLOC(tty_minors);
 static DEFINE_MUTEX(table_lock);
 
 static int gb_uart_receive_data_handler(struct gb_operation *op)
@@ -342,7 +342,7 @@ static struct gb_tty *get_gb_by_minor(unsigned int minor)
 	struct gb_tty *gb_tty;
 
 	mutex_lock(&table_lock);
-	gb_tty = idr_find(&tty_minors, minor);
+	gb_tty = xa_load(&tty_minors, minor);
 	if (gb_tty) {
 		mutex_lock(&gb_tty->mutex);
 		if (gb_tty->disconnected) {
@@ -359,14 +359,18 @@ static struct gb_tty *get_gb_by_minor(unsigned int minor)
 
 static int alloc_minor(struct gb_tty *gb_tty)
 {
-	int minor;
+	int retval;
+	u32 index;
 
 	mutex_lock(&table_lock);
-	minor = idr_alloc(&tty_minors, gb_tty, 0, GB_NUM_MINORS, GFP_KERNEL);
+	retval = xa_alloc(&tty_minors, &index, gb_tty,
+			  XA_LIMIT(0, GB_NUM_MINORS - 1), GFP_KERNEL);
 	mutex_unlock(&table_lock);
-	if (minor >= 0)
-		gb_tty->minor = minor;
-	return minor;
+	if (retval < 0)
+		return retval;
+
+	gb_tty->minor = index;
+	return index;
 }
 
 static void release_minor(struct gb_tty *gb_tty)
@@ -375,7 +379,7 @@ static void release_minor(struct gb_tty *gb_tty)
 
 	gb_tty->minor = 0;	/* Maybe should use an invalid value instead */
 	mutex_lock(&table_lock);
-	idr_remove(&tty_minors, minor);
+	xa_erase(&tty_minors, minor);
 	mutex_unlock(&table_lock);
 }
 
@@ -984,7 +988,7 @@ static void gb_tty_exit(void)
 {
 	tty_unregister_driver(gb_tty_driver);
 	tty_driver_kref_put(gb_tty_driver);
-	idr_destroy(&tty_minors);
+	xa_destroy(&tty_minors);
 }
 
 static const struct gbphy_device_id gb_uart_id_table[] = {
-- 
2.34.1

