Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCD9325704
	for <linux-staging@lists.linux.dev>; Wed, 12 Aug 2026 08:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786524735; cv=none; b=jbvmLxPS8N1IzlnEW4Qxv2+fcDEgtxalI35EJRqHGMQgce8FnIEe2n69XfIyYDMrWkBKQR5sC0xyPLFl6BDA4McSmJNczIkaPySwQL6Ve3qidCSNXx3qPGzPizYl3nM6j2VyjeYuh7fZTQSt/38T9qsskTrgaFCAOjm0z7STmTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786524735; c=relaxed/simple;
	bh=+0xAuCLBDC5xjgD/Ro/yAaAIkXx5712HXKvTSxL8b/U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u9j9SzJ0yD3oT/JuJy8ceUUvX249XokXDqN3T5qRUZJPF2irfO+WD8DAWi5gjEzT542qaKjWwZAp/UgLbZiGOoO1wn1qrSvomNiJBwJOt/8yB43pz0vie/p4BjnKDEsTXD5M/JTA5bGivEOKvsPQzvNR6KYYWtyqAbMBV40ba/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XkHmOCqx; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XkHmOCqx"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cc7ef7ec27so9463895ad.1
        for <linux-staging@lists.linux.dev>; Wed, 12 Aug 2026 01:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786524732; x=1787129532; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hEcl3LGAANT3DT4EdKMxprIzXUC4zQv09hEDAYBLKZc=;
        b=XkHmOCqxeHY7Jp2SVWL0pGy/8P/OUX6Kf6Oc9EJXV96LAauT7oA4gUKnoNYTTwUsCN
         uZ43/I2vkApkzfqxGvuQBfAqpJQOLfifNvG2kfcF3RrH0V7LKSxq1X4Hb/NaicFlKgw9
         kCPiEv0JfGzaCvjpDsnLEd7V1TCTZRGDaOiqQtSfCML61t+HEBvb4IpE01k/tAG3tX3D
         4X8iqUWxSngeJYktg2crcJZMk116NgQ65fnSJ6kGPsK/E06KQewo+An3tOQOdTd0gW2L
         +pe7csQ84Q8QzN1rWTDFRSmbgvTnC7AREh18zuHOxtyah+b1l1/wkMfKo31oKtib7k5a
         5sBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786524732; x=1787129532;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hEcl3LGAANT3DT4EdKMxprIzXUC4zQv09hEDAYBLKZc=;
        b=l2pdlmNcbpmRDrl4ikoiiGYeIG3o67DN0H3tAU9McPOcT1Zkzmax9mLmZfxK7zi0qn
         yHGaXc+qIsuav6ELZ2yjl86Mv6Ov9NBxjp0VFCvi2kN0dtV0e7KbJcKX9mSEcYlGLmm+
         vLWzD0HU2gwDAMwAOLIzrCmARBYHuk5TyuAg0G3uhzvNeaHEwUIUvERWDEGEhN4NLhFF
         pG+HSSuxHc56CV+8F+kMhdhUGiUWQ6Bndt9HcnmM2OdY0x+eb6dpzeZxSavku8qOP8hg
         i/VHkdqz+Aalf5WvEUw/04SeD02gthHF5o/bCOfowiyvf0buUfznDQAFNWI6f7uIWPPG
         4p4w==
X-Forwarded-Encrypted: i=1; AHgh+RqoSS+9aWL5k2iIWkZyt2GtWK3kMxmo2WVysArbu2l27ZKr8TRoxpbbtdEt6/DREegD/EOJcWsJpuZ5gzmp@lists.linux.dev
X-Gm-Message-State: AOJu0Ywt8oEPSDOayDrBJlndEWbZu/OgsRHWDTwkcH7LSbWd1etMpXhl
	zuvHONfxkh71v/3A0jKH4rax4fuHVoCVyLH+A9CvzPHa6Db7ecYapY37
X-Gm-Gg: AR+sD13ud+Q9KIX8DadG3dftGvELeHa+Lk8CYU4chRB/DTwRXihv9wAMaqUA/rb+Aoi
	09bZzehzNBrbBexhc8nJh+LOKhmGFHZgkid0LonfSaLLyKspTom3uFeCFVqhq32DL2HWJAXXR10
	OzvolCqFw1BFZ6X5hLsODJbWL2bLZoMgTqn7MYGrTUj3ldFdv9tqhEpTz/KLz2h8hJ81Mk3wKtq
	pWb9x1/Bi/jrGZzgkMKsP6Z2/enAGPeLlVT8SRE9TIS/aKjNDwyHyKlRQNhAPLhebbLGPVXaGBB
	P+axt/VMhKn27cJkJjpSGenTrw4524a0+7CCvUven6+xRhuv3IM/6rLTMNqNRSNIcz7G7SQTELY
	VF8/6dN+11+xEvHtjSEPzUgQXs3uplwfm8eLId4jLfMsDmsmRRjQtMdYAWj+e+x3eqVVBGYXRih
	txvuNYLz1ZYa04zsP9KULDFtPIBCnLUTZ93vohL3UmuQ9+FIarmPhay5CQovuvIwazyjA=
