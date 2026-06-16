Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E523318EDA
	for <linux-staging@lists.linux.dev>; Tue, 16 Jun 2026 19:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781636835; cv=none; b=FMoa6WaGUyemnjDO/Rr7RQWmbqHA3WXpPJePp+LCeh1Ke3y1WogUOWy7eUgfA1a6QYtS5bs8eHSgJ1FGTJkmcjiSfvkf28Xzb0qTvF2Yz8JzLkzoYWyXtx5HKWMtOfWXUEAIy1qeTKcSpWELPQwlL+sA3mnQmF+1axhybQNLCRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781636835; c=relaxed/simple;
	bh=04Cjf7RlswRtnaUagf88940rGca8UFcjVUYulfqv5IY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V1MZqup7nTRIxF/x17uU5Lf4n4PB6QbRymxkwtILzOVSrodPUNto/mZzRj9kxm2R1sfiNfpDgingRBefvd/27v/LbYaXQVMUMrlW8Y8FMO9AHBF6d6ERAgvw6bqFBSaXmPrCS3uSglpN0HCowxgnFsiU2/TTazrn8AEol0Mb/vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MoVrPwDY; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MoVrPwDY"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c86214eead7so83262a12.0
        for <linux-staging@lists.linux.dev>; Tue, 16 Jun 2026 12:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781636833; x=1782241633; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tzZlidm2qPXvg0e3PNYKFDx1qe9VwZ9guLj+3iKFXvk=;
        b=MoVrPwDYacnxIkDMXwF37YdQgmCSYyEwroDckFsordXV/2BwF0apIZ9juBOYZZolUJ
         JUJEZXC96kNA42LVr/PBuqCtAVONvLrWRvLWxiKDwWACIT5PIimr6M7XC3mg5dI2JWcQ
         dPhKb64S9ShfDntGjV0mg/5Cdcjndmj/C8aBu3BKAbCkYstOtRQuVSFUjrtu65U6U8vc
         +A/Pv7c63L2muoj4GPDqAyAG4YxMw/WscgyFNyJD13g1tqXPhi2Cx+DOEVcrdIzCB3tH
         fMQHPqnDXo02+2qjudY3VHbQbAdX1TD+aMD3OSE1/34GArvrkUvl12Fwy0zBne7hrp2l
         VcfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781636833; x=1782241633;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tzZlidm2qPXvg0e3PNYKFDx1qe9VwZ9guLj+3iKFXvk=;
        b=e/tWyZ6u2Z4D9ojFIZwsO86K54RnMKusKEUqKQHwVswBpbg6wbb+EfnkjboW0WUIfI
         23rZfh5NvpusKV8oQBGBIxC/E7ao418FGhS0aIQjisukv0e2rX0nmecPglpxAxENEF8U
         DkGth7p6AcG39O7+n6xGNC+YYfcmX5DxWt1FjaCiykzQKa4PmeTZsOcfb3oPm/jMe+G6
         iwXS9DohGmkeAqsm62bDKB/RTIppWWRJ2vlRET+JYIeyr69y3C0hfQMZzQEPMimrFinD
         ywtKoImBA12jaR0ThqhInQi8ldDSOWwP6S6xYEeBZuQOv7u99MdJaWIElBKBQwPtPSyS
         Om2g==
X-Forwarded-Encrypted: i=1; AFNElJ8+rcV4BBp5yT9rIfcp3Ukr22xqfwQk/ANq8+fj3bltxCR+mlmUdDTshPUXoh5P9Ng+oYwWkHAdpL9MIU/f@lists.linux.dev
X-Gm-Message-State: AOJu0YzofKdO8/QJmuEgNbRzM44m8sGOcU35I627BdQINOXEy7x0h+VK
	2StM7JIk8OGJdEMjXnl94r1Bt9k67CnxjXuUiFDVV7GI9sM7/XDpGrLB
