Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B30E396D2B
	for <linux-staging@lists.linux.dev>; Mon,  9 Mar 2026 16:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773075328; cv=none; b=AcW73VzidiShPGup7gqEDY4Nqs+ndRJjkIydSsiWbmGSr/eR0WPBH3oR1onDXnB90HUI5UtvR5HtMXF3zsaapId1XK7T/x4u/pTy0arzEM9m8cl4u/Uv8RuLOuXMjfjbNKm5nF0rfiARRHVZpTXETkfa2xE+0y2wzUrGATTKx0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773075328; c=relaxed/simple;
	bh=txkFDzhkAuXn4Y/B9Q37wQHuNsIAMI8pitGZnqd1az8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W+0IuBHDe4bhMDMVoZtCEUIjkDfK9mwPTTw+exaik25dbbevztNuEWTe8I9BXT/h1x3DszmygPAiVoClTtJEQ1PLPSVZDbT2Aj/j9mm3XcGpQLjySmjP9XCwWmoukcZvyKm4SiZAMBCnMEqfNqGBk19MCK3lN4EFdt+SLByR39A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AmQ57ggt; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AmQ57ggt"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-64ad8435f46so11564355d50.1
        for <linux-staging@lists.linux.dev>; Mon, 09 Mar 2026 09:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773075326; x=1773680126; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LaWZMdjFEQ20IaqsZlhzMluUuWd0tbi4PXrKIMmPnEc=;
        b=AmQ57ggtjsv15YcUArs3t7HBfZGLzk4f6YShxA1+WvKq0dQPvKzdY/nuxdh2SmDE7L
         qlzfQCgEaYpsQ052Uet7swmCAxiCpx9a1k4kH58yUUcYgyZN937wPA5G+3+P5/pz68Mr
         EQVQDi4bXgxi0L4PlFg/7Q3EPgPI94GCjCHIqKAml3hwa+lJ0J9c/cz8YkWWG3N1cwgU
         M2nQZCG/UnFNf1kUVkxf42oF8HuGlhxS6jofXNKqpbz6VBPYAOZWnZZO+sb/ASabx00K
         W89izpjJZ1MNotOC9gO1Tf5G6o9helTpHVcC4552Rqx1UoVsJ82B6nUr1e14UIj5LPdg
         K2Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773075326; x=1773680126;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LaWZMdjFEQ20IaqsZlhzMluUuWd0tbi4PXrKIMmPnEc=;
        b=qSAnufIQ7ctdATv+mAOC9B2TdhJzJ5KQncbXufD2BUBXn6hIGgjF4KG+QwrZARN62S
         qUZP7bZ4IkEmw0spt2WMhdAkEKFWtUl3V6LBAEIb23wCjUK/lahbUqJaL3j5zwE6dtJF
         2rS6Jy5HX12Msjrj5kT+lJ+/sns0HnD6rwa+N58X75jLHvwA/5gq0I+LhJR2xeW8CZJZ
         ZsQsneNqOeq/JwWXtiPFwAPnCZxGEN9ApE6gf2Wq4o0yYCHFwg1UtRqWn0+Iq8emjkSN
         6RjfialvpHFcKq2UlVJkn/2NQ+m2WaSy0ROJtUDZZS09FFoAUmTNYX3yzf/cauFyxkc0
         X4pA==
X-Forwarded-Encrypted: i=1; AJvYcCX691Y6tFsLceE1jN18QzqTn/h0uyVE1tY8y2EVbCM0xv3w2LEpszlMcXBtsJ20ymts6Uh+4XU8v2dMQpyB@lists.linux.dev
X-Gm-Message-State: AOJu0YxBI/82wNoLKDc73Yf7M9bg1tOgDU0hUWgLIW+T+B108rUQYiL2
	FZugMWYQ7D/Xtj9IsyYlrPV/xkF0Na/UrKBbejZaAL5LUlXREx5zuofk
X-Gm-Gg: ATEYQzyzxhjCmVlh/lmsEhn0OFXIHmwEm2DaeK9ipziRAi2hPi5hWKSg4htxmAgHh25
	bARTV9ScjTiY1hunm5k9ZbFrjF3Rg2jRdcSpSRFIJm7IT7y1Tvdy+x/IgWqgQ8VReingLBfOzRb
	ugLc/nTFmXtvGn7q973xZcYr/YnwdyyOzHu09ivLBRMRLBY3RPY502RioCfh3I2GuM1T0GIlruH
	1wkj7DNqHq/noW0CwwtpmPyhRMI/cnkDYjyFnfeKZca15ajDEKCzri9oluC2qo0svSm2slbY0xT
	QoY+XKilAh6CEAHQVU5EuH1U+2d/nHp0fMuqJzrA0+yj3/Va66mcm6E72xcIUHWjH9Ho4kj4FON
	YfkShDLYkj2BXlSwfC7BsEMt++YVi5sWA9sXwdc/u4V+OaW88UQqECGqIq/XSeQfYBJgbxhgU54
	Za1TBHdN/snxGSpQ==
