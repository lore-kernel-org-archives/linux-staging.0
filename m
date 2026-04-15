Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5988A367F3C
	for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 11:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776252064; cv=none; b=unwiItEX8r78p2Ba+ZtLlZXO9Q9CB245773ko58upIlDFk3pWyWwp23BgOjQG1VQoJ4IZAyN519WcIHnB4j5UCwVERNpCmDlb3VV6efaa8eXVyDWHs78ATdz5wxbvhNaISSpt9zISFATsVJ4/swCET4pJmngHuuxCr05K+wDbHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776252064; c=relaxed/simple;
	bh=4q8s68gE50AUTBX5ByZ5704etDStoIxQttjAftpTluo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c/Lr5LQMs8M0unIrgsV4iNgpjGuifqffY46O54mEzwQ3wK3DIDZRF6Je9TUV6erqzAKA/Fa7xAX1KZMGigEOf+7SeyvVObPQMfIQBG7OV0Ckx3TLA0D+97WlK6D1VDlmkEpN0evux3y+OP8MJEy4b+nzwmGyGir/Uy8bNb3zVXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fH2GAFvC; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fH2GAFvC"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-67229808c02so1259052a12.1
        for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 04:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776252062; x=1776856862; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7lgH8IHB2BEbMC4PzGbxkkl5jh/6dQ/P8CyFJN1sen8=;
        b=fH2GAFvCBGbG+Q5OF5M07WlJB5OocUvlRMVk87/xz308MvgVlmCOQkPHdGrpoe3JcI
         SPMxayV1+w1JFv/m8MJHA6XSyL6W0unm2S7lMSlEkaDvqmpBi3DKytEOXq6EuwFtsfwv
         xYQ5ZS0pCABO3x6qSrOj78KeW2fMjj2hfwrV8U3AeOSt34uduWLNU7bdTe/qsJS9Vfu/
         w5oHM4FzLzU9RegVnloohgeklG0qeNTDvKSHmqhg1LHgoEuXIpikJv2Mt5cvTRXg5hI1
         x/oUiBkUJM7XIbCclBd2O9atLi1BGxZXBCtrFheTkG3xJJdLFdu8y1O1/9hVQooQbHw0
         BWHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776252062; x=1776856862;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7lgH8IHB2BEbMC4PzGbxkkl5jh/6dQ/P8CyFJN1sen8=;
        b=ONj8U+6/mNy9/QTmG0i7fvDbEDYvIsUW2TLRw68bQJQV8rkLzzgpoieRQFzdni5Zme
         6Qs2LuCSs9uGvg+dmIO1V4n20TQc1ITM/Hk2BqzAkn8v3TFyMZ1NoHmsflcmMBrZOZZW
         j3VUHmnOUVYyQ9j7D0vjihRoRM69hNzW+ETj+YmU/bIMSiGLnUMxgfsyYD083URK4R3j
         NhaEV3KrqUcnHB5TOlgWIYUp2U4jZjxtkGyo4MnpC7DRZIkKUB/Um4qT75DISaKn8u5l
         m5lRPDFKG/HNu9AZ/ciN731usv4oQPih+Gq3qYm+++YUtdfzZXK4J13rrXa1ezM4AclB
         sUag==
X-Forwarded-Encrypted: i=1; AFNElJ8GlePeDTu0Ea+jWrZGvnJI/LzVeJQTdR78SPfMx0l/wPOhWFu3JlYlBN8c7y0ADVGyXjiiR2qX9oupOGta@lists.linux.dev
X-Gm-Message-State: AOJu0YzPosW2+J4UZ1TBacd+pmG6hitW+9ZLXMCXJ7rxmejgmuRTQN4S
	NDYzksKVFaj/vPzuQgtaTLNk8nsMABQraFy5SGAQsYAiHn+K88QxbCD8
