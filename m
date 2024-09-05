Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB68BC2ED
	for <linux-staging@lists.linux.dev>; Thu,  5 Sep 2024 01:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725501471; cv=none; b=bHhe8OGvpZZxn20EjOfE3sQAPmf5FNY2ngNiT23vZfIQtlE8FyYo52+XKuzjjWG2TvdWQo3aaDcFySFGvFLd+xYXEouwP3buFSZXD530g9127KKbnwPD25Tm3QWRFuxwPxFRc1hpUxJ8R6i3WMr7jQEt7qIhG5ieRbN7IukNLB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725501471; c=relaxed/simple;
	bh=NcCAr+VxJJaKIWOyK/Q1zc8pDayR8CIrStFdZwJaRYA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=j0IehIJRem7FbLmFK8WkDcaWMLhE0V4lCrMH+5hSMggrl64ZP0Fu1ZD/ep6+6rzhIpj1Iil5FC9UI3+VlK+Ulb+Jhvo1YILyHtTkauwca4Y0CmxuFwm1P9n448RWJTdwdXsPPPmvOHJ4cLdiJ9R0fVRXUpeE2TmSctCDI79rG6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NdsXSxu7; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NdsXSxu7"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7148912a1ebso190521b3a.0
        for <linux-staging@lists.linux.dev>; Wed, 04 Sep 2024 18:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725501469; x=1726106269; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n7kGfxgSCo65vV7XDs8R4AUdpPBvnBCVoPJ54TTdnlE=;
        b=NdsXSxu7W9/mZ5lsLF/8K4TdsreIupAkTc/1g70TSSEZoEs1HCJPcYxmjPYQD4bbPQ
         RFJLH/FNX87NQ+0YidSJ15JkiIHFQ805ysjKy1kmeQ2MdoILO7t4k4FXJN1EQ48GU54J
         OKmWaACn0mIZh5mG5USZBtuu6FUFIg2ZyertalK54jyKIOeYVy4mPE4v6V9cZziOWCj+
         z7mqFDMiwwl2U0NuFzMXkq7p7CSOa733l5Ro3AKwBGV5PR4vwYxn4MkxkMk1g0HqrT8+
         +kanwIVWK6BKeZtjDq9/5LnlKITfBZ5/yUDCyUbehQK/B74E4h6pxc93CYgLg6+N9za2
         Gv4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725501469; x=1726106269;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n7kGfxgSCo65vV7XDs8R4AUdpPBvnBCVoPJ54TTdnlE=;
        b=FnBl3Vg3/lYr9li/O8Bs7tPMHVPWmdFbqID65H3hC0KuP6dJL+cf35ik5PmMI8vmAT
         XqlfgYV6drL/lcXhmaO1iuiKfZunyCyVSm9BoCgVQod+ZvlWTatm0dC37JcpfTqkQVV6
         CwBOGWhURXWtyySgfBv3AFg9irzulZaMclLvrPitlgtz4BaN6ih4qo7hKwNSDREda4gj
         95hVD9fAt9s9TOKtZYV6F/2A5LOEqtuOFz3fUH9prkfzSa9F9FwXXE8YaKPTxma7IRjH
         qNJuntA3bI05+UKK8Q6U/nRhqc1cSQ5zvwXPaZr6O3GotRiJywnIaYRHMyBADat9FWQI
         OvOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPaHcuV1FPVIu6JFLm5rE1fWbOeQGCfXh4w/gk96tfSo9K7NXVa2giKsO/DJ2ORtAwZDdZ4rimHb839dpS@lists.linux.dev
X-Gm-Message-State: AOJu0YxdXKc5my5Ne8pW2pXOAnUQmxy75+pagRTKlf3ie/lHI8usojo9
	8OAw+scD5z94r9BU3xuesTFR8VicTZIlPOesl+INxLXQEaqYVK1q
X-Google-Smtp-Source: AGHT+IH3Zw+QyodS99FAVTsx6c6wJQ+bXdqteUMq9iTmUNbjqzda6Ru4FUyHwNNjoaRslU0wja3byA==
X-Received: by 2002:a05:6a00:1405:b0:714:20e6:1a92 with SMTP id d2e1a72fcca58-7173c1e0e1cmr12875865b3a.2.1725501468725;
        Wed, 04 Sep 2024 18:57:48 -0700 (PDT)
