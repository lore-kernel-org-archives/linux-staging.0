Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23AD43921EC
	for <linux-staging@lists.linux.dev>; Mon,  9 Mar 2026 23:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773097514; cv=none; b=H76mDtLn90EouZ+EOMC9wmlfx5ybqPDhLfxWOgxqWTC4MnM/Q2oc/oEr6KfQrPtjR5avARl/L8sFnwBo/ytDy+JqHkaEdWOaKWHR+UFphkiHVPIcYiZXNjkndH9pnsxQXZJ4aI8TKYn1w1psHvfsFgBQ0QZbRtxuAOz4kXpc/W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773097514; c=relaxed/simple;
	bh=ca+SDyYmm1t1g2hd+ZFex/RXFFNjE6Aj694+HLupQzU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZEcmqDiL8aoj3ESsmUTjTRWQem0LFW7rEGWOFsKf9C8yFK8HpYFpEd/xSzwJh2RmfsZDf8Iwsoo9A3Z/Y+TB1KsGbyQYvycole+jHaeyP6pDRp+mdjcLjaVhbT8KQ90L1l6B0mWLIPsxOCdkwodpWXGuu6dyIy2y5L6vRvYOwGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EZk4BB4k; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EZk4BB4k"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-56afbcd8adbso2247929e0c.2
        for <linux-staging@lists.linux.dev>; Mon, 09 Mar 2026 16:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773097511; x=1773702311; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EayLIqCrKmuAOgPEtBGDOmJISWy5NxhD06YKjOvpoo8=;
        b=EZk4BB4kWyp/QF/RV9zDnUNKIV5JK9YVgQ1tyjrLsrafRlEhvc78XBMKqO3Z0E5Bul
         PkKRyCcB7gzh97JizMGEmJBOgKdRur1nakJ5YcF6CDmFcb75Rg3k6kBSuONDQQc5BA3K
         Dq/G28NI3kw6mHodfdm6wCfrToFvDA+pVychFjxEDYgBXNu3ki3RGNlIWn6BDfVYVgNs
         7vnl8C9RB3ydMoItCuXP4uEgsdI68aZqSHPdLZO0maPQkLErtYEfptrkD6aT0NsWRzKj
         2SrEkxH8eGj0yLumcS06nPSU1+j5/asazyO0NrUuYBtZb3eidOtHMCIrksfrh24NlxQP
         peog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773097511; x=1773702311;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EayLIqCrKmuAOgPEtBGDOmJISWy5NxhD06YKjOvpoo8=;
        b=AG2QaCBycRwT5dZUR1fR/GfLM7vcKTA4KJDOHhPoRhGCjgqucpiyNBQON+37ZVk2bO
         m15zDjcFOdAsQvFpMRSUCB+coiW4J5QGLIQv2fCnJGtQIOljtaeAPFdmDE70FyQvp6c3
         V/P0Kw8/nHaiHEPN/QnHv6hDLo95y2A037u/MZ3UMGKAEuF9NP906GGyfN8IAFtcSZ+B
         hOGlPWA4M1asN2XwnWiorB9QMnlTDM0bicxgkFEX8gkKVDyXPUZdrhSJeiRnY3kUlq1D
         32wHOR/C+IGCCDkvG66oDBa8d1xv3sMgIqWSqXlpBG0F/tEdxpKqX3a1j98XuxOnQXT3
         yEoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXb9rFbWIT0T+nVPJI/10/YVshVN//28XrtnvT5r9MTP6xa0q0luS6otm1F8RjP2JoWWnhO8vxT8FBqCMMT@lists.linux.dev
X-Gm-Message-State: AOJu0YwzCxKmVMBZzW40mjKUdMA9EWl90W6U+sOJHChHuv72n8wObtJl
	981PFmnOPRSnLdq3syQMNSrXnZytEOIALt1fGWVRii6ja2lnL+CeabX/
X-Gm-Gg: ATEYQzxBI7yauuSs/MiLa2rq5YveHhrA4dpjibAaVj3qmsctbNYSl2qj4jMiHPblLCr
	Ho970bdJSUv7UbjkZdrMzO9O8ZG6oUEpK4F79Dt3P/kVSVsrY9ERIhHtOkpURxlJP25nJZ7wwA+
	uKtrxvveTbDTUwbK7bQfKFC8v77NBZDy1IrTUEuntGI/NJEXs/OIF5M9+cGLCIkceJynafEpcEl
	ZJjzuuFLZnPjp4qKFBWZ5qVTITZYYzo4bgJyUVdM7MTfNqJJP66jMQZ+beTFUkC00bELA7qUXdd
	ksGV1IbZKbo8eM8QqefppIcjAdbRGXY1AD+/MZ1Z03q16FnGQWP+Ka+X1log+UWPebdSyhUF1Vx
	hpqwkIox8+fM2v0al8ehifJRNcQIAr1Rv5OE2/xDvwI2jKQaidV54UTbj8E9mWScH39qKlxNoum
	LIX1KlRbXxcTBKOQ==
X-Received: by 2002:a05:6123:14f:b0:55b:305b:4e45 with SMTP id 71dfb90a1353d-56b07e9d2f4mr4274311e0c.17.1773097511039;
        Mon, 09 Mar 2026 16:05:11 -0700 (PDT)
Received: from horus ([138.97.160.237])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56b09b6ac44sm10441332e0c.19.2026.03.09.16.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 16:05:10 -0700 (PDT)
From: Luis Soza Rodriguez <luistermc789@gmail.com>
X-Google-Original-From: Luis Soza Rodriguez <contact@sluisr.com>
To: pure.logic@nexus-software.ie,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luis Soza Rodriguez <contact@sluisr.com>
Subject: [PATCH v2] staging: greybus: loopback: use sysfs_emit in sysfs show functions
Date: Mon,  9 Mar 2026 17:05:07 -0600
Message-ID: <20260309230507.4931-1-contact@sluisr.com>
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
v2: align backslashes in macros as requested by Dan Carpenter.

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