X-Received: by 2002:a53:b1a4:0:b0:64c:c34c:60ea with SMTP id 956f58d0204a3-64d1429cc22mr8177078d50.54.1773075326224;
        Mon, 09 Mar 2026 09:55:26 -0700 (PDT)
Received: from horus ([138.97.160.237])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64d175d325dsm4910307d50.4.2026.03.09.09.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 09:55:25 -0700 (PDT)
From: Luis Soza Rodriguez <luistermc789@gmail.com>
X-Google-Original-From: Luis Soza Rodriguez <contact@sluisr.com>
To: pure.logic@nexus-software.ie,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luis Soza Rodriguez <contact@sluisr.com>
Subject: [PATCH] staging: greybus: loopback: use sysfs_emit in sysfs show functions
Date: Mon,  9 Mar 2026 10:55:22 -0600
Message-ID: <20260309165522.26388-1-contact@sluisr.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As per the kernel's documentation, sysfs_emit() is the preferred way
to format strings for sysfs attributes. It handles buffer overruns
safely. Replace sprintf calls with sysfs_emit across all loopback
sysfs show macros.

Signed-off-by: Luis Soza Rodriguez <contact@sluisr.com>
---
 drivers/staging/greybus/loopback.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
index aa9c73cb0..3a502d89d 100644
--- a/drivers/staging/greybus/loopback.c
+++ b/drivers/staging/greybus/loopback.c
@@ -125,7 +125,7 @@ static ssize_t field##_show(struct device *dev,			\
 			    char *buf)					\
 {									\
 	struct gb_loopback *gb = dev_get_drvdata(dev);			\
-	return sprintf(buf, "%u\n", gb->field);			\
+	return sysfs_emit(buf, "%u\n", gb->field);			\
 }									\
 static DEVICE_ATTR_RO(field)
 
@@ -137,8 +137,8 @@ static ssize_t name##_##field##_show(struct device *dev,	\
 	struct gb_loopback *gb = dev_get_drvdata(dev);			\
 	/* Report 0 for min and max if no transfer succeeded */		\
 	if (!gb->requests_completed)					\
-		return sprintf(buf, "0\n");				\
-	return sprintf(buf, "%" #type "\n", gb->name.field);		\
+		return sysfs_emit(buf, "0\n");				\
+	return sysfs_emit(buf, "%" #type "\n", gb->name.field);		\
 }									\
 static DEVICE_ATTR_RO(name##_##field)
 
@@ -158,7 +158,7 @@ static ssize_t name##_avg_show(struct device *dev,		\
 	rem = do_div(avg, count);					\
 	rem *= 1000000;							\
 	do_div(rem, count);						\
-	return sprintf(buf, "%llu.%06u\n", avg, (u32)rem);		\
+	return sysfs_emit(buf, "%llu.%06u\n", avg, (u32)rem);		\
 }									\
 static DEVICE_ATTR_RO(name##_avg)
 
@@ -173,7 +173,7 @@ static ssize_t field##_show(struct device *dev,				\
 			    char *buf)					\
 {									\
 	struct gb_loopback *gb = dev_get_drvdata(dev);			\
-	return sprintf(buf, "%" #type "\n", gb->field);			\
+	return sysfs_emit(buf, "%" #type "\n", gb->field);			\
 }									\
 static ssize_t field##_store(struct device *dev,			\
 			    struct device_attribute *attr,		\
@@ -199,7 +199,7 @@ static ssize_t field##_show(struct device *dev,		\
 			    char *buf)					\
 {									\
 	struct gb_loopback *gb = dev_get_drvdata(dev);			\
-	return sprintf(buf, "%u\n", gb->field);				\
+	return sysfs_emit(buf, "%u\n", gb->field);				\
 }									\
 static DEVICE_ATTR_RO(field)
 
@@ -209,7 +209,7 @@ static ssize_t field##_show(struct device *dev,				\
 			    char *buf)					\
 {									\
 	struct gb_loopback *gb = dev_get_drvdata(dev);			\
-	return sprintf(buf, "%" #type "\n", gb->field);			\
+	return sysfs_emit(buf, "%" #type "\n", gb->field);			\
 }									\
 static ssize_t field##_store(struct device *dev,			\
 			    struct device_attribute *attr,		\
-- 
2.53.0

