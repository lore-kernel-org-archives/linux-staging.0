Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09FF1C3318
	for <linux-staging@lists.linux.dev>; Thu, 25 Jun 2026 09:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782378914; cv=none; b=nshhj0MUWJu4exKZgz9vx7jzvKLQDRj8YuULqczlSnG8fWY2fMGO6SpvRrfar+gDgG9tgEVqdV9Mq55kNtmZSVQF9QKIjF101zNUZR5RpsxV76hIsUfYNgaGI5YxMjjjn67K9sK1nShKoJXUtps/DUKdFfjJzdNeKSAcXhkllP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782378914; c=relaxed/simple;
	bh=E8PHgqjTnbM1bZpr1H2WyqsDy/f1AfZEbh6xrn7Adq0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HgQDsMRRqOH8AzWxlj3eb5cEwJSdlZUT7F4VpIRG1PcYlpX31l9oP8P1ofWhqpTuAwr27C6B6zZFZYEbO6SgD5Im7GrwrXfaHWOMX9xC1zIKAOklvSnxp0Or7TYx/lytRIjVXYw6XyNuy5vQCEF6yRQ03BLV9HWbFHbC/L7wpSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qkS5uOK4; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qkS5uOK4"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-139d5c9a495so2912755c88.0
        for <linux-staging@lists.linux.dev>; Thu, 25 Jun 2026 02:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782378912; x=1782983712; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XYPMam/tRodxN/Tm8mIWsdZqWcS5VypETHSh8DycrZU=;
        b=qkS5uOK4HoSYevUzs+6qnd4fnSrcoJvqvBuTxcCil9mXuMG+2GQDdSpCnwl95ui/L+
         XPo+H8YhaEWDjkhhTx03/SC7Gp1q68U6Weed/t9P4qGoUYKiaOJH4r/c5eHtuXevtOwW
         NXfjXfuFYX9AzZj5zrInCM5C+6j7U6Yv8hrvB0Km3kW7UONFcO8837xaDOtHyB/kQs5h
         9S6KVUd0p97ZFkHqwNdWI7BKLUjfMeDDD247trlrAaWx9+6xGlKgA7XPtbwZq5iM8K1t
         orl/edRz9eau6hi9C6Da1odGAAa7xW67PWCbbroosZnVguvD0Dxl5hgdEEsj40prjWAr
         TE/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782378912; x=1782983712;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XYPMam/tRodxN/Tm8mIWsdZqWcS5VypETHSh8DycrZU=;
        b=Ijm1OlMA2GEnRLlg6/Fq8Kh6NMswio97KGq6Twy+2Fn11pwaiUhnvhQn8ZjdS/6T4s
         9ogDvdd4MLKrgMeMIbOt5aowK8t0T403LCBXuMNWMP3bvFzVn0yY5cw2vLGjq8kBxt57
         fl45vI4fTwe2e9fPnMUFEqNoCdzE68weKPBJ9GK7NPXkrITV/BCbALvUDDUrOjWQ84ml
         IEoIyYi5avJjYbz2rv9Z8rdZDAxqZjZBQLh4G6fl+TqEsQNObW1n1gsW1qr7cvDHna7m
         /s5V0kXcHLhyyTU5QZuffhTxQYKxV0ooM3wUZbbXj1uK8xq+Lvp8nptQrlKp9xLAeuPg
         WwTw==
X-Forwarded-Encrypted: i=1; AFNElJ+xXQWPQg5m93wDk/pH6OnX+dJjmpjw18ZNZjgOb12WCuviDJEGBegP98W6Ca3LqquYzg7hWzUBwlrfLGyt@lists.linux.dev
X-Gm-Message-State: AOJu0YwJlqFvGuoqEKb8rDE0J7UZ+DgR+2Iu+xKk4o807CP8Z8iBYtwC
	ffeWQWHiBJbDK8hbBSrbZ/3rEaCY7oZ5C+7mqyds45D2MxbAoxaltr+D
X-Gm-Gg: AfdE7cnEtghiW0OXS97aBDEs/Ek3desJYuQ3cd971vyrZcZDOulh6e22to+Y+aEhG3f
	KgH42a0ehmPnb0oMjYmBMOaTMyHN2kui4W8sKYYhdqefWEHE29Hnyi+v/zFr0KGBLJu9Ace5rkV
	zaXSiJ7bgaGawCy/ZL3oIbGnQ3Ev+QDFl+wt169RF+U+E18ozWbg5c6fXzxY+umY5BDZlO8aYN/
	4UH3N7vBvvzzoyTdecEa1AFcrxkTQGA0NM1izQIxTkAqW19CF0p7oghmGwAaloCt+nHwAigWLlt
	EJdyq3ws5hPa5ARVO/7ULluGbXof0tg7DtkSA3QOwjVMbY9J8e90sDM2aB+WgoNK5VStEe3d8QP
	0mVIN6FiJWYeL+NCj53Q6EaLwjP7fV8jD/ZMqv53RhAeTykl6GHuWgIN6Mxurcz9ECyYQFTqnAL
	xi9i5yA9cXfltrThJw+C4h7iHw7zHmxCdK2g==
X-Received: by 2002:a05:7022:ec82:b0:137:f0d8:4ffe with SMTP id a92af1059eb24-139dbb5da1bmr1566450c88.36.1782378911800;
        Thu, 25 Jun 2026 02:15:11 -0700 (PDT)
Received: from 10-86-27-11.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d912197bsm10118616c88.15.2026.06.25.02.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 02:15:11 -0700 (PDT)
From: suryasaimadhu <suryasaimadhu369@gmail.com>
To: vaibhav.sr@gmail.com,
	mgreer@animalcreek.com
Cc: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	suryasaimadhu <suryasaimadhu369@gmail.com>
Subject: [PATCH] staging: greybus: add missing newlines in sysfs_emit calls
Date: Thu, 25 Jun 2026 17:14:16 +0800
Message-ID: <20260625091416.230920-1-suryasaimadhu369@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing terminating newlines to sysfs_emit format strings
in audio_manager_module.c as required by sysfs ABI.

Signed-off-by: suryasaimadhu <suryasaimadhu369@gmail.com>
---
 drivers/staging/greybus/audio_manager_module.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
index dc90cc2d2..5737f2a32 100644
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