X-Received: by 2002:a05:6a20:c90d:b0:3c3:89cf:f3a with SMTP id adf61e73a8af0-3cc3f53694cmr3814066637.5.1786524732399;
        Wed, 12 Aug 2026 01:52:12 -0700 (PDT)
Received: from localhost ([2401:4900:83a9:ec61:7129:9a57:4b26:1066])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31cf7094c8dsm9037138eec.31.2026.08.12.01.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 01:52:11 -0700 (PDT)
From: Raushan Kumar <mitramaurya80@gmail.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>
Cc: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Raushan Kumar <mitramaurya80@gmail.com>
Subject: [PATCH] staging: greybus: add missing newline to sysfs_emit() calls in audio_manager_module.c
Date: Wed, 12 Aug 2026 14:21:17 +0530
Message-ID: <20260812085117.103875-1-mitramaurya80@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sysfs attribute show functions are expected to terminate their
output with a newline. Add the missing \n to the format strings
in gb_audio_module_name_show(), gb_audio_module_vid_show(),
gb_audio_module_pid_show(), gb_audio_module_intf_id_show(),
gb_audio_module_ip_devices_show(), and
gb_audio_module_op_devices_show(), as flagged by checkpatch.pl.

Signed-off-by: Raushan Kumar <mitramaurya80@gmail.com>
---
 drivers/staging/greybus/audio_manager_module.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
index dc90cc2d2308..5737f2a32f5a 100644
--- a/drivers/staging/greybus/audio_manager_module.c
+++ b/drivers/staging/greybus/audio_manager_module.c
@@ -75,7 +75,7 @@ static void gb_audio_module_release(struct kobject *kobj)
 static ssize_t gb_audio_module_name_show(struct gb_audio_manager_module *module,
 					 struct gb_audio_manager_module_attribute *attr, char *buf)
 {
-	return sysfs_emit(buf, "%s", module->desc.name);
+	return sysfs_emit(buf, "%s\n", module->desc.name);
 }
 
 static struct gb_audio_manager_module_attribute gb_audio_module_name_attribute =
@@ -84,7 +84,7 @@ static struct gb_audio_manager_module_attribute gb_audio_module_name_attribute =
 static ssize_t gb_audio_module_vid_show(struct gb_audio_manager_module *module,
 					struct gb_audio_manager_module_attribute *attr, char *buf)
 {
-	return sysfs_emit(buf, "%d", module->desc.vid);
+	return sysfs_emit(buf, "%d\n", module->desc.vid);
 }
 
 static struct gb_audio_manager_module_attribute gb_audio_module_vid_attribute =
@@ -93,7 +93,7 @@ static struct gb_audio_manager_module_attribute gb_audio_module_vid_attribute =
 static ssize_t gb_audio_module_pid_show(struct gb_audio_manager_module *module,
 					struct gb_audio_manager_module_attribute *attr, char *buf)
 {
-	return sysfs_emit(buf, "%d", module->desc.pid);
+	return sysfs_emit(buf, "%d\n", module->desc.pid);
 }
 
 static struct gb_audio_manager_module_attribute gb_audio_module_pid_attribute =
@@ -103,7 +103,7 @@ static ssize_t gb_audio_module_intf_id_show(struct gb_audio_manager_module *modu
 					    struct gb_audio_manager_module_attribute *attr,
 					    char *buf)
 {
-	return sysfs_emit(buf, "%d", module->desc.intf_id);
+	return sysfs_emit(buf, "%d\n", module->desc.intf_id);
 }
 
 static struct gb_audio_manager_module_attribute
@@ -114,7 +114,7 @@ static ssize_t gb_audio_module_ip_devices_show(struct gb_audio_manager_module *m
 					       struct gb_audio_manager_module_attribute *attr,
 					       char *buf)
 {
-	return sysfs_emit(buf, "0x%X", module->desc.ip_devices);
+	return sysfs_emit(buf, "0x%X\n", module->desc.ip_devices);
 }
 
 static struct gb_audio_manager_module_attribute
@@ -125,7 +125,7 @@ static ssize_t gb_audio_module_op_devices_show(struct gb_audio_manager_module *m
 					       struct gb_audio_manager_module_attribute *attr,
 					       char *buf)
 {
-	return sysfs_emit(buf, "0x%X", module->desc.op_devices);
+	return sysfs_emit(buf, "0x%X\n", module->desc.op_devices);
 }
 
 static struct gb_audio_manager_module_attribute
-- 
2.55.0