X-Gm-Gg: Acq92OGusX0CZ+xWKN5wjbc9feX2klDXZKJyoJqBQq9bVoiDRZapsCXgyyI5f8gH3Q0
	uBQpA0iTO/8X0geS+gnkVVTLOB+ZAnDDcRNRfKgMqz+dNp2Jc5aLvmqKNrRdLhtKKbaAZZRY9PS
	brugQ4mU1g+zpIo2ZTS6BIm4b0qiaezf7blj5pg5XMehQoDqbOD6dWkAMWO3uaDOF6v88f2OdlI
	kMTzsbei/QeGKwMEatdD8oQ0QIJuws8wRnz3Kix+5F81NwdOpdfCrdvPdZCm0pMt7wKfGRbFvrk
	NcV8QxzXU+Z+pzwgwk+T5eL+zAsFO4Zgj8VxdIdsDH6P35t81WQpD+/kLP6JWVbP2nUpsxht6nq
	E0ACodJv9sYdfETtGP+aiR8F+l2idavkxFq3Q3MbrSF7vxGq4mjzsp6eudpzI3yBCysHkK1uTT0
	nufvOb/U8cli4gbHogDLRg2p9V4J81NeaRZXvGHLw5YAOgODTrkDAXgHAKOA5gU3/0Myq2/CZo0
	vrvup9bONUrettUFIkrtyuhXmm9GOotae15F4tfg7xI4/X9mTpf3HS7xplTt06LE5UZnixMYQ==
X-Received: by 2002:a05:6a20:4329:b0:3b4:613f:90b1 with SMTP id adf61e73a8af0-3b8a8e39cecmr813920637.16.1781636833301;
        Tue, 16 Jun 2026 12:07:13 -0700 (PDT)
Received: from bloom.localdomain (S010680dac2bce256.cg.shawcable.net. [174.0.186.197])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434accbc89sm14125521b3a.15.2026.06.16.12.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 12:07:12 -0700 (PDT)
From: Jack Lee <skunkolee@gmail.com>
To: dtwlin@gmail.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jack Lee <skunkolee@gmail.com>
Subject: [PATCH] staging: greybus: uart: replace IDR with XArray
Date: Tue, 16 Jun 2026 12:07:03 -0700
Message-ID: <20260616190703.28411-1-skunkolee@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DEFINE_IDR is deprecated in favor of XArray. Convert tty_minors
from IDR to XArray, replacing idr_alloc, idr_find, idr_remove and
idr_destroy with their xa_alloc, xa_load, xa_erase and xa_destroy
equivalents.

Signed-off-by: Jack Lee <skunkolee@gmail.com>
---
 drivers/staging/greybus/uart.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index 7d060b4cd33d..30afcd0caa14 100644
--- a/drivers/staging/greybus/uart.c
+++ b/drivers/staging/greybus/uart.c
@@ -22,13 +22,13 @@
 #include <linux/serial.h>
 #include <linux/tty_driver.h>
 #include <linux/tty_flip.h>
-#include <linux/idr.h>
 #include <linux/fs.h>
 #include <linux/kdev_t.h>
 #include <linux/kfifo.h>
 #include <linux/workqueue.h>
 #include <linux/completion.h>
 #include <linux/greybus.h>
+#include <linux/xarray.h>
 
 #include "gbphy.h"
 
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
@@ -359,14 +359,13 @@ static struct gb_tty *get_gb_by_minor(unsigned int minor)
 
 static int alloc_minor(struct gb_tty *gb_tty)
 {
-	int minor;
+	int ret;
 
-	mutex_lock(&table_lock);
-	minor = idr_alloc(&tty_minors, gb_tty, 0, GB_NUM_MINORS, GFP_KERNEL);
-	mutex_unlock(&table_lock);
-	if (minor >= 0)
-		gb_tty->minor = minor;
-	return minor;
+	ret = xa_alloc(&tty_minors, &gb_tty->minor, gb_tty,
+		       XA_LIMIT(0, GB_NUM_MINORS - 1), GFP_KERNEL);
+	if (ret)
+		return ret;
+	return gb_tty->minor;
 }
 
 static void release_minor(struct gb_tty *gb_tty)
@@ -375,7 +374,7 @@ static void release_minor(struct gb_tty *gb_tty)
 
 	gb_tty->minor = 0;	/* Maybe should use an invalid value instead */
 	mutex_lock(&table_lock);
-	idr_remove(&tty_minors, minor);
+	xa_erase(&tty_minors, minor);
 	mutex_unlock(&table_lock);
 }
 
@@ -984,7 +983,7 @@ static void gb_tty_exit(void)
 {
 	tty_unregister_driver(gb_tty_driver);
 	tty_driver_kref_put(gb_tty_driver);
-	idr_destroy(&tty_minors);
+	xa_destroy(&tty_minors);
 }
 
 static const struct gbphy_device_id gb_uart_id_table[] = {
-- 
2.54.0