X-Gm-Gg: AeBDievS5Ktl2wn+/b8JPUN4IFrMEYQs8BPlag/9nE5OZXl5Xeoo1KkR9mfUZtUu5vE
	Xkt/ja7uGlvBnfV2kDFvF21EPa6Xk/3K0dCLjoO8I6lYw8pXFBL0BV5MhPMF8fT18L8egSFZ/qf
	52tTAuGIbLgCgaVxDwLxCpmZoOvBxwIXHp+sE7GfMuITXyMqOTgwDI8DvPG3KfNdQGS+n7E8wYW
	ivtB7sDQeGlMOii+fx5577qd/fi/xOXpFslV9gIMqTAswZqSqCr6xDhZ7Wf6HnlHPIk9uXgvidS
	hssuRO/EP1IU3Fpeouhn8BLAXfQXjHfyzlp5+2ft5NuOZ/UnNpmLwcVp4snSuBfCTcPEm5QpPlg
	99X4pzULDr2mMondMTHMZN7v555e7JMqIyuGjRKRSGjNmNN75dbhU5Q1/02DYFI0VlkNB56SrKG
	JWI3LwuBhhEPJbqS8camg/eHPoiofEg9mIT1Yy7KsVtXUqtE7AGfcUpGIzRrDm0uJ4bgzffSgw7
	IjZIp9xRk3v+05wbkqIsLhon1x8sJJ2jmo6//Bf/opnOxytGjrsVBvsA56e4YDusOTRRWnCkV4j
	4nzuXOjz5Wi0ZayjjrcAB5SJdZjLLFhS+OFhUK73l+E96RGhbq1POtBj96OWnacmuYr/NGfqxAo
	SfrVR417ihvzgbZd+SHg/2JNQhaCxxmFAysmwb78o8fQCgGJbXUgNHfSyvlIXwW3RTMe/O2i31R
	kLTw==
X-Received: by 2002:a05:6402:1d4e:b0:66e:5662:2112 with SMTP id 4fb4d7f45d1cf-6707950b1b9mr10446575a12.12.1776252061547;
        Wed, 15 Apr 2026 04:21:01 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-a.c.od237066db22328bb-tp.internal (8.159.12.34.bc.googleusercontent.com. [34.12.159.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67237d78933sm325485a12.6.2026.04.15.04.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 04:21:01 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: lars@metafoo.de,
	Michael.Hennerich@analog.com,
	jic23@kernel.org,
	gregkh@linuxfoundation.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joshua Crofts <joshua.crofts1@gmail.com>
Subject: [PATCH v2] iio: frequency: ad9834: clean up includes
Date: Wed, 15 Apr 2026 11:20:30 +0000
Message-ID: <20260415112030.1324-1-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cleanup include headers by removing proxy kernel.h
header and unnecessary list.h, interrupt.h, workqueue.h
and slab.h headers. Reordered remaining drivers
alphabetically.

Verified using IWYU.

Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
v2:
 - dropped patches from from previous iteration of
   patch series
 - removed additional unused headers
 - returned bits.h as driver only uses BIT() macro

 drivers/staging/iio/frequency/ad9834.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/iio/frequency/ad9834.c b/drivers/staging/iio/frequency/ad9834.c
index d339d5e8e0..465b2fa7a4 100644
--- a/drivers/staging/iio/frequency/ad9834.c
+++ b/drivers/staging/iio/frequency/ad9834.c
@@ -5,18 +5,15 @@
  * Copyright 2010-2011 Analog Devices Inc.
  */
 
+#include <linux/bits.h>
 #include <linux/clk.h>
-#include <linux/interrupt.h>
-#include <linux/workqueue.h>
 #include <linux/device.h>
-#include <linux/kernel.h>
-#include <linux/slab.h>
-#include <linux/sysfs.h>
-#include <linux/list.h>
-#include <linux/spi/spi.h>
-#include <linux/regulator/consumer.h>
 #include <linux/err.h>
 #include <linux/module.h>
+#include <linux/regulator/consumer.h>
+#include <linux/spi/spi.h>
+#include <linux/sysfs.h>
+
 #include <asm/div64.h>
 
 #include <linux/iio/iio.h>
-- 
2.47.3

