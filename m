Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6355933D6C0
	for <linux-staging@lists.linux.dev>; Sat,  1 Aug 2026 20:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785615952; cv=none; b=S3fw/9KG3XUs4ZGxDWNB8Vb//L+4QRDKVy5zFvpMJbMk17A0IlcdKoUdFgFFfdewa6P055gr5s9CqI58yteeufSmVI1uB40PkOU2i0mG2KdkMVsdHLphM0ftxQWv+wMw61nJLRXdkdQuc5Tsf/EBW7JYiTvP3F+3u6RFqCnea2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785615952; c=relaxed/simple;
	bh=pCjYNayxI9syJzaaxW7CNiL4uxap1yIW8egnNPUyTZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eslUdTHTA368UgojjoBrjDbMVX96AeRLiQfVTTS3X9Cncqcl8XkjPe0EFlTWbG2t3yYcJNIbAB4MvRSqzOQFJxmTkh8afm5HG3knRaz8uYf1lWiJZBU4AZU/ymQVM4Qrm0veVmFrZv9HxVr8Hvpjcauor7UStN9riaA63t/tbuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oln/+k25; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oln/+k25"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cacf197759so30958905ad.2
        for <linux-staging@lists.linux.dev>; Sat, 01 Aug 2026 13:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785615951; x=1786220751; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pa/H7W6muPB1BDZxr43f+z7H5KetpG9U5OYnXCT8xys=;
        b=oln/+k25ULv+Rw9FCPcBf77hZHu0j5ynYvJNBDr4kylZj3ZF4CKE0W1GliwpsZP/VG
         K9nYbvJZgX8g4eH6BgPjswfTVYN4zWjqL44fx9A6y/Vc14Aqf6z3dolr9SUGwsTxQ4fX
         oKrhZpkv7UrZglniU1VkbEISZaeBU1bF6tq41Fggi0ob+VUWs93vJCeCOctngSLh4Hs+
         oYR+DUOq21QBDGPjx33D5HYvxWDEsqtWONW8tVKt/MiRvvqlrJpLqlbQb5EH4Y1GGOGf
         u5LyPVJIwGrkV5sH7/9ueMcT0Frh2NakoX164xb9v9+QElNNS+opWBh7y+pX8W1pavyg
         GzBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785615951; x=1786220751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pa/H7W6muPB1BDZxr43f+z7H5KetpG9U5OYnXCT8xys=;
        b=f793oIaHnSS9L6AN1JYNwEjt9r/vI8trbuc1FfSAe0hQ/Z6Hsz2L68tVMZeFZUr3Qv
         hm+IZ6gF4e5sCWZ0DQgyW9Q/lFySjMCfJNRiVg8jOHhNji43BMLOdCJxLdhpB19H30x4
         49R1DhO6dNxFptBz6hdvFM01W/9xp7ZZ5fZWzdyCBUV5BWbR3J4CQR/Gic7Ae2ldSqLA
         ITR3nEphl5aaRJcwWQpPhdOhUsZR1LZvBe9qOjCPEIcaI5iJFa2fzmZWRPSU0sPWHZGH
         f5AsuEms8NR5rDc5WRcCEpmMgrS/BcTc4k4ErHxJCnkuRyJ+D/VcbzEe2cUt5fkTSKvz
         oaWA==
X-Forwarded-Encrypted: i=1; AHgh+RqZB43uM3evWZPxbgfz15m77mqpHDi0Oh0O5EKa5lmMyT0Rsxhb/wyV7CNkieUPYFDfLZov3l9OvMmtrO3s@lists.linux.dev
X-Gm-Message-State: AOJu0YyKEBd6LB7Vj8xfXUuoMlZVauBn44m5O2cnIGsXneu0PywauyBE
	aH0Bv+mXSwE2yS9tnFHmc+upfMh+o/FKOli1/BRqgEYVj5ncn9vQ+hID
X-Gm-Gg: AR+sD10sI7jbCb+A5NM9UOtF7ztNxpHOBgMZD5vpgPbTEWKOwyECvJ5WM0iTegu5g29
	WZod1MKOVXg5Fp8G2DDqUOXnp107ygIBwoxzjtDzhr+UHucpQmIzO+jFcwwzpjhjVrDKkFcJVQq
	o473cIkJ8QMRu8hA9ImR48HpivzMvUiH+dHj9biMP6DkhD8Pzynf3ikoGQ3MH8MQp47wcs6afoC
	0XAQR30fPl/SJb7BnfOLkSf7Ed46wuIjptsidbbTd4gYGJpTRafZnoteYbrhp4UrX/kg8GpNJ8a
	CyyybKuviluEZMecJD5spkcsZkhIw2Vgx0iG5DxgLWs43v2rliHdqJdBngdzGpR8heFJkYM8PMj
	nPKjpLevvZ0G9fgussHOpTjgRe80SGvAIfhmw2EsUROsERFIuY5w/Zr6blofFyaQ3WA1IdEEbCm
	fUlj8XyKVgKFpppj/UcT5ElCcuRUjBKvfM71ACwBwFQdkuEZTCkACRdj6Iyu7fm5dkH2xj7JVxS
	GiIcIP3gAHB+6/SRchBWbWn
X-Received: by 2002:a05:6a20:d809:b0:3c4:2eb6:c3a0 with SMTP id adf61e73a8af0-3c92a63ad0bmr4263180637.30.1785615950737;
        Sat, 01 Aug 2026 13:25:50 -0700 (PDT)
Received: from Debian.tail44843d.ts.net ([183.82.161.178])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4fdb80sm14894116c88.15.2026.08.01.13.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 13:25:50 -0700 (PDT)
From: Mirza Ishan Beg <seedandsyntax@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	seedandsyntax@gmail.com
Subject: [PATCH] staging: greybus: audio_manager_module: add missing newlines to sysfs_emit
Date: Sun,  2 Aug 2026 01:54:34 +0530
Message-ID: <20260801202435.5131-1-seedandsyntax@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes checkpatch warnings: "return sysfs_emit(...) formats should include
a terminating newline"

Add trailing newline characters to several sysfs_emit() calls to comply
with the requirement that sysfs output buffers should be terminated by a
newline.

Signed-off-by: Mirza Ishan Beg <seedandsyntax@gmail.com>
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
2.47.3