Received: from debian.tail629bbc.ts.net ([103.57.173.143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-717785b599fsm2208658b3a.216.2024.09.04.18.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 18:57:48 -0700 (PDT)
From: Sayyad Abid <sayyad.abid16@gmail.com>
To: linux-kernel@vger.org
Cc: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	pure.logic@nexus-software.ie,
	Sayyad Abid <sayyad.abid16@gmail.com>
Subject: [PATCH] staging: greybus: Fix coding style and syntax issues
Date: Thu,  5 Sep 2024 07:27:15 +0530
Message-Id: <20240905015714.356662-1-sayyad.abid16@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix errors from running scripts/checkpatch.pl, including:
- Added spaces before open braces and parentheses where required.
- Resolved macro argument precedence issues by adding parentheses.
- Corrected trailing whitespace and improper indentation.

No functional changes introduced, just cleanups for better code quality.

Signed-off-by: Sayyad Abid <sayyad.abid16@gmail.com>
---
 drivers/staging/greybus/loopback.c | 58 ++++++++++++++++--------------
 1 file changed, 31 insertions(+), 27 deletions(-)

diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
index 1f19323b0e1a..3e39a90cf86c 100644
--- a/drivers/staging/greybus/loopback.c
+++ b/drivers/staging/greybus/loopback.c
@@ -163,35 +163,39 @@ static ssize_t name##_avg_show(struct device *dev,		\
 static DEVICE_ATTR_RO(name##_avg)
 
 #define gb_loopback_stats_attrs(field)				\
-	gb_loopback_ro_stats_attr(field, min, u);		\
-	gb_loopback_ro_stats_attr(field, max, u);		\
-	gb_loopback_ro_avg_attr(field)
+	do {							\
+		gb_loopback_ro_stats_attr(field, min, u);		\
+		gb_loopback_ro_stats_attr(field, max, u);		\
+		gb_loopback_ro_avg_attr(field)				\
+	} while (0)
 
 #define gb_loopback_attr(field, type)					\
-static ssize_t field##_show(struct device *dev,				\
-			    struct device_attribute *attr,		\
-			    char *buf)					\
-{									\
-	struct gb_loopback *gb = dev_get_drvdata(dev);			\
-	return sprintf(buf, "%" #type "\n", gb->field);			\
-}									\
-static ssize_t field##_store(struct device *dev,			\
-			    struct device_attribute *attr,		\
-			    const char *buf,				\
-			    size_t len)					\
-{									\
-	int ret;							\
-	struct gb_loopback *gb = dev_get_drvdata(dev);			\
-	mutex_lock(&gb->mutex);						\
-	ret = sscanf(buf, "%"#type, &gb->field);			\
-	if (ret != 1)							\
-		len = -EINVAL;						\
-	else								\
-		gb_loopback_check_attr(gb, bundle);			\
-	mutex_unlock(&gb->mutex);					\
-	return len;							\
-}									\
-static DEVICE_ATTR_RW(field)
+do {									\
+	static ssize_t field##_show(struct device *dev			\
+				    struct device_attribute *attr,	\
+				    char *buf)				\
+	{								\
+		struct gb_loopback *gb = dev_get_drvdata(dev);		\
+		return sprintf(buf, "%" #type "\n", gb->field);		\
+	}								\
+	static ssize_t field##_store(struct device *dev,		\
+				    struct device_attribute *attr,	\
+				    const char *buf,			\
+				    size_t len)				\
+	{								\
+		int ret;						\
+		struct gb_loopback *gb = dev_get_drvdata(dev);		\
+		mutex_lock(&gb->mutex);					\
+		ret = sscanf(buf, "%"#type, &gb->field);		\
+		if (ret != 1)						\
+			len = -EINVAL;					\
+		else							\
+			gb_loopback_check_attr(gb, bundle);		\
+		mutex_unlock(&gb->mutex);				\
+		return len;						\
+	}								\
+	static DEVICE_ATTR_RW(field					\
+} while (0)
 
 #define gb_dev_loopback_ro_attr(field, conn)				\
 static ssize_t field##_show(struct device *dev,		\
-- 
2.39.2

