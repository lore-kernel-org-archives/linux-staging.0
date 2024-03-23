Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44557443D;
	Sat, 23 Mar 2024 06:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711174093; cv=none; b=l0f7IN44JKH8rgR9n5hi9j4SLVw77FXS+Pw8OsaIKQdMulxCa3ndNZ7Iyml1Q2hhuhEKeH+pJsZfGv4MuyBpmPebpVTYF5iN7WW2CDbHKdTuMKqgPmHs9DjO4SEmpUKvzs/ToYdxA4XcsrcUzKm2UXFwmwtermg48ylJETtG65o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711174093; c=relaxed/simple;
	bh=A061M311bWcKVJUUnbDDmTAmuBX7wijJeIlLtRN/XJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M+w1OrfDjRN3RKNcRaszndV6BH5YoGz744GKTIVabFdN30uYan71fgCLmuhoPR6lLlb8dn6uXNBe03FD7qUqFIzsESd9HVF3b/VkbixIChT8XKEsQV6LFQsKY6TjRmyoNcK8HKajzpaLTkoYCuQecY+sQrBvH+3Otr//uvTMeXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sbi+ANvj; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sbi+ANvj"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-33ec7e1d542so1707516f8f.1;
        Fri, 22 Mar 2024 23:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711174089; x=1711778889; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LTfLYfPTszY4IxTtf86oi/uzbGzPl0sBWBERhXVz2i0=;
        b=Sbi+ANvjUeOOaDH7OCZIfjYADbGnwX5ZZ4LMtAYjjeUIeh9WW2/7EIlFMvlR+dn6AL
         s7XJsq15wBI/theu7pcXMDbve98NL6xZ65L8QpAntuny4qaxJPbt3b8VfMrdXFU5uc3T
         uusNPBI+9nsWLiLnL98L7R05mgvYGFOmXRecDQDBVO0t0GF18sitKu58e9hdfRziclBI
         lHzn9L4JVjhidreu5fBHQvqVidqkn61jTzFxEhSCthFWbRFioqBZytFyXpSBHCXUmTLP
         oYyYbMQBq+1TbkLKqIoRJ5lSCc/moj6zpNEWGLDdMy0UzGykq1sVFDc7bPyBjHuifNaq
         WL3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711174089; x=1711778889;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LTfLYfPTszY4IxTtf86oi/uzbGzPl0sBWBERhXVz2i0=;
        b=s7TBamTf6/T04iGpkaLUYpicUY4JOKLW3SKPO7Gh+3PTwH/zCm7JlqE6GUfVQE0a0o
         bieHa8WR2teT19RePvPp9eIj3XmNsKeD0x5+puQ1nwRnAE0BUEjBuAuCO7k9xKuB5hnV
         D0u30QOAzONS0ng+/hnCcvcd7kupmuoF7I4dZDyDF/vXgEssUWWKUXWNXg0F1pTaON4z
         d3q5LTuPcoZ5GLsuyEus7rFjmPdVUUi+PQm6MGPaYHBJwysNYCATItGrsD2L5SsHUTet
         /iRkVRlnPgsQuOB8vREMmdqluevzrk47CAyR3dvb0s9TshJ6jsW3NUz34IhlLRU/vIDk
         T1GQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcbuYPjypDQ4Fp1DZRkVZimo26UyC6sbtMtMue/D9PLxb681dvpoybtmlizicFo6oMkRdCC1vtC009uAny/ozf+fXQOZSX5Zu/slvUtA==
X-Gm-Message-State: AOJu0YxbBBRtpIzHs9MQC01pryujzoMRt19/AV+v4bDpHBJR2E1FI+zp
	02RFjs6hnidU1rjDul9f9oKLHExnjwvAKJyt7wvT9kzVYHvovzYCoLxSwel00HY=
X-Google-Smtp-Source: AGHT+IG6APMQ5kyFm5i3LcQZPi8VXo4S0XM4PdNtSagvA/6Yb3JobCgmHUgjMp1g4eYs1k973S5QxQ==
X-Received: by 2002:adf:e28f:0:b0:33e:6833:8fa9 with SMTP id v15-20020adfe28f000000b0033e68338fa9mr1032710wri.44.1711174089020;
        Fri, 22 Mar 2024 23:08:09 -0700 (PDT)
Received: from MOLeToid ([129.0.78.251])
        by smtp.gmail.com with ESMTPSA id s17-20020adfa291000000b00341b7388dafsm2954989wra.77.2024.03.22.23.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 23:08:08 -0700 (PDT)
Date: Sat, 23 Mar 2024 07:08:05 +0100
From: "Felix N. Kimbu" <felixkimbu1@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: outreachy@lists.linux.dev
Subject: [PATCH v2] staging: pi433: Correct comment typos in pi433_if.c
Message-ID: <Zf5xxbEpFfU5GMiY@MOLeToid>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Correct typos in comments accross driver file pi433_if.c.

Signed-off-by: Felix N. Kimbu <felixkimbu1@gmail.com>
---
Changes in v2:
- Trim commit message and log (AlisonS)

 drivers/staging/pi433/pi433_if.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/pi433/pi433_if.c b/drivers/staging/pi433/pi433_if.c
index b6c4917d515e..81de98c0245a 100644
--- a/drivers/staging/pi433/pi433_if.c
+++ b/drivers/staging/pi433/pi433_if.c
@@ -10,7 +10,7 @@
  * devices, basing on HopeRfs rf69.
  *
  * The driver can also be extended, to support other modules of
- * HopeRf with a similar interace - e. g. RFM69HCW, RFM12, RFM95, ...
+ * HopeRf with a similar interface - e. g. RFM69HCW, RFM12, RFM95, ...
  *
  * Copyright (C) 2016 Wolf-Entwicklungen
  *	Marcus Wolf <linux@wolf-entwicklungen.de>
@@ -68,7 +68,7 @@ static const struct class pi433_class = {
  */
 /*
  * rx config is device specific
- * so we have just one rx config, ebedded in device struct
+ * so we have just one rx config, embedded in device struct
  */
 struct pi433_device {
 	/* device handling related values */
@@ -647,7 +647,7 @@ static int pi433_tx_thread(void *data)
 
 		/*
 		 * prevent race conditions
-		 * irq will be reenabled after tx config is set
+		 * irq will be re-enabled after tx config is set
 		 */
 		disable_irq(device->irq_num[DIO0]);
 		device->tx_active = true;
@@ -923,7 +923,7 @@ static long pi433_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 	case PI433_IOC_WR_RX_CFG:
 		mutex_lock(&device->rx_lock);
 
-		/* during pendig read request, change of config not allowed */
+		/* during pending read request, change of config not allowed */
 		if (device->rx_active) {
 			mutex_unlock(&device->rx_lock);
 			return -EAGAIN;
-- 
2.34.1

